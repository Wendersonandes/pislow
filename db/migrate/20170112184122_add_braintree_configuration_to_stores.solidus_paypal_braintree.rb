# This migration comes from solidus_paypal_braintree (originally 20161125172005)
class AddBraintreeConfigurationToStores < ActiveRecord::Migration
  def up
    Spree::Store.all.each(&:create_braintree_configuration)
  end

  def down
    SolidusPaypalBraintree::Configuration.joins(:store).destroy_all
  end
end
