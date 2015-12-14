eComm
.factory 'AuthentificationService', ($cookies, $q, $rootScope, md5, $location) ->

    checkCookies: () ->

        userCookie =  $cookies.get 'd56b699830e77ba53855679cb1d252da'
        userRole   =  $cookies.get 'b80bb7740288fda1f201890375a60c8f'

        if userCookie and userRole
            return true
        else
            return false

    insertCookies: (user, id) ->
        deferred = $q.defer()
        today    = new Date()
        expired  = new Date(today)
        expired.setDate(today.getDate() + 1)
        deferred.resolve($cookies.put md5.createHash('login'), md5.createHash(user), { expires: expired }
                         $cookies.put md5.createHash('id'), id, { expires: expired })
        deferred.reject(false)
        return deferred.promise

.factory 'UserService', ($http) ->
    logIn: (username, password) ->
        data = {
                 name:      username
                 password:   password
               }
        $http
            method:  'POST'
            url:     options.api.base_url + '/Login'
            data:    data
            headers: {'Content-type': 'application/json'}
