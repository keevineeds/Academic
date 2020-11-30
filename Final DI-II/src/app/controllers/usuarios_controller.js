const Usuarios_dao = require('../db/usuarios_dao');
var db = require('../../config/database');
var md5 = require('md5');

const usuarioDAO = new Usuarios_dao(db);

class UsuariosControllers
{
    validaAcessoUsuario(cpf, senha){
        return new Promise((resolve, reject) =>{
            var senhamd5 = md5(senha);  
            usuarioDAO.selectNaTabelaUsuarios(cpf, senhamd5).then(() => {
                resolve('Usuário autenticado!');
            }, (err) => {
                reject(err);
            })
        })
       
    }
   criarUsuario(cpf, nome, email, senha){
       return new Promise((resolve, reject) => {
        var senhamd5 = md5(senha);
        usuarioDAO.insertNaTabelaUsuario(cpf, nome, email, senhamd5).then(() => {
            resolve('Usuario criado com sucesso!');
        }, (err) => {
            reject(err);
        });
       
       })
   }

}

module.exports = UsuariosControllers;