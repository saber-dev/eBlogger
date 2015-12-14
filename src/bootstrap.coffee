'use strict'

eComm = angular.module 'eComm', [
  'ngRoute'
  'ngMaterial'
  'oitozero.ngSweetAlert'
  'ngAria'
  'ngSanitize'
  'angular-md5'
  'ngCookies'
  ]

options = {}
options.api = {}
options.api.base_url = 'http://localhost:3000/api'

eComm
.config ($routeProvider) ->
  $routeProvider
      .when '/home',
        templateUrl : 'templates/home.html',
        controller  :  "homeCtrl"
      .when '/login',
        templateUrl : 'templates/login.html',
        controller : 'loginCtrl'
      .when '/account',
        templateUrl : 'templates/account.html',
        controller:   'accountCtrl'
      .otherwise {redirectTo : '/login'}
.run ($rootScope, AuthentificationService, $location, $cookies) ->
  if not AuthentificationService.checkCookies()
      $location.path '/login'
