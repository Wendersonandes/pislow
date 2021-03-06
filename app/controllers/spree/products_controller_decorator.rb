# Custom methods for products related stuff
Spree::ProductsController.prepend(Module.new do


	  def index

	  	super
	    @products = @products.price_between(params[:minprice], params[:maxprice]) if params.key?(:minprice) && params.key?(:maxprice)
	    @products = @products.in_name_or_description(params[:query]) if params.key?(:query)
      end
      def latest
	    @products = Spree::Product.available.order('available_on DESC').limit(25);
	    render "index"
	  end

	  def recommendations_product
	    @products = Spree::Product.available.order('available_on DESC').limit(25);
	    render "index"
	  end



end)

module Spree
  ProductsController.class_eval do
   helper_method :show_preview

      def show_preview
	      @variants = @product.
	        variants_including_master.
	        display_includes.
	        with_prices(current_pricing_options).
	        includes([:option_values, :images])

      end
  end
end

