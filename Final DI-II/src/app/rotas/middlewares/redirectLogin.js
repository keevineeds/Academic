const redirectLogin = (req, res, next) => {
    if(!req.session.auth) {
        res.redirect('/login')
    }else {
        next();
    }
}

module.exports = redirectLogin;