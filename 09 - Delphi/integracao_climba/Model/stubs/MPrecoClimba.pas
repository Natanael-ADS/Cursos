unit MPrecoClimba;

interface

uses
  System.Generics.Collections;

type
  TPrecoClimba = class
    private
      Fname: string;
      Fid: string;
      Fprice: Integer;
      procedure Setid(const Value: string);
      procedure Setname(const Value: string);
    procedure Setprice(const Value: Integer);
    public
      property id: string read Fid write Setid;
      property name: string read Fname write Setname;
      property price: Integer read Fprice write Setprice; //Exemplo R$ 19,98 => 1998
      constructor Create(const id,name:string; const price:integer);
      destructor Destroy(); override;
  end;
  TPrecoClimbaLista = class
    private
    Flista: TObjectList<TPrecoClimba>;
    procedure Setlista(const Value: TObjectList<TPrecoClimba>);
    public
      property lista : TObjectList<TPrecoClimba> read Flista write Setlista;
      constructor Create();
      destructor Destroy();
  end;

implementation

{ TPrecoClimba }
uses
  REST.JSON, System.JSON;

constructor TPrecoClimba.Create(const id, name: string; const price: integer);
begin
  Fname:= name;
  Fid := id;
  Fprice := price;
end;

destructor TPrecoClimba.Destroy;
begin

  inherited;
end;

procedure TPrecoClimba.Setid(const Value: string);
begin
  Fid := Value;
end;

procedure TPrecoClimba.Setname(const Value: string);
begin
  Fname := Value;
end;

procedure TPrecoClimba.Setprice(const Value: Integer);
begin
  Fprice := Value;
end;

{ TPrecoClimbaLista }

constructor TPrecoClimbaLista.Create;
begin
  Flista := TObjectList<TPrecoClimba>.Create();
end;

destructor TPrecoClimbaLista.Destroy;
begin
  Flista.Free;
end;

procedure TPrecoClimbaLista.Setlista(const Value: TObjectList<TPrecoClimba>);
begin
  Flista := Value;
end;

end.
