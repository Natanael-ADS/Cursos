object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Demo Climba'
  ClientHeight = 266
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    584
    266)
  PixelsPerInch = 96
  TextHeight = 13
  object btnProduto: TButton
    Left = 8
    Top = 11
    Width = 88
    Height = 25
    Caption = 'Produto'
    TabOrder = 0
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
    Height = 244
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    ExplicitHeight = 260
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 135
    Width = 88
    Height = 121
    Caption = 'Teste'
    Items.Strings = (
      'GET'
      'GET ALL'
      'PUT'
      'POST')
    TabOrder = 5
  end
end
