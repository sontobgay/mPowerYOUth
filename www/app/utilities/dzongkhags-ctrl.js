angular.module('mpoweryouth').controller('DzongkhagsCtrl', function($scope, $http, $ionicLoading) {
    var link = 'http://119.2.120.36/mpoweryouthApi/dzongkhag_data.php';    
	//var link = "http://localhost/mpoweryouth/api/dzongkhag_data.php";
    $ionicLoading.show({

        template: '<span class="icon ion-load-a"></span> Loading dzongkhags'
    });

    $http.get(link).then(function (resDzongkhags){
        $ionicLoading.hide();
        $scope.dzongkhags = resDzongkhags.data;
        console.log($scope.dzongkhags);
    });
});