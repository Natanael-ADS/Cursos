unit MConexaoProdutoClimba;


interface
uses
  MProdutoClimba;
type
  TConexaoProdutoClimba = class
    private
    public
      { Public declarations }
      ResultaErrado : string;
      function POST(const produto: TProdutoClimba):TProdutoClimba;
      function GET(const idpreco: string):TProdutoClimba;
  end;

implementation

uses
  Vcl.Dialogs, MConexaoClimba, System.SysUtils;

function TConexaoProdutoClimba.POST(const produto: TProdutoClimba):TProdutoClimba;
var
  jsonStringRetornado:string;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('POST',produto.ToJsonString,'products');
    result := TProdutoClimba.JsonStringParaObjeto(jsonStringRetornado);
  except
    ResultaErrado := jsonStringRetornado;
  end;
end;

function TConexaoProdutoClimba.GET(const idpreco: string): TProdutoClimba;
var
  jsonStringRetornado:string;
begin
  jsonStringRetornado := TConexaoClimba.RequisicaoClimba('POST',EmptyStr,'/products/'+idpreco);
  result := TProdutoClimba.JsonStringParaObjeto(jsonStringRetornado);
end;

end.
