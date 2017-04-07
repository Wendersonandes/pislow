# This migration comes from solidus_account_recurring (originally 20140303072857)
class AddDefaultToSpreePlans < ActiveRecord::Migration
  def change
    add_column :spree_plans, :default, :boolean, default: false
    add_index :spree_plans, :default
  end
end
