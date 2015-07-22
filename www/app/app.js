angular.module("mpoweryouth", ["ionic", "mpoweryouth.twitter-controllers", "mpoweryouth.twitter-services", "mpoweryouth.twitter-filters"])

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

.config(function($stateProvider, $urlRouterProvider, $compileProvider, $ionicConfigProvider) {
  $ionicConfigProvider.backButton.previousTitleText(false).text('');

  $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|tel|sms|mailto|file):/);
 
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

    .state('home.about', {
      url: "/about",
      views: {
        "tab-about": {
          templateUrl: "app/home/about.html"
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
