# This migration comes from solidus_product_recommendations (originally 20160630092140)
class AddProductRecommendations < ActiveRecord::Migration
  def change
    create_table :spree_product_recommendations do |t|
      t.integer :product_id
      t.string :source

      t.string :comment_title
      t.text :comment

      t.string :scoring_type
      t.string :scoring_value

      t.boolean :hide, default: false

      t.timestamps
    end
  end
end
