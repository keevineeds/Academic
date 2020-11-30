const ProdutoController = require('../controllers/produtos_controller')
const UsuarioControlador = require('../controllers/usuarios_controller');
const usuarioCont = new UsuarioControlador();
const produtoCont = new ProdutoController();
const Carrinho = require('../models/Carrinho')
const redirectHome = require('./middlewares/redirectHome')
const redirectLogin = require('./middlewares/redirectLogin')
const guardarCarrinho = require('./middlewares/guardarCarrinho')


module.exports = (app) => {


    app.use((req, res, next) => {
        res.header('Access-Control-Allow-Origin', '*');
        res.header('Access-Control-Allow-Origin', "http://localhost");
        res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
        res.header('Access-Control-Allow-Headers', 'Content-Type');
        next();
    });


app.get('/', guardarCarrinho, (req, res) => {
    produtoCont.selecionarProdutos().then((results) => {
        return results;
    }).then((results) => {
        res.render('index', {
           produto: results,
           auth: req.session.auth,
       })

    })
})

app.get('/login', redirectHome, guardarCarrinho, (req, res) => {
    req.session.auth = false;
    res.render('login', {
        callback: '',
        auth: req.session.auth
    })

})

app.post('/login', redirectHome, guardarCarrinho, (req, res) => {
    usuarioCont.validaAcessoUsuario(req.body.cpf, req.body.senha).then(() => {
        req.session.auth = true;
        res.redirect('/')
    }, (err) => {
        res.render('login', {
            callback: err,
            auth: req.session.auth
        });
        
    });
})

app.get('/cadastro', redirectHome, guardarCarrinho, (req, res) => {
    res.render('cadastro', {
        callback: '',
        auth: req.session.auth
    });
})

app.post('/cadastro', redirectHome, guardarCarrinho, (req, res) => {
    usuarioCont.criarUsuario(req.body.cpf, req.body.nome, req.body.email, req.body.senha)
    .then((resolve) => {
        res.render('cadastro', {
            callback: resolve,
            auth: req.session.auth
        });
    }, (err) => {
        res.render('cadastro', {
            callback: err,
            auth: req.session.auth
        });
    });

});

app.post('/limpar-carrinho', guardarCarrinho, (req, res) => {
    Carrinho.limparCarrinho().then((resolved) => {
        console.log(Carrinho.getCarrinho())
        res.redirect('/carrinho')
    });
})

app.get('/carrinho', guardarCarrinho, (req, res) => {
    console.log(req.session.carrinho)
    res.render('carrinho', {
        carrinho: req.session.carrinho,
        auth: req.session.auth
    })

})

app.post('/carrinho/:id', guardarCarrinho, (req, res) => {
    console.log(Carrinho)
    Carrinho.adicionarAoCarrinho({
        "idProd": req.params.id,
        "fotoProd": '',
        "nomeProd": '',
        "valorUnitario": '',
        "qtd": 1
    }).then((resolved) => {
        res.redirect('/carrinho')
    }, (rejected) => {
        res.redirect('/carrinho')
    })
})

app.get('/produto/:id', guardarCarrinho, (req, res) => {
    let x = req.params.id;

    produtoCont.selecionarProduto(x).then((results) => {
        return results;
    }).then((results) => {
        console.log(results)
        res.render('produto', {
            produto: results,
            auth: req.session.auth
        })
    })
})

app.get('/deslogar', (req, res) => {
    req.session.regenerate((err) => {
        console.log(err)
    })
    req.session.auth = false;
    req.session.carrinho = Carrinho.limparCarrinho();
    res.redirect('/');
})

app.post('/deslogar', (req, res) => {
    req.session.regenerate((err) => {
        console.log(err)
    })
    req.session.auth = false;
    req.session.carrinho = Carrinho.limparCarrinho();
    res.redirect('/');
})

app.get('/checkout', redirectLogin, (req, res) => {
    req.session.carrinho = Carrinho.getCarrinho();
    res.send('<h3>Página de checkout</h3>')
})

/*
ROTA DE TESTE PARA AUTENTICAÇÃO COM MIDDLEWARE

app.get('/auth', redirectLogin, (req, res) => {
    res.send('<h1>Você está autenticado!</h1> <br> <form method="post" action="/deslogar"> <br>  <button type="submit">Deslogar</button> </form> <br> <form method="get" action="/"> <br>  <button type="submit">/</button> </form>');
    
});

*/

}


