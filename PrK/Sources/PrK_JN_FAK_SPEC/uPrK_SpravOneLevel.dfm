inherited FormPrK_SpravOneLevel: TFormPrK_SpravOneLevel
  Left = 298
  Top = 191
  Caption = 'FormPrK_SpravOneLevel'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxStatusBar1: TdxStatusBar
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Width = 50
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Width = 50
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Width = 50
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Width = 50
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Width = 50
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Width = 50
      end>
  end
  object cxGridPrKSpravOneLevel: TcxGrid [1]
    Left = 0
    Top = 40
    Width = 588
    Height = 266
    Align = alClient
    TabOrder = 5
    object cxGridPrKSpravOneLevelDBTableView1: TcxGridDBTableView
      OnDblClick = cxGridPrKSpravOneLevelDBTableView1DblClick
      DataController.DataSource = DataSourcePrKSprav
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
      object colNAME: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 215
        DataBinding.FieldName = 'NAME'
      end
      object colSHORT_NAME: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 210
        DataBinding.FieldName = 'SHORT_NAME'
      end
      object colKOD: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 62
        DataBinding.FieldName = 'KOD'
      end
      object colNPP: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 61
        DataBinding.FieldName = 'NPP'
      end
    end
    object cxGridPrKSpravOneLevelLevel1: TcxGridLevel
      GridView = cxGridPrKSpravOneLevelDBTableView1
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
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      0
      40
      0)
  end
end
