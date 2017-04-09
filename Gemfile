source 'https://rubygems.org'

ruby ENV['CUSTOM_RUBY_VERSION'] || '2.3.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'rails_12factor'
# Use jquery as the JavaScript library
gem 'jquery-rails' , github: 'rails/jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


# Solidus and Solidus Au2.1.0thentication
gem 'solidus', github: 'solidusio/solidus'
gem 'solidus_auth_devise'

group :development, :test do
  gem 'rspec-rails', '~> 3.5'
end

gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'bonsai-elasticsearch-rails'


gem 'coffee-script-source', '~> 1.12', '>= 1.12.2'

gem 'paperclip'
gem 'aws-sdk', '~> 2.6', '>= 2.6.48'


gem 'solidus_paypal_braintree', github: 'solidusio/solidus_paypal_braintree'
gem "solidus_signifyd"
gem 'solidus_i18n', github: 'solidusio-contrib/solidus_i18n', branch: 'master'


gem 'solidus_social' , github: 'solidusio-contrib/solidus_social'
gem 'solidus_related_products'
gem 'solidus_editor', github: 'solidusio-contrib/solidus_editor', branch: 'master'


gem 'solidus_print_invoice' , github: 'solidusio-contrib/solidus_print_invoice'
gem "solidus_comments"
gem 'solidus_product_feed'
gem 'solidus_papertrail'
gem 'solidus_log_viewer', github: 'solidusio-contrib/solidus_log_viewer'
gem 'solidus_sitemap', github: 'solidusio-contrib/solidus_sitemap', branch: 'master'
gem 'solidus_static_content', github: 'solidusio-contrib/solidus_static_content'

gem "bootstrap-sass"

gem 'solidus_reviews', github: 'solidusio-contrib/solidus_reviews'
gem "solidus_legacy_return_authorizations"
gem 'solidus_prototypes', github: 'solidusio-contrib/solidus_prototypes', branch: 'master'
# rails g solidus
gem 'solidus_geocoding'
# gem 'solidus_reffiliate', git: 'https://github.com/Glowforge/solidus_reffiliate.git'
# gem 'solidus_easypost'
# gem 'solidus_shipwire', github: 'nebulab/solidus_shipwire'
# gem "solidus_product_zoom", git: "git://github.com/taniarv/solidus_product_zoom.git"

gem 'spree_marketplace', github: 'sechix/spree_marketplace'
gem 'spree_drop_ship', github: 'sechix/spree_drop_ship'

# gem 'solidus_reserved_stock'
# gem 'solidus_reffiliate', git: 'https://github.com/Glowforge/solidus_reffiliate.git'
gem 'solidus_user_prices', github: 'resolve/solidus_user_prices'
gem 'solidus_user_roles', github: 'boomerdigital/solidus_user_roles'
gem 'solidus_contact_us', :git => 'https://github.com/2beDigital/solidus_contact_us'

gem 'dotenv-rails', :require => 'dotenv/rails-now'
gem "recaptcha", require: "recaptcha/rails"

gem 'solidus_wishlist', github: 'deseretbook/solidus_wishlist'

# gem 'solidus_crm' , github: 'madetech/solidus_crm'
gem 'solidus_recommendations', github: 'skukx/solidus_recommendations'
gem 'solidus_editor', github: 'solidusio-contrib/solidus_editor', branch: 'master'
gem 'solidus_import_products', github: '2BeDigital/solidus_import_products'
gem 'delayed_job_active_record'
gem 'delayed_job'

gem 'solidus_gateway' , github: 'solidusio/solidus_gateway'

gem 'solidus_product_feed'

gem 'spree_barcodes', github: 'recmode/spree_barcodes', branch: 'master'
gem 'alchemy_cms', github: 'AlchemyCMS/alchemy_cms', branch: 'rails-5'
gem 'alchemy-solidus', github: 'sechix/alchemy-solidus', branch: 'master'

# gem 'solidus_social_products', :path => '../solidus_social_products'
gem 'solidus_cmd'
gem 'solidus_minicart', :git => 'https://github.com/2beDigital/solidus_minicart', branch: 'master'
gem 'solidus_subscriptions', github: 'solidusio-contrib/solidus_subscriptions', branch: 'master'
gem 'whenever', :require => false

gem 'blockuijs-rails',  :git => 'https://github.com/BoTreeConsultingTeam/blockuijs-rails.git'
gem 'blot'

gem 'solidus_product_recommendations', github: 'sechix/solidus_product_recommendations', branch: 'master'
gem 'solidus_account_recurring', github: 'sechix/solidus_account_recurring' , branch: 'master'

gem 'stripe'
gem 'solidus_trackers', github: 'solidusio-contrib/solidus_trackers', branch: 'master'
gem 'spree_scan_and_go', github: 'reinaris/spree_scan_and_go'
gem 'solidus_active_shipping', :git => "git://github.com/solidusio-contrib/solidus_active_shipping"
gem 'solidus_product_labeling', github: 'sechix/solidus_product_labeling' , branch: 'master'
gem 'solidus_smart_free_shipping', github: 'sechix/solidus_smart_free_shipping', branch: 'master'
gem 'spree-point-of-sale', github: 'sechix/spree-point-of-sale' , branch: 'master'
gem 'solidus_waiting_list', github: 'sechix/solidus_waiting_list'
gem 'spree_report_products_ran_out_of_stock', github: 'sechix/spree_report_products_ran_out_of_stock'

gem 'solidus_special_offer', github: 'samanmohamadi/solidus_special_offer' , branch: 'master'
gem 'sidekiq'

# gem 'spree_abandoned_cart_email', :path => '../spree_abandoned_cart_email'
gem 'spree_recently_sold_products', github: 'sechix/spree_recently_sold_products'

# gem 'solidus_asset_variant_options', github: 'solidusio/solidus_asset_variant_options' , branch: 'master'
# gem 'solidus_elastic_product', github: 'boomerdigital/solidus_elastic_product' , branch: 'master'
# gem 'searchkick'
# gem 'solidus_searchkick', github: 'sechix/solidus_searchkick'

