class Spree::KidsController < Spree::StoreController

  def create
     @taxon = Spree::Taxon.find_by(name: "kids") 
  end
  def new
  	@taxon = Spree::Taxon.find_by(name: "kids") 
  end

  private

  def accurate_title
    "Niños"
  end

end