angular.module('mpoweryouth.controllers', [])

.controller('DashCtrl', function($scope) {})

.controller('ChatsCtrl', function($scope, Chats) {
  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //
  //$scope.$on('$ionicView.enter', function(e) {
  //});
  
  $scope.chats = Chats.all();
  $scope.remove = function(chat) {
    Chats.remove(chat);
  }
})

.controller('ChatDetailCtrl', function($scope, $stateParams, Chats) {
  $scope.chat = Chats.get($stateParams.chatId);
})

.controller('UtilitiesCtrl', function($scope) {
  $scope.settings = {
    enableFriends: true
  };
})

//This controller is for Twitter Feeds
.controller('AppCtrl', function($scope, $ionicPlatform, TwitterService) {
    // 1
    $scope.correctTimestring = function(string) {
        return new Date(Date.parse(string));
    };
    // 2
    $scope.showHomeTimeline = function() {
        $scope.home_timeline = TwitterService.getHomeTimeline();
    };
    // 3
    $scope.doRefresh = function() {
        $scope.showHomeTimeline();
        $scope.$broadcast('scroll.refreshComplete');
    };
    // 4
    $ionicPlatform.ready(function() {
        if (TwitterService.isAuthenticated()) {
            $scope.showHomeTimeline();
        } else {
            TwitterService.initialize().then(function(result) {
                if(result === true) {
                    $scope.showHomeTimeline();
                }
            });
        }
    });
})
// .controller('AppCtrl', function($scope, $ionicPlatform){
//   $ionicPlatform.ready(function() {
//     window.open(encodeURI('http://k-rudy.github.io/phonegap-twitter-timeline?613020326528573440'), '_blank', 'location=no');
//   });
  
// })

