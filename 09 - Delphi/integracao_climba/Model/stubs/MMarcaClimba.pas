unit MMarcaClimba;

interface

uses
  System.Generics.Collections;
type
  TMarcaClimba = class
    private
      Fname: string;
      Fid: string;
      Fdescription: string;
      procedure Setdescription(const Value: string);
      procedure Setid(const Value: string);
      procedure Setname(const Value: string);
    public
      property id : string read Fid write Setid;
      property name: string read Fname write Setname;
      property description: string read Fdescription write Setdescription;
      constructor Create();
      destructor Detroy();
  end;
  TMarcaClimbaLista = class
    private
      Flista: TObjectList<TMarcaClimba>;
      procedure Setlista(const Value: TObjectList<TMarcaClimba>);
    public
      property lista : TObjectList<TMarcaClimba> read Flista write Setlista;
      constructor Create();
      destructor Destroy();
  end;
implementation

{ TMarcaClimba }
uses
  REST.JSON, System.JSON;

constructor TMarcaClimba.Create;
begin

end;

destructor TMarcaClimba.Detroy;
begin

end;

procedure TMarcaClimba.Setdescription(const Value: string);
begin
  Fdescription := Value;
end;

procedure TMarcaClimba.Setid(const Value: string);
begin
  Fid := Value;
end;

procedure TMarcaClimba.Setname(const Value: string);
begin
  Fname := Value;
end;

{ TMarcaClimbaLista }

constructor TMarcaClimbaLista.Create;
begin
  Flista := TObjectList<TMarcaClimba>.Create();
end;

destructor TMarcaClimbaLista.Destroy;
begin
  Flista.Free;
end;

procedure TMarcaClimbaLista.Setlista(const Value: TObjectList<TMarcaClimba>);
begin
  Flista := Value;
end;

end.
