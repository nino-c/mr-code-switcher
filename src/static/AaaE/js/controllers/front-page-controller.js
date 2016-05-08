angular
    .module('Exhibition')
    .controller('FrontPageController', ['$scope',
        '$location',
        '$timeout',
        '$window',
        function($scope, $location, $timeout, $window) {

            $scope.showPanel = false;
            $scope.loading = true;

            $scope.initFrontPage = function() {
                console.log('FrontPageController scope init');
                $scope.loading = false;
                $timeout(function() { $scope.togglePanel(); });
            };

            $scope.togglePanel = function() {
                $scope.showPanel = !$scope.showPanel;
            };

            $scope.browseApps = function($event) {
                $event.stopPropagation();
                $scope.showPanel = false;
                $timeout(function() {
                    $location.path('/apps-list/');
                });
            };

            $window.renderingDone = function() {
                console.log('renderingDone');
            }


        }]);
