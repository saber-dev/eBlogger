eComm
.controller "loginCtrl", ($scope, $http, $location, AuthentificationService, UserService, SweetAlert) ->

    if AuthentificationService.checkCookies()
      $location.path '/home'

    console.log AuthentificationService.checkCookies()
    $scope.signIn = (formData) ->
      console.log formData.name
      console.log formData.password
      if formData.name and formData.password
          UserService.logIn(formData.name, formData.password)
          .success (data) ->
              promise = AuthentificationService.insertCookies(data[0].name, data[0].id)
              promise
              .then (data) ->
                  $location.path '/home'
              .catch (err) ->
                  console.log ("error")
              $location.path '/home'
          .error (err) ->
              SweetAlert.swal
                  title: "Access Refusé"
                  text:  "Login ou Mot de passe invalide, veuillez vous reconnecter"
                  type:  "error"
