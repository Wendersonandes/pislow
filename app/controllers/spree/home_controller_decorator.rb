module Spree
  class HomeController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def index
          if (cookies["gender"]).include?("woman") 
             redirect_to('/woman')
          elsif  (cookies["gender"]).include?("man") 
             redirect_to('/man')
          elsif  (cookies["gender"]).include?("kids")
             redirect_to('/kids')
          end
      @searcher = build_searcher(params.merge(include_images: true))
      @products = @searcher.retrieve_products
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end
  end
end