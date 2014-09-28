object FrameDopDoc: TFrameDopDoc
  Left = 0
  Top = 0
  Width = 548
  Height = 263
  TabOrder = 0
  object cxGridPrKDopDoc: TcxGrid
    Left = 0
    Top = 0
    Width = 548
    Height = 263
    Align = alClient
    TabOrder = 0
    object cxGridPrKDopDocDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSourceDopDoc
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
      object colNAME_TYPE_DOP_DOK: TcxGridDBColumn
        Caption = 'colNAME_DOK_OBR'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 84
        DataBinding.FieldName = 'SHORT_NAME_TYPE_DOP_DOK'
      end
      object colSERIA: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 40
        DataBinding.FieldName = 'SERIA'
      end
      object colNOMER: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 46
        DataBinding.FieldName = 'NOMER'
      end
      object colDATE_VIDACHI: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 85
        DataBinding.FieldName = 'DATE_VIDACHI'
      end
      object colNAME: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 102
        DataBinding.FieldName = 'NAME'
      end
      object colNAME_OCENKA: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        SortOrder = soDescending
        Width = 105
        DataBinding.FieldName = 'OCENKA_NUM'
      end
      object colNAME_COPY: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 84
        DataBinding.FieldName = 'SHORT_NAME_COPY'
      end
    end
    object cxGridPrKDopDocLevel1: TcxGridLevel
      GridView = cxGridPrKDopDocDBTableView1
    end
  end
  object DataSourceDopDoc: TDataSource
    DataSet = RxMemoryDataDopDoc
    Left = 16
    Top = 176
  end
  object RxMemoryDataDopDoc: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ID_DT_ABIT_DOP_DOK'
        DataType = ftVariant
      end
      item
        Name = 'ID_SP_TYPE_DOP_DOK'
        DataType = ftVariant
      end
      item
        Name = 'SHORT_NAME_TYPE_DOP_DOK'
        DataType = ftVariant
      end
      item
        Name = 'SERIA'
        DataType = ftVariant
      end
      item
        Name = 'NOMER'
        DataType = ftVariant
      end
      item
        Name = 'DATE_VIDACHI'
        DataType = ftVariant
      end
      item
        Name = 'ID_SP_IS_COPY'
        DataType = ftVariant
      end
      item
        Name = 'SHORT_NAME_COPY'
        DataType = ftVariant
      end
      item
        Name = 'ID_SP_OCENKA'
        DataType = ftVariant
      end
      item
        Name = 'OCENKA_NUM'
        DataType = ftVariant
      end
      item
        Name = 'IS_SPIVBESIDA'
        DataType = ftVariant
      end
      item
        Name = 'IS_ZALIK'
        DataType = ftVariant
      end
      item
        Name = 'IS_OCENKA'
        DataType = ftVariant
      end
      item
        Name = 'NAME'
        DataType = ftVariant
      end
      item
        Name = 'ID_DT_ISPIT_VEDOM'
        DataType = ftVariant
      end>
    Left = 46
    Top = 176
  end
  object DataSetDopDoc: TpFIBDataSet
    Left = 80
    Top = 176
    poSQLINT64ToBCD = True
  end
end
