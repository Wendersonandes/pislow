Rails.application.routes.draw do


mount Spree::Core::Engine => '/'

# Must be last so it's catch-all route can render undefined paths
mount Alchemy::Engine => '/store'

mount SolidusPaypalBraintree::Engine, at: '/solidus_paypal_braintree'

  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"


end

Spree::Core::Engine.routes.draw  do
  get 'woman', :to => 'woman#new', :as => :woman

  get 'men', :to => 'men#new', :as => :men

  get 'kids', :to => 'kids#new', :as => :kids

  get 'myclothes', :to => 'myclothes#new', :as => :myclothes

  post '/add_to_cart/:product_id' => 'products#add_to_cart', :as => 'add_to_cart'
  
  get 'products/latest' => 'products#latest', :as => :latest
  
  namespace :admin do
    resource :rental_settings, only: [:edit, :update]
  end

end


