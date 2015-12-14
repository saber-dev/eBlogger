eComm
.factory 'logOut', ($cookies, SweetAlert, AuthentificationService, $location) ->
      secureLogOut: ->
          SweetAlert.swal {
              title: "Deconnexion"
              text:  "Ceci mettra fin à votre session, continuer ?"
              type:  "warning"
              showCancelButton: true
              confirmButtonColor: "#DD6B55"
              confirmButtonText: "Deconnexion"
              cancelButtonText: "Annuler"
              closeOnConfirm: true
              closeOnCancel: true
          }, (isConfirm) ->
            if isConfirm
              if AuthentificationService.checkCookies()
                  $cookies.remove('d56b699830e77ba53855679cb1d252da')
                  $cookies.remove('b80bb7740288fda1f201890375a60c8f')
                  $location.path ('/login')
            else
              console.log "false !"
