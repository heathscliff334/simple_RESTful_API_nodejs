const mysql = require('mysql');

// configure connection
const conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'db_online_cv',
    multipleStatements: true
});

// database connection
conn.connect((err) =>{if(err) throw err; 
    console.log('MySQL Connected');
});
module.exports = conn;