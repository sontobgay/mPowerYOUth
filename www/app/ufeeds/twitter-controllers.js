(function () {
    'use strict';

angular.module('mpoweryouth.twitter-controllers', [])

.controller('TwitterFeedCtrl', function($scope, $ionicLoading, TwitterREST) {

    $ionicLoading.show({
       template: '<i class="fa fa-spinner fa-spin"></i> Loading Tweets ...',
       duration: 5000
    });

	$scope.showHomeTimeline = function() {
	    TwitterREST.sync().then(function(tweets){
		$ionicLoading.hide();
        console.log(tweets.statuses);
        $scope.tweets = tweets.statuses;
        console.log(tweets.statuses);
        window.localStorage["twitterFeeds"] = JSON.stringify(tweets);
	  })
	}

     $scope.doRefresh = function() {
        $scope.showHomeTimeline();
        $scope.$broadcast('scroll.refreshComplete');
    };

    $scope.openLink = function (link){
        window.open(encodeURI('http://www.twitter.com/'+link), '_system', 'location=yes');
    }
});
})();