angular
	.module('Exhibition')
	.controller('CategoriesController', ['$rootScope', '$scope', 
		'$location', 'CategoryService', 
		function($rootScope, $scope, $location, CategoryService) {
		
		$scope.loading = true;
		$scope.imagelimit = 9;
		
		CategoryService.query().$promise.then(function(cats) {
			_.each(_.range(cats.length), function(i) {
				cats[i].images = _.shuffle(cats[i].images.slice(0,$scope.imagelimit));
			});
			$scope.categories = cats;
			//$scope.updateImageSet();
			$scope.loading = false;
		});

		$scope.updateImageSet = function() {
			//$scope.images = $scope.fullImageSet.slice(0, $scope.imagelimit);
		}

		$scope.selectCategory = function(cat) {
			$location.path('/category/'+cat.id);
		}

		$scope.adjustImageLimit = function(n) {
			$scope.imagelimit = n;
			console.log('imagelimit change', n);

		}

		$scope.onGridLayout = function($event) {
			//console.log($event)
		}
		
		$scope.init = function() {
			console.log('scope init');
		}

		

	}]);