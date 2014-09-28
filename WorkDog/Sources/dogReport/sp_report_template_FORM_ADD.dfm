object Fsp_report_template_form_add: TFsp_report_template_form_add
  Left = 199
  Top = 105
  Width = 499
  Height = 123
  Caption = #1044#1086#1076#1072#1090#1080' '#1096#1072#1073#1083#1086#1085
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  DesignSize = (
    491
    96)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 64
    Width = 284
    Height = 13
    Caption = #1059#1082#1072#1078#1110#1090#1100' '#1087#1086#1083#1103' '#1103#1082#1110' '#1087#1086#1074#1080#1085#1085#1110' '#1074#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080#1089#1103' '#1074' '#1079#1074#1110#1090#1110
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 8
    Top = 16
    Width = 92
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1096#1072#1073#1083#1086#1085#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 80
    Width = 473
    Height = 0
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object cxGrid1TableView1: TcxGridTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Options = [dcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHiding = True
      OptionsData.Appending = True
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.HideSelection = True
      OptionsSelection.InvertSelect = False
      OptionsView.ShowEditButtons = gsebForFocusedRecord
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.NewItemRowInfoText = #1053#1072#1090#1080#1089#1085#1110#1090#1100' '#1089#1102#1076#1080' '#1097#1086#1073' '#1076#1086#1076#1072#1090#1080' '#1085#1086#1074#1080#1081' '#1079#1072#1087#1080#1089
      object cxGrid1TableView1Column1: TcxGridColumn
        Caption = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.MaxLength = 0
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Options.ShowEditButtons = isebNever
        Width = 147
      end
      object cxGrid1TableView1Column4: TcxGridColumn
        Caption = #1055#1086#1083#1077
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Width = 144
      end
      object cxGrid1TableView1Column3: TcxGridColumn
        Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueGrayed = '111'
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.ShowEditButtons = isebNever
        Width = 90
      end
    end
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1TableView1
    end
  end
  object NameEdit: TcxTextEdit
    Left = 8
    Top = 32
    Width = 473
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BeepOnEnter = False
    Properties.MaxLength = 200
    TabOrder = 1
  end
  object OKButton: TcxButton
    Left = 296
    Top = 65
    Width = 91
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 392
    Top = 65
    Width = 91
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 3
    OnClick = CancelButtonClick
  end
end
