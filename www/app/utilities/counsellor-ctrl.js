angular.module('mpoweryouth').controller('CounsellorsCtrl', function($scope, $stateParams, $http, $ionicLoading) {
    var link = "http://119.2.120.36/mpoweryouthApi/counsellor_data.php?dzongkhag_id="+$stateParams.dzongkhagId;
    //var link = "http://localhost/mpoweryouth/api/counsellor_data.php?dzongkhag_id="+$stateParams.dzongkhagId;
    $ionicLoading.show({

        template: '<i class="fa fa-spinner fa-spin"></i> Loading counsellors'
    });

    // console.log($routeParams.dzongkhagId);

    $http.get(link).then(function (resCounsellors){
        $ionicLoading.hide();
        $scope.counsellors = resCounsellors.data;
        console.log($scope.counsellors);
    });
});