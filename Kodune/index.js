// Module requires
var express = require('express');
var routes = require('./routes');
var logger = require('morgan');

// Instatiate application instance
var app = express();

// Configure the middleware - in this case Morgan Logger
app.use(logger('dev'));

// Handle URL root
app.get('/', routes.index);

// Application-specific routes
app.get('/api/users', routes.users);
app.get('/api/query1', routes.query1);
app.get('/api/query2', routes.query2);
app.get('/api/query3', routes.query3);

// Default route when nothing else was found
app.get('*', routes.default);

// Initialize the server
var server = app.listen(3000, function() {
    console.log('Listening on port 3000');
});