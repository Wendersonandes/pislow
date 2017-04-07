# This migration comes from solidus_subscriptions (originally 20160922164101)
class AddIntervalLengthAndUnitsToSubscriptionLineItems < ActiveRecord::Migration
  def change
    add_column :solidus_subscriptions_line_items, :interval_units, :integer
    add_column :solidus_subscriptions_line_items, :interval_length, :integer

    remove_column :solidus_subscriptions_line_items, :interval
  end
end
