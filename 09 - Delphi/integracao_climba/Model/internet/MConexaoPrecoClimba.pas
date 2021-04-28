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
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('GET',EmptyStr,'priceLists');
    Result := TUtils.JsonStringParaObjeto(jsonStringRetornado) as TPrecoClimbaLista;
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoPrecoClimba.POST(const preco: TPrecoClimba):TPrecoClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('POST',TUtils.ToJsonString(preco),'/priceLists/');
    result := TUtils.JsonStringParaObjeto(jsonStringRetornado) as TPrecoClimba;
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoPrecoClimba.GET(const idpreco: string): TPrecoClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('POST',EmptyStr,'/priceLists/'+idpreco);
    result := TUtils.JsonStringParaObjeto(jsonStringRetornado) as TPrecoClimba;
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoPrecoClimba.PUT(const preco: TPrecoClimba):TPrecoClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('PUT',TUtils.ToJsonString(preco),'/priceLists/'+preco.id);
    result := TUtils.JsonStringParaObjeto(jsonStringRetornado) as TPrecoClimba;
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

end.
