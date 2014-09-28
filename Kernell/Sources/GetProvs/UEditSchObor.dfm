object frmEditSchObor: TfrmEditSchObor
  Left = 296
  Top = 225
  BorderStyle = bsDialog
  Caption = #1054#1073#1086#1088#1086#1090#1099' '#1087#1086' '#1089#1095#1077#1090#1091
  ClientHeight = 263
  ClientWidth = 635
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
  object Bevel2: TBevel
    Left = 317
    Top = 74
    Width = 314
    Height = 79
  end
  object Bevel1: TBevel
    Left = 5
    Top = 74
    Width = 305
    Height = 79
  end
  object Label1: TLabel
    Left = 17
    Top = 82
    Width = 84
    Height = 13
    Caption = #1057#1095#1077#1090' '#1074' '#1076#1077#1073#1077#1090#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 325
    Top = 82
    Width = 91
    Height = 13
    Caption = #1057#1095#1077#1090' '#1074' '#1082#1088#1077#1076#1080#1090#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel3: TBevel
    Left = 4
    Top = 6
    Width = 627
    Height = 59
  end
  object Label3: TLabel
    Left = 28
    Top = 26
    Width = 245
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1054#1073#1086#1088#1086#1090#1099' '#1087#1086' '#1086#1087#1077#1088#1072#1094#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxButton1: TcxButton
    Left = 472
    Top = 232
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 552
    Top = 232
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object KrSch: TcxTextEdit
    Left = 16
    Top = 96
    Width = 269
    Height = 21
    Style.Color = clInfoBk
    TabOrder = 2
  end
  object DbSch: TcxTextEdit
    Left = 325
    Top = 98
    Width = 283
    Height = 21
    Style.Color = clInfoBk
    TabOrder = 3
  end
  object cxPopupEdit1: TcxPopupEdit
    Left = 283
    Top = 96
    Width = 20
    Height = 21
    Hint = #1056#1072#1079#1073#1080#1090#1100' '#1087#1086' '#1089#1084#1077#1090#1072#1084'/'#1088#1072#1079#1076#1077#1083#1072#1084'/'#1089#1090#1072#1090#1100#1103#1084'/'#1050#1028#1050#1047
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = 'cxPopupEdit1'
  end
  object cxPopupEdit2: TcxPopupEdit
    Left = 606
    Top = 98
    Width = 20
    Height = 21
    Hint = #1056#1072#1079#1073#1080#1090#1100' '#1087#1086' '#1089#1084#1077#1090#1072#1084'/'#1088#1072#1079#1076#1077#1083#1072#1084'/'#1089#1090#1072#1090#1100#1103#1084'/'#1050#1028#1050#1047
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Text = 'cxPopupEdit1'
  end
  object EdSum: TcxCalcEdit
    Left = 280
    Top = 24
    Width = 345
    Height = 21
    EditValue = '0'
    Style.Color = clInfoBk
    TabOrder = 6
  end
  object cxMemo1: TcxMemo
    Left = 5
    Top = 157
    Width = 627
    Height = 57
    Style.Color = clInfoBk
    TabOrder = 7
    Visible = False
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 24
    Top = 368
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clRed
    end
  end
  object WorkDatabase: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 16
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 48
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 80
    Top = 16
  end
end
