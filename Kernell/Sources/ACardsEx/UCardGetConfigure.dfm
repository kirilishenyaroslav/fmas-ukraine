object frmConfigureFrm: TfrmConfigureFrm
  Left = 373
  Top = 113
  Width = 933
  Height = 535
  Caption = #1052#1086#1076#1091#1083#1100' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1079#1074#1110#1090#1091' '#1079' '#1088#1091#1093#1091' '#1082#1086#1096#1090#1110#1074' ('#1076#1086#1093#1086#1076#1080' '#1090#1072' '#1074#1080#1076#1072#1090#1082#1080')'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 278
    Width = 917
    Height = 219
    Align = alBottom
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 440
      Height = 217
      Align = alLeft
      TabOrder = 0
      object SchGrid: TcxGrid
        Left = 1
        Top = 65
        Width = 438
        Height = 151
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object SchView: TcxGridDBTableView
          DataController.DataSource = SchDataSource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsBehavior.AlwaysShowEditor = True
          OptionsBehavior.CellHints = True
          OptionsCustomize.GroupRowSizing = True
          OptionsData.Editing = False
          OptionsSelection.CellSelect = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.Background = back
          Styles.Content = back
          Styles.Header = cxStyle1
          object SchViewDBColumn5: TcxGridDBColumn
            Caption = #1053#1086#1084#1077#1088' '#1088#1072#1093#1091#1085#1082#1091
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 130
            DataBinding.FieldName = 'SCH_NUMBER'
          end
          object SchViewDBColumn1: TcxGridDBColumn
            Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1088#1072#1093#1091#1085#1082#1091
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            SortOrder = soAscending
            Width = 268
            DataBinding.FieldName = 'sch_title'
          end
        end
        object SchLevel: TcxGridLevel
          GridView = SchView
        end
      end
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 438
        Height = 64
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 6
          Top = 7
          Width = 426
          Height = 22
          AutoSize = False
          Caption = #1050#1072#1089#1086#1074#1110' '#1090#1072' '#1073#1072#1085#1082#1110#1074#1089#1100#1082#1110' '#1088#1072#1093#1091#1085#1082#1080' '#1074' '#1096#1072#1073#1083#1086#1085#1110
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label7: TLabel
          Left = 179
          Top = 36
          Width = 112
          Height = 16
          Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1085#1072' '#1076#1072#1090#1091
        end
        object cxButton3: TcxButton
          Left = 5
          Top = 30
          Width = 75
          Height = 25
          Caption = #1044#1086#1076#1072#1090#1080
          TabOrder = 0
          OnClick = cxButton3Click
        end
        object cxButton4: TcxButton
          Left = 82
          Top = 30
          Width = 75
          Height = 25
          Caption = #1042#1080#1076#1072#1083#1080#1090#1080
          TabOrder = 1
          OnClick = cxButton4Click
        end
        object cxDateEdit1: TcxDateEdit
          Left = 294
          Top = 33
          Width = 113
          Height = 24
          Style.Color = clInfoBk
          TabOrder = 2
        end
      end
    end
    object Panel4: TPanel
      Left = 449
      Top = 1
      Width = 467
      Height = 217
      Align = alClient
      TabOrder = 1
      object cxGrid2: TcxGrid
        Left = 1
        Top = 65
        Width = 465
        Height = 151
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object cxGridDBTableView2: TcxGridDBTableView
          DataController.DataSource = SchDataSourceF
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsBehavior.AlwaysShowEditor = True
          OptionsBehavior.CellHints = True
          OptionsCustomize.GroupRowSizing = True
          OptionsData.Editing = False
          OptionsSelection.CellSelect = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.Background = back
          Styles.Content = back
          Styles.Header = cxStyle1
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = #1053#1086#1084#1077#1088' '#1088#1072#1093#1091#1085#1082#1091
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            SortOrder = soAscending
            Width = 130
            DataBinding.FieldName = 'SCH_NUMBER'
          end
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1088#1072#1093#1091#1085#1082#1091
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 268
            DataBinding.FieldName = 'sch_title'
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBTableView2
        end
      end
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 465
        Height = 64
        Align = alTop
        TabOrder = 1
        object Label2: TLabel
          Left = 13
          Top = 6
          Width = 225
          Height = 22
          AutoSize = False
          Caption = #1060#1072#1082#1090#1080#1095#1085#1110' '#1088#1072#1093#1091#1085#1082#1080' '#1074' '#1096#1072#1073#1083#1086#1085#1110
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label3: TLabel
          Left = 237
          Top = 4
          Width = 225
          Height = 22
          AutoSize = False
          Caption = '('#1110#1084#1087#1086#1088#1090#1091#1102#1090#1100#1089#1103' '#1079' "'#1041#1102#1076#1078#1077#1090#1091#1074#1072#1085#1085#1103'")'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label4: TLabel
          Left = 14
          Top = 32
          Width = 108
          Height = 16
          Caption = #1030#1084#1087#1086#1088#1090' '#1079#1072' '#1087#1077#1088#1110#1086#1076
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cxDateEdit2: TcxDateEdit
          Left = 141
          Top = 30
          Width = 113
          Height = 24
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.OnCloseUp = cxDateEdit2PropertiesCloseUp
          Style.Color = clInfoBk
          TabOrder = 0
        end
        object cxDateEdit3: TcxDateEdit
          Left = 261
          Top = 29
          Width = 113
          Height = 24
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Color = clInfoBk
          TabOrder = 1
        end
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 441
      Top = 1
      Width = 8
      Height = 217
      HotZoneClassName = 'TcxMediaPlayer8Style'
      Control = Panel2
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 917
    Height = 270
    Align = alClient
    TabOrder = 1
    object cxGrid1: TcxGrid
      Left = 1
      Top = 57
      Width = 915
      Height = 212
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object cxGridDBTableView1: TcxGridDBTableView
        DataController.DataSource = ACardsDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.AlwaysShowEditor = True
        OptionsBehavior.CellHints = True
        OptionsCustomize.GroupRowSizing = True
        OptionsData.Editing = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = #1055#1088#1086#1075#1088#1072#1084#1072' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 437
          DataBinding.FieldName = 'pkv_text'
        end
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = #1058#1080#1087' '#1082#1086#1096#1090#1110#1074
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          SortOrder = soAscending
          Width = 273
          DataBinding.FieldName = 'tf_text'
        end
        object cxGridDBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1050#1086#1084#1077#1085#1090#1072#1088
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 157
          DataBinding.FieldName = 'PARAM_SET_NAME'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 915
      Height = 56
      Align = alTop
      TabOrder = 1
      object Label8: TLabel
        Left = 7
        Top = 5
        Width = 578
        Height = 21
        AutoSize = False
        Caption = #1064#1072#1073#1083#1086#1085#1080' '#1087#1072#1088#1072#1084#1077#1090#1088#1110#1074' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1079#1074#1110#1090#1091' '#1079' '#1088#1091#1093#1091' '#1082#1086#1096#1090#1110#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object cxButton6: TcxButton
        Left = 5
        Top = 24
        Width = 121
        Height = 25
        Caption = #1044#1086#1076#1072#1090#1080' '#1096#1072#1073#1083#1086#1085
        TabOrder = 0
        OnClick = cxButton6Click
      end
      object cxButton7: TcxButton
        Left = 128
        Top = 24
        Width = 142
        Height = 25
        Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1096#1072#1073#1083#1086#1085
        TabOrder = 1
        OnClick = cxButton7Click
      end
      object cxButton1: TcxButton
        Left = 272
        Top = 24
        Width = 302
        Height = 25
        Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1079#1074#1110#1090' '#1087#1086' '#1082#1072#1089#1086#1074#1086#1084#1091' '#1088#1091#1093#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = cxButton1Click
      end
      object cxButton2: TcxButton
        Left = 578
        Top = 24
        Width = 302
        Height = 25
        Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1079#1074#1110#1090' '#1087#1086' '#1092#1072#1082#1090#1080#1095#1085#1086#1084#1091' '#1088#1091#1093#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = cxButton2Click
      end
    end
  end
  object cxSplitter2: TcxSplitter
    Left = 0
    Top = 270
    Width = 917
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer8Style'
    AlignSplitter = salBottom
    Control = Panel1
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 136
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 56
    Top = 136
  end
  object ACardsParamsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 72
    Top = 66
    poSQLINT64ToBCD = True
  end
  object ACardsDataSource: TDataSource
    DataSet = ACardsParamsDataSet
    Left = 105
    Top = 66
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 56
    Top = 168
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 14
    Top = 437
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
  end
  object SchDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    DataSource = ACardsDataSource
    Left = 24
    Top = 474
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object SchDataSource: TDataSource
    DataSet = SchDataSet
    Left = 56
    Top = 474
  end
  object SchDataSetF: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    DataSource = ACardsDataSource
    Left = 456
    Top = 266
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object SchDataSourceF: TDataSource
    DataSet = SchDataSetF
    Left = 520
    Top = 242
  end
end
