unit MPrecoClimba;

interface

uses
  System.Generics.Collections;

type
  TPrecoClimba = class
    private
      Fname: string;
      Fid: string;
      Fprice: Integer;
    public
      property id: string read Fid write Fid;
      property name: string read Fname write Fname;
      property price: Integer read Fprice write Fprice; //Exemplo R$ 19,98 => 1998
      class function JsonStringParaObjeto(AjsonString: string): TPrecoClimba;
      function ToJsonString(): string;
      constructor Create(const id,name:string; const price:integer);
  end;
  TPrecoClimbaLista = class
    private
      Ftotal : integer;
      FperPage : integer;
      FcurrentPage : integer;
      FlastPage : integer;
      FprevPageUrl : string;
      FnextPageUrl : string;
      Ffrom : integer;
      Fto : integer;
      Fsort : TArray<TPrecoClimba>;
      FData : TArray<TPrecoClimba>;
    public
      property total : integer read Ftotal write Ftotal;
      property perPage : integer read FperPage write FperPage;
      property currentPage : integer read FcurrentPage write FcurrentPage;
      property lastPage : integer read FlastPage write FlastPage;
      property prevPageUrl : string read FprevPageUrl write FprevPageUrl;
      property nextPageUrl : string read FnextPageUrl write FnextPageUrl;
      property from : integer read Ffrom write Ffrom;
      property &to : integer read Fto write Fto;
      property data: TArray<TPrecoClimba> read FData;
      property sort: TArray<TPrecoClimba> read Fsort;

      function ToJsonString(): string;
      class function JsonStringParaObjeto(AjsonString: string): TPrecoClimbaLista;
  end;

implementation

{ TPrecoClimba }
uses
  REST.JSON, System.JSON;

constructor TPrecoClimba.Create(const id, name: string; const price: integer);
begin
  Fname:= name;
  Fid := id;
  Fprice := price;
end;

function TPrecoClimba.ToJsonString(): string;
begin
   result := TJson.ObjectToJsonString(Self);
end;

class function TPrecoClimba.JsonStringParaObjeto(AjsonString: string): TPrecoClimba;
var
  JSonValue : TJSonValue;
begin
  JsonValue := TJSonObject.ParseJSONValue(AjsonString);
  Result := TJson.JsonToObject<TPrecoClimba>(AjsonString);
end;

{ TPrecoClimbaLista }

function TPrecoClimbaLista.ToJsonString(): string;
begin
   result := TJson.ObjectToJsonString(Self);
end;

class function TPrecoClimbaLista.JsonStringParaObjeto(AjsonString: string): TPrecoClimbaLista;
var
  JSonValue : TJSonValue;
begin
  JsonValue := TJSonObject.ParseJSONValue(AjsonString);
  Result := TJson.JsonToObject<TPrecoClimbaLista>(AjsonString);
end;

end.
