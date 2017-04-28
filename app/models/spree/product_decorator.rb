 module Spree
 class Order < Spree::Base 



  def search_data
    json = {
      name: name,
      description: description,
      active: available?,
      price: price,
      currency: Spree::Config.currency,
      sku: sku,
      conversions: orders.complete.count,
      taxon_ids: taxon_and_ancestors.map(&:id),
      taxon_names: taxon_and_ancestors.map(&:name)
    }

    json
  end

  
 end
end