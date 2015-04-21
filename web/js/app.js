$(document).ready(function(){

  $('button').button();

  setupSidebarMenu();
  setupSidebarSearchEventHandling();
  setupSortEventHandling();
  setupEditCartEventHandling();
  setupCheckoutAddressCheckbox();
  setupSubmitOrderEventHandling();
  setupValidationRules();

  $('.editOrder').click(function () {
    window.location.href = "/billing/info";
  });

  $('.continueCheckout').click(function () {
    window.location.href = "/billing/info";
  });

  $('.editCart').click(function () {
    window.location.href = "/cart/summary";
  });

  $('.continueShopping').click(function () {
    window.location.href = "/product/list";
  });

  $('.placeOrder').click(function () {
    window.location.href = "/order/confirmation";
  });

  function setupSidebarMenu() {
    $( "#mainContentSidebarMenu" ).menu({
      items: "> :not(.ui-widget-header)"
    });
  }

  function setupSidebarSearchEventHandling() {
    $('#mainContentSidebarMenu').find('li').click(function(){
      $(this).find('form').submit();
    });
  }

  function setupSortEventHandling() {
    $('.sortBar').find('a[data-sortby]').click(function () {
      var sortBy = $(this).data('sortby');
      var sortQueue = $('.productItem');

      if (sortBy === 'price-low') {
        sortQueue.sort(sortByLowPrice);
      } else if (sortBy === 'price-high') {
        sortQueue.sort(sortByHighPrice);
      } else if (sortBy === 'name') {
        sortQueue.sort(sortByProductName);
      } else if (sortBy === 'platform') {
        sortQueue.sort(sortByPlatform);
      } else if (sortBy === 'avail') {
        sortQueue.sort(sortByAvailability);
      }

      sortQueue.each(function (index, value) {
        var productItem = $(value);
        $('.productList').append(productItem);
      });

      return false;
    });
  }

  function sortByLowPrice(a, b) {
    return parseInt($(a).attr('data-price')) - parseInt($(b).attr('data-price'));
  }

  function sortByHighPrice(a, b) {
    return parseInt($(b).attr('data-price')) - parseInt($(a).attr('data-price'));
  }

  function sortByProductName(a, b) {
    if ($(b).attr('data-name') == $(a).attr('data-name')) {
      return 0;
    }
    return $(b).attr('data-name') > $(a).attr('data-name') ? -1 : 1;
  }

  function sortByPlatform(a, b) {
    if ($(b).attr('data-platform') == $(a).attr('data-platform')) {
      return 0;
    }
    return $(b).attr('data-platform') > $(a).attr('data-platform') ? -1 : 1;
  }

  function sortByAvailability(a,b) {
    return parseInt($(a).attr('data-status')) - parseInt($(b).attr('data-status'));
  }

  function setupEditCartEventHandling() {
    $(document).on('click', '.removeCartItem', function(){
      var container = $(this).closest('tr');
      var sku = container.attr('id');

      $.post('/item/remove', {sku: sku}, function(data){
        if (data.status === 'OK') {
          window.location.href = "/cart/summary";
        }
      });
    });

    $(document).on('click', '.updateCartItem', function(){
      $(this).closest("#editCartItemForm").submit();
    })
  }

  function setupCheckoutAddressCheckbox() {
    var shippingInfoForm = $('.shippingInfoForm');
    var shippingFirstName = $('#shippingFirstName');
    var shippingLastName = $('#shippingLastName');
    var shippingAddress1 = $('#shippingAddress1');
    var shippingAddress2 = $('#shippingAddress2');
    var shippingCity = $('#shippingCity');
    var shippingState = $('#shippingState');
    var shippingZip = $('#shippingZip');
    var shippingPhone = $('#shippingPhone');

    $('.billingSameAsShipping').change(function () {
      var isChecked = this.checked;
      if (isChecked) {
        $('#billingFirstName').val(shippingFirstName.val());
        $('#billingLastName').val(shippingLastName.val());
        $('#billingAddress1').val(shippingAddress1.val());
        $('#billingAddress2').val(shippingAddress2.val());
        $('#billingCity').val(shippingCity.val());
        $('#billingState').val(shippingState.val());
        $('#billingZip').val(shippingZip.val());
        $('#billingPhone').val(shippingPhone.val());
      } else {
        var billingInfoContainer = $('.billingInfoContainer');
        reset(billingInfoContainer);
      }
    });
  }

  function reset(container) {
    container.find('input[type=text], select').val('');
  }

  function setupSubmitOrderEventHandling() {
    $('.submitOrder').click(function () {
      $('.checkoutInfoForm').submit();
    });
  }

  function setupValidationRules() {
    $.verify.addRules({
      zip: function(r) {
        var data = r.val();
        if (data.match(/^\d{5}$/)) {
          return true;
        }
        return "Invalid zip code!";
      },

      phoneNumber: function(r) {
        var data = r.val();
        if (data.match(/^\d{10}$/)) {
          return true;
        }
        return "Invalid phone number!";
      },

      cardNumber: function(r) {
        var data = r.val();
        if (data.match(/^(4\d{15}|5[1-5][0-9]{14}|3[47][0-9]{13}|6(?:011|5[0-9]{2})[0-9]{12})$/)) {
          return true;
        }
        return "Invalid card number!";
      },

      csv: function(r) {
        var data = r.val();
        if (data.match(/^\d{3}\d?$/)) {
          return true;
        }
        return "Invalid security code!";
      }
    });
  }

});
