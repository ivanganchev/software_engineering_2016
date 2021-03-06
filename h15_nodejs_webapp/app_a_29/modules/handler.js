var fs = require('fs');

exports.provideData = function(filename, headerData, response) {
    console.log('providing', filename);
    fs.exists(filename, function(exists) {
        if (exists) {
            fs.readFile(filename, function(error, data) {
                if (error) {
                    response.writeHead(500);
                    response.end('Internal Server Error');
                } else {
                    response.writeHead(200, headerData);
                    response.end(data);
                }
            });
        } else {
            response.writeHead(404);
            response.end('File not found');
        }
    });
}
