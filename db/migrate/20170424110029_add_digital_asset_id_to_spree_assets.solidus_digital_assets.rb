# This migration comes from solidus_digital_assets (originally 20160308092647)
class AddDigitalAssetIdToSpreeAssets < ActiveRecord::Migration
  def change
    add_column :spree_assets, :digital_asset_id, :integer
    add_index :spree_assets, :digital_asset_id
  end
end
