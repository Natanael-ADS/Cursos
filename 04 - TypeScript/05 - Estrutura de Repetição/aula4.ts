//FOR
for(var i : number = 0; i < 10; i++){
    console.log(" i = "+i);
}

//WHILE
var j : number = 0;
while(j<10){
    console.log(" J = "+j);
    j++;
}

//DO WHILE
var k: number = 0
do {
    console.log("k = "+k);
    k++
}while(k ===0);

//FOR IN
var nomes: any = []
nomes = ["Natanael","Thais","Kevin"]
for(var n in nomes){
    console.log("Nome:"+ nomes[n]);
}