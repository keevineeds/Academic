const redirectHome = (req, res, next) => {
    if(req.session.auth == true){
       res.redirect('/');
    }else{
        next();
    }
}

module.exports = redirectHome;