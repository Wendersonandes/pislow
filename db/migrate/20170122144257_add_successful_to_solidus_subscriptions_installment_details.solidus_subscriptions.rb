# This migration comes from solidus_subscriptions (originally 20160902220604)
class AddSuccessfulToSolidusSubscriptionsInstallmentDetails < ActiveRecord::Migration
  def change
    add_column :solidus_subscriptions_installment_details, :success, :boolean
  end
end
