unit MProdutoClimba;

interface

uses
  System.Generics.Collections, REST.Json.Types, MPrecoClimba;

{$M+}

type
  TProductVariants = class
  private
    FBarCode: string;
    FDescription: string;
    FGrossWeight: Integer;
    FHeight: Integer;
    FLength: Integer;
    FManufacturerCode: string;
    FNetWeight: Integer;
    [JSONName('prices')]
    FPricesArray: TArray<TPrecoClimba>;
    [GenericListReflect]
    FPrices: TObjectList<TPrecoClimba>;
    FQuantity: Integer;
    FSku: string;
    FWidth: Integer;
    function GetPrices: TObjectList<TPrecoClimba>;
  published
    property BarCode: string read FBarCode write FBarCode;
    property Description: string read FDescription write FDescription;
    property GrossWeight: Integer read FGrossWeight write FGrossWeight;
    property Height: Integer read FHeight write FHeight;
    property Length: Integer read FLength write FLength;
    property ManufacturerCode: string read FManufacturerCode write FManufacturerCode;
    property NetWeight: Integer read FNetWeight write FNetWeight;
    property Prices: TObjectList<TPrecoClimba> read GetPrices;
    property Quantity: Integer read FQuantity write FQuantity;
    property Sku: string read FSku write FSku;
    property Width: Integer read FWidth write FWidth;
    destructor Destroy; override;
  end;

  TProdutoClimba = class
  private
    FBrandId: string;
    FCategories: TArray<string>;
    FDescription: string;
    FId: string;
    FName: string;
    [JSONName('productVariants')]
    FProductVariantsArray: TArray<TProductVariants>;
    [GenericListReflect]
    FProductVariants: TObjectList<TProductVariants>;
    FStatus: string;
    function GetProductVariants: TObjectList<TProductVariants>;
  published
    property BrandId: string read FBrandId write FBrandId;
    property Categories: TArray<string> read FCategories write FCategories;
    property Description: string read FDescription write FDescription;
    property Id: string read FId write FId;
    property Name: string read FName write FName;
    property ProductVariants: TObjectList<TProductVariants> read GetProductVariants;
    property Status: string read FStatus write FStatus;
    destructor Destroy; override;
    class function JsonStringParaObjeto(AjsonString: string): TProdutoClimba;
    function ToJsonString: string;
  end;

implementation

uses
  REST.JSON, System.JSON;


{ TProductVariants }
destructor TProductVariants.Destroy;
begin
  GetPrices.Free;
  inherited;
end;

function TProductVariants.GetPrices: TObjectList<TPrecoClimba>;
begin
  if not Assigned(FPrices) then
  begin
    FPrices := TObjectList<TPrecoClimba>.Create;
    FPrices.AddRange(FPricesArray);
  end;
  Result := FPrices;
end;


{ TProdutoClimba }

destructor TProdutoClimba.Destroy;
begin
  GetProductVariants.Free;
  inherited;
end;

function TProdutoClimba.GetProductVariants: TObjectList<TProductVariants>;
begin
  if not Assigned(FProductVariants) then
  begin
    FProductVariants := TObjectList<TProductVariants>.Create;
    FProductVariants.AddRange(FProductVariantsArray);
  end;
  Result := FProductVariants;
end;

class function TProdutoClimba.JsonStringParaObjeto(AjsonString: string): TProdutoClimba;
  var
  JSonValue : TJSonValue;
begin
  JsonValue := TJSonObject.ParseJSONValue(AjsonString);
  Result := TJson.JsonToObject<TProdutoClimba>(AjsonString);
end;

function TProdutoClimba.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(Self);
end;

end.
