module Spree
  module BaseHelper
  	    def link_to_cart_custom(text = nil)
	      
	      css_class = nil

	      if simple_current_order.nil? || simple_current_order.item_count.zero?
	        text = "<i class='fa fa-shopping-bag'></i>  (#{Spree.t(:empty)})"
	        css_class = 'empty'
	      else
	        text = "<i class='fa fa-shopping-bag'></i> (#{simple_current_order.item_count})  <span class='amount'>#{simple_current_order.display_total.to_html}</span>"
	        css_class = 'full'
	      end

	      link_to text.html_safe, spree.cart_path, class: "cart-info #{css_class}"
	   end



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