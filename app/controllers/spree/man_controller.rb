class Spree::ManController < Spree::StoreController

  def create
    @taxon = Spree::Taxon.find_by(name: "man") 
  end
  def new
  	@taxon = Spree::Taxon.find_by(name: "man") 
  end

  private

  def accurate_title
    "Hombre"
  end

end