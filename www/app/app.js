// angular.module("mpoweryouth", ["ionic"])

angular.module('mpoweryouth', ['ionic', 'ngResource', 'ngCordova', 'ngTwitter'])
//This controller invocation is for ngTwitter
.controller('AppCtrl', function($scope, $ionicPlatform, $twitterApi, $cordovaOauth) {
  var twitterKey = 'STORAGE.TWITTER.KEY';
  var clientId = 'WUx1VnLJVGWOSBoBEd4qoCGde';
  var clientSecret = 'rbw6WOVzheoU3qhRxsJzUYQ2pw5ctA8hSnbi3clfl646JhaPaY';
  var myToken = '';
 
  $scope.tweet = {};
 
  $ionicPlatform.ready(function() {
    myToken = JSON.parse(window.localStorage.getItem(twitterKey));
    if (myToken === '' || myToken === null) {
      $cordovaOauth.twitter(clientId, clientSecret).then(function (succ) {
        myToken = succ;
        window.localStorage.setItem(twitterKey, JSON.stringify(succ));
        $twitterApi.configure(clientId, clientSecret, succ);
        $scope.showHomeTimeline();
      }, function(error) {
        console.log(error);
      });
    } else {
      $twitterApi.configure(clientId, clientSecret, myToken);
      $scope.showHomeTimeline();
    }
  });

  $scope.showHomeTimeline = function() {
    $twitterApi.getHomeTimeline().then(function(data) {
      $scope.home_timeline = data;
    });
  };
 
  $scope.submitTweet = function() {
    $twitterApi.postStatusUpdate($scope.tweet.message).then(function(result) {
      $scope.showHomeTimeline();
    });
  }
 
  $scope.doRefresh = function() {
    $scope.showHomeTimeline();
    $scope.$broadcast('scroll.refreshComplete');
  };
 
  $scope.correctTimestring = function(string) {
    return new Date(Date.parse(string));
  };
})

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if(window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
    }
    if(window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
  });
})

.config(function($stateProvider, $urlRouterProvider) {

  $stateProvider

    .state('home', {
      // abstract: true,
      url: "/home",
      templateUrl: "app/home/home.html"
    })

    .state('app', {
      abstract: true,
      url: "/app",
      templateUrl: "app/layout/menu-layout.html"
    })


    .state('app.uxpress', {
      url: "/uxpress",
      views: {
        "mainContent": {
          templateUrl: "app/uxpress/uxpress.html"
        }
      }
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
          templateUrl: "app/uxpress/registration.html",
          controller: 'registrationCtrl'
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

    .state('app.ufeeds', {
      url: "/ufeeds",
      views: {
        "mainContent": {
          templateUrl: "app/ufeeds/ufeeds.html"
        }
      }
    })

    .state('app.utilities', {
      url: "/utilities",
      views: {
        "mainContent": {
          templateUrl: "app/utilities/utilities.html"
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
      url: "/counsellors",
      views: {
        "mainContent": {
          templateUrl: "app/utilities/counsellors.html"
        }
      }
    })


    .state('app.counsellor-detail', {
      url: "/counsellor-detail",
      views: {
        "mainContent": {
          templateUrl: "app/utilities/counsellor-detail.html"
        }
      }
    });

    // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/home');
});