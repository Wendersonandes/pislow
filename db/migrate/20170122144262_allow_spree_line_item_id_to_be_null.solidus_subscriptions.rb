# This migration comes from solidus_subscriptions (originally 20161014212649)
class AllowSpreeLineItemIdToBeNull < ActiveRecord::Migration
  def change
    change_column_null :solidus_subscriptions_line_items, :spree_line_item_id, true
  end
end
