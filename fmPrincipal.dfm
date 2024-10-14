object fmBuscaStrings: TfmBuscaStrings
  Left = 0
  Top = 0
  Caption = 'Pesquisar Strings'
  ClientHeight = 445
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 480
    Height = 129
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 447
    DesignSize = (
      480
      129)
    object Label1: TLabel
      Left = 22
      Top = 17
      Width = 96
      Height = 16
      Caption = 'Selecionar diret'#243'rio:'
    end
    object edPalavraBuscar: TLabeledEdit
      Left = 22
      Top = 80
      Width = 330
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 126
      EditLabel.Height = 13
      EditLabel.Caption = 'String que ser'#225' localizada:'
      TabOrder = 0
      ExplicitWidth = 297
    end
    object edBuscaDiretorio: TSearchBox
      Left = 22
      Top = 39
      Width = 436
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnInvokeSearch = edBuscaDiretorioInvokeSearch
    end
    object Button1: TButton
      Left = 358
      Top = 78
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Buscar'
      TabOrder = 2
      OnClick = Button1Click
      ExplicitLeft = 325
    end
  end
  object listArquivos: TListBox
    Left = 0
    Top = 129
    Width = 480
    Height = 316
    Align = alClient
    ItemHeight = 13
    TabOrder = 1
    ExplicitTop = 135
    ExplicitWidth = 447
  end
  object OpenDialog: TJvSelectDirectory
    Left = 200
    Top = 240
  end
end
