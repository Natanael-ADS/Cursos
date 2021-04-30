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
    400: TControllerMessages.CallErrorMessage('400 - Requisição mal formada, 1 ou mais parâmetros estão ausentes',false);
    401: TControllerMessages.CallErrorMessage('401 - Requisição requer autenticação',false);
    403: TControllerMessages.CallErrorMessage('403 - Requisição negada',false);
    404: TControllerMessages.CallErrorMessage('404 - Recurso não encontrado',false);
    405: TControllerMessages.CallErrorMessage('405 - Método não permitido',false);
    406: TControllerMessages.CallErrorMessage('406 - Parametros não aceitados',false);
    409: TControllerMessages.CallErrorMessage('409 - Um atributo já está cadastrado com o mesmo código',false);
    415: TControllerMessages.CallErrorMessage('415 - Corpo da requisição inválida',false);
    429: TControllerMessages.CallErrorMessage('429 - Limite de requisições atingido',false);
    500: TControllerMessages.CallErrorMessage('500 - Erro Interno no Servidor',false);
  end;
end;







end.
