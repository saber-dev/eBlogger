var mysql = require('mysql');

module.exports = function(router, connection){
    router.route('/users')
        .get(function(req,res){
            var request = "SELECT * from ??";
            var table = ['user_info'];
            request = mysql.format(request, table);
            connection.query(request, function(err,data){
                if(err)
                    res.json(err);
                else
                    res.json(data)
            });
        })
        .post(function(req, res) {
          var request = "INSERT INTO ?? (??, ??, ??, ??, ??, ??, ??, ??, ??) \
                         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
          var table   = ['user_info', 'name', 'firstname', 'email', 'tel', 'city', 'postalCode', 'id_user', 'address', 'imgUrl',
                         req.body.name, req.body.firstname, req.body.email, req.body.tel, req.body.city, req.body.postalCode, req.body.id_user, req.body.address, req.body.imgUrl];
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
            var table = ["user_info", "id_user", req.params.id_user];
            request = mysql.format(request, table);
            connection.query(request, function(err, data) {
                if (err)
                  res.json(err);
                else
                  res.json(data);
            });
        })
        .post(function(req, res) {
            var request = "UPDATE ?? \
                          SET \
                          ??=?, ??=?, ??=?, ??=?, \
                          ??=?, ??=?, ??=?, ??=? \
                          WHERE ?? =?"
            var table   = ["user_info",
                          "name", req.body.name, "firstname", req.body.firstname, "email", req.body.email, "tel", req.body.tel, "imgUrl", req.body.imgUrl,
                          "city", req.body.city, "postalCode", req.body.postalCode, "address", req.body.address, "id", req.params.id_user];
            request = mysql.format(request, table);
            connection.query(request, function(err, data) {
                if(err)
                  res.json(err);
                else {
                  res.json({"message": "update done !"});
                }
            });
        })
        .delete(function(req, res) {
            var request = "DELETE FROM ?? WHERE ??=?"
            var table   = ["user_info", "id", req.params.id_user];
            request = mysql.format(request, table);
            connection.query(request, function(err, data) {
                if(err)
                  res.json(err);
                else {
                  res.json({"message": "message deleted !"})
                }
            });
        });
};
