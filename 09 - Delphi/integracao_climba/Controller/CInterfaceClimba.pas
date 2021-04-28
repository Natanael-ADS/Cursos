unit CInterfaceClimba;

interface

uses
  System.Generics.Collections;

type
  iControllerClimba = interface
    ['{39240872-6DA2-441B-93D4-6B69C81D463A}']
    function Cadastrar(parametros : TDictionary<string,string>): string;
    function Alterar(parametros : TDictionary<string,string>)  : string;
    function Consultar(const id: string)                 : string;
    function ConsultarTodos()                            : string;
  end;

implementation

end.
