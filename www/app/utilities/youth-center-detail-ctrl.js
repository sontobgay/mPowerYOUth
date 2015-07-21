angular.module('mpoweryouth').controller('YouthcenterDetailsCtrl', function($scope, $stateParams, $http, $ionicLoading) {
    var link = "http://119.2.120.36/mpoweryouthApi/youthcenter_detail.php?center_id="+$stateParams.centerId;
    //var link = "http://localhost/mpoweryouth/api/counsellor_detail.php?counsellor_id="+$stateParams.counsellorId;
    $ionicLoading.show({

        template: '<i class="fa fa-spinner fa-spin"></i> Loading Center Detail'
    });

    // $http.get(link).then(function (resYouthCenterDetail){
    //     $ionicLoading.hide();
    //     $scope.youth_center_detail = resYouthCenterDetail.data;
    //     console.log($scope.youth_center_detail);
    // });

    $scope.init = function() {
        $http.get(link)
            .success(function(data) {
                $ionicLoading.hide();
                console.log(data);
                $scope.youth_center_detail = data;
                window.localStorage["youth_center_detail"] = JSON.stringify(data);
            })
            .error(function(data) {
                console.log("ERROR: " + data);
                if(window.localStorage["youth_center_detail"] !== undefined) {
                    $scope.youth_center_detail = JSON.parse(window.localStorage["youth_center_detail"]);
                }
            });
    }
});