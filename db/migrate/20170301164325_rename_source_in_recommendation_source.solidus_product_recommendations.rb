# This migration comes from solidus_product_recommendations (originally 20160701090723)
class RenameSourceInRecommendationSource < ActiveRecord::Migration
  def change
    rename_column :spree_product_recommendations, :source, :recommendation_source
  end
end
