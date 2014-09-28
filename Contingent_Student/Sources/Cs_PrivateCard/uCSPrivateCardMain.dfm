object fmStudPrivateCard: TfmStudPrivateCard
  Left = 348
  Top = 221
  Width = 561
  Height = 557
  Caption = #1054#1089#1086#1073#1080#1089#1090#1072' '#1082#1072#1088#1090#1082#1072' '#1089#1090#1091#1076#1077#1085#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 545
    Height = 465
    ActivePage = OrdersInfo
    Align = alTop
    TabOrder = 0
    object FirstPage: TTabSheet
      Caption = #1030#1085#1076#1080#1074#1110#1076#1091#1072#1083#1100#1085#1110' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080
      object DateBirthEdit: TcxDateEdit
        Left = 128
        Top = 82
        Width = 145
        Height = 21
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
        OnKeyPress = TextEditFIOKeyPress
      end
      object cxLabel1: TcxLabel
        Left = 4
        Top = 18
        Width = 93
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
        Caption = #1055#1030#1055'/'#1073
      end
      object cxLabel3: TcxLabel
        Left = 4
        Top = 82
        Width = 117
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 2
        Caption = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103' '
      end
      object cxLabel4: TcxLabel
        Left = 4
        Top = 114
        Width = 93
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 3
        Caption = #1057#1090#1072#1090#1100
      end
      object cxLabel5: TcxLabel
        Left = 4
        Top = 50
        Width = 125
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 4
        Caption = #1055#1086#1076#1072#1090#1082#1086#1074#1080#1081' '#1085#1086#1084#1077#1088
      end
      object TextEditINN: TcxTextEdit
        Left = 128
        Top = 50
        Width = 145
        Height = 21
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 5
        OnKeyPress = TextEditFIOKeyPress
      end
      object TextEditFIO: TcxTextEdit
        Left = 128
        Top = 18
        Width = 337
        Height = 21
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 6
        OnKeyPress = TextEditFIOKeyPress
      end
      object CheckBoxRezident: TcxCheckBox
        Left = 4
        Top = 144
        Width = 265
        Height = 21
        ParentFont = False
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = True
        Properties.Caption = #1056#1077#1079#1080#1076#1077#1085#1090
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 7
      end
      object TextEditSex: TcxTextEdit
        Left = 128
        Top = 114
        Width = 145
        Height = 21
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 8
        OnKeyPress = TextEditFIOKeyPress
      end
    end
    object PasportInfo: TTabSheet
      Caption = #1055#1072#1089#1087#1086#1088#1090#1085#1110' '#1076#1072#1085#1110
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 537
        Height = 25
        Align = alTop
        TabOrder = 0
        object ActualPaspCB: TcxCheckBox
          Left = 0
          Top = 0
          Width = 209
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1055#1086#1082#1072#1079#1091#1074#1072#1090#1080' '#1090#1110#1083#1100#1082#1080' '#1076#1110#1081#1089#1085#1080#1081' '#1087#1072#1089#1087#1086#1088#1090
          State = cbsChecked
          TabOrder = 0
          OnClick = ActualPaspCBClick
        end
      end
      object PasportGrid: TcxGrid
        Left = 0
        Top = 25
        Width = 537
        Height = 383
        Align = alClient
        TabOrder = 1
        object PasportGridDBTableView1: TcxGridDBTableView
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.KeyFieldNames = 'DATE_BEG;DATE_END'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsSelection.CellSelect = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = GridTableViewStyleSheetDevExpress
          object cmnFIO: TcxGridDBColumn
            Caption = #1055#1030#1041
            Width = 104
            DataBinding.FieldName = 'FIO'
          end
          object cmnSERIA: TcxGridDBColumn
            Caption = #1057#1077#1088#1110#1103
            Width = 77
            DataBinding.FieldName = 'SERIA'
          end
          object cmnNUMBER: TcxGridDBColumn
            Caption = #1053#1086#1084#1077#1088
            Width = 67
            DataBinding.FieldName = 'NUMBER'
          end
          object cmnDATE_BEG: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1074#1110#1076#1072#1095#1110
            Width = 97
            DataBinding.FieldName = 'DATE_BEG'
          end
          object cmnDATE_END: TcxGridDBColumn
            Caption = #1044#1110#1081#1089#1085#1080#1081' '#1076#1086
            Width = 78
            DataBinding.FieldName = 'DATE_END'
          end
        end
        object PasportGridLevel1: TcxGridLevel
          GridView = PasportGridDBTableView1
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 408
        Width = 537
        Height = 29
        Align = alBottom
        TabOrder = 2
        object Label12: TLabel
          Left = 0
          Top = 7
          Width = 55
          Height = 13
          Caption = #1042#1080#1076#1072#1085#1080#1081':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object VidanDBText: TcxTextEdit
          Left = 56
          Top = 3
          Width = 418
          Height = 21
          Properties.ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object OrdersInfo: TTabSheet
      Caption = #1053#1072#1082#1072#1079#1080
      ImageIndex = 2
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 537
        Height = 437
        Align = alClient
        TabOrder = 0
        object OrdersTableView1: TcxGridDBTableView
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.KeyFieldNames = 'NUM_ORDER'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsSelection.CellSelect = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = GridTableViewStyleSheetDevExpress
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1072#1079#1091
            Width = 104
            DataBinding.FieldName = 'NUM_ORDER'
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1085#1072#1082#1072#1079#1091
            Width = 77
            DataBinding.FieldName = 'DATE_ORDER'
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = #1058#1080#1087' '#1085#1072#1082#1072#1079#1091
            Width = 67
            DataBinding.FieldName = 'TYPE_NAME'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = OrdersTableView1
        end
      end
    end
  end
  object cxButton1: TcxButton
    Left = 440
    Top = 480
    Width = 75
    Height = 25
    Action = ActionClose
    TabOrder = 1
  end
  object Actions: TActionList
    Left = 96
    Top = 192
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
    end
    object ActionClose: TAction
      Caption = #1042#1080#1081#1090#1080
      ShortCut = 27
      OnExecute = ActionCloseExecute
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 472
    Top = 40
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 8535838
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
  end
end
