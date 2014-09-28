object frmMovingBonuses: TfrmMovingBonuses
  Left = 317
  Top = 315
  BorderStyle = bsDialog
  Caption = #1053#1072#1076#1073#1072#1074#1082#1080
  ClientHeight = 444
  ClientWidth = 696
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 33
    Align = alTop
    TabOrder = 0
    object cxCheckBox2: TcxCheckBox
      Left = 240
      Top = 5
      Width = 183
      Height = 21
      AutoSize = False
      Constraints.MinWidth = 170
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox2PropertiesChange
      Properties.Caption = #1044#1078#1077#1088#1077#1083#1072' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 8
      Top = 4
      Width = 75
      Height = 25
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      TabOrder = 1
      Visible = False
      OnClick = cxButton2Click
    end
  end
  object ItemsGrid: TcxGrid
    Left = 0
    Top = 33
    Width = 696
    Height = 243
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object ReportDataView: TcxGridDBTableView
      OnKeyDown = ReportDataViewKeyDown
      DataController.DataSource = BonusSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.CellHints = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = qizzStyle
      Styles.ContentEven = stContent
      Styles.ContentOdd = stContent
      object ReportDataViewDBColumn1: TcxGridDBColumn
        Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1085#1072#1076#1073#1072#1074#1082#1080'/'#1076#1086#1087#1083#1072#1090#1080
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 288
        DataBinding.FieldName = 'RAISE_NAME'
      end
      object DateBegCol: TcxGridDBColumn
        Caption = #1087#1077#1088#1110#1086#1076' '#1079
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 137
        DataBinding.FieldName = 'B_DATE_BEG'
      end
      object DateEndCol: TcxGridDBColumn
        Caption = #1087#1077#1088#1110#1086#1076' '#1087#1086
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortOrder = soDescending
        Width = 123
        DataBinding.FieldName = 'B_DATE_END'
      end
      object ReportDataViewDBColumn2: TcxGridDBColumn
        Caption = #1057#1091#1084#1086#1074#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 127
        DataBinding.FieldName = 'SUMMA'
      end
      object ReportDataViewDBColumn7: TcxGridDBColumn
        Caption = #1055#1088#1086#1094#1077#1085#1090#1085#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 124
        DataBinding.FieldName = 'PERCENT_STR'
      end
      object ReportDataViewDBColumn3: TcxGridDBColumn
        Caption = #1055#1077#1088#1110#1086#1076' '#1085#1072#1076#1073#1072#1074#1082#1080
        Visible = False
        GroupIndex = 0
        Options.Filtering = False
        SortOrder = soAscending
        DataBinding.FieldName = 'GROUP_ID_BONUS_MOVING'
      end
    end
    object cxGridLevel5: TcxGridLevel
      GridView = ReportDataView
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 276
    Width = 696
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer8Style'
    AlignSplitter = salBottom
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 381
    Width = 696
    Height = 63
    Align = alBottom
    TabOrder = 3
    object Label3: TLabel
      Left = 228
      Top = 11
      Width = 42
      Height = 13
      Caption = #1053#1072#1082#1072#1079':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 231
      Top = 36
      Width = 35
      Height = 13
      Caption = #1044#1072#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 11
      Top = 14
      Width = 93
      Height = 13
      Caption = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 11
      Top = 30
      Width = 174
      Height = 21
      DataBinding.DataField = 'TYPE_POST_NAME'
      DataBinding.DataSource = BonusSource
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 275
      Top = 8
      Width = 154
      Height = 21
      DataBinding.DataField = 'NUM_ORDER'
      DataBinding.DataSource = BonusSource
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 275
      Top = 32
      Width = 154
      Height = 21
      DataBinding.DataField = 'DATE_ORDER'
      DataBinding.DataSource = BonusSource
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object cxButton1: TcxButton
      Left = 464
      Top = 16
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 3
      OnClick = cxButton1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 284
    Width = 696
    Height = 97
    Align = alBottom
    TabOrder = 4
    Visible = False
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 694
      Height = 95
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object SmView: TcxGridDBTableView
        OnKeyDown = SmViewKeyDown
        DataController.DataSource = SmetsDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = qizzStyle
        Styles.ContentEven = stContent
        Styles.ContentOdd = stContent
        object SmViewDBColumn2: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1073#1102#1076#1078#1077#1090#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 146
          DataBinding.FieldName = 'SM_KOD'
        end
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = #1041#1102#1076#1078#1077#1090
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 414
          DataBinding.FieldName = 'SM_TITLE'
        end
        object SmViewDBColumn1: TcxGridDBColumn
          Caption = #1089#1091#1084#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 86
          DataBinding.FieldName = 'SUMMA'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = SmView
      end
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 8
    Top = 208
    object stBackground: TcxStyle
      AssignedValues = [svColor]
      Color = 14745599
    end
    object stContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stContentEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stContentOdd: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stFilterBox: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object stFooter: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object stGroup: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object stGroupByBox: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object stHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stInactive: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object stIncSearch: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object stIndicator: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object stPreview: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object stSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stHotTrack: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clMaroon
    end
    object qizzStyle: TcxGridTableViewStyleSheet
      Styles.Background = stBackground
      Styles.Content = stContent
      Styles.ContentEven = stContentEven
      Styles.ContentOdd = stContentOdd
      Styles.Inactive = stInactive
      Styles.IncSearch = stIncSearch
      Styles.Selection = stSelection
      Styles.FilterBox = stFilterBox
      Styles.Footer = stFooter
      Styles.Group = stGroup
      Styles.GroupByBox = stGroupByBox
      Styles.Header = stHeader
      Styles.Indicator = stIndicator
      Styles.Preview = stPreview
      BuiltIn = True
    end
  end
  object BonusSelect: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    *'
      'FROM UP_KER_GET_BONUS_INFO_BY_PCARD(:ID_PCARD, :act_date)'
      '')
    Left = 8
    Top = 176
    poSQLINT64ToBCD = True
  end
  object SmetsDataSet: TpFIBDataSet
    DataSource = BonusSource
    Left = 8
    Top = 240
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object SmetsDataSource: TDataSource
    DataSet = SmetsDataSet
    Left = 40
    Top = 240
  end
  object BonusSource: TDataSource
    DataSet = BonusSelect
    Left = 40
    Top = 208
  end
end
