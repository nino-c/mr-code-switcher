/*
 *   Interface for bottom-bar:
 *      - currentInstance:instance
 *      - view:{ home | app-list | app-instances | instance }
*/

angular
    .module('Exhibition')
    .controller('BottomBarController', ['$rootScope',
        '$scope',
        function($rootScope, $scope) {

            $scope.currentInstance = $rootScope.currentInstance;

            $scope.initBottomBar = function() {
                $rootScope.$watch('currentInstance', function(instance) {
                    $scope.currentInstance = instance;
                })
            };

        }]);
