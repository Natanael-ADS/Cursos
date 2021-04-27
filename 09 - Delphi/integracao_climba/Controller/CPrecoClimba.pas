unit CPrecoClimba;

interface
uses
  MPrecoClimba, MConexaoPrecoClimba;

  type
  TCPrecoClimba = class
  private

  public
    PrecoClimba: TPrecoClimba;
    ConexaoPrecoClimba: TConexaoPrecoClimba;
    function CadastrarPreco(id, nome: string): string;
    function ConsultarPreco():TPrecoClimba;
    constructor create();
    destructor destroy();

  end;

implementation


{ TCPrecoClimba }

function TCPrecoClimba.CadastrarPreco(id, nome: string): string;
begin
  try
    PrecoClimba.id := id;
    PrecoClimba.name := nome;
    result := ConexaoPrecoClimba.POST(PrecoClimba).ToJsonString;
  except
    Result := ConexaoPrecoClimba.ResultaErrado;
  end;
end;

function TCPrecoClimba.ConsultarPreco: TPrecoClimba;
begin
  Result:= TPrecoClimba.Create('1','Padr�o',0);
end;

constructor TCPrecoClimba.create;
begin
  PrecoClimba := TPrecoClimba.Create('','',0);
  ConexaoPrecoClimba := TConexaoPrecoClimba.Create();
end;

destructor TCPrecoClimba.destroy;
begin
  PrecoClimba.Free;
  ConexaoPrecoClimba.Free;
end;

end.
