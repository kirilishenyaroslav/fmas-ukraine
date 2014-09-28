object frmGetWorkdate: TfrmGetWorkdate
  Left = 309
  Top = 195
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1095#1080#1081' '#1087#1077#1088#1110#1086#1076
  ClientHeight = 97
  ClientWidth = 362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 56
    Width = 362
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 144
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = cxButton1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 362
    Height = 56
    Align = alClient
    TabOrder = 1
    object cbMonthBeg: TComboBox
      Left = 70
      Top = 18
      Width = 130
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
    end
    object cbYearBeg: TComboBox
      Left = 200
      Top = 18
      Width = 88
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 1
    end
  end
end
