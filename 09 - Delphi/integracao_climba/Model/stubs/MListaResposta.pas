unit MListaResposta;

interface

uses
  System.Generics.Collections, MDepartamentoClimba,MProdutoClimba,MPrecoClimba,MMarcaClimba;
type

TLista = class
  private
    Ftotal : integer;
    FperPage : integer;
    FcurrentPage : integer;
    FlastPage : integer;
    FprevPageUrl : string;
    FnextPageUrl : string;
    Ffrom : integer;
    Fto : integer;
    Fsort : TObjectList<TObject>;
    FData : TObjectList<TObject>;
  public
    property total : integer read Ftotal write Ftotal;
    property perPage : integer read FperPage write FperPage;
    property currentPage : integer read FcurrentPage write FcurrentPage;
    property lastPage : integer read FlastPage write FlastPage;
    property prevPageUrl : string read FprevPageUrl write FprevPageUrl;
    property nextPageUrl : string read FnextPageUrl write FnextPageUrl;
    property from : integer read Ffrom write Ffrom;
    property &to : integer read Fto write Fto;
    property data: TObjectList<TObject> read FData;
    property sort : TObjectList<TObject> read Fsort;

    function ToJsonString(): string;
    class function JsonStringParaObjeto(AjsonString: string): TLista;
end;

implementation

{ TLista<T> }
uses
  REST.JSON, System.JSON;

function TLista.ToJsonString(): string;
begin
   result := TJson.ObjectToJsonString(Self);
end;

class function TLista.JsonStringParaObjeto(AjsonString: string): TLista;
var
  JSonValue : TJSonValue;
begin
  JsonValue := TJSonObject.ParseJSONValue(AjsonString);
  Result := TJson.JsonToObject<TLista>(AjsonString);
end;

end.
