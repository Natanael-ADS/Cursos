let http = require("http");
//createServer() - abrir o servidor
//listen(8098) - porta para funcionar
http.createServer(function(req,res){
    res.end("Hellow World! welcome to my site");
}).listen(8078);

console.log("Servidor rodando...");