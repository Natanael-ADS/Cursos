unit MPagamentoClimba;

interface

type
TPagamentoClimba = class
  private
    FtransactionId: string;
    FauthorizationCode: string;
    FpaymentDate: string;
    Fid: string;
    FpaymentLink: string;
    Fdescription: string;
    Fbrand: string;
    Fnsu: string;
    FpaymentType: string;
    procedure SetauthorizationCode(const Value: string);
    procedure Setbrand(const Value: string);
    procedure Setdescription(const Value: string);
    procedure Setid(const Value: string);
    procedure Setnsu(const Value: string);
    procedure SetpaymentDate(const Value: string);
    procedure SetpaymentLink(const Value: string);
    procedure SetpaymentType(const Value: string);
    procedure SettransactionId(const Value: string);
  public
    property id                : string read Fid write Setid;
    property description       : string read Fdescription write Setdescription;
    property transactionId     : string read FtransactionId write SettransactionId;
    property brand             : string read Fbrand write Setbrand;
    property paymentDate       : string read FpaymentDate write SetpaymentDate;
    property paymentType       : string read FpaymentType write SetpaymentType;
    property nsu               : string read Fnsu write Setnsu;
    property authorizationCode : string read FauthorizationCode write SetauthorizationCode;
    property paymentLink       : string read FpaymentLink write SetpaymentLink;

    constructor Create();
    destructor Destroy();
end;

implementation

{ TPagamentoClimba }

constructor TPagamentoClimba.Create;
begin

end;

destructor TPagamentoClimba.Destroy;
begin

end;

procedure TPagamentoClimba.SetauthorizationCode(const Value: string);
begin
  FauthorizationCode := Value;
end;

procedure TPagamentoClimba.Setbrand(const Value: string);
begin
  Fbrand := Value;
end;

procedure TPagamentoClimba.Setdescription(const Value: string);
begin
  Fdescription := Value;
end;

procedure TPagamentoClimba.Setid(const Value: string);
begin
  Fid := Value;
end;

procedure TPagamentoClimba.Setnsu(const Value: string);
begin
  Fnsu := Value;
end;

procedure TPagamentoClimba.SetpaymentDate(const Value: string);
begin
  FpaymentDate := Value;
end;

procedure TPagamentoClimba.SetpaymentLink(const Value: string);
begin
  FpaymentLink := Value;
end;

procedure TPagamentoClimba.SetpaymentType(const Value: string);
begin
  FpaymentType := Value;
end;

procedure TPagamentoClimba.SettransactionId(const Value: string);
begin
  FtransactionId := Value;
end;

end.
