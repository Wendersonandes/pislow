Spree::Taxon.class_eval do

	def applicable_filters
	  fs = []
	  fs << Spree::Core::ProductFilters.taxons_below(self)
	  fs << Spree::Core::ProductFilters.condition_filter if Spree::Core::ProductFilters.respond_to?(:condition_filter)

	  ## unless it's a root taxon? left open for demo purposes
      
	  # fs << Spree::Core::ProductFilters.price_filter if Spree::Core::ProductFilters.respond_to?(:price_filter)
	  fs << Spree::Core::ProductFilters.clothes_size_filter if Spree::Core::ProductFilters.respond_to?(:clothes_size_filter)
	  fs << Spree::Core::ProductFilters.color_filter if Spree::Core::ProductFilters.respond_to?(:color_filter)

	  fs << Spree::Core::ProductFilters.taxons_below(Spree::Taxon.find_by(name: 'Diseñadores'))
      fs << Spree::Core::ProductFilters.selective_style_filter if Spree::Core::ProductFilters.respond_to?(:selective_style_filter)
	  
      fs << Spree::Core::ProductFilters.selective_brand_filter(self) if Spree::Core::ProductFilters.respond_to?(:selective_brand_filter)
	  
	  fs
	end


end