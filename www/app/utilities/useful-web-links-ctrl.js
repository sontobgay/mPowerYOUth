(function(){

var app = angular.module('mpoweryouth');
    
    app.controller('UsefulWebLinksCtrl', function($scope) {


    $scope.openLink = function (link){
        window.open(encodeURI(link), '_system', 'location=yes');
    }

});
}());