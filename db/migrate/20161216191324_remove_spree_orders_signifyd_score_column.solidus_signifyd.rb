# This migration comes from solidus_signifyd (originally 20150211202803)
class RemoveSpreeOrdersSignifydScoreColumn < ActiveRecord::Migration
  def change
    remove_column :spree_orders, :signifyd_score, :integer
  end
end
