angular.module('mpoweryouth').controller('CounsellorDetailsCtrl', function($scope, $stateParams, $http, $ionicLoading) {
    var link = "http://119.2.120.36/mpoweryouthApi/counsellor_detail.php?counsellor_id="+$stateParams.counsellorId;
    //var link = "http://localhost/mpoweryouth/api/counsellor_detail.php?counsellor_id="+$stateParams.counsellorId;
    $ionicLoading.show({

        template: '<i class="fa fa-spinner fa-spin"></i> Loading counsellor Details'
    });

    $http.get(link).then(function (resCounsellorDetail){
        $ionicLoading.hide();
        $scope.counsellors = resCounsellorDetail.data;
        // console.log($scope.counsellors);
    });
});