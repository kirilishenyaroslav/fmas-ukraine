inherited FormPRK_SP_PREIM: TFormPRK_SP_PREIM
  Caption = 'FormPRK_SP_PREIM'
  PixelsPerInch = 96
  TextHeight = 13
  object cxDBTreeListPrKSpravTwoLevelPREIM: TcxDBTreeList [1]
    Left = 0
    Top = 40
    Width = 606
    Height = 262
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
    TabOrder = 5
    OnDblClick = cxDBTreeListPrKSpravTwoLevelPREIMDblClick
    object colNAME: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.Text = #1048#1084#1103
      DataBinding.FieldName = 'NAME'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
      Width = 201
    end
    object colSHORT_NAME: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.Text = #1050#1086#1088#1086#1090#1082#1086#1077' '#1080#1084#1103
      DataBinding.FieldName = 'SHORT_NAME'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 199
    end
    object colIS_FIZL_LGOTA: TcxDBTreeListColumn
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.DisplayUnchecked = 'False'
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      Caption.AlignHorz = taCenter
      Caption.Text = #1051#1100#1075#1086#1090#1072
      DataBinding.FieldName = 'IS_FIZL_LGOTA'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 93
    end
    object colNPP: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.Text = #8470' '#1087'/'#1087
      DataBinding.FieldName = 'NPP'
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 73
    end
    object colKOD: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.Text = #1050#1086#1076
      DataBinding.FieldName = 'KOD'
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 111
    end
  end
  inherited ActionListKlassSprav: TActionList
    inherited ActionOld: TAction
      OnExecute = ActionOldExecute
    end
  end
  inherited dxBarManager1: TdxBarManager
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
