unit CDepartamentoClimba;

interface
uses
  MDepartamentoClimba, MConexaoDepartamentoClimba,MUtils;


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
    DepartamentoClimba := ConexaoDepartamentoClimba.POST(DepartamentoClimba);
    result := TUtils.ToJsonString(DepartamentoClimba);
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
