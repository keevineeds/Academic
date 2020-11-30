let carrinho = null; 
let Carrinho_Controller = require('../controllers/carrinho_controller')
let carrinhoCont = new Carrinho_Controller;
class Carrinho{


    static adicionarAoCarrinho(produto){
        return new Promise((resolve, reject) => {
            if(carrinho === null){
                carrinho = {
                    produtos: [],
                    valorTotal: 0
                }
    
            }
    
            Carrinho.jaExiste(produto.idProd).then((resolved) => {
    
                Carrinho.calcularValorTotal(this.getCarrinho(), produto.idProd).then((valor) => {
                    carrinho.valorTotal = valor;
                })
                resolve('Você incrementou a quantidade deste produto!');
                console.log(resolved)
            }, (rejected) => {
    
                carrinho.produtos.push(produto);
    
                Carrinho.retornaFoto(produto.idProd).then((foto) => {
                    produto.fotoProd = foto;
                })
                Carrinho.retornaNome(produto.idProd).then((nome) => {
                    produto.nomeProd = nome;
                })
    
                Carrinho.retornaValorUnitario(produto.idProd).then((valorUnitario) => {
                    produto.valorUnitario = valorUnitario;
                })
    
                Carrinho.calcularValorTotal(this.getCarrinho(), produto.idProd).then((valor) => {
                    carrinho.valorTotal = valor;
                })

                reject('O produto foi adicionado ao carrinho!')
    
            })
        })
        

    }

    static jaExiste(id){
        return new Promise((resolve, reject) => {

            for(let i = 0; i < carrinho.produtos.length; i++){
                if(carrinho.produtos.length <= 0) break;

                if(carrinho.produtos[i].idProd == id){
                    let qtd = carrinho.produtos[i].qtd;
                    qtd = qtd + 1;
                    carrinho.produtos[i].qtd = qtd; 
                    resolve('Você incrementou a quantidade deste produto');
                    break;
                }
            }

            reject('O produto não está no carrinho!');
        })
        
    }

    static retornaNome(id){
        return new Promise((resolve, reject) => {
            carrinhoCont.retornaNome(id).then((nome) => {
                resolve(nome);
            })
        })
    }
    static retornaFoto(id){
        return new Promise((resolve, reject) => {
            carrinhoCont.retornaFoto(id).then((nome) => {
                resolve(nome);
            })
        })
    }
    static retornaValorUnitario(id){
        return new Promise((resolve, reject) => {
            carrinhoCont.retornaValorUnitario(id).then((valorUnit) => {
                resolve(valorUnit);
            })
        })
    }

    static calcularValorTotal(carrinho, id){
        return new Promise((resolve, reject) => {
            carrinhoCont.calcularValorTotal(carrinho, id).then((valor) => {
                resolve(valor)
            }, (rejected) => { 
                console.log(rejected)
            })
        })
       
    }

    static getCarrinho(){
        return carrinho;
    }

    static limparCarrinho(){
        return new Promise((resolve, reject) => {
            carrinho = {
                produtos: [],
                valorTotal: 0
            }
            resolve('O carrinho foi limpo!')
        })

    }
    
}

module.exports = Carrinho;