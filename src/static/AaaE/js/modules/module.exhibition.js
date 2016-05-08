angular.module('Exhibition', [
  'ngRoute',
  'ui.bootstrap',
  'ui.codemirror',
  'ngMaterial',
  'ngMessages',
  'ngResource',
  'ngAnimate',
  'ngCookies',
  'ngSanitize',
  'colorpicker.module',
  'ng.deviceDetector',
  'ngSilent',
  'ngRoute',
  //'mdRadioGroup'
  ])
  .value('ui.config', {
    codemirror: {
      lineWrapping : true,
      lineNumbers: true,
      indentWithTabs: true,
      //theme: "monokai",
      viewportMargin: Infinity,
      mode: 'javascript',
      matchBrackets: true,
      //gutters: ['codemirror-gutters']
    }
  }).config(
    function($mdThemingProvider, $routeProvider, $resourceProvider) {

      $mdThemingProvider.theme('default')
        .primaryPalette('blue-grey')
        .accentPalette('orange')

      $routeProvider
        .when('/', {
          //templateUrl: '/static/AaaE/views/categories.html'
          templateUrl: '/static/AaaE/views/homepage.html'
        })
        .when('/categories/', {
          templateUrl: '/static/AaaE/views/categories.html'
        })
        .when('/paperscript/:id', {
          templateUrl: '/static/AaaE/views/paperscript.html'
        })
        .when('/category/:id/', {
          templateUrl: '/static/AaaE/views/category-list.html'
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
        .otherwise({
          redirectTo: '/'
        })

        $resourceProvider.defaults.stripTrailingSlashes = false;

  })
  .run(function($rootScope, $location, $http, $cookies,
        $timeout, $mdToast, $window, AppService) {

    $http.defaults.headers.common['X-CSRFToken'] = $cookies['csrftoken'];
    $http.defaults.xsrfCookieName = 'csrftoken';
    $http.defaults.xsrfHeaderName = 'X-CSRFToken';

    $rootScope.showBGCanvas = true;
    $rootScope.showAppCanvas = false;
    $rootScope.isAngularApp = true;
    $rootScope.showBottom = false;
    $rootScope.topScope = null;
    $rootScope.currentInstance = {};

    var history = [];
    $rootScope.$on( "$routeChangeStart", function($event, next, current) {

      history.push($location.$$path);

      if ($location.path().indexOf('/instance/') == -1) {
        $rootScope.showAppCanvas = false;
        $rootScope.showBGCanvas = true;
      } else {
        $rootScope.showAppCanvas = true;
        $rootScope.showBGCanvas = false;
      }
      if ($location.path().indexOf('/accounts/') > -1) {
        $rootScope.isAngularApp = false;
      } else $rootScope.isAngularApp = true;


    })

    // root-scope vars
    $rootScope.scriptTypes = [
        'text/javascript',
        'text/coffeescript',
        'text/paperscript'
      ]

    $rootScope.userLoggedIn = isNaN(parseInt($window.USER_ID)) ? false : true;

    $rootScope.$on('$routeChangeSuccess', function() {
        history.push($location.$$path);
        $timeout(function() {
          MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
        }, 500);
    });

    $rootScope.goHome = function() {
      $location.path('/');
      $rootScope.topScope.init();
    }

    $rootScope.back = function () {
        var prevUrl = history.length > 1 ? history.splice(-2)[0] : "/";
        $location.path(prevUrl);
    };

    $rootScope.toast = function(message) {
      $mdToast.show(
        $mdToast.simple()
          .textContent(message)
          .position('top')
        );
    }

    $rootScope.hideXS = $window.innerWidth < 400 ? "display: 'none';" : "";
    //$rootScope.hideShort = $window.innerHeight < 500 ? "display: 'none';" : "";

  });
