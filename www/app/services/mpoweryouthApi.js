(function() {
    'use strict';

    angular.module('mpoweryouth').factory('mpoweryouthApi', ['$http',mpoweryouthApi]);

     function mpoweryouthApi($http){


        function storeRegistrationData(callback){

            $http.post("http://127.0.0.1/mpoweryouth/register.php")
                 .success(function(data){
                    callback(data);
                 });

        }

        return {
            storeRegistrationData: storeRegistrationData
        };
    };

})();