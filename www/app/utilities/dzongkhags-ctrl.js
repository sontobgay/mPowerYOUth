angular.module('mpoweryouth').controller('DzongkhagsCtrl', function($scope, $http, $ionicLoading) {
    var link = 'http://119.2.120.36/mpoweryouthApi/dzongkhag_data.php';    
	//var link = "http://localhost/mpoweryouth/api/dzongkhag_data.php";
    $ionicLoading.show({

        template: '<i class="fa fa-spinner fa-spin"></i> Loading dzongkhags'
    });

    $scope.init = function() {
        $http.get(link)
            .success(function(data) {
                $ionicLoading.hide();
                console.log(data);
                $scope.dzongkhags = data;
                window.localStorage["dzongkhags"] = JSON.stringify(data);
            })
            .error(function(data) {
                $ionicLoading.hide();
                console.log("ERROR: " + data);
                if(window.localStorage["dzongkhags"] !== undefined) {
                    $scope.dzongkhags = JSON.parse(window.localStorage["dzongkhags"]);
                }
            });
    }
});