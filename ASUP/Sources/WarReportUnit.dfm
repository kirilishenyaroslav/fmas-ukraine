object WarReportForm: TWarReportForm
  Left = 380
  Top = 146
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1047#1074#1110#1090' '#1087#1086' '#1074#1110#1081#1089#1082#1086#1074#1086#1084#1091' '#1086#1073#1083#1110#1082#1091
  ClientHeight = 360
  ClientWidth = 362
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 174
    Height = 13
    Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1079#1074#1110#1090' '#1089#1090#1072#1085#1086#1084' '#1085#1072' :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 40
    Width = 62
    Height = 13
    Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 96
    Width = 113
    Height = 13
    Caption = #1060#1110#1083#1100#1090#1088' '#1079#1072' '#1073#1088#1086#1085#1077#1102':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OkButton: TBitBtn
    Left = 7
    Top = 312
    Width = 97
    Height = 27
    Caption = #1043#1072#1088#1072#1079#1076
    Default = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = OkButtonClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777772222277777777722222222277777722222222222777722222222222
      22777222227F22222277222227FFF222222722227F7FF222222722222222FF22
      222722222222FF222227222222222FF22227722222222FF22277722222222222
      2277772222222222277777722222222277777777722222777777}
  end
  object CancelButton: TBitBtn
    Left = 255
    Top = 312
    Width = 97
    Height = 27
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 6
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777770777777777707770907777777779777999077777770777799997777770
      9777779990777709777777799907709977777777999009977777777779999977
      7777777770999077777777770999990777777700999779907777709999777799
      0777799997777779907779997777777779777777777777777777}
  end
  object ExportButton: TBitBtn
    Left = 128
    Top = 312
    Width = 105
    Height = 27
    Caption = #1045#1082#1089#1087#1086#1088#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = OkButtonClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
      33333333330A033333333333330A033333333333330A033333333333330A0333
      33333333330A033333333330000A000033333330AAAAAAA0333333330AAAAA03
      333333330AAAAA033333333330AAA0333333333330AAA03333333333330A0333
      33333333330A0333333333333330333333333333333033333333}
  end
  object ReportDate: TDateTimePicker
    Left = 224
    Top = 12
    Width = 121
    Height = 21
    Date = 38457.000000000000000000
    Time = 38457.000000000000000000
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 128
    Width = 329
    Height = 81
    Caption = #1058#1080#1087' '#1079#1074#1110#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object RadioButton1: TRadioButton
      Left = 8
      Top = 24
      Width = 113
      Height = 17
      Caption = #1055#1086#1074#1085#1080#1081
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 48
      Width = 113
      Height = 17
      Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1080#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object DepartmentEdit: TEdit
    Left = 18
    Top = 62
    Width = 303
    Height = 21
    ReadOnly = True
    TabOrder = 8
  end
  object DepartmentButton: TBitBtn
    Left = 328
    Top = 62
    Width = 20
    Height = 20
    Caption = '...'
    TabOrder = 1
    OnClick = DepartmentButtonClick
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 232
    Width = 329
    Height = 57
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1079#1074#1110#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object Label2: TLabel
      Left = 8
      Top = 28
      Width = 94
      Height = 13
      Caption = #1056#1086#1079#1084#1110#1088' '#1096#1088#1080#1092#1090#1110#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SizeEdit: TSpinEdit
      Left = 112
      Top = 23
      Width = 57
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxValue = 72
      MinValue = 1
      ParentFont = False
      TabOrder = 0
      Value = 7
    end
  end
  object BronFilterBox: TComboBox
    Left = 144
    Top = 92
    Width = 201
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = #1091#1089#1110' '#1079#1072#1087#1080#1089#1080
    Items.Strings = (
      #1091#1089#1110' '#1079#1072#1087#1080#1089#1080
      #1108' '#1073#1088#1086#1085#1103
      #1085#1077#1084#1072#1108' '#1073#1088#1086#1085#1110)
  end
  object ReportQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * '
      
        'from REPORT_WARPOST_SMALL(:id_department, :report_date, :bron_fi' +
        'lter)'
      'order by Familia, Imya, Otchestvo')
    Left = 296
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_department'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'report_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bron_filter'
        ParamType = ptUnknown
      end>
    object ReportQueryID_PCARD: TIntegerField
      FieldName = 'ID_PCARD'
      Origin = 'REPORT_WARPOST_SMALL.ID_PCARD'
    end
    object ReportQueryID_MAN: TIntegerField
      FieldName = 'ID_MAN'
      Origin = 'REPORT_WARPOST_SMALL.ID_MAN'
    end
    object ReportQueryFAMILIA: TIBStringField
      FieldName = 'FAMILIA'
      Origin = 'REPORT_WARPOST_SMALL.FAMILIA'
    end
    object ReportQueryIMYA: TIBStringField
      FieldName = 'IMYA'
      Origin = 'REPORT_WARPOST_SMALL.IMYA'
    end
    object ReportQueryOTCHESTVO: TIBStringField
      FieldName = 'OTCHESTVO'
      Origin = 'REPORT_WARPOST_SMALL.OTCHESTVO'
    end
    object ReportQueryID_WARPOST: TIntegerField
      FieldName = 'ID_WARPOST'
      Origin = 'REPORT_WARPOST_SMALL.ID_WARPOST'
    end
    object ReportQueryID_CATEGORY: TIntegerField
      FieldName = 'ID_CATEGORY'
      Origin = 'REPORT_WARPOST_SMALL.ID_CATEGORY'
    end
    object ReportQueryNAME_WARPOST: TIBStringField
      FieldName = 'NAME_WARPOST'
      Origin = 'REPORT_WARPOST_SMALL.NAME_WARPOST'
      Size = 255
    end
    object ReportQueryID_WARSOSTAV: TIntegerField
      FieldName = 'ID_WARSOSTAV'
      Origin = 'REPORT_WARPOST_SMALL.ID_WARSOSTAV'
    end
    object ReportQueryNAME_WARSOSTAV: TIBStringField
      FieldName = 'NAME_WARSOSTAV'
      Origin = 'REPORT_WARPOST_SMALL.NAME_WARSOSTAV'
      Size = 255
    end
    object ReportQueryID_WARPOSTGR: TIntegerField
      FieldName = 'ID_WARPOSTGR'
      Origin = 'REPORT_WARPOST_SMALL.ID_WARPOSTGR'
    end
    object ReportQueryNAME_WARPOSTGR: TIBStringField
      FieldName = 'NAME_WARPOSTGR'
      Origin = 'REPORT_WARPOST_SMALL.NAME_WARPOSTGR'
      Size = 255
    end
  end
  object Report: TfrReport
    Dataset = DataSet
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 264
    Top = 144
    ReportForm = {19000000}
  end
  object DataSet: TfrDBDataSet
    DataSet = ReportQuery
    Left = 232
    Top = 144
  end
  object ReportQuery2: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM REPORT_WARPOST(:GOOD_DATE, :ID_DEPARTMENT, :bron_f' +
        'ilter)'
      'order by FIO')
    Left = 296
    Top = 176
    ParamData = <
      item
        DataType = ftDate
        Name = 'Good_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ID_DEPARTMENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bron_filter'
        ParamType = ptUnknown
      end>
    object ReportQuery2FIO: TIBStringField
      FieldName = 'FIO'
      Origin = 'REPORT_WARPOST.FIO'
      Size = 62
    end
    object ReportQuery2BIRTH_DATE: TDateField
      FieldName = 'BIRTH_DATE'
      Origin = 'REPORT_WARPOST.BIRTH_DATE'
    end
    object ReportQuery2NAME_WARPOST: TIBStringField
      FieldName = 'NAME_WARPOST'
      Origin = 'REPORT_WARPOST.NAME_WARPOST'
      Size = 255
    end
    object ReportQuery2NAME_WARPOSTGR: TIBStringField
      FieldName = 'NAME_WARPOSTGR'
      Origin = 'REPORT_WARPOST.NAME_WARPOSTGR'
      Size = 255
    end
    object ReportQuery2NAME_POST: TIBStringField
      FieldName = 'NAME_POST'
      Origin = 'REPORT_WARPOST.NAME_POST'
      Size = 255
    end
    object ReportQuery2STREET: TIBStringField
      FieldName = 'STREET'
      Origin = 'REPORT_WARPOST.STREET'
      Size = 180
    end
    object ReportQuery2KORPUS: TIBStringField
      FieldName = 'KORPUS'
      Origin = 'REPORT_WARPOST.KORPUS'
      Size = 6
    end
    object ReportQuery2HOUSE: TIBStringField
      FieldName = 'HOUSE'
      Origin = 'REPORT_WARPOST.HOUSE'
      Size = 6
    end
    object ReportQuery2FLAT: TIBStringField
      FieldName = 'FLAT'
      Origin = 'REPORT_WARPOST.FLAT'
      Size = 6
    end
    object ReportQuery2DATE_BEG: TDateField
      FieldName = 'DATE_BEG'
      Origin = 'REPORT_WARPOST.DATE_BEG'
    end
    object ReportQuery2DATE_END: TDateField
      FieldName = 'DATE_END'
      Origin = 'REPORT_WARPOST.DATE_END'
    end
    object ReportQuery2NAME_COUNTRY: TIBStringField
      FieldName = 'NAME_COUNTRY'
      Origin = 'REPORT_WARPOST.NAME_COUNTRY'
      Size = 30
    end
    object ReportQuery2NAME_TYPE_STREET: TIBStringField
      FieldName = 'NAME_TYPE_STREET'
      Origin = 'REPORT_WARPOST.NAME_TYPE_STREET'
      Size = 30
    end
    object ReportQuery2NAME_DISTRICT: TIBStringField
      FieldName = 'NAME_DISTRICT'
      Origin = 'REPORT_WARPOST.NAME_DISTRICT'
      Size = 30
    end
    object ReportQuery2NAME_PLACE: TIBStringField
      FieldName = 'NAME_PLACE'
      Origin = 'REPORT_WARPOST.NAME_PLACE'
      Size = 30
    end
    object ReportQuery2NAME_REGION: TIBStringField
      FieldName = 'NAME_REGION'
      Origin = 'REPORT_WARPOST.NAME_REGION'
      Size = 30
    end
    object ReportQuery2STREET_COMPARED: TIBStringField
      FieldName = 'STREET_COMPARED'
      Origin = 'REPORT_WARPOST.STREET_COMPARED'
      Size = 100
    end
    object ReportQuery2PLACE: TIBStringField
      FieldName = 'PLACE'
      Origin = 'REPORT_WARPOST.PLACE'
      Size = 70
    end
    object ReportQuery2ZIP: TIBStringField
      FieldName = 'ZIP'
      Origin = 'REPORT_WARPOST.ZIP'
      Size = 30
    end
    object ReportQuery2NAME_TYPE_PLACE: TIBStringField
      FieldName = 'NAME_TYPE_PLACE'
      Origin = 'REPORT_WARPOST.NAME_TYPE_PLACE'
      Size = 40
    end
    object ReportQuery2NAME_TYPE_REGION: TIBStringField
      FieldName = 'NAME_TYPE_REGION'
      Origin = 'REPORT_WARPOST.NAME_TYPE_REGION'
      Size = 40
    end
    object ReportQuery2REGION: TIBStringField
      FieldName = 'REGION'
      Origin = 'REPORT_WARPOST.REGION'
      Size = 70
    end
    object ReportQuery2ACCEPT_DATE: TDateField
      FieldName = 'ACCEPT_DATE'
      Origin = 'REPORT_WARPOST.ACCEPT_DATE'
    end
    object ReportQuery2VOENKOMAT: TIBStringField
      FieldName = 'VOENKOMAT'
      Origin = 'REPORT_WARPOST.VOENKOMAT'
      Size = 255
    end
    object ReportQuery2ID_CATEGORY: TIntegerField
      FieldName = 'ID_CATEGORY'
      Origin = 'REPORT_WARPOST.ID_CATEGORY'
    end
    object ReportQuery2WAR_SOSTAV: TIBStringField
      FieldName = 'WAR_SOSTAV'
      Origin = 'REPORT_WARPOST.WAR_SOSTAV'
      Size = 255
    end
  end
  object Report2: TfrxReport
    Version = '3.15'
    DataSet = frxDBDataset1
    DataSetName = 'frxDBDataset1'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38457.442337419000000000
    ReportOptions.LastChange = 38461.644538113400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 264
    Top = 176
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' '#1083#1086#1082#1072#1083#1100#1085#1086
        Value = Null
      end
      item
        Name = 'DepartmentName'
        Value = ''
      end
      item
        Name = 'ReportDate'
        Value = ''
      end>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 120.944960000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 18.897650000000000000
          Top = 15.118120000000000000
          Width = 551.811380000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1047#1074#1110#1090' '#1087#1086' '#1074#1110#1081#1089#1082#1086#1074#1086#1084#1091' '#1086#1073#1083#1110#1082#1091' '#1089#1090#1072#1085#1086#1084' '#1085#1072' [ReportDate]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 18.897650000000000000
          Top = 52.913420000000000000
          Width = 1016.693570000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1087#1086' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1091' [DepartmentName]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 260.787570000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo16: TfrxMemoView
          Width = 30.236240000000000000
          Height = 22.677179999999900000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line#]')
        end
        object Memo17: TfrxMemoView
          Left = 30.236240000000000000
          Width = 139.842610000000000000
          Height = 22.677180000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."FIO"]')
        end
        object Memo18: TfrxMemoView
          Left = 170.078850000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."BIRTH_DATE"]')
          WordBreak = True
        end
        object Memo19: TfrxMemoView
          Left = 249.448980000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."NAME_WARPOSTGR"]')
        end
        object Memo20: TfrxMemoView
          Left = 362.834880000000000000
          Width = 30.236240000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."NAME_WARPOST"]')
        end
        object Memo21: TfrxMemoView
          Left = 393.071120000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."WAR_SOSTAV"]')
        end
        object Memo22: TfrxMemoView
          Left = 472.441250000000000000
          Width = 102.047310000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."NAME_POST"]')
        end
        object Memo23: TfrxMemoView
          Left = 574.488560000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."VOENKOMAT"]')
        end
        object Memo24: TfrxMemoView
          Left = 650.079160000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."NAME_PLACE"]')
        end
        object Memo25: TfrxMemoView
          Left = 725.669760000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."NAME_DISTRICT"]')
        end
        object Memo26: TfrxMemoView
          Left = 801.260360000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."NAME_REGION"]')
        end
        object Memo27: TfrxMemoView
          Left = 876.850960000000000000
          Width = 90.708720000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              '[<frxDBDataset1."STREET_COMPARED">, <frxDBDataset1."HOUSE">, <fr' +
              'xDBDataset1."FLAT">]')
        end
        object Memo28: TfrxMemoView
          Left = 967.559680000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."ACCEPT_DATE"]')
        end
      end
      object Header1: TfrxHeader
        Height = 38.795300000000000000
        Top = 200.315090000000000000
        Width = 1046.929810000000000000
        object Memo3: TfrxMemoView
          Width = 30.236240000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
        end
        object Memo4: TfrxMemoView
          Left = 30.236240000000000000
          Width = 139.842610000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1030#1041)
        end
        object Memo5: TfrxMemoView
          Left = 170.078850000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103)
          WordBreak = True
        end
        object Memo6: TfrxMemoView
          Left = 249.448980000000000000
          Width = 113.385900000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1043#1088#1091#1087#1072)
        end
        object Memo7: TfrxMemoView
          Left = 362.834880000000000000
          Width = 30.236240000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1072#1090'. '#1086#1073#1083'.')
        end
        object Memo8: TfrxMemoView
          Left = 393.071120000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1081#1089#1100#1082#1086#1074#1080#1081' '#1089#1086#1089#1090#1072#1074)
        end
        object Memo9: TfrxMemoView
          Left = 472.441250000000000000
          Width = 102.047310000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
        end
        object Memo10: TfrxMemoView
          Left = 574.488560000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1081#1089#1100#1082#1086#1084#1072#1090)
        end
        object Memo11: TfrxMemoView
          Left = 650.079160000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1089#1077#1083#1077#1085#1080#1081' '#1087#1091#1085#1082#1090)
        end
        object Memo12: TfrxMemoView
          Left = 725.669760000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1081#1086#1085)
        end
        object Memo13: TfrxMemoView
          Left = 801.260360000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1073#1083#1072#1089#1090#1100)
        end
        object Memo14: TfrxMemoView
          Left = 876.850960000000000000
          Width = 90.708720000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1040#1076#1088#1077#1089#1072)
        end
        object Memo15: TfrxMemoView
          Left = 967.559680000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1087#1088#1080#1081#1086#1084#1091)
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = ReportQuery2
    Left = 232
    Top = 176
  end
end
