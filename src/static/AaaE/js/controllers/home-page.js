angular
    .module('Exhibition')
    .controller('HomeController', ['$rootScope', '$scope', '$timeout',
        function($rootScope, $scope, $timeout) {

            $scope.showBottom = true;
            $rootScope.viewscope = $scope;

            $scope.initHome = function() {
                console.log('HomeController scope init');
                console.log("should be ContentController", $scope.$parent);

                if (!$rootScope.showBottom) {
					$timeout(function() { $rootScope.showBottom = true; }, 200);
				}
            };

        }]);
