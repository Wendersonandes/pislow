Deface::Override.new(:virtual_path  => "spree/address/_form",
                     :insert_top => "[data-hook='shipping_inner']",
                     :text       => "<div class='appers_only_shipping uppercase '><h3>Introduzca una dirección de envío distinta</h3></div>",
                     :name          => "text_shipping_address" )

