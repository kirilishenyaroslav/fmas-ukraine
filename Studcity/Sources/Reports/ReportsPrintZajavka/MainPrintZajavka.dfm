object frmMainPrintZajavka: TfrmMainPrintZajavka
  Left = 369
  Top = 333
  Width = 455
  Height = 167
  Caption = 'frmMainPrintZajavka'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 119
    Width = 447
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object cxTextEditWork: TcxTextEdit
    Left = 8
    Top = 24
    Width = 433
    Height = 21
    Properties.MaxLength = 0
    Style.Color = clInfoBk
    TabOrder = 1
    OnKeyDown = cxTextEditWorkKeyDown
  end
  object cxTextEditSpec: TcxTextEdit
    Left = 8
    Top = 64
    Width = 433
    Height = 21
    Properties.MaxLength = 0
    Style.Color = clInfoBk
    TabOrder = 2
    OnKeyDown = cxTextEditSpecKeyDown
  end
  object cxLabelSpec: TcxLabel
    Left = 8
    Top = 48
    Width = 315
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
    Caption = 
      'cxLabelWork                                                     ' +
      '     '
  end
  object cxLabelWork: TcxLabel
    Left = 8
    Top = 8
    Width = 315
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Caption = 
      'cxLabelWork                                                     ' +
      '     '
  end
  object cxButton1: TcxButton
    Left = 280
    Top = 90
    Width = 75
    Height = 25
    Caption = #1044#1088#1091#1082' (F10)'
    TabOrder = 5
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 364
    Top = 90
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 6
    OnClick = cxButton2Click
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TACommit
    Left = 104
    Top = 16
  end
  object pFIBDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 72
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TARollback
    Left = 72
    Top = 48
  end
  object pFIBDataSet: TpFIBDataSet
    Database = pFIBDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from ST_PRINT_ZAJAVKA(:param_people) ')
    Left = 216
    Top = 16
    poSQLINT64ToBCD = True
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    DataSet = pFIBDataSet
    Left = 248
    Top = 16
  end
  object ActionList1: TActionList
    Left = 248
    Top = 48
    object Designer: TAction
      Caption = 'Designer'
      ShortCut = 57412
      OnExecute = DesignerExecute
    end
    object PrintDoc: TAction
      Caption = 'PrintDoc'
      ShortCut = 121
      OnExecute = PrintDocExecute
    end
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38631.586427384300000000
    ReportOptions.LastChange = 40332.453986724540000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReportGetValue
    Left = 152
    Top = 48
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
      end>
    Variables = <
      item
        Name = 'ST_WORK'
        Value = #39#39
      end
      item
        Name = 'ST_SPEC'
        Value = #39#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Memo1: TfrxMemoView
        Left = 37.795300000000000000
        Width = 684.094930000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        HAlign = haCenter
        Memo.Strings = (
          '[VUZ]')
        ParentFont = False
      end
      object Memo2: TfrxMemoView
        Left = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 684.094930000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        HAlign = haCenter
        Memo.Strings = (
          #1057#1058#1059#1044#1045#1053#1058#1057#1068#1050#1045' '#1052#1030#1057#1058#1045#1063#1050#1054)
        ParentFont = False
      end
      object Memo3: TfrxMemoView
        Left = 37.795300000000000000
        Top = 75.590600000000000000
        Width = 147.401670000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[Date]')
        ParentFont = False
      end
      object Memo4: TfrxMemoView
        Left = 185.196970000000000000
        Top = 75.590600000000000000
        Width = 26.456710000000000000
        Height = 18.897650000000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          #8470)
        ParentFont = False
      end
      object Memo5: TfrxMemoView
        Align = baLeft
        Left = 211.653680000000000000
        Top = 75.590600000000000000
        Width = 128.504020000000000000
        Height = 18.897650000000000000
        DataField = 'OUT_NUM_DOC'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_NUM_DOC"]')
        ParentFont = False
      end
      object Memo6: TfrxMemoView
        Left = 377.953000000000000000
        Top = 113.385900000000000000
        Width = 340.157700000000000000
        Height = 86.929190000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          #1053#1072#1095#1072#1083#1100#1085#1080#1082#1091' '#1074#1110#1076#1076#1110#1083#1077#1085#1085#1103' '#1075#1088#1086#1084#1072#1076#1103#1085#1089#1100#1082#1086#1111' '#1090#1072' '
          #1110#1084#1084#1110#1075#1088#1072#1094#1110#1081#1085#1085#1086#1111' '#1089#1083#1091#1078#1073#1080' '#1042#1086#1088#1086#1096#1080#1083#1086#1074#1089#1100#1082#1086#1075#1086
          #1056#1042' '#1044#1052#1059' '#1059#1052#1042#1057' '#1059#1082#1088#1072#1111#1085#1080' '#1074' '#1044#1086#1085#1077#1094#1082#1110#1111' '#1086#1073#1083#1072#1089#1090#1110' '
          #1084#1072#1081#1086#1088#1091' '#1084#1110#1083#1110#1094#1110#1111
          #1065#1077#1088#1073#1080#1085#1110' '#1042'.'#1042'.')
        ParentFont = False
      end
      object Memo7: TfrxMemoView
        Left = 37.795300000000000000
        Top = 264.567100000000000000
        Width = 188.976500000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '    '#1055#1088#1086#1096#1091' '#1079#1072#1088#1077#1108#1089#1090#1088#1091#1074#1072#1090#1080' ')
        ParentFont = False
      end
      object Memo8: TfrxMemoView
        Left = 226.771800000000000000
        Top = 264.567100000000000000
        Width = 491.338900000000000000
        Height = 18.897650000000000000
        DataField = 'OUT_FIO'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_FIO"]')
        ParentFont = False
      end
      object Memo9: TfrxMemoView
        Left = 226.771800000000000000
        Top = 283.464750000000000000
        Width = 491.338900000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        HAlign = haCenter
        Memo.Strings = (
          '('#1055'.'#1030'.'#1041'.)')
        ParentFont = False
      end
      object Memo10: TfrxMemoView
        Left = 45.354360000000000000
        Top = 521.575140000000000000
        Width = 22.677180000000000000
        Height = 18.897650000000000000
        Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          #1076#1086)
        ParentFont = False
      end
      object Memo11: TfrxMemoView
        Left = 68.031540000000010000
        Top = 521.575140000000100000
        Width = 86.929190000000000000
        Height = 18.897650000000000000
        Visible = False
        DataField = 'OUT_DATE_END'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_DATE_END"]')
        ParentFont = False
      end
      object Memo12: TfrxMemoView
        Left = 37.795300000000000000
        Top = 302.362400000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          #1079#1072' '#1072#1076#1088#1077#1089#1086#1102':')
        ParentFont = False
      end
      object Memo13: TfrxMemoView
        Left = 132.283550000000000000
        Top = 302.362400000000000000
        Width = 585.827150000000000000
        Height = 18.897650000000000000
        DataField = 'OUT_TOWN'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_TOWN"]')
        ParentFont = False
      end
      object Memo14: TfrxMemoView
        Left = 37.795300000000000000
        Top = 321.260050000000000000
        Width = 41.574830000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          #1073#1091#1076'.')
        ParentFont = False
      end
      object Memo15: TfrxMemoView
        Left = 79.370130000000000000
        Top = 321.260050000000000000
        Width = 56.692950000000010000
        Height = 18.897650000000000000
        DataField = 'OUT_NUM_BUILD'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_NUM_BUILD"]')
        ParentFont = False
      end
      object Memo16: TfrxMemoView
        Left = 136.063080000000000000
        Top = 321.260050000000000000
        Width = 49.133890000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          #1082#1086#1088#1087'.')
        ParentFont = False
      end
      object Memo17: TfrxMemoView
        Left = 185.196970000000000000
        Top = 321.260050000000000000
        Width = 41.574830000000000000
        Height = 18.897650000000000000
        DataField = 'OUT_NAME_BUILD'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_NAME_BUILD"]')
        ParentFont = False
      end
      object Memo18: TfrxMemoView
        Left = 238.110390000000000000
        Top = 321.260050000000000000
        Width = 26.456710000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          #1082#1074'.')
        ParentFont = False
      end
      object Memo19: TfrxMemoView
        Left = 264.567100000000000000
        Top = 321.260050000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        DataField = 'OUT_ROOM'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_ROOM"]')
        ParentFont = False
      end
      object Memo20: TfrxMemoView
        Left = 343.937230000000000000
        Top = 321.260050000000000000
        Width = 162.519790000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          #1091' '#1079#1074#39#1103#1079#1082#1091' '#1079' '#1088#1086#1073#1086#1090#1086#1102)
        ParentFont = False
      end
      object Memo21: TfrxMemoView
        Left = 506.457020000000000000
        Top = 321.260050000000000000
        Width = 211.653680000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo22: TfrxMemoView
        Left = 37.795300000000000000
        Top = 340.157700000000000000
        Width = 680.315400000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[ST_WORK]')
        ParentFont = False
      end
      object Memo23: TfrxMemoView
        Left = 37.795300000000000000
        Top = 359.055350000000000000
        Width = 680.315400000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[ST_SPEC]')
        ParentFont = False
      end
      object Memo24: TfrxMemoView
        Left = 37.795300000000000000
        Top = 453.543600000000000000
        Width = 200.315090000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          #1053#1072#1095'. '#1087#1072#1089#1087#1086#1088#1090#1085#1086#1075#1086' '#1074#1110#1076#1076#1110#1083#1091)
        ParentFont = False
      end
      object Memo25: TfrxMemoView
        Left = 415.748300000000000000
        Top = 453.543600000000000000
        Width = 283.464750000000000000
        Height = 18.897650000000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        HAlign = haCenter
        Memo.Strings = (
          '[NA4ALNIK]')
        ParentFont = False
      end
    end
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 120
    Top = 48
  end
end
