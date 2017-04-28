module Spree
  module Core
    # THIS FILE SHOULD BE OVER-RIDDEN IN YOUR SITE EXTENSION!
    #   the exact code probably won't be useful, though you're welcome to modify and reuse
    #   the current contents are mainly for testing and documentation

    # To override this file...
    #   1) Make a copy of it in your sites local /lib/spree folder/core
    #   2) Add it to the config load path, or require it in an initializer, e.g...
    #
    #      # config/initializers/spree.rb
    #      require 'spree/core/searchkick_filters'
    #

    module SearchkickFilters
      def self.all_filters
        filters = []
        # Find all methods that ends with '_filter'
        filter_methods = Spree::Core::SearchkickFilters.methods.find_all { |m| m.to_s.end_with?('_filter') }
        filter_methods.each do |filter_method|
          filters << Spree::Core::SearchkickFilters.send(filter_method) if Spree::Core::SearchkickFilters.respond_to?(filter_method)
        end
        filters
      end

      def self.price_filter
        conds = [
          [Spree.t(:under_price, price: format_price(1)),   { range: { price: { lt: 1 } } }],
          ["#{format_price(1)} - #{format_price(5)}",       { range: { price: { from: 1, to: 5 } } }],
          ["#{format_price(5)} - #{format_price(10)}",      { range: { price: { from: 5, to: 10 } } }],
          ["#{format_price(10)} - #{format_price(15)}",     { range: { price: { from: 10, to: 15 } } }],
          ["#{format_price(15)} - #{format_price(25)}",     { range: { price: { from: 15, to: 25 } } }],
          ["#{format_price(25)} - #{format_price(50)}",     { range: { price: { from: 25, to: 50 } } }],
          ["#{format_price(50)} - #{format_price(100)}",    { range: { price: { from: 50, to: 100 } } }],
          [Spree.t(:over_price, price: format_price(100)),  { range: { price: { gt: 100 } } }]
        ]
        {
          name:   'Price',
          scope:  :price,
          conds:  Hash[*conds.flatten],
          labels: conds.map { |k, _v| [k, k] }
        }
      end

      def self.format_price(amount)
        Spree::Money.new(amount)
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
        conds = []
        return Spree::Core::SearchkickFilters.all_taxons if taxon.nil?

        taxon.children.each do |taxons|
          # conditions as: [label, elasticsearch_query]
          conds << [taxons, { match: { taxon_names: taxons } }]
        end

        {
          name:   taxon.name,
          scope:  :taxons_id_in_tree_any,
          labels: taxon.children.sort_by(&:position).map { |t| [t.name, t.id] },
          conds:  Hash[*conds.flatten]
        }
      end

      # Filtering by the list of all taxons
      #
      # Similar idea as above, but we don't want the descendants' products, hence
      # it uses one of the auto-generated scopes from Ransack.
      #
      # idea: expand the format to allow nesting of labels?
      def self.all_taxons
        conds = []
        taxons = Spree::Taxonomy.all.map { |t| [t.root] + t.root.descendants }.flatten

        taxons.each do |taxons|
          # conditions as: [label, elasticsearch_query]
          conds << [taxons, { match: { taxon_names: taxons } }]
        end

        {
          name:   'Categorías',
          scope:  :taxons_id_equals_any,
          labels: taxons.sort_by(&:name).map { |t| [t.name, t.id] },
          conds:  Hash[*conds.flatten]
        }
      end


#       # Example: filtering by possible brands
#       #
#       # First, we define the scope. Two interesting points here: (a) we run our conditions
#       #   in the scope where the info for the 'brand' property has been loaded; and (b)
#       #   because we may want to filter by other properties too, we give this part of the
#       #   query a unique name (which must be used in the associated conditions too).
#       #
#       # Secondly, the filter. Instead of a static list of values, we pull out all existing
#       #   brands from the db, and then build conditions which test for string equality on
#       #   the (uniquely named) field "p_brand.value". There's also a test for brand info
#       #   being blank: note that this relies on with_property doing a left outer join
#       #   rather than an inner join.
#       # Spree::Product.add_search_scope :brand_any do |*opts|
#       #   conds = opts.map { |o| ProductFilters.brand_filter[:conds][o] }.reject(&:nil?)
#       #   scope = conds.shift
#       #   conds.each do |new_scope|
#       #     scope = scope.or(new_scope)
#       #   end
#       #   Spree::Product.with_property('brand').where(scope)
#       # end

