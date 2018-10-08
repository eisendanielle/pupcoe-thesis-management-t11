const express = require('express');
const path = require('path');
const { Client } = require('pg');
const exphbs = require('express-handlebars');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const flash = require('express-flash');
const session = require('express-session');
const passport = require('passport');
const Strategy = require('passport-local').Strategy;
const bcrypt = require('bcryptjs');
const PORT = process.env.PORT || 5000

const client = new Client({
	database: 'thesisManagement',
	user: 'postgres',
	password: '0910',
	host: 'localhost',
	port: 5432
});

// const client = new Client({
// 	database: 'd75ha57gs1tpts',
// 	user: 'edsjawcarzfsti',
// 	password: 'd2999a94de0b5ee110c2fdd7102287f812ca63a07fbdc54915f35d7a8d52dc54',
// 	host: 'ec2-54-221-225-11.compute-1.amazonaws.com',
// 	port: 5432,
// 	ssl: true
// });

client.connect()
	.then(function () {
		console.log('Connected to database!');
	})
	.catch(function () {
		console.log('Error');
	})

const app = express();
app.use(express.static(path.join(__dirname, 'public')));
app.engine('handlebars', exphbs({ defaultLayout: 'main' }));
app.set('view engine', 'handlebars');

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(passport.initialize());
app.use(passport.session());

app.use(cookieParser('secret'));
app.use(flash());

app.use(session({
	secret: 'This is a secret',
	resave: false,
	saveUninitialized: true,
	cookie: { secure: false }
}));

app.get('/', function (req, res) {
	res.redirect('/login')
});

app.get('/login', function (req, res) {
	res.render('login', {
		layout: 'main'
	});
});

app.get('/dashboard', function (req, res) {
	res.render('dashboard');

});

app.get('/admin', function (req, res) {
	res.render('admin', {

	});
});

app.get('/faculty', function (req, res) {
	res.render('faculty', {

	});
});

app.get('/student', function (req, res) {
	res.render('student', {

	});
});

app.get('/classes', function (req, res) {
	res.render('classes', {

	});
});

app.get('/add_faculty', function (req, res) {
	res.render('add_faculty', {

	});
});

app.get('/add_student', function (req, res) {
	res.render('add_student', {

	});
});

app.get('/add_classes', function (req, res) {
	res.render('add_classes', {

	});
});

app.listen(3000, function () {
	console.log('Server started at port 3000');
});
app.listen(PORT);