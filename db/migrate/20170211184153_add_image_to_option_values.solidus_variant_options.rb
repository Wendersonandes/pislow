# This migration comes from solidus_variant_options (originally 20160422011847)
class AddImageToOptionValues < ActiveRecord::Migration
  def change
    add_column :spree_option_values, :image_file_name,    :string
    add_column :spree_option_values, :image_content_type, :string
    add_column :spree_option_values, :image_file_size,    :integer
    add_column :spree_option_values, :image_updated_at,   :datetime
  end
end
