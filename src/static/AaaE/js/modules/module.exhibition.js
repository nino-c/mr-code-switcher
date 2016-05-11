angular.module('Exhibition', [
  'ngRoute',
  'ui.bootstrap',
  'ui.codemirror',
  //'ui.router',
  'ngMaterial',
  'ngMessages',
  'ngResource',
  'ngAnimate',
  'ngCookies',
  'ngSanitize',
  'colorpicker.module',
  'ng.deviceDetector',
  'ngSilent',
  'ngRoute'
  ])
  .value('ui.config', {
    codemirror: {
      lineWrapping : true,
      lineNumbers: true,
      indentWithTabs: true,
      viewportMargin: Infinity,
      mode: 'javascript',
      matchBrackets: true,
      //theme: "monokai",
      //gutters: ['codemirror-gutters']
    }
}).config(function($mdThemingProvider, $routeProvider, $resourceProvider) {

        $mdThemingProvider.theme('default')
            .primaryPalette('blue-grey')
            .accentPalette('orange');

        // $stateProvider
        //     .state('home', {
        //         url:'',
        //         views: {
        // 			'content': {
        // 				templateUrl: '/static/AaaE/views/homepage.html',
        //                 controller: 'HomeController'
        // 			},
        // 			'bottom': {
        // 				templateUrl: '/static/AaaE/views/bottom-bar.html',
        //                 controller: 'BottomBarController'
        // 			}
        // 		}
        //     })
        //     .state('app', {
        // 		url: 'app-list',
        // 		views: {
        // 			'content': {
        // 				templateUrl: '/static/AaaE/views/app-list-by-popularity.html',
        //                 controller: 'AppListController'
        // 			}
        // 		}
        // 	})

        $resourceProvider.defaults.stripTrailingSlashes = false;

        $routeProvider
            .when('/', {
              templateUrl: '/static/AaaE/views/homepage.html'
            })
            .when('/paperscript/:id', {
              templateUrl: '/static/AaaE/views/paperscript.html'
            })
            .when('/apps-list/', {
              templateUrl: '/static/AaaE/views/app-list-by-popularity.html'
            })
            .when('/apps/new/', {
              templateUrl: '/static/AaaE/views/app-editor.html'
            })
            .when('/apps/:id/', {
              templateUrl: '/static/AaaE/views/app-details.html'
            })
            .when('/apps/:id/edit/', {
              templateUrl: '/static/AaaE/views/app-editor.html'
            })
            .when('/instance/:app_id/:instance_id/', {
              templateUrl: '/static/AaaE/views/app-display.html',
              reloadOnSearch: false
            })
            // .when('/categories/', {
            //   templateUrl: '/static/AaaE/views/categories.html'
            // })
            // .when('/category/:id/', {
            //   templateUrl: '/static/AaaE/views/category-list.html'
            // })
            .otherwise({
              redirectTo: '/'
            })

    })
    .run(function($rootScope, $location, $http, $cookies, $timeout, $mdToast, $window) {

        $http.defaults.headers.common['X-CSRFToken'] = $cookies['csrftoken'];
        $http.defaults.xsrfCookieName = 'csrftoken';
        $http.defaults.xsrfHeaderName = 'X-CSRFToken';

        // $rootScope.showBGCanvas = true;   <--------- now obsolete
        // $rootScope.showAppCanvas = false; <--------- now obsolete
        $rootScope.isAngularApp = true;
        $rootScope.showBottom = false;
        $rootScope.topScope = null;
        $rootScope.currentInstance = {};
        $rootScope.viewname = 'home';

        var history = [];
        $rootScope.$on( "$routeChangeStart", function($event, next, current) {
            history.push($location.$$path);
        });
        $rootScope.$on('$routeChangeSuccess', function() {
            history.push($location.$$path);
        });

        // root-scope vars
        $rootScope.scriptTypes = [
            'text/javascript',
            'text/coffeescript',
            'text/paperscript'
        ];

        $rootScope.userLoggedIn = isNaN(parseInt($window.USER_ID)) ? false : true;

        $rootScope.goHome = function() {
          $location.path('/');
          $rootScope.showBottom = false;
          $rootScope.viewname = 'home';
          $rootScope.topScope.init();
      };

        $rootScope.back = function () {
            var prevUrl = history.length > 1 ? history.splice(-2)[0] : "/";
            $location.path(prevUrl);
        };

        $rootScope.refreshMathJax = function() {
            $timeout(function() {
                MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
            }, 500);
        };

        $rootScope.toast = function(message) {
          $mdToast.show(
            $mdToast.simple()
              .textContent(message)
              .capsule(true)
              .position('top right')
            );
        };

        $window.renderingDone = function() {
            console.log('renderingDone, $rootScope level');
        };

        $rootScope.hideXS = $window.innerWidth < 400 ? "display: 'none';" : "";

  });
