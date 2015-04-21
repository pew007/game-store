$(document).ready(function(){

  $('button').button();

  setupSidebarMenu();
  setupSidebarSearchEventHandling();
  setupSortEventHandling();
  setupEditCartEventHandling();
  setupFormValidation();
  setupCheckoutAddressCheckbox();
  setupSubmitOrderEventHandling();

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

  function setupFormValidation() {
    var requiredFields = $('.required');
    requiredFields.focusin(function () {
      $(this).val('');
      $(this).removeClass('warning');
    });

    requiredFields.focusout(function () {
      var input = $(this).val();
      console.log(input);
      if (input === '') {
        $(this).val('required').addClass('warning');
      }
    });
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
      var container = $(this).closest('tr');
      var sku = container.attr('id');
      var quantity = container.find('.cartItemQuantity').val();

      console.log(quantity);

      $.post('/item/update', {sku: sku, quantity: quantity}, function(data){
        if (data.status === 'OK') {
          window.location.href = "/cart/summary";
        }
      });
    })
  }
});
