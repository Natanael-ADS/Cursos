unit MUtils;

interface

uses
  UControllerMessages,REST.JSON, System.JSON , System.Generics.Collections,System.TypInfo;
type
  TUtils = class
    private
    public
      class procedure MsgCodeStatusHTTP(codigo:integer);
  end;

implementation

{ TCodeStatus }

class procedure TUtils.MsgCodeStatusHTTP(codigo:integer);
begin
  case codigo of
    200: TControllerMessages.CallSuccessMessage('200 - O processamento de consulta foi realizado corretamente',false);
    201: TControllerMessages.CallSuccessMessage('201 - O processamento de cadastro foi realizado corretamente',false);
    400: TControllerMessages.CallErrorMessage('400 - Requisi��o mal formada, 1 ou mais par�metros est�o ausentes',false);
    401: TControllerMessages.CallErrorMessage('401 - Requisi��o requer autentica��o',false);
    403: TControllerMessages.CallErrorMessage('403 - Requisi��o negada',false);
    404: TControllerMessages.CallErrorMessage('404 - Recurso n�o encontrado',false);
    405: TControllerMessages.CallErrorMessage('405 - M�todo n�o permitido',false);
    406: TControllerMessages.CallErrorMessage('406 - Parametros n�o aceitados',false);
    409: TControllerMessages.CallErrorMessage('409 - Um atributo j� est� cadastrado com o mesmo c�digo',false);
    415: TControllerMessages.CallErrorMessage('415 - Corpo da requisi��o inv�lida',false);
    429: TControllerMessages.CallErrorMessage('429 - Limite de requisi��es atingido',false);
    500: TControllerMessages.CallErrorMessage('500 - Erro Interno no Servidor',false);
  end;
end;







end.
