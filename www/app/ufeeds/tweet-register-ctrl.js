
(function(){

var app = angular.module('mpoweryouth');
	
	app.controller('TweetRegisterCtrl', function($sendSMS) {

	$cordovaSms
      .send('phonenumber', 'Follow @_mPowerYOUth', options)
      .then(function() {
        alert('SMS for Tweet Registration sent successfully')
      }, function(error) {
        alert('SMS Failed:' + error)
      });
 
});
}());