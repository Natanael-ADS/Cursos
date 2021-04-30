unit MMarcaClimba;

interface

uses
  System.Generics.Collections;
type
  TMarcaClimba = class
    private
      Fname: string;
      Fid: string;
      Fdescription: string;
    public
      property id : string read Fid write Fid;
      property name: string read Fname write Fname;
      property description: string read Fdescription write Fdescription;
      class function JsonStringParaObjeto(AjsonString: string): TMarcaClimba;
      function ToJsonString(): string;

  end;
  TMarcaClimbaLista = class
    private
      Flista: TObjectList<TMarcaClimba>;
    public
      property lista : TObjectList<TMarcaClimba> read Flista write Flista;
      constructor Create();
      destructor Destroy();
  end;
implementation

{ TMarcaClimba }
uses
  REST.JSON, System.JSON;

function TMarcaClimba.ToJsonString(): string;
begin
   result := TJson.ObjectToJsonString(Self);
end;

class function TMarcaClimba.JsonStringParaObjeto(AjsonString: string): TMarcaClimba;
var
  JSonValue : TJSonValue;
begin
  JsonValue := TJSonObject.ParseJSONValue(AjsonString);
  Result := TJson.JsonToObject<TMarcaClimba>(AjsonString);
end;

{ TMarcaClimbaLista }

constructor TMarcaClimbaLista.Create;
begin
  Flista := TObjectList<TMarcaClimba>.Create();
end;

destructor TMarcaClimbaLista.Destroy;
begin
  Flista.Free;
end;

end.
