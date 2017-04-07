# This migration comes from solidus_product_labeling (originally 20161129112919)
class AddLabelingToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :labeling, :string
  end
end
