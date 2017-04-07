
class Spree::Admin::RentalSettingsController < Spree::Admin::BaseController
  before_filter :process_unset_checkboxes, only: [:update]

  def update
    Spree::Rentals::Config.set(params[:preferences])

    respond_to do |format|
      format.html do
        redirect_to edit_admin_rental_settings_path
      end
    end
  end

  def process_unset_checkboxes
    # workaround for unset checkbox behaviour
    params[:preferences] ||= {}
    Spree::RentalsConfiguration.boolean_preferences.each do |sym|
      params[:preferences][sym] = false if params[:preferences][sym].blank?
    end
  end
end