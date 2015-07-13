(function () {
    'use strict';
    angular.module('mpoweryouth').controller('registrationCtrl', function($scope, $http) {
    $scope.data = {};

    $scope.counsellingSubmit = function(){
        var link = 'http://119.2.120.36/mpoweryouthApi/counselling_registration.php';
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






















