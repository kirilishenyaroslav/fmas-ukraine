object FormSpCategor: TFormSpCategor
  Left = 547
  Top = 331
  BorderStyle = bsSingle
  Caption = 'FormSpCategor'
  ClientHeight = 336
  ClientWidth = 416
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
  object GridCat: TcxGrid
    Left = 0
    Top = 0
    Width = 416
    Height = 305
    Align = alClient
    BorderStyle = cxcbsNone
    TabOrder = 0
    object GridCatDBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      object GridText1: TcxGridDBColumn
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentVert = vaBottom
        SortOrder = soAscending
        Width = 197
        DataBinding.FieldName = 'NAME_CATEGORY'
      end
    end
    object GridCatLevel1: TcxGridLevel
      GridView = GridCatDBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 305
    Width = 416
    Height = 31
    Align = alBottom
    TabOrder = 1
    object ButtonYes: TcxButton
      Left = 257
      Top = 3
      Width = 75
      Height = 25
      Action = ActionYes
      TabOrder = 0
    end
    object ButtonCancel: TcxButton
      Left = 340
      Top = 3
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
    end
  end
  object ActionList: TActionList
    Left = 44
    Top = 248
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
