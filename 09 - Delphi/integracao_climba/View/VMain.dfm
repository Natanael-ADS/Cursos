object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Demo Climba'
  ClientHeight = 141
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    536
    141)
  PixelsPerInch = 96
  TextHeight = 13
  object btnProduto: TButton
    Left = 24
    Top = 12
    Width = 75
    Height = 25
    Caption = 'Produto'
    TabOrder = 0
  end
  object btnMarca: TButton
    Left = 24
    Top = 43
    Width = 75
    Height = 25
    Caption = 'Marca'
    TabOrder = 1
  end
  object btndepartamento: TButton
    Left = 24
    Top = 74
    Width = 75
    Height = 25
    Caption = 'Departamento'
    TabOrder = 2
  end
  object btnpedido: TButton
    Left = 24
    Top = 105
    Width = 75
    Height = 25
    Caption = 'Pedido'
    TabOrder = 3
  end
  object mmResposta: TMemo
    Left = 105
    Top = 12
    Width = 408
    Height = 118
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
  end
end