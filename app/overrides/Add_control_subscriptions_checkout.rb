Deface::Override.new(
  virtual_path: 'spree/checkout/registration',
  name: 'add_control_subscriptions_checkout',
  insert_before: "[data-hook='registration']",
  text: '<% if Spree::Config[:allow_guest_checkout] && current_order.subscription_line_items.empty? %>
',
  disabled: true)