var aluno = new Object();

aluno = {
    ra: null,
    nome: '',
    idade: null, 


    verificarDados(){

        // verifica o RA
        if(this.ra.length == 0){
            throw new Error('Você precisa digitar o RA do aluno.')
        }else{
            if(ra.length > 5){
                throw new Error('O RA não pode ser maior que 5 caracteres.')
            }else{
                if(isNaN(this.ra)){
                    throw new Error('O campo RA pode conter apenas números')
                }
            }
        }

        // verifica o nome
        if(this.nome.length > 20){
            throw new Error('O nome do aluno não pode ser maior que 20 caracteres.')
        }else{
            if(this.nome.length <= 0){
                throw new Error('Você precisa digitar o nome do aluno.')
            }
        }

        //verifica a idade
        if(this.idade.length > 2){
            throw new Error('A idade do aluno deve ter até 2 caracteres.')
        }else{
            if((this.idade.length <= 0) || (isNaN(this.idade))){
                throw new Error('Você precisa digitar a idade do aluno.')
            }
        }
    },

    inserirDados(){
        this.ra = parseInt(document.getElementById('ra').value)
        this.nome = document.getElementById('nome').value
        this.idade = parseInt(document.getElementById('idade').value)
        console.log(this.ra, this.nome, this.idade)

        try{
            this.verificarDados();
            alert('O aluno ' + this.nome + ' do RA ' + this.ra + ' tem ' + this.idade + " anos.")
        }catch(err){
            alert(err.message)
        }finally{
            document.getElementById('ra').value = '';
            document.getElementById('nome').value = '';
            document.getElementById('idade').value = '';
        }
    }
    
}

enviarDados = function(){
    aluno.inserirDados()
}