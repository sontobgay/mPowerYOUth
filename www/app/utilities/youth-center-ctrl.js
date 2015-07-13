angular.module('mpoweryouth').controller('YouthcentersCtrl', function($scope, $http) {
	var link = "http://localhost/mpoweryouth/api/youth_center_type_data.php";
    $http.get(link).then(function (resYouthcentertypes){
        $scope.youth_center_types = resYouthcentertypes.data;
    });


    $scope.selectDzongkhag = function(dzongkhagID) {
        var link = "http://localhost/mpoweryouth/api/counsellor_data.php?dzongkhag_id=" + dzongkhagID;
        $http.get(link).then(function (resCounsellors){
            $scope.counsellors = resCounsellors.data;
            console.log($scope.counsellors);
        });
    }

});