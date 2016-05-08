angular
    .module('Exhibition')
    .controller('BottomController', ['$scope',
        '$location',
        '$timeout',
        '$window',
        function($scope, $location, $timeout, $window) {

            $scope.showPanel = false;
            $scope.showBottom = true;
            $scope.loading = true;

            $scope.initFrontPage = function() {
                console.log('FrontPageController scope init');
                $scope.loading = false;
                $timeout(function() { $scope.togglePanel(); }, 100);
            };

            $scope.togglePanel = function() {
                $scope.showPanel = !$scope.showPanel;
            };

            $scope.browseApps = function($event) {
                $location.path('/apps-list/');
                $event.stopPropagation();
                $scope.showPanel = false;
                // $timeout(function() {
                //     $location.path('/apps-list/');
                // });
            };

            $window.renderingDone = function() {
                console.log('renderingDone');
            }


        }]);
