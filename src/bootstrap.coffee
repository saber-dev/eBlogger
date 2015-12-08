'use strict'

eComm = angular.module 'eComm', [
  'ngRoute'
  'ngMaterial'
  ]

eComm
.config ($routeProvider) ->
  $routeProvider
      .when '/home',
        templateUrl : 'templates/home.html',
        controller  :  "homeCtrl"
      .when '/login',
        templateUrl : 'templates/login.html',
        controller : 'loginCtrl'
      .otherwise {redirectTo : '/login'}