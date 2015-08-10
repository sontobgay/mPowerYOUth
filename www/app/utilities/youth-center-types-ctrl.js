angular.module('mpoweryouth').controller('YouthCenterTypesCtrl', function($scope, $http, $ionicLoading) {
    var link = 'http://202.144.144.195/mpoweryouthApi/youth_center_type_data.php';        
	// var link = "http://localhost/mpoweryouth/api/youth_center_type_data.php";

    $ionicLoading.show({
        template: '<i class="fa fa-spinner fa-spin"></i> Loading Youth Centers'
    });

    $scope.init = function() {
        $http.get(link)
            .success(function(data) {
                $ionicLoading.hide();
                $scope.youth_center_types = data;
                window.localStorage["youth_center_types"] = JSON.stringify(data);
            })
            .error(function(data) {
                $ionicLoading.hide();
                if(window.localStorage["youth_center_types"] !== undefined) {
                    $scope.youth_center_types = JSON.parse(window.localStorage["youth_center_types"]);
                }
            });
    }
});
