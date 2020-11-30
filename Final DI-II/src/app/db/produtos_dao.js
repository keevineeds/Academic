class Produtos_dao{

    constructor(db){
        this._db = db;
    }


    selecionarProdutos(){
        return new Promise((resolve, reject) => {
            let s = `select * from produto;`
            this._db.query(s, (error, results, fields) => {
                resolve(results);
            })
        })
    }

    selecionarProdutoPorID(id){
        return new Promise((resolve, reject) => {
            let s = `select * from produto where idProd = ${id};`   
            this._db.query(s, (error, results, fields) => {
                resolve(results);
            })
        })
    }

   deletarProdutoPorID(id){
       return new Promise((resolve, reject) => {
           let d = `delete from produto where idProd = ${id}`
           this._db.query(d, (error) => {
               if(error) reject(error);
               else resolve('Produto deletado com sucesso!');
           })
       })
   }
}

module.exports = Produtos_dao;