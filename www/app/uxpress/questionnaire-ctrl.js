(function () {
    'use strict';
    angular.module('mpoweryouth').controller('questionnaireCtrl', function($scope, $http) {
    $scope.data = {};

    $scope.mindSubmit = function(){
       var link = 'http://119.2.120.36/mpoweryouthApi/youth_mind_assessment.php';
        // var link = 'http://localhost/mpoweryouth/api/youth_mind_assessment.php';
        var inputData = {
        	name : $scope.data.fullname,
        	gender : $scope.data.gender,
        	talk_counsellor : $scope.data.talk_counsellor,
        	feeling_lonely : $scope.data.feeling_lonely,
            location: $scope.data.location,
            thoughts: $scope.data.thoughts
        };

        $http.post(link, inputData).then(function (res){
            $scope.response = res.data;
        });
    };
});
})();






















