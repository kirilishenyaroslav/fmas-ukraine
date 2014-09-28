object frmPlatInfo: TfrmPlatInfo
  Left = 518
  Top = 122
  Width = 599
  Height = 450
  Caption = #1057#1091#1084#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 41
    Width = 583
    Height = 371
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSourceInfo
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'SUM_PLAT'
          Column = cxGrid1DBTableView1SUM_PLAT
        end
        item
          Format = '0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'SUM_ZAYAV'
          Column = cxGrid1DBTableView1SUM_ZAYAV
        end
        item
          Format = '0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'SUM_ZAYAV_NEOPL'
          Column = cxGrid1DBTableView1SUM_ZAYAV_NEOPL
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'SUM_PLAT'
          Column = cxGrid1DBTableView1SUM_PLAT
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'SUM_ZAYAV'
          Column = cxGrid1DBTableView1SUM_ZAYAV
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'SUM_ZAYAV_NEOPL'
          Column = cxGrid1DBTableView1SUM_ZAYAV_NEOPL
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = cxGrid1DBTableView1DBColumn1
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      Styles.StyleSheet = dogForm.GridTableViewStyleSheetDevExpress
      object cxGrid1DBTableView1RATE_ACCOUNT: TcxGridDBColumn
        Caption = #1056#1072#1093#1091#1085#1086#1082
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 163
        DataBinding.FieldName = 'RATE_ACCOUNT'
      end
      object cxGrid1DBTableView1MFO: TcxGridDBColumn
        Caption = #1052#1060#1054
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 76
        DataBinding.FieldName = 'MFO'
      end
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1056#1072#1093#1091#1085#1086#1082'('#1052#1060#1054')'
        HeaderAlignmentHorz = taCenter
        Width = 157
        DataBinding.FieldName = 'ACC_MFO'
      end
      object cxGrid1DBTableView1SUM_PLAT: TcxGridDBColumn
        Caption = #1057#1091#1084#1072' '#1087#1083#1072#1090#1077#1078#1110#1074
        HeaderAlignmentHorz = taCenter
        Width = 142
        DataBinding.FieldName = 'SUM_PLAT'
      end
      object cxGrid1DBTableView1SUM_ZAYAV_NEOPL: TcxGridDBColumn
        Caption = #1047#1072#1103#1074#1083#1077#1085#1072' '#1089#1091#1084#1072
        HeaderAlignmentHorz = taCenter
        Width = 140
        DataBinding.FieldName = 'SUM_ZAYAV_NEOPL'
      end
      object cxGrid1DBTableView1SUM_ZAYAV: TcxGridDBColumn
        Caption = #1053#1077#1089#1087#1083#1072#1095#1077#1085#1072' '#1089#1091#1084#1072
        HeaderAlignmentHorz = taCenter
        SortOrder = soAscending
        Width = 142
        DataBinding.FieldName = 'SUM_ZAYAV'
      end
    end
    object cxGrid1DBTableView2: TcxGridDBTableView
      DataController.DetailKeyFieldNames = 'ID_KEY'
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.MasterKeyFieldNames = 'ID_KEY'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      object cxGrid1DBTableView2ID_DOG_DT_PL_SMET: TcxGridDBColumn
        DataBinding.FieldName = 'ID_DOG_DT_PL_SMET'
      end
      object cxGrid1DBTableView2ID_KEY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_KEY'
      end
      object cxGrid1DBTableView2ID_SMETA: TcxGridDBColumn
        DataBinding.FieldName = 'ID_SMETA'
      end
      object cxGrid1DBTableView2ID_RAZD: TcxGridDBColumn
        DataBinding.FieldName = 'ID_RAZD'
      end
      object cxGrid1DBTableView2ID_STAT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_STAT'
      end
      object cxGrid1DBTableView2SUMMA: TcxGridDBColumn
        DataBinding.FieldName = 'SUMMA'
      end
    end
    object cxGrid1DBTableView3: TcxGridDBTableView
      DataController.DetailKeyFieldNames = 'ID_KEY'
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 583
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object DateBegEdit: TcxDateEdit
      Left = 16
      Top = 8
      Width = 121
      Height = 21
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clMoneyGreen
      TabOrder = 0
      OnKeyDown = DateBegEditKeyDown
    end
    object DateEndEdit: TcxDateEdit
      Left = 168
      Top = 8
      Width = 121
      Height = 21
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clMoneyGreen
      TabOrder = 1
      OnKeyDown = DateEndEditKeyDown
    end
    object cxLabel1: TcxLabel
      Left = 0
      Top = 8
      Width = 15
      Height = 17
      TabOrder = 2
      Caption = #1047
    end
    object cxLabel2: TcxLabel
      Left = 144
      Top = 8
      Width = 22
      Height = 17
      TabOrder = 3
      Caption = #1055#1086
    end
    object RefreshButton: TcxButton
      Left = 296
      Top = 8
      Width = 89
      Height = 25
      Caption = #1054#1085#1086#1074#1080#1090#1080
      TabOrder = 4
      OnClick = RefreshButtonClick
    end
    object cxButton1: TcxButton
      Left = 392
      Top = 8
      Width = 97
      Height = 25
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 5
      OnClick = cxButton1Click
    end
  end
  object DataSetInfo: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select * from PROC_DOG_DT_DOCUMENT_ZAYAV_INFO(:ID_GROUP, :ID_USE' +
        'R, :FLT_ID_TIP_DOG, :WHERE_COND_FOR_MAN, :WHERE_COND, :ID_OTDEL,' +
        ' :USE_SHORT, :date_beg, :date_end)')
    Left = 8
    Top = 64
    poSQLINT64ToBCD = True
  end
  object DataSourceInfo: TDataSource
    DataSet = DataSetInfo
    Left = 40
    Top = 64
  end
end
