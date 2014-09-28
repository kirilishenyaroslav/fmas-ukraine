object FrameOcenki: TFrameOcenki
  Left = 0
  Top = 0
  Width = 320
  Height = 293
  TabOrder = 0
  object cxGroupBoxOcenki: TcxGroupBox
    Left = 0
    Top = 0
    Width = 320
    Height = 293
    Align = alClient
    Alignment = alTopLeft
    Caption = 'cxGroupBoxOcenki'
    TabOrder = 0
    object cxGridPrKOcenki: TcxGrid
      Left = 2
      Top = 15
      Width = 316
      Height = 166
      Align = alClient
      TabOrder = 0
      object cxGridPrKOcenkiDBTableView1: TcxGridDBTableView
        DataController.DataModeController.SmartRefresh = True
        DataController.DataSource = DataSourceOcenki
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnCustomDrawCell = cxGridPrKOcenkiDBTableView1CustomDrawCell
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object colNAME: TcxGridDBColumn
          PropertiesClassName = 'TcxLabelProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 169
          DataBinding.FieldName = 'SHORT_NAME'
        end
        object colOCENKA: TcxGridDBColumn
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '([1-9] | 1[0-1] | 12)'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 75
          DataBinding.FieldName = 'OCENKA'
        end
        object colIS_OLD_AT: TcxGridDBColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ReadOnly = False
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          SortOrder = soAscending
          Width = 64
          DataBinding.FieldName = 'IS_OLD_AT'
        end
      end
      object cxGridPrKOcenkiLevel1: TcxGridLevel
        GridView = cxGridPrKOcenkiDBTableView1
      end
    end
    object cxGroupBoxSredniyBal: TcxGroupBox
      Left = 2
      Top = 181
      Width = 316
      Height = 110
      Align = alBottom
      Alignment = alTopLeft
      Caption = 'cxGroupBoxSredniyBal'
      TabOrder = 1
      object cxPopupEditSeredniyBal: TcxPopupEdit
        Left = 17
        Top = 56
        Width = 140
        Height = 21
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ImmediateDropDown = False
        Properties.MaxLength = 0
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = 
          '([0-9] | [0-9][,.] | [0-9][,.][0-9] | 1[0-1] | 1[0-1][,.] | 1[0-' +
          '1][,.][0-9] | 12)'
        Properties.PopupControl = cxGroupBoxCalcSrBal
        Properties.PopupSizeable = False
        Style.Color = 16776176
        TabOrder = 2
        OnKeyPress = cxPopupEditSeredniyBalKeyPress
      end
      object cxLabelCalcSerednBal: TcxLabel
        Left = 8
        Top = 39
        Width = 195
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
      end
      object cxGroupBoxCalcSrBal: TcxGroupBox
        Left = 200
        Top = 32
        Width = 153
        Height = 89
        Alignment = alTopLeft
        Caption = 'cxGroupBoxCalcSrBal'
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = True
        TabOrder = 0
        Visible = False
        object StringGridSredniyBal: TStringGrid
          Left = 4
          Top = 5
          Width = 217
          Height = 185
          BorderStyle = bsNone
          Color = 16776176
          ColCount = 6
          DefaultColWidth = 30
          DefaultRowHeight = 30
          FixedCols = 0
          RowCount = 6
          FixedRows = 0
          Options = [goFixedHorzLine, goVertLine, goHorzLine, goEditing, goTabs, goAlwaysShowEditor]
          PopupMenu = PopupMenuSerBal
          TabOrder = 0
          OnKeyPress = StringGridSredniyBalKeyPress
          ColWidths = (
            30
            28
            30
            30
            30
            30)
        end
        object cxCheckBoxBalOn5System: TcxCheckBox
          Left = 10
          Top = 192
          Width = 31
          Height = 21
          Cursor = crHandPoint
          ParentColor = False
          Properties.Alignment = taCenter
          Properties.DisplayUnchecked = 'False'
          Style.Color = 16776176
          TabOrder = 1
          OnEditing = cxCheckBoxBalOn5SystemEditing
        end
        object cxLabelBalOn5System: TcxLabel
          Left = 39
          Top = 193
          Width = 146
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 2
        end
      end
    end
  end
  object RxMemoryDataOcenki: TRxMemoryData
    FieldDefs = <>
    AfterPost = RxMemoryDataOcenkiAfterPost
    Left = 48
    Top = 136
  end
  object DataSourceOcenki: TDataSource
    DataSet = RxMemoryDataOcenki
    Left = 16
    Top = 136
  end
  object PopupMenuSerBal: TPopupMenu
    Left = 256
    Top = 208
    object PopMenuCountSerBal: TMenuItem
      Caption = 'PopMenuCountSerBal'
      OnClick = PopMenuCountSerBalClick
    end
    object PopMenuClear: TMenuItem
      Caption = 'PopMenuClear'
      OnClick = PopMenuClearClick
    end
  end
  object DataSetOcenki: TpFIBDataSet
    Left = 80
    Top = 136
    poSQLINT64ToBCD = True
  end
  object RxMemoryDataCanUpdateOcenki: TRxMemoryData
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
      end
      item
        Name = 'ID_SP_GOD_NABORA'
        DataType = ftVariant
      end>
    Left = 120
    Top = 136
  end
end
