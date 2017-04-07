class AddPointsToSpreePlans < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_plans, :points, :integer
  end
end
