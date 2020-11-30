const app = require('./src/config/express');
const port = 3000;


var db = require('./src/config/database');

app.listen(port, () => {
    console.log('Servidor rodando na porta: ' + port + "!")
})