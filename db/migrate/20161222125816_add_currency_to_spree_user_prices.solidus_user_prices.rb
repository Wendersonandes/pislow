# This migration comes from solidus_user_prices (originally 20160617021405)
class AddCurrencyToSpreeUserPrices < ActiveRecord::Migration
  def change
    add_column :spree_user_prices, :currency, :string
  end
end
