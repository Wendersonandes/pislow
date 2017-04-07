# This migration comes from solidus_shipwire (originally 2)
class AddShipwireIdToOrder < ActiveRecord::Migration
  def change
    add_column :spree_orders, :shipwire_id, :integer, default: nil, null: true
  end
end
