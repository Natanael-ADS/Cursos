const express = require("express");
const app = express();

app.get("/",(req,res) => res.send("Wellcome to my app!"))

app.get("/about",(req,res) => res.send("My page about!"))

app.get("/blog",(req,res) => res.send("Wellcome to my blog!"))

app.listen(8087, () => console.log("Servidor rodando - 07 - Rotas ... https//localhost:8087"))