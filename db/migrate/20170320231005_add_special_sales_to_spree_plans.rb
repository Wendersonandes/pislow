class AddSpecialSalesToSpreePlans < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_plans, :special_sales, :boolean
  end
end
