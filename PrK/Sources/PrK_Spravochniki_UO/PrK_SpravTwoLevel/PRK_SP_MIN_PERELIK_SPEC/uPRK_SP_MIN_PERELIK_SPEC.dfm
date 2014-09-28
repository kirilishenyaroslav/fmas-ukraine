inherited FormPRK_SP_MIN_PERELIK_SPEC: TFormPRK_SP_MIN_PERELIK_SPEC
  Left = 190
  Top = 175
  Width = 737
  Height = 502
  Caption = 'FormPRK_SP_MIN_PERELIK_SPEC'
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxStatusBar1: TdxStatusBar
    Top = 455
    Width = 729
  end
  object cxGroupBoxNapr: TcxGroupBox [1]
    Left = 0
    Top = 40
    Width = 345
    Height = 415
    Align = alLeft
    Alignment = alTopLeft
    Caption = 'cxGroupBoxNapr'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    ParentFont = False
    TabOrder = 5
    TabStop = False
    object cxDBTreeListPrKSpravTwoLevelNAPR: TcxDBTreeList
      Left = 2
      Top = 15
      Width = 341
      Height = 398
      Styles.Background = cxStyleBackGround_Content
      Styles.Content = cxStyleBackGround_Content
      Styles.Inactive = cxStyleInactive
      Styles.Selection = cxStyleSelection
      Styles.ColumnHeader = cxStyleHeader
      Align = alClient
      Bands = <
        item
          Caption.Text = 'Band1'
          Width = 300
        end>
      BufferedPaint = False
      DataController.DataSource = DataSourcePrKSprav
      DataController.ParentField = 'PARENT_FIELD'
      DataController.KeyField = 'KEY_FIELD'
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      RootValue = -1
      TabOrder = 0
      OnDblClick = cxDBTreeListPrKSpravTwoLevelNAPRDblClick
      object colNAME: TcxDBTreeListColumn
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1048#1084#1103
        DataBinding.FieldName = 'NAME'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soAscending
        Width = 112
      end
      object colSHORT_NAME: TcxDBTreeListColumn
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1050#1086#1088#1086#1090#1082#1086#1077' '#1080#1084#1103
        DataBinding.FieldName = 'SHORT_NAME'
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 115
      end
      object colSHIFR: TcxDBTreeListColumn
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taRightJustify
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = 'Shifr'
        DataBinding.FieldName = 'SHIFR'
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 52
      end
      object colKOD: TcxDBTreeListColumn
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1050#1086#1076
        DataBinding.FieldName = 'KOD'
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 60
      end
      object colNPP: TcxDBTreeListColumn
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #8470' '#1087'/'#1087
        DataBinding.FieldName = 'NPP'
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
        Width = 73
      end
    end
  end
  object cxSplitterNapr: TcxSplitter [2]
    Left = 345
    Top = 40
    Width = 8
    Height = 415
    Control = cxGroupBoxNapr
  end
  object cxGroupBoxSpec: TcxGroupBox [3]
    Left = 353
    Top = 40
    Width = 376
    Height = 415
    Align = alClient
    Alignment = alTopLeft
    Caption = 'cxGroupBoxSpec'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    TabStop = False
    object dxBarDockControl1: TdxBarDockControl
      Left = 2
      Top = 15
      Width = 372
      Height = 36
      Align = dalTop
      BarManager = dxBarManager1
    end
    object cxGridPrKSpravSpec: TcxGrid
      Left = 2
      Top = 51
      Width = 372
      Height = 362
      Align = alClient
      TabOrder = 1
      object cxGridPrKSpravSpecDBTableView1: TcxGridDBTableView
        OnDblClick = cxGridPrKSpravSpecDBTableView1DblClick
        DataController.DataSource = DataSourceSpec
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleBackGround_Content
        Styles.Content = cxStyleBackGround_Content
        Styles.Inactive = cxStyleInactive
        Styles.Selection = cxStyleSelection
        Styles.Header = cxStyleHeader
        object colNAME_SPEC: TcxGridDBColumn
          Caption = 'NAME_SPEC'
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          SortOrder = soAscending
          Width = 125
          DataBinding.FieldName = 'NAME'
        end
        object colSHORT_NAME_SPEC: TcxGridDBColumn
          Caption = 'SHORT_NAME_SPEC'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 114
          DataBinding.FieldName = 'SHORT_NAME'
        end
        object colSHORT_NAME_PRIM: TcxGridDBColumn
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 107
          DataBinding.FieldName = 'SHORT_NAME_PRIM'
        end
        object colKOD_SPEC: TcxGridDBColumn
          Caption = 'KOD_SPEC'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 28
          DataBinding.FieldName = 'KOD'
        end
        object colNPP_SPEC: TcxGridDBColumn
          Caption = 'NPP_SPEC'
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 61
          DataBinding.FieldName = 'NPP'
        end
      end
      object cxGridPrKSpravSpecLevel1: TcxGridLevel
        GridView = cxGridPrKSpravSpecDBTableView1
      end
    end
  end
  inherited ActionListKlassSprav: TActionList
    object ActionAddSpec: TAction
      Caption = 'ActionAddSpec'
      ImageIndex = 1
      ShortCut = 16429
      OnExecute = ActionAddSpecExecute
    end
    object ActionChangeSpec: TAction
      Caption = 'ActionChangeSpec'
      ImageIndex = 4
      ShortCut = 16497
      OnExecute = ActionChangeSpecExecute
    end
    object ActionDelSpec: TAction
      Caption = 'ActionDelSpec'
      ImageIndex = 3
      ShortCut = 16430
      OnExecute = ActionDelSpecExecute
    end
    object ActionViewSpec: TAction
      Caption = 'ActionViewSpec'
      ImageIndex = 10
      ShortCut = 16498
      OnExecute = ActionViewSpecExecute
    end
  end
  inherited dxBarManager1: TdxBarManager
    Bars = <
      item
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 209
        FloatTop = 209
        FloatClientWidth = 84
        FloatClientHeight = 144
        ItemLinks = <
          item
            Item = dxBarLargeButtonAdd
            Visible = True
          end
          item
            Item = dxBarLargeButtonChange
            Visible = True
          end
          item
            Item = dxBarLargeButtonDel
            Visible = True
          end
          item
            Item = dxBarLargeButtonView
            Visible = True
          end
          item
            Item = dxBarLargeButtonVibrat
            Visible = True
          end
          item
            Item = dxBarLargeButtonPrint
            Visible = True
          end
          item
            Item = dxBarLargeButtonObnov
            Visible = True
          end
          item
            Item = dxBarLargeButtonOtmena
            Visible = True
          end>
        Name = 'Custom 1'
        NotDocking = [dsNone]
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'CustomSpec'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 224
        FloatTop = 160
        FloatClientWidth = 0
        FloatClientHeight = 0
        ItemLinks = <
          item
            Item = dxBarLargeButtonAddSpec
            Visible = True
          end
          item
            Item = dxBarLargeButtonChangeSpec
            Visible = True
          end
          item
            Item = dxBarLargeButtonDelSpec
            Visible = True
          end
          item
            Item = dxBarLargeButtonViewSpec
            Visible = True
          end>
        MultiLine = True
        Name = 'Custom 2'
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        ShowMark = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 272
    Top = 112
    DockControlHeights = (
      0
      0
      40
      0)
    object dxBarLargeButtonAddSpec: TdxBarLargeButton
      Action = ActionAddSpec
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonChangeSpec: TdxBarLargeButton
      Action = ActionChangeSpec
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonDelSpec: TdxBarLargeButton
      Action = ActionDelSpec
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButtonViewSpec: TdxBarLargeButton
      Action = ActionViewSpec
      Category = 0
      AutoGrayScale = False
    end
  end
  inherited DataSetLevel: TpFIBDataSet
    Left = 184
    Top = 168
  end
  object DataSetSpec: TpFIBDataSet
    DataSource = DataSourcePrKSprav
    AfterScroll = DataSetSpecAfterScroll
    Left = 361
    Top = 168
    poSQLINT64ToBCD = True
  end
  object DataSourceSpec: TDataSource
    DataSet = DataSetSpec
    Left = 409
    Top = 168
  end
  object DataSetSpecForAdd: TpFIBDataSet
    Left = 465
    Top = 168
    poSQLINT64ToBCD = True
  end
end
