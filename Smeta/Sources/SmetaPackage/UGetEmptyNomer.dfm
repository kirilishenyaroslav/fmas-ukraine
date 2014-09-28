object frmGetEmptyNomer: TfrmGetEmptyNomer
  Left = 311
  Top = 163
  ActiveControl = cxGrid4
  BorderStyle = bsDialog
  Caption = #1052#1072#1089#1090#1077#1088' '#1087#1086#1096#1091#1082#1091' '#1074#1110#1083#1100#1085#1080#1093' '#1085#1086#1084#1077#1088#1110#1074' '#1073#1102#1076#1078#1077#1090#1110#1074
  ClientHeight = 371
  ClientWidth = 447
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
    Top = 330
    Width = 447
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 280
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 360
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 447
    Height = 330
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 66
      Top = 14
      Width = 171
      Height = 16
      Caption = #1052#1110#1085#1110#1084#1091#1084' '#1110#1085#1090#1077#1088#1074#1072#1083#1072' '#1087#1086#1096#1091#1082#1091
    end
    object Label2: TLabel
      Left = 66
      Top = 43
      Width = 187
      Height = 16
      Caption = #1052#1072#1082#1089#1080#1084#1091#1084' '#1110#1085#1090#1077#1088#1074#1072#1083#1072' '#1087#1086#1096#1091#1082#1091
    end
    object MinValue: TcxCalcEdit
      Left = 282
      Top = 14
      Width = 92
      Height = 24
      EditValue = '0'
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object MaxValue: TcxCalcEdit
      Left = 282
      Top = 43
      Width = 92
      Height = 24
      EditValue = '1000'
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object cxGrid4: TcxGrid
      Left = 8
      Top = 144
      Width = 425
      Height = 177
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      LookAndFeel.Kind = lfStandard
      object SmView: TcxGridDBTableView
        DataController.DataSource = EmptyNumsDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
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
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.Background = back
        Styles.ContentEven = back
        Styles.ContentOdd = cxStyle2
        Styles.IncSearch = cxStyle3
        Styles.Header = cxStyle1
        object cxGridDBColumn5: TcxGridDBColumn
          Caption = #1044#1086#1089#1090#1091#1087#1085#1110' '#1085#1086#1084#1077#1088#1080' '#1079' '#1110#1085#1090#1077#1088#1074#1072#1083#1091
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          SortOrder = soAscending
          Width = 90
          DataBinding.FieldName = 'EMPTY_NUM'
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = SmView
      end
    end
    object cxButton3: TcxButton
      Left = 80
      Top = 112
      Width = 273
      Height = 28
      Caption = #1054#1090#1088#1080#1084#1072#1090#1080' '#1074#1110#1083#1100#1085#1110' '#1085#1086#1084#1077#1088#1072' '#1076#1083#1103' '#1073#1102#1076#1078#1077#1090#1110#1074
      TabOrder = 3
      OnClick = cxButton3Click
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
  object EmptyNumsDataSet: TpFIBDataSet
    Left = 16
    Top = 208
    poSQLINT64ToBCD = True
  end
  object EmptyNumsDataSource: TDataSource
    DataSet = EmptyNumsDataSet
    Left = 48
    Top = 208
  end
  object ActionList1: TActionList
    Left = 16
    Top = 240
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 16397
      OnExecute = cxButton1Click
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 27
      OnExecute = cxButton2Click
    end
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 13
      OnExecute = cxButton1Click
    end
  end
end
