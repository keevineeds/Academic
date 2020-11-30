window.onload = function() {
    
    var mascaraCPF = function (v) {
        return v.replace(/\D/g, '').length === 11 ? '000.000.000-00' : '000.000.000-00';
    },
    options = {
        onKeyPress: function (v, e, field, options) {
            field.mask(mascaraCPF.apply({}, arguments), options);
        }
    };
    $('#cpf').mask(mascaraCPF, options);
};

