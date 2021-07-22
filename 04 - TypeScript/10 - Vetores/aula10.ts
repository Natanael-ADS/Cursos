var nomes : string[] = ["Thais","Natanael","Abimael","Isabela"];
var numeros : number[] = [1,2,3,47,-6,5]; 
var qualquerCoisa : any[] = [1,"Isabela",{},false];

console.log(nomes);
console.log(numeros);
console.log(qualquerCoisa);

nomes.push('TheRock');
console.log(nomes.join(", "));