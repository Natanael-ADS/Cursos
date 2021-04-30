unit CDepartamentoClimba;

interface
uses
  MDepartamentoClimba, MConexaoDepartamentoClimba,MUtils, CInterfaceClimba, System.Generics.Collections;


  type
  TCDepartamentoClimba = class(TInterfacedObject,iControllerClimba)
  private
  public
    Departamento : TDepartamentoClimba;
    Conexao : TConexaoDepartamentoClimba;

    class function New():iControllerClimba;
    function Cadastrar(parametros: TDictionary<string,string>) : string;
    function Alterar(parametros: TDictionary<string,string>)   : string;
    function Consultar(const id : string)                : string;
    function ConsultarTodos()                            : string;

    constructor create();
    destructor destroy();

  end;

implementation



{ TCDepartamento }

function TCDepartamentoClimba.Alterar(parametros : TDictionary<string,string>): string;
begin
  try
    try
      Departamento.id   := parametros.Items['id'];
      Departamento.name := parametros.Items['name'];
      result            := Conexao.PUT(Departamento).ToJsonString();
    except
      Result := Conexao.ResultadoErrado;
    end;
  finally
    parametros.Clear;
  end;
end;

function TCDepartamentoClimba.Cadastrar(parametros : TDictionary<string,string>): string;
begin
  try
    try
      Departamento.id   := parametros.Items['id'];
      Departamento.name := parametros.Items['name'];
      result            := Conexao.POST(Departamento).ToJsonString();
    except
      Result := Conexao.ResultadoErrado;
    end;
  finally
    parametros.Clear;
  end;
end;

function TCDepartamentoClimba.Consultar(const id: string): string;
begin
  try
    Result := Conexao.GET(id).ToJsonString();
  except
    Result := Conexao.ResultadoErrado;
  end;
end;

function TCDepartamentoClimba.ConsultarTodos: string;
begin
  try
    //Result := TUtils.ToJsonString(Conexao.GET_ALL());
  except
    Result := Conexao.ResultadoErrado;
  end;
end;

constructor TCDepartamentoClimba.create;
begin
  Departamento := TDepartamentoClimba.Create();
  Conexao      := TConexaoDepartamentoClimba.Create();
end;

destructor TCDepartamentoClimba.destroy;
begin
  Departamento.Free;
  Conexao.Free;
end;

class function TCDepartamentoClimba.New: iControllerClimba;
begin
  Result := Self.create();
end;

end.
