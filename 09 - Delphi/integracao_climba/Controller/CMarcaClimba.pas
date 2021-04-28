unit CMarcaClimba;

interface

uses
  MMarcaClimba, MConexaoMarcaClimba,MUtils,CInterfaceClimba, System.Generics.Collections;

  type
  TCMarcaClimba = class(TInterfacedObject,iControllerClimba)
  private

  public
    Marca: TMarcaClimba;
    Conexao: TConexaoMarcaClimba;
    class function New(): iControllerClimba;
    function Cadastrar(parametros : TDictionary<string,string>): string;
    function Alterar(parametros : TDictionary<string,string>)  : string;
    function Consultar(const id: string)                 : string;
    function ConsultarTodos()                            : string;

    constructor create();
    destructor destroy();

  end;

implementation


{ TCMarcaClimba }

function TCMarcaClimba.Alterar(parametros: TDictionary<string, string>): string;
begin
  try
    Marca.id := parametros.Items['id'];
    Marca.name := parametros.Items['name'];
    result := TUtils.ToJsonString(Conexao.PUT(Marca));
  except
    Result := Conexao.ResultadoErrado;
  end;
end;

function TCMarcaClimba.Cadastrar(parametros : TDictionary<string,string>): string;
begin
  try
    Marca.id := parametros.Items['id'];
    Marca.name := parametros.Items['name'];
    result := TUtils.ToJsonString(Conexao.POST(Marca));
  except
    Result := Conexao.ResultadoErrado;
  end;
end;

function TCMarcaClimba.Consultar(const id: string): string;
begin
  try
    Result := TUtils.ToJsonString(Conexao.GET(id));
  except
    Result := Conexao.ResultadoErrado;
  end;

end;

function TCMarcaClimba.ConsultarTodos: string;
begin
  try
    Result := TUtils.ToJsonString(Conexao.GET_ALL);
  except
    Result := Conexao.ResultadoErrado;
  end;
end;

constructor TCMarcaClimba.create;
begin
  Marca := TMarcaClimba.Create();
  Conexao := TConexaoMarcaClimba.Create();
end;

destructor TCMarcaClimba.destroy;
begin
  Marca.Free;
  Conexao.Free;
end;

class function TCMarcaClimba.New: iControllerClimba;
begin

end;

end.
