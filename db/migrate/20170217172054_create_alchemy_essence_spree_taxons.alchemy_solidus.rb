# This migration comes from alchemy_solidus (originally 20131030140218)
class CreateAlchemyEssenceSpreeTaxons < ActiveRecord::Migration
  def change
    create_table :alchemy_essence_spree_taxons do |t|
      t.references :taxon

      t.timestamps
    end
    add_index :alchemy_essence_spree_taxons, :taxon_id
  end
end
