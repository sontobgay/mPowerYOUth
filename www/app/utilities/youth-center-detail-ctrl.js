angular.module('mpoweryouth').controller('YouthcenterDetailsCtrl', function($scope, $stateParams, $http, $ionicLoading) {
    var link = "http://202.144.144.195/mpoweryouthApi/youthcenter_detail.php?center_id="+$stateParams.centerId;
    //var link = "http://localhost/mpoweryouth/api/counsellor_detail.php?counsellor_id="+$stateParams.counsellorId;
    $ionicLoading.show({

        template: '<i class="fa fa-spinner fa-spin"></i> Loading Center Detail'
    });

    $scope.init = function() {
        $http.get(link)
            .success(function(data) {
                $ionicLoading.hide();
                $scope.youth_center_detail = data;
                window.localStorage["youth_center_detail"] = JSON.stringify(data);
            })
            .error(function(data) {
                $ionicLoading.hide();
                if(window.localStorage["youth_center_detail"] !== undefined) {
                    $scope.youth_center_detail = JSON.parse(window.localStorage["youth_center_detail"]);
                }
            });
    }
});