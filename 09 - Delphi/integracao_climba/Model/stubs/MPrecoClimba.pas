unit MPrecoClimba;

interface

type
  TPrecoClimba = class
    private
      Fname: string;
      Fid: string;
      Fprice: Integer;
      procedure Setid(const Value: string);
      procedure Setname(const Value: string);
    procedure Setprice(const Value: Integer);
    public
      property id: string read Fid write Setid;
      property name: string read Fname write Setname;
      property price: Integer read Fprice write Setprice; //Exemplo R$ 19,98 => 1998
      constructor Create(const id,name:string; const price:integer);
      destructor Destroy(); override;
      class function JsonStringParaObjeto(AjsonString: string): TPrecoClimba;
      function ToJsonString: string;
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

destructor TPrecoClimba.Destroy;
begin

  inherited;
end;

procedure TPrecoClimba.Setid(const Value: string);
begin
  Fid := Value;
end;

procedure TPrecoClimba.Setname(const Value: string);
begin
  Fname := Value;
end;

procedure TPrecoClimba.Setprice(const Value: Integer);
begin
  Fprice := Value;
end;

class function TPrecoClimba.JsonStringParaObjeto(AjsonString: string): TPrecoClimba;
  var
  JSonValue : TJSonValue;
begin
  JsonValue := TJSonObject.ParseJSONValue(AjsonString);
  Result := TJson.JsonToObject<TPrecoClimba>(AjsonString);
end;

function TPrecoClimba.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(Self);
end;

end.
