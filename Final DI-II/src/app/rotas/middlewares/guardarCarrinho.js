const carrinho = require('../../models/Carrinho')

const guardarCarrinho = (req, res, next) => {

    if(req.session.carrinho == undefined)
        req.session.carrinho == null;


    req.session.carrinho = carrinho.getCarrinho();
    next();
}

module.exports = guardarCarrinho;