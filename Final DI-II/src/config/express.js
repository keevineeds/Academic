
const mysql = require('mysql')
const express = require('express');
const app = express();
const bodyParser = require('body-parser')
const path = require('path');
const session = require('express-session')


/* configuração da sessão com o banco de dados */

let MySQLStore = require('express-mysql-session')(session);
var options = {
    host: 'localhost', /* USAR O MESMO USUÁRIO DO BANCO DE DADOS PRINCIPAL */
    user: 'root',       /* A SESSÃO CRIARÁ UMA TABELA AUTOMATICAMENTE PARA OS IDS DA SESSÃO*/
    password: '12345',
    database: 'loja',
    schema: {
        tableName: 'custom_session_table_name',
        columnNames: {
            session_id: 'custom_session_id',
            expires: 'custom_expires_column_name',
            data: 'custom_data_column_name'
        }
    }
}
let connection = mysql.createConnection(options);
let sessionStore = new MySQLStore({}, connection);
app.use(session({
    key: 'session_cookie_name',
    secret: 'session_cookie_secret',
    store: sessionStore,
    resave: false,
    saveUninitialized: false,
    auth: false,
    carrinho: '',

    cookie: {
        maxAge: 1000 * 60 * 60 * 24,
    }
}));

/* -------FIM DA CONFIGURAÇÃO DA SESSÃO-------- */

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use('/static',express.static('src/app/views'));
app.set('views', path.join(__dirname,'../app/views'));
app.set('view engine', 'ejs');


const rotas = require('../app/rotas/rotas');
rotas(app);

module.exports = app;





