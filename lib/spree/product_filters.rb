module Spree
  module Core
    
    module ProductFilters
      # Example: filtering by price
      #   The named scope just maps incoming labels onto their conditions, and builds the conjunction
      #   'price' is in the base scope's context (ie, "select foo from products where ...") so
      #     we can access the field right away
      #   The filter identifies which scope to use, then sets the conditions for each price range
      #
      # If user checks off three different price ranges then the argument passed to
      # below scope would be something like ["$10 - $15", "$15 - $18", "$18 - $20"]
      #
      Spree::Product.add_search_scope :price_range_any do |*opts|
        conds = opts.map { |o| Spree::Core::ProductFilters.price_filter[:conds][o] }.reject(&:nil?)
        scope = conds.shift
        conds.each do |new_scope|
          scope = scope.or(new_scope)
        end
        Spree::Product.joins(master: :default_price).where(scope)
      end

      def self.format_price(amount)
        Spree::Money.new(amount)
      end

      def self.price_filter
        v = Spree::Price.arel_table
        conds = [[Spree.t(:under_price, price: format_price(10)), v[:amount].lteq(10)],
                 ["#{format_price(10)} - #{format_price(20)}", v[:amount].in(10..15)],
                 ["#{format_price(20)} - #{format_price(30)}", v[:amount].in(15..18)],
                 ["#{format_price(30)} - #{format_price(40)}", v[:amount].in(18..20)],
                 [Spree.t(:or_over_price, price: format_price(50)), v[:amount].gteq(20)]]
        {
          name:   Spree.t(:price ),
          scope:  :price_range_any,
          conds:  Hash[*conds.flatten],
          labels: conds.map { |k, _v| [k, k] }
        }
      end

      # Example: filtering by possible brands
      #
      # First, we define the scope. Two interesting points here: (a) we run our conditions
      #   in the scope where the info for the 'brand' property has been loaded; and (b)
      #   because we may want to filter by other properties too, we give this part of the
      #   query a unique name (which must be used in the associated conditions too).
      #
      # Secondly, the filter. Instead of a static list of values, we pull out all existing
      #   brands from the db, and then build conditions which test for string equality on
      #   the (uniquely named) field "p_brand.value". There's also a test for brand info
      #   being blank: note that this relies on with_property doing a left outer join
      #   rather than an inner join.
      Spree::Product.add_search_scope :brand_any do |*opts|
        conds = opts.map { |o| ProductFilters.brand_filter[:conds][o] }.reject(&:nil?)
        scope = conds.shift
        conds.each do |new_scope|
          scope = scope.or(new_scope)
        end
        Spree::Product.with_property('brand').where(scope)
      end

      def self.brand_filter
        brand_property = Spree::Property.find_by(name: 'brand')
        brands = brand_property ? Spree::ProductProperty.where(property_id: brand_property.id).pluck(:value).uniq.map(&:to_s) : []
        pp = Spree::ProductProperty.arel_table
        conds = Hash[*brands.map { |b| [b, pp[:value].eq(b)] }.flatten]
        {
          name:   'Brands',
          scope:  :brand_any,
          conds:  conds,
          labels: brands.sort.map { |k| [k, k] }
        }
      end

      # Example: a parameterized filter
      #   The filter above may show brands which aren't applicable to the current taxon,
      #   so this one only shows the brands that are relevant to a particular taxon and
      #   its descendants.
      #
      #   We don't have to give a new scope since the conditions here are a subset of the
      #   more general filter, so decoding will still work - as long as the filters on a
      #   page all have unique names (ie, you can't use the two brand filters together
      #   if they use the same scope). To be safe, the code uses a copy of the scope.
      #
      #   HOWEVER: what happens if we want a more precise scope?  we can't pass
      #   parametrized scope names to Ransack, only atomic names, so couldn't ask
      #   for taxon T's customized filter to be used. BUT: we can arrange for the form
      #   to pass back a hash instead of an array, where the key acts as the (taxon)
      #   parameter and value is its label array, and then get a modified named scope
      #   to get its conditions from a particular filter.
      #
      #   The brand-finding code can be simplified if a few more named scopes were added to
      #   the product properties model.

      #   STYLE
       Spree::Product.add_search_scope :style_any do |*opts|
        conds = opts.map { |o| ProductFilters.style_filter[:conds][o] }.reject(&:nil?)
        scope = conds.shift
        conds.each do |new_scope|
          scope = scope.or(new_scope)
        end
        Spree::Product.with_property('Style').where(scope)
      end
      def self.style_filter
        style_property = Spree::Property.find_by(name: 'Style')
        styles = style_property ? Spree::ProductProperty.where(property_id: style_property.id).pluck(:value).uniq.map(&:to_s) : []
        pp = Spree::ProductProperty.arel_table
        conds = Hash[*styles.map { |b| [b, pp[:value].eq(b)] }.flatten]
        {
          name:   'Estilo',
          scope:  :style_any,
          conds:  conds,
          labels: styles.sort.map { |k| [k, k] }
        }
      end

      Spree::Product.add_search_scope :selective_style_any do |*opts|
        Spree::Product.style_any(*opts)
      end

      def self.selective_style_filter(taxon = nil)
        taxon ||= Spree::Taxonomy.first.root
        style_property = Spree::Property.find_by(name: 'Style')
        scope = Spree::ProductProperty.where(property: style_property).
          joins(product: :taxons).
          where("#{Spree::Taxon.table_name}.id" => [taxon] + taxon.descendants)
        styles = scope.pluck(:value).uniq
        {
          name:   'Estilo',
          scope:  :selective_style_any,
          labels: styles.sort.map { |k| [k, k] }
        }
      end
      #   BRAND
      Spree::Product.add_search_scope :selective_brand_any do |*opts|
        Spree::Product.brand_any(*opts)
      end

      def self.selective_brand_filter(taxon = nil)
        taxon ||= Spree::Taxonomy.first.root
        brand_property = Spree::Property.find_by(name: 'brand')
        scope = Spree::ProductProperty.where(property: brand_property).
          joins(product: :taxons).
          where("#{Spree::Taxon.table_name}.id" => [taxon] + taxon.descendants)
        brands = scope.pluck(:value).uniq
        {
          name:   'Applicable Brands',
          scope:  :selective_brand_any,
          labels: brands.sort.map { |k| [k, k] }
        }
      end


      # Provide filtering on the immediate children of a taxon
      #
      # This doesn't fit the pattern of the examples above, so there's a few changes.
      # Firstly, it uses an existing scope which was not built for filtering - and so
      # has no need of a conditions mapping, and secondly, it has a mapping of name
      # to the argument type expected by the other scope.
      #
      # This technique is useful for filtering on objects (by passing ids) or with a
      # scope that can be used directly (eg. testing only ever on a single property).
      #
      # This scope selects products in any of the active taxons or their children.
      #
      def self.taxons_below(taxon)
        return Spree::Core::ProductFilters.all_taxons if taxon.nil?
        {
          name:   taxon.name,
          scope:  :taxons_id_in_tree_any,
          labels: taxon.children.sort_by(&:position).map { |t| [t.name, t.id] },
          conds:  nil
        }
      end

      # Filtering by the list of all taxons
      #
      # Similar idea as above, but we don't want the descendants' products, hence
      # it uses one of the auto-generated scopes from Ransack.
      #
      # idea: expand the format to allow nesting of labels?
      def self.all_taxons
        taxons = Spree::Taxonomy.all.map { |t| [t.root] + t.root.descendants }.flatten
        {
          name:   'Categorías',
          scope:  :taxons_id_equals_any,
          labels: taxons.sort_by(&:name).map { |t| [t.name, t.id] },
          conds:  nil # not needed
        }
      end

      # Filtering by option values
      #

        def ProductFilters.option_with_values(option_scope, option, values)
          # get values IDs for Option with name {@option} and value-names in {@values} for use in SQL below
          option_values = Spree::OptionValue.where(:presentation => [values].flatten).joins(:option_type).where(OptionType.table_name => {:name => option}).pluck("#{OptionValue.table_name}.id")
          return option_scope if option_values.empty?

          option_scope = option_scope.where("#{Product.table_name}.id in (select product_id from #{Variant.table_name} v left join spree_option_values_variants ov on ov.variant_id = v.id where ov.option_value_id in (?))", option_values)
          option_scope
        end


        # COLOR
        # option scope
        Spree::Product.add_search_scope :color_any do |*opts|
          option_scope = Spree::Product.includes(:variants_including_master)
          option_type = ProductFilters.color_filter[:option]

          opts.map { |opt|
            # opt is an array => ['option-name', [value1, value2, value3, ...]]
            option_scope = ProductFilters.option_with_values(option_scope, option_type, *opt)
           }
           option_scope
        end

        # colour option - object that describes the filter.
        def ProductFilters.color_filter
          # Get an array of possible colours (option type of 'colour')
          # e.g. returns ["Gold", "Black", "White", "Silver", "Purple", "Multicoloured"]
          colors = Spree::OptionValue.where(:option_type_id => Spree::OptionType.find_by_name("Clothes-color")).order("position").map(&:presentation).compact.uniq
          {
              :name => "Color",
              :scope => :color_any,
              :conds => nil,
              :option => 'Clothes-color', # this is MANDATORY
              :class => "options two-column",
              :labels => colors.map { |k| [k, k] }
          }
        end
