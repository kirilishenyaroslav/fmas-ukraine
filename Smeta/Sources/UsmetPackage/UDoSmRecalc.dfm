object frmBURecalc: TfrmBURecalc
  Left = 320
  Top = 195
  Width = 592
  Height = 337
  Caption = #1055#1077#1088#1077#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1092#1072#1082#1090#1080#1095#1085#1080#1093' '#1087#1086#1082#1072#1079#1085#1080#1082#1110#1074' '#1073#1102#1076#1078#1077#1090#1110#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 269
    Align = alClient
    TabOrder = 0
    object Label3: TLabel
      Left = 20
      Top = 8
      Width = 296
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1087#1077#1088#1110#1086#1076#1091' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 33
      Width = 304
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1044#1072#1090#1072' '#1082#1110#1085#1094#1103' '#1087#1077#1088#1110#1086#1076#1091' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 10
      Top = 61
      Width = 164
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1030#1085#1076#1110#1082#1072#1090#1086#1088' '#1087#1088#1086#1094#1077#1089#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbMonthDateTo: TComboBox
      Left = 319
      Top = 32
      Width = 129
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
      TabStop = False
    end
    object cbMonthDateFrom: TComboBox
      Left = 319
      Top = 8
      Width = 128
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
      TabStop = False
    end
    object cbYearDateFrom: TComboBox
      Left = 445
      Top = 8
      Width = 79
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
      TabOrder = 2
      TabStop = False
    end
    object cbYearDateTo: TComboBox
      Left = 445
      Top = 32
      Width = 79
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
      TabOrder = 3
      TabStop = False
    end
    object CalcProgressBar: TProgressBar
      Left = 179
      Top = 60
      Width = 345
      Height = 37
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 269
    Width = 584
    Height = 41
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 192
      Top = 8
      Width = 265
      Height = 25
      Caption = #1055#1086#1095#1072#1090#1080' '#1087#1088#1086#1094#1077#1089
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 464
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = CalcTransaction
    DefaultUpdateTransaction = CalcTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 440
    Top = 88
  end
  object CalcTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 472
    Top = 88
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 504
    Top = 87
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 24
    Top = 88
  end
end
