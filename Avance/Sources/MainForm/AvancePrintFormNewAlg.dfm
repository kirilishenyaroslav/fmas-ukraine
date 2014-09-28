object AvancePrintFormNewAlg: TAvancePrintFormNewAlg
  Left = 212
  Top = 166
  Width = 597
  Height = 323
  Caption = 'AvancePrintFormNewAlg'
  Color = clInactiveBorder
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    589
    289)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 88
    Top = 224
    Width = 497
    Height = 41
    Anchors = [akLeft, akRight, akBottom]
  end
  object cxButtonClose: TcxButton
    Left = 456
    Top = 232
    Width = 121
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'cxButtonClose'
    TabOrder = 4
    OnClick = cxButtonCloseClick
    Glyph.Data = {
      32040000424D3204000000000000360000002800000014000000110000000100
      180000000000FC030000120B0000120B00000000000000000000C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4B54A009C31009C3100C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4B54A00FFEFA5FFEFA55A31185A3118C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4B54A00FFEFA5FFEFA5FFE78CFFE78C313131313131C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      FF6331B54A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65A3131319C31009C31
      00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF31FFFF6331B5
      4A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65AFF9C00FF9C639C3100C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331B54A00FFEF
      A5FFEFA5000000080808FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4080808C8D0D4C8D0D4FF6331B54A00FFEFA5FFEFA5
      FFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4000000000000C8D0D4C8D0D4FF6331B54A00F7FFFFFFDE84FFDE84FF
      DE84FFDE84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000
      FFFFCE000000000000000000000000B54A00F7FFFFFFEFA5FFDE84FFDE84FFDE
      84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4000000FFFFCEFFFFCEFF
      FFBDFFC65AFFA510FF9C00B54A00F7FFFFFFEFA5FFDE84FFDE84FFCE63FFC65A
      FF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000FFFFCE0000000000
      00000000080808B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF
      9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4080808000000C8D0D4C8D0D4
      FF6331B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C31
      00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4FF31FFFF6331C6
      5A00C65A00FFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C009C3100C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD6
      73C65A00C65A00CE6363FFCE63FFC65AFF9C00FF9C009C3100C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD673FFD673
      FFD673C65A00C65A00CE6363FF9C00FF9C009C3100C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFDE84FFDE84FFDE84FFDE84FF
      DE84FFDE84C65A00C65A00C65A009C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4FF6331FF6331FF6331FF6331FF6331FF6331FF63
      31FF6331FF6331FF6331FF6331C8D0D4C8D0D4C8D0D4}
    UseSystemPaint = False
  end
  object cxButtonPrint: TcxButton
    Left = 328
    Top = 232
    Width = 115
    Height = 25
    Anchors = [akLeft]
    Caption = 'cxButtonPrint'
    Default = True
    TabOrder = 3
    OnClick = cxButtonPrintClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000830F0000830F00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A99B9B9B9B
      9B9B9B9B9B9B9B9B9B9B9B9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFA6A8A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF737373696969656563929391FFFFFFAF
      AFAFAFAFAFAFAFAFFFFFFF7B7B754F4F4F545454545454FF00FFFF00FF737373
      93979793979775777590918EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B7B755B5C
      5C787B7B606161545454FF00FF737373939797ADB5B56667665F5F5F77777777
      77777777777777777171715A5A586869697F8282707171545454FF00FF737373
      ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5A2A8A86AA4
      7708B518767878565757FF00FF737373D2D2D2988D91997C809A797BAA8186AA
      7F86AA7E86AD828AA77F859D7C7F8B7D7A5E9063787A7A575858FF00FF737373
      D2D2D2855A62956B6D8A6969896D6D876B6B866A6A886E6D8A706F8D6A699363
      6A9C6C819397975C5D5DFF00FF737373D2D2D26F4952583F415F4C4C74696972
      67677166667166667166665E424254393C8A72749397976C6D6DFF00FF737373
      ADB5B57E686A757272A6A8A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9B6E5F
      61988989ADB5B56C6D6DFF00FFFF00FF7373738E81818F8485A6A8A9FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF9B9B9B8473748F85856C6D6DFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFA6A8A9FFFFFFFFFFFFFFFFFFA6A8A99B9B9B9B9B9BFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A9FFFFFFFF
      FFFFFFFFFFA6A8A9FFFFFF9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFA6A8A9FFFFFFFCFCFCFFFFFFA6A8A99B9B9BFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A99B9B9B9B
      9B9B9B9B9B9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    UseSystemPaint = False
  end
  object cxSpinEdit1: TcxSpinEdit
    Left = 528
    Top = 40
    Width = 57
    Height = 21
    Properties.MaxValue = 2999.000000000000000000
    Properties.MinValue = 2004.000000000000000000
    TabOrder = 1
    Value = 2004
  end
  object cxComboBoxMonth: TcxComboBox
    Left = 384
    Top = 40
    Width = 105
    Height = 21
    ParentShowHint = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 12
    ShowHint = False
    TabOrder = 0
  end
  object cxComboBoxJornal: TcxComboBox
    Left = 256
    Top = 8
    Width = 121
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 5
  end
  object cxLabel1: TcxLabel
    Left = 14
    Top = 9
    Width = 233
    Height = 17
    AutoSize = False
    TabOrder = 7
  end
  object cxLabel2: TcxLabel
    Left = 490
    Top = 41
    Width = 31
    Height = 17
    AutoSize = False
    TabOrder = 8
  end
  object cxLabel3: TcxLabel
    Left = 14
    Top = 41
    Width = 233
    Height = 17
    AutoSize = False
    TabOrder = 9
  end
  object cxComboBoxSch: TcxComboBox
    Left = 256
    Top = 40
    Width = 121
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 6
  end
  object cxGrid1: TcxGrid
    Left = 4
    Top = 64
    Width = 581
    Height = 153
    Anchors = [akLeft, akTop, akRight]
    BevelKind = bkFlat
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      OnKeyDown = cxGrid1DBTableView1KeyDown
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleYellow
      Styles.Inactive = cxStyle4
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle12
      Styles.Footer = cxStyleBorder
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = cxStyleBorder
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 131
        DataBinding.FieldName = 'Print'
      end
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Width = 365
        DataBinding.FieldName = 'Name'
      end
      object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Visible = False
        SortOrder = soAscending
        DataBinding.FieldName = 'Kod'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 269
    Width = 589
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.Color = clBackground
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clWindowText
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.Color = clBackground
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clWindowText
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Fixed = False
      end>
    PaintStyle = stpsOffice11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 96
    Top = 16
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = DataSet
    Left = 128
    Top = 16
  end
  object PrintDialog1: TPrintDialog
    Copies = 1
    Options = [poPageNums, poSelection]
    Left = 64
    Top = 16
  end
  object DataSetJornal: TpFIBDataSet
    Database = fmAvanceMainForm.Database
    Transaction = fmAvanceMainForm.pFIBTransaction1
    Left = 336
    poSQLINT64ToBCD = True
  end
  object DataSet: TpFIBDataSet
    Database = fmAvanceMainForm.Database
    Transaction = fmAvanceMainForm.pFIBTransaction1
    SelectSQL.Strings = (
      'select * from J4_OTCHET_MONTH_NEW_ALG('#39'31.12.2005'#39',100, 0, 1, 1)')
    Left = 160
    Top = 16
    poSQLINT64ToBCD = True
    object DataSetSUMMA_DEBET: TFIBBCDField
      FieldName = 'SUMMA_DEBET'
      Size = 2
      RoundByScale = True
    end
    object DataSetSCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DataSetDATE_PROV_DEBET: TFIBDateField
      FieldName = 'DATE_PROV_DEBET'
    end
    object DataSetNAME_RECVIZITI_DEBET: TFIBStringField
      FieldName = 'NAME_RECVIZITI_DEBET'
      Size = 25
      EmptyStrToNull = True
    end
    object DataSetNAME_RECVIZITI_KREDIT: TFIBStringField
      FieldName = 'NAME_RECVIZITI_KREDIT'
      Size = 25
      EmptyStrToNull = True
    end
    object DataSetDATE_PROV_KREDIT: TFIBDateField
      FieldName = 'DATE_PROV_KREDIT'
    end
    object DataSetFAMILIA: TFIBStringField
      DisplayWidth = 40
      FieldName = 'FAMILIA'
      EmptyStrToNull = True
    end
    object DataSetIMYA: TFIBStringField
      DisplayWidth = 40
      FieldName = 'IMYA'
      EmptyStrToNull = True
    end
    object DataSetOTCHESTVO: TFIBStringField
      DisplayWidth = 40
      FieldName = 'OTCHESTVO'
      EmptyStrToNull = True
    end
    object DataSetBIRTHDAY: TFIBDateField
      FieldName = 'BIRTHDAY'
    end
    object DataSetTIN: TFIBStringField
      FieldName = 'TIN'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetNUM_DOC_DEBET: TFIBStringField
      FieldName = 'NUM_DOC_DEBET'
      Size = 120
      EmptyStrToNull = True
    end
    object DataSetNUM_DOC_KREDIT: TFIBStringField
      FieldName = 'NUM_DOC_KREDIT'
      Size = 120
      EmptyStrToNull = True
    end
    object DataSetDEBET_SCH: TFIBStringField
      FieldName = 'DEBET_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetKREDIT_SCH: TFIBStringField
      FieldName = 'KREDIT_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOST_ALL_DEBET: TFIBBCDField
      FieldName = 'OST_ALL_DEBET'
      Size = 2
      RoundByScale = True
    end
    object DataSetOST_ALL_KREDIT: TFIBBCDField
      FieldName = 'OST_ALL_KREDIT'
      Size = 2
      RoundByScale = True
    end
    object DataSetOST_DEBET: TFIBBCDField
      FieldName = 'OST_DEBET'
      Size = 2
      RoundByScale = True
    end
    object DataSetOST_KREDIT: TFIBBCDField
      FieldName = 'OST_KREDIT'
      Size = 2
      RoundByScale = True
    end
    object DataSetFLAG_FIO: TFIBIntegerField
      FieldName = 'FLAG_FIO'
    end
    object DataSetFIO: TFIBStringField
      DisplayWidth = 150
      FieldName = 'FIO'
      Size = 62
      EmptyStrToNull = True
    end
    object DataSetOSN_SCH: TFIBStringField
      FieldName = 'OSN_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetSUMMA_KREDIT: TFIBBCDField
      FieldName = 'SUMMA_KREDIT'
      Size = 2
      RoundByScale = True
    end
    object DataSetDATE_OST: TFIBDateField
      FieldName = 'DATE_OST'
    end
    object DataSetCOUNT_DOC: TFIBIntegerField
      FieldName = 'COUNT_DOC'
    end
    object DataSetNAME_PREDPR: TFIBStringField
      FieldName = 'NAME_PREDPR'
      Size = 40
      EmptyStrToNull = True
    end
    object DataSetR_J4: TFIBBCDField
      FieldName = 'R_J4'
      Size = 0
      RoundByScale = True
    end
    object DataSetLEVEL_: TFIBIntegerField
      FieldName = 'LEVEL_'
    end
    object DataSetR_ID_MAN: TFIBBCDField
      FieldName = 'R_ID_MAN'
      Size = 0
      RoundByScale = True
    end
    object DataSetR_ID_SCH: TFIBBCDField
      FieldName = 'R_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSetR_ID_SM: TFIBBCDField
      FieldName = 'R_ID_SM'
      Size = 0
      RoundByScale = True
    end
    object DataSetR_ID_ST: TFIBBCDField
      FieldName = 'R_ID_ST'
      Size = 0
      RoundByScale = True
    end
    object DataSetR_ID_RAZ: TFIBBCDField
      FieldName = 'R_ID_RAZ'
      Size = 0
      RoundByScale = True
    end
    object DataSetR_ID_KEKV: TFIBBCDField
      FieldName = 'R_ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object DataSetID_LEVE: TFIBIntegerField
      FieldName = 'ID_LEVE'
    end
    object DataSetLINKTO_LEVE: TFIBIntegerField
      FieldName = 'LINKTO_LEVE'
    end
    object DataSetID_DOG: TFIBBCDField
      FieldName = 'ID_DOG'
      Size = 0
      RoundByScale = True
    end
    object DataSetKOD_DOG: TFIBBCDField
      FieldName = 'KOD_DOG'
      Size = 0
      RoundByScale = True
    end
    object DataSetTAB_NUM: TFIBIntegerField
      FieldName = 'TAB_NUM'
    end
  end
  object DBDatasetSch: TfrxDBDataset
    UserName = 'DBDatasetSch'
    CloseDataSource = False
    DataSet = DataSetSch
    Left = 64
    Top = 152
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DataSet = DBDatasetSch
    DataSetName = 'DBDatasetSch'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38684.747692037000000000
    ReportOptions.LastChange = 40088.392197986110000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 120
    Top = 168
    Datasets = <
      item
        DataSet = DBDatasetSch
        DataSetName = 'DBDatasetSch'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 15.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 721.512277000000000000
        object Memo1: TfrxMemoView
          Left = 34.015770000000000000
          Width = 498.897960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[DBDatasetSch."NAME_PREDPR"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 529.134200000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1057#1090'. [Page#] '#1079' [TotalPages#]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 11.338590000000000000
          Top = 22.677180000000000000
          Width = 699.213050000000000000
          Height = 52.913420000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1088#1072#1093#1091#1085#1082#1110#1074' '#1074' '#1076#1077#1073#1077#1090' '#1088#1072#1093#1091#1085#1082#1091' '
            '[DBDatasetSch."OSN_SCH"] - [DBDatasetSch."SCH_TITLE"]'
            #1079#1072' [month] [year]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 15.118120000000000000
        Top = 211.653680000000000000
        Width = 721.512277000000000000
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000022000
          Width = 691.653990000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              #1051#1072#1073'."'#1052#1086#1076#1077#1083'.'#1087#1088#1086#1094'.'#1092#1080#1085'.'#1084#1077#1085#1077#1076#1078'."'#1044#1086#1085#1053#1059'. '#1047#1072#1082#1072#1079' '#8470' 4005 '#1086#1090' 30.11.2005 (U' +
              '[id_user][comp]DT [DATE][TIME])')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 26.456710000000000000
        Top = 162.519790000000000000
        Width = 721.512277000000000000
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559059999999988000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1041#1091#1093#1075#1072#1083#1090#1077#1088' _________________ ( [fio_user] )')
        end
      end
      object DBCross1: TfrxDBCrossView
        Left = 7.559060000000000000
        Top = 105.826840000000000000
        Width = 702.992580000000000000
        Height = 26.456710000000000000
        ColumnLevels = 2
        DownThenAcross = False
        RowLevels = 3
        CellFields.Strings = (
          'SUMMA_DEBET')
        ColumnFields.Strings = (
          'DEBET_RAH'
          'KREDIT_SCH')
        DataSet = DBDatasetSch
        DataSetName = 'DBDatasetSch'
        RowFields.Strings = (
          'NUM_P_P'
          'FIO'
          'TAB_NUM')
        Memos = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
          662D38223F3E3C63726F73733E3C63656C6C6D656D6F733E3C546672784D656D
          6F56696577204E616D653D2222204C6566743D223137382220546F703D223534
          222057696474683D22393122204865696768743D2232322220416C6C6F774578
          7072657373696F6E733D2246616C73652220436F6C6F723D2231333433343837
          392220446973706C6179466F726D61742E446563696D616C536570617261746F
          723D222C2220446973706C6179466F726D61742E466F726D61745374723D2225
          322E32662220446973706C6179466F726D61742E4B696E643D22666B4E756D65
          7269632220466F6E742E436861727365743D223230342220466F6E742E436F6C
          6F723D222D31363737373230382220466F6E742E4865696768743D222D313322
          20466F6E742E4E616D653D2254696D6573204E657720526F6D616E2220466F6E
          742E5374796C653D223022204672616D652E5479703D2231352220476170583D
          22332220476170593D2233222048416C69676E3D226861526967687422204D65
          6D6F2E546578743D22302C30302220506172656E74466F6E743D2246616C7365
          22205374796C653D2263656C6C222056416C69676E3D22766143656E74657222
          2F3E3C2F63656C6C6D656D6F733E3C636F6C756D6E6D656D6F733E3C54667278
          4D656D6F56696577204E616D653D2222205461673D2231303022204C6566743D
          223137382220546F703D223130222057696474683D2239312220486569676874
          3D2232322220416C6C6F7745787072657373696F6E733D2246616C7365222043
          6F6C6F723D2231363737343334382220466F6E742E436861727365743D223122
          20466F6E742E436F6C6F723D222D31363737373230382220466F6E742E486569
          6768743D222D31332220466F6E742E4E616D653D22417269616C2220466F6E74
          2E5374796C653D223022204672616D652E5479703D2231352220476170583D22
          332220476170593D2233222048416C69676E3D226861526967687422204D656D
          6F2E546578743D222220506172656E74466F6E743D2246616C73652220537479
          6C653D22636F6C756D6E222056416C69676E3D22766143656E746572222F3E3C
          546672784D656D6F56696577204E616D653D2222205461673D2231303122204C
          6566743D223137382220546F703D223332222057696474683D22393122204865
          696768743D2232322220416C6C6F7745787072657373696F6E733D2246616C73
          6522204672616D652E5479703D2231352220476170583D22332220476170593D
          2233222048416C69676E3D22686143656E74657222204D656D6F2E546578743D
          2222205374796C653D22636F6C756D6E222056416C69676E3D22766143656E74
          6572222F3E3C2F636F6C756D6E6D656D6F733E3C636F6C756D6E746F74616C6D
          656D6F733E3C546672784D656D6F56696577204E616D653D2222205461673D22
          33303022204C6566743D223236392220546F703D223130222057696474683D22
          383422204865696768743D2234342220416C6C6F7745787072657373696F6E73
          3D2246616C73652220436F6C6F723D2231363736333930342220466F6E742E43
          6861727365743D22312220466F6E742E436F6C6F723D222D3136373737323038
          2220466F6E742E4865696768743D222D31332220466F6E742E4E616D653D2241
          7269616C2220466F6E742E5374796C653D223122204672616D652E5479703D22
          31352220476170583D22332220476170593D2233222048416C69676E3D226861
          43656E74657222204D656D6F2E546578743D22CFEE20F0E0F5F3EDEAF33A2220
          506172656E74466F6E743D2246616C736522205374796C653D22636F6C677261
          6E64222056416C69676E3D22766143656E746572222F3E3C546672784D656D6F
          56696577204E616D653D2222205461673D2233303122204C6566743D22323139
          2220546F703D223332222057696474683D22333822204865696768743D223232
          222056697369626C653D2246616C73652220416C6C6F7745787072657373696F
          6E733D2246616C73652220466F6E742E436861727365743D22312220466F6E74
          2E436F6C6F723D22302220466F6E742E4865696768743D222D31332220466F6E
          742E4E616D653D22417269616C2220466F6E742E5374796C653D223122204672
          616D652E5479703D2231352220476170583D22332220476170593D2233222048
          416C69676E3D22686143656E74657222204D656D6F2E546578743D22546F7461
          6C2220506172656E74466F6E743D2246616C736522205374796C653D22636F6C
          746F74616C222056416C69676E3D22766143656E746572222F3E3C2F636F6C75
          6D6E746F74616C6D656D6F733E3C726F776D656D6F733E3C546672784D656D6F
          56696577204E616D653D2222205461673D2232303022204C6566743D22313022
          20546F703D223534222057696474683D22363922204865696768743D22323222
          20416C6C6F7745787072657373696F6E733D2246616C73652220436F6C6F723D
          2231363737343334382220466F6E742E436861727365743D22312220466F6E74
          2E436F6C6F723D222D31363737373230382220466F6E742E4865696768743D22
          2D31332220466F6E742E4E616D653D22417269616C2220466F6E742E5374796C
          653D223022204672616D652E5479703D2231352220476170583D223322204761
          70593D223322204D656D6F2E546578743D222220506172656E74466F6E743D22
          46616C736522205374796C653D22726F77222056416C69676E3D22766143656E
          746572222F3E3C546672784D656D6F56696577204E616D653D2222205461673D
          2232303122204C6566743D2237392220546F703D223534222057696474683D22
          323922204865696768743D2232322220416C6C6F7745787072657373696F6E73
          3D2246616C736522204672616D652E5479703D2231352220476170583D223322
          20476170593D223322204D656D6F2E546578743D2222205374796C653D22726F
          77222056416C69676E3D22766143656E746572222F3E3C546672784D656D6F56
          696577204E616D653D2222205461673D2232303222204C6566743D2231303822
          20546F703D223534222057696474683D22373022204865696768743D22323222
          20416C6C6F7745787072657373696F6E733D2246616C736522204672616D652E
          5479703D2231352220476170583D22332220476170593D2233222048416C6967
          6E3D226861526967687422204D656D6F2E546578743D2222205374796C653D22
          726F77222056416C69676E3D22766143656E746572222F3E3C2F726F776D656D
          6F733E3C726F77746F74616C6D656D6F733E3C546672784D656D6F5669657720
          4E616D653D2222205461673D2234303022204C6566743D2231302220546F703D
          223736222057696474683D2231363822204865696768743D2232322220416C6C
          6F7745787072657373696F6E733D2246616C73652220436F6C6F723D22313637
          36333930342220466F6E742E436861727365743D22312220466F6E742E436F6C
          6F723D222D31363737373230382220466F6E742E4865696768743D222D313322
          20466F6E742E4E616D653D22417269616C2220466F6E742E5374796C653D2231
          22204672616D652E5479703D2231352220476170583D22332220476170593D22
          33222048416C69676E3D22686143656E74657222204D656D6F2E546578743D22
          CFB3E4F1F3ECEEEA20EFEE20CFB2C13A2220506172656E74466F6E743D224661
          6C736522205374796C653D22726F776772616E64222056416C69676E3D227661
          43656E746572222F3E3C546672784D656D6F56696577204E616D653D22222054
          61673D2234303122204C6566743D2233392220546F703D223736222057696474
          683D22383922204865696768743D223232222056697369626C653D2246616C73
          652220416C6C6F7745787072657373696F6E733D2246616C73652220466F6E74
          2E436861727365743D22312220466F6E742E436F6C6F723D22302220466F6E74
          2E4865696768743D222D31332220466F6E742E4E616D653D22417269616C2220
          466F6E742E5374796C653D223122204672616D652E5479703D22313522204761
          70583D22332220476170593D2233222048416C69676E3D22686143656E746572
          22204D656D6F2E546578743D22546F74616C2220506172656E74466F6E743D22
          46616C736522205374796C653D22726F77746F74616C222056416C69676E3D22
          766143656E746572222F3E3C546672784D656D6F56696577204E616D653D2222
          205461673D2234303222204C6566743D223134392220546F703D223736222057
          696474683D22333822204865696768743D223232222056697369626C653D2246
          616C73652220416C6C6F7745787072657373696F6E733D2246616C7365222046
          6F6E742E436861727365743D22312220466F6E742E436F6C6F723D2230222046
          6F6E742E4865696768743D222D31332220466F6E742E4E616D653D2241726961
          6C2220466F6E742E5374796C653D223122204672616D652E5479703D22313522
          20476170583D22332220476170593D2233222048416C69676E3D22686143656E
          74657222204D656D6F2E546578743D22546F74616C2220506172656E74466F6E
          743D2246616C736522205374796C653D22726F77746F74616C222056416C6967
          6E3D22766143656E746572222F3E3C2F726F77746F74616C6D656D6F733E3C63
          656C6C66756E6374696F6E733E3C6974656D20312F3E3C2F63656C6C66756E63
          74696F6E733E3C636F6C756D6E736F72743E3C6974656D20302F3E3C6974656D
          20302F3E3C2F636F6C756D6E736F72743E3C726F77736F72743E3C6974656D20
          302F3E3C6974656D20322F3E3C6974656D20302F3E3C2F726F77736F72743E3C
          2F63726F73733E}
      end
    end
  end
  object DataSetSch: TpFIBDataSet
    Database = fmAvanceMainForm.Database
    Transaction = fmAvanceMainForm.pFIBTransaction1
    SelectSQL.Strings = (
      
        'select * from J4_OTCHET_SCH_NEW_ALG('#39'01.09.2005'#39', 100, 1, 11999,' +
        ' 0)')
    Left = 16
    Top = 176
    poSQLINT64ToBCD = True
    object DataSetSchNAME_PREDPR: TFIBStringField
      FieldName = 'NAME_PREDPR'
      Size = 40
      EmptyStrToNull = True
    end
    object DataSetSchSCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DataSetSchOSN_SCH: TFIBStringField
      FieldName = 'OSN_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetSchFIO: TFIBStringField
      DisplayWidth = 150
      FieldName = 'FIO'
      Size = 62
      EmptyStrToNull = True
    end
    object DataSetSchBIRTHDAY: TFIBDateField
      FieldName = 'BIRTHDAY'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object DataSetSchTIN: TFIBStringField
      FieldName = 'TIN'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetSchTAB_NUM: TFIBIntegerField
      FieldName = 'TAB_NUM'
    end
    object DataSetSchDEBET_SCH: TFIBStringField
      FieldName = 'DEBET_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetSchKREDIT_SCH: TFIBStringField
      FieldName = 'KREDIT_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetSchOST_DEBET: TFIBBCDField
      FieldName = 'OST_DEBET'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DataSetSchOST_KREDIT: TFIBBCDField
      FieldName = 'OST_KREDIT'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DataSetSchSUMMA_DEBET: TFIBBCDField
      FieldName = 'SUMMA_DEBET'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DataSetSchSUMMA_KREDIT: TFIBBCDField
      FieldName = 'SUMMA_KREDIT'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DataSetSchOST_ALL_DEBET: TFIBBCDField
      FieldName = 'OST_ALL_DEBET'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DataSetSchOST_ALL_KREDIT: TFIBBCDField
      FieldName = 'OST_ALL_KREDIT'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DataSetSchDEBET_RAH: TFIBStringField
      FieldName = 'DEBET_RAH'
      Size = 50
      EmptyStrToNull = True
    end
    object DataSetSchNUM_P_P: TFIBIntegerField
      FieldName = 'NUM_P_P'
    end
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 320
    Top = 104
  end
  object DataSetLang: TpFIBDataSet
    Left = 360
    Top = 104
    poSQLINT64ToBCD = True
  end
  object DataSetKorSch: TpFIBDataSet
    Database = fmAvanceMainForm.Database
    Transaction = fmAvanceMainForm.pFIBTransaction1
    SelectSQL.Strings = (
      'SELECT * FROM J4_OTCHET_KOR_SCH(1, '#39'01.01.2005'#39')')
    Left = 208
    Top = 56
    poSQLINT64ToBCD = True
    object DataSetKorSchNAME_SCH: TFIBStringField
      FieldName = 'NAME_SCH'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetKorSchVH_DEB: TFIBBCDField
      FieldName = 'VH_DEB'
      Size = 2
      RoundByScale = True
    end
    object DataSetKorSchVH_KRED: TFIBBCDField
      FieldName = 'VH_KRED'
      Size = 2
      RoundByScale = True
    end
    object DataSetKorSchOBOR_DEB: TFIBBCDField
      FieldName = 'OBOR_DEB'
      Size = 2
      RoundByScale = True
    end
    object DataSetKorSchOBOR_KRED: TFIBBCDField
      FieldName = 'OBOR_KRED'
      Size = 2
      RoundByScale = True
    end
    object DataSetKorSchVIH_DEB: TFIBBCDField
      FieldName = 'VIH_DEB'
      Size = 2
      RoundByScale = True
    end
    object DataSetKorSchVIH_KRED: TFIBBCDField
      FieldName = 'VIH_KRED'
      Size = 2
      RoundByScale = True
    end
    object DataSetKorSchR_LEVEL: TFIBIntegerField
      FieldName = 'R_LEVEL'
    end
    object DataSetKorSchNAME_PREDPR: TFIBStringField
      FieldName = 'NAME_PREDPR'
      Size = 40
      EmptyStrToNull = True
    end
    object DataSetKorSchR_ID_SCH: TFIBBCDField
      FieldName = 'R_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSetKorSchKOD_SCH: TFIBStringField
      FieldName = 'KOD_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetKorSchSCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetKorSchKR_ID_SCH: TFIBBCDField
      FieldName = 'KR_ID_SCH'
      Size = 0
      RoundByScale = True
    end
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = DataSetKorSch
    Left = 240
    Top = 56
  end
  object frReport2: TfrReport
    Dataset = frDBDataSet2
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 272
    Top = 56
    ReportForm = {19000000}
  end
  object RX_Otchet: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Name'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'Print'
        DataType = ftSmallint
      end
      item
        Name = 'Kod'
        DataType = ftInteger
      end>
    Left = 8
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = RX_Otchet
    Left = 40
    Top = 80
  end
  object StyleRepository: TcxStyleRepository
    Left = 480
    Top = 8
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
  object DataSetSpravka: TpFIBDataSet
    Database = fmAvanceMainForm.Database
    Transaction = fmAvanceMainForm.pFIBTransaction1
    SelectSQL.Strings = (
      
        'SELECT * FROM J4_CREATE_SPRAVKA_PO_SCH_NEW_AL('#39'01.01.2006'#39', 1199' +
        '9, 0)')
    Left = 400
    Top = 160
    poSQLINT64ToBCD = True
    object DataSetSpravkaR_OSN_SCH: TFIBStringField
      FieldName = 'R_OSN_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetSpravkaR_TYTLE_OSN_SCH: TFIBStringField
      FieldName = 'R_TYTLE_OSN_SCH'
      Size = 60
      EmptyStrToNull = True
    end
    object DataSetSpravkaR_KOR_SCH: TFIBStringField
      FieldName = 'R_KOR_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetSpravkaR_TYTLE_KOR_SCH: TFIBStringField
      FieldName = 'R_TYTLE_KOR_SCH'
      Size = 60
      EmptyStrToNull = True
    end
    object DataSetSpravkaR_SUMMA: TFIBBCDField
      FieldName = 'R_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetSpravkaNAME_PREDPR: TFIBStringField
      FieldName = 'NAME_PREDPR'
      Size = 180
      EmptyStrToNull = True
    end
  end
  object frxDBDatasetSpravka: TfrxDBDataset
    UserName = 'frxDBDatasetSpravka'
    CloseDataSource = False
    DataSet = DataSetSpravka
    Left = 432
    Top = 160
  end
  object frxReport2: TfrxReport
    Version = '3.15'
    DataSet = DBDatasetSch
    DataSetName = 'DBDatasetSch'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38684.747692037000000000
    ReportOptions.LastChange = 38888.607655497700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 464
    Top = 160
    Datasets = <
      item
        DataSet = DBDatasetSch
        DataSetName = 'DBDatasetSch'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 15.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 721.512277000000000000
        object Memo1: TfrxMemoView
          Left = 34.015770000000000000
          Width = 498.897960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[DBDatasetSch."NAME_PREDPR"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 529.134200000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1057#1090'. [Page#] '#1079' [TotalPages#]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 11.338590000000000000
          Top = 22.677180000000000000
          Width = 699.213050000000000000
          Height = 52.913420000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1088#1072#1093#1091#1085#1082#1110#1074' '#1079' '#1082#1088#1077#1076#1080#1090#1091' '#1088#1072#1093#1091#1085#1082#1072' '
            '[DBDatasetSch."OSN_SCH"] - [DBDatasetSch."SCH_TITLE"]'
            #1079#1072' [month] [year]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 15.118120000000000000
        Top = 211.653680000000000000
        Width = 721.512277000000000000
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 691.653990000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              #1051#1072#1073'."'#1052#1086#1076#1077#1083'.'#1087#1088#1086#1094'.'#1092#1080#1085'.'#1084#1077#1085#1077#1076#1078'."'#1044#1086#1085#1053#1059'. '#1047#1072#1082#1072#1079' '#8470' 4006 '#1086#1090' 30.11.2005 (U' +
              '[id_user][comp]DT [DATE][TIME])')
          ParentFont = False
        end
      end
      object DBCross1: TfrxDBCrossView
        Left = 7.559060000000000000
        Top = 105.826840000000000000
        Width = 702.992580000000000000
        Height = 26.456710000000000000
        ColumnLevels = 2
        DownThenAcross = False
        RowLevels = 3
        CellFields.Strings = (
          'SUMMA_KREDIT')
        ColumnFields.Strings = (
          'DEBET_RAH'
          'DEBET_SCH')
        DataSet = DBDatasetSch
        DataSetName = 'DBDatasetSch'
        RowFields.Strings = (
          'NUM_P_P'
          'FIO'
          'TAB_NUM')
        Memos = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
          662D38223F3E3C63726F73733E3C63656C6C6D656D6F733E3C546672784D656D
          6F56696577204E616D653D2222204C6566743D223137382220546F703D223534
          222057696474683D22383622204865696768743D2232322220416C6C6F774578
          7072657373696F6E733D2246616C73652220436F6C6F723D2231333433343837
          392220446973706C6179466F726D61742E446563696D616C536570617261746F
          723D222C2220446973706C6179466F726D61742E466F726D61745374723D2225
          322E32662220446973706C6179466F726D61742E4B696E643D22666B4E756D65
          7269632220466F6E742E436861727365743D223230342220466F6E742E436F6C
          6F723D222D31363737373230382220466F6E742E4865696768743D222D313322
          20466F6E742E4E616D653D2254696D6573204E657720526F6D616E2220466F6E
          742E5374796C653D223022204672616D652E5479703D2231352220476170583D
          22332220476170593D2233222048416C69676E3D226861526967687422204D65
          6D6F2E546578743D22302C30302220506172656E74466F6E743D2246616C7365
          22205374796C653D2263656C6C222056416C69676E3D22766143656E74657222
          2F3E3C2F63656C6C6D656D6F733E3C636F6C756D6E6D656D6F733E3C54667278
          4D656D6F56696577204E616D653D2222205461673D2231303022204C6566743D
          223137382220546F703D223130222057696474683D2238362220486569676874
          3D2232322220416C6C6F7745787072657373696F6E733D2246616C7365222043
          6F6C6F723D2231363737343334382220466F6E742E436861727365743D223122
          20466F6E742E436F6C6F723D222D31363737373230382220466F6E742E486569
          6768743D222D31332220466F6E742E4E616D653D22417269616C2220466F6E74
          2E5374796C653D223022204672616D652E5479703D2231352220476170583D22
          332220476170593D2233222048416C69676E3D226861526967687422204D656D
          6F2E546578743D222220506172656E74466F6E743D2246616C73652220537479
          6C653D22636F6C756D6E222056416C69676E3D22766143656E746572222F3E3C
          546672784D656D6F56696577204E616D653D2222205461673D2231303122204C
          6566743D223137382220546F703D223332222057696474683D22383622204865
          696768743D2232322220416C6C6F7745787072657373696F6E733D2246616C73
          6522204672616D652E5479703D2231352220476170583D22332220476170593D
          2233222048416C69676E3D22686143656E74657222204D656D6F2E546578743D
          2222205374796C653D22636F6C756D6E222056416C69676E3D22766143656E74
          6572222F3E3C2F636F6C756D6E6D656D6F733E3C636F6C756D6E746F74616C6D
          656D6F733E3C546672784D656D6F56696577204E616D653D2222205461673D22
          33303022204C6566743D223236342220546F703D223130222057696474683D22
          383422204865696768743D2234342220416C6C6F7745787072657373696F6E73
          3D2246616C73652220436F6C6F723D2231363736333930342220466F6E742E43
          6861727365743D22312220466F6E742E436F6C6F723D222D3136373737323038
          2220466F6E742E4865696768743D222D31332220466F6E742E4E616D653D2241
          7269616C2220466F6E742E5374796C653D223122204672616D652E5479703D22
          31352220476170583D22332220476170593D2233222048416C69676E3D226861
          43656E74657222204D656D6F2E546578743D22CFEE20F0E0F5F3EDEAF33A2220
          506172656E74466F6E743D2246616C736522205374796C653D22636F6C677261
          6E64222056416C69676E3D22766143656E746572222F3E3C546672784D656D6F
          56696577204E616D653D2222205461673D2233303122204C6566743D22323134
          2220546F703D223332222057696474683D22333822204865696768743D223232
          222056697369626C653D2246616C73652220416C6C6F7745787072657373696F
          6E733D2246616C73652220466F6E742E436861727365743D22312220466F6E74
          2E436F6C6F723D22302220466F6E742E4865696768743D222D31332220466F6E
          742E4E616D653D22417269616C2220466F6E742E5374796C653D223122204672
          616D652E5479703D2231352220476170583D22332220476170593D2233222048
          416C69676E3D22686143656E74657222204D656D6F2E546578743D22546F7461
          6C2220506172656E74466F6E743D2246616C736522205374796C653D22636F6C
          746F74616C222056416C69676E3D22766143656E746572222F3E3C2F636F6C75
          6D6E746F74616C6D656D6F733E3C726F776D656D6F733E3C546672784D656D6F
          56696577204E616D653D2222205461673D2232303022204C6566743D22313022
          20546F703D223534222057696474683D22363922204865696768743D22323222
          20416C6C6F7745787072657373696F6E733D2246616C73652220436F6C6F723D
          2231363737343334382220466F6E742E436861727365743D22312220466F6E74
          2E436F6C6F723D222D31363737373230382220466F6E742E4865696768743D22
          2D31332220466F6E742E4E616D653D22417269616C2220466F6E742E5374796C
          653D223022204672616D652E5479703D2231352220476170583D223322204761
          70593D223322204D656D6F2E546578743D222220506172656E74466F6E743D22
          46616C736522205374796C653D22726F77222056416C69676E3D22766143656E
          746572222F3E3C546672784D656D6F56696577204E616D653D2222205461673D
          2232303122204C6566743D2237392220546F703D223534222057696474683D22
          323922204865696768743D2232322220416C6C6F7745787072657373696F6E73
          3D2246616C736522204672616D652E5479703D2231352220476170583D223322
          20476170593D223322204D656D6F2E546578743D2222205374796C653D22726F
          77222056416C69676E3D22766143656E746572222F3E3C546672784D656D6F56
          696577204E616D653D2222205461673D2232303222204C6566743D2231303822
          20546F703D223534222057696474683D22373022204865696768743D22323222
          20416C6C6F7745787072657373696F6E733D2246616C736522204672616D652E
          5479703D2231352220476170583D22332220476170593D2233222048416C6967
          6E3D226861526967687422204D656D6F2E546578743D2222205374796C653D22
          726F77222056416C69676E3D22766143656E746572222F3E3C2F726F776D656D
          6F733E3C726F77746F74616C6D656D6F733E3C546672784D656D6F5669657720
          4E616D653D2222205461673D2234303022204C6566743D2231302220546F703D
          223736222057696474683D2231363822204865696768743D2232322220416C6C
          6F7745787072657373696F6E733D2246616C73652220436F6C6F723D22313637
          36333930342220466F6E742E436861727365743D22312220466F6E742E436F6C
          6F723D222D31363737373230382220466F6E742E4865696768743D222D313322
          20466F6E742E4E616D653D22417269616C2220466F6E742E5374796C653D2231
          22204672616D652E5479703D2231352220476170583D22332220476170593D22
          33222048416C69676E3D22686143656E74657222204D656D6F2E546578743D22
          CFB3E4F1F3ECEEEA20EFEE20CFB2C13A2220506172656E74466F6E743D224661
          6C736522205374796C653D22726F776772616E64222056416C69676E3D227661
          43656E746572222F3E3C546672784D656D6F56696577204E616D653D22222054
          61673D2234303122204C6566743D2233392220546F703D223736222057696474
          683D22383922204865696768743D223232222056697369626C653D2246616C73
          652220416C6C6F7745787072657373696F6E733D2246616C73652220466F6E74
          2E436861727365743D22312220466F6E742E436F6C6F723D22302220466F6E74
          2E4865696768743D222D31332220466F6E742E4E616D653D22417269616C2220
          466F6E742E5374796C653D223122204672616D652E5479703D22313522204761
          70583D22332220476170593D2233222048416C69676E3D22686143656E746572
          22204D656D6F2E546578743D22546F74616C2220506172656E74466F6E743D22
          46616C736522205374796C653D22726F77746F74616C222056416C69676E3D22
          766143656E746572222F3E3C546672784D656D6F56696577204E616D653D2222
          205461673D2234303222204C6566743D223134392220546F703D223736222057
          696474683D22333822204865696768743D223232222056697369626C653D2246
          616C73652220416C6C6F7745787072657373696F6E733D2246616C7365222046
          6F6E742E436861727365743D22312220466F6E742E436F6C6F723D2230222046
          6F6E742E4865696768743D222D31332220466F6E742E4E616D653D2241726961
          6C2220466F6E742E5374796C653D223122204672616D652E5479703D22313522
          20476170583D22332220476170593D2233222048416C69676E3D22686143656E
          74657222204D656D6F2E546578743D22546F74616C2220506172656E74466F6E
          743D2246616C736522205374796C653D22726F77746F74616C222056416C6967
          6E3D22766143656E746572222F3E3C2F726F77746F74616C6D656D6F733E3C63
          656C6C66756E6374696F6E733E3C6974656D20312F3E3C2F63656C6C66756E63
          74696F6E733E3C636F6C756D6E736F72743E3C6974656D20302F3E3C6974656D
          20302F3E3C2F636F6C756D6E736F72743E3C726F77736F72743E3C6974656D20
          302F3E3C6974656D20302F3E3C6974656D20302F3E3C2F726F77736F72743E3C
          2F63726F73733E}
      end
      object ReportSummary1: TfrxReportSummary
        Height = 26.456710000000000000
        Top = 162.519790000000000000
        Width = 721.512277000000000000
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559059999999988000
          Width = 702.992580000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1041#1091#1093#1075#1072#1083#1090#1077#1088' _______________________ ( [fio_user] )')
          ParentFont = False
        end
      end
    end
  end
end
