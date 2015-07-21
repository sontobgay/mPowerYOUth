angular.module('mpoweryouth').controller('CounsellorDetailsCtrl', function($scope, $stateParams, $http, $ionicLoading) {
    var link = "http://119.2.120.36/mpoweryouthApi/counsellor_detail.php?counsellor_id="+$stateParams.counsellorId;
    //var link = "http://localhost/mpoweryouth/api/counsellor_detail.php?counsellor_id="+$stateParams.counsellorId;
    $ionicLoading.show({

        template: '<i class="fa fa-spinner fa-spin"></i> Loading Center Detail'
    });

    $scope.init = function() {
        $http.get(link)
            .success(function(data) {
                $ionicLoading.hide();
                console.log(data);
                $scope.counsellors = data;
                window.localStorage["counsellors"] = JSON.stringify(data);
            })
            .error(function(data) {
                console.log("ERROR: " + data);
                if(window.localStorage["counsellors"] !== undefined) {
                    $scope.counsellors = JSON.parse(window.localStorage["counsellors"]);
                }
            });
    }

    // $http.get(link).then(function (resCounsellorDetails){
    //     $ionicLoading.hide();
    //     $scope.counsellors = resCounsellorDetails.data;
    //     console.log($scope.counsellors);
    // });
});