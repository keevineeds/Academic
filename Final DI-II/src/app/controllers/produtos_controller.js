const Produtos_dao = require('../db/produtos_dao.js');
let db = require('../../config/database');
const produtoDAO = new Produtos_dao(db);


class produtos_controller{

    selecionarProdutos(){
        return new Promise((resolve, reject) => {
            produtoDAO.selecionarProdutos().then((results) => {
                resolve(results);
            })
        })
    }

    selecionarProduto(id){
        return new Promise((resolve, reject) => {
            produtoDAO.selecionarProdutoPorID(id).then((results) =>{
                resolve(results);
            })
        })
    }

    inserirProduto(desc, numFoto, valor){
        return new Promise((resolve, reject) => {
            produtoDAO.inserirTabelaProduto(desc, numFoto, valor).then(() => {
                resolve('Produto inserido com sucesso!');
            }, (err) => {
                reject('Ocorreu um erro ao inserir o produto: ' + err)
            })
        })
    }
    deletarProduto(id){
        return new Promise((resolve, reject) => {
            produtoDAO.deletarProdutoPorID(id).then(() => {
                resolve('Produto deletado com sucesso!');
            }, (err) => {
                reject('Ocorreu um erro ao deletar seu produto: ' + err);
            })
        })
    }


}

module.exports = produtos_controller;