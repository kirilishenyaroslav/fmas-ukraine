object FormDep_Main: TFormDep_Main
  Left = 438
  Top = 278
  BorderStyle = bsSingle
  Caption = 'FormDep_Main'
  ClientHeight = 372
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 341
    Width = 433
    Height = 31
    Align = alBottom
    TabOrder = 0
    object ButtonYes: TcxButton
      Left = 273
      Top = 3
      Width = 75
      Height = 25
      Action = ActionYes
      TabOrder = 0
    end
    object ButtonCancel: TcxButton
      Left = 356
      Top = 3
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
    end
  end
  object TreeListDep: TcxDBTreeList
    Left = 0
    Top = 0
    Width = 433
    Height = 341
    Styles.Background = StyleDM.cxStyle19
    Styles.Content = StyleDM.cxStyle2
    Styles.Inactive = StyleDM.cxStyle10
    Styles.Selection = StyleDM.cxStyle14
    Styles.BandBackground = StyleDM.cxStyle1
    Styles.BandContent = StyleDM.cxStyle2
    Styles.BandHeader = StyleDM.cxStyle9
    Styles.ColumnFooter = StyleDM.cxStyle10
    Styles.ColumnHeader = StyleDM.cxStyle9
    Styles.ContentEven = StyleDM.cxStyle3
    Styles.ContentOdd = StyleDM.cxStyle4
    Styles.Footer = StyleDM.cxStyle10
    Styles.HotTrack = StyleDM.cxStyle18
    Styles.IncSearch = StyleDM.cxStyle13
    Styles.Indicator = StyleDM.cxStyle14
    Styles.Preview = StyleDM.cxStyle13
    Align = alClient
    Bands = <
      item
        Caption.Text = 'Band1'
        Width = 475
      end>
    BufferedPaint = False
    DataController.ParentField = 'ID_PARENT'
    DataController.KeyField = 'ID_DEPARTMENT'
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsView.ColumnAutoWidth = True
    RootValue = -1
    TabOrder = 1
    object TreeListColumnName: TcxDBTreeListColumn
      DataBinding.FieldName = 'NAME_FULL'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
      Width = 431
    end
  end
  object ActionList: TActionList
    Left = 164
    Top = 296
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      OnExecute = ActionYesExecute
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
  end
end
