(function(){

var app = angular.module('mpoweryouth');
    
    app.controller('HomeCtrl', function($scope, $stateParams, $http, $ionicLoading) {
 
    $ionicLoading.show({
       template: '<i class="fa fa-spinner fa-spin"></i> Fetching Feeds & Events'
    });

    $scope.init = function() {
        $http.get("http://ajax.googleapis.com/ajax/services/feed/load", { params: { "v": "1.0", "q": "http://www.bhutanyouth.org/feed","num":"5" } })
            .success(function(data) {
                $ionicLoading.hide();
                $scope.entries = data.responseData.feed.entries;
                window.localStorage["entries"] = JSON.stringify(data.responseData.feed.entries);
            })
            .error(function(data) {
                $ionicLoading.hide();
                if(window.localStorage["entries"] !== undefined) {
                    $scope.entries = JSON.parse(window.localStorage["entries"]);
                }
            });
            $scope.$broadcast('scroll.refreshComplete');
    }

    $scope.openLink = function (link){
        window.open(encodeURI(link), '_system', 'location=yes');
    }

    $scope.openEventLink = function (eventId){
        window.open(encodeURI('http://202.144.144.195/index.php/event/register/'+eventId), '_system', 'location=yes');
    }

    $scope.correctTimeString = function(string){
        return new Date(Date.parse(string)).toString();
    }

    var link = 'http://202.144.144.195/mpoweryouthApi/event.php';    

    $scope.getEvent = function() {
        $http.get(link)
            .success(function(data) {
                $ionicLoading.hide();
                $scope.events = data;
                window.localStorage["events"] = JSON.stringify(data);
            })
            .error(function(data) {
                $ionicLoading.hide();
                if(window.localStorage["events"] !== undefined) {
                    $scope.events = JSON.parse(window.localStorage["events"]);
                }
            });
    }
});
}());