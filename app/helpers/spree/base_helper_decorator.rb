module Spree
  module BaseHelper

	    def taxons_tree_checkbox(root_taxon, current_taxon, max_level = 1)
	      return '' if max_level < 1 || root_taxon.children.empty?
	      content_tag :ul do
	        taxons = root_taxon.children.map do |taxon|
	          
	         content_tag :li do
	          css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'current' : nil           
	          content_tag :input, type: "checkbox" , id: taxon.name , :class => css_class do

	             label_tag taxon.name , for:taxon.name  do
	             	link_to(taxon.name, seo_url(taxon)) +
	               		taxons_tree(taxon, current_taxon, max_level - 1) 
	              end
	           end
	         end 
	        end
	        safe_join(taxons, "\n")
	      end
	    end

	 def in_registration_step?
      return true if controller_name == 'checkout'      and action_name == 'registration'
      return true if controller_name == 'checkout'      and action_name == 'update_registration'
      return true if controller_name == 'user_sessions' and action_name == 'create'

      return false
    end


   end
 end