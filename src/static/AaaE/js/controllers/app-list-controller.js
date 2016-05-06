angular
    .module('Exhibition')
    .controller('AppListController', ['$scope', 
        '$timeout',
        'AppServiceMinimal', 
        function($scope, $timeout, AppServiceMinimal) {

            $scope.showAppList = false;
            $scope.loading = true;

            AppServiceMinimal.query().$promise.then(function(apps) {
                console.log('apps', apps);
                $scope.apps = apps;
                $scope.loading = false;
                //$scope.showAppList = true;
                //$timeout(function() { $scope.toggleAppList(); });
            });

            $scope.initAppList = function() {
                console.log('AppList scope init');
                //$scope.loading = false;
                $scope.toggleAppList();
            };

            $scope.toggleAppList = function() {
                $scope.showAppList = !$scope.showAppList;
            };
            
        }]);