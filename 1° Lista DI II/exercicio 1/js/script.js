window.onload = function(){
    var linhas = window.prompt('Digite um valor', linhas);
    var linhas = parseFloat(linhas);
    console.log(linhas);
    var valor = 1;
    let v = "<h1>"
    while (linhas >= 0){
        while(valor <= linhas){
            if(linhas < 10){
                v = v + 0 + linhas + " ";
            }else{
                v = v + linhas + " ";
            }
            document.getElementById('piramide').innerHTML = v;
            valor++;
        }
        valor = 1;
        linhas--;
        v = v + "<br>"
        document.getElementById('piramide').innerHTML = v;
    }
    v = v + "</h1>"
    document.getElementById('piramide').innerHTML = v;
    
}

