object frmManCalcStajInfo: TfrmManCalcStajInfo
  Left = 310
  Top = 116
  Width = 870
  Height = 640
  Caption = #1055#1077#1088#1077#1075#1083#1103#1076' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091' '#1087#1086' '#1089#1090#1072#1078#1091
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
  object ManCalcStajGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 854
    Height = 528
    Align = alClient
    TabOrder = 0
    object ManCalcStajGridDBView: TcxGridDBTableView
      DataController.DataSource = ManCalcStajDS
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.Editing = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = cxGridTableViewStyleSheet1
      object ManCalcStajGridDBViewDBColumn1: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1089#1090#1072#1078#1072
        Visible = False
        GroupIndex = 0
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortOrder = soAscending
        DataBinding.FieldName = 'Name_Staj'
      end
      object ManCalcStajGridDBViewDBColumn2: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 70
        DataBinding.FieldName = 'Date_Calc'
      end
      object ManCalcStajGridDBViewDBColumn3: TcxGridDBColumn
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1076#1085#1110#1074
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 64
        DataBinding.FieldName = 'Calc_Days'
      end
      object ManCalcStajGridDBViewDBColumn4: TcxGridDBColumn
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1084#1110#1089#1103#1094#1110#1074
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 65
        DataBinding.FieldName = 'Calc_Month'
      end
      object ManCalcStajGridDBViewDBColumn5: TcxGridDBColumn
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1088#1086#1082#1110#1074
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 71
        DataBinding.FieldName = 'Calc_Years'
      end
      object ManCalcStajGridDBViewDBColumn6: TcxGridDBColumn
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 284
        DataBinding.FieldName = 'Note'
      end
      object ManCalcStajGridDBViewDBColumn7: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 281
        DataBinding.FieldName = 'Person_Document'
      end
    end
    object ManCalcStajGridLevel: TcxGridLevel
      GridView = ManCalcStajGridDBView
    end
  end
  object pnlInfo: TPanel
    Left = 0
    Top = 528
    Width = 854
    Height = 74
    Align = alBottom
    TabOrder = 1
    object lblInfoCaption: TcxLabel
      Left = 14
      Top = 1
      Width = 162
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1073#1091#1083#1072' '#1079#1084#1110#1085#1077#1085#1072':'
    end
    object lblNumDocument: TcxLabel
      Left = 14
      Top = 47
      Width = 48
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = #1053#1086#1084#1077#1088
    end
    object lblDocument: TcxLabel
      Left = 14
      Top = 23
      Width = 68
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090
    end
    object DocumentEdit: TcxDBTextEdit
      Left = 82
      Top = 22
      Width = 263
      Height = 21
      DataBinding.DataField = 'Document_Modify'
      DataBinding.DataSource = ManCalcStajDS
      Style.Color = 14745599
      TabOrder = 3
    end
    object NumDocument: TcxDBTextEdit
      Left = 83
      Top = 46
      Width = 93
      Height = 21
      DataBinding.DataField = 'Num_Document'
      DataBinding.DataSource = ManCalcStajDS
      Style.Color = 14745599
      TabOrder = 4
    end
    object DateEdit: TcxDBDateEdit
      Left = 245
      Top = 46
      Width = 100
      Height = 21
      DataBinding.DataField = 'Date_Document'
      DataBinding.DataSource = ManCalcStajDS
      Style.Color = 14745599
      TabOrder = 5
    end
    object lblDate: TcxLabel
      Left = 200
      Top = 47
      Width = 39
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
      Caption = #1044#1072#1090#1072
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 504
    Top = 120
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 14745599
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13106942
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11793652
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13302779
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
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      Caption = 'KlugStyle'
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
  object ManCalcStajDS: TDataSource
    Left = 544
    Top = 120
  end
end
