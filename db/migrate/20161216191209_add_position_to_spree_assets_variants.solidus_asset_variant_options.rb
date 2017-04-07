# This migration comes from solidus_asset_variant_options (originally 20140411185638)
class AddPositionToSpreeAssetsVariants < ActiveRecord::Migration
  def change
    add_column :spree_assets_variants, :position, :integer
  end
end
