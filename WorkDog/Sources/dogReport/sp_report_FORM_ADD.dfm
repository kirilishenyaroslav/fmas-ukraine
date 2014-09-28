object Fsp_report_form_add: TFsp_report_form_add
  Left = 199
  Top = 105
  Width = 495
  Height = 122
  Caption = #1044#1086#1076#1072#1090#1080' '#1079#1074#1110#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    487
    95)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 71
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1079#1074#1110#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 346
    Top = 16
    Width = 24
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'DLL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object NameEdit: TcxTextEdit
    Left = 8
    Top = 32
    Width = 330
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BeepOnEnter = False
    Properties.MaxLength = 200
    TabOrder = 0
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 96
    Width = 470
    Height = 0
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Visible = False
    LookAndFeel.Kind = lfFlat
    object cxGrid1TableView1: TcxGridTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Options = [dcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxGrid1TableView1FocusedRecordChanged
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHiding = True
      OptionsData.Appending = True
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
        Options.ShowEditButtons = isebNever
        Width = 147
      end
      object cxGrid1TableView1Column4: TcxGridColumn
        Caption = #1055#1086#1083#1077
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 144
      end
      object cxGrid1TableView1Column2: TcxGridColumn
        Caption = #1058#1080#1087
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          'integer'
          'char'
          'numeric'
          'date'
          'time'
          'timestamp')
        Properties.MaxLength = 0
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.ShowEditButtons = isebNever
        Width = 82
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
  object cxButton1: TcxButton
    Left = 8
    Top = 64
    Width = 161
    Height = 25
    Caption = #1054#1076#1077#1088#1078#1072#1090#1080' '#1087#1086#1083#1103' '#1079' '#1090#1072#1073#1083#1080#1094#1110
    TabOrder = 2
    Visible = False
    OnClick = cxButton1Click
    LookAndFeel.Kind = lfUltraFlat
  end
  object DLLEdit: TcxButtonEdit
    Left = 345
    Top = 32
    Width = 133
    Height = 21
    Anchors = [akTop, akRight]
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.MaxLength = 30
    Properties.OnButtonClick = DLLEditPropertiesButtonClick
    TabOrder = 3
  end
  object OKButton: TcxButton
    Left = 292
    Top = 63
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 4
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 388
    Top = 63
    Width = 91
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 5
    OnClick = CancelButtonClick
  end
  object cxButton2: TcxButton
    Left = 176
    Top = 64
    Width = 161
    Height = 25
    Caption = #1054#1076#1077#1088#1078#1072#1090#1080' '#1087#1086#1083#1103' '#1079' '#1087#1088#1086#1094#1077#1076#1091#1088#1080
    TabOrder = 6
    Visible = False
    OnClick = cxButton2Click
  end
  object cxCheckBox1: TcxCheckBox
    Left = 348
    Top = 66
    Width = 98
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1053#1072#1079#1074#1072' '#1079' '#1086#1087#1080#1089#1091
    State = cbsChecked
    TabOrder = 7
    Visible = False
  end
  object pFIBDataSet1: TpFIBDataSet
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 112
    Top = 8
    poSQLINT64ToBCD = True
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.dll'
    Filter = #1060#1072#1081#1083#1099' DLL(*.dll)|*.dll|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Left = 392
  end
end
