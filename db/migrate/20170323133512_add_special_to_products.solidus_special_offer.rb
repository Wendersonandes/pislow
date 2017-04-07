# This migration comes from solidus_special_offer (originally 20160214080858)
class AddSpecialToProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :special, :boolean, :default => false
  end
end
