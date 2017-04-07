class AddFreeCleaningToSpreePlans < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_plans, :free_cleaning, :boolean
  end
end
