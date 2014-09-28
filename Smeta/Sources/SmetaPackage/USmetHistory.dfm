object frmGetHistory: TfrmGetHistory
  Left = 278
  Top = 178
  BorderStyle = bsDialog
  Caption = #1030#1089#1090#1086#1088#1110#1103' '#1079#1084#1110#1085' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1111' '#1087#1086' '#1073#1102#1076#1078#1077#1090#1091
  ClientHeight = 245
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 693
    Height = 200
    Align = alClient
    TabOrder = 0
    object cxGrid4: TcxGrid
      Left = 1
      Top = 1
      Width = 691
      Height = 198
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      object SmView: TcxGridDBTableView
        DataController.DataSource = HistoryDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'P_ID_SMETA'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.AlwaysShowEditor = True
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.DataRowSizing = True
        OptionsCustomize.GroupRowSizing = True
        OptionsData.Editing = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.Background = back
        Styles.ContentEven = back
        Styles.ContentOdd = cxStyle2
        Styles.IncSearch = cxStyle3
        Styles.Header = cxStyle1
        object cxGridDBColumn5: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1073#1102#1076#1078#1077#1090#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          SortOrder = soAscending
          Width = 115
          DataBinding.FieldName = 'SMETA_KOD'
        end
        object cxGridDBColumn6: TcxGridDBColumn
          Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 332
          DataBinding.FieldName = 'SMETA_TITLE'
        end
        object cxGridDBColumn7: TcxGridDBColumn
          Caption = #1040#1082#1090#1080#1074#1085#1110#1089#1090#1100
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 99
          DataBinding.FieldName = 'SMETA_ENABLED'
        end
        object SmViewDBColumn2: TcxGridDBColumn
          Caption = #1044#1110#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 142
          DataBinding.FieldName = 'TEXT_ACTION'
        end
        object SmViewDBColumn1: TcxGridDBColumn
          Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095', '#1103#1082#1080#1081' '#1086#1089#1090#1072#1085#1085#1110#1081' '#1087#1088#1072#1094#1102#1074#1072#1074' '#1079' '#1073#1102#1076#1078#1077#1090#1086#1084
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 207
          DataBinding.FieldName = 'ID_USER'
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = SmView
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 200
    Width = 693
    Height = 45
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 312
      Top = 10
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 584
    Top = 104
    object back: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object column_gray: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object periods: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clRed
    end
  end
  object SmetaHistoryDS: TpFIBDataSet
    Left = 8
    Top = 208
    poSQLINT64ToBCD = True
  end
  object HistoryDataSource: TDataSource
    DataSet = SmetaHistoryDS
    Left = 40
    Top = 208
  end
end
