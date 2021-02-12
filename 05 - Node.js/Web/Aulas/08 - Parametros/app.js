const express = require("express");
const app = express();
app.get('/hello/onde/:cargo', (req,res) => res.send("Hello I'm here"))

app.get("/hello/:nome", (req,res) => res.send("Hello!, seu nome é "+req.params.nome))

app.get("/:nome/:cargo/:cpf", (req,res) => {
    let text = "<h1>Your name is "+req.params.nome+"</h1>"+
        "<h2> Your profession is "+ req.params.cargo+"</h2>"+
        "<h3> Your identifition is "+req.params.cpf+"</h3>";
    res.send(text);
})

app.listen(8087, () => console.log("Servidor rodando - 08 - Parametros ... https//localhost:8087"))