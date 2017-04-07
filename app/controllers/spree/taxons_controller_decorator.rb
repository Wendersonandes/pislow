# Custom methods for products related stuff
Spree::TaxonsController.prepend(Module.new do

	  def show
	  	super
	  	@products = @products.descend_by_updated_at if params.key?(:latest);
	  	@products = @products.ascend_by_updated_at if params.key?(:oldest);
	  	@products = @products.with_property_value("Style","Trendy") if params.key?(:Trendy);
	    @products = @products.with_property_value("Style","Premium") if params.key?(:Premium);
	    @products = @products.price_between(params[:minprice], params[:maxprice]) if params.key?(:minprice) && params.key?(:maxprice)
	    @products = @products.in_name_or_description(params[:query]) if params.key?(:query)

	   @products = @products.descend_by_updated_at if params.key?(:sort_latest);
	  
	   @products = @products.select('spree_products.*, spree_prices.amount').reorder('').send(:ascend_by_master_price) if params.key?(:sort_price_low);
	   @products = @products.select('spree_products.*, spree_prices.amount').reorder('').send(:descend_by_master_price) if params.key?(:sort_price_high);
	  
	   

      end
end)