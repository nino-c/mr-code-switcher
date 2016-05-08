angular
    .module('Exhibition')
    .controller('HomeController', ['$scope',
        function($scope) {

            $scope.showBottom = true;

            $scope.initHome = function() {
                console.log('HomeController scope init');
                console.log("should be ContentController", $scope.$parent);
            };

        }]);
