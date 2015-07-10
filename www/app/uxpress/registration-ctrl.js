angular.module('mpoweryouth', [])

.controller('registrationCtrl', function($scope, $http) {  
    $scope.register = function(){
      var postUrl = 'http://localhost/mpoweryouth/register.php';
      var data = {"name":"Tashi", "age":"24", "mobile_number":"77609377","email_address":"dawtashi8@gmail.com","counselling_details":"test details"};
      var config = {
        headers : {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},
        cache: false,
      };

      $http.post(postUrl, data, config)
            .success(function (data, status, headers, config)
                $scope.status = status;
                $scope.data = data;
        }).error(function (err) {
            $scope.data = "Request failed";
            $scope.status = status;
      });
});