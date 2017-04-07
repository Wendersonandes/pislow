# This migration comes from solidus_subscriptions (originally 20170111232801)
class ChangeIntevalActionableDateToDatetime < ActiveRecord::Migration
  def change
    change_column :solidus_subscriptions_installments, :actionable_date, :datetime
  end
end
