object frmEditAcc: TfrmEditAcc
  Left = 310
  Top = 168
  Width = 519
  Height = 327
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 248
    Width = 503
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 336
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 416
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
    Width = 503
    Height = 248
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 122
      Top = 36
      Width = 99
      Height = 16
      Caption = #1053#1086#1084#1077#1088' '#1088#1072#1093#1091#1085#1082#1072
    end
    object Label3: TLabel
      Left = 53
      Top = 68
      Width = 169
      Height = 16
      Caption = #1055#1086#1095#1072#1090#1086#1082' '#1079#1074#1110#1090#1085#1086#1075#1086' '#1087#1077#1088#1110#1086#1076#1091
    end
    object Label4: TLabel
      Left = 34
      Top = 107
      Width = 187
      Height = 16
      Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1079#1074#1110#1090#1085#1086#1075#1086' '#1087#1077#1088#1110#1086#1076#1091
    end
    object Label5: TLabel
      Left = 157
      Top = 155
      Width = 60
      Height = 16
      Caption = #1055#1088#1080#1084#1110#1090#1082#1080
    end
    object EdAccNum: TcxTextEdit
      Left = 232
      Top = 32
      Width = 241
      Height = 24
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = clMenu
      TabOrder = 5
      Text = #1053#1086#1074#1080#1081' '#1085#1086#1084#1077#1088' '#1088#1072#1093#1091#1085#1082#1072
    end
    object EdNote: TcxMemo
      Left = 232
      Top = 152
      Width = 249
      Height = 89
      Properties.MaxLength = 250
      Style.Color = clInfoBk
      TabOrder = 4
    end
    object cbMonthBeg: TComboBox
      Left = 234
      Top = 66
      Width = 154
      Height = 22
      BevelInner = bvNone
      BevelOuter = bvNone
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object cbYearBeg: TComboBox
      Left = 389
      Top = 66
      Width = 84
      Height = 22
      BevelInner = bvNone
      BevelOuter = bvNone
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object cbMonthEnd: TComboBox
      Left = 234
      Top = 106
      Width = 154
      Height = 22
      BevelInner = bvNone
      BevelOuter = bvNone
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object cbYearEnd: TComboBox
      Left = 389
      Top = 106
      Width = 84
      Height = 22
      BevelInner = bvNone
      BevelOuter = bvNone
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
  end
end
