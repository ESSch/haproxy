const http = require('http');

function serve(ip, port)
{
    http.createServer(function (req, res) {
        res.writeHead(200, {'Content-Type': 'text/plain'});
        res.end(`There's http://${ip}:${port}\n`);
    }).listen(port, ip);
    console.log(`Run http://${ip}:${port}`);
}

serve('0.0.0.0', 9000);
serve('0.0.0.0', 9001);
serve('0.0.0.0', 9002);
