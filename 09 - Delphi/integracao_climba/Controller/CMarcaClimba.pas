unit CMarcaClimba;

interface

uses
  MMarcaClimba, MConexaoMarcaClimba;

  type
  TCMarcaClimba = class
  private

  public
    MarcaClimba: TMarcaClimba;
    ConexaoMarcaClimba: TConexaoMarcaClimba;
    function CadastrarMarca(id, nome: string): string;
    constructor create();
    destructor destroy();

  end;

implementation


{ TCMarcaClimba }

function TCMarcaClimba.CadastrarMarca(id, nome: string): string;
begin
  try
    MarcaClimba.id := id;
    MarcaClimba.name := nome;
    result := ConexaoMarcaClimba.POST(MarcaClimba).ToJsonString;
  except
    Result := ConexaoMarcaClimba.ResultaErrado;
  end;
end;

constructor TCMarcaClimba.create;
begin
  MarcaClimba := TMarcaClimba.Create();
  ConexaoMarcaClimba := TConexaoMarcaClimba.Create();
end;

destructor TCMarcaClimba.destroy;
begin
  MarcaClimba.Free;
  ConexaoMarcaClimba.Free;
end;

end.
