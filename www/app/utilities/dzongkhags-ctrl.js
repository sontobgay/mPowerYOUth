angular.module('mpoweryouth').controller('DzongkhagsCtrl', function($scope, $http, $ionicLoading) {
    var link = 'http://202.144.144.195/mpoweryouthApi/dzongkhag_data.php';    
	//var link = "http://localhost/mpoweryouth/api/dzongkhag_data.php";
    $ionicLoading.show({

        template: '<i class="fa fa-spinner fa-spin"></i> Loading dzongkhags'
    });

    $scope.init = function() {
        $http.get(link)
            .success(function(data) {
                $ionicLoading.hide();
                $scope.dzongkhags = data;
                window.localStorage["dzongkhags"] = JSON.stringify(data);
            })
            .error(function(data) {
                $ionicLoading.hide();
                if(window.localStorage["dzongkhags"] !== undefined) {
                    $scope.dzongkhags = JSON.parse(window.localStorage["dzongkhags"]);
                }
            });
    }
});