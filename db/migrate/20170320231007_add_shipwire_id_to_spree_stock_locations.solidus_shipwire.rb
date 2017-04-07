# This migration comes from solidus_shipwire (originally 3)
class AddShipwireIdToSpreeStockLocations < ActiveRecord::Migration
  def change
    add_column :spree_stock_locations, :shipwire_id, :string
  end
end
