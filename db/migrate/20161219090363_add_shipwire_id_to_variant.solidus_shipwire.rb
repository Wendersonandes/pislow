# This migration comes from solidus_shipwire (originally 1)
class AddShipwireIdToVariant < ActiveRecord::Migration
  def change
    add_column :spree_variants, :shipwire_id, :integer, default: nil, null: true
  end
end
