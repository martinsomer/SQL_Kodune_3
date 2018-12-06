// Module requires
var mssql = require('mssql');

// Config
var config = {
    user: 'testapp',
    password: 'testapp',
    server: '127.0.0.1\\sqlexpress',
    //port: 1433, // Should not set this when connecting to a named instance
    database: 'Kodune',
    connectionTimeout: 5000,
    options: {
        encrypt: false // Needed when connecting to azure managed database
    }
}

// Save connection info
var pool; // Koht, mis salvestab ühenduse info

// Async
(async function() {
    try {
        pool = await mssql.connect(config);
        console.log('Connected to DB');
    } catch (err) {
        // Log errors
        console.log('ERROR: ' + err);
    }
})()

// Query
exports.querySql = function(query, onData, onError) {
    try {
        pool.request()
        .query(query)
        .then(result => {
            // data returns:
            // data.recordsets.length
            // data.recordsets[0].length
            // data.recordset
            // data.returnValue
            // data.output
            // data.rowsAffected
            if (onData !== undefined)
                onData(result);
        })
        .catch(error => {
            if (onError !== undefined)
                onError(error);
        });
    } catch (err) {
        // Log errors
        if (onError !== undefined)
            onError(err);
    }
}

// Log MSSQL errors
mssql.on('error', err => {
    console.log('Error with MSSQL: ' + err);
})