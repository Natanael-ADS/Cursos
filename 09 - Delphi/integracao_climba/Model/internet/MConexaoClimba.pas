unit MConexaoClimba;

interface

uses
  Rest.Client;

type
  TConexaoClimba = class
  private

  class var HOST_SERVER:string;
  class var API_TOKEN:string;
  class procedure CarregarConfiguracoes();

  public
    class function RequisicaoClimba(const ANomeRecurso:string;
                                    const ATipoRequisicao:string;
                                    const StringJSON:string;
                                    const URL: string
                                    ): string;
  end;

implementation

uses
  System.SysUtils, REST.Types;

{ TRestTemplate }

class procedure TConexaoClimba.CarregarConfiguracoes;
begin
 // ler de algum local os dados do cliente
   HOST_SERVER := 'http://demo1.climbacommerce.com.br/api/v1/';
   API_TOKEN := 'a80843b39eb8d896c219b7b42b4ddca53629d7558f9a593af782b4879a1d'+
              '8ab9fd79f7351f61a41c87a228dc505ee33664901751e630c3041e9a8f8f8e'+
              '7ce634d20c21fab838603f750b5d2eb3cff34f4cd68607cd60a326c17836cbf'+
              '523254be67a63d501a3cfc5241921b09f49b090f89c227192a28efd775da52efe55dbb9';
end;

class function TConexaoClimba.RequisicaoClimba(const ANomeRecurso:string; const ATipoRequisicao:string;
                                  const StringJSON:string;const URL: string): string;
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

    RESTRequest.Resource := ANomeRecurso;

    RESTRequest.ClearBody();

    RESTRequest.AddBody(StringJSON, ContentTypeFromString('application/json'));

    try
      RESTRequest.Execute();
    except
      on E: Exception do
      begin
        raise Exception.Create
          (PChar('RequisicaoWs - Ocorreu um erro ao executar ' +
          'a requisição ao recurso "' + ANomeRecurso + '". Erro: ' +
          E.Message));
      end;
    end;

    result := RESTResponse.Content;

   { if RESTResponse.StatusCode = 201 then
    begin
      result := RESTResponse.Content;
    end
    else
    begin
      result := RESTResponse.Content;
    end;}

    //Retorno := RESTResponse.StatusCode;
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