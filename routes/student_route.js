module.exports = (function() {
  'use strict';
  const { Client } = require('pg');
  const User = require('../models/user.js');
  const Class = require('../models/class.js');
  const Group = require('../models/group.js');
  const Thesis = require('../models/thesis.js');

  var studentRoute = require ('express').Router();

const client = new Client({
  database: 'dan6pe0eib3rj6',
  user: 'oxphibnhubcnqv',
  password: '0ba8df8a5fb529a2b47b14fc80635e3708a6c92ca4d5d449f8601f4c1515b587',
  host: 'ec2-50-19-222-129.compute-1.amazonaws.com',
  port: 5432,
  ssl: true
});
  client.connect()
  .then(function () {
  })
  .catch(function () {
  });

//STUDENT PROFILE
studentRoute.get('/',
  function (req, res, next) {
  if (req.isAuthenticated() && req.user.user_type == 'student') {
    Class.getByStudentId(client, req.user.id, function(data) {
      Group.getStudentsGroupDetails(client, req.user.id, function(group) {
      res.render('partials/student/profile', {
        group: group[0].group_id,
        data: data,
        title: 'Profile',
        layout: 'student' 
      });
    });
  });
  } else {
    res.redirect('/')
  }
  });

//STUDENT SUBMIT THESIS FORM
studentRoute.get('/submit_abstract',
  function (req, res, next) {
  if (req.isAuthenticated() && req.user.user_type == 'student') {
    Group.listGroups(client, {}, function(data) {
      res.render('partials/student/submit_abstract', {
        data: data,
        title: 'Submit Abstract',
        layout: 'student'
      });
      });
  } else {
    res.redirect('/')
  }
  });

//STUDENT SUBMIT THESIS FORM
studentRoute.get('/choose',
  function (req, res, next) {
  if (req.isAuthenticated() && req.user.user_type == 'student') {
    Group.listGroups(client, {}, function(data) {
      Thesis.listAll(client, {}, function(thesis) {
        res.render('partials/student/choose', {
          data: data,
          title: 'Submit Abstract',
          layout: 'student',
          thesis: thesis
       });
      });
    });
  } else {
    res.redirect('/')
  }
  });

return studentRoute;
})();