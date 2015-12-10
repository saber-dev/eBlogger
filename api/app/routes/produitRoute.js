var mysql = require('mysql');
module.exports = function(router, connection) {

// get all products
router.route('/items')
    .get(function(req, res){
        var request = "SELECT * FROM ??";
        var table  = ['item'];
        request = mysql.format(request, table);
        connection.query(fucntion(err, data){
            if(err)
                res.json(err);
            else
                res.json(data);
        });
    });

// post product
    .post(function(req, res) {
        var request = "INSERT INTO ??(??, ??, ??) VALUES(?, ?, ?)";
        var table = ['item', 'name', 'prix', 'marque'];
        request = mysql.format(request, table);
        connection.query(function(err, data) {
            if(err)
                res.json(err);
            else
                res.json(data);
        });
    })

    router.route('items/:id_item')
        // delete product
        .delete(function(err, data){
            var request = "DELETE FROM ?? WHERE ??=?";
            var table = ['item', 'id', req.params.id_item];
            request = mysql.format(request, table);
            connection.query(function(err, data){
                if(err)
                    res.json(err);
                else
                    res.json(data);
            })
        })
        // update prodruct
        .post(function(req, res){
            var request = "UPDATE ?? SET ??=?, ??=?, ??=? WHERE ??=?"
            var table = ['item', 'name', req.body.name, 'prix', req.body.prix, 'marque', marque.body,marque, 'id', req.body.id_item];
            request = mysql.format(request, table);
            connection.mysql(function(err, data){
                if(err)
                    res.json(err);
                else {
                    res.json(data);
                }
            })
        })
        // get 5 products
        router.route('/item')
            .get(function(req, res){
                var request = "SELECT * FROM ?? ORDER BY id DESC LIMIT 5";
                var table = ['item'];
                request = mysql.format(request, table);
                connection.mysql(function(err, data){
                    if(err)
                        res.json(err);
                    else
                        res.json(data);
                })
            });

            // achat d'un produit
            .post(function(req, res){
                var request = "INSERT INTO ??(??) VALUE(?)"
                var table = ['item', 'count', req.body.counter]
            })

}
