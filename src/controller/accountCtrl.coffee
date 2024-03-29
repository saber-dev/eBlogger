eComm
.controller 'accountCtrl', ($scope, AuthentificationService, $location, $cookies, $http, SweetAlert) ->

    $scope.userAccount = null
    if not AuthentificationService.checkCookies()
      $location.path '/login'

    idUser   =  $cookies.get 'b80bb7740288fda1f201890375a60c8f'

    getInfo = () ->
      $http
        method: "GET"
        url:    options.api.base_url + "/users/" + idUser
      .success (data) ->
        $scope.userAccount = data[0]
      .error (err) ->
        console.log err

    getInfo()

    $scope.save = (data, id) ->
        $http
          method: "POST"
          url:    options.api.base_url + "/users/" + id
          data: data
        .success (data) ->
          SweetAlert.swal
              title: "Information mis à jour !"
              text:  "information mis à jour avec success !"
              type:  "success"
        .error (err) ->
              SweetAlert.swal
                  title: "Mise à jour ipossible !"
                  text:  "Impossible de mettre à jour pour le moment les informations."
                  type:  "error"


    $scope.testItem = [{
        id: 1
        title: "Material"
        img: "img/material.png"
        link: "userAccount.getMaterial"
    },{
        id: 2
        title: "Music"
        img: "img/music.png"
        link: "userAccount.getMusic"
    }]
