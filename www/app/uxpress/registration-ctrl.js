(function () {
    'use strict';
    angular.module('mpoweryouth').controller('registrationCtrl', function($scope, $http) {
    $scope.data = {};

    $scope.counsellingSubmit = function(){
        var link = 'http://localhost/mpoweryouth/register.php';
        var inputData = {
        	name : $scope.data.fullname,
        	age  : $scope.data.age,
        	mobile_number : $scope.data.mobile,
        	email_address : $scope.data.email,
        	counselling_details : $scope.data.details
        };

        $http.post(link, inputData).then(function (res){
            $scope.response = res.data;
        });
    };
});
})();






















