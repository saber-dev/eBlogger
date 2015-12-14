var mysql = require('mysql');

module.exports = function(router, connection){
    router.route('/login')
        .post(function(req, res) {
          var request = "SELECT * FROM ?? WHERE ?? = ? AND ?? = ?"
          var table   = ['user', 'name', req.body.name , 'password', req.body.password];
          request = mysql.format(request, table);
          connection.query(request, function(err, data) {
              if(err)
                  res.json({"message": "error unable to find"});
              else
                  res.json(data);
          });
        });
};
