angular.module('mpoweryouth').controller('CounsellorDetailsCtrl', function($scope, $stateParams, $http, $ionicLoading) {
    var link = "http://202.144.144.195/mpoweryouthApi/counsellor_detail.php?counsellor_id="+$stateParams.counsellorId;
    //var link = "http://localhost/mpoweryouth/api/counsellor_detail.php?counsellor_id="+$stateParams.counsellorId;
    $ionicLoading.show({

        template: '<i class="fa fa-spinner fa-spin"></i> Loading Center Detail'
    });

    $scope.init = function() {
        $http.get(link)
            .success(function(data) {
                $ionicLoading.hide();
                $scope.counsellors = data;
                window.localStorage["counsellorDetails"] = JSON.stringify(data);
            })
            .error(function(data) {
               $ionicLoading.hide();
                if(window.localStorage["counsellorDetails"] !== undefined) {
                    $scope.counsellors = JSON.parse(window.localStorage["counsellorDetails"]);
                }
            });
    }
});