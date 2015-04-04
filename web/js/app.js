$(document).ready(function(){

  $('button').button();

  setupSidebarMenu();
  setupSortEventHandling();

  function setupSidebarMenu() {
    $( "#mainContentSidebarMenu" ).menu({
      items: "> :not(.ui-widget-header)"
    });
  }

  function setupSortEventHandling() {
    $('#sortBar').find('a[data-sortby]').click(function () {
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
        $('#productList').append(productItem);
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

});
