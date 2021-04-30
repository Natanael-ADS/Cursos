unit MDepartamentoClimba;

interface
type
  TDepartamentoClimba = class
  private
    Fname: string;
    Fid: string;
    Fdescription: string;
    FbreadCrumb: string;
    Forder: string;
    FparentId: string;
  public
    property id : string read Fid write Fid;
    property parentId: string read FparentId write FparentId;
    property name: string read Fname write Fname;
    property description: string read Fdescription write Fdescription;
    property order: string read Forder write Forder;
    property breadCrumb: string read FbreadCrumb write FbreadCrumb;

    class function JsonStringParaObjeto(AjsonString: string): TDepartamentoClimba;
    function ToJsonString(): string;
  end;
implementation

{ TDepartamentoClimba }
uses
  REST.JSON, System.JSON;

function TDepartamentoClimba.ToJsonString(): string;
begin
   result := TJson.ObjectToJsonString(Self);
end;

class function TDepartamentoClimba.JsonStringParaObjeto(AjsonString: string): TDepartamentoClimba;
var
  JSonValue : TJSonValue;
begin
  JsonValue := TJSonObject.ParseJSONValue(AjsonString);
  Result := TJson.JsonToObject<TDepartamentoClimba>(AjsonString);
end;


end.
