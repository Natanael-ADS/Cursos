unit CPrecoClimba;

interface
uses
  MPrecoClimba, MConexaoPrecoClimba, MUtils,CInterfaceClimba, System.Generics.Collections;

  type
  TCPrecoClimba = class(TInterfacedObject,iControllerClimba)
  private

  public
    preco: TPrecoClimba;
    conexao: TConexaoPrecoClimba;

    class function New() : iControllerClimba;
    function Cadastrar(parametros : TDictionary<string,string>): string;
    function Alterar(parametros : TDictionary<string,string>)  : string;
    function Consultar(const id: string)                 : string;
    function ConsultarTodos()                            : string;

    function CriarObjeto(id,name:string; preco: Integer): TPrecoClimba;

    constructor create();
    destructor destroy();

  end;

implementation


{ TCPrecoClimba }

function TCPrecoClimba.Alterar(parametros: TDictionary<string, string>): string;
begin
  try
    preco.id := parametros.Items['id'];
    preco.name := parametros.Items['name'];
    result := TUtils.ToJsonString(conexao.PUT(preco));
  except
    Result := conexao.ResultadoErrado;
  end;
end;

function TCPrecoClimba.Cadastrar(parametros : TDictionary<string,string>): string;
begin
  try
    preco.id := parametros.Items['id'];
    preco.name := parametros.Items['name'];
    result := TUtils.ToJsonString(conexao.POST(preco));
  except
    Result := conexao.ResultadoErrado;
  end;
end;

function TCPrecoClimba.Consultar(const id: string): string;
begin
  try
    Result:= TUtils.ToJsonString(conexao.GET(id));
  except
     Result:= conexao.ResultadoErrado;
  end;
end;

function TCPrecoClimba.ConsultarTodos: string;
begin
  try
    Result := TUtils.ToJsonString(conexao.GET_ALL);
  except
    Result:= conexao.ResultadoErrado;
  end;
end;

constructor TCPrecoClimba.create;
begin
  preco := TPrecoClimba.Create('','',0);
  conexao := TConexaoPrecoClimba.Create();
end;

function TCPrecoClimba.CriarObjeto(id,name:string; preco: Integer): TPrecoClimba;
begin
  Result:= TPrecoClimba.Create(id,name,preco);
end;

destructor TCPrecoClimba.destroy;
begin
  preco.Free;
  conexao.Free;
end;

class function TCPrecoClimba.New: iControllerClimba;
begin
   Result:= Self.create
end;

end.
