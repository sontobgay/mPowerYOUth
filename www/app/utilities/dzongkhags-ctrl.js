angular.module('mpoweryouth').controller('DzongkhagsCtrl', function($scope, $http, $ionicLoading) {
    var link = 'http://119.2.120.36/mpoweryouthApi/dzongkhag_data.php';    
	//var link = "http://localhost/mpoweryouth/api/dzongkhag_data.php";
    $ionicLoading.show({

        template: '<i class="fa fa-spinner fa-spin"></i> Loading dzongkhags'
    });

    $http.get(link).then(function (resDzongkhags){
        $ionicLoading.hide();
        $scope.dzongkhags = resDzongkhags.data;
        console.log($scope.dzongkhags);
        // window.localStorage["dzongkhags"] = JSON.stringify(data.responseData.feed.dzongkhags);
    });
    // .error(function(data) {
    //     console.log("ERROR: " + data);
    //     if(window.localStorage["dzongkhags"] !== undefined) {
    //         $scope.dzongkhags = JSON.parse(window.localStorage["dzongkhags"]);
    //     }
    // });
});