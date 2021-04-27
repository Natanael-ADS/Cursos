unit MConexaoDepartamentoClimba;

interface
uses
  MDepartamentoClimba,System.Generics.Collections,MUtils;
type
  TConexaoDepartamentoClimba = class
    private
      jsonStringRetornado: string;
    public
      { Public declarations }
      ResultaErrado : string;
      function POST(const departamento: TDepartamentoClimba):TDepartamentoClimba;
      function GET_ALL(): TObjectList<TDepartamentoClimba>;
      function GET(const idDepartamento: string):TDepartamentoClimba;
  end;

implementation

uses
  Vcl.Dialogs, MConexaoClimba, System.SysUtils;

function TConexaoDepartamentoClimba.GET_ALL: TObjectList<TDepartamentoClimba>;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('POST',EmptyStr,'categories');
    result := TUtils.JsonStringParaObjeto(jsonStringRetornado) as TObjectList<TDepartamentoClimba>;
  except
    ResultaErrado := jsonStringRetornado;
  end;
end;

function TConexaoDepartamentoClimba.POST(const departamento: TDepartamentoClimba):TDepartamentoClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('POST',TUtils.ToJsonString(departamento),'categories');
    result := TUtils.JsonStringParaObjeto(jsonStringRetornado) as TDepartamentoClimba;
  except
    ResultaErrado := jsonStringRetornado;
  end;
end;

function TConexaoDepartamentoClimba.GET(const idDepartamento: string): TDepartamentoClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('GET',EmptyStr,'/categories/'+idDepartamento);
    result := TUtils.JsonStringParaObjeto(jsonStringRetornado) as TDepartamentoClimba;
  except
    ResultaErrado := jsonStringRetornado;
  end;
end;

end.
