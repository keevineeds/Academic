var criptografia = new Object();

criptografia = {
    msg: '',
    cr1: '',
    cr2: '',
    op: 0,

    criptografar(){
        switch (this.op){
            case 1:
                this.cr1 = this.msg.replace(/F/gi, '@').replace(/E/gi, '$').replace(/I/gi, '#').replace(/O/gi, '*').replace(/U/gi, '&')
                .replace(/G/gi, '5').replace(/B/gi, ')').replace(/G/gi, '(').replace(/X/gi, '7').replace(/Q/gi, '^').replace(/J/gi,'`´')
                .replace(/A/gi, '~').replace(/K/gi, ';').replace(/V/gi, '/').replace(/T/gi, '+').replace(/D/gi, '-')
                break;
            case 2:
                this.cr2 = this.msg.replace(/T/gi, '@').replace(/K/gi, '$').replace(/G/gi, '#').replace(/I/gi, '*').replace(/O/gi, '&')
                .replace(/U/gi, '5').replace(/A/gi, ')').replace(/E/gi, '(').replace(/V/gi, '7').replace(/D/gi, '^').replace(/J/gi,'`´')
                .replace(/F/gi, '~').replace(/B/gi, ';').replace(/X/gi, '/').replace(/R/gi, '+').replace(/Q/gi, '-')
                break;
            default: 
                window.alert('Operador inválido!')
        }
    }
}
function inserirVisor(v){
    document.getElementById('visor').value += v;
}
function limparVisor(){
    document.getElementById('visor').value = null;
    criptografia.msg = '';
    console.log("O visor foi limpo!");
}
function inserirOp(v){
    criptografia.op = v;
    criptografia.msg = document.getElementById('visor').value;
    console.log("O operador " + criptografia.op + " foi inserido!")
    criptografia.criptografar();
    if(criptografia.op == 1){
        document.getElementById('visor').value = criptografia.cr1;
    }else{
        document.getElementById('visor').value = criptografia.cr2;
    }
}