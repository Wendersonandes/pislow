# This migration comes from solidus_user_roles (originally 20160406142441)
class CreateSpreePermissionSets < ActiveRecord::Migration
  def change
    create_table :spree_permission_sets do |t|
      t.string :name
      t.string :set
      t.timestamps null: false
    end
  end
end
