angular
    .module('Exhibition')
    .controller('AppListController', ['$scope', 
        '$timeout',
        '$location',
        'AppServiceMinimal', 
        function($scope, $timeout, $location, AppServiceMinimal) {

            $scope.showAppList = false;
            $scope.showSearch = false;
            $scope.loading = true;

            AppServiceMinimal.query().$promise.then(function(apps) {
                console.log('apps', apps);
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
                //$scope.loading = false;
                $scope.toggleAppList();
            };

            $scope.toggleAppList = function() {
                $scope.showAppList = !$scope.showAppList;
            };

            $scope.selectApp = function(chosenApp) {
                //$scope.selectedApp = chosenApp
                $location.path('/apps/'+chosenApp.id)
            }
            
        }]);