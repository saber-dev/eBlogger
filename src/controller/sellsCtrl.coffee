eComm
.controller 'sellsCtrl', ($scope) ->
        $scope.testItem = [{
            id: 1
            title: "Material"
            desc:  "Ceci est un test 1"
            img:   "img/material.png"
            link:  "userAccount.getMaterial"
        },{
            id: 2
            title: "Music"
            desc:  "Ceci est un test 2"
            img:   "img/music.png"
            link:  "userAccount.getMusic"
        }]
