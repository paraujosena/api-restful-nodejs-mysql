'use strict';

const mysql = require('mysql'); //local mysql db connectionconst 

var dbConn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'senh@123',
    database: 'node_mysql_crud_db',
    insecureAuth: true
});

dbConn.connect(function(err) {
    if (err) throw err;
    console.log("Database Connected!");
});

module.exports = dbConn;