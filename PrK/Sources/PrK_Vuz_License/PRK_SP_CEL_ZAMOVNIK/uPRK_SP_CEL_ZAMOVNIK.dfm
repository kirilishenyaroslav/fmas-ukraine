inherited FormPRK_SP_CEL_ZAMOVNIK: TFormPRK_SP_CEL_ZAMOVNIK
  Caption = 'FormPRK_SP_CEL_ZAMOVNIK'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGridPrKVuzLicense: TcxGrid
    Left = 440
    Top = 40
    Width = 94
    Height = 86
    Align = alNone
    Visible = False
    inherited cxGridPrKVuzLicenseDBTableView1: TcxGridDBTableView
      DataController.DataSource = nil
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
    end
  end
  inherited dxStatusBarVL: TdxStatusBar
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
  object cxDBTreeListPrK_SP_CEL_ZAMOVNIK: TcxDBTreeList [2]
    Left = 0
    Top = 40
    Width = 587
    Height = 267
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
    DataController.DataSource = DataSourcePrKVuzLicense
    DataController.ParentField = 'ID_PARENT'
    DataController.KeyField = 'ID_SP_CEL_ZAMOVNIK'
    OptionsSelection.CellSelect = False
    OptionsView.ColumnAutoWidth = True
    RootValue = -1
    TabOrder = 6
    object colNAME: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.Text = #1048#1084#1103
      DataBinding.FieldName = 'NAME'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
      Width = 585
    end
    object colSHORT_NAME: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.Text = #1050#1086#1088#1086#1090#1082#1086#1077' '#1080#1084#1103
      DataBinding.FieldName = 'SHORT_NAME'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 264
    end
  end
  inherited dxBarManagerVuzLicense: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
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
  object RxMemoryDataCelZamovCopy: TRxMemoryData
    FieldDefs = <>
    Left = 144
    Top = 168
  end
end
