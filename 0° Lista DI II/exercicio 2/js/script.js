var n1, n2, res;
function somar(){
    n1 = parseFloat(document.getElementById('n1').value);
    n2 = parseFloat(document.getElementById('n2').value);
    if(isNaN(n1) && isNaN(n2)){
        window.alert('Você precisa digitar algum valor primeiro.')
    }
    else{
        if(isNaN(n1) || isNaN(n2)){
            window.alert('Você precisa preencher os dois campos para realizar a soma.')
        }else{
            res = n1 + n2;
            document.getElementById('res').value = res;    
        }
    }
}
function limpar(){
    n1 = 0;
    n2 = 0;
    res = 0;
    document.getElementById('n1').value = '';
    document.getElementById('n2').value = '';
    document.getElementById('res').value = '';
}