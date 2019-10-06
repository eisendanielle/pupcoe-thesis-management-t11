module.exports = (function() {
  'use strict';
  const { Client } = require('pg');
  const User = require('../models/user.js');
  const Class = require('../models/class.js');
  const Committee = require('../models/committee.js');
  const Group = require('../models/group.js');
  const Thesis = require('../models/thesis.js');
  
  var facultyRoute = require ('express').Router();

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

//CLASSES
facultyRoute.get('/',
  function (req, res, next) {
  if (req.isAuthenticated() && req.user.user_type == 'faculty') {
    Class.listByFacultyId(client, req.user.id, function (classes) {
      res.render('partials/faculty/class', {
        classes: classes,
        title: 'Faculty',
        layout: 'faculty'
      });
       });
        } else {
    res.redirect('/')
  }
  });


// CLASS DETAILS
facultyRoute.get('/class/:id',
  (req, res) => {
      if (req.isAuthenticated() && req.user.user_type == 'faculty') {
    Class.getById(client, req.params.id, function (classData) {
      Class.getStudentsByClassId(client, req.params.id, function (classStudents){
      res.render('partials/faculty/class_details', {
        layout: 'faculty',
        classData: classData,
        classStudents: classStudents 
      });
    });
      });
      } else {
    res.redirect('/')
  }
  });







// FACULTY GROUP LIST
facultyRoute.get('/group',
  function (req, res, next) {
      if (req.isAuthenticated() && req.user.user_type == 'faculty') {
      Group.list(client, {}, function (groups) {
        res.render('partials/faculty/groups', {
          layout: 'faculty',
          title: 'Groups',
          groups: groups
        });
      });

    } else {
      res.redirect('/')
    }
  });

//FACULTY ADD GROUP
facultyRoute.get('/group/add_group',
  function (req, res) {
      if (req.isAuthenticated() && req.user.user_type == 'faculty') {
      Class.list(client, 'faculty', function (classes) {
        res.render('partials/faculty/group-add', {
          classes: classes,
          layout: 'faculty',
          title: 'Add Group'
        });
      });
    } else {
      res.redirect('/')
    }
  });


facultyRoute.get('/group/:id',
  function (req, res) {
      if (req.isAuthenticated() && req.user.user_type == 'faculty') {
      Group.getById(client, req.params.id, function (groupData) {
        Group.getStudentsByGroupId(client, req.params.id, function (classStudents) {
        Group.noGroupList(client, 'student', function (user) {
            res.render('partials/faculty/group-list', {
              groups: groupData,
              classStudents: classStudents,
              user: user,
              layout: 'faculty',
              title: 'Add Group'
            });
          });
        });
        });
    } else {
      res.redirect('/')
    }
  });



// FACULTY THESIS LIST
facultyRoute.get('/thesis',
  function (req, res, next) {
      if (req.isAuthenticated() && req.user.user_type == 'faculty') {
        Thesis.checkIfCommittee(client, req.user.id, function(data) {
      Thesis.list(client, {}, function (thesis) {
              Thesis.listCommittee(client, {}, function (committeeApproval) {
        res.render('partials/faculty/thesis', {
          layout: 'faculty',
          title: 'Thesis',
          thesis: thesis,
          committee: data,
          committeeApproval: committeeApproval
        });
      });
});});
    } else {
      res.redirect('/')
    }
  });




// FACULTY ASSIGN HEAD PANELIST
facultyRoute.get('/mor',
  function (req, res, next) {
      if (req.isAuthenticated() && req.user.user_type == 'faculty') {
      // Thesis.listForMor(client, {}, function (thesis) {
        Thesis.listHeadPanel(client, {}, function(head){
        User.list(client, 'faculty', function(faculty){
        res.render('partials/faculty/assign', {
          layout: 'faculty',
          title: 'Thesis',
          thesis: thesis,
          faculty: faculty,
          head: head
      });
      // });
});});
    } else {
      res.redirect('/')
    }
  });

return facultyRoute;
})();

