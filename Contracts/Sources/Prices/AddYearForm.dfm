object frmGetYear: TfrmGetYear
  Left = 396
  Top = 486
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1079#1072' '#1072#1082#1072#1076#1077#1084#1110#1095#1085#1080#1081' '#1088#1110#1082
  ClientHeight = 116
  ClientWidth = 414
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
  object Panel1: TPanel
    Left = 0
    Top = 75
    Width = 414
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 248
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 414
    Height = 75
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 26
      Top = 16
      Width = 56
      Height = 16
      Caption = #1055#1086#1095#1072#1090#1086#1082
    end
    object Label2: TLabel
      Left = 9
      Top = 40
      Width = 74
      Height = 16
      Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
    end
    object cbMonthBeg: TComboBox
      Left = 88
      Top = 12
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
      Left = 88
      Top = 37
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
      Left = 313
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
      TabOrder = 2
    end
    object cbYearBeg: TComboBox
      Left = 313
      Top = 12
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
  end
end
