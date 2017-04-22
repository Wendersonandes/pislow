class Spree::WomanController < Spree::StoreController

  def create
	 @taxon = Spree::Taxon.find_by(name: "woman") 
  end
  def new
  	@taxon = Spree::Taxon.find_by(name: "woman") 
  end

  private

  def accurate_title
    "Mujer"
  end

end