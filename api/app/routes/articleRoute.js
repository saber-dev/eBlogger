var mysql = require('mysql');

module.exports = function(router, connection) {
// get all article
    router.route('/articles')
        .get(function(req, res) {
            var request = "SELECT * FROM ??";
            var table = ['article'];
            request = mysql.format(request, table);
            connection.query(request, function(err, data) {
                if (err)
                    res.json(err);
                else
                    res.json(data);

            });
        })
        // post article
        .post(function(req, res) {
            var request = "INSERT INTO ??(??,??) VALUES(?,?)";
            // need date.
            var table   = ['article', 'title','content', req.body.title, req.body.content];
            request = mysql.format(request, table);
            connection.query(request, function(err, data) {
                if(err)
                    res.json(err);
                else
                    res.json({"message": "Article created !"});
            });
        })

    // route article avec id
    router.route('/article/:id_article')
        .get(function(req, res) {
            var request = "SELECT * FROM ?? WHERE ??=?";
            var table = ['article', 'id', req.params.id_article];
            request = mysql.format(request, table);
            connection.query(request, function(err, data){
                if(err)
                    res.json(err);
                else
                    res.json(data);
            });
        })
        .delete(function(req, res) {
            var request = "DELETE FROM ?? WHERE ??=?";
            var table = ['article', 'id', req.params.id_article];
            request = mysql.format(request, table);
            connection.query(request, function(err, data){
                if(err)
                    res.json(err);
                else
                    res.json({"message": "article deleted !"});
            });
        })
        // update article
        .post(function(req, res){
            // need date modif so current date
            var request= "UPDATE ?? SET ?? = ?, ?? = ? WHERE ??=?";
            var table = ['article', 'title', req.body.title, 'content', req.body.content];
            request = mysql.format(request, table);
            connection.query(request, function(err, data){
                if(err)
                    res.json(err);
                else
                    res.json(data);
            });
        });
// get 5 article
    router.route('/articleTop')
        .get(function(req, res){
            var request = "SELECT * FROM ?? ORDER BY id DESC LIMIT 5";
            var table = ['article'];
            request = mysql.format(request, table);
            connection.query(request, function(err, data){
                if(err)
                    res.json(err);
                else
                    res.json(data)
            });
        });

};
