// funcões
function mensagem() {
    console.log("Hello");
}
mensagem();
function soma(x, y) {
    return x + y;
}
console.log(soma(5, 5));
function exibirMensagem(msg) {
    if (msg) {
        console.log(msg);
    }
    else {
        console.log("Mensagem teste!!!");
    }
}
exibirMensagem("minha mensagem kkkk...");
var click;
click = function () { return console.log("função reduzida!"); };
click();
var soma1;
soma1 = function (x, y) {
    console.log(x + y);
};
soma1(1, 2);
