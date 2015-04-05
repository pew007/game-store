(function(){

  $('.button').button();

  var storeApp = angular.module('storeApp', []);

  storeApp.controller('StoreCtrl', function($scope, $http){
    $http.get('/product/list').success(function(data){
      $scope.products = data;
    });
  });
})();
