unit MMarcaClimba;

interface
type
  TMarcaClimba = class
    private
      Fname: string;
      Fid: string;
      Fdescription: string;
      procedure Setdescription(const Value: string);
      procedure Setid(const Value: string);
      procedure Setname(const Value: string);
    public
      property id : string read Fid write Setid;
      property name: string read Fname write Setname;
      property description: string read Fdescription write Setdescription;
      constructor Create();
      destructor Detroy();
      class function JsonStringParaObjeto(AjsonString: string): TMarcaClimba;
      function ToJsonString: string;
  end;
implementation

{ TMarcaClimba }
uses
  REST.JSON, System.JSON;

constructor TMarcaClimba.Create;
begin

end;

destructor TMarcaClimba.Detroy;
begin

end;

procedure TMarcaClimba.Setdescription(const Value: string);
begin
  Fdescription := Value;
end;

procedure TMarcaClimba.Setid(const Value: string);
begin
  Fid := Value;
end;

procedure TMarcaClimba.Setname(const Value: string);
begin
  Fname := Value;
end;

class function TMarcaClimba.JsonStringParaObjeto(AjsonString: string): TMarcaClimba;
  var
  JSonValue : TJSonValue;
begin
  JsonValue := TJSonObject.ParseJSONValue(AjsonString);
  Result := TJson.JsonToObject<TMarcaClimba>(AjsonString);
end;

function TMarcaClimba.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(Self);
end;

end.
