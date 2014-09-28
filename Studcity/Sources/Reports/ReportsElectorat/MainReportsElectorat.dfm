object frmMainElectorat: TfrmMainElectorat
  Left = 385
  Top = 270
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1057#1087#1080#1089#1086#1082' '#1076#1083#1103' '#1074#1099#1073#1086#1088#1086#1074
  ClientHeight = 253
  ClientWidth = 310
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
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 224
    Top = 203
    Width = 75
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 9
    OnClick = cxButton1Click
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 234
    Width = 310
    Height = 19
    Panels = <
      item
        Width = 10
      end
      item
        Width = 200
      end>
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 12
    Top = 16
    Width = 289
    Height = 21
    Color = clInfoBk
    KeyField = 'RxID'
    ListField = 'RxNAME'
    ListSource = DataSource1
    TabOrder = 0
    OnCloseUp = DBLookupComboBox1Exit
  end
  object RadioGroup1: TRadioGroup
    Left = 11
    Top = 126
    Width = 166
    Height = 73
    Caption = #1058#1080#1087' '#1073#1091#1084#1072#1075#1080
    Items.Strings = (
      #1055#1077#1095#1072#1090#1100' '#1085#1072' '#1040'4'
      #1055#1077#1095#1072#1090#1100' '#1085#1072' '#1040'3')
    TabOrder = 3
  end
  object cxDateEdit1: TcxDateEdit
    Left = 10
    Top = 96
    Width = 121
    Height = 21
    Properties.MaxDate = 73415.000000000000000000
    Properties.MinDate = 2.000000000000000000
    Style.Color = clInfoBk
    TabOrder = 2
    EditValue = 2d
  end
  object cxLabel1: TcxLabel
    Left = 0
    Top = 0
    Width = 110
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1090#1095#1077#1090#1072
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 80
    Width = 338
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
    Caption = 
      #1044#1072#1090#1072' '#1074#1099#1073#1086#1088#1086#1074'                                                    ' +
      '         '
  end
  object cxLabel3: TcxLabel
    Left = 10
    Top = 40
    Width = 277
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
    Caption = #1044#1072#1090#1072' '#1085#1072' '#1082#1086#1090#1086#1088#1091#1102' '#1076#1086#1083#1078#1085#1086'  '#1080#1089#1087#1086#1085#1080#1090#1100#1089#1103' 18 '#1083#1077#1090
  end
  object cxDateEdit2: TcxDateEdit
    Left = 10
    Top = 56
    Width = 121
    Height = 21
    Properties.MaxDate = 73415.000000000000000000
    Properties.MinDate = 2.000000000000000000
    Style.Color = clInfoBk
    TabOrder = 1
    EditValue = 2d
  end
  object cxCheckBoxViewRoom: TcxCheckBox
    Left = 8
    Top = 208
    Width = 193
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1055#1077#1095#1072#1090#1100' '#1082#1086#1084#1085#1072#1090#1099
    TabOrder = 7
    Visible = False
  end
  object pFIBDatabase1: TpFIBDatabase
    DefaultTransaction = pFIBTransaction1
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 144
    Top = 48
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 112
    Top = 80
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    Left = 80
    Top = 80
    poSQLINT64ToBCD = True
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = pFIBDataSet1
    Left = 16
    Top = 48
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38639.556061794000000000
    ReportOptions.LastChange = 40127.628383784700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      'end.')
    Left = 80
    Top = 48
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 15.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 699.213050000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        StartNewPage = True
        object Memo1: TfrxMemoView
          Width = 408.189240000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDBDataset1."NAME_FAK"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 15.118120000000000000
        Top = 102.047310000000000000
        Width = 699.213050000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo2: TfrxMemoView
          Align = baLeft
          Width = 132.283550000000000000
          Height = 15.118110240000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."FAM_RUS"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baLeft
          Left = 132.283550000000000000
          Width = 132.283550000000000000
          Height = 15.118110240000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."IMYA_RUS"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Left = 264.567100000000000000
          Width = 147.401670000000000000
          Height = 15.118110240000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."OTCH_RUS"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          Left = 411.968770000000000000
          Width = 41.574830000000000000
          Height = 15.118110240000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."KURS"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          Left = 453.543600000000000000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."BUILDS"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Left = 532.913730000000000000
          Width = 94.488250000000000000
          Height = 15.118110240000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."ROOMSTR"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Align = baLeft
          Left = 627.401980000000000000
          Width = 68.031540000000000000
          Height = 15.118110240000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."DATE_ROJ"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 15.118120000000000000
        Top = 64.252010000000000000
        Width = 699.213050000000000000
        object Memo8: TfrxMemoView
          Align = baLeft
          Width = 132.283550000000000000
          Height = 15.118110240000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1060#1072#1084#1080#1083#1080#1103)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          Left = 132.283550000000000000
          Width = 132.283550000000000000
          Height = 15.118110240000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1048#1084#1103)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          Left = 264.567100000000000000
          Width = 147.401670000000000000
          Height = 15.118110240000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1054#1090#1095#1077#1089#1090#1074#1086)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baLeft
          Left = 411.968770000000000000
          Width = 41.574830000000000000
          Height = 15.118110240000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1050#1091#1088#1089)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Align = baLeft
          Left = 453.543600000000000000
          Width = 79.370130000000000000
          Height = 15.118110240000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1054#1073#1097#1077#1078#1080#1090#1080#1077)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Align = baLeft
          Left = 532.913730000000000000
          Width = 94.488250000000000000
          Height = 15.118110240000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1050#1086#1084#1085#1072#1090#1072)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 627.401980000000000000
          Width = 68.031540000000000000
          Height = 15.118110240000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1044#1072#1090#1072' '#1088#1086#1078#1076'.')
          ParentFont = False
        end
      end
    end
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 48
    Top = 48
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 112
    Top = 48
  end
  object ActionList1: TActionList
    Left = 16
    Top = 16
    object ActionDesigned: TAction
      Caption = 'ActionDesigned'
      ShortCut = 57412
      OnExecute = ActionDesignedExecute
    end
  end
  object RxMemoryData1: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxID'
        DataType = ftVariant
      end
      item
        Name = 'RxNAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'RxTYPE'
        DataType = ftVariant
      end>
    AfterScroll = RxMemoryData1AfterScroll
    Left = 144
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    Left = 48
    Top = 16
  end
  object frxDBDatasetMaster: TfrxDBDataset
    UserName = 'frxDBDatasetMaster'
    CloseDataSource = False
    DataSet = pFIBDataSetMaster
    Left = 112
    Top = 16
  end
  object frxDBDatasetDetails: TfrxDBDataset
    UserName = 'frxDBDatasetDetails'
    CloseDataSource = False
    DataSet = pFIBDataSetDetails
    Left = 144
    Top = 16
  end
  object pFIBDataSetMaster: TpFIBDataSet
    SelectSQL.Strings = (
      'select DISTINCT ID_FAK,NAME_FAK'
      
        'from ST_PRINT_LIST_ELEKTORAT(:param_type,:param_date,:param_date' +
        '_rog)'
      'order by NAME_FAK')
    DataSource = DataSource1
    Left = 16
    Top = 80
    poSQLINT64ToBCD = True
  end
  object pFIBDataSetDetails: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      
        'from ST_PRINT_LIST_ELEKTORAT(:param_type,:param_date,:param_date' +
        '_rog)'
      'where ST_PRINT_LIST_ELEKTORAT.ID_FAK=:ID_FAK '
      
        'order by ST_PRINT_LIST_ELEKTORAT.fam_rus,ST_PRINT_LIST_ELEKTORAT' +
        '.imya_rus,'
      'ST_PRINT_LIST_ELEKTORAT.otch_rus')
    DataSource = DataSourceMaster
    Left = 48
    Top = 80
    poSQLINT64ToBCD = True
  end
  object DataSourceMaster: TDataSource
    DataSet = pFIBDataSetMaster
    Left = 80
    Top = 16
  end
end
