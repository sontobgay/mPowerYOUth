angular.module('mpoweryouth').controller('CounsellorDetailsCtrl', function($scope, $stateParams, $http, $ionicLoading) {
    var link = "http://119.2.120.36/mpoweryouthApi/counsellor_detail.php?counsellor_id="+$stateParams.counsellorId;
    //var link = "http://localhost/mpoweryouth/api/counsellor_detail.php?counsellor_id="+$stateParams.counsellorId;
    $ionicLoading.show({

        template: '<span class="icon ion-load-a"></span> Loading counsellor Details'
    });

    // console.log($routeParams.dzongkhagId);

    $http.get(link).then(function (resCounsellorDetail){
        $ionicLoading.hide();
        $scope.counsellors = resCounsellorDetail.data;
        console.log($scope.counsellors);
    });
});