var piramide = new Object();
piramide = {
    linhas: 0, 
    contador: 1,
    v: '<h3>',
     
    montarPiramide(){
        while(this.linhas >= 0){
            while(this.contador <= this.linhas){
                if(this.linhas < 10){
                    this.v = this.v + 0 + this.linhas + " ";
                }else{
                    this.v = this.v + this.linhas + " ";
                }
                this.contador++;
            }
            this.contador = 1;
            this.linhas--;
            this.v = this.v + "<br>"
        }
        this.v = this.v + '</h3>'
        document.getElementById('piramide').innerHTML = this.v;
        console.log(this.v)
    }
}

window.onload = function(){
    piramide.linhas = window.prompt('Digite um valor', parseFloat(piramide.linhas))
    piramide.montarPiramide();
}
