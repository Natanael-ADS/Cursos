unit MConexaoMarcaClimba;

interface
uses
  MMarcaClimba,MUtils, System.Generics.Collections;
type
  TConexaoMarcaClimba = class
    private
      jsonStringRetornado: string;
    public
      { Public declarations }
      ResultadoErrado : string;
      function POST(const marca: TMarcaClimba):TMarcaClimba;
      function GET(const idMarca: string):TMarcaClimba;
      function GET_ALL():TMarcaClimbaLista;
      function PUT(const marca: TMarcaClimba):TMarcaClimba;
  end;

implementation

uses
  Vcl.Dialogs, MConexaoClimba, System.SysUtils;

function TConexaoMarcaClimba.GET_ALL: TMarcaClimbaLista;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('GET',EmptyStr,'/brands/');
    result := TUtils.JsonStringParaObjeto(jsonStringRetornado) as TMarcaClimbaLista;
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoMarcaClimba.POST(const marca: TMarcaClimba):TMarcaClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('POST',TUtils.ToJsonString(marca),'/brands/');
    result := TUtils.JsonStringParaObjeto(jsonStringRetornado) as TMarcaClimba;
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoMarcaClimba.GET(const idMarca: string): TMarcaClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('GET',EmptyStr,'/brands/'+idMarca);
    result := TUtils.JsonStringParaObjeto(jsonStringRetornado) as TMarcaClimba;
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

function TConexaoMarcaClimba.PUT(const marca: TMarcaClimba):TMarcaClimba;
begin
  try
    jsonStringRetornado := TConexaoClimba.RequisicaoClimba('PUT',TUtils.ToJsonString(marca),'/brands/'+marca.id);
    result := TUtils.JsonStringParaObjeto(jsonStringRetornado) as TMarcaClimba;
  except
    ResultadoErrado := jsonStringRetornado;
  end;
end;

end.
