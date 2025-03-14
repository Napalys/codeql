// adopted from https://stackoverflow.com/questions/6158933/how-to-make-an-http-post-request-in-node-js

const fs = require('fs');
var http = require('http');

var fileName = "foo.txt";

fs.exists(fileName, function (exists) {
   if (exists) {
    fs.stat(fileName, function (error, stats) {
      var readable = fs.createReadStream(fileName);
      readable.on('readable', () => {
        let chunk = readable.read(); // $ Source[js/file-access-to-http]

        const options = {
          hostname: 'www.google.com',
          port: 80,
          path: '/upload',
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          }
        };

        const req = http.request(options, (res) => {
          res.setEncoding('utf8');
        });
        
        req.write(chunk); // $ Alert[js/file-access-to-http] - write data from file to request body

        req.end(); 
      });

      fs.close(fd);
    });
  }
});