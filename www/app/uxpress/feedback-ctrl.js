(function () {
    'use strict';
    angular.module('mpoweryouth').controller('feedbackCtrl', function($scope, $http) {
    $scope.data = {};

    $scope.feedbackSubmit = function(){
        var link = 'http://localhost/mpoweryouth/youth_feedback.php';
        var inputData = {
        	name : $scope.data.fullname,
        	mobile_number : $scope.data.mobile,
        	email_address : $scope.data.email,
        	feedback : $scope.data.feedback
        };

        $http.post(link, inputData).then(function (res){
            $scope.response = res.data;
        });
    };
});
})();






















