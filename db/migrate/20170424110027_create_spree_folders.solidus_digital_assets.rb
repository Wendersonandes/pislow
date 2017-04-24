# This migration comes from solidus_digital_assets (originally 20160222135529)
class CreateSpreeFolders < ActiveRecord::Migration
  def change
    create_table :spree_folders do |t|
      t.string :name
      t.integer :parent_id, null: true, index: true
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true

      t.timestamps null: false
    end
  end
end
