'use strict'

angular.module('myMusicApp', ['ngRoute', 'ngResource', 'ngAnimate'])
  .config ["$routeProvider", ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
]