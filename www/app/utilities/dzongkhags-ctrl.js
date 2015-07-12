// (function () {
//     'use strict';

//     angular.module('mpoweryouth').controller('DzongkhagsCtrl', ['$state', 'mpoweryouthApi', DzongkhagsCtrl]);

//     function DzongkhagsCtrl($state, mpoweryouthApi) {
//         var vm = this;

//         mpoweryouthApi.getDzongkhags().then(function(data){
//             vm.dzongkhags = data;
//         });

//         vm.selectDzongkhag = function(id){
//             mpoweryouthApi.setDzongkhagId(id);
//             $state.go("app.counsellors");
//         }

//     };
// })();

/*working*/
angular.module('mpoweryouth').controller('DzongkhagsCtrl', function($scope, $http) {
	var link = "http://localhost/mpoweryouth/api/dzongkhag_data.php";
    $http.get(link).then(function (resDzongkhags){
        $scope.dzongkhags = resDzongkhags.data;
    });


    $scope.selectDzongkhag = function(dzongkhagID) {
        var link = "http://localhost/mpoweryouth/api/counsellor_data.php?dzongkhag_id=" + dzongkhagID;
        $http.get(link).then(function (resCounsellors){
            $scope.counsellors = resCounsellors.data;
            console.log($scope.counsellors);
        });
    }


	// function DzongkhagsCtrl($scope, $http){
	// 	$scope.data = {};

	// 	var link = "http://localhost/mpoweryouth/api/dzongkhag_data.php";
        
 //        $http.get(link).success(function(data){
 //        	$scope.dzongkhags = data;
 //        });

        // then(function (resDzongkhags){
        // 	// $ionicLoading.hide();
        //     $scope.dzongkhags = resDzongkhags.data;
        // });

	// } 
 
    // $scope.getData = function() {
    // 	$ionicLoading.show({
    //     		template: "Loading..."
    //     });

    //     var link = "http://localhost/mpoweryouth/api/dzongkhag_data.php";
    //     $http.get(link).then(function (resDzongkhags){
    //     	$ionicLoading.hide();
    //         $scope.dzongkhags = resDzongkhags.data;
    //     });
    // }
 
});
