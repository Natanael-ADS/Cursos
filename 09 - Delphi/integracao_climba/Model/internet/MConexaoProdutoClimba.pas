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
    result := TUtils.JsonStringParaObjeto(jsonStringRetornado) as TListaProdutoClimba;
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoProdutoClimba.POST(const produto: TProdutoClimba):TProdutoClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('POST',TUtils.ToJsonString(produto),'products');
    result := TUtils.JsonStringParaObjeto(jsonStringRetornado) as TProdutoClimba;
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoProdutoClimba.GET(const idpreco: string): TProdutoClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('POST',EmptyStr,'/products/'+idpreco);
    result := TUtils.JsonStringParaObjeto(jsonStringRetornado) as TProdutoClimba;
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoProdutoClimba.PUT(const produto: TProdutoClimba):TProdutoClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('PUT',TUtils.ToJsonString(produto),'/products/'+produto.Id);
    result := TUtils.JsonStringParaObjeto(jsonStringRetornado) as TProdutoClimba;
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

end.
