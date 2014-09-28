object Report_Settings_Form: TReport_Settings_Form
  Left = 315
  Top = 208
  Width = 813
  Height = 703
  Caption = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103' '#1096#1072#1073#1083#1086#1085#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 16
    Top = 8
    Width = 769
    Height = 617
    TabOrder = 18
  end
  object cxLabel1: TcxLabel
    Left = 24
    Top = 112
    Width = 118
    Height = 17
    Properties.WordWrap = True
    TabOrder = 0
    Caption = #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1082#1086#1076' '#1079#1072' '#1028#1044#1056#1055#1054#1059
  end
  object cxLabel2: TcxLabel
    Left = 160
    Top = 112
    Width = 97
    Height = 25
    AutoSize = False
    Style.BorderColor = clBlack
    Style.BorderStyle = ebsSingle
    Style.TransparentBorder = False
    TabOrder = 1
    Caption = ''
  end
  object cxLabel3: TcxLabel
    Left = 664
    Top = 112
    Width = 97
    Height = 25
    AutoSize = False
    Style.BorderColor = clBlack
    Style.BorderStyle = ebsSingle
    Style.TransparentBorder = False
    TabOrder = 2
    Caption = ''
  end
  object cxLabel4: TcxLabel
    Left = 528
    Top = 112
    Width = 78
    Height = 17
    TabOrder = 3
    Caption = #1050#1086#1076' '#1079#1072' '#1044#1050#1059#1044
  end
  object cxLabel5: TcxLabel
    Left = 80
    Top = 32
    Width = 93
    Height = 17
    TabOrder = 4
    Caption = '('#1085#1072#1079#1074#1072' '#1091#1089#1090#1072#1085#1086#1074#1080')'
  end
  object TextEditTypeForm: TcxTextEdit
    Left = 528
    Top = 16
    Width = 241
    Height = 21
    TabOrder = 5
  end
  object MemoNakazForm: TcxMemo
    Left = 528
    Top = 48
    Width = 241
    Height = 57
    TabOrder = 6
  end
  object cxLabel6: TcxLabel
    Left = 272
    Top = 184
    Width = 224
    Height = 28
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 7
    Caption = #1052#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1081' '#1086#1088#1076#1077#1088' '#8470
  end
  object cxLabel7: TcxLabel
    Left = 312
    Top = 224
    Width = 134
    Height = 17
    TabOrder = 8
    Caption = #1079#1072' ____________ 20__ '#1088'.'
  end
  object TextEditHeader: TcxTextEdit
    Left = 40
    Top = 256
    Width = 721
    Height = 21
    Properties.Alignment.Horz = taCenter
    TabOrder = 9
  end
  object cxLabel8: TcxLabel
    Left = 56
    Top = 16
    Width = 152
    Height = 17
    TabOrder = 10
    Caption = '________________________'
  end
  object cxLabel9: TcxLabel
    Left = 16
    Top = 312
    Width = 755
    Height = 17
    TabOrder = 11
    Caption = 
      '................................................................' +
      '................................................................' +
      '................................................................' +
      '.........................................................'
  end
  object cxLabel10: TcxLabel
    Left = 48
    Top = 456
    Width = 319
    Height = 17
    TabOrder = 12
    Caption = #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100'                                           /   ...   /'
  end
  object MemoFooter1: TcxMemo
    Left = 48
    Top = 360
    Width = 705
    Height = 89
    TabOrder = 13
  end
  object MemoFooter2: TcxMemo
    Left = 48
    Top = 480
    Width = 705
    Height = 89
    TabOrder = 14
  end
  object cxLabel11: TcxLabel
    Left = 48
    Top = 584
    Width = 129
    Height = 17
    TabOrder = 15
    Caption = '"__"__________ 20__ '#1088'.'
  end
  object cxButton1: TcxButton
    Left = 624
    Top = 632
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 16
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 712
    Top = 632
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    TabOrder = 17
  end
  object DB: TpFIBDatabase
    DefaultTransaction = Transaction
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 72
    Top = 632
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
    Top = 632
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = Transaction
    Left = 152
    Top = 632
  end
end
