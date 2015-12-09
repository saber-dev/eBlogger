var mysql = require('mysql');
var express = require('express');
var app = express();
var bodyParser = require('body-parser');

var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'vagrant',
    password : 'vagrant',
    database : 'eblogger',
    debug:     'true'
});

connection.connect(function(err){
    if(err)
        console.log(err);
    else
        console.log("good");
});

app.use(function(req, res, next){
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});

app.use(bodyParser.json({ extended: true }));
app.use(bodyParser.json());

var port = process.env.PORT || 3000;
var router = express.Router();

require('./app/routes/userRoute')(router, connection);
//require('./app/routes/articleRoute')(router,connection);

app.use('/api', router);
app.listen(port);

console.log('MAHEFA TU ME CASSE LA COUILLE :' + port);
