object FormMan: TFormMan
  Left = 23
  Top = 164
  BorderStyle = bsSingle
  Caption = 'FormMan'
  ClientHeight = 684
  ClientWidth = 1005
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
    Top = 643
    Width = 1005
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton2: TcxButton
      Left = 705
      Top = 8
      Width = 75
      Height = 25
      Action = ActionYes
      TabOrder = 0
    end
    object cxButton1: TcxButton
      Left = 788
      Top = 8
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
    end
  end
  object GridDogovora: TcxGrid
    Left = 0
    Top = 0
    Width = 1005
    Height = 643
    Align = alClient
    BorderStyle = cxcbsNone
    TabOrder = 1
    object GridDogDBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      Preview.Place = ppTop
      Preview.Visible = True
      object GridDogovoraColumnTN: TcxGridDBColumn
        SortOrder = soAscending
        Width = 141
        DataBinding.FieldName = 'TN'
      end
      object GridDogovoraColumnFIO: TcxGridDBColumn
        Width = 428
        DataBinding.FieldName = 'FIO'
      end
      object GridDogovoraColumnKolStavok: TcxGridDBColumn
        Width = 85
        DataBinding.FieldName = 'KOL_STAVOK'
      end
      object GridDogovoraColumnDateBeg: TcxGridDBColumn
        Width = 81
        DataBinding.FieldName = 'DATE_BEG'
      end
      object GridDogovoraColumnDateEnd: TcxGridDBColumn
        Width = 77
        DataBinding.FieldName = 'DATE_END'
      end
      object GridDogovoraColumnPost: TcxGridDBColumn
        Width = 286
        DataBinding.FieldName = 'NAME_POST'
      end
    end
    object cxGridLevel2: TcxGridLevel
      GridView = GridDogDBTableView1
    end
  end
  object ActionList: TActionList
    Left = 484
    Top = 384
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
