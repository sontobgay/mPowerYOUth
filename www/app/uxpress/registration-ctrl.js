(function () {
    'use strict';
    angular.module('mpoweryouth').controller('registrationCtrl', function($scope, $http, $ionicLoading) {
    $scope.data = {};

    $scope.counsellingSubmit = function(){

        $ionicLoading.show({
            template: '<i class="fa fa-spinner fa-spin"></i> Submitting Form'
        });

        var link = 'http://119.2.120.36/mpoweryouthApi/counselling_registration.php';
        var inputData = {
        	name : $scope.data.fullname,
            gender  : $scope.data.gender,
            age  : $scope.data.age,
        	mobile_number : $scope.data.mobile,
        	email_address : $scope.data.email,
            dzongkhag  : $scope.data.dzongkhag,
            area  : $scope.data.area,
            issue  : $scope.data.issue,
        	counselling_details : $scope.data.details
        };

        $http.post(link, inputData).then(function (res){
            $ionicLoading.hide();
            $scope.response = res.data;
        });

        $scope.data.fullname = null;
        $scope.data.age = null;
        $scope.data.mobile = null;
        $scope.data.email = null;
        $scope.data.dzongkhag = null;
        $scope.data.area = null;
        $scope.data.issue = null;
        $scope.data.details = null;
    };

    $scope.getDzongkhag = function(){

        var link = 'http://119.2.120.36/mpoweryouthApi/dzongkhag_data.php';

        $ionicLoading.show({
            template: '<i class="fa fa-spinner fa-spin"></i> Loading dzongkhags'
        });

        $http.get(link).then(function (resDzongkhags){
            $ionicLoading.hide();
            $scope.dzongkhags = resDzongkhags.data;
            console.log($scope.dzongkhags);
        });
    };

    $scope.getIssue = function(){

        var link = 'http://119.2.120.36/mpoweryouthApi/issue_data.php';
        //var link = 'http://localhost/mpoweryouth/api/issue_data.php';

        $ionicLoading.show({
            template: '<i class="fa fa-spinner fa-spin"></i> Loading issues'
        });

        $http.get(link).then(function (resIssues){
            $ionicLoading.hide();
            $scope.issues = resIssues.data;
            console.log($scope.issues);
        });
    };
});
})();






















