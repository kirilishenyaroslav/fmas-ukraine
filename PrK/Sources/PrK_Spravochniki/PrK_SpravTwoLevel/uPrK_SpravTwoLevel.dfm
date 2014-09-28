inherited FormPrK_SpravTwoLevel: TFormPrK_SpravTwoLevel
  Width = 614
  Height = 356
  Caption = 'FormPrK_SpravTwoLevel'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxStatusBar1: TdxStatusBar
    Top = 302
    Width = 606
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
  inherited ActionListKlassSprav: TActionList
    object ActionOld: TAction
      Caption = 'ActionOld'
      Enabled = False
      ImageIndex = 11
      Visible = False
    end
  end
  inherited DataSetPrKSprav: TpFIBDataSet
    AfterScroll = DataSetPrKSpravAfterScroll
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
          end
          item
            Item = dxBarLargeButtonOld
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
    inherited dxBarLargeButtonOld: TdxBarLargeButton
      Action = ActionOld
      AutoGrayScale = False
    end
  end
  object DataSetLevel: TpFIBDataSet
    Database = DataBasePrKSprav
    Transaction = TransactionReadPrKSprav
    Left = 344
    Top = 160
    poSQLINT64ToBCD = True
  end
end
