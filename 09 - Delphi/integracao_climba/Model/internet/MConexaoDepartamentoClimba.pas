unit MConexaoDepartamentoClimba;

interface
uses
  MDepartamentoClimba;
type
  TConexaoDepartamentoClimba = class
    private
    public
      { Public declarations }
      ResultaErrado : string;
      function POST(const departamento: TDepartamentoClimba):TDepartamentoClimba;
      function GET(const idDepartamento: string):TDepartamentoClimba;
  end;

implementation

uses
  Vcl.Dialogs, MConexaoClimba, System.SysUtils;

function TConexaoDepartamentoClimba.POST(const departamento: TDepartamentoClimba):TDepartamentoClimba;
var
  jsonStringRetornado:string;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('categories','POST',departamento.ToJsonString,'categories');
    result := TDepartamentoClimba.JsonStringParaObjeto(jsonStringRetornado);
  except
    ResultaErrado := jsonStringRetornado;
  end;
  
end;

function TConexaoDepartamentoClimba.GET(const idDepartamento: string): TDepartamentoClimba;
var
  jsonStringRetornado:string;
begin
  jsonStringRetornado := TConexaoClimba.RequisicaoClimba('/categories/'+idDepartamento,'POST',EmptyStr,'/categories/'+idDepartamento);
  result := TDepartamentoClimba.JsonStringParaObjeto(jsonStringRetornado);
end;

end.
