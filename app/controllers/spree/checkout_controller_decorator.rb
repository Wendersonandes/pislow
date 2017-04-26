module Spree
  CheckoutController.class_eval do


    protected
        def before_delivery
          return if params[:order].present?

          packages = @order.shipments.map(&:to_package)
          @differentiator = Spree::Stock::Differentiator.new(@order, packages)
          
            # only 1 paymentmethod? (Banktransfer)
          # select it!
          @order.select_default_payment unless @order.payment_required?

          #we select the shipping for the user
          @order.select_default_shipping
          @order.next
          #default logic for finalizing unless he can't select payment_method
          if @order.completed?
            session[:order_id] = nil
            flash.notice = Spree.t(:order_processed_successfully)
            flash[:commerce_tracking] = "nothing special"

            return redirect_to completion_route
          else
            return redirect_to checkout_state_path(@order.state)
          end
        
        end 



  end
end