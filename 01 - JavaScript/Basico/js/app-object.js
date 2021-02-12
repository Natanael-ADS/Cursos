let pessoa = {
    nome:"Natanael",
    idade:26,
    crente: true,
    pets:["xboxOne","Tv55"],
    carro:{
        ferrari:{
            modelo:"OhCaro",
            placa:{
                numero:1111112312
            }
        },
        uno:{
            modelo:"OhCaro",
            placa:{
                numero:1111112312
            }
        }   
    },
    andar: function(km){
        alert(this.nome+" andou "+km+" km")
    }
}

pessoa.idade = 27
pessoa.pets[0] = "PS4"

pessoa.andar(15)
console.log(pessoa)