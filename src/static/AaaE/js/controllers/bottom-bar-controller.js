/*
     *   Interface for bottom-bar:
     *      - currentInstance:instance
     *      - view:{ home | app-list | app-instances | instance }
*/

angular
    .module('Exhibition')
    .controller('BottomBarController', ['$rootScope',
        '$scope', '$location',
        function($rootScope, $scope, $location) {

            $scope.currentInstance = $rootScope.currentInstance;

            $scope.initBottomBar = function() {
                console.log('initBottomBar');
                $rootScope.$watch('currentInstance', function(instance) {
                    $scope.currentInstance = instance;
                })
            };

            $scope.browseApps = function($event) {
                $event.stopPropagation();
                $location.path('/apps-list/');
                //$rootScope.showBottom = false;
            };

        }]);
