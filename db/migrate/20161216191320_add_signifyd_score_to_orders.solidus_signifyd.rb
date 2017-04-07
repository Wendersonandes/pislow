# This migration comes from solidus_signifyd (originally 20140819203000)
class AddSignifydScoreToOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :signifyd_score, :integer
  end
end
