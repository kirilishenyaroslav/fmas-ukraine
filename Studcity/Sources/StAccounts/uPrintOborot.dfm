object frmPrintOborot: TfrmPrintOborot
  Left = 276
  Top = 159
  BorderStyle = bsDialog
  Caption = #1055#1110#1076#1075#1086#1090#1086#1074#1082#1072' '#1086#1073#1086#1088#1086#1090#1085#1086#1111' '#1074#1110#1076#1086#1084#1086#1089#1090#1110' '#1076#1086' '#1076#1088#1091#1082#1091
  ClientHeight = 303
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxPrintFilter: TGroupBox
    Left = 0
    Top = 106
    Width = 382
    Height = 157
    Align = alTop
    Caption = #1043#1088#1091#1087#1091#1074#1072#1090#1080' '#1088#1077#1079#1091#1083#1100#1090#1091#1102#1095#1080#1081' '#1088#1077#1108#1089#1090#1088
    TabOrder = 0
    object cxGridPrintGroup: TcxGrid
      Left = 2
      Top = 15
      Width = 378
      Height = 140
      Align = alClient
      TabOrder = 0
      object cxGridPrintGroupDBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSourcePrintSetup
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleYellow
        Styles.Content = cxStyleYellow
        Styles.ContentEven = cxStyleYellow
        Styles.ContentOdd = cxStyleYellow
        Styles.Inactive = cxStyle4
        Styles.IncSearch = cxStyleYellow
        Styles.Selection = cxStyleMalin
        Styles.FilterBox = cxStyleYellow
        Styles.Footer = cxStyleYellow
        Styles.Group = cxStyleYellow
        Styles.GroupByBox = cxStyleYellow
        Styles.Header = cxStyleBorder
        Styles.Indicator = cxStyleYellow
        Styles.NewItemRowInfoText = cxStyleYellow
        Styles.Preview = cxStyleYellow
        object CxSelectField: TcxGridDBColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Width = 132
          DataBinding.FieldName = 'RxSelectField'
          IsCaptionAssigned = True
        end
        object CxNameField: TcxGridDBColumn
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1075#1088#1091#1087#1091#1074#1072#1085#1085#1103
          Options.Editing = False
          Width = 393
          DataBinding.FieldName = 'RxNameField'
        end
      end
      object cxGridPrintGroupLevel1: TcxGridLevel
        GridView = cxGridPrintGroupDBTableView1
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 382
    Height = 36
    Align = alTop
    TabOrder = 1
    object Gauge1: TGauge
      Left = 2
      Top = 15
      Width = 378
      Height = 19
      Align = alClient
      Progress = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 36
    Width = 382
    Height = 70
    Align = alTop
    TabOrder = 2
    object cxButtonFILTER: TcxButton
      Left = 0
      Top = 8
      Width = 377
      Height = 25
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1092#1110#1083#1100#1090#1088#1072#1094#1110#1111
      TabOrder = 0
      OnClick = cxButtonFILTERClick
    end
    object cxButtonStart: TcxButton
      Left = 80
      Top = 37
      Width = 131
      Height = 25
      Caption = #1055#1086#1095#1072#1090#1080' '#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082
      TabOrder = 1
      OnClick = cxButtonStartClick
    end
    object cxButtonCancel: TcxButton
      Left = 216
      Top = 37
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      Enabled = False
      TabOrder = 2
    end
    object cxButtonExit: TcxButton
      Left = 296
      Top = 37
      Width = 75
      Height = 25
      Caption = #1042#1080#1081#1090#1080
      TabOrder = 3
      OnClick = cxButtonExitClick
    end
  end
  object cxButtonView: TcxButton
    Left = 304
    Top = 272
    Width = 75
    Height = 25
    Caption = #1044#1088#1091#1082' '#1079#1074#1110#1090#1091
    Enabled = False
    TabOrder = 3
    OnClick = cxButtonViewClick
  end
  object cxRadioGroupTypeDoc: TcxRadioGroup
    Left = 0
    Top = 264
    Width = 297
    Height = 37
    ItemIndex = 0
    Properties.Columns = 2
    Properties.DefaultValue = '0'
    Properties.Items = <
      item
        Caption = #1056#1077#1077#1089#1090#1088
        Value = '0'
      end
      item
        Caption = #1057#1074#1086#1076#1085#1072#1103
        Value = '1'
      end>
    TabOrder = 4
    Caption = ''
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 88
    Top = 176
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 120
    Top = 176
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 88
    Top = 208
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 120
    Top = 208
  end
  object pFIBDataSetPrintSetup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from ST_INI_ACOUNT_GROUP'
      'order by ORD_FIELD DESC')
    Left = 264
    Top = 160
    poSQLINT64ToBCD = True
  end
  object RxMemoryDataPrintSetup: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxSelectField'
        DataType = ftSmallint
      end
      item
        Name = 'RxNameField'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'RxNameVariant'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RxLenghtField'
        DataType = ftInteger
      end
      item
        Name = 'RxOrdFileds'
        DataType = ftSmallint
      end>
    Left = 296
    Top = 156
  end
  object DataSourcePrintSetup: TDataSource
    DataSet = RxMemoryDataPrintSetup
    Left = 264
    Top = 190
  end
  object StyleRepository: TcxStyleRepository
    Left = 176
    Top = 144
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
  object frxReport1: TfrxReport
    Version = '3.15'
    DataSetName = 'frxDBDatasetRX'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38448.688970509300000000
    ReportOptions.LastChange = 38812.632656724520000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure MemoBuildSOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."BUILD_TEXT"> = '#39#39' then'
      '         begin'
      '            if <frxDBDatasetMasterRX."BUILD_TEXTTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      '            if <frxDBDatasetMasterRX."BUILD_TEXTTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      'procedure MemoNAME_FAKOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."FAK_TEXT"> = '#39#39' then'
      '         begin'
      '            if <frxDBDatasetMasterRX."FAK_TEXTTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      '            if <frxDBDatasetMasterRX."FAK_TEXTTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      'procedure MemoKURSOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."Kurs"> = '#39#39' then'
      '         begin'
      '            if <frxDBDatasetMasterRX."KursTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      '            if <frxDBDatasetMasterRX."KursTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      ''
      
        'procedure MemoGROUP_SHORT_NAMEOnBeforePrint(Sender: TfrxComponen' +
        't);'
      'begin'
      '      if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."GROUP_SHORT_NAME"> = '#39#39' then'
      '         begin'
      
        '            if <frxDBDatasetMasterRX."GROUP_SHORT_NAMETB">=1 the' +
        'n'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      
        '            if <frxDBDatasetMasterRX."GROUP_SHORT_NAMETB">=1 the' +
        'n'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 248
    Top = 266
    Datasets = <
      item
        DataSetName = 'frxDBDatasetMasterRX'
      end>
    Variables = <
      item
        Name = 'BUILDS'
        Value = #39#1054#1073#1097#1077#1078#1080#1090#1080#1077#39
      end
      item
        Name = 'FAK'
        Value = #39#1060#1072#1082#1091#1083#1100#1090#1077#1090#39
      end
      item
        Name = 'KURS'
        Value = #39#1050#1091#1088#1089#39
      end
      item
        Name = 'CATPAY'
        Value = #39#1050#1072#1090#1077#1075#1086#1088#1103' '#1086#1087#1083#1072#1090#1099#39
      end
      item
        Name = 'TYPELIVE'
        Value = #39#1058#1080#1087' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103#39
      end
      item
        Name = 'CLASSLIVE'
        Value = #39#1050#1083#1072#1089#1089' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103#39
      end
      item
        Name = 'DATEBEG'
        Value = #39'01.03.2006'#39
      end
      item
        Name = 'DATEEND'
        Value = #39'31.03.2006'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 30.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Top = 15.118120000000000000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1074#1110#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1087#1086' '#1086#1087#1083#1072#1090#1110' '#1087#1088#1086#1078#1080#1074#1072#1085#1085#1103' '#1079#1072' '#1087#1077#1088#1110#1086#1076)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[<Date>]   [<Time>]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 37.795300000000000000
          Width = 498.897960000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[DATEBEG]')
        end
        object Memo4: TfrxMemoView
          Left = 498.897960000000000000
          Top = 37.795300000000000000
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '-[DATEEND]')
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.677180000000000000
        Top = 204.094620000000000000
        Width = 1046.929810000000000000
        DataSetName = 'frxDBDatasetMasterRX'
        RowCount = 0
        object MemoBUILD_TEXT: TfrxMemoView
          Align = baLeft
          Top = 0.220470000000006000
          Width = 151.181151180000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'MemoBuildSOnBeforePrint'
          DataSetName = 'frxDBDatasetMasterRX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."BUILD_TEXT"]')
          ParentFont = False
        end
        object MemoFAK_TEXT: TfrxMemoView
          Align = baLeft
          Left = 151.181151180000000000
          Width = 188.976377950000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'MemoNAME_FAKOnBeforePrint'
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."FAK_TEXT"]')
          ParentFont = False
        end
        object MemoKURS: TfrxMemoView
          Align = baLeft
          Left = 340.157529130000000000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'MemoKURSOnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetMasterRX."KURS"]')
          ParentFont = False
        end
        object MemoGROUP_SHORT_NAME: TfrxMemoView
          Align = baLeft
          Left = 381.732332280000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'MemoGROUP_SHORT_NAMEOnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."GROUP_SHORT_NAME"]')
          ParentFont = False
        end
        object MemoIN_NACH: TfrxMemoView
          Align = baLeft
          Left = 532.913434640000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetMasterRX."IN_NACH"]')
          ParentFont = False
        end
        object MemoCUR_NACH: TfrxMemoView
          Align = baLeft
          Left = 604.724504640000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetMasterRX."CUR_NACH"]')
          ParentFont = False
        end
        object MemoCUR_PAY: TfrxMemoView
          Align = baLeft
          Left = 680.315104640000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetMasterRX."CUR_PAY"]')
          ParentFont = False
        end
        object MemoOUT_NACH: TfrxMemoView
          Align = baLeft
          Left = 755.905704640000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetMasterRX."OUT_NACH"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 41.574830000000000000
        Top = 139.842610000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object MemoTitleBUILD_TEXT: TfrxMemoView
          Align = baLeft
          Top = 3.779529999999994000
          Width = 151.181151180000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[BUILDS]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleFAK_TEXT: TfrxMemoView
          Align = baLeft
          Left = 151.181151180000000000
          Top = 3.779529999999994000
          Width = 188.976377950000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[FAK]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleKURS: TfrxMemoView
          Align = baLeft
          Left = 340.157529130000000000
          Top = 3.779529999999994000
          Width = 41.574803150000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[KURS]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleGROUP_SHORT_NAME: TfrxMemoView
          Align = baLeft
          Left = 381.732332280000000000
          Top = 3.779529999999994000
          Width = 151.181102360000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1043#1088#1091#1087#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleIN_NACH: TfrxMemoView
          Align = baLeft
          Left = 532.913434640000000000
          Top = 3.779529999999994000
          Width = 71.811070000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1093#1110#1076#1085#1077' '#1089#1072#1083#1100#1076#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleCUR_NACH: TfrxMemoView
          Align = baLeft
          Left = 604.724504640000000000
          Top = 3.779529999999994000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleCUR_PAY: TfrxMemoView
          Align = baLeft
          Left = 680.315104640000000000
          Top = 3.779529999999994000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1087#1083#1072#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleOUT_NACH: TfrxMemoView
          Align = baLeft
          Left = 755.905704640000000000
          Top = 3.779529999999994000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1093#1110#1076#1085#1077' '#1089#1072#1083#1100#1076#1086)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 22.677180000000000000
        Top = 283.464750000000000000
        Width = 1046.929810000000000000
        object MemoSumBUILD_TEXT: TfrxMemoView
          Align = baLeft
          Top = 1.000000000000000000
          Width = 151.181151180000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftTop]
        end
        object MemoSumFAK_TEXT: TfrxMemoView
          Align = baLeft
          Left = 151.181151180000000000
          Top = 1.000000000000000000
          Width = 188.976377950000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftTop]
        end
        object MemoSumKurs: TfrxMemoView
          Align = baLeft
          Left = 340.157529130000000000
          Top = 1.000000000000000000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftTop]
        end
        object MemoSumGROUP_SHORT_NAME: TfrxMemoView
          Align = baLeft
          Left = 381.732332280000000000
          Top = 1.000000000000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftTop]
        end
        object MemoSumIN_NACH: TfrxMemoView
          Align = baLeft
          Left = 532.913434640000000000
          Top = 0.755905509999990900
          Width = 71.811008980000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetMasterRX."IN_NACH">,MasterData1)]')
          ParentFont = False
        end
        object MemoSumCUR_NACH: TfrxMemoView
          Align = baLeft
          Left = 604.724443620000000000
          Top = 0.755905509999990900
          Width = 75.590538980000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetMasterRX."CUR_NACH">,MasterData1)]')
          ParentFont = False
        end
        object MemoSumCUR_PAY: TfrxMemoView
          Align = baLeft
          Left = 680.314982600000000000
          Top = 0.755905509999990900
          Width = 75.590538980000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetMasterRX."CUR_PAY">,MasterData1)]')
          ParentFont = False
        end
        object MemoSumOUT_NACH: TfrxMemoView
          Align = baLeft
          Left = 755.905521580000000000
          Top = 0.755905509999990900
          Width = 75.590538980000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetMasterRX."OUT_NACH">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 40
    Top = 154
    object act_debug: TAction
      Caption = 'act_debug'
      ShortCut = 57412
      OnExecute = act_debugExecute
    end
  end
end
