object FormPost: TFormPost
  Left = 357
  Top = 313
  BorderStyle = bsSingle
  Caption = 'FormPost'
  ClientHeight = 342
  ClientWidth = 617
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
    Top = 311
    Width = 617
    Height = 31
    Align = alBottom
    TabOrder = 0
    object ButtonYes: TcxButton
      Left = 449
      Top = 3
      Width = 75
      Height = 25
      Action = ActionYes
      TabOrder = 0
    end
    object ButtonCancel: TcxButton
      Left = 532
      Top = 3
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
    end
  end
  object Grid: TcxGrid
    Left = 0
    Top = 0
    Width = 617
    Height = 311
    Align = alClient
    BorderStyle = cxcbsNone
    TabOrder = 1
    OnDblClick = ActionYesExecute
    object GridDBTableView1: TcxGridDBTableView
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
        DataBinding.FieldName = 'TEXT1'
      end
      object GridText2: TcxGridDBColumn
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 425
        DataBinding.FieldName = 'TEXT2'
      end
    end
    object GridLevel1: TcxGridLevel
      GridView = GridDBTableView1
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
