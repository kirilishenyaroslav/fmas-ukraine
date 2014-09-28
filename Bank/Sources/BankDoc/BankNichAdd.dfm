object fmBankNichAdd: TfmBankNichAdd
  Left = 696
  Top = 353
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1085#1085#1103' '#1088#1086#1079#1073#1080#1074#1082#1080
  ClientHeight = 292
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 513
    Height = 73
    Color = 16776176
    TabOrder = 0
    object lblGrSmt: TLabel
      Left = 16
      Top = 16
      Width = 103
      Height = 16
      Caption = #1043#1088#1091#1087#1072' '#1073#1102#1076#1078#1077#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = '@Microsoft JhengHei'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSum: TLabel
      Left = 16
      Top = 48
      Width = 34
      Height = 16
      Caption = #1057#1091#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = '@Microsoft JhengHei'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxSmEdit: TcxButtonEdit
      Left = 200
      Top = 8
      Width = 273
      Height = 24
      Cursor = crIBeam
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxSmEditPropertiesButtonClick
      Style.BorderColor = clWindowFrame
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = '@Microsoft JhengHei'
      Style.Font.Style = []
      TabOrder = 0
    end
    object cxSmEditNum: TcxTextEdit
      Left = 128
      Top = 8
      Width = 65
      Height = 24
      AutoSize = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.TransparentBorder = True
      TabOrder = 1
    end
    object cxSumEdit: TcxCurrencyEdit
      Left = 128
      Top = 40
      Width = 193
      Height = 24
      AutoSize = False
      Properties.DisplayFormat = ',0.00;-,0.00'
      Style.Color = clInfoBk
      TabOrder = 2
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 73
    Width = 513
    Height = 184
    Color = 16776176
    TabOrder = 1
    object lblRozd: TLabel
      Left = 16
      Top = 76
      Width = 44
      Height = 16
      Caption = #1056#1086#1079#1076#1110#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = '@Microsoft JhengHei'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDog: TLabel
      Left = 16
      Top = 130
      Width = 55
      Height = 16
      Caption = #1044#1086#1075#1086#1074#1110#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = '@Microsoft JhengHei'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMonth: TLabel
      Left = 16
      Top = 8
      Width = 48
      Height = 16
      Caption = #1052#1110#1089#1103#1094#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = '@Microsoft JhengHei'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblYear: TLabel
      Left = 16
      Top = 40
      Width = 19
      Height = 16
      Caption = #1056#1110#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = '@Microsoft JhengHei'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxRazdEdit: TcxButtonEdit
      Left = 200
      Top = 76
      Width = 273
      Height = 24
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxRazdEditPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = '@Microsoft JhengHei'
      Style.Font.Style = []
      TabOrder = 2
    end
    object cxDogEdit: TcxButtonEdit
      Left = 446
      Top = 130
      Width = 20
      Height = 24
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxDogEditPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = '@Microsoft JhengHei'
      Style.Font.Style = []
      TabOrder = 4
    end
    object cxMonthEdit: TcxComboBox
      Left = 128
      Top = 8
      Width = 193
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.ReadOnly = False
      Properties.OnChange = cxMonthEditPropertiesChange
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = '@Microsoft JhengHei'
      Style.Font.Style = []
      TabOrder = 0
    end
    object cxYearEdit: TcxTextEdit
      Left = 128
      Top = 40
      Width = 193
      Height = 24
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = '@Microsoft JhengHei'
      Style.Font.Style = []
      TabOrder = 1
    end
    object cxMemoEdit: TcxMemo
      Left = 128
      Top = 108
      Width = 321
      Height = 70
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = '@Microsoft JhengHei'
      Style.Font.Style = []
      TabOrder = 3
    end
    object cxRazdEditNum: TcxTextEdit
      Left = 128
      Top = 76
      Width = 65
      Height = 24
      AutoSize = False
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 5
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 256
    Width = 513
    Height = 41
    TabOrder = 2
    object cxExitButton: TcxButton
      Left = 358
      Top = 5
      Width = 91
      Height = 25
      Cursor = crHandPoint
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      DragCursor = crHandPoint
      TabOrder = 0
      OnClick = cxExitButtonClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000084000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000008400000084000000840084848400FF00FF00FF00FF00FF00FF00FF00
        FF00000084000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000008400000084000000840084848400FF00FF00FF00FF000000
        84000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000008400000084000000840084848400000084000000
        840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000084000000840000008400000084000000
        8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00000084000000FF00000084008484
        8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000084000000840000008400000084000000
        840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000084000000840000008400FF00FF00000084000000
        84000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000084000000840000008400FF00FF00FF00FF00FF00FF000000
        8400000084000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000084000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000084000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfFlat
      UseSystemPaint = False
    end
    object cxOkButton: TcxButton
      Left = 228
      Top = 5
      Width = 91
      Height = 25
      Cursor = crHandPoint
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      DragCursor = crHandPoint
      TabOrder = 1
      OnClick = cxOkButtonClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000000084840000FFFF000084840000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000FFFF0000FFFF0000FFFF0000FFFF00008484000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000000FFFF0000FFFF00848484008484840000FFFF0000FFFF000084
        840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008484840000FFFF0084848400FF00FF00FF00FF008484840000FFFF0000FF
        FF000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0084848400FF00FF00FF00FF00FF00FF00FF00FF008484840000FF
        FF0000FFFF000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
        840000FFFF0000FFFF000084840000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008484840000FFFF0000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008484840000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfFlat
      UseSystemPaint = False
    end
  end
  object DB1: TpFIBDatabase
    DefaultTransaction = Transaction
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 256
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB1
    TimeoutAction = TARollback
    TPBMode = tpbDefault
    Left = 56
    Top = 256
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = DB1
    Transaction = Transaction
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields, poKeepSorting]
    AutoCommit = True
    Left = 136
    Top = 257
    poSQLINT64ToBCD = True
  end
  object ds1: TDataSource
    DataSet = pFIBDataSet1
    Left = 176
    Top = 257
  end
  object TransactionWrite: TpFIBTransaction
    DefaultDatabase = DB1
    TimeoutAction = TARollback
    Left = 96
    Top = 257
  end
end
