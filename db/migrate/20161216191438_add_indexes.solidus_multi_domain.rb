# This migration comes from solidus_multi_domain (originally 20150304200122)
class AddIndexes < ActiveRecord::Migration
  def change
    add_index :spree_promotion_rules_stores, :store_id
    add_index :spree_promotion_rules_stores, :promotion_rule_id
  end
end
