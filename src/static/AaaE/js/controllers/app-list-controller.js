angular
    .module('Exhibition')
    .controller('AppListController', ['$scope',
        '$timeout',
        '$location',
        '$window',
        'AppServiceMinimal',
        function($scope, $timeout, $location, $window, AppServiceMinimal) {

            $scope.showAppList = false;
            $scope.showBottom = false;
            $scope.showSearch = false;
            $scope.loading = true;

            AppServiceMinimal.query().$promise.then(function(apps) {
                $scope.apps = apps;
                $scope.loading = false;
                //$scope.showAppList = true;
                //$timeout(function() { $scope.toggleAppList(); });
            });

            $scope.openSortMenu = function($mdOpenMenu, $event) {
                $event.stopPropagation();
                $mdOpenMenu($event);
            }

            $scope.initAppList = function() {
                console.log('AppList scope init');
                $scope.toggleAppList();
                $timeout(function() {
                  $window.scrollTo(0,0);
                });

            };

            $scope.toggleAppList = function() {
                $scope.showAppList = !$scope.showAppList;
            };

            $scope.selectApp = function(chosenApp) {
                //$scope.selectedApp = chosenApp
                $location.path('/apps/'+chosenApp.id)
            };

            $window.renderingDone = function() {
                console.log('renderingDone');
            }

        }]);
