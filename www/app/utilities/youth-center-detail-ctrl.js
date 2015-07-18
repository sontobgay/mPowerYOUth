angular.module('mpoweryouth').controller('YouthcenterDetailsCtrl', function($scope, $stateParams, $http, $ionicLoading) {
    var link = "http://119.2.120.36/mpoweryouthApi/youthcenter_detail.php?center_id="+$stateParams.centerId;
    //var link = "http://localhost/mpoweryouth/api/counsellor_detail.php?counsellor_id="+$stateParams.counsellorId;
    $ionicLoading.show({

        template: '<i class="fa fa-spinner fa-spin"></i> Loading Center Detail'
    });

    $http.get(link).then(function (resYouthCenterDetail){
        $ionicLoading.hide();
        $scope.youth_center_detail = resYouthCenterDetail.data;
        console.log($scope.youth_center_detail);
    });
});