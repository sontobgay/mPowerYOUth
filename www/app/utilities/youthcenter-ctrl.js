angular.module('mpoweryouth').controller('YouthCentersCtrl', function($scope, $stateParams, $http, $ionicLoading) {
    var link = "http://202.144.144.195/mpoweryouthApi/youthcenters_data.php?center_type_id="+$stateParams.centerTypeId;
    //var link = "http://localhost/mpoweryouth/api/counsellor_data.php?dzongkhag_id="+$stateParams.dzongkhagId;
    $ionicLoading.show({

        template: '<i class="fa fa-spinner fa-spin"></i> Loading Youth Centers'
    });

    $scope.init = function() {
        $http.get(link)
            .success(function(data) {
                $ionicLoading.hide();
                $scope.youthcenters = data;
                window.localStorage["youthcenters"] = JSON.stringify(data);
            })
            .error(function(data) {
                $ionicLoading.hide();
                if(window.localStorage["youthcenters"] !== undefined) {
                    $scope.youthcenters = JSON.parse(window.localStorage["youthcenters"]);
                }
            });
    }
});