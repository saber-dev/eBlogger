var mysql = require('mysql');

module.exports = function(router, conenction){
    router.route('/users')
        .get(function(req,res){
            var request = "SELECT * from ??";
            var table = ['user'];
            request = mysql.format(request, table);
            conenction.query(request, function(req,res){
                if(err)
                    res.json(err);
                else
                    res.json(res)
            });
        });
};