angular.module('DummyApp', [
	'ngMaterial',
    'ngRoute'
	])
	.run(function($rootScope, $location, $window) {

		$rootScope.isAngularApp = false;

        $rootScope.goHome = function() {
          $window.location = "/#";
        }

	});