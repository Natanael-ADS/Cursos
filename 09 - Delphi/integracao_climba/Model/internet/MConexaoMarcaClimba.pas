unit MConexaoMarcaClimba;

interface
uses
  MMarcaClimba;
type
  TConexaoMarcaClimba = class
    private
    public
      { Public declarations }
      ResultaErrado : string;
      function POST(const marca: TMarcaClimba):TMarcaClimba;
      function GET(const idMarca: string):TMarcaClimba;
  end;

implementation

uses
  Vcl.Dialogs, MConexaoClimba, System.SysUtils;

function TConexaoMarcaClimba.POST(const marca: TMarcaClimba):TMarcaClimba;
var
  jsonStringRetornado:string;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('brands','POST',marca.ToJsonString,'brands');
    result := TMarcaClimba.JsonStringParaObjeto(jsonStringRetornado);
  except
    ResultaErrado := jsonStringRetornado;
  end;
end;

function TConexaoMarcaClimba.GET(const idMarca: string): TMarcaClimba;
var
  jsonStringRetornado:string;
begin
  jsonStringRetornado := TConexaoClimba.RequisicaoClimba('/brands/'+idMarca,'POST',EmptyStr,'/brands/'+idMarca);
  result := TMarcaClimba.JsonStringParaObjeto(jsonStringRetornado);
end;

end.
