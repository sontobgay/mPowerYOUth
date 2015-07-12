(function() {
    'use strict';

<<<<<<< HEAD
    angular.module('mpoweryouth').factory('mpoweryouthApi', ['$http', '$q', '$ionicLoading', 'DSCacheFactory', mpoweryouthApi]);

    function mpoweryouthApi($http, $q, $ionicLoading, DSCacheFactory) {


        self.dzongkhagsCache = DSCacheFactory.get("dzongkhagsCache");
        self.counsellorDataCache = DSCacheFactory.get("counsellorDataCache");


        self.dzongkhagsCache.setOptions({
            onExpire: function (key, value) {
                getDzongkhags()
                    .then(function () {
                        console.log("Dzongkhags Cache was automatically refreshed.", new Date());
                    }, function () {
                        console.log("Error getting data. Putting expired item back in the cache.", new Date());
                        self.dzongkhagsCache.put(key, value);
                    });
            }
        });

        self.counsellorDataCache.setOptions({
            onExpire: function (key, value) {
                getCounsellorData()
                    .then(function () {
                        console.log("Counsellor Data Cache was automatically refreshed.", new Date());
                    }, function () {
                        console.log("Error getting data. Putting expired item back in the cache.", new Date());
                        self.counsellorDataCache.put(key, value);
                    });
            }
        });

        self.staticCache = DSCacheFactory.get("staticCache");

        function setDzongkhagId(dzongkhagId){
            self.staticCache.put("currentDzongkhagId", dzongkhagId);
        }

        function getDzongkhagId(){
            var id = self.staticCache.get("currentDzongkhagId");
            console.log("in get dzongkhagid", id);
            return id;
        }

        function getDzongkhags() {
            var deferred = $q.defer(),
                cacheKey = "dzongkhags",
                dzongkhagsData = self.dzongkhagsCache.get(cacheKey);

            if (dzongkhagsData) {
                console.log("Found data inside cache", dzongkhagsData);
                deferred.resolve(dzongkhagsData);
            } else {
                $http.get("http://localhost/mpoweryouth/api/dzongkhag_data.php")
                    .success(function(data) {
                        console.log("Received data via HTTP");
                        self.dzongkhagsCache.put(cacheKey, data);
                        deferred.resolve(data);
                    })
                    .error(function() {
                        console.log("Error while making HTTP call.");
                        deferred.reject();
                    });
            }
            return deferred.promise;
        }

        function getCounsellorData(forceRefresh) {
            if (typeof forceRefresh === "undefined") { forceRefresh = false; }

            var deferred = $q.defer(),
                cacheKey = "counsellorData-" + getLeagueId(),
                counsellorData = null;

            if (!forceRefresh) {
                counsellorData = self.counsellorDataCache.get(cacheKey);
            };

            if (counsellorData) {
                console.log("Found data in cache", counsellorData);
                deferred.resolve(counsellorData);
            } else {
                $ionicLoading.show({
                    template: 'Loading...'
                });

                $http.get("http://localhost/mpoweryouth/api/counsellor_data.php" + getDzongkhagId())
                    .success(function(data, status) {
                        console.log("Received counsellor data data via HTTP.", data, status);
                        self.dzongkhagDataCache.put(cacheKey, data);
                        $ionicLoading.hide();
                        deferred.resolve(data);
                    })
                    .error(function() {
                        console.log("Error while making HTTP call.");
                        $ionicLoading.hide();
                        deferred.reject();
                    });
            }
            return deferred.promise;
        };

       

        return {
            getDzongkhags: getDzongkhags,
            getCounsellorData: getCounsellorData,
            setDzongkhagId: setDzongkhagId
        };
    };
=======
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

>>>>>>> origin/master
})();