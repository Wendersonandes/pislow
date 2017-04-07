class AddDescriptionToSpreePlans < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_plans, :description, :string
  end
end
