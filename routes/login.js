var express = require('express');
var loginRouter = express.Router();
const passport = require('passport');

// LOGIN
loginRouter.get('/', function (req, res) {
  res.render('partials/login/login', {
    title: 'Welcome'
  });
});

loginRouter.post('/login',
  passport.authenticate('local', { failureRedirect: '/' }),
  function(req, res) {
    if (req.user.is_admin) {
      res.redirect('/admin');
    } else if (req.user.user_type == 'faculty') {
      res.redirect('/faculty');
    } else if (req.user.user_type == 'student') {
      res.redirect('/student');
    } else {
      res.redirect('/');
    }
  });

// LOGOUT
loginRouter.get('/logout', function (req, res) {
  req.logout();
  res.redirect('/');
});

module.exports = loginRouter;