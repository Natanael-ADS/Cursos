unit VMain;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
    CMarcaClimba, CDepartamentoClimba,CPrecoClimba, CProdutoClimba, System.Generics.Collections;

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
    parametros : TDictionary<string,string>;
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

  parametros.Clear;
  parametros.Add('id','1');
  parametros.Add('name','Teste 1');
  case Method(rgTipo.ItemIndex) of
      GET     :resposta := 'GET'     +#13+DepartamentoClimba.Consultar(parametros.Items['id']);
      GET_ALL :resposta := 'GET_ALL' +#13+DepartamentoClimba.ConsultarTodos();
      PUT     :resposta := 'PUT'     +#13+DepartamentoClimba.Alterar(parametros);
      POST    :resposta := 'POST'    +#13+DepartamentoClimba.Cadastrar(parametros);
  end;
  mmResposta.Lines.Add(resposta);
end;

procedure TForm1.btnMarcaClick(Sender: TObject);
begin
  mmResposta.lines.Clear;
  parametros.clear;
  parametros.Add('id','1');
  parametros.Add('name','Teste 1');

  case Method(rgTipo.ItemIndex) of
      GET     :resposta := 'GET'     +#13+MarcaClimba.Consultar(parametros.Items['id']);
      GET_ALL :resposta := 'GET_ALL' +#13+MarcaClimba.ConsultarTodos();
      PUT     :resposta := 'PUT'     +#13+MarcaClimba.Alterar(nil);
      POST    :resposta := 'POST'    +#13+MarcaClimba.Cadastrar(parametros);
  end;
  mmResposta.Lines.Add(resposta);
end;

procedure TForm1.btnPrecoClick(Sender: TObject);
begin
  mmResposta.lines.Clear;
  parametros.clear;
  parametros.Add('id','2');
  parametros.Add('name','teste 2');
  case Method(rgTipo.ItemIndex) of
      GET     :resposta := 'GET'     +#13+PrecoClimba.Consultar(parametros.Items['id']);
      GET_ALL :resposta := 'GET_ALL' +#13+PrecoClimba.ConsultarTodos();
      PUT     :resposta := 'PUT'     +#13+PrecoClimba.Alterar(parametros);
      POST    :resposta := 'POST'    +#13+PrecoClimba.Cadastrar(parametros);
  end;
  mmResposta.Lines.Add(resposta);
end;

procedure TForm1.btnProdutoClick(Sender: TObject);
begin
  mmResposta.lines.Clear;
  parametros.clear;
  parametros.Add('id','1');
  parametros.Add('name','teste');
  parametros.Add('BrandId','1');
  parametros.Add('Categories','1');
  parametros.Add('DescriptionProduto','testestestse');
  parametros.Add('Status','1');
  parametros.Add('Sku','11111111');
  parametros.Add('BarCode','111111');
  parametros.Add('DescriptionPropriedade','testestestes');
  parametros.Add('ManufacturerCode','111111');
  parametros.Add('GrossWeight','1111');
  parametros.Add('Height','1111');
  parametros.Add('Length','111');
  parametros.Add('NetWeight','111');
  parametros.Add('Quantity','111');
  parametros.Add('Width','111');
  parametros.Add('idPreco','1');
  parametros.Add('namePreco','teste 1');
  parametros.Add('Preco','1984');

  case Method(rgTipo.ItemIndex) of
      GET     :resposta := 'GET'     +#13+ProdutoClimba.Consultar(parametros.Items['id']);
      GET_ALL :resposta := 'GET_ALL' +#13+ProdutoClimba.ConsultarTodos();
      PUT     :resposta := 'PUT'     +#13+ProdutoClimba.Alterar(parametros);
      POST    :resposta := 'POST'    +#13+ProdutoClimba.Cadastrar(parametros);
  end;
  mmResposta.Lines.Add(resposta);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   DepartamentoClimba := TCDepartamentoClimba.Create();
   MarcaClimba        := TCMarcaClimba.Create();
   PrecoClimba        := TCPrecoClimba.Create();
   ProdutoClimba      := TCProdutoClimba.Create();
   parametros         := TDictionary<string,string>.Create();
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
    DepartamentoClimba.Free;
    MarcaClimba.Free;
    PrecoClimba.Free;
    ProdutoClimba.Free;
    parametros.Free;
end;

end.
