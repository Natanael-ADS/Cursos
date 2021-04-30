unit CProdutoClimba;

interface
uses
  MProdutoClimba, MConexaoProdutoClimba, System.Generics.Collections, CInterfaceClimba;

  type
  TCProdutoClimba = class(TInterfacedObject,iControllerClimba)
  private

  public
    Produto: TProdutoClimba;
    Conexao: TConexaoProdutoClimba;
    function PropriedadesDoProduto(parametros : TDictionary<string,string>): TProductVariants;

    class function New(): iControllerClimba;
    function Cadastrar(parametros : TDictionary<string,string>): string;
    function Alterar(parametros : TDictionary<string,string>)  : string;
    function Consultar(const id: string)                 : string;
    function ConsultarTodos()                            : string;

    constructor create();
    destructor destroy();

  end;

implementation
uses
  CPrecoClimba, MUtils, System.SysUtils;
{ TCProdutoClimba }

function TCProdutoClimba.Alterar(parametros: TDictionary<string, string>): string;
begin
  try
    Produto.id          := parametros.Items['id'];
    Produto.name        := parametros.Items['name'];
    Produto.BrandId     := parametros.Items['BrandId'];
    Produto.Categories  := [parametros.Items['Categories']];
    Produto.Description := parametros.Items['DescriptionProduto'];
    Produto.Status      := parametros.Items['status'];
    Produto.ProductVariants.Add(PropriedadesDoProduto(parametros));

    result := Conexao.PUT(Produto).ToJsonString;
  except
    Result := Conexao.ResultadoErrado;
    raise;
  end;
end;

function TCProdutoClimba.Cadastrar(parametros : TDictionary<string,string>): string;
begin
  try
    Produto.id          := parametros.Items['id'];
    Produto.name        := parametros.Items['name'];
    Produto.BrandId     := parametros.Items['BrandId'];
    Produto.Categories  := [parametros.Items['Categories']];
    Produto.Description := parametros.Items['DescriptionProduto'];
    Produto.Status      := parametros.Items['status'];
    Produto.ProductVariants.Add(PropriedadesDoProduto(parametros));

    result := Conexao.POST(Produto).ToJsonString;
  except
    Result := Conexao.ResultadoErrado;
    raise;
  end;
end;

function TCProdutoClimba.Consultar(const id: string): string;
begin
  try
    Result := Conexao.GET(id).ToJsonString;
  except
    Result := Conexao.ResultadoErrado;
  end;
end;

function TCProdutoClimba.ConsultarTodos: string;
begin
  try
   // Result := Conexao.GET_ALL().lista.ToString;
  except
    Result := Conexao.ResultadoErrado;
  end;
end;

constructor TCProdutoClimba.create;
begin
  Produto := TProdutoClimba.Create();
  Conexao := TConexaoProdutoClimba.Create();
end;

destructor TCProdutoClimba.destroy;
begin
  Produto.Free;
  Conexao.Free;
end;

class function TCProdutoClimba.New: iControllerClimba;
begin
  Result:= Self.Create;
end;

function TCProdutoClimba.PropriedadesDoProduto(parametros : TDictionary<string,string>): TProductVariants;
var
  PrecoClimba : TCPrecoClimba;
  Propriedade: TProductVariants;
begin
  try
    try
      PrecoClimba                  := TCPrecoClimba.create;
      Propriedade                  := TProductVariants.Create;
      Propriedade.Sku              := parametros.Items['Sku'];
      Propriedade.BarCode          := parametros.Items['BarCode'];
      Propriedade.Description      := parametros.Items['DescriptionPropriedade'];
      Propriedade.ManufacturerCode := parametros.Items['ManufacturerCode'];
      Propriedade.GrossWeight      := StrToInt(parametros.Items['GrossWeight']);
      Propriedade.Height           := StrToInt(parametros.Items['Height']);
      Propriedade.Length           := StrToInt(parametros.Items['Length']);
      Propriedade.NetWeight        := StrToInt(parametros.Items['NetWeight']);
      Propriedade.Quantity         := StrToInt(parametros.Items['Quantity']);
      Propriedade.Width            := StrToInt(parametros.Items['Width']);
      Propriedade.Prices.Add(PrecoClimba.CriarObjeto(parametros.Items['idPreco'],
                                                      parametros.Items['namePreco'],
                                                  StrToInt(parametros.Items['Preco'])));

      Result                       := propriedade;
    except
      raise;
    end;
  finally
    PrecoClimba.Free;
  end;
end;

end.
