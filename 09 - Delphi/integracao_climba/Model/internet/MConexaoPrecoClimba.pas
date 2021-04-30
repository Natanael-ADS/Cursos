unit MConexaoPrecoClimba;

interface
uses
  MPrecoClimba;
type
  TConexaoPrecoClimba = class
    private
      jsonStringRetornado:string;
    public
      { Public declarations }
      ResultadoErrado : string;
      function POST(const preco: TPrecoClimba):TPrecoClimba;
      function GET(const idpreco: string):TPrecoClimba;
      function GET_ALL():TPrecoClimbaLista;
      function PUT(const preco: TPrecoClimba):TPrecoClimba;
  end;

implementation

uses
  Vcl.Dialogs, MConexaoClimba, System.SysUtils, MUtils;

function TConexaoPrecoClimba.GET_ALL: TPrecoClimbaLista;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('GET',EmptyStr,'/priceLists');
    Result := TPrecoClimbaLista.JsonStringParaObjeto(jsonStringRetornado);
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoPrecoClimba.POST(const preco: TPrecoClimba):TPrecoClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('POST',preco.ToJsonString,'/priceLists/');
    result := TPrecoClimba.JsonStringParaObjeto(jsonStringRetornado);
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoPrecoClimba.GET(const idpreco: string): TPrecoClimba;
var
  obj: TObject;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('GET',EmptyStr,'/priceLists/'+idpreco);
    Result := TPrecoClimba.JsonStringParaObjeto(jsonStringRetornado);
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoPrecoClimba.PUT(const preco: TPrecoClimba):TPrecoClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('PUT',preco.ToJsonString,'/priceLists/'+preco.id);
    result := TPrecoClimba.JsonStringParaObjeto(jsonStringRetornado);
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

end.
