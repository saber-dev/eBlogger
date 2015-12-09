eComm.controller 'homeCtrl', ($scope, $http, $q) ->

    $scope.fb = null
    $scope.twt = null
    $scope.article = null

    data = (url) ->
        $scope.data = null
        $http
            method : 'GET'
            url : url

    promise_fb = data '../api/fbApi.json'
    promise_twt = data '../api/twitterApi.json'
    article = data '../api/fakeArticle.json'

    $q.all [promise_twt, promise_fb, article]
    .then (data) ->
        $scope.twt = data[0].data.length
        $scope.fb = data[1].data.length
        $scope.article = data[2].data
