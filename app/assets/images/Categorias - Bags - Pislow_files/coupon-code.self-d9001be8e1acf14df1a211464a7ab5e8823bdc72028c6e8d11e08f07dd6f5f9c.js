(function() {
  Spree.onCouponCodeApply = function(e) {
    var couponCode, couponCodeField, couponStatus, errorClass, req, successClass, url;
    couponCodeField = $('#order_coupon_code');
    couponCode = $.trim(couponCodeField.val());
    if (couponCode === '') {
      return;
    }
    couponStatus = $("#coupon_status");
    successClass = 'success';
    errorClass = 'alert';
    url = Spree.url(Spree.routes.apply_coupon_code(Spree.current_order_id), {
      order_token: Spree.current_order_token,
      coupon_code: couponCode
    });
    couponStatus.removeClass([successClass, errorClass].join(" "));
    req = Spree.ajax({
      method: "PUT",
      url: url
    });
    req.done(function(data) {
      window.location.reload();
      couponCodeField.val('');
      return couponStatus.addClass(successClass).html("Coupon code applied successfully.");
    });
    return req.fail(function(xhr) {
      var handler;
      handler = xhr.responseJSON;
      return couponStatus.addClass(errorClass).html(handler["error"]);
    });
  };

  Spree.ready(function($) {
    return $('#coupon-code-apply-button').click(function(e) {
      return Spree.onCouponCodeApply(e);
    });
  });

}).call(this);
