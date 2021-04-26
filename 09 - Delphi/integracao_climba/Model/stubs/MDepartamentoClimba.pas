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
    procedure Setdescription(const Value: string);
    procedure Setid(const Value: string);
    procedure Setname(const Value: string);
    procedure SetbreadCrumb(const Value: string);
    procedure Setorder(const Value: string);
    procedure SetparentId(const Value: string);
  public
    property id : string read Fid write Setid;
    property parentId: string read FparentId write SetparentId;
    property name: string read Fname write Setname;
    property description: string read Fdescription write Setdescription;
    property order: string read Forder write Setorder;
    property breadCrumb: string read FbreadCrumb write SetbreadCrumb;
    constructor Create();
    destructor Detroy();
    class function JsonStringParaObjeto(AjsonString: string): TDepartamentoClimba;
    function ToJsonString: string;
  end;
implementation

{ TDepartamentoClimba }
uses
  REST.JSON, System.JSON;

constructor TDepartamentoClimba.Create;
begin

end;

destructor TDepartamentoClimba.Detroy;
begin

end;

procedure TDepartamentoClimba.SetbreadCrumb(const Value: string);
begin
  FbreadCrumb := Value;
end;

procedure TDepartamentoClimba.Setdescription(const Value: string);
begin
  Fdescription := Value;
end;

procedure TDepartamentoClimba.Setid(const Value: string);
begin
  Fid := Value;
end;

procedure TDepartamentoClimba.Setname(const Value: string);
begin
  Fname := Value;
end;

procedure TDepartamentoClimba.Setorder(const Value: string);
begin
  Forder := Value;
end;

procedure TDepartamentoClimba.SetparentId(const Value: string);
begin
  FparentId := Value;
end;

class function TDepartamentoClimba.JsonStringParaObjeto(AjsonString: string): TDepartamentoClimba;
  var
  JSonValue : TJSonValue;
begin
  JsonValue := TJSonObject.ParseJSONValue(AjsonString);
  Result := TJson.JsonToObject<TDepartamentoClimba>(AjsonString);
end;

function TDepartamentoClimba.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(Self);
end;

end.
