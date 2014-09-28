object fmErrorSch: TfmErrorSch
  Left = 317
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072' '#1086#1096#1080#1073#1086#1082' '#1087#1086' '#1089#1095#1077#1090#1072#1084
  ClientHeight = 370
  ClientWidth = 590
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object grErrorSch: TcxGrid
    Left = 0
    Top = 0
    Width = 590
    Height = 341
    Align = alTop
    TabOrder = 0
    object tvwErrorSch: TcxGridDBTableView
      DataController.DataSource = dsrErrorSch
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = cmnSchNumber
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = cmnSchNumber
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.CellEndEllipsis = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderEndEllipsis = True
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 10
      object cmnSchNumber: TcxGridDBColumn
        Caption = #8470
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 40
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        SortOrder = soAscending
        Width = 60
        DataBinding.FieldName = 'SCH_NUMBER'
      end
      object cmnSchTitle: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1095#1105#1090#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 120
        Options.Editing = False
        Options.Focusing = False
        Options.Grouping = False
        Width = 200
        DataBinding.FieldName = 'SCH_TITLE'
      end
      object cmnSchError: TcxGridDBColumn
        Caption = #1054#1096#1080#1073#1082#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Editing = False
        Options.Focusing = False
        Options.Grouping = False
        Width = 305
        DataBinding.FieldName = 'SCH_ERROR'
      end
    end
    object lvlErrorSch: TcxGridLevel
      GridView = tvwErrorSch
    end
  end
  object btnExit: TcxButton
    Left = 515
    Top = 344
    Width = 75
    Height = 25
    Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1086#1085#1086' - <Esc>'
    Caption = #1042#1099#1093#1086#1076
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Colors.Default = 16247513
    Colors.Normal = clBtnFace
    Colors.Hot = 16247513
    Colors.Pressed = 11184895
  end
  object dsrErrorSch: TDataSource
    DataSet = dstBuffer
    Left = 16
    Top = 44
  end
  object dstBuffer: TRxMemoryData
    FieldDefs = <>
    Left = 16
    Top = 92
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 288
    Top = 184
    DockControlHeights = (
      0
      0
      0
      0)
  end
end
