angular.module('mpoweryouth').controller('CounsellorsCtrl', function($scope, $stateParams, $http, $ionicLoading) {
    var link = "http://119.2.120.36/mpoweryouthApi/counsellor_data.php?dzongkhag_id="+$stateParams.dzongkhagId;
    //var link = "http://localhost/mpoweryouth/api/counsellor_data.php?dzongkhag_id="+$stateParams.dzongkhagId;
    $ionicLoading.show({

        template: '<i class="fa fa-spinner fa-spin"></i> Loading counsellors'
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
});