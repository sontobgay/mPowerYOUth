(function () {
    'use strict';
    angular.module('mpoweryouth').controller('feedbackCtrl', function($scope, $http, $ionicLoading, $ionicPopup, $state) {
    $scope.data = {};

    $scope.feedbackSubmit = function(){

       var confirmPopup = $ionicPopup.confirm({
         title: 'Feedback Form',
         template: 'Are you sure you want Submit this form?'
       });
       confirmPopup.then(function(res) {
         if(res) {
            var link = 'http://202.144.144.195/mpoweryouthApi/youth_feedback.php';

            $ionicLoading.show({
                template: '<i class="fa fa-spinner fa-spin"></i> Submitting Form'
            });

            var inputData = {
            	name : $scope.data.fullname,
            	mobile_number : $scope.data.mobile,
            	email_address : $scope.data.email,
            	feedback : $scope.data.feedback
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
});
})();