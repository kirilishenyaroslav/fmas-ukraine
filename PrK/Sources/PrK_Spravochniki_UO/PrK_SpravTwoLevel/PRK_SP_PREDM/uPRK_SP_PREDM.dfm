inherited FormPRK_SP_PREDM: TFormPRK_SP_PREDM
  Left = 277
  Top = 268
  Caption = 'FormPRK_SP_PREDM'
  PixelsPerInch = 96
  TextHeight = 13
  object cxDBTreeListPrKSpravTwoLevelPREDM: TcxDBTreeList [1]
    Left = 0
    Top = 40
    Width = 550
    Height = 266
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
    OnDblClick = cxDBTreeListPrKSpravTwoLevelPREDMDblClick
    object colNAME: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.Text = #1048#1084#1103
      DataBinding.FieldName = 'NAME'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
      Width = 217
    end
    object colSHORT_NAME: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.Text = #1050#1086#1088#1086#1090#1082#1086#1077' '#1080#1084#1103
      DataBinding.FieldName = 'SHORT_NAME'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 213
    end
    object colNPP: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.Text = #8470' '#1087'/'#1087
      DataBinding.FieldName = 'NPP'
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 73
    end
    object colKOD: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.Text = #1050#1086#1076
      DataBinding.FieldName = 'KOD'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 118
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
