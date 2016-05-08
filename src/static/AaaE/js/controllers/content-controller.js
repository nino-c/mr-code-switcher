/*
*	The `ContentController` handles everything to do with the
*	one and only <canvas> element, for bg and apps
*/

angular
	.module('Exhibition')
	.controller('ContentController', ['$rootScope',
		'$scope',
		'$location',
		'$timeout',
		'$window',
        function($rootScope, $scope, $location, $timeout, $window) {

            $rootScope.topScope = $scope;
			$scope.loading = false;
			$scope.showBottom = $rootScope.showBottom;

			// vars for cycle of featured apps
            $scope.featuredApps = [[849, 15], [121,7]];
			$scope.currentInstance = null;
            $scope.currentInstanceIndex = 0;
            $scope.currentInstanceId = $scope.featuredApps[0][0];

			$scope.init = function() {
                console.log('ContentController <body> scope init');
                $scope.executeNextInstance();
				$timeout(function() { $scope.toggleBottomBar(); }, 100);
            };

			$scope.setCurrentInstance = function(id) {
				console.log('setCurrentInstance = ', id);
				$scope.currentInstanceId = id;
			};

			$scope.toggleBottomBar = function() {
                $scope.showBottom = !$scope.showBottom;
            };

            $scope.browseApps = function($event) {
                $location.path('/apps-list/');
                $event.stopPropagation();
                $scope.showBottom = false;
            };

            $scope.executeNextInstance = function() {
                console.log('---exec NEXT instance ' + $scope.currentInstanceIndex.toString());
                $scope.setCurrentInstance( $scope.featuredApps[$scope.currentInstanceIndex][0] );
                var timer = $scope.featuredApps[$scope.currentInstanceIndex][1];
                $timeout(function() {
                    //$scope.currentInstanceIndex++;
                    //$scope.executeNextInstance();
                }, (timer*1000));
            };


            $scope.nextApp = function() {
                $scope.currentInstanceIndex++;
                $scope.currentInstanceIndex = $scope.currentInstanceIndex % $scope.featuredApps.length;
                $scope.executeNextInstance();
            };



	   }]);
