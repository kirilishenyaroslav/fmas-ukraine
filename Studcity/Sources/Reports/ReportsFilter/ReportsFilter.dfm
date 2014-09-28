object frmFilter: TfrmFilter
  Left = 568
  Top = 208
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmFilter'
  ClientHeight = 417
  ClientWidth = 610
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 398
    Width = 610
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 610
    Height = 41
    Align = alTop
    TabOrder = 1
    object cxButtonOK: TcxButton
      Left = 0
      Top = 8
      Width = 131
      Height = 25
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080' (F10)'
      TabOrder = 0
      OnClick = cxButtonOKClick
    end
    object Clean_button: TcxButton
      Left = 136
      Top = 8
      Width = 131
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      TabOrder = 1
      OnClick = Clean_buttonClick
    end
  end
  object Grid: TcxGrid
    Left = 0
    Top = 41
    Width = 610
    Height = 357
    Align = alClient
    TabOrder = 2
    LookAndFeel.Kind = lfUltraFlat
    object GridDBView: TcxGridDBTableView
      OnDblClick = GridDBViewDblClick
      DataController.DataSource = DataSourcePrintSetup
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
      Styles.Inactive = cxStyle4
      Styles.Selection = cxStyle2
      object SelectField: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        DataBinding.FieldName = 'RxSelectField'
        IsCaptionAssigned = True
      end
      object NameField: TcxGridDBColumn
        Width = 302
        DataBinding.FieldName = 'RxNameField'
        IsCaptionAssigned = True
      end
      object CNT_Filter: TcxGridDBColumn
        DataBinding.FieldName = 'RxCNT_Filter'
        IsCaptionAssigned = True
      end
    end
    object GridLevel: TcxGridLevel
      GridView = GridDBView
    end
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 40
    Top = 160
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 40
    Top = 128
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 144
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 72
    Top = 96
  end
  object pFIBDataSetCreateFilter: TpFIBDataSet
    SelectSQL.Strings = (
      'select count(p.value_param) as cnt,'
      '       p.type_value'
      'from st_tmp_value_parametrs p'
      'where p.id_transaction=:param_session'
      'group by p.type_value'
      'order by p.type_value')
    Left = 72
    Top = 144
    poSQLINT64ToBCD = True
  end
  object ActionList1: TActionList
    Left = 200
    Top = 112
    object ActionF10: TAction
      Caption = 'ActionF10'
      ShortCut = 121
      OnExecute = ActionF10Execute
    end
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
        Name = 'RxCNT_Filter'
        DataType = ftSmallint
      end
      item
        Name = 'RxId_Filter'
        DataType = ftInteger
      end>
    Left = 184
    Top = 313
  end
  object DataSourcePrintSetup: TDataSource
    DataSet = RxMemoryDataPrintSetup
    Left = 152
    Top = 313
  end
  object pFIBDataSetSetup: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from ST_INI_REPORT_FILTER'
      'where VIEW_FILTER=1'
      'Order by ID_FILTER desc')
    Left = 120
    Top = 312
    poSQLINT64ToBCD = True
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 148
    Top = 288
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 12937777
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
  end
end
