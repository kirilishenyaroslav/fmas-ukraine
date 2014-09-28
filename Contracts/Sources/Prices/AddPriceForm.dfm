object frmGetPriceInfo: TfrmGetPriceInfo
  Left = 351
  Top = 294
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1087#1088#1077#1081#1089#1082#1091#1088#1072#1085#1090#1091
  ClientHeight = 131
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 456
    Height = 90
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 68
      Top = 40
      Width = 56
      Height = 16
      Caption = #1055#1086#1095#1072#1090#1086#1082
    end
    object Label2: TLabel
      Left = 51
      Top = 64
      Width = 74
      Height = 16
      Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
    end
    object Label3: TLabel
      Left = 26
      Top = 13
      Width = 98
      Height = 16
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
    end
    object cbMonthBeg: TComboBox
      Left = 133
      Top = 36
      Width = 224
      Height = 22
      Style = csOwnerDrawFixed
      Color = clGradientActiveCaption
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object cbMonthEnd: TComboBox
      Left = 133
      Top = 61
      Width = 224
      Height = 22
      Style = csOwnerDrawFixed
      Color = clGradientActiveCaption
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object cbYearEnd: TComboBox
      Left = 358
      Top = 60
      Width = 88
      Height = 22
      Style = csOwnerDrawFixed
      Color = clGradientActiveCaption
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object cbYearBeg: TComboBox
      Left = 358
      Top = 36
      Width = 88
      Height = 22
      Style = csOwnerDrawFixed
      Color = clGradientActiveCaption
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
    object cxTextEdit1: TcxTextEdit
      Left = 133
      Top = 8
      Width = 311
      Height = 24
      Properties.MaxLength = 60
      Style.BorderStyle = ebs3D
      Style.Color = clGradientActiveCaption
      TabOrder = 4
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 90
    Width = 456
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 368
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
end