#       def self.brand_filter
#         brand_property = Spree::Property.find_by(name: 'brand')
#         brands = brand_property ? Spree::ProductProperty.where(property_id: brand_property.id).pluck(:value).uniq.map(&:to_s) : []
#         pp = Spree::ProductProperty.arel_table
#         conds = Hash[*brands.map { |b| [b, pp[:value].eq(b)] }.flatten]
#         {
#           name:   'Brands',
#           scope:  :brand_any,
#           conds:  conds,
#           labels: brands.sort.map { |k| [k, k] }
#         }
#       end

#       # Example: a parameterized filter
#       #   The filter above may show brands which aren't applicable to the current taxon,
#       #   so this one only shows the brands that are relevant to a particular taxon and
#       #   its descendants.
#       #
#       #   We don't have to give a new scope since the conditions here are a subset of the
#       #   more general filter, so decoding will still work - as long as the filters on a
#       #   page all have unique names (ie, you can't use the two brand filters together
#       #   if they use the same scope). To be safe, the code uses a copy of the scope.
#       #
#       #   HOWEVER: what happens if we want a more precise scope?  we can't pass
#       #   parametrized scope names to Ransack, only atomic names, so couldn't ask
#       #   for taxon T's customized filter to be used. BUT: we can arrange for the form
#       #   to pass back a hash instead of an array, where the key acts as the (taxon)
#       #   parameter and value is its label array, and then get a modified named scope
#       #   to get its conditions from a particular filter.
#       #
#       #   The brand-finding code can be simplified if a few more named scopes were added to
#       #   the product properties model.

#       #   STYLE
#       #  Spree::Product.add_search_scope :style_any do |*opts|
#       #   conds = opts.map { |o| ProductFilters.style_filter[:conds][o] }.reject(&:nil?)
#       #   scope = conds.shift
#       #   conds.each do |new_scope|
#       #     scope = scope.or(new_scope)
#       #   end
#       #   Spree::Product.with_property('Style').where(scope)
#       # end
#       def self.style_filter
#         style_property = Spree::Property.find_by(name: 'Style')
#         styles = style_property ? Spree::ProductProperty.where(property_id: style_property.id).pluck(:value).uniq.map(&:to_s) : []
#         pp = Spree::ProductProperty.arel_table
#         conds = Hash[*styles.map { |b| [b, pp[:value].eq(b)] }.flatten]
#         {
#           name:   'Estilo',
#           scope:  :style_any,
#           conds:  conds,
#           labels: styles.sort.map { |k| [k, k] }
#         }
#       end

#       Spree::Product.add_search_scope :selective_style_any do |*opts|
#         Spree::Product.style_any(*opts)
#       end

#       def self.selective_style_filter(taxon = nil)
#         taxon ||= Spree::Taxonomy.first.root
#         style_property = Spree::Property.find_by(name: 'Style')
#         scope = Spree::ProductProperty.where(property: style_property).
#           joins(product: :taxons).
#           where("#{Spree::Taxon.table_name}.id" => [taxon] + taxon.descendants)
#         styles = scope.pluck(:value).uniq
#         {
#           name:   'Estilo',
#           scope:  :selective_style_any,
#           labels: styles.sort.map { |k| [k, k] }
#         }
#       end
#       #   BRAND
#       Spree::Product.add_search_scope :selective_brand_any do |*opts|
#         Spree::Product.brand_any(*opts)
#       end

#       def self.selective_brand_filter(taxon = nil)
#         taxon ||= Spree::Taxonomy.first.root
#         brand_property = Spree::Property.find_by(name: 'brand')
#         scope = Spree::ProductProperty.where(property: brand_property).
#           joins(product: :taxons).
#           where("#{Spree::Taxon.table_name}.id" => [taxon] + taxon.descendants)
#         brands = scope.pluck(:value).uniq
#         {
#           name:   'Applicable Brands',
#           scope:  :selective_brand_any,
#           labels: brands.sort.map { |k| [k, k] }
#         }
#       end




#       # Filtering by option values
#       #

#         def ProductFilters.option_with_values(option_scope, option, values)
#           # get values IDs for Option with name {@option} and value-names in {@values} for use in SQL below
#           option_values = Spree::OptionValue.where(:presentation => [values].flatten).joins(:option_type).where(OptionType.table_name => {:name => option}).pluck("#{OptionValue.table_name}.id")
#           return option_scope if option_values.empty?

#           option_scope = option_scope.where("#{Product.table_name}.id in (select product_id from #{Variant.table_name} v left join spree_option_values_variants ov on ov.variant_id = v.id where ov.option_value_id in (?))", option_values)
#           option_scope
#         end


#         # COLOR
#         # option scope
#         Spree::Product.add_search_scope :color_any do |*opts|
#           option_scope = Spree::Product.includes(:variants_including_master)
#           option_type = ProductFilters.color_filter[:option]

