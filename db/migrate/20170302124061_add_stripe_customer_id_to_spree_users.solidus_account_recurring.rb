# This migration comes from solidus_account_recurring (originally 20140301141327)
class AddStripeCustomerIdToSpreeUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :stripe_customer_id, :string
    remove_column :spree_subscriptions, :card_customer_token
  end
end
