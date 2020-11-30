const mysql = require('mysql');
const connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '12345',
    database : 'loja',
    insecureAuth : true
});

connection.connect((err) => {

    if (err) 
      console.error('erro na conexão com o banco de dados: ' + err);
    else
      console.log('a conexão foi estabelecida com o banco de dados!');
      
});

module.exports = connection;
