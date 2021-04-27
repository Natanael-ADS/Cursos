unit MConexaoClimba;

interface

uses
  Rest.Client,MUtils;

type
  TConexaoClimba = class
  private

  class var HOST_SERVER:string;
  class var API_TOKEN:string;
  class procedure CarregarConfiguracoes();

  public
    class function RequisicaoClimba(const ATipoRequisicao, StringJSON, URL: string): string;
  end;

implementation

uses
  System.SysUtils, REST.Types;

{ TRestTemplate }

class procedure TConexaoClimba.CarregarConfiguracoes;
begin
 // ler de algum local os dados do cliente
   HOST_SERVER := 'https://staging-quantumsistemas.api.climbaapp.com.br/api/v1/';
   API_TOKEN := 'ZjJjZmJiODE3NjMxODA4MzBmOWNmM2I0N2UwZTA3OTE6ZDNhOGExMmRkNzQ5NjU'+
      '3ZDhlMTBiMmJmOGY0ZGE4MjI=';
end;

class function TConexaoClimba.RequisicaoClimba(const ATipoRequisicao,StringJSON,URL: string): string;
var
  RESTRequest: TRESTRequest;
  RestClient: TRESTClient;
  RESTResponse: TRESTResponse;
  Retorno: Integer;
begin
  try
    CarregarConfiguracoes();
    Retorno := -1;

    RestClient := TRESTClient.Create(nil);
    RESTResponse := TRESTResponse.Create(nil);
    RESTRequest := TRESTRequest.Create(nil);

    RESTRequest.Client := RestClient;
    RESTRequest.Response := RESTResponse;
    RESTRequest.Params.AddHeader('x-idcommerce-api-token',API_TOKEN);
    RestClient.BaseURL := HOST_SERVER + URL;

    if ATipoRequisicao = 'PATCH' then
      RESTRequest.Method := TRESTRequestMethod.rmPATCH
    else if ATipoRequisicao = 'POST' then
      RESTRequest.Method := TRESTRequestMethod.rmPOST
    else if ATipoRequisicao = 'PUT' then
      RESTRequest.Method := TRESTRequestMethod.rmPUT
    else if ATipoRequisicao = 'GET' then
      RESTRequest.Method := TRESTRequestMethod.rmGET
    else if ATipoRequisicao = 'DELETE' then
      RESTRequest.Method := TRESTRequestMethod.rmDELETE;

    RESTRequest.ClearBody();

    RESTRequest.AddBody(StringJSON, ContentTypeFromString('application/json'));

    try
      RESTRequest.Execute();
    except
      on E: Exception do
      begin
        raise Exception.Create
          (PChar('RequisicaoWs - Ocorreu um erro ao executar ' +
          'a requisição ao recurso. Erro: ' +
          E.Message));
      end;
    end;

    result := RESTResponse.Content;
    TUtils.MsgCodeStatusHTTP(RESTResponse.StatusCode);

  finally
    if Assigned(RestClient) then
      FreeAndNil(RestClient);

    if Assigned(RESTResponse) then
      FreeAndNil(RESTResponse);

    if Assigned(RESTRequest) then
      FreeAndNil(RESTRequest);
  end;
end;

end.