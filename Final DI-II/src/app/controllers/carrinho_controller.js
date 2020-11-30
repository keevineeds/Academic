const carrinho_dao = require('../db/carrinho_dao');
var db = require('../../config/database');
const carrinhoDAO = new carrinho_dao(db);

class carrinho_controller{

    calcularValorTotal(carrinho, id){
        
        return new Promise((resolve, reject) => {
            carrinhoDAO.calcularValorTotal(carrinho, id).then((results) => {
                resolve(results);
            })
        })
    }

    retornaNome(id){
        return new Promise((resolve, reject) => {
            carrinhoDAO.retornaNome(id).then((results) => {
                resolve(results)
            })
        })
    }

    
    retornaFoto(id){
        return new Promise((resolve, reject) => {
            carrinhoDAO.retornaFoto(id).then((results) => {
                resolve(results)
            })
        })
    }

    
    retornaValorUnitario(id){
        return new Promise((resolve, reject) => {
            carrinhoDAO.retornaValorUnitario(id).then((results) => {
                resolve(results)
            })
        })
    }


}

module.exports = carrinho_controller;