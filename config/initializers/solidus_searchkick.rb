Spree::Search::Searchkick.class_eval do
  # Modify prepare method
  alias_method :original_prepare, :prepare
  def prepare(params)
    # Set default ordering if not passed in through parameters
    if params.fetch(:searchkick_options, {}).fetch(:order, {}).blank?
      params.deep_merge!(searchkick_options: { order: { price: :desc } })
    end
    original_prepare(params)
  end
end