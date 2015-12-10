var mysql = require('mysql');

module.exports = function(router, connection){
    router.route('/users')
        .get(function(req,res){
            var request = "SELECT * from ??";
            var table = ['user'];
            request = mysql.format(request, table);
            connection.query(request, function(err,data){
                if(err)
                    res.json(err);
                else
                    res.json(data)
            });
        })
        .post(function(req, res) {
          var request = "INSERT INTO ?? (??,??) VALUES (?, ?)"
          var table   = ['user', 'name', 'pass', req.body.name, req.body.pass];
          request = mysql.format(request, table);
          connection.query(request, function(err, data) {
              if(err)
                  res.json(err);
              else
                  res.json({"message": "message updated !"});
          });
        });

    router.route('/users/:id_user')
        .get(function(req, res) {
            var request ="SELECT * FROM ?? WHERE ??=?"
            var table = ["user", "id", req.params.id_user];
            request = mysql.format(request, table);
            connection.query(request, function(err, data) {
                if (err)
                  res.json(err);
                else
                  res.json(data);
            });
        })
        //  update a faire
        // .post(function(req, res) {
        //
        // })
};
