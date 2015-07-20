(function(){

var app = angular.module('mpoweryouth');
    
    app.controller('HomeCtrl', function($scope, $stateParams, $http, $ionicLoading) {
 
    $ionicLoading.show({
       template: '<i class="fa fa-spinner fa-spin"></i> Fetching Feeds'
    });

    $scope.init = function() {
        $http.get("http://ajax.googleapis.com/ajax/services/feed/load", { params: { "v": "1.0", "q": "http://www.bhutanyouth.org/feed","num":"10" } })
            .success(function(data) {
                $ionicLoading.hide();
                console.log(data);
                $scope.entries = data.responseData.feed.entries;
                window.localStorage["entries"] = JSON.stringify(data.responseData.feed.entries);
            })
            .error(function(data) {
                console.log("ERROR: " + data);
                if(window.localStorage["entries"] !== undefined) {
                    $scope.entries = JSON.parse(window.localStorage["entries"]);
                }
            });
            $scope.$broadcast('scroll.refreshComplete');
    }

    $scope.openLink = function (link){
        window.open(encodeURI(link), '_system', 'location=yes');
    }
});
}());