class Usuarios_dao
{
    constructor(db)
    {
        this._db = db;
    }

    selectNaTabelaUsuarios(cpf, senha) {
       return new Promise((resolve,reject) => {
           
          var sqlConsUsuarios = "SELECT * FROM USUARIO WHERE cpf='" + cpf + "' and senha='" + senha + "'";
          this._db.query(sqlConsUsuarios, function (error, results, fields) {
            if (error) 
                throw error;
            else
            if(results.length > 0){
                resolve(results)
            }else{
                reject('Credenciais incorretas!');
            }
          }) 
       })
    }
    

    insertNaTabelaUsuario(cpf, nome, email, senha){
        return new Promise((resolve, reject) => {

            this.jaExiste(cpf).then(() => {
                var insert = "insert into usuario (cpf, nome, senha, email) values('" + cpf +"', '"
                + nome + "', '" + senha +"', '" + email + "')";

                this._db.query(insert, (error, results) => {
                    if(error) reject(error);
                })
                resolve('Usuario criado com sucesso!');
            }, () => {
                reject('Este CPF já foi cadastrado!');
            })
    
        })
    }
    
    jaExiste(cpf){
        return new Promise((resolve, reject) => { 
        let select = `select * from usuario where cpf = '`+ cpf + `'`;
            this._db.query(select, (error, results, fields) => {
                if(results.length > 0)
                    reject(new Error("CPF já registrado!"));
                else
                    resolve('Usuário criado com sucesso!')
            });
        })    
    }
}

module.exports = Usuarios_dao;