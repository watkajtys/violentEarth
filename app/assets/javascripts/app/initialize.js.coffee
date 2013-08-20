@quake = angular.module('quake', ['ngRoute', 'ngResource', 'ngAnimate'])


@quake.config(($routeProvider, $locationProvider) ->
   $locationProvider.html5Mode(true)

   $routeProvider
      .when("/", {templateUrl: "quakes/home", controller: "QuakesController"})
      .otherwise({templateUrl: "Page not found. Something got fucked up."})
)

@quake.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest"
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
]

@quake.run(['$window', '$templateCache', ($window, $templateCache) -> 
   $templateCache.put(name, templateFunction) for name, templateFunction of $window.JST
])