(function () {
    'use strict';
    angular.module('mpoweryouth').controller('questionnaireCtrl', function($scope, $http, $ionicLoading) {
    $scope.data = {};

    $scope.mindSubmit = function(){
       var link = 'http://119.2.120.36/mpoweryouthApi/youth_mind_assessment.php';
        // var link = 'http://localhost/mpoweryouth/api/youth_mind_assessment.php';

        $ionicLoading.show({
            template: '<i class="fa fa-spinner fa-spin"></i> Submitting Form'
        });

        var inputData = {
        	name : $scope.data.fullname,
        	gender : $scope.data.gender,
            mobile : $scope.data.mobile,
            email: $scope.data.email,
            dzongkhag  : $scope.data.dzongkhag,
            area  : $scope.data.area,
        	talk_counsellor : $scope.data.talk_counsellor,
        	feeling_lonely : $scope.data.feeling_lonely,
            thoughts: $scope.data.thoughts
        };

        $http.post(link, inputData).then(function (res){
            $ionicLoading.hide();
            $scope.response = res.data;
        });
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

});
})();






