#           opts.map { |opt|
#             # opt is an array => ['option-name', [value1, value2, value3, ...]]
#             option_scope = ProductFilters.option_with_values(option_scope, option_type, *opt)
#            }
#            option_scope
#         end

#         # colour option - object that describes the filter.
#         def ProductFilters.color_filter
#           # Get an array of possible colours (option type of 'colour')
#           # e.g. returns ["Gold", "Black", "White", "Silver", "Purple", "Multicoloured"]
#           colors = Spree::OptionValue.where(:option_type_id => Spree::OptionType.find_by_name("Clothes-color")).order("position").map(&:presentation).compact.uniq
#           {
#               :name => "Color",
#               :scope => :color_any,
#               :conds => nil,
#               :option => 'Clothes-color', # this is MANDATORY
#               :class => "options two-column",
#               :labels => colors.map { |k| [k, k] }
#           }
#         end
# # -------------------------------------------------------------------------------------
#         # SIZE
#         # option scope
#  # -------------------------------------------------------------------------------------
#         # Spree::Product.add_search_scope :clothes_size_any do |*opts|
#         #   option_scope = Spree::Product.includes(:variants_including_master)
#         #   option_type = ProductFilters.clothes_size_filter[:option]

#         #   opts.map { |opt|
#         #     # opt is an array => ['option-name', [value1, value2, value3, ...]]
#         #     option_scope= ProductFilters.option_with_values(option_scope, option_type, *opt)
#         #    }
#         #    option_scope
#         # end

#         # def ProductFilters.clothes_size_filter
#         #   # Get an array of possible colours (option type of 'colour')
#         #   # e.g. returns ["Gold", "Black", "White", "Silver", "Purple", "Multicoloured"]
#         #   clothes_sizes = Spree::OptionValue.where(:option_type_id => Spree::OptionType.find_by_name("Clothes-size")).order("position").map(&:presentation).compact.uniq
#         #   {
#         #       :name => "Talla",
#         #       :scope => :clothes_size_any,
#         #       :conds =>  nil,
#         #       :option => 'Clothes-size', # this is MANDATORY
#         #       :class => "options two-column",
#         #       :labels => clothes_sizes.map { |k| [k, k] }
#         #   }
#         # end

#         def self.size_clothes_filter
#           conds = []

#           size_clothes = Spree::OptionValue.where(:option_type_id => Spree::OptionType.find_by_name("size_clothes")).order("position").map(&:presentation).compact.uniq

#           size_clothes.each do |size_clothes|
#             # conditions as: [label, elasticsearch_query]
#             conds << [size_clothes, { match: { size_clothes: size_clothes } }]
#           end

#           {
#             name: 'Talla',
#             scope: :size_clothes,
#             conds:  Hash[*conds.flatten],
#             labels: conds.map { |k, _v| [k, k] }
#           }
#         end
# # -------------------------------------------------------------------------------------
#         # SECOND HAND FILTER
#         # option scope
#  # -------------------------------------------------------------------------------------
#         Spree::Product.add_search_scope :condition_any do |*opts|
#           option_scope = Spree::Product.includes(:variants_including_master)
#           option_type = ProductFilters.condition_filter[:option]

#           opts.map { |opt|
#             # opt is an array => ['option-name', [value1, value2, value3, ...]]
#             option_scope= ProductFilters.option_with_values(option_scope, option_type, *opt)
#            }
#            option_scope
#         end

#         def ProductFilters.condition_filter
#           # Get an array of possible colours (option type of 'colour')
#           # e.g. returns ["Gold", "Black", "White", "Silver", "Purple", "Multicoloured"]
#           conditions = Spree::OptionValue.where(:option_type_id => Spree::OptionType.find_by_name("Condition")).order("position").map(&:presentation).compact.uniq
#           {
#               :name => "Estado",
#               :scope => :condition_any,
#               :conds =>  nil,
#               :option => 'Condition', # this is MANDATORY
#               :class => "options two-column",
#               :labels => conditions.map { |k| [k, k] }
#           }
#         end
# # -------------------------------------------------------------------------------------
#         # PRICE SLIDER FILTER
#         # option scope
#  # -------------------------------------------------------------------------------------
      

#         def self.price_slider_filter(product_ids)
#           prices = Spree::Price.includes(variant: :product)
#                                .where(spree_variants: {product_id: product_ids})
#                                .where(currency: Spree::Config[:currency])

#           minimum = (prices.minimum(:amount) || 0).floor.to_i
#           maximum = (prices.maximum(:amount) || 0).ceil.to_i

#           {
#             name:    "Precio",
#             scope:   :price_slider,
#             maximum: maximum,
#             minimum: minimum,
#             step:    1
#           }
#         end







    end
  end
end