# -------------------------------------------------------------------------------------
        # SIZE
        # option scope
 # -------------------------------------------------------------------------------------
        Spree::Product.add_search_scope :clothes_size_any do |*opts|
          option_scope = Spree::Product.includes(:variants_including_master)
          option_type = ProductFilters.clothes_size_filter[:option]

          opts.map { |opt|
            # opt is an array => ['option-name', [value1, value2, value3, ...]]
            option_scope= ProductFilters.option_with_values(option_scope, option_type, *opt)
           }
           option_scope
        end

        def ProductFilters.clothes_size_filter
          # Get an array of possible colours (option type of 'colour')
          # e.g. returns ["Gold", "Black", "White", "Silver", "Purple", "Multicoloured"]
          clothes_sizes = Spree::OptionValue.where(:option_type_id => Spree::OptionType.find_by_name("Clothes-size")).order("position").map(&:presentation).compact.uniq
          {
              :name => "Talla",
              :scope => :clothes_size_any,
              :conds =>  nil,
              :option => 'Clothes-size', # this is MANDATORY
              :class => "options two-column",
              :labels => clothes_sizes.map { |k| [k, k] }
          }
        end
# -------------------------------------------------------------------------------------
        # SECOND HAND FILTER
        # option scope
 # -------------------------------------------------------------------------------------
        Spree::Product.add_search_scope :condition_any do |*opts|
          option_scope = Spree::Product.includes(:variants_including_master)
          option_type = ProductFilters.condition_filter[:option]

          opts.map { |opt|
            # opt is an array => ['option-name', [value1, value2, value3, ...]]
            option_scope= ProductFilters.option_with_values(option_scope, option_type, *opt)
           }
           option_scope
        end

        def ProductFilters.condition_filter
          # Get an array of possible colours (option type of 'colour')
          # e.g. returns ["Gold", "Black", "White", "Silver", "Purple", "Multicoloured"]
          conditions = Spree::OptionValue.where(:option_type_id => Spree::OptionType.find_by_name("Condition")).order("position").map(&:presentation).compact.uniq
          {
              :name => "Estado",
              :scope => :condition_any,
              :conds =>  nil,
              :option => 'Condition', # this is MANDATORY
              :class => "options two-column",
              :labels => conditions.map { |k| [k, k] }
          }
        end
# -------------------------------------------------------------------------------------
        # PRICE SLIDER FILTER
        # option scope
 # -------------------------------------------------------------------------------------
      

        def self.price_slider_filter(product_ids)
          prices = Spree::Price.includes(variant: :product)
                               .where(spree_variants: {product_id: product_ids})
                               .where(currency: Spree::Config[:currency])

          minimum = (prices.minimum(:amount) || 0).floor.to_i
          maximum = (prices.maximum(:amount) || 0).ceil.to_i

          {
            name:    "Precio",
            scope:   :price_slider,
            maximum: maximum,
            minimum: minimum,
            step:    1
          }
        end


    end
  end
end