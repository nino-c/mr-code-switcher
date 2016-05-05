angular
    .module('Exhibition')
    .controller('FrontPageController', ['$scope', 
        '$location', 
        'CategoryService', 
        function($scope, $location, CategoryService) {
        
        $scope.loading = true;

        $scope.init = function() {
            console.log('FrontPageController scope init');
            $scope.loading = false;
        };


    }]);