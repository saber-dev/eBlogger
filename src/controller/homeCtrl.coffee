eComm.controller 'homeCtrl', ($scope, $http, $q) ->

    $scope.bestSell = [{
      name:  "samsung galaxy s6"
      price: "500"
      img:   "http://www.planetegalaxy.com/wp-content/uploads/2015/03/Samsung-GalaxY-S6-wireless-charging-DSC08674.jpg"
    }, {
      name:  "nexus 6p"
      price: "700"
      img:   "https://cdn0.vox-cdn.com/thumbor/r1aMkufCzf79luAaGCmYakSlIPY=/cdn0.vox-cdn.com/uploads/chorus_asset/file/4178268/nexus-6p-9693.0.jpg"
    }, {
      name:  "huawei p8"
      price: "300"
      img:   "http://2.bp.blogspot.com/-1C1oR-uispo/VZFeRL3k1VI/AAAAAAAAB1o/hwoxO7g_Hlc/s1600/huawei-p8-oficial.png"

    }, {
      name:  "lg g4"
      price: "400"
      img:   "http://2.bp.blogspot.com/-1C1oR-uispo/VZFeRL3k1VI/AAAAAAAAB1o/hwoxO7g_Hlc/s1600/huawei-p8-oficial.png"
    }]

    # $scope.fb = null
    # $scope.twt = null
    # $scope.article = null
    #
    # data = (url) ->
    #     $scope.data = null
    #     $http
    #         method : 'GET'
    #         url : url
    #
    # promise_fb = data '../api/fbApi.json'
    # promise_twt = data '../api/twitterApi.json'
    # article = data '../api/fakeArticle.json'
    #
    # $q.all [promise_twt, promise_fb, article]
    # .then (data) ->
    #     $scope.twt = data[0].data.length
    #     $scope.fb = data[1].data.length
    #     $scope.article = data[2].data
