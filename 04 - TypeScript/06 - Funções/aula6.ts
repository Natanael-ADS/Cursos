// funcões
function mensagem(): void {
    console.log("Hello")
}

mensagem()

function soma(x:number,y:number): number {
   return x + y  
}
console.log(soma(5,5))

function exibirMensagem(msg?:string):void{
    if(msg){
        console.log(msg)
    }else{
        console.log("Mensagem teste!!!")
    }
}
exibirMensagem("minha mensagem kkkk...")

var click : any
click = () => console.log("função reduzida!")
click()

var soma1 : any
soma1 = (x:number,y:number) => {
    console.log(x+y)
}
soma1(1,2)