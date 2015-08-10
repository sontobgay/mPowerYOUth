(function () {
    'use strict';
    angular.module('mpoweryouth').controller('questionnaireCtrl', function($scope, $http, $ionicLoading, $ionicPopup, $state) {
    $scope.data = {};

    $scope.mindSubmit = function(){

       var confirmPopup = $ionicPopup.confirm({
         title: 'Share Your Thoughts',
         template: 'Are you sure you want Submit this form?'
       });
       confirmPopup.then(function(res) {
         if(res) {
               var link = 'http://202.144.144.195/mpoweryouthApi/youth_mind_assessment.php';

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
                window.localStorage["fetchdzongkhags"] = JSON.stringify(data);
            })
            .error(function(data) {
                $ionicLoading.hide();
                if(window.localStorage["fetchdzongkhags"] !== undefined) {
                    $scope.dzongkhags = JSON.parse(window.localStorage["fetchdzongkhags"]);
                }
        });
    };

});
})();






















