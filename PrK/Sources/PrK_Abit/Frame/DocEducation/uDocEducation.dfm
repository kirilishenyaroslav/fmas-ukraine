object FrameDocEducation: TFrameDocEducation
  Left = 0
  Top = 0
  Width = 641
  Height = 285
  TabOrder = 0
  object cxGridPrKDocEducation: TcxGrid
    Left = 0
    Top = 0
    Width = 641
    Height = 236
    Align = alClient
    TabOrder = 0
    object cxGridPrKDocEducationDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSourceDocEducation
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cxGridPrKDocEducationDBTableView1CustomDrawCell
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object colNAME_DOK_OBR: TcxGridDBColumn
        Caption = 'colNAME_DOK_OBR'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 107
        DataBinding.FieldName = 'SHORT_NAME_TYPE_DOK'
      end
      object colSERIA: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 39
        DataBinding.FieldName = 'SERIA'
      end
      object colNOMER: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 56
        DataBinding.FieldName = 'NOMER'
      end
      object colDATE_VIDACHI: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 116
        DataBinding.FieldName = 'DATE_VIDACHI'
      end
      object colNAME_TYPE_UCHZ: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        SortOrder = soAscending
        Width = 107
        DataBinding.FieldName = 'NAME_TYPE_EDUCORG'
      end
      object colIS_MAIN_BOOK: TcxGridDBColumn
        OnCustomDrawCell = colIS_MAIN_BOOKCustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 53
        DataBinding.FieldName = 'IS_MAIN_DOK'
      end
      object colNAME_IS_COPY: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 48
        DataBinding.FieldName = 'SHORT_NAME_IS_COPY'
      end
      object colIS_ACTIVE: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'IS_ACTIVE'
      end
    end
    object cxGridPrKDocEducationLevel1: TcxGridLevel
      GridView = cxGridPrKDocEducationDBTableView1
    end
  end
  object cxGroupBoxDocEducation: TcxGroupBox
    Left = 0
    Top = 236
    Width = 641
    Height = 49
    Align = alBottom
    Alignment = alTopLeft
    TabOrder = 1
    object cxDBTextEditUCHZ: TcxDBTextEdit
      Left = 8
      Top = 25
      Width = 233
      Height = 21
      AutoSize = False
      DataBinding.DataField = 'NAME_SHORT_EDUCORG'
      DataBinding.DataSource = DataSourceDocEducation
      TabOrder = 0
    end
    object cxLabelUCHZ: TcxLabel
      Left = 9
      Top = 8
      Width = 229
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object cxLabelAdressUchz: TcxLabel
      Left = 247
      Top = 8
      Width = 205
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object cxDBTextEditAdressUchz: TcxDBTextEdit
      Left = 246
      Top = 25
      Width = 214
      Height = 21
      AutoSize = False
      DataBinding.DataField = 'NAME_PLACE'
      DataBinding.DataSource = DataSourceDocEducation
      TabOrder = 3
    end
    object cxLabelOTR_SPEC: TcxLabel
      Left = 464
      Top = 8
      Width = 162
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object cxDBTextEditOTR_SPEC: TcxDBTextEdit
      Left = 466
      Top = 25
      Width = 161
      Height = 21
      AutoSize = False
      DataBinding.DataField = 'OTR_SPEC'
      DataBinding.DataSource = DataSourceDocEducation
      TabOrder = 5
    end
  end
  object DataSourceDocEducation: TDataSource
    DataSet = RxMemoryDataDocEducation
    Left = 16
    Top = 176
  end
  object RxMemoryDataDocEducation: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ID_DT_FIZL_DOK_OBR'
        DataType = ftVariant
      end
      item
        Name = 'ID_SP_TYPE_DOK_OBR'
        DataType = ftVariant
      end
      item
        Name = 'SHORT_NAME_TYPE_DOK'
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
        Name = 'ID_TYPE_EDUCORG'
        DataType = ftVariant
      end
      item
        Name = 'NAME_TYPE_EDUCORG'
        DataType = ftVariant
      end
      item
        Name = 'ID_SP_EDUCORG'
        DataType = ftVariant
      end
      item
        Name = 'NAME_SHORT_EDUCORG'
        DataType = ftVariant
      end
      item
        Name = 'ID_PLACE_EDUCORG'
        DataType = ftVariant
      end
      item
        Name = 'NAME_PLACE'
        DataType = ftVariant
      end
      item
        Name = 'ID_SP_IS_COPY'
        DataType = ftVariant
      end
      item
        Name = 'SHORT_NAME_IS_COPY'
        DataType = ftVariant
      end
      item
        Name = 'IS_MAIN_DOK'
        DataType = ftVariant
      end
      item
        Name = 'IS_ACTIVE'
        DataType = ftVariant
      end
      item
        Name = 'IS_DOVIDKA'
        DataType = ftVariant
      end
      item
        Name = 'OTR_SPEC'
        DataType = ftVariant
      end>
    Left = 46
    Top = 176
  end
  object DataSetDocEducation: TpFIBDataSet
    Left = 80
    Top = 176
    poSQLINT64ToBCD = True
  end
end
