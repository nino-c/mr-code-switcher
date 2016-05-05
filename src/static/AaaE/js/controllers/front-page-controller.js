angular
    .module('Exhibition')
    .controller('FrontPageController', ['$rootScope', '$scope', 
        '$location', 'CategoryService', 
        function($rootScope, $scope, $location, CategoryService) {
        
        $rootScope.topScope = $scope;
        $scope.loading = true;

        
        // CategoryService.query().$promise.then(function(cats) {
        //     _.each(_.range(cats.length), function(i) {
        //         cats[i].images = _.shuffle(cats[i].images.slice(0,$scope.imagelimit));
        //     });
        //     $scope.categories = cats;
        //     //$scope.updateImageSet();
        //     $scope.loading = false;
        // });

        // $scope.updateImageSet = function() {
        //     //$scope.images = $scope.fullImageSet.slice(0, $scope.imagelimit);
        // }

        // $scope.selectCategory = function(cat) {
        //     $location.path('/category/'+cat.id);
        // }

       
        $scope.init = function() {
            console.log('scope init');
            $scope.loading = false;
        }

        

    }]);