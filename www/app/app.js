angular.module("mpoweryouth", ["ionic", "mpoweryouth.twitter-controllers", "mpoweryouth.twitter-services", "mpoweryouth.twitter-filters"])

// angular.module('mpoweryouth', ['ionic', 'ngResource', 'ngCordova', 'ngTwitter'])
// //This controller invocation is for ngTwitter
// .controller('AppCtrl', function($scope, $ionicPlatform, $twitterApi, $cordovaOauth) {
//   var twitterKey = 'STORAGE.TWITTER.KEY';
//   var clientId = 'WUx1VnLJVGWOSBoBEd4qoCGde';
//   var clientSecret = 'rbw6WOVzheoU3qhRxsJzUYQ2pw5ctA8hSnbi3clfl646JhaPaY';
//   var myToken = '';
 
//   $scope.tweet = {};
 
//   $ionicPlatform.ready(function() {
//     myToken = JSON.parse(window.localStorage.getItem(twitterKey));
//     if (myToken === '' || myToken === null) {
//       $cordovaOauth.twitter(clientId, clientSecret).then(function (succ) {
//         myToken = succ;
//         window.localStorage.setItem(twitterKey, JSON.stringify(succ));
//         $twitterApi.configure(clientId, clientSecret, succ);
//         $scope.showHomeTimeline();
//       }, function(error) {
//         console.log(error);
//       });
//     } else {
//       $twitterApi.configure(clientId, clientSecret, myToken);
//       $scope.showHomeTimeline();
//     }
//   });

//   $scope.showHomeTimeline = function() {
//     $twitterApi.getHomeTimeline().then(function(data) {
//       $scope.home_timeline = data;
//     });
//   };
 
//   $scope.submitTweet = function() {
//     $twitterApi.postStatusUpdate($scope.tweet.message).then(function(result) {
//       $scope.showHomeTimeline();
//     });
//   }
 
//   $scope.doRefresh = function() {
//     $scope.showHomeTimeline();
//     $scope.$broadcast('scroll.refreshComplete');
//   };
 
//   $scope.correctTimestring = function(string) {
//     return new Date(Date.parse(string));
//   };
// })

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    if(window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
    }
    if(window.StatusBar) {
      StatusBar.styleDefault();
    }
  });
})

.config(function($stateProvider, $urlRouterProvider) {

  $stateProvider

    .state('home', {
      abstract: true,
      url: "/home",
      templateUrl: "app/home/tab.html"
    })

    .state('home.index', {
      url: "/index",
      views: {
        "tab-index": {
          templateUrl: "app/home/home.html"
        }
      }
    })

    .state('home.uxpress', {
      url: "/uxpress",
      views: {
        "tab-uxpress": {
          templateUrl: "app/uxpress/uxpress.html"
        }
      }
    })

    .state('home.ufeeds', {
      url: "/ufeeds",
      views: {
        "tab-ufeeds": {
          templateUrl: "app/ufeeds/ufeeds.html"
        }
      }
    })

    .state('home.utilities', {
      url: "/utilities",
      views: {
        "tab-utilities": {
          templateUrl: "app/utilities/utilities.html"
        }
      }
    })

    .state('app', {
      abstract: true,
      url: "/app",
      templateUrl: "app/layout/menu-layout.html"
    })


    .state('app.feedback', {
      url: "/feedback",
      views: {
        "mainContent": {
          templateUrl: "app/uxpress/feedback.html"
        }
      }
    })

    .state('app.registration', {
      url: "/registration",
      views: {
        "mainContent": {
          templateUrl: "app/uxpress/registration.html"
        }
      }
    })

    .state('app.questionnaire', {
      url: "/questionnaire",
      views: {
        "mainContent": {
          templateUrl: "app/uxpress/questionnaire.html"
        }
      }
    })

    .state('app.youth-center-types', {
      url: "/youth-center-types",
      views: {
        "mainContent": {
          templateUrl: "app/utilities/youth-center-types.html"
        }
      }
    })

     .state('app.youth-centers', {
      url: "/youth-centers/:centerTypeId",
      views: {
        "mainContent": {
          templateUrl: "app/utilities/youth-centers.html"
        }
      }
    })

    .state('app.youth-centers-detail', {
      url: "/youth-center-detail/:centerId",
      views: {
        "mainContent": {
          templateUrl: "app/utilities/youth-center-detail.html"
        }
      }
    })

    .state('app.counsellor-dzongkhags', {
      url: "/counsellor-dzongkhags",
      views: {
        "mainContent": {
          templateUrl: "app/utilities/counsellor-dzongkhags.html"
        }
      }
    })

    .state('app.counsellors', {
      url: "/counsellors/:dzongkhagId",
      views: {
        'mainContent': {
          templateUrl: "app/utilities/counsellors.html"
        }
      }
    })

    .state('app.counsellor-detail', {
      url: "/counsellor-detail/:counsellorId",
      views: {
        "mainContent": {
          templateUrl: "app/utilities/counsellor-detail.html"
        }
      }
    })

    .state('app.helpline-details', {
      url: "/helpline-details",
      views: {
        "mainContent": {
          templateUrl: "app/utilities/helpline-details.html"
        }
      }
    });

    // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/home/index');
});
