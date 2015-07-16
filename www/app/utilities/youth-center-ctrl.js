angular.module('mpoweryouth').controller('YouthcentersCtrl', function($scope, $http, $ionicLoading) {
    var link = 'http://119.2.120.36/mpoweryouthApi/youth_center_type_data.php';        
	// var link = "http://localhost/mpoweryouth/api/youth_center_type_data.php";

    $ionicLoading.show({
        template: '<i class="fa fa-spinner fa-spin"></i> Loading Youth Centers'
    });

    $http.get(link).then(function (resYouthcentertypes){
        $ionicLoading.hide();
        $scope.youth_center_types = resYouthcentertypes.data;
    });


    $scope.selectDzongkhag = function(dzongkhagID) {
        var link = "http://119.2.120.36/mpoweryouthApi/counsellor_data.php?dzongkhag_id=" + dzongkhagID;
        // var link = "http://localhost/mpoweryouth/api/counsellor_data.php?dzongkhag_id=" + dzongkhagID;
        $http.get(link).then(function (resCounsellors){
            $scope.counsellors = resCounsellors.data;
            console.log($scope.counsellors);
        });
    }

});