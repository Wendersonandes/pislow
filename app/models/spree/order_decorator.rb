module Spree
 class Order < Spree::Base
      delegate :update_totals, :persist_totals, to: :updater
 
	  def select_default_shipping
		 create_proposed_shipments
   		 shipments.find_each &:update_amounts
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