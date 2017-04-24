# This migration comes from solidus_user_address_book (originally 20170407092530)
class AddUserIdAndDeletedAtToAddresses < ActiveRecord::Migration[5.0]
  def change
  	change_table :spree_addresses do |t|
  		t.integer :user_id
  		t.datetime :deleted_at
  		t.index :user_id
  		t.index :deleted_at
  	end
  end
end
