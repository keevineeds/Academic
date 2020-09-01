function verificar(){
    var idade = 0;
    var idade = parseInt(document.getElementById('input').value)

    if(idade >= 18){
        window.alert('Você é maior de idade!')
    }else{
        if(idade < 0){
            window.alert('Sua idade não pode ser negativa.')
        }else{
            if(idade == 0){
                window.alert('Você é menor de idade!')
            }else{
                if(isNaN(idade)){
                    window.alert('Você precisa primeiro me dizer a sua idade.')
                }else{
                    window.alert('Você é menor de idade!')
                }
            }
        }
    }
}