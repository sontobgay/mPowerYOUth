(function () {
    'use strict';
    angular.module('mpoweryouth').controller('questionnaireCtrl', function($scope, $http) {
    $scope.data = {};

    $scope.mindSubmit = function(){
        var link = 'http://localhost/mpoweryouth/youth_mind_assessment.php';
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






















