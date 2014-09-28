object FrameInLang: TFrameInLang
  Left = 0
  Top = 0
  Width = 443
  Height = 270
  Align = alClient
  TabOrder = 0
  object cxGridPrKInLang: TcxGrid
    Left = 0
    Top = 0
    Width = 443
    Height = 270
    Align = alClient
    TabOrder = 0
    object cxGridPrKInLangDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSourceInLang
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object colNAME_IN_LANG: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 193
        DataBinding.FieldName = 'SHORT_NAME_IN_LANG'
      end
      object colNAME_LEVEL_VLADEN: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 184
        DataBinding.FieldName = 'SHORT_NAME_LEVEL_VLADEN'
      end
    end
    object cxGridPrKInLangLevel1: TcxGridLevel
      GridView = cxGridPrKInLangDBTableView1
    end
  end
  object DataSourceInLang: TDataSource
    DataSet = RxMemoryDataInLang
    Left = 16
    Top = 176
  end
  object RxMemoryDataInLang: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ID_DT_IN_LANG'
        DataType = ftVariant
      end
      item
        Name = 'ID_SP_IN_LANG'
        DataType = ftVariant
      end
      item
        Name = 'SHORT_NAME_IN_LANG'
        DataType = ftVariant
      end
      item
        Name = 'ID_SP_LEVEL_VLADEN'
        DataType = ftVariant
      end
      item
        Name = 'SHORT_NAME_LEVEL_VLADEN'
        DataType = ftVariant
      end>
    Left = 46
    Top = 176
  end
  object DataSetInLang: TpFIBDataSet
    Left = 80
    Top = 176
    poSQLINT64ToBCD = True
  end
end
