//Variáveis
//Escopo global, escopo local
//var(escopo global),let(dentro do bloco), const

//var - funciona global
if(true){
    var nome = document.getElementById("titulo")
}
nome.innerHTML = "Natanael"

//let - só funciona quem esta no escopo
if(true){
    let nome = document.getElementById("titulo")
    nome.innerHTML = "Natanael"
}

//const - não pode ser alterado
const idade = 25

idade = 18 //não vai funcionar