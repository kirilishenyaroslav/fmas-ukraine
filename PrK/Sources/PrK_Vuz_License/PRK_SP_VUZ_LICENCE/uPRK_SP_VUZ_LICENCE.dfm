inherited FormPRK_SP_VUZ_LICENCE: TFormPRK_SP_VUZ_LICENCE
  Caption = 'FormPRK_SP_VUZ_LICENCE'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGridPrKVuzLicense: TcxGrid
    Top = 40
    Height = 267
    inherited cxGridPrKVuzLicenseDBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      object colSHIFR: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        SortOrder = soAscending
        Width = 114
        DataBinding.FieldName = 'SHIFR'
      end
      object colSPEC: TcxGridDBColumn
        Width = 141
        DataBinding.FieldName = 'NAME_SPEC'
      end
      object colSHORT_NAME_KATEGORY: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 141
        DataBinding.FieldName = 'SHORT_NAME_KATEGORY'
      end
      object colLICENCE_VALUE: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 62
        DataBinding.FieldName = 'LICENCE_VALUE'
      end
      object colLICENCE_DATE_END: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 74
        DataBinding.FieldName = 'LICENCE_DATE_END'
      end
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
  inherited ActionListVuzLicense: TActionList
    inherited ActionPrint: TAction
      OnExecute = ActionPrintExecute
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
