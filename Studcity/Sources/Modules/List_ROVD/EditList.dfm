object frmEditList: TfrmEditList
  Left = 293
  Top = 147
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1087#1080#1089#1086#1082' '#1085#1072' '#1087#1088#1086#1087#1080#1089#1082#1091' '#1074' '#1056#1042#1042#1057
  ClientHeight = 479
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PrintScale = poNone
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 457
    Width = 702
    Height = 22
    Panels = <>
  end
  object cxGridListSubs: TcxGrid
    Left = 0
    Top = 41
    Width = 281
    Height = 416
    Align = alLeft
    TabOrder = 1
    object cxGridListSubsDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSourcePR
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1050#1110#1083#1100#1082#1110#1089#1090#1100':0'
          Kind = skCount
          FieldName = 'RxID_PEOPLE'
          Column = cxGridListSubsDBTableView1DBColumn1
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleYellow
      Styles.StyleSheet = GridTableViewStyleSheetDevExpress
      Styles.Content = cxStyleYellow
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Inactive = cxStyleSilver
      Styles.IncSearch = cxStyleYellow
      Styles.Selection = cxStyle4
      Styles.FilterBox = cxStyleYellow
      Styles.Footer = cxStyleYellow
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = cxStyleBorder
      Styles.Indicator = cxStyleYellow
      Styles.NewItemRowInfoText = cxStyleYellow
      Styles.Preview = cxStyleYellow
      object cxGridListSubsDBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1055'.'#1030'.'#1041'. '#1087#1088#1077#1090#1077#1085#1076#1077#1085#1090#1072
        SortOrder = soAscending
        DataBinding.FieldName = 'RxFIO'
      end
    end
    object cxGridListSubsLevel1: TcxGridLevel
      GridView = cxGridListSubsDBTableView1
    end
  end
  object cxGrid1: TcxGrid
    Left = 422
    Top = 41
    Width = 280
    Height = 416
    TabOrder = 2
    object cxGridDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSourcePeople
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1050#1110#1083#1100#1082#1110#1089#1090#1100':0'
          Kind = skCount
          FieldName = 'RxID_PEOPLE'
          Column = cxGridDBTableView1DBColumn1
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleYellow
      Styles.StyleSheet = GridTableViewStyleSheetDevExpress
      Styles.Content = cxStyleYellow
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Inactive = cxStyleSilver
      Styles.IncSearch = cxStyleYellow
      Styles.Selection = cxStyle4
      Styles.FilterBox = cxStyleYellow
      Styles.Footer = cxStyleYellow
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = cxStyleBorder
      Styles.Indicator = cxStyleYellow
      Styles.NewItemRowInfoText = cxStyleYellow
      Styles.Preview = cxStyleYellow
      object cxGridDBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1055'.'#1030'.'#1041'. '#1091' '#1089#1087#1080#1089#1082#1091
        SortOrder = soAscending
        DataBinding.FieldName = 'RxFIO'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 702
    Height = 41
    Align = alTop
    TabOrder = 3
    object cxButtonEditBuilds: TcxButtonEdit
      Left = 184
      Top = 8
      Width = 513
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEditBuildsPropertiesButtonClick
      Style.Color = 15204351
      TabOrder = 0
    end
    object cxLabelBuilds: TcxLabel
      Left = 5
      Top = 10
      Width = 175
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = 'cxLabelBuilds                                  '
    end
  end
  object Panel1: TPanel
    Left = 200
    Top = 192
    Width = 329
    Height = 73
    TabOrder = 4
    Visible = False
    object Animate1: TAnimate
      Left = 9
      Top = 8
      Width = 96
      Height = 60
      CommonAVI = aviDeleteFile
      StopFrame = 24
    end
    object cxLabel1: TcxLabel
      Left = 112
      Top = 32
      Width = 202
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = #1063#1077#1082#1072#1081#1090#1077'. '#1049#1076#1077#1090' '#1086#1073#1088#1086#1073#1082#1072' '#1076#1072#1085#1080#1093'!'
    end
  end
  object cxButtonClose: TcxButton
    Left = 304
    Top = 400
    Width = 97
    Height = 25
    Cancel = True
    Caption = #1047#1072#1082#1088#1080#1090#1080
    TabOrder = 5
    OnClick = cxButtonCloseClick
  end
  object cxButtonSave: TcxButton
    Left = 304
    Top = 376
    Width = 97
    Height = 25
    Caption = #1047#1073#1077#1088#1077#1075#1090#1080
    Default = True
    TabOrder = 6
    OnClick = cxButtonSaveClick
  end
  object cxButtonAllInList: TcxButton
    Left = 304
    Top = 152
    Width = 97
    Height = 25
    Caption = '<<'#1042#1089#1110' '#1079' '#1089#1087#1080#1089#1082#1091
    TabOrder = 7
    OnClick = cxButtonAllInListClick
  end
  object cxButtonOneInList: TcxButton
    Left = 304
    Top = 128
    Width = 97
    Height = 25
    Caption = '< '#1047' '#1089#1087#1080#1089#1082#1091
    TabOrder = 8
    OnClick = cxButtonOneInListClick
  end
  object cxButtonAllToList: TcxButton
    Left = 304
    Top = 80
    Width = 97
    Height = 25
    Caption = #1059#1089#1110' '#1074' '#1089#1087#1080#1089#1086#1082' >>'
    TabOrder = 9
    OnClick = cxButtonAllToListClick
  end
  object cxButtonOneToList: TcxButton
    Left = 304
    Top = 56
    Width = 97
    Height = 25
    Caption = #1044#1086' '#1089#1087#1080#1089#1082#1091' >'
    TabOrder = 10
    OnClick = cxButtonOneToListClick
  end
  object StyleRepository: TcxStyleRepository
    Left = 176
    Top = 184
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15451300
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyleYellow: TcxStyle
      AssignedValues = [svColor]
      Color = 15204351
    end
    object cxStyleFontBlack: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleMalin: TcxStyle
      AssignedValues = [svColor]
      Color = 4194368
    end
    object cxStyleBorder: TcxStyle
      AssignedValues = [svColor]
      Color = clInactiveBorder
    end
    object cxStylemalinYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4194368
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15204351
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleGrid: TcxStyle
      AssignedValues = [svColor]
      Color = 10485760
    end
    object cxStyleSilver: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle4
      Styles.Content = cxStyle5
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Inactive = cxStyle13
      Styles.IncSearch = cxStyle14
      Styles.Selection = cxStyle17
      Styles.FilterBox = cxStyle8
      Styles.Footer = cxStyle9
      Styles.Group = cxStyle10
      Styles.GroupByBox = cxStyle11
      Styles.Header = cxStyle12
      Styles.Indicator = cxStyle15
      Styles.Preview = cxStyle16
      BuiltIn = True
    end
  end
  object pFIBDataSetPR: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from ST_DT_LIST_ROVD_PRET(:ID_BUILDS)'
      'order by FIO')
    Left = 72
    Top = 152
    poSQLINT64ToBCD = True
  end
  object DataSourcePR: TDataSource
    DataSet = RxMemoryDataPR
    Left = 104
    Top = 152
  end
  object pFIBDataSetPeople: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from ST_DT_LIST_ROVD_VIEW(:param_list)')
    Left = 520
    Top = 168
    poSQLINT64ToBCD = True
  end
  object DataSourcePeople: TDataSource
    DataSet = RxMemoryDataPeople
    Left = 552
    Top = 168
  end
  object RxMemoryDataPeople: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxFIO'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'RxFlagNew'
        DataType = ftInteger
      end
      item
        Name = 'RxID_PEOPLE'
        DataType = ftVariant
      end>
    Left = 584
    Top = 168
  end
  object RxMemoryDataPR: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxFIO'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'RxID_PEOPLE'
        DataType = ftVariant
      end>
    Left = 136
    Top = 152
  end
  object pFIBDataSetBuilds: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select ST_DT_ADRESS_PEOPLE.town||'#39'-'#39'||ST_DT_ADRESS_PEOPLE.index_' +
        'r||'#39' '#1091#1083'.'#39'||ST_DT_ADRESS_PEOPLE.street||'#39' '#1076'.'#39'||ST_DT_ADRESS_PEOPL' +
        'E.house||'#39' ('#39'||ST_DT_ADRESS_PEOPLE.short_name||'#39')'#39' as builds fro' +
        'm ST_DT_ADRESS_PEOPLE(:param_id_builds)')
    Left = 188
    Top = 33
    poSQLINT64ToBCD = True
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 337
    Top = 281
  end
  object pFIBStoredProc: TpFIBStoredProc
    Left = 353
    Top = 329
  end
end
