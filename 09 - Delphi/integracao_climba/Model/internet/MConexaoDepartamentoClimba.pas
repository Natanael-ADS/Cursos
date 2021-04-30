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
      ResultadoErrado : string;
      function POST(const departamento: TDepartamentoClimba):TDepartamentoClimba;
      function GET_ALL(): TObjectList<TDepartamentoClimba>;
      function GET(const id: string): TDepartamentoClimba;
      function PUT(const departamento: TDepartamentoClimba): TDepartamentoClimba;
  end;

implementation

uses
  Vcl.Dialogs, MConexaoClimba, System.SysUtils;

function TConexaoDepartamentoClimba.GET_ALL: TObjectList<TDepartamentoClimba>;
var
  listaObj : TObjectList<TObject>;
  listaDep : TObjectList<TDepartamentoClimba>;
  obj : TObject;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('GET',EmptyStr,'/categories/');
//    listaObj := TUtils.JsonStringParaObjetoList(jsonStringRetornado);
//    listaDep := TObjectList<TDepartamentoClimba>.Create;
//    for obj in listaObj do
//      listaDep.Add(obj as TDepartamentoClimba);
//    result:= listaDep;
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoDepartamentoClimba.POST(const departamento: TDepartamentoClimba):TDepartamentoClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('POST',departamento.ToJsonString(),'/categories/');
    result := TDepartamentoClimba.JsonStringParaObjeto(jsonStringRetornado);
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoDepartamentoClimba.PUT(const departamento: TDepartamentoClimba): TDepartamentoClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('PUT',departamento.ToJsonString(),'/categories/'+departamento.id);
    result := TDepartamentoClimba.JsonStringParaObjeto(jsonStringRetornado);
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoDepartamentoClimba.GET(const id: string): TDepartamentoClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('GET',EmptyStr,'/categories/'+id);
    result := TDepartamentoClimba.JsonStringParaObjeto(jsonStringRetornado);
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

end.
