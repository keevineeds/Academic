class carrinho_dao{


    constructor(db, id){
        this._db = db;
        this.valores = [];
        this.valorTotal = 0;
        this.id = id;
    }


    calcularValorTotal(carrinho, id){

        return new Promise((resolve, reject) => {
            console.log(carrinho.produtos[0].qtd)
            if(carrinho.produtos.length == 1 && carrinho.produtos[0].qtd == 1){
                this.valorTotal = 0;
            }
            for(var i = 0; i < carrinho.produtos.length; i++){

                let idProd = carrinho.produtos[i].idProd;
                let sql = `select valorUnitario from produto where idProd = '${idProd}';`;

                if(carrinho.produtos[i].idProd == id){
                    this._db.query(sql, (err, results) => {
                        this.valores.push(results[0].valorUnitario);
                        this.valorTotal = this.valorTotal + results[0].valorUnitario;
                        resolve(this.valorTotal)          
                    })
                }
            }
        })  
    }
    
    retornaNome(id){

        return new Promise((resolve, reject) => {
            let sql = `select nomeProd from produto where idProd = '${id}';`;

            this._db.query(sql, (err, results) => {
                resolve(results[0].nomeProd)
            })

        })
    }

    retornaFoto(id){

        return new Promise((resolve, reject) => {
            let sql = `select foto from produto where idProd = '${id}';`;

            this._db.query(sql, (err, results) => {
                resolve(results[0].foto)
            })

        })
    }

    retornaValorUnitario(id){

        return new Promise((resolve, reject) => {
            let sql = `select valorUnitario from produto where idProd = '${id}';`;

            this._db.query(sql, (err, results) => {
                resolve(results[0].valorUnitario)
            })

        })
    }
}

module.exports = carrinho_dao;