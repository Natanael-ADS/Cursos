unit VMain;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
    TForm1 = class(TForm)
    btnProduto: TButton;
    btnMarca: TButton;
    btndepartamento: TButton;
    btnpedido: TButton;
    mmResposta: TMemo;
    RadioGroup1: TRadioGroup;
    procedure btnMarcaClick(Sender: TObject);
    procedure btndepartamentoClick(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    Form1: TForm1;

implementation

uses
  CMarcaClimba, CDepartamentoClimba;



{$R *.dfm}

procedure TForm1.btndepartamentoClick(Sender: TObject);
var DepartamentoClimba : TCDepartamentoClimba;
begin
  DepartamentoClimba := TCDepartamentoClimba.Create();
  try
    mmResposta.lines.Clear;
    mmResposta.Lines.Add(DepartamentoClimba.CadastrarDepartamento('1','teste 1'));
  finally
    DepartamentoClimba.Free;
  end;
end;

procedure TForm1.btnMarcaClick(Sender: TObject);
var MarcaClimba: TCMarcaClimba;
begin
  MarcaClimba := TCMarcaClimba.Create();
  try
    mmResposta.lines.Clear;
    mmResposta.Lines.Add(MarcaClimba.CadastrarMarca('1','teste 1'));
  finally
    MarcaClimba.Free;
  end;
end;

end.
