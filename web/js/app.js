$(document).ready(function(){
  $('button').button();
  $( "#mainContentSidebarMenu" ).menu({
    items: "> :not(.ui-widget-header)"
  });
});
