Spree::Taxon.class_eval do

	def applicable_filters
	  filters = []
	  
	  filters << Spree::Core::SearchkickFilters.price_filter if Spree::Core::SearchkickFilters.respond_to?(:price_filter)
	  # filters << Spree::Core::SearchkickFilters.taxons_below(self)
	  # filters << Spree::Core::SearchkickFilters.condition_filter if Spree::Core::SearchkickFilters.respond_to?(:condition_filter)

	  # ## unless it's a root taxon? left open for demo purposes
      
	  # # fs << Spree::Core::SearchkickFilters.price_filter if Spree::Core::SearchkickFilters.respond_to?(:price_filter)
	  # filters << Spree::Core::SearchkickFilters.size_clothes_filter if Spree::Core::SearchkickFilters.respond_to?(:size_clothes_filter)
	  # filters << Spree::Core::SearchkickFilters.color_filter if Spree::Core::SearchkickFilters.respond_to?(:color_filter)

	  # filters << Spree::Core::SearchkickFilters.taxons_below(Spree::Taxon.find_by(name: 'Diseñadores'))
   #    filters << Spree::Core::SearchkickFilters.selective_style_filter if Spree::Core::SearchkickFilters.respond_to?(:selective_style_filter)
	  
   #    filters << Spree::Core::SearchkickFilters.selective_brand_filter(self) if Spree::Core::SearchkickFilters.respond_to?(:selective_brand_filter)
	  
	  filters
	end


end