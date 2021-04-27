unit MUtils;

interface

uses
  UControllerMessages,REST.JSON, System.JSON , System.Generics.Collections,System.TypInfo;
type
  TUtils = class
    private
    public
      class procedure MsgCodeStatusHTTP(codigo:integer);
      class function JsonStringParaObjeto(AjsonString: string): TObject;
      class function JsonStringParaObjetoList(AjsonString: string):  TObjectList<TObject>;
      class function ToJsonString(obj: TObject): string;
  end;

implementation

{ TCodeStatus }

class procedure TUtils.MsgCodeStatusHTTP(codigo:integer);
begin
  case codigo of
    201: TControllerMessages.CallSuccessMessage('201 - Indica que o processamento foi realizado corretamente e o retorno ser� conforme expectativa',false);
    400: TControllerMessages.CallErrorMessage('400 - Requisi��o mal formada, 1 ou mais par�metros est�o ausentes',false);
    401: TControllerMessages.CallErrorMessage('401 - Requisi��o requer autentica��o',false);
    403: TControllerMessages.CallErrorMessage('403 - Requisi��o negada',false);
    404: TControllerMessages.CallErrorMessage('404 - Recurso n�o encontrado',false);
    405: TControllerMessages.CallErrorMessage('405 - M�todo n�o permitido',false);
    406: TControllerMessages.CallErrorMessage('406 - Parametros n�o aceitados',false);
    409: TControllerMessages.CallErrorMessage('409 - Um atributo j� est� cadastrado com o mesmo c�digo',false);
    415: TControllerMessages.CallErrorMessage('415 - Corpo da requisi��o inv�lida',false);
    429: TControllerMessages.CallErrorMessage('429 - Limite de requisi��es atingido',false);
  end;
end;

{ TConverteJSON }

class function TUtils.JsonStringParaObjeto(AjsonString: string): TObject;
var
  JSonValue : TJSonValue;
begin
  JsonValue := TJSonObject.ParseJSONValue(AjsonString);
  Result := TJson.JsonToObject<TObject>(AjsonString);
end;

class function TUtils.JsonStringParaObjetoList(AjsonString: string): TObjectList<TObject>;
var
  listaJson : TJSONArray;
  JSonValue : TJSonValue;
  ObjectList: TObjectList<TObject>;
begin
  listaJson := TJSonObject.ParseJSONValue(AjsonString) as TJSONArray;
  ObjectList := TObjectList<TObject>.Create;
  for JSonValue in listaJson do
  begin
    ObjectList.AddRange(TJson.JsonToObject<TObject>(AjsonString));
  end;
  Result := ObjectList;
end;

class function TUtils.ToJsonString(obj: TObject): string;
begin
   result := TJson.ObjectToJsonString(obj);
end;

end.
