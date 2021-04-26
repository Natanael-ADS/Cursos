unit CDepartamentoClimba;

interface
uses
  MDepartamentoClimba, MConexaoDepartamentoClimba;


  type
  TCDepartamentoClimba = class
  private

  public
    DepartamentoClimba : TDepartamentoClimba;
    ConexaoDepartamentoClimba : TConexaoDepartamentoClimba;
    function CadastrarDepartamento(id, nome: string): string;
    constructor create();
    destructor destroy();

  end;

implementation



{ TCDepartamento }

function TCDepartamentoClimba.CadastrarDepartamento(id, nome: string): string;
begin
  try
    DepartamentoClimba.id     := id;
    DepartamentoClimba.name   := nome;
    result := ConexaoDepartamentoClimba.POST(DepartamentoClimba).ToJsonString;
  except
    Result := ConexaoDepartamentoClimba.ResultaErrado;
  end;
end;

constructor TCDepartamentoClimba.create;
begin
  DepartamentoClimba        := TDepartamentoClimba.Create();
  ConexaoDepartamentoClimba := TConexaoDepartamentoClimba.Create();
end;

destructor TCDepartamentoClimba.destroy;
begin
  DepartamentoClimba.Free;
  ConexaoDepartamentoClimba.Free;
end;

end.
