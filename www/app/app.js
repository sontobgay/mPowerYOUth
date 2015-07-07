angular.module("mpoweryouth", ["ionic"])

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
      // abstract: true,
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
    });

    // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/home');
});