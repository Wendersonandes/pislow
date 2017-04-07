class Spree::RentalsConfiguration < Spree::Preferences::Configuration

	def self.boolean_preferences
    	%w(send_mail_points)
    end

	  # rental services prices or porcentage in order to calcule service in order
	  preference :cleaning_service_price, :decimal
	  preference :cleaning_service_porcentage, :integer
	  preference :assegurance_service_price, :decimal
	  preference :assegurance_service_porcentage, :integer
	  preference :days_change_size, :integer
	  preference :days_start_rental, :integer
	  preference :rental_value_month, :integer, :default => 4
	  preference :rental_value_day, :integer, :default => 20
	  preference :send_mail_points, :boolean, :default => false
	  preference :percentage_secondhand_buy , :integer ,:default => 20
	  preference :percentage_discount_buy, :integer ,:default => 20
	  preference :price_assegurance_mandatory, :integer ,:default => 20
	  preference :no_shipping_supplier, :boolean, :default => false

end