# This migration comes from solidus_waiting_list (originally 20110406120000)
class ChangeWaitingListsToStockRequests < ActiveRecord::Migration
  def self.up
    rename_table :waiting_lists, :stock_requests
  end

  def self.down
    rename_table :stock_requests, :waiting_lists
  end
end
