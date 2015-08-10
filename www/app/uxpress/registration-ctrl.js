(function () {
    'use strict';
    angular.module('mpoweryouth').controller('registrationCtrl', function($scope, $http, $ionicLoading, $ionicPopup, $state) {
    $scope.data = {};

    $scope.counsellingSubmit = function(){
       var confirmPopup = $ionicPopup.confirm({
         title: 'Counselling Registration',
         template: 'Are you sure you want Submit this form?'
       });
       confirmPopup.then(function(res) {
         if(res) {
            $ionicLoading.show({
                template: '<i class="fa fa-spinner fa-spin"></i> Submitting Form'
            });

            var link = 'http://202.144.144.195/mpoweryouthApi/counselling_registration.php';
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
                $ionicLoading.show({ template: $scope.response, noBackdrop: true, duration: 5000 });
            });

            $state.go('home.uxpress');
            $scope.data = {};  
         }
       });        
    };

    $scope.getDzongkhag = function(){

        var link = 'http://202.144.144.195/mpoweryouthApi/dzongkhag_data.php';

        $ionicLoading.show({
            template: '<i class="fa fa-spinner fa-spin"></i> Loading dzongkhags'
        });

        $http.get(link)
            .success(function(data) {
                $ionicLoading.hide();
                $scope.dzongkhags = data;
                window.localStorage["getdzongkhags"] = JSON.stringify(data);
            })
            .error(function(data) {
                $ionicLoading.hide();
                if(window.localStorage["getdzongkhags"] !== undefined) {
                    $scope.dzongkhags = JSON.parse(window.localStorage["getdzongkhags"]);
                }
        });

    };

    $scope.getIssue = function(){

        var link = 'http://202.144.144.195/mpoweryouthApi/issue_data.php';

        $ionicLoading.show({
            template: '<i class="fa fa-spinner fa-spin"></i> Loading issues'
        });

        $http.get(link)
            .success(function(data) {
                $ionicLoading.hide();
                $scope.issues = data;
                window.localStorage["getissues"] = JSON.stringify(data);
            })
            .error(function(data) {
                $ionicLoading.hide();
                if(window.localStorage["getissues"] !== undefined) {
                    $scope.issues = JSON.parse(window.localStorage["getissues"]);
                }
        });
    };
});
})();