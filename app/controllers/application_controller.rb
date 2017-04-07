class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :devise_controller?
 
  @taxonomies = Spree::Taxonomy.all

  @taxonomies_woman  = Spree::Taxonomy.where(name: "Mujer")
  @taxonomies_man  = Spree::Taxonomy.where(name: "Hombre")
  @taxonomies_kids  = Spree::Taxonomy.where(name: "Niños")

end


