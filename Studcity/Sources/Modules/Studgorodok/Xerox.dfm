object frm_Xerox: Tfrm_Xerox
  Left = 379
  Top = 268
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
  ClientHeight = 157
  ClientWidth = 311
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
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 6
    Top = 2
    Width = 297
    Height = 113
    Alignment = alTopLeft
    TabOrder = 0
    object xrx_DateBegEdit: TcxDateEdit
      Left = 8
      Top = 24
      Width = 89
      Height = 21
      BeepOnEnter = False
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 0
      OnKeyPress = xrx_DateBegEditKeyPress
    end
    object cxLabel1: TcxLabel
      Left = 8
      Top = 8
      Width = 89
      Height = 17
      AutoSize = False
      TabOrder = 2
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
    end
    object xrx_DateEndEdit: TcxDateEdit
      Left = 104
      Top = 24
      Width = 89
      Height = 21
      BeepOnEnter = False
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 1
      OnKeyPress = xrx_DateEndEditKeyPress
    end
    object cxLabel2: TcxLabel
      Left = 104
      Top = 8
      Width = 113
      Height = 17
      AutoSize = False
      TabOrder = 3
      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
    end
    object xrx_SubsSummaEdit: TcxCurrencyEdit
      Left = 200
      Top = 72
      Width = 89
      Height = 21
      BeepOnEnter = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Style.Color = clInfoBk
      TabOrder = 4
      OnKeyPress = xrx_SubsSummaEditKeyPress
    end
    object xrx_SubsMaxEdit: TcxCurrencyEdit
      Left = 104
      Top = 72
      Width = 89
      Height = 21
      BeepOnEnter = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Style.Color = clInfoBk
      TabOrder = 5
      OnKeyPress = xrx_SubsMaxEditKeyPress
    end
    object xrx_SummaEdit: TcxCurrencyEdit
      Left = 8
      Top = 72
      Width = 89
      Height = 21
      BeepOnEnter = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Style.Color = clInfoBk
      TabOrder = 6
      OnKeyPress = xrx_SummaEditKeyPress
    end
    object SummaLabel: TcxLabel
      Left = 8
      Top = 56
      Width = 89
      Height = 17
      AutoSize = False
      TabOrder = 7
      Caption = #1057#1091#1084#1084#1072' '#1086#1087#1083#1072#1090#1099
    end
    object cxLabel3: TcxLabel
      Left = 104
      Top = 56
      Width = 73
      Height = 17
      AutoSize = False
      TabOrder = 8
      Caption = #1057#1091#1073#1089'. '#1084#1072#1082#1089
    end
    object SubsSummaLabel: TcxLabel
      Left = 200
      Top = 56
      Width = 81
      Height = 17
      AutoSize = False
      Properties.ShadowedColor = clNone
      TabOrder = 9
      Caption = #1057#1091#1073#1089'. '#1089#1091#1084#1084#1072
    end
  end
  object xrx_OKButton: TcxButton
    Left = 117
    Top = 125
    Width = 91
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = xrx_OKButtonClick
  end
  object xrx_CancelButton: TcxButton
    Left = 214
    Top = 125
    Width = 89
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = xrx_CancelButtonClick
  end
  object cxGrid1: TcxGrid
    Left = 6
    Top = 128
    Width = 123
    Height = 49
    TabOrder = 3
    Visible = False
    LookAndFeel.Kind = lfUltraFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
    end
    object cxGrid1TableView1: TcxGridTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      object cxGrid1TableView1Column1: TcxGridColumn
        Caption = #1048#1089#1090'. '#1092#1080#1085#1072#1085#1089'.'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 148
      end
      object cxGrid1TableView1SubsSumma: TcxGridColumn
        Caption = #1057#1091#1073#1089'.'#1084#1072#1082#1089
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '0.00;'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 79
      end
      object cxGrid1TableView1PersentSubs: TcxGridColumn
        Caption = #1055#1088#1086#1094#1077#1085#1090' '#1089#1091#1073#1089#1080#1076#1080#1081
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = '0.0000;'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 76
      end
      object cxGrid1TableView1SUMMA: TcxGridColumn
        Caption = #1057#1091#1084#1084#1072' '#1086#1090#1095#1080#1089#1083#1077#1085#1080#1081
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '0.00;'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 77
      end
      object cxGrid1TableView1PERCENT: TcxGridColumn
        Caption = #1055#1088#1086#1094#1077#1085#1090' '#1086#1090#1095#1080#1089#1083#1077#1085#1080#1081
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = '0.0000;'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 75
      end
      object cxGrid1TableView1_id_smeta: TcxGridColumn
        PropertiesClassName = 'TcxTextEditProperties'
      end
      object cxGrid1TableView1_id_razdel: TcxGridColumn
        PropertiesClassName = 'TcxTextEditProperties'
      end
      object cxGrid1TableView1_id_stat: TcxGridColumn
        PropertiesClassName = 'TcxTextEditProperties'
      end
      object cxGrid1TableView1_id_kekv: TcxGridColumn
        PropertiesClassName = 'TcxTextEditProperties'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1TableView1
    end
  end
end
