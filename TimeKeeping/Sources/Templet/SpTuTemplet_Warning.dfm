object FormWarning: TFormWarning
  Left = 456
  Top = 246
  BorderStyle = bsDialog
  Caption = #1059#1074#1072#1075#1072
  ClientHeight = 336
  ClientWidth = 714
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
    Top = 301
    Width = 714
    Height = 35
    Align = alBottom
    TabOrder = 0
    object ButtonCancel: TcxButton
      Left = 623
      Top = 5
      Width = 75
      Height = 25
      Action = ActionCancel
      Caption = #1042#1080#1081#1090#1080
      TabOrder = 0
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 714
    Height = 301
    Align = alClient
    Alignment = alTopLeft
    Caption = #1055#1077#1088#1077#1076' '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103#1084' '#1085#1077#1086#1073#1093#1110#1076#1085#1086' '#1074#1080#1076#1072#1083#1080#1090#1080' '#1085#1072#1089#1090#1091#1087#1085#1110' '#1090#1072#1073#1077#1083#1110
    TabOrder = 1
    object cxGrid1: TcxGrid
      Left = 10
      Top = 19
      Width = 697
      Height = 272
      Align = alCustom
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
          Caption = #8470
          PropertiesClassName = 'TcxMemoProperties'
          Width = 37
          DataBinding.FieldName = 'NUM'
        end
        object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1054#1087#1080#1089
          PropertiesClassName = 'TcxMemoProperties'
          Width = 521
          DataBinding.FieldName = 'CAPTION_WARNING'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object ActionList: TActionList
    Left = 378
    Top = 71
    object ActionCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
  end
end
