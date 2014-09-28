object FramePerevagi: TFramePerevagi
  Left = 0
  Top = 0
  Width = 608
  Height = 313
  TabOrder = 0
  object cxGroupBoxPerevagi: TcxGroupBox
    Left = 0
    Top = 0
    Width = 608
    Height = 313
    Align = alClient
    Alignment = alTopLeft
    TabOrder = 0
    object cxGridPrKSelectionPreim: TcxGrid
      Left = 353
      Top = 15
      Width = 253
      Height = 296
      Align = alRight
      TabOrder = 0
      object cxGridPrKSelectionPreimDBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSourceSelectionPreim
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object colNamePreimSelect: TcxGridDBColumn
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 161
          DataBinding.FieldName = 'SHORT_NAME_PREIM'
        end
      end
      object cxGridPrKSelectionPreimLevel1: TcxGridLevel
        GridView = cxGridPrKSelectionPreimDBTableView1
      end
    end
    object cxGridPrKSpravOneLevel: TcxGrid
      Left = 2
      Top = 15
      Width = 343
      Height = 296
      Align = alClient
      TabOrder = 1
      object cxGridPrKSpravOneLevelDBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSourceKatPreim
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'ID_SP_PREIM_KATEGORY'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object colNamePreimKat: TcxGridDBColumn
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 215
          DataBinding.FieldName = 'SHORT_NAME'
        end
      end
      object cxGridPrKSpravOneLevelDBTableView2: TcxGridDBTableView
        DataController.DataModeController.SmartRefresh = True
        DataController.DataSource = DataSourcePreim
        DataController.DetailKeyFieldNames = 'ID_SP_PREIM_KATEGORY'
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'ID_SP_PREIM'
        DataController.MasterKeyFieldNames = 'ID_SP_PREIM_KATEGORY'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.HideSelection = True
        OptionsView.GroupByBox = False
        object colNamePreim: TcxGridDBColumn
          PropertiesClassName = 'TcxLabelProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 222
          DataBinding.FieldName = 'SHORT_NAME_PREIM'
        end
        object colIS_SELECTED: TcxGridDBColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.DisplayUnchecked = 'False'
          Properties.ReadOnly = False
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 96
          DataBinding.FieldName = 'IS_SELECTED'
        end
      end
      object cxGridPrKSpravOneLevelLevel1: TcxGridLevel
        GridView = cxGridPrKSpravOneLevelDBTableView1
        object cxGridPrKSpravOneLevelLevel2: TcxGridLevel
          GridView = cxGridPrKSpravOneLevelDBTableView2
        end
      end
    end
    object cxSplitterSelectionPreim: TcxSplitter
      Left = 345
      Top = 15
      Width = 8
      Height = 296
      Cursor = crHSplit
      AlignSplitter = salRight
      Control = cxGridPrKSelectionPreim
    end
  end
  object DataSetKatPreim: TpFIBDataSet
    Left = 24
    Top = 208
    poSQLINT64ToBCD = True
  end
  object DataSourceKatPreim: TDataSource
    DataSet = DataSetKatPreim
    Left = 64
    Top = 208
  end
  object DataSourcePreim: TDataSource
    DataSet = RxMemoryDataPreim
    Left = 192
    Top = 168
  end
  object RxMemoryDataPreim: TRxMemoryData
    FieldDefs = <>
    AfterPost = RxMemoryDataPreimAfterPost
    Left = 160
    Top = 168
  end
  object DataSetPreim: TpFIBDataSet
    Left = 128
    Top = 168
    poSQLINT64ToBCD = True
  end
  object DataSourceSelectionPreim: TDataSource
    DataSet = RxMemoryDataSelectionPreim
    Left = 488
    Top = 152
  end
  object RxMemoryDataSelectionPreim: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ID_SP_PREIM'
        DataType = ftVariant
      end
      item
        Name = 'SHORT_NAME_PREIM'
        DataType = ftVariant
      end>
    Left = 448
    Top = 152
  end
  object RxMemoryDataCanUpdatePerevagi: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ID_CN_SP_FAK'
        DataType = ftVariant
      end
      item
        Name = 'ID_CN_JN_FACUL_SPEC'
        DataType = ftVariant
      end
      item
        Name = 'ID_CN_SP_FORM_STUD'
        DataType = ftVariant
      end
      item
        Name = 'ID_CN_SP_KAT_STUD'
        DataType = ftVariant
      end
      item
        Name = 'ID_MAN'
        DataType = ftVariant
      end>
    Left = 224
    Top = 168
  end
end
