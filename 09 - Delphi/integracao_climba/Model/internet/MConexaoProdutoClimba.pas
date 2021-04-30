unit MConexaoProdutoClimba;


interface
uses
  MProdutoClimba;
type
  TConexaoProdutoClimba = class
    private
      jsonStringRetornado:string;
    public
      { Public declarations }
      ResultadoErrado : string;
      function POST(const produto: TProdutoClimba):TProdutoClimba;
      function GET(const idpreco: string):TProdutoClimba;
      function GET_ALL(): TListaProdutoClimba;
      function PUT(const produto: TProdutoClimba):TProdutoClimba;
  end;

implementation

uses
  Vcl.Dialogs, MConexaoClimba, System.SysUtils, MUtils;

function TConexaoProdutoClimba.GET_ALL: TListaProdutoClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('GET',EmptyStr,'products');
    //result := TListaProdutoClimba.JsonStringParaObjeto(jsonStringRetornado);
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoProdutoClimba.POST(const produto: TProdutoClimba):TProdutoClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('POST',produto.ToJsonString,'products');
    result := TProdutoClimba.JsonStringParaObjeto(jsonStringRetornado);
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoProdutoClimba.GET(const idpreco: string): TProdutoClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('GET',EmptyStr,'/products/'+idpreco);
    result := TProdutoClimba.JsonStringParaObjeto(jsonStringRetornado);
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoProdutoClimba.PUT(const produto: TProdutoClimba):TProdutoClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('PUT',produto.ToJsonString,'/products/'+produto.Id);
    result := TProdutoClimba.JsonStringParaObjeto(jsonStringRetornado);
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

end.
