unit MClienteClimba;

interface

type

TDocumentos = class
  private
    Ftype: string;
    Fnumber: string;
  public
    property &type : string read Ftype write Ftype;
    property number : string read Fnumber write Fnumber;
end;

TTelefone = class
  private
    Ftype : string;
    Fnumber: string;
  public
    property &type : string read Ftype write Ftype;
    property number: string read Fnumber write Fnumber;
end;

TEndereco = class
  private
    Fdistrict: string;
    Fstreet: string;
    Fstate: string;
    FzipCode: string;
    Fcomplement: string;
    FidentificationDescription: string;
    FstreetNumber: string;
    Fcity: string;
    Freference: string;
  public
    property identificationDescription : string read FidentificationDescription write FidentificationDescription;
    property street                    : string read Fstreet write Fstreet;
    property streetNumber              : string read FstreetNumber write FstreetNumber;
    property complement                : string read Fcomplement write Fcomplement;
    property district                  : string read Fdistrict write Fdistrict;
    property city                      : string read Fcity write Fcity;
    property state                     : string read Fstate write Fstate;
    property zipCode                   : string read FzipCode write FzipCode;
    property reference                 : string read Freference write Freference;

end;

TClienteClimba = class
  private
    Fid : string;
    FmarketplaceId : string;
    Fname : string;
    FtradeName : string;
    Fgender : string;
    FbirthDate : string;
    Fdocuments : TArray<TDocumentos>;
    Fphones : TArray<TTelefone>;
    Femail : string;
    FshippingAddress : TEndereco;
  public
    property id : string read Fid write Fid;
    property marketplaceId : string read FmarketplaceId write FmarketplaceId;
    property name : string read Fname write Fname;
    property tradeName : string read FtradeName write FtradeName;
    property gender : string read Fgender write Fgender;
    property birthDate : string read FbirthDate write FbirthDate;
    property documents : TArray<TDocumentos> read Fdocuments write Fdocuments;
    property phones : TArray<TTelefone> read Fphones write Fphones;
    property email : string read Femail write Femail;
    property shippingAddress : TEndereco read FshippingAddress;
end;

implementation


end.
