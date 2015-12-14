eComm
.controller 'navBarCtrl', ($scope, SweetAlert, $location, $timeout, $mdSidenav, logOut, $cookies, $http) ->

    idUser   =  $cookies.get 'b80bb7740288fda1f201890375a60c8f'
    $scope.userAccount = null

    getInfo = () ->
      $http
        method: "GET"
        url:    options.api.base_url + "/users/" + idUser
      .success (data) ->
        $scope.userAccount = data[0]
      .error (err) ->
        console.log err

    getInfo()

    $scope.checkAction = (name) ->
        if name == "home"
            goHome()
        if name == "deconnexion"
            logout()
        if name == "Mes emprunts"
            lend()
        if name == "Parametres de compte"
            checkAccount()
        if name == "Les Demandes"
            checkDemandes()
        if name == "échéances"
            checkEcheances()
        if name == "Historique"
            checkHistory()

    $scope.fakeData = [{
        onglet:   'home'
        svg:      'home.svg'
      }, {
        onglet:   'Ajouter un Article'
        svg:      'add.svg'
        id: 1
      }, {
        onglet: 'Mes ventes'
        svg:    'stock.svg'
        function: 'stock'
        id: 2
      },{
        onglet: 'Parametres de compte'
        svg:    'settings.svg'
        id: 3
      }, {
        onglet: 'deconnexion'
        svg:    'logout.svg'
        id: 4
      }]

    goHome = () ->
        $location.path '/home'
    checkAccount = () ->
        $location.path '/account'
    logout = () ->
        logOut.secureLogOut()

    debounce = (func, wait, context) ->
      timer = undefined

      debounced = () ->
        context = $scope
        args    = Array.prototype.slice.call arguments
        $timeout.cancel timer
        timer = $timeout(( ->
          timer = 0
          func.apply context, args
        ),wait || 10)

    buildDelayedToggler = (navID) ->
      debounce(( ->
        $mdSidenav(navID)
        .toggle()
        .then ->
          console.log "toggle " + navID + " is done"
      ), 200)

    $scope.toggleLeft = buildDelayedToggler('left')
