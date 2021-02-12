// IF
var numero : number = 10;
if(numero > 5){
    console.log("numero > 5");
}

// IF, ELSE
var msg: string = "oi";
if(msg !== "Ola"){
    console.log("Oi!");
}else{
    console.log("oooooiiiiiiii!");
}

// IF, ELSE IF, ELSE
var obj : any = {};
obj.nome = "Maria";
obj.idade = 18;
if(obj.status){
    console.log(obj.status);
}else if(obj.idade <20){
    console.log("Maior de idade!");
}else{
    console.log(obj);
}

//SWITCH
let fruta:string = "maçã";
switch(fruta){
    case "abacaxi":{
        console.log("Acertou a fruta é abacaxi!");
        break;
    }
    case "cereja":{
        console.log("cereja" === fruta);
        break;
    }
    default:
        console.log("Fruta não listada: "+fruta);
        break;
}