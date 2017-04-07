# This migration comes from solidus_subscriptions (originally 20161017175509)
class RemoveOrderIdFromSolidusSubscriptionsInstallments < ActiveRecord::Migration
  def change
    remove_foreign_key :solidus_subscriptions_installments, column: :order_id
    remove_column :solidus_subscriptions_installments, :order_id, :integer
  end
end
