object fmBankInvoice: TfmBankInvoice
  Left = 272
  Top = 413
  Width = 838
  Height = 246
  Caption = 'fmBankInvoice'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 16
    Top = 8
    Width = 153
    Height = 17
    AutoSize = False
    TabOrder = 0
    Caption = #1053#1072#1082#1083#1072#1076#1085#1072' '#1085#1072' '#1085#1072#1074#1095#1072#1085#1085#1103
  end
  object cxLabel2: TcxLabel
    Left = 16
    Top = 69
    Width = 201
    Height = 17
    AutoSize = False
    TabOrder = 1
    Caption = #1053#1072#1082#1083#1072#1076#1085#1072' '#1085#1072' '#1075#1091#1088#1090#1086#1078#1080#1090#1086#1082'  (12 '#1073#1102#1076#1078#1077#1090')'
  end
  object cxLabel3: TcxLabel
    Left = 16
    Top = 125
    Width = 201
    Height = 17
    AutoSize = False
    TabOrder = 2
    Caption = #1053#1072#1082#1083#1072#1076#1085#1072' '#1085#1072' '#1075#1091#1088#1090#1086#1078#1080#1090#1086#1082' (16 '#1073#1102#1076#1078#1077#1090')'
  end
  object cxTextEdit1: TcxTextEdit
    Left = 240
    Top = 8
    Width = 121
    Height = 21
    Style.Color = 15204351
    TabOrder = 3
    OnKeyPress = cxTextEdit1KeyPress
  end
  object cxTextEdit2: TcxTextEdit
    Left = 240
    Top = 69
    Width = 121
    Height = 21
    Style.Color = 15204351
    TabOrder = 4
    OnKeyPress = cxTextEdit1KeyPress
  end
  object cxTextEdit3: TcxTextEdit
    Left = 240
    Top = 125
    Width = 121
    Height = 21
    Style.Color = 15204351
    TabOrder = 5
    OnKeyPress = cxTextEdit1KeyPress
  end
  object cxButton1: TcxButton
    Left = 376
    Top = 8
    Width = 75
    Height = 25
    Caption = #1089#1092#1086#1088#1084#1091#1074#1072#1090#1080
    TabOrder = 6
    OnClick = cxButton1Click
  end
  object cnButtonPrintInv: TcxButton
    Left = 458
    Top = 8
    Width = 103
    Height = 25
    Caption = #1076#1088#1091#1082' '#1085#1072#1082#1083#1072#1076#1085#1086#1111
    TabOrder = 7
    OnClick = cnButtonPrintInvClick
  end
  object cnButtonPrintReestr: TcxButton
    Left = 570
    Top = 8
    Width = 79
    Height = 25
    Caption = #1076#1088#1091#1082' '#1088#1077#1108#1089#1090#1088#1091
    TabOrder = 8
    OnClick = cnButtonPrintReestrClick
  end
  object cnButtonPrintReestrEr: TcxButton
    Left = 658
    Top = 8
    Width = 151
    Height = 25
    Caption = #1076#1088#1091#1082' '#1088#1077#1108#1089#1090#1088#1091' '#1087#1086#1084#1080#1083#1082#1086#1074#1080#1093
    TabOrder = 9
    OnClick = cnButtonPrintReestrErClick
  end
  object cxLabel4: TcxLabel
    Left = 16
    Top = 40
    Width = 81
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 10
    Caption = #1053#1072#1076#1088#1091#1082#1086#1074#1072#1074
  end
  object cxLabel5: TcxLabel
    Left = 112
    Top = 40
    Width = 209
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 11
    Caption = ''
  end
  object cxLabel6: TcxLabel
    Left = 328
    Top = 40
    Width = 81
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 12
    Caption = #1044#1072#1090#1072' '#1076#1088#1091#1082#1091
  end
  object cxLabel7: TcxLabel
    Left = 424
    Top = 40
    Width = 201
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 13
    Caption = ''
  end
  object cxLabel8: TcxLabel
    Left = 16
    Top = 96
    Width = 81
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 14
    Caption = #1053#1072#1076#1088#1091#1082#1086#1074#1072#1074
  end
  object cxLabel9: TcxLabel
    Left = 112
    Top = 96
    Width = 209
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 15
    Caption = ''
  end
  object cxLabel10: TcxLabel
    Left = 328
    Top = 96
    Width = 81
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 16
    Caption = #1044#1072#1090#1072' '#1076#1088#1091#1082#1091
  end
  object cxLabel11: TcxLabel
    Left = 424
    Top = 96
    Width = 217
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 17
    Caption = ''
  end
  object cxLabel12: TcxLabel
    Left = 16
    Top = 157
    Width = 81
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 18
    Caption = #1053#1072#1076#1088#1091#1082#1086#1074#1072#1074
  end
  object cxLabel13: TcxLabel
    Left = 112
    Top = 157
    Width = 209
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 19
    Caption = ''
  end
  object cxLabel14: TcxLabel
    Left = 328
    Top = 157
    Width = 81
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 20
    Caption = #1044#1072#1090#1072' '#1076#1088#1091#1082#1091
  end
  object cxLabel15: TcxLabel
    Left = 424
    Top = 157
    Width = 225
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 21
    Caption = ''
  end
  object cxButton2: TcxButton
    Left = 376
    Top = 64
    Width = 75
    Height = 25
    Caption = #1089#1092#1086#1088#1084#1091#1074#1072#1090#1080
    TabOrder = 22
    OnClick = cxButton2Click
  end
  object StButtonPrintInv: TcxButton
    Left = 458
    Top = 64
    Width = 103
    Height = 25
    Caption = #1076#1088#1091#1082' '#1085#1072#1082#1083#1072#1076#1085#1086#1111
    TabOrder = 23
    OnClick = StButtonPrintInvClick
  end
  object StButtonPrintReestr: TcxButton
    Left = 570
    Top = 64
    Width = 79
    Height = 25
    Caption = #1076#1088#1091#1082' '#1088#1077#1108#1089#1090#1088#1091
    TabOrder = 24
    OnClick = StButtonPrintReestrClick
  end
  object StButtonPrintReestrEr: TcxButton
    Left = 658
    Top = 64
    Width = 151
    Height = 25
    Caption = #1076#1088#1091#1082' '#1088#1077#1108#1089#1090#1088#1091' '#1087#1086#1084#1080#1083#1082#1086#1074#1080#1093
    TabOrder = 25
    OnClick = StButtonPrintReestrErClick
  end
  object StKButtonPrintInv: TcxButton
    Left = 458
    Top = 123
    Width = 103
    Height = 25
    Caption = #1076#1088#1091#1082' '#1085#1072#1082#1083#1072#1076#1085#1086#1111
    TabOrder = 26
    OnClick = StKButtonPrintInvClick
  end
  object cxButton4: TcxButton
    Left = 376
    Top = 123
    Width = 75
    Height = 25
    Caption = #1089#1092#1086#1088#1084#1091#1074#1072#1090#1080
    TabOrder = 27
    OnClick = cxButton4Click
  end
  object StKButtonPrintReestr: TcxButton
    Left = 570
    Top = 123
    Width = 79
    Height = 25
    Caption = #1076#1088#1091#1082' '#1088#1077#1108#1089#1090#1088#1091
    TabOrder = 28
    OnClick = StKButtonPrintReestrClick
  end
  object StKButtonPrintReestrEr: TcxButton
    Left = 658
    Top = 123
    Width = 151
    Height = 25
    Caption = #1076#1088#1091#1082' '#1088#1077#1108#1089#1090#1088#1091' '#1087#1086#1084#1080#1083#1082#1086#1074#1080#1093
    TabOrder = 29
    OnClick = StKButtonPrintReestrErClick
  end
  object StyleRepository: TcxStyleRepository
    Left = 808
    Top = 48
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyleYellow: TcxStyle
      AssignedValues = [svColor]
      Color = 15204351
    end
    object cxStyleFontBlack: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleMalin: TcxStyle
      AssignedValues = [svColor]
      Color = 4194368
    end
    object cxStyleBorder: TcxStyle
      AssignedValues = [svColor]
      Color = clInactiveBorder
    end
    object cxStylemalinYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4194368
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15204351
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleGrid: TcxStyle
      AssignedValues = [svColor]
      Color = 10485760
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle4
      Styles.Content = cxStyle5
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Inactive = cxStyle13
      Styles.IncSearch = cxStyle14
      Styles.Selection = cxStyle17
      Styles.FilterBox = cxStyle8
      Styles.Footer = cxStyle9
      Styles.Group = cxStyle10
      Styles.GroupByBox = cxStyle11
      Styles.Header = cxStyle12
      Styles.Indicator = cxStyle15
      Styles.Preview = cxStyle16
      BuiltIn = True
    end
  end
  object StoredProc: TpFIBStoredProc
    Left = 144
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name='
      'lc_ctype=WIN1251')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 112
  end
  object DataSet: TpFIBDataSet
    Left = 200
    Top = 8
    poSQLINT64ToBCD = True
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 176
    Top = 8
  end
  object DataSetPrint: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    SelectSQL.Strings = (
      'select * from BANK_SELEC_REESTR_INVOICE(1,1,1,1)')
    Left = 648
    Top = 32
    poSQLINT64ToBCD = True
    object DataSetPrintNOTE: TFIBStringField
      FieldName = 'NOTE'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetPrintR_DAY: TFIBDateField
      FieldName = 'R_DAY'
    end
    object DataSetPrintNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 120
      EmptyStrToNull = True
    end
    object DataSetPrintNUM_RAS_NATIVE: TFIBStringField
      FieldName = 'NUM_RAS_NATIVE'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetPrintNUM_RAS_CUST: TFIBStringField
      FieldName = 'NUM_RAS_CUST'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetPrintNAME_CUST: TFIBStringField
      FieldName = 'NAME_CUST'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetPrintSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetPrintTITLE_SCH: TFIBStringField
      FieldName = 'TITLE_SCH'
      Size = 60
      EmptyStrToNull = True
    end
    object DataSetPrintMFO_CUST: TFIBStringField
      FieldName = 'MFO_CUST'
      Size = 16
      EmptyStrToNull = True
    end
    object DataSetPrintNAME_MFO_CUST: TFIBStringField
      FieldName = 'NAME_MFO_CUST'
      Size = 80
      EmptyStrToNull = True
    end
    object DataSetPrintNAME_RAS_CUST: TFIBStringField
      FieldName = 'NAME_RAS_CUST'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetPrintOKPO_CUST: TFIBStringField
      FieldName = 'OKPO_CUST'
      Size = 16
      EmptyStrToNull = True
    end
    object DataSetPrintFULL_NAME_CUST: TFIBStringField
      FieldName = 'FULL_NAME_CUST'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetPrintDATE_REG: TFIBDateField
      FieldName = 'DATE_REG'
    end
    object DataSetPrintSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetPrintDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object DataSetPrintNUMB_INVOICE: TFIBStringField
      FieldName = 'NUMB_INVOICE'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetPrintMFO_N: TFIBStringField
      FieldName = 'MFO_N'
      Size = 16
      EmptyStrToNull = True
    end
    object DataSetPrintBANK_NAME_N: TFIBStringField
      FieldName = 'BANK_NAME_N'
      Size = 80
      EmptyStrToNull = True
    end
    object DataSetPrintRSCH_N: TFIBStringField
      FieldName = 'RSCH_N'
      Size = 150
      EmptyStrToNull = True
    end
    object DataSetPrintNAME_CUST_N: TFIBStringField
      FieldName = 'NAME_CUST_N'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetPrintID_CUSTOMER_N: TFIBBCDField
      FieldName = 'ID_CUSTOMER_N'
      Size = 0
      RoundByScale = True
    end
    object DataSetPrintNNS_N: TFIBStringField
      FieldName = 'NNS_N'
      Size = 16
      EmptyStrToNull = True
    end
    object DataSetPrintNALOG_NOM_N: TFIBStringField
      FieldName = 'NALOG_NOM_N'
      EmptyStrToNull = True
    end
    object DataSetPrintADRESS_NATIVE: TFIBStringField
      FieldName = 'ADRESS_NATIVE'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetPrintPHONE_NATIVE: TFIBStringField
      FieldName = 'PHONE_NATIVE'
      Size = 16
      EmptyStrToNull = True
    end
    object DataSetPrintARND_VISA: TFIBStringField
      FieldName = 'ARND_VISA'
      Size = 500
      EmptyStrToNull = True
    end
    object DataSetPrintARND_INVOICE_VISA: TFIBStringField
      FieldName = 'ARND_INVOICE_VISA'
      Size = 500
      EmptyStrToNull = True
    end
    object DataSetPrintSUM_ALL: TFIBBCDField
      FieldName = 'SUM_ALL'
      Size = 2
      RoundByScale = True
    end
    object DataSetPrintTITLE: TFIBStringField
      FieldName = 'TITLE'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetPrintCUSTOMER: TFIBStringField
      FieldName = 'CUSTOMER'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetPrintINN_CUST: TFIBStringField
      FieldName = 'INN_CUST'
      Size = 16
      EmptyStrToNull = True
    end
    object DataSetPrintADR_CUST: TFIBStringField
      FieldName = 'ADR_CUST'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetPrintNUM_R_CUST: TFIBStringField
      FieldName = 'NUM_R_CUST'
      EmptyStrToNull = True
    end
    object DataSetPrintTYPE_DOG_CUST: TFIBStringField
      FieldName = 'TYPE_DOG_CUST'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetPrintFORM_DOG_CUST: TFIBStringField
      FieldName = 'FORM_DOG_CUST'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetPrintDATE_DOG_CUST: TFIBDateField
      FieldName = 'DATE_DOG_CUST'
    end
    object DataSetPrintNUM_DOG_CUST: TFIBStringField
      FieldName = 'NUM_DOG_CUST'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetPrintFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 150
      EmptyStrToNull = True
    end
    object DataSetPrintDATE_STR: TFIBStringField
      FieldName = 'DATE_STR'
      Size = 8
      EmptyStrToNull = True
    end
    object DataSetPrintDATE_DOG_STR: TFIBStringField
      FieldName = 'DATE_DOG_STR'
      Size = 8
      EmptyStrToNull = True
    end
  end
  object ReportPrintReestr: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38347.882768900500000000
    ReportOptions.LastChange = 40633.702258206020000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'begin'
      ''
      'end.')
    Left = 616
    Top = 32
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Page2: TfrxReportPage
      Visible = False
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftBottom]
      object Header1: TfrxHeader
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo35: TfrxMemoView
          Width = 30.236240000000000000
          Height = 71.811070000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1076#1110#1083)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 30.236240000000000000
          Width = 86.929190000000000000
          Height = 71.811070000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              #1044#1072#1090#1072' '#1074#1110#1076#1074#1072#1085' '#1090#1072#1078#1077#1085#1085#1103' ('#1074#1080' '#1082#1086#1085#1072#1085#1085#1103' '#1087#1086#1089' '#1090#1072#1074#1082#1080' ('#1086#1087#1083#1072#1090#1080'*) '#1090#1086#1074#1072#1088#1110#1074' ('#1087#1086#1089 +
              #1083#1091#1075'))')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 117.165430000000000000
          Width = 204.094620000000000000
          Height = 71.811070000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072' '#1087#1086#1089#1090#1072#1074#1082#1080' '#1090#1086#1074#1072#1088#1110#1074' ('#1087#1086#1089#1083#1091#1075') '#1087#1088#1086#1076#1072#1074#1094#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 321.260050000000000000
          Width = 37.795300000000000000
          Height = 71.811070000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1076#1080#1085#1080#1094#1103' '#1074#1080#1084#1110#1088#1091' '#1090#1086#1074#1072#1088#1091)
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 359.055350000000000000
          Width = 37.795300000000000000
          Height = 71.811070000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100' ('#1086#1073#39#1108#1084', '#1086#1073#1089#1103#1075')')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 396.850650000000000000
          Width = 52.913420000000000000
          Height = 71.811070000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1062#1110#1085#1072' '#1087#1086#1089#1090#1072#1082#1080' '#1086#1076#1080#1085#1080#1094#1110' '#1087#1088#1086#1076#1091#1082#1094#1110#1111' '#1073#1077#1079' '#1091#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1055#1044#1042)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 449.764070000000000000
          Width = 211.653680000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            
              #1054#1073#1089#1103#1075#1080' '#1087#1086#1089#1090#1072#1074#1082#1080' ('#1073#1072#1079#1072' '#1086#1087#1086#1076#1072#1090#1082#1091#1074#1072#1085#1085#1103') '#1073#1077#1079' '#1091#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1055#1044#1042', '#1097#1086' '#1087#1110#1076#1083 +
              #1103#1075#1072#1102#1090#1100' '#1086#1087#1086#1076#1072#1090#1082#1091#1074#1072#1085#1085#1102' '#1079#1072' '#1089#1090#1072#1074#1082#1072#1084#1080)
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 449.764070000000000000
          Top = 22.677180000000000000
          Width = 56.692950000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '20%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 506.457020000000000000
          Top = 22.677180000000000000
          Width = 60.472480000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '0% ('#1088#1077#1072#1083#1110#1079#1072#1094#1110#1103' '#1085#1072' '#1084#1080#1090#1085#1110#1081' '#1090#1077#1088#1080#1090#1086#1088#1110#1111' '#1059#1082#1088#1072#1111#1085#1080')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 566.929500000000000000
          Top = 22.677180000000000000
          Width = 41.574830000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '0% ('#1077#1082#1089#1087#1086#1088#1090')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 608.504330000000000000
          Top = 22.677180000000000000
          Width = 52.913420000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1074#1110#1083#1100#1085#1077#1085#1085#1103' '#1074#1110#1076' '#1055#1044#1042)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 661.417750000000000000
          Width = 56.692950000000000000
          Height = 71.811070000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1075#1072#1083#1100#1085#1072' '#1089#1091#1084#1072' '#1082#1086#1096#1090#1110#1074', '#1097#1086' '#1087#1110#1076#1083#1103#1075#1072#1108' '#1086#1087#1083#1072#1090#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Top = 71.811070000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 30.236240000000000000
          Top = 71.811070000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 117.165430000000000000
          Top = 71.811070000000000000
          Width = 204.094620000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 321.260050000000000000
          Top = 71.811070000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 359.055350000000000000
          Top = 71.811070000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 396.850650000000000000
          Top = 71.811070000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 449.764070000000000000
          Top = 71.811070000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '7')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 506.457020000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '8')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 566.929500000000000000
          Top = 71.811070000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '9')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 608.504330000000000000
          Top = 71.811070000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '10')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 661.417750000000000000
          Top = 71.811070000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '11')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Height = 15.118120000000000000
        Top = 128.504020000000000000
        Width = 718.110700000000000000
        RowCount = 1
        Stretched = True
        object Memo58: TfrxMemoView
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          ParentFont = False
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 30.236240000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo59OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."R_DAY"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo131: TfrxMemoView
          Left = 117.165430000000000000
          Width = 204.094620000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."TITLE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo132: TfrxMemoView
          Left = 321.260050000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1075#1088#1085'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo133: TfrxMemoView
          Left = 359.055350000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1083#1091#1075#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo135: TfrxMemoView
          Left = 449.764070000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo135OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'frxNaclDataSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[sum_out_nds]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo136: TfrxMemoView
          Left = 506.457020000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo137: TfrxMemoView
          Left = 566.929500000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo138: TfrxMemoView
          Left = 608.504330000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxNaclDataSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[summa_all]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo139: TfrxMemoView
          Left = 661.417750000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo134: TfrxMemoView
          Left = 396.850650000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo134OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'frxNaclDataSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[sum_out_nds]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer2: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        object Subreport2: TfrxSubreport
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = ReportPrintReestr.Page3
        end
      end
      object DetailData1: TfrxDetailData
        Height = 21.921259840000000000
        Top = 207.874150000000000000
        Visible = False
        Width = 718.110700000000000000
        RowCount = 1
        object Memo126: TfrxMemoView
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object Memo127: TfrxMemoView
          Left = 30.236240000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."R_DAY"]')
          ParentFont = False
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object Memo128: TfrxMemoView
          Left = 117.165430000000000000
          Width = 204.094620000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."TITLE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo205: TfrxMemoView
          Left = 321.260050000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1075#1088#1085'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo206: TfrxMemoView
          Left = 359.055350000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo210OnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1083#1075#1091#1075#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo216: TfrxMemoView
          Left = 449.764070000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo222OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'frxNaclDataSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[sum_out_nds]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo217: TfrxMemoView
          Left = 506.457020000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo218: TfrxMemoView
          Left = 566.929500000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo219: TfrxMemoView
          Left = 608.504330000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxNaclDataSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[summa_all]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo220: TfrxMemoView
          Left = 661.417750000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo221: TfrxMemoView
          Left = 396.850650000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo227OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'frxNaclDataSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[sum_out_nds]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 3
      ColumnWidth = 63.333333333333300000
      ColumnPositions.Strings = (
        '0'
        '63,3333333333333'
        '126,666666666667')
      HGuides.Strings = (
        '192,75603'
        '389,29159')
      object ReportTitle1: TfrxReportTitle
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 52.913420000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1080#1076#1072#1108#1090#1100#1089#1103' '#1087#1086#1082#1091#1087#1094#1102)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 52.913420000000000000
          Top = 15.118120000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1082#1083#1102#1095#1077#1085#1086' '#1076#1086' '#1028#1056#1055#1053)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 139.842610000000000000
          Width = 34.015770000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1061)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 139.842610000000000000
          Top = 15.118120000000000000
          Width = 34.015770000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Align = baRight
          Left = 570.709030000000000000
          Width = 147.401670000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1047#1040#1058#1042#1045#1056#1044#1046#1045#1053#1054
            #1053#1072#1082#1072#1079' '#1044#1077#1088#1078#1072#1074#1085#1086#1111' '#1087#1086#1076#1072#1090#1082#1086#1074#1086#1111
            #1072#1076#1084#1110#1085#1110#1089#1090#1088#1072#1094#1110#1111' '#1059#1082#1088#1072#1111#1085#1080
            '21.12.2010 '#8470' 969')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baCenter
          Left = 245.669450000000000000
          Top = 60.472480000000000000
          Width = 226.771800000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1055' '#1054' '#1044' '#1040' '#1058' '#1050' '#1054' '#1042' '#1040'    '#1053' '#1040' '#1050' '#1051' '#1040' '#1044' '#1053' '#1040)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo208: TfrxMemoView
          Left = 52.913420000000000000
          Top = 30.236240000000000000
          Width = 86.929190000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1072#1108#1090#1100#1089#1103' '#1091' '#1087#1088#1086#1076#1072#1074#1094#1103
            '('#1090#1080#1087' '#1087#1088#1080#1095#1080#1085#1080')')
          ParentFont = False
        end
        object Memo209: TfrxMemoView
          Width = 52.913420000000000000
          Height = 56.692950000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1088#1080#1075#1110#1085#1072#1083)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo210: TfrxMemoView
          Left = 139.842610000000000000
          Top = 30.236240000000000000
          Width = 34.015770000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo211: TfrxMemoView
          Left = 139.842610000000000000
          Top = 45.354360000000000000
          Width = 18.897637800000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo212: TfrxMemoView
          Left = 158.740260000000000000
          Top = 45.354360000000000000
          Width = 15.118120000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo213: TfrxMemoView
          Top = 56.692949999999990000
          Width = 139.842610000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1050#1086#1087#1110#1103' ('#1079#1072#1083#1080#1096#1072#1090#1100#1089#1103' '#1091' '#1087#1088#1086#1076#1072#1074#1094#1103')')
          ParentFont = False
        end
        object Memo214: TfrxMemoView
          Left = 139.842610000000000000
          Top = 56.692949999999990000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo215: TfrxMemoView
          Left = 26.456710000000000000
          Top = 68.031540000000010000
          Width = 132.283550000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '('#1055#1086#1090#1088#1110#1073#1085#1077' '#1074#1080#1076#1110#1083#1080#1090#1080' '#1087#1086#1084#1110#1090#1082#1086#1102' "'#1061'")')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Height = 268.346630000000000000
        ParentFont = False
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        RowCount = 1
        object Memo7: TfrxMemoView
          Left = 15.118120000000000000
          Width = 177.637910000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1044#1072#1090#1072' '#1074#1080#1087#1080#1089#1082#1080' '#1087#1086#1076#1072#1090#1082#1086#1074#1086#1111' '#1085#1072#1082#1083#1072#1076#1085#1086#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 64.252010000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1055#1088#1086#1076#1072#1074#1077#1094#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 64.252010000000000000
          Top = 34.015770000000010000
          Width = 238.110390000000000000
          Height = 34.015770000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_CUST_N"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 11.338590000000000000
          Top = 128.504020000000000000
          Width = 90.708720000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 154.960730000000000000
          Top = 128.504020000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."PHONE_NATIVE"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 427.086890000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1055#1086#1082#1091#1087#1077#1094#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 411.968770000000000000
          Top = 34.015770000000010000
          Width = 279.685220000000000000
          Height = 34.015770000000000000
          StretchMode = smActualHeight
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."CUSTOMER"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 377.953000000000000000
          Top = 90.708720000000000000
          Width = 162.519790000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1030#1085#1076#1080#1074#1110#1076#1091#1072#1083#1100#1085#1080#1081' '#1087#1086#1076#1072#1090#1082#1086#1074#1080#1081' '#1085#1086#1084#1077#1088' '#1087#1086#1082#1091#1087#1094#1103')')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 11.338590000000000000
          Top = 102.047310000000000000
          Width = 83.149660000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1052#1110#1089#1090#1086' '#1079#1085#1072#1093#1086#1076#1078#1077#1085#1085#1103' ')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 154.960730000000000000
          Top = 113.385900000000000000
          Width = 196.535560000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."ADRESS_NATIVE"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 359.055350000000000000
          Top = 102.047310000000000000
          Width = 124.724490000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1052#1110#1089#1094#1077' '#1079#1085#1072#1093#1086#1076#1078#1077#1085#1085#1103' ')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 506.457020000000000000
          Top = 113.385900000000000000
          Width = 207.874150000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."ADR_CUST"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 359.055350000000000000
          Top = 128.504020000000000000
          Width = 90.708720000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 506.457020000000000000
          Top = 128.504020000000000000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '-')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 11.338590000000000000
          Top = 143.622140000000000000
          Width = 128.504020000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              #1053#1086#1084#1077#1088' '#1089#1074#1110#1076#1086#1094#1090#1074#1072' '#1087#1088#1086' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1102' '#1087#1083#1072#1090#1085#1080#1082#1072' '#1087#1086#1076#1072#1090#1082#1091' '#1085#1072' '#1076#1086#1076#1072#1085#1091' '#1074#1072#1088#1090#1110#1089 +
              #1090#1100' ('#1087#1088#1086#1076#1072#1074#1094#1103')')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 143.622140000000000000
          Top = 151.181200000000000000
          Width = 102.047310000000000000
          Height = 11.338590000000000000
          CharSpacing = 3.000000000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."NNS_N"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 359.055350000000000000
          Top = 143.622140000000000000
          Width = 128.504020000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              #1053#1086#1084#1077#1088' '#1089#1074#1110#1076#1086#1094#1090#1074#1072' '#1087#1088#1086' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1102' '#1087#1083#1072#1090#1085#1080#1082#1072' '#1087#1086#1076#1072#1090#1082#1091' '#1085#1072' '#1076#1086#1076#1072#1085#1091' '#1074#1072#1088#1090#1110#1089 +
              #1090#1100' ('#1087#1086#1082#1091#1087#1094#1103')')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 495.118430000000000000
          Top = 151.181200000000000000
          Width = 102.047310000000000000
          Height = 11.338590000000000000
          CharSpacing = 3.000000000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."NUM_R_CUST"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 34.015770000000000000
          Top = 79.370129999999990000
          Width = 94.488250000000000000
          Height = 11.338590000000000000
          CharSpacing = 3.000000000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."NALOG_NOM_N"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 385.512060000000000000
          Top = 79.370129999999990000
          Width = 102.047310000000000000
          Height = 11.338590000000000000
          CharSpacing = 3.000000000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."INN_CUST"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 11.338590000000000000
          Top = 185.196970000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1042#1080#1076' '#1094#1080#1074#1110#1083#1100#1085#1086'-'#1087#1088#1072#1074#1086#1074#1086#1075#1086' '
            #1076#1086#1075#1086#1074#1086#1088#1091)
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 113.385900000000000000
          Top = 196.535560000000000000
          Width = 313.700990000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."TYPE_DOG_CUST"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 11.338590000000000000
          Top = 211.653680000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1093' '
            #1088#1086#1079#1088#1072#1093#1091#1085#1082#1110#1074)
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 109.606370000000000000
          Top = 222.992270000000000000
          Width = 600.945270000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."FORM_DOG_CUST"]')
          ParentFont = False
        end
        object Memo153: TfrxMemoView
          Left = 120.944960000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo154: TfrxMemoView
          Left = 113.385900000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo155: TfrxMemoView
          Left = 105.826840000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo156: TfrxMemoView
          Left = 98.267780000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo157: TfrxMemoView
          Left = 90.708720000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo158: TfrxMemoView
          Left = 83.149660000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo159: TfrxMemoView
          Left = 75.590600000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo160: TfrxMemoView
          Left = 68.031540000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo161: TfrxMemoView
          Left = 60.472480000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo162: TfrxMemoView
          Left = 52.913420000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo163: TfrxMemoView
          Left = 45.354360000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo164: TfrxMemoView
          Left = 37.795300000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo165: TfrxMemoView
          Left = 480.000310000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo166: TfrxMemoView
          Left = 472.441250000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo167: TfrxMemoView
          Left = 464.882190000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo168: TfrxMemoView
          Left = 457.323130000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo169: TfrxMemoView
          Left = 449.764070000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo170: TfrxMemoView
          Left = 442.205010000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo171: TfrxMemoView
          Left = 434.645950000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo172: TfrxMemoView
          Left = 427.086890000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo173: TfrxMemoView
          Left = 419.527830000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo174: TfrxMemoView
          Left = 411.968770000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo175: TfrxMemoView
          Left = 396.850650000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo176: TfrxMemoView
          Left = 389.291590000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo177: TfrxMemoView
          Left = 238.110390000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo178: TfrxMemoView
          Left = 230.551330000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo179: TfrxMemoView
          Left = 222.992270000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo180: TfrxMemoView
          Left = 215.433210000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo181: TfrxMemoView
          Left = 207.874150000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo182: TfrxMemoView
          Left = 200.315090000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo183: TfrxMemoView
          Left = 192.756030000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo184: TfrxMemoView
          Left = 185.196970000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo185: TfrxMemoView
          Left = 177.637910000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo186: TfrxMemoView
          Left = 170.078850000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo187: TfrxMemoView
          Left = 162.519790000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo188: TfrxMemoView
          Left = 154.960730000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo189: TfrxMemoView
          Left = 589.606680000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo190: TfrxMemoView
          Left = 582.047620000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo191: TfrxMemoView
          Left = 574.488560000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo192: TfrxMemoView
          Left = 566.929500000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo193: TfrxMemoView
          Left = 559.370440000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo194: TfrxMemoView
          Left = 551.811380000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo195: TfrxMemoView
          Left = 544.252320000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo196: TfrxMemoView
          Left = 536.693260000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo197: TfrxMemoView
          Left = 529.134200000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo198: TfrxMemoView
          Left = 521.575140000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo199: TfrxMemoView
          Left = 514.016080000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo200: TfrxMemoView
          Left = 506.457020000000000000
          Top = 151.181200000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo201: TfrxMemoView
          Left = 11.338590000000000000
          Top = 113.385900000000000000
          Width = 109.606370000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '('#1087#1086#1076#1072#1090#1082#1086#1074#1072' '#1072#1076#1088#1077#1089#1072') '#1087#1088#1086#1076#1072#1074#1094#1103)
          ParentFont = False
        end
        object Memo202: TfrxMemoView
          Left = 359.055350000000000000
          Top = 113.385900000000000000
          Width = 105.826840000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '('#1087#1086#1076#1072#1090#1082#1086#1074#1072' '#1072#1076#1088#1077#1089#1072') '#1087#1086#1082#1091#1087#1094#1103)
          ParentFont = False
        end
        object Memo235: TfrxMemoView
          Left = 419.527830000000000000
          Width = 109.606370000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1055#1086#1088#1103#1076#1082#1086#1074#1080#1081' '#1085#1086#1084#1077#1088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 26.456710000000000000
          Top = 90.708720000000000000
          Width = 170.078850000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1030#1085#1076#1080#1074#1110#1076#1091#1072#1083#1100#1085#1080#1081' '#1087#1086#1076#1072#1090#1082#1086#1074#1080#1081' '#1085#1086#1084#1077#1088' '#1087#1088#1086#1076#1072#1074#1094#1103')')
          ParentFont = False
        end
        object Memo236: TfrxMemoView
          Left = 211.653680000000000000
          Top = 234.330860000000000000
          Width = 200.315090000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1073#1072#1088#1090#1077#1088', '#1075#1086#1090#1110#1074#1082#1072', '#1086#1087#1083#1072#1090#1072' '#1079' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1088#1072#1093#1091#1085#1082#1091', '#1095#1077#1082' '#1090#1086#1097#1086')')
          ParentFont = False
        end
        object Memo250: TfrxMemoView
          Left = 162.519790000000000000
          Top = 207.874150000000000000
          Width = 200.315090000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1074#1080#1076' '#1076#1086#1075#1086#1074#1086#1088#1091')')
          ParentFont = False
        end
        object Memo251: TfrxMemoView
          Top = 34.015770000000010000
          Width = 64.252010000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1054#1089#1086#1073#1072' ( '#1087#1083#1072#1090#1085#1080#1082
            #1087#1086#1076#1072#1090#1082#1091') - '#1087#1088#1086#1076#1072#1074#1077#1094#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo252: TfrxMemoView
          Left = 351.496290000000000000
          Top = 34.015770000000010000
          Width = 60.472480000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1054#1089#1086#1073#1072' ( '#1087#1083#1072#1090#1085#1080#1082
            #1087#1086#1076#1072#1090#1082#1091') - '#1087#1086#1082#1091#1087#1077#1094#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo253: TfrxMemoView
          Left = 45.354360000000000000
          Top = 68.031540000000010000
          Width = 279.685220000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              '('#1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103'; '#1087#1088#1110#1079#1074#1080#1097#1077','#1110#1084#39#1103', '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110' - '#1076#1083#1103' '#1092#1110#1079#1080#1095#1085#1086#1111' '#1086#1089#1086#1073#1080' -' +
              ' '#1087#1110#1076#1087#1088#1080#1108#1084#1094#1103')')
          ParentFont = False
        end
        object Memo254: TfrxMemoView
          Left = 393.071120000000000000
          Top = 68.031540000000010000
          Width = 279.685220000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              '('#1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103'; '#1087#1088#1110#1079#1074#1080#1097#1077','#1110#1084#39#1103', '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110' - '#1076#1083#1103' '#1092#1110#1079#1080#1095#1085#1086#1111' '#1086#1089#1086#1073#1080' -' +
              ' '#1087#1110#1076#1087#1088#1080#1108#1084#1094#1103')')
          ParentFont = False
        end
        object Memo256: TfrxMemoView
          Left = 404.409710000000000000
          Top = 79.370129999999990000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo255: TfrxMemoView
          Left = 449.764070000000000000
          Top = 196.535560000000000000
          Width = 22.677180000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1074#1110#1076)
          ParentFont = False
        end
        object Memo258: TfrxMemoView
          Left = 593.386210000000000000
          Top = 196.535560000000000000
          Width = 79.370130000000000000
          Height = 11.338590000000000000
          CharSpacing = 3.000000000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."NUM_DOG_CUST"]')
          ParentFont = False
        end
        object Memo257: TfrxMemoView
          Left = 476.220780000000000000
          Top = 196.535560000000000000
          Width = 90.708720000000000000
          Height = 11.338590000000000000
          CharSpacing = 3.000000000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."DATE_DOG_STR"]')
          ParentFont = False
        end
        object Memo277: TfrxMemoView
          Left = 582.047620000000000000
          Top = 196.535560000000000000
          Width = 11.338590000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #8470)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 211.653680000000000000
          Width = 75.590600000000000000
          Height = 11.338590000000000000
          CharSpacing = 3.000000000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."DATE_STR"]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 279.685220000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 272.126160000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 264.567100000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 257.008040000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 249.448980000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 241.889920000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 234.330860000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 226.771800000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 559.370440000000000000
          Top = 196.535560000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 551.811380000000000000
          Top = 196.535560000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 544.252320000000000000
          Top = 196.535560000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 536.693260000000000000
          Top = 196.535560000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 529.134200000000000000
          Top = 196.535560000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Left = 521.575140000000000000
          Top = 196.535560000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          Left = 514.016080000000000000
          Top = 196.535560000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Left = 506.457020000000000000
          Top = 196.535560000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Left = 665.197280000000000000
          Top = 196.535560000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          Left = 657.638220000000000000
          Top = 196.535560000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          Left = 650.079160000000000000
          Top = 196.535560000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo91: TfrxMemoView
          Left = 642.520100000000000000
          Top = 196.535560000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo92: TfrxMemoView
          Left = 634.961040000000000000
          Top = 196.535560000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          Left = 627.401980000000000000
          Top = 196.535560000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo97: TfrxMemoView
          Left = 619.842920000000000000
          Top = 196.535560000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          Left = 612.283860000000000000
          Top = 196.535560000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Left = 604.724800000000000000
          Top = 196.535560000000000000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          Left = 563.149970000000000000
          Top = 3.779529999999994000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 570.709030000000000000
          Top = 3.779529999999994000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo151: TfrxMemoView
          Left = 540.472790000000000000
          Top = 3.779529999999994000
          Width = 68.031540000000000000
          Height = 11.338590000000000000
          CharSpacing = 3.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."NUMB_INVOICE"]')
          ParentFont = False
        end
        object Memo249: TfrxMemoView
          Left = 608.504330000000000000
          Top = 3.779529999999994000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '/')
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 578.268090000000000000
          Top = 3.779529999999994000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 555.590910000000000000
          Top = 3.779529999999994000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo110: TfrxMemoView
          Left = 585.827150000000000000
          Top = 3.779529999999994000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo114: TfrxMemoView
          Left = 593.386210000000000000
          Top = 3.779529999999994000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo115: TfrxMemoView
          Left = 600.945270000000000000
          Top = 3.779529999999994000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo116: TfrxMemoView
          Left = 616.063390000000000000
          Top = 3.779529999999994000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo120: TfrxMemoView
          Left = 623.622450000000000000
          Top = 3.779529999999994000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo121: TfrxMemoView
          Left = 631.181510000000000000
          Top = 3.779529999999994000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo122: TfrxMemoView
          Left = 638.740570000000000000
          Top = 3.779529999999994000
          Width = 7.559060000000000000
          Height = 11.338590000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 468.661720000000000000
        Width = 718.110700000000000000
        object Subreport1: TfrxSubreport
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = ReportPrintReestr.Page2
        end
      end
    end
    object Page3: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData3: TfrxMasterData
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        RowCount = 1
        object Memo70: TfrxMemoView
          Top = 15.118120000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          DataSetName = 'frxSumNdsDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'II')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 30.236240000000000000
          Top = 15.118120000000000000
          Width = 291.023810000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '  '#1047#1074#1086#1088#1086#1090#1085#1103' ('#1079#1072#1089#1090#1072#1074#1085#1072') '#1090#1072#1088#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Top = 30.236240000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'III')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 30.236240000000000000
          Top = 30.236240000000000000
          Width = 291.023810000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '  '#1055#1086#1076#1072#1090#1086#1082' '#1085#1072' '#1076#1086#1076#1072#1085#1091' '#1074#1072#1088#1090#1110#1089#1090#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Top = 45.354360000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'IV')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 30.236240000000000000
          Top = 45.354360000000000000
          Width = 291.023810000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '  '#1047#1072#1075#1072#1083#1100#1085#1072' '#1089#1091#1084#1072' '#1079' '#1055#1044#1042)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 321.260050000000000000
          Top = 15.118120000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 321.260050000000000000
          Top = 30.236240000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 321.260050000000000000
          Top = 45.354360000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo89: TfrxMemoView
          Left = 359.055350000000000000
          Top = 15.118120000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
        end
        object Memo93: TfrxMemoView
          Left = 359.055350000000000000
          Top = 30.236240000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 359.055350000000000000
          Top = 45.354360000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 396.850650000000000000
          Top = 15.118120000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Left = 396.850650000000000000
          Top = 30.236240000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo100: TfrxMemoView
          Left = 396.850650000000000000
          Top = 45.354360000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo101: TfrxMemoView
          Left = 449.764070000000000000
          Top = 15.118120000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo105: TfrxMemoView
          Left = 449.764070000000000000
          Top = 30.236240000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataSetName = 'frxSumNdsDataSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[nds]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo106: TfrxMemoView
          Left = 449.764070000000000000
          Top = 45.354360000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo106OnBeforePrint'
          DataSetName = 'frxSumNdsDataSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[summa_all]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo107: TfrxMemoView
          Left = 506.457020000000000000
          Top = 15.118120000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 506.457020000000000000
          Top = 30.236240000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 506.457020000000000000
          Top = 45.354360000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '-')
          ParentFont = False
        end
        object Memo113: TfrxMemoView
          Left = 566.929500000000000000
          Top = 15.118120000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
        end
        object Memo117: TfrxMemoView
          Left = 566.929500000000000000
          Top = 30.236240000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo118: TfrxMemoView
          Left = 566.929500000000000000
          Top = 45.354360000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '-')
          ParentFont = False
        end
        object Memo119: TfrxMemoView
          Left = 608.504330000000000000
          Top = 15.118120000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
        end
        object Memo123: TfrxMemoView
          Left = 608.504330000000000000
          Top = 30.236240000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataSetName = 'frxSumNdsDataSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo124: TfrxMemoView
          Left = 608.504330000000000000
          Top = 45.354360000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataSetName = 'frxSumNdsDataSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '-')
          ParentFont = False
        end
        object Memo125: TfrxMemoView
          Left = 661.417750000000000000
          Top = 15.118120000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '-')
          ParentFont = False
        end
        object Memo129: TfrxMemoView
          Left = 661.417750000000000000
          Top = 30.236240000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataSetName = 'frxSumNdsDataSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[nds]')
          ParentFont = False
        end
        object Memo130: TfrxMemoView
          Left = 661.417750000000000000
          Top = 45.354360000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo130OnBeforePrint'
          DataSetName = 'frxSumNdsDataSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[summa_all]')
          ParentFont = False
        end
        object Memo141: TfrxMemoView
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo142: TfrxMemoView
          Left = 30.236240000000000000
          Width = 291.023810000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '  '#1059#1089#1100#1086#1075#1086' '#1087#1086' '#1088#1086#1079#1076#1110#1083#1091' I')
          ParentFont = False
        end
        object Memo143: TfrxMemoView
          Left = 321.260050000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo144: TfrxMemoView
          Left = 359.055350000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo146: TfrxMemoView
          Left = 449.764070000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[sum_out_nds]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo147: TfrxMemoView
          Left = 506.457020000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '-')
          ParentFont = False
        end
        object Memo148: TfrxMemoView
          Left = 566.929500000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '-')
          ParentFont = False
        end
        object Memo149: TfrxMemoView
          Left = 608.504330000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataSetName = 'frxSumNdsDataSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '-')
          ParentFont = False
        end
        object Memo150: TfrxMemoView
          Left = 661.417750000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[sum_out_nds]')
          ParentFont = False
        end
        object Memo145: TfrxMemoView
          Left = 396.850650000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'X')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer3: TfrxFooter
        Height = 170.078850000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        object Memo33: TfrxMemoView
          Left = 71.811070000000000000
          Top = 60.472480000000000000
          Width = 52.913420000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052'. '#1055'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 385.512060000000000000
          Top = 94.488250000000010000
          Width = 313.700990000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.Strings = (
            
              '                                    ('#1055#1110#1076#1087#1080#1089' '#1110' '#1087#1088#1110#1079#1074#1080#1097#1077' '#1086#1089#1086#1073#1080', '#1103#1082 +
              #1072' c'#1082#1083#1072#1083#1072' '#1087#1086#1076#1072#1090#1082#1086#1074#1091' '#1085#1072#1082#1083#1072#1076#1085#1091')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo140: TfrxMemoView
          Left = 22.677180000000000000
          Top = 3.779529999999994000
          Width = 672.756340000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              #1057#1091#1084#1080' '#1055#1044#1042' '#1085#1072#1088#1072#1093#1086#1074#1072#1085#1110'('#1089#1087#1083#1072#1095#1077#1085#1110') '#1074' '#1079#1074#39#1103#1079#1082#1091' '#1079' '#1087#1086#1089#1090#1072#1074#1082#1086#1102' '#1090#1086#1074#1072#1088#1110#1074' ('#1087#1086#1089 +
              #1083#1091#1075'), '#1079#1072#1079#1072#1085#1072#1095#1077#1085#1080#1093' '#1091' '#1094#1110#1081' '#1085#1072#1082#1083#1072#1076#1085#1110#1081', '#1074#1080#1079#1085#1072#1095#1077#1085#1110' '#1087#1088#1072#1074#1080#1083#1100#1085#1086', '#1074#1110#1076#1087#1086#1074#1110#1076 +
              #1072#1102#1090#1100' '#1089#1091#1084#1110' '#1087#1086#1076#1072#1090#1082#1086#1074#1080#1093' '#1079#1086#1073#1086#1074#39#1103#1079#1072#1085#1100' '#1087#1088#1086#1076#1072#1074#1094#1103' '#1110' '#1074#1082#1083#1102#1095#1077#1085#1110' '#1087#1086' '#1088#1077#1108#1089#1090#1088#1091' ' +
              #1086#1090#1088#1080#1084#1072#1085#1080#1093' '#1090#1072' '#1074#1080#1076#1072#1085#1080#1093' '#1087#1086#1076#1072#1090#1082#1086#1074#1080#1093' '#1085#1072#1082#1083#1072#1076#1085#1080#1093)
          ParentFont = False
        end
        object Memo152: TfrxMemoView
          Left = 22.677180000000000000
          Top = 117.165430000000000000
          Width = 676.535870000000000000
          Height = 34.015770000000010000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haBlock
          Memo.Strings = (
            
              '*'#1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1080' '#1089#1090#1072#1074#1080#1090#1100#1089#1103' '#1091' '#1088#1072#1079#1110' '#1087#1086#1087#1077#1088#1077#1076#1085#1100#1086#1111' '#1086#1087#1083#1072#1090#1080' '#1087#1086#1089#1090#1072#1074#1082#1080', '#1085#1072' '#1103#1082 +
              #1091' '#1074#1080#1087#1080#1089#1091#1108#1090#1100#1089#1103' '#1087#1086#1076#1072#1090#1082#1086#1074#1072' '#1085#1072#1082#1083#1072#1076#1085#1072': '#1076#1083#1103' '#1073#1072#1088#1090#1077#1088#1085#1080#1093' '#1086#1087#1077#1088#1072#1094#1110#1081'-'#1076#1072#1090#1072' '#1086#1087 +
              #1088#1080#1073#1091#1090#1082#1091#1074#1072#1085#1085#1103' '#1090#1086#1074#1072#1088#1110#1074', '#1087#1086#1087#1077#1088#1077#1076#1085#1100#1086' '#1086#1076#1077#1088#1078#1072#1085#1080#1093' '#1074' '#1086#1087#1083#1072#1090#1091' '#1087#1086#1089#1090#1072#1074#1082#1080'; '#1076#1072 +
              #1090#1072' '#1087#1086#1087#1077#1088#1077#1076#1085#1100#1086#1075#1086' '#1086#1076#1077#1088#1078#1072#1085#1085#1103' '#1087#1086#1089#1083#1091#1075' '#1074' '#1086#1087#1083#1072#1090#1091' '#1087#1086#1089#1090#1072#1074#1082#1080'; '#1076#1083#1103' '#1086#1087#1077#1088#1072#1094#1110#1081 +
              ' '#1079' '#1087#1086#1089#1090#1072#1074#1082#1080' '#1090#1086#1074#1072#1088#1110#1074' ('#1087#1086#1089#1083#1091#1075') '#1079#1072' '#1082#1072#1089#1086#1074#1080#1084' '#1084#1077#1090#1086#1076#1086#1084' '#1074#1110#1076#1087#1086#1074#1110#1076#1085#1086' '#1076#1086'  '#1047 +
              #1072#1082#1086#1085#1091' '#1059#1082#1088#1072#1111#1085#1080' "'#1055#1088#1086' '#1087#1086#1076#1072#1090#1086#1082' '#1085#1072' '#1076#1086#1076#1072#1085#1091' '#1074#1072#1088#1090#1110#1089#1090#1100'".')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 22.677180000000000000
          Top = 117.165430000000000000
          Width = 105.826840000000000000
          Frame.Typ = [ftTop]
        end
        object Memo204: TfrxMemoView
          Left = 374.173470000000000000
          Top = 75.590600000000010000
          Width = 325.039335910000000000
          Height = 18.897650000000000000
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '/[frxDBDataset1."FIO"]/')
          ParentFont = False
        end
        object Memo203: TfrxMemoView
          Left = 41.574830000000000000
          Top = 151.181200000000000000
          Width = 657.638220000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.Strings = (
            
              '('#1074#1110#1076#1087#1086#1074#1110#1076#1085#1110' '#1087#1091#1085#1082#1090#1080' ('#1087#1110#1076#1087#1091#1085#1082#1090#1080'), '#1089#1090#1072#1090#1090#1110#1073#1087#1110#1076#1088#1086#1079#1076#1110#1083#1080', '#1088#1086#1079#1076#1110#1083#1080' '#1055#1086#1076#1072#1090 +
              #1082#1086#1074#1086#1075#1086' '#1082#1086#1076#1077#1082#1089#1091' '#1059#1082#1088#1072#1111#1085#1080', '#1103#1082#1080#1084#1080' '#1087#1077#1088#1077#1076#1073#1072#1095#1077#1085#1086' '#1079#1074#1110#1083#1100#1085#1077#1085#1085#1103' '#1074#1110#1076' '#1086#1087#1086#1076#1072#1090#1082 +
              #1091#1074#1072#1085#1085#1103')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo207: TfrxMemoView
          Left = 22.677180000000000000
          Top = 139.842610000000000000
          Width = 18.897650000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '**')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Printable = False
          Left = 483.779840000000000000
          Top = 52.913419999999990000
          Width = 215.433210000000000000
          Height = 11.338590000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Printable = False
          Left = 374.173470000000000000
          Top = 34.015769999999990000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSetName = 'frxRahDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          ParentFont = False
        end
        object Memo222: TfrxMemoView
          Left = 41.574830000000000000
          Top = 136.063080000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1055#1050#1059' '#1086#1090' 197.1.2.  '#1089#1090'.197')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = DataSetPrint
    Left = 680
    Top = 32
  end
end
