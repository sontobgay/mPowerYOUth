(function(){

var app = angular.module('mpoweryouth');
	
	app.controller('UfeedsCtrl', function($scope, $ionicLoading, $ionicPlatform) {


	$scope.loadTwitterFeeds = function() {
    $ionicLoading.show({
       template: '<i class="fa fa-spinner fa-spin"></i> Fetching Twitter Feeds'
    });
	   $ionicLoading.hide();
       window.open(encodeURI('http://k-rudy.github.io/phonegap-twitter-timeline?613020326528573440'), '_blank', 'location=no', 'closebuttoncaption=Back to App');
       //window.open(encodeURI('http://k-rudy.github.io/phonegap-twitter-timeline?613020326528573440'), '_blank', 'location=no', 'hardwareback=yes', 'closebuttoncaption=Done';
    }

$scope.smsTweets = function($cordovaSms) {

$ionicPlatform.ready(function() {

    $cordovaSms.send('40404', 'Follow @_mPowerYOUth', options)
        .then(function() {
            alert('SMS for Tweet Registration sent successfully');
        }, function(error) {
            alert('SMS Failed:' + error);
        });

 })
}

  // $scope.smsTweets = function() {
  //    .send('40404', 'Follow @_mPowerYOUth', options)
  //     .then(function() {
  //       alert('SMS for Tweet Registration sent successfully')
  //     }, function(error) {
  //       alert('SMS Failed:' + error)
  //     });
  //   }
  
});
}());