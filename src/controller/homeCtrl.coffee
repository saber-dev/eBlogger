eComm.controller 'homeCtrl', ($scope, $http, $q, AuthentificationService, $location) ->

    if not AuthentificationService.checkCookies()
      $location.path '/login'

    console.log AuthentificationService.checkCookies()

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

    $scope.comment = [{
        face: "http://www.black-feelings.com/uploads/pics/Michael-Jordan1439490799.jpg"
        item: "New york"
        user: "Jordan"
        notes:"Je trouve que Lebron se défend..."
      },{
        face: "http://www.rollingstone.fr/RS-WP-magazine/wp-content/uploads/2015/06/michael1.jpg"
        item: "dublin"
        user: "Jackson"
        notes:"MVP de l'année ? meme de l'uni..."
      }, {
        face: "http://images.lpcdn.ca/641x427/201309/06/739962-justin-timberlake.jpg"
        item: "Minesota"
        user: "Justin"
        notes:"Ce hipster devrait mieux jou..."
      }, {
        face: "http://c.directlyrics.com/img/upload/lana-del-rey-big-eyes.jpg"
        item: "los Angeles"
        user: "Lana"
        notes:"l'eternel fantome qu'est Rick..."
      }, {
        face: "http://assets.potins.net/wp-content/uploads/2015/03/1425393027-f2fdc9012c0db6bcf4c0800ff8113878.jpg"
        item: "Los Angeles"
        user: "Stromae"
        notes: "non pas vraiment il est v..."
      }]

    $scope.lastSell = [{
        face: "http://www.black-feelings.com/uploads/pics/Michael-Jordan1439490799.jpg"
        item: "New york"
        user: "500"
        notes:"Je vend des air jordan"
      },{
        face: "http://www.rollingstone.fr/RS-WP-magazine/wp-content/uploads/2015/06/michael1.jpg"
        item: "dublin"
        user: "200"
        notes:"une playstation 4 encore garantie"
      }, {
        face: "http://images.lpcdn.ca/641x427/201309/06/739962-justin-timberlake.jpg"
        item: "Minesota"
        user: "150"
        notes:"Casque Sony MDR anti-bruit"
      }, {
        face: "http://c.directlyrics.com/img/upload/lana-del-rey-big-eyes.jpg"
        item: "los Angeles"
        user: "60"
        notes:"manette dualshock 3"
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
