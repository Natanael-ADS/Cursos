unit MConexaoPrecoClimba;

interface
uses
  MPrecoClimba;
type
  TConexaoPrecoClimba = class
    private
    public
      { Public declarations }
      ResultaErrado : string;
      function POST(const preco: TPrecoClimba):TPrecoClimba;
      function GET(const idpreco: string):TPrecoClimba;
  end;

implementation

uses
  Vcl.Dialogs, MConexaoClimba, System.SysUtils;

function TConexaoPrecoClimba.POST(const preco: TPrecoClimba):TPrecoClimba;
var
  jsonStringRetornado:string;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('POST',preco.ToJsonString,'priceLists');
    result := TPrecoClimba.JsonStringParaObjeto(jsonStringRetornado);
  except
    ResultaErrado := jsonStringRetornado;
  end;
end;

function TConexaoPrecoClimba.GET(const idpreco: string): TPrecoClimba;
var
  jsonStringRetornado:string;
begin
  jsonStringRetornado := TConexaoClimba.RequisicaoClimba('POST',EmptyStr,'/priceLists/'+idpreco);
  result := TPrecoClimba.JsonStringParaObjeto(jsonStringRetornado);
end;

end.
