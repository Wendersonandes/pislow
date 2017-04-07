module ApplicationHelper
	include Spree::PagesHelper
 
     def link_to_cart_custom(text = nil)

      css_class = nil

      if simple_current_order.nil? || simple_current_order.item_count.zero?
        text = "<i class='fa fa-shopping-bag'></i> (#{Spree.t(:empty)})"
        css_class = 'empty'
      else
        text = "<i class='fa fa-shopping-bag'></i> (#{simple_current_order.item_count})  <span class='amount'>#{simple_current_order.display_total.to_html}</span>"
        css_class = 'full'
      end

      link_to text.html_safe, spree.cart_path, class: "cart-info #{css_class}"
    end

end
