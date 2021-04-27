unit CProdutoClimba;

interface
uses
  MProdutoClimba, MConexaoProdutoClimba, System.Generics.Collections;

  type
  TCProdutoClimba = class
  private

  public
    ProdutoClimba: TProdutoClimba;
    ConexaoProdutoClimba: TConexaoProdutoClimba;
    function CarregaProduto(codigo_interno: string): TCProdutoClimba;
    function SincronizarCadastro():string;
    function PropriedadesDoProduto(): TProductVariants;
    constructor create();
    destructor destroy();

  end;

implementation
uses
  CPrecoClimba;
{ TCProdutoClimba }

function TCProdutoClimba.CarregaProduto(codigo_interno: string): TCProdutoClimba;
begin
  try
    ProdutoClimba.id := codigo_interno;
    ProdutoClimba.name := ' Teste 1';
    ProdutoClimba.BrandId:= 'idmarca';
    ProdutoClimba.Categories := ['idcategoria'];
    ProdutoClimba.Description:= ' Teste teste teste';
    ProdutoClimba.ProductVariants.Add(PropriedadesDoProduto());
    ProdutoClimba.Status:= '1';
    Result := Self;
  except
    raise;
  end;

end;

constructor TCProdutoClimba.create;
begin
  ProdutoClimba := TProdutoClimba.Create();
  ConexaoProdutoClimba := TConexaoProdutoClimba.Create();
end;

destructor TCProdutoClimba.destroy;
begin
  ProdutoClimba.Free;
  ConexaoProdutoClimba.Free;
end;

function TCProdutoClimba.PropriedadesDoProduto(): TProductVariants;
var
  Propriedade : TProductVariants;
  PrecoClimba : TCPrecoClimba;
begin
  PrecoClimba := TCPrecoClimba.create;
  Propriedade := TProductVariants.Create;
  Propriedade.BarCode:= '';
  Propriedade.Description:= 'teste teste teste teste';
  Propriedade.GrossWeight:= 10;
  Propriedade.Height:= 10;
  Propriedade.Length:= 10;
  Propriedade.ManufacturerCode:= '111111';
  Propriedade.NetWeight:= 10;
  Propriedade.Prices.Add(PrecoClimba.ConsultarPreco);
  Propriedade.Quantity:= 15;
  Propriedade.Sku:= '111111';
  Propriedade.Width:= 10;
  Result := Propriedade;
end;

function TCProdutoClimba.SincronizarCadastro: string;
begin
  try
    result := ConexaoProdutoClimba.POST(ProdutoClimba).ToJsonString;
  except
    Result := ConexaoProdutoClimba.ResultaErrado;
  end;
end;

end.
