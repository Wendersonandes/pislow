# This migration comes from solidus_user_prices (originally 20160219021842)
class AddRoleReferenceToSpreeUserPrices < ActiveRecord::Migration
  def change
    add_reference :spree_user_prices, :role, index: true
  end
end
