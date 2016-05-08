angular
	.module('Exhibition')
	.controller('ContentController', ['$rootScope', '$scope', '$timeout',
        function($rootScope, $scope, $timeout) {

            $rootScope.topScope = $scope;

            $scope.featuredApps = [[849, 15], [121,7]];
            $scope.currentInstanceIndex = 0;
            $scope.currentInstanceId = $scope.featuredApps[0][0];
            $scope.background = true;


            $scope.executeNextInstance = function() {
                console.log('---exec NEXT instance ' + $scope.currentInstanceIndex.toString());
                $scope.currentInstanceId = $scope.featuredApps[$scope.currentInstanceIndex][0];
                var timer = $scope.featuredApps[$scope.currentInstanceIndex][1];
                $timeout(function() {
                    //$scope.currentInstanceIndex++;
                    //$scope.executeNextInstance();
                }, (timer*1000));
            };

            $scope.executeInstance = function(id) {
                console.log('---exec SPECIFIC instance ', id);
                $scope.background = false;
                $scope.currentInstanceId = id;
            };

            $scope.init = function() {
                console.log('ContentController scope init');
                $scope.executeNextInstance();
            };

            $scope.nextApp = function() {
                $scope.currentInstanceIndex++;
                $scope.currentInstanceIndex = $scope.currentInstanceIndex % $scope.featuredApps.length;
                $scope.executeNextInstance();
            };



	   }]);
