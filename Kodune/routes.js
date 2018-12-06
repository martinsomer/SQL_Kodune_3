// Module requires
var sql = require('./sql');

// Index page
exports.index = function(req, res) {
    res.send('Hello');
}

// Default
exports.default = function(req, res) {
    res.status(404).send('Invalid route');
}

// Query for displaying users
exports.users = function(req, res) {
    var query = 'SELECT * FROM dbo.[User]';
    var result = sql.querySql(query, function(data) {
    if (data !== undefined)
    {
    console.log('DATA rowsAffected: ' + data.rowsAffected);
    res.send(data.recordset);
    }
    }, function(err) {
    console.log('ERROR: ' + err);
    res.status(500).send('ERROR: ' + err);
    });
}

// Custom query 1
exports.query1 = function(req, res) {
    var query =
        'SELECT TOP 10 ' +
            'UserID, ' +
            'TotalRating ' +
        'FROM ' +
            'Kodune.dbo.Rating ' +
        'ORDER BY Kodune.dbo.Rating.TotalRating DESC';
    
    var result = sql.querySql(query, function(data) {
        if (data !== undefined)
        {
            console.log('DATA rowsAffected: ' + data.rowsAffected);
            res.send(data.recordset);
        }
    }, function(err) {
        console.log('ERROR: ' + err);
        res.status(500).send('ERROR: ' + err);
    });
}

// Custom query 2
exports.query2 = function(req, res) {
    var query =
        'SELECT ' +
            'UserID, ' +
            'Username, ' +
            'CommentText ' +
        'FROM ' +
            'Kodune.dbo.Comment ' +
        'INNER JOIN Kodune.dbo.[User] ' +
        'ON Kodune.dbo.Comment.UserID = Kodune.dbo.[User].ID ' +
        'WHERE ' +
            'UserID = ( ' +
                'SELECT TOP 1 ' +
                    'UserID ' +
                'FROM ' +
                    'Kodune.dbo.Comment ' +
                'GROUP BY UserID ' +
                'ORDER BY COUNT(UserID) DESC ' +
            ')';
    
    var result = sql.querySql(query, function(data) {
        if (data !== undefined)
        {
            console.log('DATA rowsAffected: ' + data.rowsAffected);
            res.send(data.recordset);
        }
    }, function(err) {
        console.log('ERROR: ' + err);
        res.status(500).send('ERROR: ' + err);
    });
}

// Custom query 3
exports.query3 = function(req, res) {
    var query =
        'SELECT ' +
            'UserID, ' +
            'Username, ' +
            'TotalRating ' +
        'FROM ' +
            'Kodune.dbo.Rating ' +
        'INNER JOIN Kodune.dbo.[User] ' +
        'ON Kodune.dbo.Rating.UserID = Kodune.dbo.[User].ID ' +
        'WHERE TotalRating > ( ' +
            'SELECT ' +
                'DISTINCT(AVG(TotalRating) OVER()) ' +
                'FROM Kodune.dbo.Rating ' +
        ') ' +
        'ORDER BY TotalRating ASC';
    
    var result = sql.querySql(query, function(data) {
        if (data !== undefined)
        {
            console.log('DATA rowsAffected: ' + data.rowsAffected);
            res.send(data.recordset);
        }
    }, function(err) {
        console.log('ERROR: ' + err);
        res.status(500).send('ERROR: ' + err);
    });
}
