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
    FPrices: TObjectList<TPrecoClimba>;
    FQuantity: Integer;
    FSku: string;
    FWidth: Integer;
  published
    property BarCode: string read FBarCode write FBarCode;
    property Description: string read FDescription write FDescription;
    property GrossWeight: Integer read FGrossWeight write FGrossWeight;
    property Height: Integer read FHeight write FHeight;
    property Length: Integer read FLength write FLength;
    property ManufacturerCode: string read FManufacturerCode write FManufacturerCode;
    property NetWeight: Integer read FNetWeight write FNetWeight;
    property Prices: TObjectList<TPrecoClimba> read FPrices;
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
    FProductVariants: TObjectList<TProductVariants>;
    FStatus: string;
  published
    property BrandId: string read FBrandId write FBrandId;
    property Categories: TArray<string> read FCategories write FCategories;
    property Description: string read FDescription write FDescription;
    property Id: string read FId write FId;
    property Name: string read FName write FName;
    property ProductVariants: TObjectList<TProductVariants> read FProductVariants;
    property Status: string read FStatus write FStatus;
    class function JsonStringParaObjeto(AjsonString: string): TProdutoClimba;
    function ToJsonString(): string;
    destructor Destroy; override;
  end;
  TListaProdutoClimba = class
    private
    Flista: TObjectList<TProdutoClimba>;
    public
      property lista : TObjectList<TProdutoClimba> read Flista ;
      constructor Create();
      destructor Destroy();
  end;

implementation

uses
  REST.JSON, System.JSON;


{ TProductVariants }
destructor TProductVariants.Destroy;
begin
  FPrices.Free;
  inherited;
end;

{ TProdutoClimba }

destructor TProdutoClimba.Destroy;
begin
  FProductVariants.Free;
  inherited;
end;

function TProdutoClimba.ToJsonString(): string;
begin
   result := TJson.ObjectToJsonString(Self);
end;

class function TProdutoClimba.JsonStringParaObjeto(AjsonString: string): TProdutoClimba;
var
  JSonValue : TJSonValue;
begin
  JsonValue := TJSonObject.ParseJSONValue(AjsonString);
  Result := TJson.JsonToObject<TProdutoClimba>(AjsonString);
end;

{ TListaProdutoClimba }

constructor TListaProdutoClimba.Create;
begin
  Flista := TObjectList<TProdutoClimba>.Create();
end;

destructor TListaProdutoClimba.Destroy;
begin
  Flista.Free();
end;



end.
