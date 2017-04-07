# config/initializers/alchemy.rb
Alchemy.user_class_name = 'Spree::User'
Alchemy.current_user_method = :spree_current_user

Alchemy.login_path = '/store/login'
Alchemy.logout_path = '/store/logout'	

require 'alchemy/solidus/use_solidus_layout'
require 'alchemy/solidus/alchemy_in_solidus'

Alchemy::BaseHelper.send :include, Spree::StoreHelper
Alchemy::BaseHelper.send :include, Spree::OrdersHelper
Alchemy::BaseHelper.send :include, Spree::ProductsHelper
Alchemy::BaseHelper.send :include, Spree::TaxonsHelper
Alchemy::BaseController.send :include, Spree::Core::ControllerHelpers::Common
Alchemy::BaseController.send :include, Spree::Core::ControllerHelpers::Store
Alchemy::BaseController.send :include, Spree::Core::ControllerHelpers::Order
Alchemy::BaseController.send :include, Spree::Core::ControllerHelpers::Auth
Alchemy::PagesController.send :include, Spree::Core::Engine.routes.url_helpers