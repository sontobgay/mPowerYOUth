(function () {
    'use strict';

angular.module('mpoweryouth.twitter-controllers', [])

.controller('TwitterFeedCtrl', function($scope, $ionicLoading, TwitterREST) {

	$ionicLoading.show({
       template: '<i class="fa fa-spinner fa-spin"></i> Loading Tweets ...'
    });

	$scope.init = function() {
	    TwitterREST.sync().then(function(tweets){
		$ionicLoading.hide();
        console.log(tweets);
        $scope.tweets = tweets.statuses;
        window.localStorage["twitterFeeds"] = JSON.stringify(tweets);
    	$scope.$broadcast('scroll.refreshComplete');
	  })
	}
});
})();