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
			$rootScope.viewscope = $scope;

			$scope.loading = false;
			$scope.featuredApps = [[849, 15], [121,7]];
			$scope.currentInstance = null;
            $scope.currentInstanceIndex = 0;
            $scope.currentInstanceId = $scope.featuredApps[0][0];

			$scope.canvasLoadConfig = {
				loadFromServer: true,
			};

			$scope.init = function() {
                console.log('ContentController::'+$rootScope.viewname+' scope init');
                $scope.executeNextInstance();
            };

			$scope.setCurrentInstance = function(id) {
				if (id == $scope.currentInstanceId) {
					$scope.currentInstanceId = 0;
				}
				console.log('setCurrentInstance = ', id);
				$timeout(function() {
					$scope.currentInstanceId = id;
				})
			};

			$scope.toggleBottomBar = function() {
                $rootScope.showBottom = !$rootScope.showBottom;
				console.log('toggleBottomBar', $rootScope.showBottom);
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
