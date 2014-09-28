object frmPayFulfil: TfrmPayFulfil
  Left = 464
  Top = 395
  Width = 790
  Height = 517
  Caption = #1057#1087#1083#1072#1090#1072' '#1110' '#1074#1080#1082#1086#1085#1072#1085#1085#1103
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
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 25
    Align = alTop
    Caption = #1057#1087#1083#1072#1090#1072' '#1079#1072' '#1076#1086#1075#1086#1074#1086#1088#1086#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 229
    Width = 774
    Height = 25
    Align = alBottom
    Caption = #1042#1080#1082#1086#1085#1072#1085#1085#1103' '#1079#1072' '#1076#1086#1075#1086#1074#1086#1088#1086#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Panel4: TPanel
    Left = 0
    Top = 25
    Width = 774
    Height = 204
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object cxGrid3: TcxGrid
      Left = 473
      Top = 0
      Width = 301
      Height = 204
      Align = alRight
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object cxGridDBTableView2: TcxGridDBTableView
        DataController.DataSource = DataSourcePay
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
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
      end
      object cxGridTableView2: TcxGridTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object cxGridColumn6: TcxGridColumn
          Caption = #1050#1086#1096#1090#1086#1088#1080#1089
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object cxGridColumn7: TcxGridColumn
          Caption = #1056#1086#1079#1076#1110#1083
          HeaderAlignmentHorz = taCenter
          Width = 45
        end
        object cxGridColumn8: TcxGridColumn
          Caption = #1057#1090#1072#1090#1090#1103
          HeaderAlignmentHorz = taCenter
          Width = 50
        end
        object cxGridColumn9: TcxGridColumn
          Caption = #1057#1091#1084#1072
          HeaderAlignmentHorz = taCenter
          Width = 81
        end
        object cxGridColumn10: TcxGridColumn
          Caption = '%'
          HeaderAlignmentHorz = taCenter
          Width = 32
        end
      end
      object cxGridDBTableView4: TcxGridDBTableView
        OnDblClick = cxGridDBTableView4DblClick
        OnKeyDown = cxGridDBTableView4KeyDown
        DataController.DataSource = DataSourcePaySmet
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'SUMMA'
            Column = cxGridDBColumn5
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'SUMMA'
            Column = cxGridDBColumn5
          end
          item
            Kind = skCount
            Column = cxGridDBColumn1
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = #1050#1086#1096#1090#1086#1088#1080#1089
          HeaderAlignmentHorz = taCenter
          Width = 43
          DataBinding.FieldName = 'SMETA'
        end
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = #1056#1086#1079#1076#1110#1083
          HeaderAlignmentHorz = taCenter
          Width = 51
          DataBinding.FieldName = 'RAZD'
        end
        object cxGridDBColumn3: TcxGridDBColumn
          Caption = #1057#1090#1072#1090#1090#1103
          HeaderAlignmentHorz = taCenter
          Width = 48
          DataBinding.FieldName = 'STat'
        end
        object cxGridDBColumn4: TcxGridDBColumn
          Caption = #1050#1045#1050#1042
          HeaderAlignmentHorz = taCenter
          Width = 44
          DataBinding.FieldName = 'KEKV'
        end
        object cxGridDBColumn5: TcxGridDBColumn
          Caption = #1057#1091#1084#1072
          HeaderAlignmentHorz = taCenter
          Width = 78
          DataBinding.FieldName = 'SUMMA'
        end
        object cxGridDBTableView4DBColumn1: TcxGridDBColumn
          Caption = '%'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00 %;-,0.00 %'
          HeaderAlignmentHorz = taCenter
          Width = 35
          DataBinding.FieldName = 'PERCENT'
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = cxGridDBTableView4
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 473
      Height = 204
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 473
        Height = 181
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object cxGrid1DBTableView1: TcxGridDBTableView
          OnDblClick = cxGrid1DBTableView1DblClick
          OnKeyDown = cxGrid1DBTableView1KeyDown
          DataController.DataSource = DataSourcePay
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = cxGrid1DBTableView1NUM_DOC
            end
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'SUM_PAY'
              Column = cxGrid1DBTableView1SUMMA_DOG
            end>
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
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = GridTableViewStyleSheetDevExpress
          object cxGrid1DBTableView1IS_PLAT: TcxGridDBColumn
            Caption = #1055#1083'.'
            PropertiesClassName = 'TcxImageProperties'
            OnCustomDrawCell = cxGrid1DBTableView1IS_PLATCustomDrawCell
            HeaderAlignmentHorz = taCenter
            Width = 20
            DataBinding.FieldName = 'IS_PLAT'
          end
          object cxGrid1DBTableView1NUM_DOC: TcxGridDBColumn
            Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            HeaderAlignmentHorz = taCenter
            Width = 68
            DataBinding.FieldName = 'NUM_DOC'
          end
          object cxGrid1DBTableView1DATE_DOC: TcxGridDBColumn
            Caption = #1044#1072#1090#1072
            HeaderAlignmentHorz = taCenter
            SortOrder = soAscending
            Width = 71
            DataBinding.FieldName = 'DATE_DOC'
          end
          object cxGrid1DBTableView1DATE_REG: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1074#1080#1087#1080#1089#1082#1080
            SortOrder = soAscending
            DataBinding.FieldName = 'DATE_REG'
          end
          object cxGrid1DBTableView1DATE_month: TcxGridDBColumn
            Caption = #1052#1110#1089#1103#1094#1100
            HeaderAlignmentHorz = taCenter
            Width = 71
            DataBinding.FieldName = 'DATE_doc_month'
          end
          object cxGrid1DBTableView1DATE_YEAR: TcxGridDBColumn
            Caption = #1056#1110#1082
            HeaderAlignmentHorz = taCenter
            Width = 59
            DataBinding.FieldName = 'DATE_DOC_YEAR'
          end
          object cxGrid1DBTableView1SUMM_DOC: TcxGridDBColumn
            Caption = #1057#1091#1084#1072
            HeaderAlignmentHorz = taCenter
            Width = 85
            DataBinding.FieldName = 'SUM_DOC'
          end
          object cxGrid1DBTableView1SUMMA_DOG: TcxGridDBColumn
            Caption = #1057#1091#1084#1072' '#1079#1072' '#1076#1086#1075#1086#1074#1086#1088#1086#1084
            HeaderAlignmentHorz = taCenter
            Width = 105
            DataBinding.FieldName = 'SUM_PAY'
          end
          object cxGrid1DBTableView1IS_PAY: TcxGridDBColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            DataBinding.FieldName = 'IS_PAY'
            IsCaptionAssigned = True
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 181
        Width = 473
        Height = 23
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          473
          23)
        object cxDBTextEdit1: TcxDBTextEdit
          Left = 88
          Top = 1
          Width = 385
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'NAME_TYPE_DOC'
          DataBinding.DataSource = DataSourcePay
          Style.Color = clSilver
          TabOrder = 0
        end
        object cxLabel1: TcxLabel
          Left = 1
          Top = 2
          Width = 84
          Height = 17
          TabOrder = 1
          Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 254
    Width = 774
    Height = 225
    Align = alBottom
    TabOrder = 3
    object cxGrid4: TcxGrid
      Left = 473
      Top = 1
      Width = 300
      Height = 223
      Align = alRight
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object cxGridDBTableView3: TcxGridDBTableView
        DataController.DataSource = DataSourcePay
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
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
      end
      object cxGridTableView1: TcxGridTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object cxGridColumn1: TcxGridColumn
          Caption = #1050#1086#1096#1090#1086#1088#1080#1089
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object cxGridColumn2: TcxGridColumn
          Caption = #1056#1086#1079#1076#1110#1083
          HeaderAlignmentHorz = taCenter
          Width = 45
        end
        object cxGridColumn3: TcxGridColumn
          Caption = #1057#1090#1072#1090#1090#1103
          HeaderAlignmentHorz = taCenter
          Width = 50
        end
        object cxGridColumn4: TcxGridColumn
          Caption = #1057#1091#1084#1072
          HeaderAlignmentHorz = taCenter
          Width = 81
        end
        object cxGridColumn5: TcxGridColumn
          Caption = '%'
          HeaderAlignmentHorz = taCenter
          Width = 32
        end
      end
      object cxGrid4DBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid4DBTableView1DblClick
        OnKeyDown = cxGrid4DBTableView1KeyDown
        DataController.DataSource = DataSourceFulfilSmet
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'SUMMA'
            Column = cxGrid4DBTableView1SUM
          end
          item
            Kind = skCount
            Column = cxGrid4DBTableView1SMETA
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object cxGrid4DBTableView1SMETA: TcxGridDBColumn
          Caption = #1050#1086#1096#1090#1086#1088#1080#1089
          HeaderAlignmentHorz = taCenter
          Width = 44
          DataBinding.FieldName = 'SMETA'
        end
        object cxGrid4DBTableView1RAZD: TcxGridDBColumn
          Caption = #1056#1086#1079#1076#1110#1083
          HeaderAlignmentHorz = taCenter
          Width = 50
          DataBinding.FieldName = 'RAZD'
        end
        object cxGrid4DBTableView1ST: TcxGridDBColumn
          Caption = #1057#1090#1072#1090#1090#1103
          HeaderAlignmentHorz = taCenter
          Width = 49
          DataBinding.FieldName = 'STAT'
        end
        object cxGrid4DBTableView1KEKV: TcxGridDBColumn
          Caption = #1050#1045#1050#1042
          HeaderAlignmentHorz = taCenter
          Width = 40
          DataBinding.FieldName = 'KEKV'
        end
        object cxGrid4DBTableView1SUM: TcxGridDBColumn
          Caption = #1057#1091#1084#1072
          HeaderAlignmentHorz = taCenter
          Width = 82
          DataBinding.FieldName = 'SUMMA'
        end
        object cxGrid4DBTableView1DBColumn1: TcxGridDBColumn
          Caption = '%'
          HeaderAlignmentHorz = taCenter
          Width = 33
          DataBinding.FieldName = 'PERCENT'
        end
      end
      object cxGrid4Level1: TcxGridLevel
        GridView = cxGrid4DBTableView1
      end
    end
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 472
      Height = 223
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 472
        Height = 200
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object cxGridDBTableView1: TcxGridDBTableView
          OnDblClick = cxGridDBTableView1DblClick
          OnKeyDown = cxGridDBTableView1KeyDown
          DataController.DataSource = DataSourceFulfil
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = cxGridDBTableView1NUM_DOC
            end
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'SUM_FULFIL'
              Column = cxGridDBTableView1SUMMA_DOG
            end>
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
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = GridTableViewStyleSheetDevExpress
          object cxGridDBTableView1DBColumn2: TcxGridDBColumn
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Visible = False
            Width = 20
          end
          object cxGridDBTableView1NUM_DOC: TcxGridDBColumn
            Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
            HeaderAlignmentHorz = taCenter
            Width = 89
            DataBinding.FieldName = 'NUM_DOC'
          end
          object cxGridDBTableView1DATE_DOC: TcxGridDBColumn
            Caption = #1044#1072#1090#1072
            HeaderAlignmentHorz = taCenter
            SortOrder = soAscending
            Width = 75
            DataBinding.FieldName = 'DATE_DOC'
          end
          object cxGridDBTableView1DATE_MONTH: TcxGridDBColumn
            Caption = #1052#1110#1089#1103#1094#1100
            HeaderAlignmentHorz = taCenter
            Width = 68
            DataBinding.FieldName = 'DATE_DOC_MONTH'
          end
          object cxGridDBTableView1DATE_YEAR: TcxGridDBColumn
            Caption = #1056#1110#1082
            HeaderAlignmentHorz = taCenter
            Width = 65
            DataBinding.FieldName = 'DATE_DOC_YEAR'
          end
          object cxGridDBTableView1SUMM_DOC: TcxGridDBColumn
            Caption = #1057#1091#1084#1072
            HeaderAlignmentHorz = taCenter
            Width = 78
            DataBinding.FieldName = 'SUM_DOC'
          end
          object cxGridDBTableView1SUMMA_DOG: TcxGridDBColumn
            Caption = #1057#1091#1084#1072' '#1079#1072' '#1076#1086#1075#1086#1074#1086#1088#1086#1084
            HeaderAlignmentHorz = taCenter
            Width = 103
            DataBinding.FieldName = 'SUM_FULFIL'
          end
          object cxGridDBTableView1DATE_REG: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1074#1080#1087#1080#1089#1082#1080
            Visible = False
            SortOrder = soAscending
            DataBinding.FieldName = 'DATE_REG'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 200
        Width = 472
        Height = 23
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          472
          23)
        object cxDBTextEdit2: TcxDBTextEdit
          Left = 88
          Top = 1
          Width = 385
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'NAME_TYPE_DOC'
          DataBinding.DataSource = DataSourceFulfil
          Style.Color = clSilver
          TabOrder = 0
        end
        object cxLabel2: TcxLabel
          Left = 1
          Top = 2
          Width = 84
          Height = 17
          TabOrder = 1
          Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 104
    Top = 129
    object ActionQuit: TAction
      Caption = #1042#1099#1093#1086#1076
      ShortCut = 27
      SecondaryShortCuts.Strings = (
        'F10')
      OnExecute = ActionQuitExecute
    end
  end
  object DataSetPay: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      
        'select * from PROC_DOG_DT_DOC_PAY_FULFIL_SEL(:ID_SESSION, 1, :ID' +
        '_DOG)')
    Left = 8
    Top = 49
    poSQLINT64ToBCD = True
  end
  object DataSetFulfil: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      'select * from PROC_DOG_DT_DOC_PAY_FULFIL_SEL(:ID_SESSION, 0, 0)')
    Left = 8
    Top = 321
    poSQLINT64ToBCD = True
  end
  object DataSourcePay: TDataSource
    DataSet = DataSetPay
    Left = 40
    Top = 49
  end
  object DataSourceFulfil: TDataSource
    DataSet = DataSetFulfil
    Left = 40
    Top = 329
  end
  object pFIBDatabase1: TpFIBDatabase
    DBName = 'D:\DB\DONNU_3\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=SYSDBA'
      'sql_role_name=')
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 8
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 40
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 72
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14084566
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clYellow
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object TreeListStyleSheetDevExpress: TcxTreeListStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle5
      Styles.Inactive = cxStyle9
      Styles.Selection = cxStyle13
      Styles.BandBackground = cxStyle2
      Styles.BandHeader = cxStyle3
      Styles.ColumnHeader = cxStyle4
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Footer = cxStyle8
      Styles.IncSearch = cxStyle10
      Styles.Indicator = cxStyle11
      Styles.Preview = cxStyle12
      BuiltIn = True
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle5
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Inactive = cxStyle9
      Styles.IncSearch = cxStyle10
      Styles.Selection = cxStyle13
      Styles.FilterBox = cxStyle4
      Styles.Footer = cxStyle8
      Styles.Group = cxStyle14
      Styles.GroupByBox = cxStyle4
      Styles.Header = cxStyle4
      Styles.Indicator = cxStyle11
      Styles.Preview = cxStyle12
      BuiltIn = True
    end
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Database = pFIBDatabase1
    Transaction = pFIBTransaction2
    Left = 8
    Top = 136
  end
  object pFIBTransaction2: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 8
    Top = 104
  end
  object DataSetPaySmet: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      
        'select * from PROC_DOG_DT_DOC_PAY_FULFIL_SEL3(:ID_SESSION, 1, :I' +
        'D_DOG)')
    Left = 488
    Top = 49
    poSQLINT64ToBCD = True
  end
  object DataSourcePaySmet: TDataSource
    DataSet = DataSetPaySmet
    Left = 520
    Top = 49
  end
  object DataSetFulfilSmet: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      'select * from PROC_DOG_DT_DOC_PAY_FULFIL_SEL3(:ID_SESSION, 0, 0)')
    Left = 488
    Top = 289
    poSQLINT64ToBCD = True
  end
  object DataSourceFulfilSmet: TDataSource
    DataSet = DataSetFulfilSmet
    Left = 520
    Top = 289
  end
  object pFIBQuery1: TpFIBQuery
    Database = pFIBDatabase1
    Transaction = pFIBTransaction2
    Left = 40
    Top = 137
  end
  object ImageList1: TImageList
    Left = 160
    Top = 73
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000000000000000000092635D00A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000092635D00FCF3
      DE00FFEED500FFEED500FFEED500FFEED500FEEBD100FEEBD100FEEBD100FEEB
      D100F7EDD000A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000092635D00F7EA
      D800FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD
      8200F2E2C700A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000092635D00F8EF
      DE00FAE9D500FAE7D400FAE7D300F8E6D100F8E6D000F8E6D000F8E6D000F8E6
      D000F0E2C900A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000092635D00EAE2
      D400FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD
      8200E1D3BA00A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000098746800AA9F
      9500A69A9200A5999100A5998E00A4978B00A3968900A1958700A1938400A191
      8300A4938100986B650000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C3816008C3816008C3816008C38
      16008C3816008C3816008C3816008C3816008C3816008C3816008C3816008C38
      16008C3816008C3816008C3816008C3816000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C38160000000000A7756800E0E9
      EA00E1754500E1754500E1754500E1754500E1754500E1754500E1754500E175
      4500D7D8CA00A4676900000000008B3512000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C3815008C3816008C3816008C38
      16008C3816008C3816008C3816008C3816008C3816008C3816008C3816008C38
      16008C3816008C3816008C3816008C3816000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B17E6B00D7B0
      9C00D1AF9E00D1AF9E00CEAA9700CCA99500CCA79300CBA59100CAA59000CAA3
      8B00D4A78C00A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BB846E00FFFF
      FF00FFE3C100FFE2C000FFE2BF00FFE2BF00FFE2BF00FFE2BF00FFE2BF00FFE2
      BF00FFFCEF00A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C58C7000FFFF
      FF00FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD
      8200FBF6E900A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CB917300FFFF
      FF00FEFFFF00FEFFFF00FEFEFE00FEFBFA00FBFAF700FBF8F600FAF7F300F8F4
      F000FCFAF000A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987600FFFF
      FF00FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD8200FEBD
      8200FFFCF400A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFE
      FA00FFFFFF00A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987600CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00C003000000000000C003000000000000
      C003000000000000C003000000000000C003000000000000C003000000000000
      000000000000000040020000000000000000000000000000C003000000000000
      C003000000000000C003000000000000C003000000000000C003000000000000
      C003000000000000C00300000000000000000000000000000000000000000000
      000000000000}
  end
  object SmetDSPay: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    DataSource = DataSourcePaySmet
    Left = 552
    Top = 81
    poSQLINT64ToBCD = True
  end
  object SmetDSFulfil: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    DataSource = DataSourceFulfilSmet
    Left = 552
    Top = 321
    poSQLINT64ToBCD = True
  end
end
