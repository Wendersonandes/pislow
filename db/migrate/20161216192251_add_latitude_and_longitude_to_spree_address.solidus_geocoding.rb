# This migration comes from solidus_geocoding (originally 20161025003323)
class AddLatitudeAndLongitudeToSpreeAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_addresses, :latitude, :float
    add_column :spree_addresses, :longitude, :float
  end
end
