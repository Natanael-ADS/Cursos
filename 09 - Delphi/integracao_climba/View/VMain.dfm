object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Demo Climba'
  ClientHeight = 334
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    584
    334)
  PixelsPerInch = 96
  TextHeight = 13
  object btnProduto: TButton
    Left = 8
    Top = 11
    Width = 88
    Height = 25
    Caption = 'Produto'
    TabOrder = 0
    OnClick = btnProdutoClick
  end
  object btnMarca: TButton
    Left = 8
    Top = 42
    Width = 88
    Height = 25
    Caption = 'Marca'
    TabOrder = 1
    OnClick = btnMarcaClick
  end
  object btndepartamento: TButton
    Left = 8
    Top = 73
    Width = 88
    Height = 25
    Caption = 'Departamento'
    TabOrder = 2
    OnClick = btndepartamentoClick
  end
  object btnpedido: TButton
    Left = 8
    Top = 104
    Width = 88
    Height = 25
    Caption = 'Pedido'
    TabOrder = 3
  end
  object mmResposta: TMemo
    Left = 102
    Top = 11
    Width = 474
    Height = 312
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
  end
  object rgTipo: TRadioGroup
    Left = 8
    Top = 163
    Width = 88
    Height = 121
    Caption = 'METHOD'
    ItemIndex = 0
    Items.Strings = (
      'GET'
      'GET ALL'
      'PUT'
      'POST')
    TabOrder = 5
  end
  object btnPreco: TButton
    Left = 8
    Top = 132
    Width = 88
    Height = 25
    Caption = 'Pre'#231'o'
    TabOrder = 6
    OnClick = btnPrecoClick
  end
end
