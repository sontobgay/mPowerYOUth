angular.module('mpoweryouth').controller('YouthCentersCtrl', function($scope, $stateParams, $http, $ionicLoading) {
    var link = "http://119.2.120.36/mpoweryouthApi/youthcenters_data.php?center_type_id="+$stateParams.centerTypeId;
    //var link = "http://localhost/mpoweryouth/api/counsellor_data.php?dzongkhag_id="+$stateParams.dzongkhagId;
    $ionicLoading.show({

        template: '<i class="fa fa-spinner fa-spin"></i> Loading Youth Centers'
    });

    // console.log($routeParams.dzongkhagId);

    $http.get(link).then(function (resYouthCenters){
        $ionicLoading.hide();
        $scope.youthcenters = resYouthCenters.data;
        console.log($scope.youthcenters);
    });
});