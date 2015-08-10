angular.module('mpoweryouth').controller('CounsellorsCtrl', function($scope, $stateParams, $http, $ionicLoading) {
    var link = "http://202.144.144.195/mpoweryouthApi/counsellor_data.php?dzongkhag_id="+$stateParams.dzongkhagId;
    //var link = "http://localhost/mpoweryouth/api/counsellor_data.php?dzongkhag_id="+$stateParams.dzongkhagId;
    $ionicLoading.show({

        template: '<i class="fa fa-spinner fa-spin"></i> Loading counsellors'
    });


    $scope.init = function() {
        $http.get(link)
            .success(function(data) {
                $ionicLoading.hide();
                $scope.counsellors = data;
                window.localStorage["counsellors"] = JSON.stringify(data);
            })
            .error(function(data) {
                $ionicLoading.hide();
                if(window.localStorage["counsellors"] !== undefined) {
                    $scope.counsellors = JSON.parse(window.localStorage["counsellors"]);
                }
            });
    }
});