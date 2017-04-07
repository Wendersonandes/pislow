# This migration comes from solidus_subscriptions (originally 20170111224458)
class ChangeSubscriptionActionableDateToDatetime < ActiveRecord::Migration
  def change
    change_column :solidus_subscriptions_subscriptions, :actionable_date, :datetime
  end
end
