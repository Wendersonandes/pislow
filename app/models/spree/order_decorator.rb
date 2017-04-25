module Spree
 class Order < Spree::Base
    
 
	  def select_default_shipping
		  #clone_billing_address #uncomment if user just types in one address
		  create_proposed_shipments #creates the shippings
		  shipments.first.update_amounts #uses the first shippings
		  update_totals #updates the order
	  end

	  def confirmation_required?
	    return false
	  end

	  checkout_flow do
      go_to_state :address
      go_to_state :delivery
      go_to_state :payment, if: ->(order) { order.payment_required? }
      go_to_state :complete
    end

 end
end