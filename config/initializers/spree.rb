# Configure Solidus Preferences
# See http://docs.solidus.io/Spree/AppConfiguration.html for details

Spree.config do |config|
  # Without this preferences are loaded and persisted to the database. This
  # changes them to be stored in memory.
  # This will be the default in a future version.
  # This line resets all preferences! It should be the first line in the block
  config.use_static_preferences!
  
  require 'spree/core/searchkick_filters'
  # Core:

  # Default currency for new sites
  config.currency = "EUR"

  # from address for transactional emails
  config.mails_from = "support@pislow.com"
  
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false

  # When set, product caches are only invalidated when they fall below or rise
  # above the inventory_cache_threshold that is set. Default is to invalidate cache on
  # any inventory changes.
  # config.inventory_cache_threshold = 3


  # Frontend:

  # Custom logo for the frontend
  # config.logo = "logo/solidus_logo.png"

  # Template to use when rendering layout
  # config.layout = "spree/layouts/spree_application"


  # Admin:

  # Custom logo for the admin
  # config.admin_interface_logo = "logo/solidus_logo.png"

  # Gateway credentials can be configured statically here and referenced from
  # the admin. They can also be fully configured from the admin.
  #
  # config.static_model_preferences.add(
  #   Spree::Gateway::StripeGateway,
  #   'stripe_env_credentials',
  #   secret_key: ENV['STRIPE_SECRET_KEY'],
  #   publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  #   server: Rails.env.production? ? 'production' : 'test',
  #   test_mode: !Rails.env.production?
  # )
  
SolidusSubscriptions::Config.default_gateway { StripeGateway }


end
# this probably not needed
Spree::Image.attachment_definitions[:attachment][:styles] = {
            micro: '44x56>',
            mini: ' 117x150>',
            small: '245x313>',
            product: '512x654>',
            large: '1422x1855>',
  }



Spree::Frontend::Config.configure do |config|
  config.use_static_preferences!

  config.locale = 'es'
end

Spree::Backend::Config.configure do |config|
  config.use_static_preferences!

  config.locale = 'es'
end

Spree::Api::Config.configure do |config|
  config.use_static_preferences!

  config.requires_authentication = true
end

Spree.user_class = "Spree::User"
Rails.application.config.spree.promotions.rules

SpreeMarketplace::Config[:stripe_publishable_key] = 'pk_test_O424J5hquxclDqPe8ICKdIIc Roll Key
'
SpreeMarketplace::Config[:stripe_secret_key] = 'sk_test_n9N8y98E0Yi3FcxASouhuj7D'
