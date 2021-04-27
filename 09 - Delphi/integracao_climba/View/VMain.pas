unit VMain;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
    CMarcaClimba, CDepartamentoClimba,CPrecoClimba, CProdutoClimba;

type
    Method = (GET,GET_ALL,PUT,POST);

  TForm1 = class(TForm)
    btnProduto: TButton;
    btnMarca: TButton;
    btndepartamento: TButton;
    btnpedido: TButton;
    mmResposta: TMemo;
    rgTipo: TRadioGroup;
    btnPreco: TButton;
    procedure btnMarcaClick(Sender: TObject);
    procedure btndepartamentoClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPrecoClick(Sender: TObject);
  private
        { Private declarations }
    resposta : string;
    DepartamentoClimba : TCDepartamentoClimba;
    MarcaClimba: TCMarcaClimba;
    PrecoClimba: TCPrecoClimba;
    ProdutoClimba: TCProdutoClimba;
  public
        { Public declarations }
    end;

var
    Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btndepartamentoClick(Sender: TObject);
begin
  mmResposta.lines.Clear;
  case Method(rgTipo.ItemIndex) of
      GET     :resposta := 'GET'     +#13+DepartamentoClimba.CadastrarDepartamento('1','teste 1');
      GET_ALL :resposta := 'GET_ALL' +#13+DepartamentoClimba.CadastrarDepartamento('1','teste 1');
      PUT     :resposta := 'PUT'     +#13+DepartamentoClimba.CadastrarDepartamento('1','teste 1');
      POST    :resposta := 'POST'    +#13+DepartamentoClimba.CadastrarDepartamento('1','teste 1');
  end;
  mmResposta.Lines.Add(resposta);
end;

procedure TForm1.btnMarcaClick(Sender: TObject);
begin
  mmResposta.lines.Clear;
  case Method(rgTipo.ItemIndex) of
      GET     :resposta := 'GET'     +#13+MarcaClimba.CadastrarMarca('1','teste 1');
      GET_ALL :resposta := 'GET_ALL' +#13+MarcaClimba.CadastrarMarca('1','teste 1');
      PUT     :resposta := 'PUT'     +#13+MarcaClimba.CadastrarMarca('1','teste 1');
      POST    :resposta := 'POST'    +#13+MarcaClimba.CadastrarMarca('1','teste 1');
  end;
  mmResposta.Lines.Add(resposta);
end;

procedure TForm1.btnPrecoClick(Sender: TObject);
begin
  mmResposta.lines.Clear;
  case Method(rgTipo.ItemIndex) of
      GET     :resposta := 'GET'     +#13+PrecoClimba.CadastrarPreco('1','teste 1');
      GET_ALL :resposta := 'GET_ALL' +#13+PrecoClimba.CadastrarPreco('1','teste 1');
      PUT     :resposta := 'PUT'     +#13+PrecoClimba.CadastrarPreco('1','teste 1');
      POST    :resposta := 'POST'    +#13+PrecoClimba.CadastrarPreco('1','teste 1');
  end;
  mmResposta.Lines.Add(resposta);
end;

procedure TForm1.btnProdutoClick(Sender: TObject);
begin
  mmResposta.lines.Clear;
  case Method(rgTipo.ItemIndex) of
      GET     :resposta := 'GET'     +#13+ProdutoClimba.CarregaProduto('1').SincronizarCadastro;
      GET_ALL :resposta := 'GET_ALL' +#13+ProdutoClimba.CarregaProduto('1').SincronizarCadastro;
      PUT     :resposta := 'PUT'     +#13+ProdutoClimba.CarregaProduto('1').SincronizarCadastro;
      POST    :resposta := 'POST'    +#13+ProdutoClimba.CarregaProduto('1').SincronizarCadastro;
  end;
  mmResposta.Lines.Add(resposta);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   DepartamentoClimba := TCDepartamentoClimba.Create();
   MarcaClimba        := TCMarcaClimba.Create();
   PrecoClimba        := TCPrecoClimba.Create();
   ProdutoClimba      := TCProdutoClimba.Create();
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
    DepartamentoClimba.Free;
    MarcaClimba.Free;
    PrecoClimba.Free;
    ProdutoClimba.Free;
end;

end.
