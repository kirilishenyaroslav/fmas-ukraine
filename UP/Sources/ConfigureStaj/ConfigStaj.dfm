object frmConfigStaj: TfrmConfigStaj
  Left = 297
  Top = 218
  Width = 811
  Height = 600
  Caption = 'frmConfigStaj'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 795
    Height = 193
    Align = alTop
    TabOrder = 0
    object cxGrid3: TcxGrid
      Left = 1
      Top = 97
      Width = 793
      Height = 95
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object RaiseView: TcxGridDBTableView
        OnKeyDown = RaiseViewKeyDown
        DataController.DataSource = DSStajTypePost
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
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
        Styles.StyleSheet = cxGridTableViewStyleSheet1
        object cxGridDBColumn4: TcxGridDBColumn
          Caption = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.MaxLength = 0
          Visible = False
          GroupIndex = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          SortOrder = soAscending
          Width = 80
          DataBinding.FieldName = 'NAME_TYPE_POST'
        end
        object cxGridDBColumn6: TcxGridDBColumn
          Caption = #1055#1086#1089#1072#1076#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          SortOrder = soAscending
          Width = 105
          DataBinding.FieldName = 'NAME_POST'
        end
        object RaiseViewDBColumn2: TcxGridDBColumn
          Caption = #1056#1086#1079#1088#1103#1076
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.MaxLength = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 38
          DataBinding.FieldName = 'NUM_DIGIT'
        end
        object cxGridDBColumn7: TcxGridDBColumn
          Caption = #1052#1110#1085'. '#1088#1086#1079#1084#1110#1088' '#1089#1090#1072#1074#1082#1080
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.MaxLength = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 50
          DataBinding.FieldName = 'MIN_RATE_COUNT'
        end
        object cxGridDBColumn5: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.MaxLength = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 51
          DataBinding.FieldName = 'DATE_BEG_OUT'
        end
        object RaiseViewDBColumn1: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1082#1110#1085#1094#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.MaxLength = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 50
          DataBinding.FieldName = 'DATE_END_OUT'
        end
        object RaiseViewDBColumn4: TcxGridDBColumn
          Caption = #1042#1110#1076
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.MaxLength = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 38
          DataBinding.FieldName = 'SALARY_MIN'
        end
        object RaiseViewDBColumn5: TcxGridDBColumn
          Caption = #1044#1086
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.MaxLength = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 42
          DataBinding.FieldName = 'SALARY_MAX'
        end
        object RaiseViewDBColumn3: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1087#1086#1089#1072#1076#1080
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.MaxLength = 0
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 40
          DataBinding.FieldName = 'POST_CODE'
        end
        object RaiseViewDBColumn6: TcxGridDBColumn
          Visible = False
        end
        object RaiseViewDBColumn7: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1072#1079#1091' '#1087#1088#1086' '#1072#1082#1088#1077#1076#1080#1090#1072#1094#1110#1102
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.MaxLength = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 70
          DataBinding.FieldName = 'NUM_ORDER'
        end
        object RaiseViewDBColumn8: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1085#1072#1082#1072#1079#1091' '#1087#1088#1086' '#1072#1082#1088#1077#1076#1080#1090#1072#1094#1110#1102
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.MaxLength = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 66
          DataBinding.FieldName = 'DATE_ORDER'
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = RaiseView
      end
    end
    object FiltLab: TcxLabel
      Left = 0
      Top = 192
      Width = 281
      Height = 24
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -16
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Visible = False
      Caption = #1053#1072#1090#1080#1089#1085#1110#1090#1100' Ctrl+F '#1076#1083#1103' '#1092#1110#1083#1100#1090#1088#1072#1094#1110#1111
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 793
      Height = 96
      Align = alTop
      TabOrder = 0
      object LocFilterBox: TcxCheckBox
        Left = 0
        Top = 47
        Width = 177
        Height = 21
        ParentFont = False
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = LocFilterBoxPropertiesChange
        Properties.Caption = #1051#1086#1082#1072#1083#1100#1085#1080#1081' '#1092#1110#1083#1100#1090#1088
        Style.BorderStyle = ebsFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
      end
      object PanelGroup1: TcxCheckBox
        Left = 160
        Top = 47
        Width = 177
        Height = 21
        ParentFont = False
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = PanelGroup1PropertiesChange
        Properties.Caption = #1055#1072#1085#1077#1083#1100' '#1075#1088#1091#1087#1091#1074#1072#1085#1085#1103
        Style.BorderStyle = ebsFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
      end
      object Panel8: TPanel
        Left = 1
        Top = 71
        Width = 791
        Height = 24
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 2
        object CaptionGrid1: TcxLabel
          Left = 1
          Top = 1
          Width = 791
          Height = 24
          Align = alClient
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 0
          Caption = 
            #1056#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1089#1090#1072#1078#1091' '#1087#1088#1086#1074#1086#1076#1080#1090#1100#1089#1103' '#1097#1086#1076#1086' '#1085#1072#1089#1090#1091#1087#1085#1080#1093' '#1087#1086#1089#1072#1076' '#1090#1072' '#1090#1080#1087#1110#1074' '#1087#1077#1088#1089#1086 +
            #1085#1072#1083#1091' '
        end
      end
      object dbrType: TdxBarDockControl
        Left = 1
        Top = 1
        Width = 791
        Height = 46
        Align = dalTop
        BarManager = brManager
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 376
    Width = 795
    Height = 186
    Align = alBottom
    TabOrder = 2
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 793
      Height = 96
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object LocFilterBox2: TcxCheckBox
        Left = 0
        Top = 47
        Width = 177
        Height = 21
        ParentFont = False
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = LocFilterBox2PropertiesChange
        Properties.Caption = #1051#1086#1082#1072#1083#1100#1085#1080#1081' '#1092#1110#1083#1100#1090#1088
        Style.BorderStyle = ebsFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
      end
      object PanelGroup3: TcxCheckBox
        Left = 144
        Top = 48
        Width = 177
        Height = 21
        ParentFont = False
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = PanelGroup3PropertiesChange
        Properties.Caption = #1055#1072#1085#1077#1083#1100' '#1075#1088#1091#1087#1091#1074#1072#1085#1085#1103
        Style.BorderStyle = ebsFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
      end
      object Panel10: TPanel
        Left = 0
        Top = 72
        Width = 793
        Height = 24
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 2
        object CaptionGrid3: TcxLabel
          Left = 1
          Top = 1
          Width = 793
          Height = 24
          Align = alClient
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 0
          Caption = #1042#1080#1085#1103#1090#1082#1080' '#1076#1083#1103' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091' '#1089#1090#1072#1078#1072' '
        end
      end
      object dbrPNCalc: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 793
        Height = 46
        Align = dalTop
        BarManager = brManager
      end
    end
    object cxGrid2: TcxGrid
      Left = 1
      Top = 97
      Width = 793
      Height = 88
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object cxGridDBTableView2: TcxGridDBTableView
        OnKeyDown = cxGridDBTableView2KeyDown
        DataController.DataSource = PeopleNCalcDS
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
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
        Styles.StyleSheet = cxGridTableViewStyleSheet1
        object cxGridDBColumn9: TcxGridDBColumn
          Caption = #1055#1030#1041
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 123
          DataBinding.FieldName = 'FIO'
        end
        object cxGridDBColumn10: TcxGridDBColumn
          Caption = #1055#1086#1089#1072#1076#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 77
          DataBinding.FieldName = 'NAME_POST'
        end
        object cxGridDBColumn11: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 99
          DataBinding.FieldName = 'DATE_BEG_OUT'
        end
        object cxGridDBColumn12: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1082#1110#1085#1094#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 142
          DataBinding.FieldName = 'DATE_END_OUT'
        end
      end
      object cxGridLevel3: TcxGridLevel
        GridView = cxGridDBTableView2
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 193
    Width = 795
    Height = 183
    Align = alClient
    TabOrder = 1
    object Panel5: TPanel
      Left = 1
      Top = 9
      Width = 793
      Height = 96
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object LocFilterBox1: TcxCheckBox
        Left = 0
        Top = 49
        Width = 177
        Height = 21
        ParentFont = False
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = LocFilterBox1PropertiesChange
        Properties.Caption = #1051#1086#1082#1072#1083#1100#1085#1080#1081' '#1092#1110#1083#1100#1090#1088
        Style.BorderStyle = ebsFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
      end
      object PanelGroup2: TcxCheckBox
        Left = 200
        Top = 49
        Width = 177
        Height = 21
        ParentFont = False
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = PanelGroup2PropertiesChange
        Properties.Caption = #1055#1072#1085#1077#1083#1100' '#1075#1088#1091#1087#1091#1074#1072#1085#1085#1103
        Style.BorderStyle = ebsFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
      end
      object Panel9: TPanel
        Left = 0
        Top = 72
        Width = 793
        Height = 24
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 2
        object CaptionGrid2: TcxLabel
          Left = 1
          Top = 1
          Width = 793
          Height = 24
          Align = alClient
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 0
          Caption = 
            #1056#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1089#1090#1072#1078#1091' '#1087#1088#1086#1074#1086#1076#1080#1090#1100#1089#1103' '#1097#1086#1076#1086' '#1085#1072#1089#1090#1091#1087#1085#1080#1093' '#1092#1110#1079#1080#1095#1085#1080#1093' '#1086#1089#1110#1073' / '#1089#1087#1110#1074 +
            #1088#1086#1073#1110#1090#1085#1080#1082#1110#1074
        end
      end
      object dbrPCalc: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 793
        Height = 46
        Align = dalTop
        BarManager = brManager
      end
    end
    object cxGrid1: TcxGrid
      Left = 1
      Top = 105
      Width = 793
      Height = 69
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object cxGridDBTableView1: TcxGridDBTableView
        OnKeyDown = cxGridDBTableView1KeyDown
        DataController.DataSource = PeopleCalcDS
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
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
        Styles.StyleSheet = cxGridTableViewStyleSheet1
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = #1055#1030#1041
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 100
          DataBinding.FieldName = 'FIO'
        end
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = #1055#1086#1089#1072#1076#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 100
          DataBinding.FieldName = 'NAME_POST'
        end
        object cxGridDBColumn3: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 50
          DataBinding.FieldName = 'DATE_BEG_OUT'
        end
        object cxGridDBColumn8: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1082#1110#1085#1094#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 50
          DataBinding.FieldName = 'DATE_END_OUT'
        end
        object cxGridDBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1072#1079#1091' '#1087#1088#1086' '#1072#1082#1088#1077#1076#1080#1090#1072#1094#1110#1102
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 60
          DataBinding.FieldName = 'NUM_ORDER'
        end
        object cxGridDBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1085#1072#1082#1072#1079#1091' '#1087#1088#1086' '#1072#1082#1088#1077#1076#1080#1090#1072#1094#1110#1102
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 60
          DataBinding.FieldName = 'DATE_ORDER'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object cxSplitter2: TcxSplitter
      Left = 1
      Top = 1
      Width = 793
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer8Style'
      AlignSplitter = salTop
      Control = Panel1
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 174
      Width = 793
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer8Style'
      AlignSplitter = salBottom
      Control = Panel2
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 8
    Top = 168
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13106942
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11793652
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13302779
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 14745599
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14745599
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      Caption = 'qizzStyle'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle16
      Styles.ContentEven = cxStyle17
      Styles.ContentOdd = cxStyle18
      Styles.Inactive = cxStyle24
      Styles.IncSearch = cxStyle25
      Styles.Selection = cxStyle28
      Styles.FilterBox = cxStyle19
      Styles.Footer = cxStyle20
      Styles.Group = cxStyle21
      Styles.GroupByBox = cxStyle22
      Styles.Header = cxStyle23
      Styles.Indicator = cxStyle26
      Styles.Preview = cxStyle27
      BuiltIn = True
    end
  end
  object ActionList1: TActionList
    Left = 8
    Top = 136
    object InstypeAct: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = InstypeActExecute
    end
    object ModifyTypeAct: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = ModifyTypeActExecute
    end
    object DelTypeAct: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = DelTypeActExecute
    end
    object RefreshTypeAct: TAction
      Caption = #1054#1085#1086#1074#1080#1090#1080
      OnExecute = RefreshTypeActExecute
    end
    object InsPCalcAct: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = InsPCalcActExecute
    end
    object DelPCalcAct: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = DelPCalcActExecute
    end
    object RefPCAlcAct: TAction
      Caption = #1054#1085#1086#1074#1080#1090#1080
      OnExecute = RefPCAlcActExecute
    end
    object PeriodEditCalcAct: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = PeriodEditCalcActExecute
    end
    object InsPNCalcAct: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = InsPNCalcActExecute
    end
    object DelPNCalcAct: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = DelPNCalcActExecute
    end
    object RefPNCalcAct: TAction
      Caption = #1054#1085#1086#1074#1080#1090#1080
      OnExecute = RefPNCalcActExecute
    end
    object PeriodEditNCalcAct: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1087#1077#1088#1110#1086#1076
      OnExecute = PeriodEditNCalcActExecute
    end
    object FilterAct: TAction
      Caption = #1060#1110#1083#1100#1090#1088#1091#1074#1072#1090#1080
      ShortCut = 16454
      OnExecute = FilterActExecute
    end
    object CloseAct: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      SecondaryShortCuts.Strings = (
        'esc')
      OnExecute = CloseActExecute
    end
  end
  object StajTypePostSet: TpFIBDataSet
    Database = frmSelectStaj.DBase
    Transaction = frmSelectStaj.ReadTransaction
    UpdateTransaction = frmSelectStaj.WriteTransaction
    SelectSQL.Strings = (
      
        'select * from UP_CONF_TP_STAJ_SEL(:id_staj, :date_beg, :date_end' +
        ')')
    Left = 96
    Top = 144
    poSQLINT64ToBCD = True
  end
  object DSStajTypePost: TDataSource
    DataSet = StajTypePostSet
    Left = 128
    Top = 144
  end
  object PeopleCalcDS: TDataSource
    DataSet = PeopleCalcSet
    Left = 64
    Top = 312
  end
  object PeopleCalcSet: TpFIBDataSet
    Database = frmSelectStaj.DBase
    Transaction = frmSelectStaj.ReadTransaction
    UpdateTransaction = frmSelectStaj.WriteTransaction
    SelectSQL.Strings = (
      
        'select * from up_people_calc_staj_sel(:id_staj, :date_beg, :date' +
        '_end)')
    Left = 32
    Top = 312
    poSQLINT64ToBCD = True
  end
  object PeopleNCalcSet: TpFIBDataSet
    Database = frmSelectStaj.DBase
    Transaction = frmSelectStaj.ReadTransaction
    UpdateTransaction = frmSelectStaj.WriteTransaction
    SelectSQL.Strings = (
      
        'select * from up_people_ncalc_staj_sel(:id_staj, :date_beg, :dat' +
        'e_end)')
    Left = 32
    Top = 456
    poSQLINT64ToBCD = True
  end
  object PeopleNCalcDS: TDataSource
    DataSet = PeopleNCalcSet
    Left = 64
    Top = 456
  end
  object CatSet: TpFIBDataSet
    Database = frmSelectStaj.DBase
    Transaction = frmSelectStaj.ReadTransaction
    UpdateTransaction = frmSelectStaj.WriteTransaction
    SelectSQL.Strings = (
      'select * from sp_type_post')
    Left = 176
    Top = 144
    poSQLINT64ToBCD = True
  end
  object CatDs: TDataSource
    DataSet = CatSet
    Left = 208
    Top = 144
  end
  object StorProc: TpFIBStoredProc
    Database = frmSelectStaj.DBase
    Transaction = frmSelectStaj.WriteTransaction
    Left = 328
    Top = 296
  end
  object brManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'TypeToolBar'
        DockControl = dbrType
        DockedDockControl = dbrType
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 404
        FloatTop = 343
        FloatClientWidth = 23
        FloatClientHeight = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemLinks = <
          item
            Item = btnAddType
            Visible = True
          end
          item
            Item = btnEditType
            Visible = True
          end
          item
            Item = btnDelType
            Visible = True
          end
          item
            Item = btnRefType
            Visible = True
          end
          item
            Item = lblFilter
            Visible = True
          end
          item
            Item = FilterDateBeg
            Visible = True
          end
          item
            Item = dxBarStatic1
            Visible = True
          end
          item
            Item = FilterDateEnd
            Visible = True
          end
          item
            Item = btnFilter
            Visible = True
          end
          item
            Item = btnCLose
            Visible = True
          end>
        Name = 'TypeToolBar'
        NotDocking = [dsNone]
        OneOnRow = True
        Row = 0
        UseOwnFont = True
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'PCalcToolBar'
        DockControl = dbrPCalc
        DockedDockControl = dbrPCalc
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 404
        FloatTop = 343
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnPCalcIns
            Visible = True
          end
          item
            Item = btnPCalcEdit
            Visible = True
          end
          item
            Item = btnPCalcDel
            Visible = True
          end
          item
            Item = btnPCalcRef
            Visible = True
          end>
        Name = 'PCalcToolBar'
        NotDocking = [dsNone]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        BorderStyle = bbsNone
        Caption = 'NPCalcToolBar'
        DockControl = dbrPNCalc
        DockedDockControl = dbrPNCalc
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 404
        FloatTop = 343
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnPNCalcIns
            Visible = True
          end
          item
            Item = btnPNCalcDel
            Visible = True
          end
          item
            Item = btnPNCalcRef
            Visible = True
          end
          item
            Item = btnPNCalcEdit
            Visible = True
          end>
        Name = 'NPCalcToolBar'
        NotDocking = [dsNone]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LargeImages = ImgList1
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 504
    Top = 328
    DockControlHeights = (
      0
      0
      0
      0)
    object btnAddType: TdxBarLargeButton
      Action = InstypeAct
      Category = 0
      ImageIndex = 0
      AutoGrayScale = False
    end
    object btnEditType: TdxBarLargeButton
      Action = ModifyTypeAct
      Category = 0
      ImageIndex = 1
      AutoGrayScale = False
    end
    object btnDelType: TdxBarLargeButton
      Action = DelTypeAct
      Category = 0
      ImageIndex = 2
      AutoGrayScale = False
    end
    object btnRefType: TdxBarLargeButton
      Action = RefreshTypeAct
      Category = 0
      ImageIndex = 5
      AutoGrayScale = False
    end
    object btnCLose: TdxBarLargeButton
      Action = CloseAct
      Align = iaRight
      Category = 0
      ImageIndex = 4
      AutoGrayScale = False
    end
    object dxBarContainerItem1: TdxBarContainerItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarEdit1: TdxBarEdit
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Width = 100
    end
    object FilterDateBeg: TdxBarDateCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      Width = 100
      MaxDate = 2958465.000000000000000000
      MinDate = 2.000000000000000000
      ShowDayText = False
    end
    object lblFilter: TdxBarStatic
      Caption = #1060#1110#1083#1100#1090#1088#1091#1074#1072#1090#1080' '#1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079':'
      Category = 0
      Hint = #1060#1110#1083#1100#1090#1088#1091#1074#1072#1090#1080' '#1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079':'
      Visible = ivAlways
    end
    object dxBarStatic1: TdxBarStatic
      Caption = #1087#1086
      Category = 0
      Hint = #1087#1086
      Visible = ivAlways
    end
    object FilterDateEnd: TdxBarDateCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      Width = 100
      MaxDate = 2958465.000000000000000000
      MinDate = 2.000000000000000000
      ShowDayText = False
    end
    object btnFilter: TdxBarLargeButton
      Action = FilterAct
      Category = 0
      ImageIndex = 12
      AutoGrayScale = False
    end
    object btnPCalcIns: TdxBarLargeButton
      Action = InsPCalcAct
      Category = 0
      ImageIndex = 0
      AutoGrayScale = False
    end
    object btnPCalcDel: TdxBarLargeButton
      Action = DelPCalcAct
      Category = 0
      ImageIndex = 2
      AutoGrayScale = False
    end
    object btnPCalcRef: TdxBarLargeButton
      Action = RefPCAlcAct
      Category = 0
      ImageIndex = 5
      AutoGrayScale = False
    end
    object btnPCalcEdit: TdxBarLargeButton
      Action = PeriodEditCalcAct
      Category = 0
      ImageIndex = 1
      AutoGrayScale = False
    end
    object btnPNCalcIns: TdxBarLargeButton
      Action = InsPNCalcAct
      Category = 0
      ImageIndex = 0
      AutoGrayScale = False
    end
    object btnPNCalcDel: TdxBarLargeButton
      Action = DelPNCalcAct
      Category = 0
      ImageIndex = 2
      AutoGrayScale = False
    end
    object btnPNCalcRef: TdxBarLargeButton
      Action = RefPNCalcAct
      Category = 0
      ImageIndex = 5
      AutoGrayScale = False
    end
    object btnPNCalcEdit: TdxBarLargeButton
      Action = PeriodEditNCalcAct
      Category = 0
      ImageIndex = 1
      AutoGrayScale = False
    end
  end
  object ImgList1: TImageList
    Height = 24
    ShareImages = True
    Width = 24
    Left = 260
    Top = 151
    Bitmap = {
      494C01010D000E00040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000006000000001002000000000000090
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000330000003300000033
      0000003300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000003300006699660099CC99003399
      3300339900000033000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000003300006699660099CC99003399
      3300339900000033000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000003300006699660099CC99003399
      3300339900000033000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000003300006699660099CC99003399
      3300339900000033000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000003300006699660099CC99003399
      3300339900000033000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003300003399330033CC660033CC33000099
      3300009933000080000000330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000003300003399330033CC660033CC660033CC33000099
      3300009900000080000000800000003300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000003300003399330033CC660033CC660033CC330000CC33000099
      3300009900000080000000800000008000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000033CC330033FF660033CC660033CC660033CC3300009933000099
      3300009900000080000000800000008000000033000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000033000033FF990033FF660033CC660033CC660033CC3300009933000099
      3300009900000080000000800000008000000080000000330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000033
      000033CC330033FF660033CC660033CC660033CC660033CC3300009933000099
      3300008000000080000000800000008000000080000000800000003300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000003300003399
      330033CC66003399330000800000006600000066000000660000006600000066
      0000006600000066000000660000006600000066000000800000006600000033
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000330000003300000033
      00000066000000660000008000000080000000993300CCFFFF0000CCFF0000CC
      FF0000CCFF000066660033CC3300339933000099330000800000003300000033
      0000003300000000000000000000868686000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000033000000660000008000000080
      0000CC660000CC660000CC660000009933000099330000993300CCFFFF0000CC
      FF0000CCFF0000CCFF000066660033FF660033FF990033FF990033FF990033CC
      6600006600000033000086868600868686000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000033000000660000CC66
      0000CCCC6600CCCC3300CC993300CC660000009933000099330033CC3300CCFF
      FF0000CCFF0000CCFF0000CCFF00006666003399330033993300FF66FF000033
      0000003300000000000000000000868686000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CC99
      6600F0CAA600CCCC6600CCCC3300CC6600000033000000330000003300000033
      0000CCFFFF0000CCFF00006666000033000000330000FF66FF00FF66FF008000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CC99
      660000000000F0CAA600CCCC6600CC6600000000000000000000000000000000
      000000000000000000000000000000000000FFCCFF00FF00FF00FF00FF00FF00
      FF00800080008000800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CC996600CC996600CC660000000000000000000000000000000000000000
      000000000000000000000000000000000000FFCCFF00FFCCFF00FF00FF008000
      8000800080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFCCFF00FF66FF008000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF66FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002F752800047D1100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A87D7800A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400986B66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A87C7800A87C7800A87C7800A87C
      7800A87C7800A87C7800A87C7800A87C7800A87C7800A87C7800A87C7800A87C
      7800A87C7800A87C7800A87C7800A87C780005710A0019AC390005710A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A97F7900F3DD
      C400F8E3C600F6DFBF00F5DCB800F4D9B200F3D7AC00F3D4A700F2D2A000F0CF
      9A00F0CE9800F0CE9800F0CE9800F0CE9800F0CE9800F0CE9800F1CF9800EFCD
      9700986B66000000000000000000000000000000000000000000CA650100CA65
      0100CA650100CA650100CA650100CA650100CA650100CA650100CA650100CA65
      0100CA650100CA650100CA650100CA650100CA650100CA650100CA650100CA65
      0100CA650100CA6501000000000000000000AA7F7A00FAE2C900FFEACA00FFE3
      C300FFE0BA00FFDDB400FFE0AB00FFE0AB00FFDB9C00FFD59D00FFDB9C00FFD8
      A200FFD59D00E6C28700ADAE68007EA2510005710A002BBC4E0035C253000571
      0A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A97F7A00F2DE
      C800F7E3CA00F5DFC200F4DCBC00F3DAB600F2D7B100F1D4AB00F1D2A500F0CF
      9F00EFCD9A00EECC9700EECC9700EECC9700EECC9700EECC9700EFCD9700EDCB
      9600986B66000000000000000000000000000000000000000000CA650100FFFF
      FF00FFF6ED00FFF4E600FFF0DF00FFECD70041AB3100FEE5C800FFE1C100FFDF
      BB00FEDCB400F7D3AB00C6A8870039872C00E4C29A00F3CEA400FCD5AA00FED7
      AB00FED7AB00CA6501000000000000000000AA7F7A00FAE2C900FEE7CD00FFE3
      C300FFE0BE00FFE5B900DEBBA9009A83A4006B63AC00605BAF007967AD00A498
      79006B9A43002C9A350026AA42002BBC4E0036C45B003CC95D003AC95B0035C2
      530005710A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004186260044902C0000000000000000000000
      0000000000000000000000000000000000000000000000000000A97F7A00F2E0
      CE00F8E7CF00F5E2C800F5DEC200F4DCBC00F3DAB700F2D7B100F1D4AB00F1D2
      A500F0CFA000EFCD9A00EECC9700EECC9700EECC9700EECC9700EFCD9700EDCB
      9600986B66000000000000000000000000000000000000000000CA650100FFFF
      FF00FFF9F400FFF7EF00FFF3E800FFF0E00041AB3100FEE9D100FEE6CB00FEE3
      C300FFDFBB00ECCCA900444547001D5667006E756C00AF977A00E0BE9700F7D1
      A600FED7AB00CA6501000000000000000000AA7F7A00F9E6D300FFE9D200FFEA
      CA00FFE9C200AC97B2000A2CB100001DDF000026FC00002DFF000A2CB1000C7B
      22002DBB510049D876004AD7730046D36C0041CE66003ECA61003BC85C003AC9
      5B0035C35400158D230000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003E7C1D00479B380048A6400048AA450048A64300428927000000
      0000000000000000000000000000000000000000000000000000A97F7A00F3E3
      D200F9E9D400F6E4CD0099330000993300009933000099330000993300009933
      00009933000099330000993300009933000099330000EECC9700EFCD9700EDCB
      9600986B66000000000000000000000000000000000000000000CA650100FFFF
      FF00FFFDFA00FFFAF500FFF7EF00FEF4E80041AB3100FFEDDA00FEE9D300FEE6
      CB00FEE3C300FEDFBC00A59F8F000E7AA4004E6F8600765C5A009B826B00D1B2
      8E00EECAA100CA6501000000000000000000AA7F7A00F9E6D300FDECDA00FEE7
      CD00716BB4000221D800002FFF000028FF004F6FFF007CA5AC001D943D0050DB
      770055E0840050DA7B004ED978004AD7730046D36C0041CE66003ECA61003CC9
      5D003CCC5E002AAC420005710A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003D79
      19004695310048A6410047A13C0047A7420048AA450048A6410048AC470047A0
      3B003E7C1B000000000000000000000000000000000000000000A97F7B00F4E6
      D800FAECDA00F8E7D30099330000FEFEFE00FEFEFE00FEFEFE00FEFEFE00DFE5
      FE00325BFC00EEF1FE00FEFEFE00FEFEFE0099330000EECC9700EFCD9700EDCB
      9600986B66000000000000000000000000000000000000000000CA65010051B0
      420041AB310041AB310041AB310041AB310041AB310041AB310041AB310041AB
      310041AB310041AB31003DA333003F6D6700D9A09E00C48D8D007A5952003565
      2A0037842C00CA6501000000000000000000AA807B00FDECDA00FFFBE400A298
      C100001DDF000032FF00002AFF006583FC00D0D5D8002B93290052DD7C005CE8
      8E0053DE780046CF5D0039BD45002DB6460033BE580045CF690041CE660041CF
      650026A63E0008750E0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000418625004186250047A5
      4100479F390048A6410047A13C0048AD480048B04C0048A7420048AA450047A7
      410049AD48004595310000000000000000000000000000000000AA807B00F5E9
      DD00FBEFE000F8EAD90099330000FEFEFE00FEFEFE00FEFEFE00AFBFFD001342
      FB000335FB00A0B2FD00FEFEFE00FEFEFE0099330000EECC9700EFCD9700EDCB
      9600986B66000000000000000000000000000000000000000000CA650100FFFF
      FF00FFFFFF00FFFFFF00FFFDFC00FFFBF70041AB3100FFF5EB00FFF3E500FEEF
      DC00FFECD500FFE7CD00FFE4C60042864400D8A3A100E2ADAD00BC878700815A
      57008E796400CA6501000000000000000000AA817C00FCEFE100FFF1E000434F
      C6000031FC000032FF001E4BFF00EAEAFB007EB47E002EB24D0055E084002FAE
      460018814C00065C7500004A81003F685C004592330036C45B004AD872002AAC
      420005710A000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003C7813003C7813003E7A120045922A0047A6
      410048A43E0048A33D0048A43F0048A43F0048A7420048B6530048AE490047A8
      430047A8430048AB4600366A0F00000000000000000000000000AD837D00F5EC
      E300FBF2E600F9EDDE0099330000FEFEFE00FEFEFE00718DFC000335FB000335
      FB000335FB00224EFB00FEFEFE00FEFEFE0099330000EECC9900EFCD9700EDCB
      9600986B66000000000000000000000000000000000000000000CA650100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFD0041AB3100FFF9F300FFF6ED00FFF3
      E500FFEFDE00FEEBD600FFE8CE0041AB3100C39C8B00D4A3A300E2ADAD00BA85
      8500825B5700CA6501000000000000000000AF857E00FDF4E900D0D5D8001234
      DC001246FF00093DFF002752FF006583FC00238E56004DDA750039A543007CA5
      AC000938F300002DFF000028FF005549CD0085A155002DBB510026A63E000370
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000004082200040822000469C390041851C004081150045942F0048A4
      3F0047A5400048AE490044BD6C0044C1780046BC640048A53F0048AD4A0048B4
      530048A7420048AD47003A741500000000000000000000000000B2887E00F7EF
      E800FCF5EC00FAEFE40099330000EEF1FE00325BFC000335FB000335FB00718D
      FC001342FB000335FB00AFBFFD00FEFEFE0099330000F0CF9F00EFCD9A00EDCA
      9600986B66000000000000000000000000000000000000000000CA650100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0041AB3100FFFCF800FFF9F300FFF6
      ED00FFF3E500FFEFDE00FFECD70041AB3100FEE5C800B9968700D6A6A600DFAA
      AA00BF8383008D4E45000000000000000000B4898000FFFDEF00B9B6DB00133B
      E700194CFF001549FE000C3FFF00002FEC00238E56002FAE4600B9D8A10095A6
      FF00002AFF000032FF000032FF00303AD20075954E00047D110005710A000000
      0000000000000000000000000000000000000000000000000000000000003F7D
      1D003F7D1D00469A360047A64200479E3A003F7F150042871A00479F3B0048AD
      4A0045BD6A0044C0750044BF720044BF700043BF720045BD6A0047A74100479F
      3A0048B3500048B4510040822100000000000000000000000000B68B8000F8F2
      EE00FDF8F100FAF3EA0099330000224EFB000335FB001342FB00AFBFFD00FEFE
      FE008099FC000335FB00224EFB00FEFEFE0099330000F0D1A400F0D09F00EDCB
      9800986B66000000000000000000000000000000000000000000CA650100DAD8
      FA009292FF006262FF004444FE003F3FFC003247D5008C8BFE00D8D5FA00FFF9
      F400FFF6ED00FEF3E600FFF0DF0041AB3100FFEAD000FEE5C800BD9B8C00E4AD
      AC009D909900279FBD001CAECE0000000000BA8C8100FFFEF600B9B6DB00183F
      E8002153FF001C4EFF001848FF00839EEF002C9A350025873C00839EEF00133F
      FF00002FFF000032FF000031FF00303AD2008299550005710A00000000000000
      0000000000000000000000000000000000000000000044922D0044922D004492
      2D0049A8430047A13C0048A74200479B36003E7E150042871D0048A83D0047B9
      570046BC640044BF740043C0760044BF720045BE6C00438C2A003E7B1B0048A5
      410048AF4B0048A7420040832200000000000000000000000000BA8E8200FAF6
      F400FEFCF800FCF6F00099330000A0B2FD00325BFC00CFD8FD00FEFEFE00FEFE
      FE00EEF1FE001342FB000335FB008099FC0099330000F1D4AA00F1D2A500EECD
      9E00986B66000000000000000000000000000000000000000000CA650100535B
      F0005858EB005858CA006B6BC300696AC2005654C4004444DF004046F2003371
      850041AB310041AB310041AB310041AB310041AB310041AB310041AB31006E7B
      440033A5C50008B9F100003BBE000107A000BC918300FFFEF600D5D9F7002744
      DB00285CFF002153FF00416BFF00EBF1F800248719001D6C6D001246FF001041
      FF000639FF000236FF00002DFF00434ABD00F4CC9B00C2938400000000000000
      0000000000000000000000000000000000003A7415003A74150048A23E0047A1
      3C0048A7410047A03C0048A9460045932D0041830C00489A1200489A0D004797
      0E004692110049A1270048B9540044C0750045BE6D0047B75400408423004084
      230045BE6C0047B9580040832200000000000000000000000000BE928300FBF8
      F700FFFFFE00FEFAF60099330000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00A0B2FD000335FB000335FB007D332F00F2D7B000F2D5AB00EFCF
      A400986B660000000000000000000000000000000000000000006768FE006768
      D9009A98C100E6DECC00D9D0CF00BEBDD600EFE9D900A9A7C3005656BF004B4B
      F700A5A3FC00FFFAF500FFF7EF0041AB3100FFF1E300FFEDDA00FEE9D300FEE6
      CB0090C3C4001174DA002840DF00061FB400C2938400FEFBF800FCFAFB004354
      D5002659FF00285AFF00416BFF00EBF1F8004592330057929600EAEAFB007E9B
      FF000236FF00093DFF000026F2007D70AC00FFE0AB00BE928300000000000000
      0000000000000000000000000000000000003A7415003A741500479D390048A7
      410047A03C0047A43E0047BA5C0049A8340047960700489A0B0048990D004899
      0900499B0B0048970E0046930A0049A9380043BF720044C1770044BD6B0047B9
      5900469934003B76160040832200000000000000000000000000C2968500FBF8
      F700FFFFFF00FFFEFC0099330000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE005274FC000335FB000C35EB00E4CFB900F2D7B000F0D2
      A800986B6600000000000000000000000000000000006363FF007373E200BCBB
      CD00FFFBD500FADBAD00F1C59300EDBB8A00F9D9AF00FFFFF200D5D6D6005756
      BD005151FE00D9D9FC00FFFAF50041AB3100FFF5EB00FFF1E300FEEFDC00FEEA
      D400FEE6CB008C678100333BD90000000000C5988600FBF8F700FFFFFF00A5A7
      E000163BE3003064FF002B5CFF0088A3FF008EBE9700CDE5C700D5D9F7003460
      FF001246FF000C3FFF001C33C900DEBFB000FFDDB400BD928400000000000000
      0000000000000000000000000000000000003A7415004082210048A33F0047A2
      3D0048B3500044BF6F0043C1790048B54C0046920B0048990F00489A0D004899
      0D004899080048990D0048990D0046940C0047BB610044C0740048A742003B76
      16003C7717000000000000000000000000000000000000000000C6998600FBF8
      F700FFFFFF00FFFFFF0099330000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00EEF1FE00325BFC000335FB003054EF00F4DAB600F1D5
      AE00986B6600000000000000000000000000000000007F7FF9009393D300FFFF
      DF00FFF9D000FCF3C900FBEABF00F7D4A300F2C89400F7DAAB00FFFCE300A29E
      BD005150DC008E8EFF00FFFDFC0041AB3100FFF9F100FFF6EB00FFF3E300FEEF
      DC00433E3800000000001F001F0000000000CB9D8900FBF8F700FFFFFF00FFFF
      FE00777ACF001234DC003064FF002A5FFF005C82FF007E9BFF002659FF001E53
      FF001549FE00051EC400AC97B200FFEBBF00FFDDB400BD938600000000000000
      0000000000000000000000000000000000003A7415004083220048B14D0045BD
      670043C0750044BF720044BE6F0044C0730049B045004693100047950B004797
      0C00489A0D00489A0B00489B0B0047960F00479E36003E7E1C003C7717000000
      0000000000000000000000000000000000000000000000000000CA9C8800FBF8
      F700FFFFFF00FFFFFF0099330000993300009933000099330000993300009933
      00009933000099330000993300007D332F000C35EB000335FB000335FB00D9C4
      A700986B66000000000000000000000000005252FF007D7CEC00D4D2DD00FFFF
      E500FFFFDB00FFFFDB00FFFFDB00FFFAD100FFE4B500F8C68E00F8CB9B00ECE3
      D4005858BB006461FE00FEEDF70051B04100FEEAF000FEE8EA00FEE5E500FEE1
      DF006C5E5C00000000006000600000000000CDA08900FCF9F700FFFFFF00FFFF
      FF00FFFEFC009397DB002744DB002048EB001646F5000E41F6001646F500173C
      E3003B4AC800BBA9BF00FFEACA00FFE3C300FFE0BE00BE958900000000000000
      0000000000000000000000000000000000003A74150045942E0043C0760043C1
      790044BE700044BE6F0044BF700045BF710043C0750046BC630049AE3E00489F
      2500489B1B00489B1A00458D14003A710C003C77170000000000000000000000
      0000000000000000000000000000000000000000000000000000CEA08900FCF9
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FEF9F500FCF5EF00FBF2
      E900FAF0E300F9ECDD00F8E9D700F8E6D100F6E4CC000335FB000335FB000335
      FB000335FB000000000000000000000000006363FF008483E800D9E3EB00FDFF
      FF00FFFFE100FFFFDD00C0C0A90055565500555655005556550055565500D3CB
      D2006667B9005048E700D8730200D8730200D8730200D8730200D8730200D873
      0200D8740200CA6501000000000000000000D2A38B00FCF9F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFE00EAEAFB00B7B6E2008488D7008488D7008E8ECF00C1B6
      D000F6E5D600FFF2D500FEE7CD00FDE3C800FCDFC200BE958900000000000000
      000000000000000000000000000000000000000000003E7D1D003E7D1D0048B2
      4E0044C0770044C0740044BF710044BE6F0044BF700044BF730042C1790043C1
      790047BB5E00448E2D003C771700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D2A38A00FCF9
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFDFC00FDFAF500FCF6
      EF00FAF2E900FAEFE200FAEDDE00FBEEDB00E7DBC900C8BDAF000335FB000335
      FB000335FB000335FB000335FB00000000006363FF008988E900CADBEA00FBFE
      FF00FFFFF800FFFFE100C5C5AE005556550051524D009F977F00E1B68800BCB8
      CE006365BE005048E700CA650100CA650100CA650100CA650100CA650100CA65
      0100CA650100000000000000000000000000D7A78C00FCF9F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFF900FFFFF300FFFB
      E400BE908500BE908500BF918600BE908500BE908500AF817500000000000000
      000000000000000000000000000000000000000000000000000000000000448E
      2B00448E2B0046BC620043C0770044BF720044BE700043C0760045BD6B00469A
      36003C7717000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D7A78C00FCF9
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FDF9
      F400FCF5EE00FCF5EB00EEDDD100B4817600B4817600B4817600B4817600B481
      76000335FB000335FB000335FB00000000004F4FFF008887EF00DDD5E400FFFF
      FF00FFFFFF00FFFFF700FFFFE200E0E0C10071726700B6A98C00FFDBA800ECDF
      C8005B5BC9004847FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCAC8E00FCF9F800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FFFEF600FDF4
      E900BA8C8100CE9F7E00D7A27400D99C5F00DD984C00C1865800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000448E2B00479C370045BF6E0044BF710048A742003C7717000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DAAB8D00FCF9
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFD
      FB00FDF9F400FFFBF300E3CEC600B4817600E3B58500E5AD6A00E9A65400EFA0
      3900B8828500000000000000000000000000000000008484FC00A5A0DD00FFFF
      F700FFFFFF00FFFFFF00FFFFFD00FFFFF200EDEDD400716F6200CCC1A100A6A2
      CA005353EB004847FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEAD8E00FDFAF800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FBF5
      F000BF928700E6BB8B00F6C07600F8B35200C186580000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003E7C1B004082220000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEAD8E00FDFA
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFDFC00FFFEF900E5D1CB00B4817600EFC48D00F3BB6D00F8B45000B882
      850000000000000000000000000000000000000000005C5CFF008382F100C9C0
      DA00FFFFF700FFFFFF00FDFFFF00FBFEFF00FFFFFF00FEFDDA00BFBEC4005C5D
      DE004847FF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEAD8E00FDFAF800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF8
      F700BF938800E5B98900F2BE7500C18658000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEAD8E00FDFA
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E5D4D000B4817600EFC38C00F3BA6C00B88285000000
      00000000000000000000000000000000000000000000000000006161FF007777
      F100A9A3DE00EAE5E600EAF2F000D7EAF300EFEEF200ACACE1005D5DE7004949
      FD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEAD8E00FBF5F000FEFBFA00FDFA
      F800FDFAF800FCF9F800FCF9F800FCF9F700FCF9F700FBF8F700FCF9F800F7F1
      F000BF928700E5B98900C1865800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEAD8E00FFFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E9DBD900B4817600F1C58B00B8828500000000000000
      0000000000000000000000000000000000000000000000000000000000004C4C
      FF005D5DFB006664EE007C79E8007B79E9005F5FEE004848F9003D3DFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCA88700DEAD8E00DEAD8E00DEAD
      8E00DCAC8E00D9A98C00D4A58B00D2A38B00CB9D8900C89B8700C4978600BE91
      8300BA897C00C186580000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DAA48200DAA4
      8200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA4
      8200DAA48200DAA48200DAA48200B4817600B882850000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003131FF002F2FFF002B2BFF002B2BFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000009721300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000824B4B00824B4B008C4B4B00914B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000092635D008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      590080504B00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000972130009721300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000824B4B00824B4B00894B4B009C4B4C00B64B4C00BD4B4C009F4B
      4C004E1E1F000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093655E00EFD3
      B400F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB9700EFC79100EEC58900EBC1
      8200EBC08000EBC08000EBC08000EBC08000EBC08000EBC08000EDC18000EABF
      7F0080504B00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00868484008684840086848400FF00FF00FF00FF00FF00
      FF00FF00FF008684840086848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF0093655E00BA8E7E00BA8E7E00BB8B
      7900BB8C7900BB8A7500BB8A7500BB887000BC887000BC897200C48C7700B984
      6F00097213002EBC550009721300AF816500C28278009E676900000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B009A4D4E00AF4E4F00C14E4F00C04D4E00BF4C4D00BF4C4D009F4B
      4C004E1E1F00994B4B00824B4B00824B4B00824B4B00824B4B00824B4B00824B
      4B00824B4B00824B4B000000000000000000000000000000000093655F00EED4
      B800F4DABB00F2D5B100F0D1AA00EFCFA300EECB9D00EDC79600EDC58F00EBC1
      8800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0086848400C1BFBF00ABA8A900A4A1A20086848400868484009996
      970086848400E5E4E400DBDADA00868484008684840086848400FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF0098696500F7D9B700FFE1B900FFD9
      AF00FFD5A700FFD19E00FFD19E00FFD39100FFD48B00FFD48B00EDBF82000972
      130021A53F004DE5810009731400097414000974140009741400000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00C5545500C9545500C7535400C6525300C5515200C4505100C24F5000A04C
      4D004E1E1F00FE8B8C00FC929300FB9A9C00FAA3A400F8AAAB00F7B1B100F7B5
      B600F7B5B600824B4B000000000000000000000000000000000093655F00EED7
      C000F6E0C100F2D9B800F2D4B100F0D1AA00EFCFA400EECB9D00EDC79600EDC5
      8F00EBC18900EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF0086848400DFDEDE00D3D1D100B5B3B300B5B3B300B5B3B3009B999A007776
      7600CBCBCB00D9D9D900DADADA00DCDCDC00DDDDDD00D6D5D500868484008684
      840086848400FF00FF00FF00FF00FF00FF0098696500F7D9BC00FFE0BE00FEDA
      B500FFD9AF00FFDDA700F4C79C00B79497008974A1008B767E000972130029B7
      50004BE07D0048DC770046D8740031C25B0023A6400017892800036C0A00015D
      040000000000000000000000000000000000000000000000000000000000824B
      4B00CE585900CC575800CB565700CA555600C9545500C7535400C6525300A34E
      4F004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B000000000000000000000000000000000093655F00EFDA
      C500F7E2C700F3DCBF00F2D8B70000700000F0D1AA00EFCEA300B1B874000070
      00000070000000700000ADAD6000E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B00000000000000000000000000FF00FF00FF00FF00FF00FF008684
      8400E1E0E000E7E6E600CECDCD00B5B3B300B5B3B300B5B3B3007C7B7B000000
      0000000000002828280078787800BBBBBB00D6D6D600D6D6D600D6D6D600D6D6
      D600CFCECE0086848400868484008684840098696500F8DCC400FFE5C700FFE0
      BE00FFE4B400977E99001F27A700001BDD000019D3000972130030BF50004DE2
      7F0048DC770048D9760045D770003FD1660037CC5D0032C6550027B541000F80
      1A00015D0400000000000000000000000000000000000000000000000000824B
      4B00D15B5C00D05A5B00CF595A00CE585900CC575800CB565700CA555600A550
      50004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B000000000000000000000000000000000093656000F0DE
      CC00F8E6CF00F6E0C600F3DCBD000070000004750300B2BD7F0000700000B1B8
      7400EDC79600B0B46B0000700000ADAF6200E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B00000000000000000000000000FF00FF00FF00FF0086848400DDDD
      DD00DEDDDD00DADADA00A3A1A100999797009997970099979700868484002626
      2600131313000000000000000000000000002828280078787800BBBBBB00D6D6
      D600D6D6D600C7C6C600C7C6C6008684840098696500F7E0CA00FFE5C700FFEA
      C1008974A1000111C700001CF700001AFF002659A400097213003FD46C004BE0
      7D0047DA770045D7700041D36A003BCE630032C655002DC04A0028BB42001FB0
      35000D841800015D04000000000000000000000000000000000000000000824B
      4B00D55E5F00D55E5F00D45D5E00D35C5D00D15B5C00D05A5B00CF595A00A651
      52004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B000000000000000000000000000000000095666000F2E2
      D300FAEAD700F6E3CE00F4DEC500007000000070000000700000B2BD7F00EFCE
      A300EECB9D00EDC79700B0B46B0000700000E9BD8100E9BD7F00EABF7F00E7BC
      7E0080504B00000000000000000000000000FF00FF0086848400D6D6D600D6D6
      D600D3D3D300A4A3A300C8C5C500C6C4C400B5B3B300B5B3B300B3B1B100AEAC
      AC00A9A6A7009A9898006D6B6B00434242001313130000000000000000002828
      28007E7E7E009996970086848400FF00FF0098696500F8E3D100FFF7D700A698
      B6000115CE000021FF000024FF005372FF00E6EBFF00B3CFB6000972130039CC
      620049DD790041D36A0030BB4D001F9D34001B962D00189729001AA02D001AAA
      2D0015A9270008790F000000000000000000000000000000000000000000824B
      4B00DA636400D9626300D8606200D75F6000D55E5F00D45D5E00D35C5D00A953
      54004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B000000000000000000000000000000000098696300F2E6
      DA00FAEEDE00F7E7D400F6E2CB0000700000007000000070000000700000F0D1
      A900EFCEA300EECB9D00EDC7960000700000EBC18900E9BD8100EABF7F00E7BC
      7E0080504B00000000000000000000000000FF00FF0086848400D6D6D600D2D2
      D200A4A3A300E0DEDE00F9F8F800F8F7F700F5F4F400E7E6E600D6D4D400C6C5
      C500B8B6B600B5B3B300B5B3B300B2AFB000A9A6A700827F8000393839000A09
      09002D2D2D00AEACAC0086848400FF00FF0098696500FBEAD800FBEAD8003642
      C0000020FB00001FFF003C5EFF00F6F7FF00D4DEFF00BDC6FF00B3CFB6000972
      130030BB4D003FD76900097213007A864B009E8E5A0043602F00016204000674
      0E000D971A000A9314000363060000000000000000000000000000000000824B
      4B00DE666700DD656600DC646500DA636400D9626300D8606200D75F6000AB55
      55004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B00000000000000000000000000000000009E6E6400F4EA
      E100FBF2E600F8EADC00F7E6D300007000000070000000700000007000000070
      0000F0D1AA00EFCEA400EDCB9C00EDC79600EBC58F00EBC18800EABF8200E7BB
      7E0080504B00000000000000000000000000FF00FF0086848400D2D2D200A4A3
      A300EDECEC00F9F8F800F9F8F800F8F7F700F5F4F400F2F1F100EFEFEF00EDEC
      EC00EAE9E900DEDDDD00D0CFCF00C0BFBF00B5B3B300B5B3B300AEACAC009A98
      980086848400B3B1B10086848400FF00FF009D6E6700FFF3E200CFBFCC000A20
      CA00062FFF000023FF003C5EFF006781FF007D96FF00667BFF00C2CBFF00527B
      B800097213002EBD3D00097213008C777F00E7AC850099666600000000000000
      000004670800088E1100046E090000000000000000000000000000000000824B
      4B00E2696A00E1686900E0676800DE666700E06D6E00E6909100DC646500AC56
      57004E1E1F0058A55B001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000A3726600F6EE
      E900FCF6ED00F8EFE300F7EADA00F7E6D300F6E2CC00F4DEC500F3DCBD00F2D8
      B600F0D5B000F0D1AA00EFCEA300EECA9C00EDC79500EBC48E00EBC28800E7BC
      800080504B00000000000000000000000000FF00FF0086848400A4A3A300F3F2
      F200F9F8F800F9F8F800F9F8F800F8F7F700DFDDDE009D949600AAA2A400CFCD
      CD00E5E4E400E7E7E700E4E4E400E1E1E100DCDCDC00D0CFCF00C3C1C100B5B3
      B300B0AEAE008684840086848400FF00FF00A5756B00FFFFEE006F6DBC00011C
      DC000F39FF000C34FF00032BFF00042AFF009EB2FF00D9E1FF00F3F6FF003656
      FF00011FDD0009721300097213005C5B7F00E0A47F0099666600000000000000
      00000000000004700A0005750B0000000000000000000000000000000000824B
      4B00E76D6E00E66C6D00E56B6C00E36A6B00EEA6A700FFFFFF00EB9C9C00AF58
      59004E1E1F00EECEAF00B7EBAA005ED377005ED3770045CA670045CA670045CA
      6700F7B5B600824B4B0000000000000000000000000000000000A7756800F8F3
      F000FEFBF600FBF3EB00F8EEE300F8EBDC00F7E7D300F6E2CC00F4E0C5000070
      000000700000007000000070000000700000EDCB9C00EDC79500EDC58F00E9BF
      870080504B00000000000000000000000000FF00FF0086848400D9D7D800F9F8
      F800F9F8F800F9F8F800F9F8F800DAD7D800C0BEBF00BFBDBD00B2ADAD009B92
      94008E838500A0989900BDB8B900D4D3D300DFDFDF00DCDCDC00D9D9D900D5D4
      D400CAC9C900B9B7B70086848400FF00FF00A5756B00FFFFF3006F6DBC000320
      DD001640FF000E37FF00133CFF00BDCBFF00FFFFFF00F6F7FF005778FF000023
      FF000023FF000026EE00097213005C5B7F00E0A47F0093656300000000000000
      00000000000003640600036A090000000000000000000000000000000000824B
      4B00EB707200EA6F7000E96E6F00E76D6E00F2A9AA00FFFFFF00EB959600B15A
      5A004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300D9F6BD00D9F6
      BD00F7B5B600824B4B0000000000000000000000000000000000AC796900FAF6
      F400FFFFFE00FEF8F300FBF2EA0000700000F8EBDA00F7E6D300F7E2CC00F6E0
      C50000700000007000000070000000700000EFCEA300EECB9C00EEC99600EAC1
      8E0080504B00000000000000000000000000FF00FF00FF00FF00868484008684
      8400D9D7D800F1F0F000C0B7B80085787A008F8486009B919300B0ABAC00BEBC
      BC00C3C1C100BDBABB00ADA7A800999091009C939500A9A3A400CDCDCD00D7D7
      D700D6D6D600CECECE0086848400FF00FF00AB7A6C00FFFEF8009796D5000B25
      D4001A47FF000E37FF005576FF00E6EBFF00CCD8FF006382FF00001FFF00032B
      FF000128FF000026FF000019EB0070639800E6AC7F0091636000000000000000
      000000000000000000000260050000000000000000000000000000000000824B
      4B00EF747500EE737400ED727300EB707200EA6F7000EF909100E76D6E00B25B
      5C004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000B17E6B00FAF6
      F400FFFFFF00FFFEFB00FEF7F00000700000BAD4AA00F8EADA00F7E7D300F6E2
      CB00B7C79200007000000070000000700000F0D1A900EFCEA100EECB9C00EBC5
      920080504B00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF008684840086848400CC9A9900C0A18C0095796C00806F71007F6F72008779
      7C0087797C00A0989900B4AFB000C0BEBF00C3C1C100B7B3B400D6D5D600D7D7
      D700C7C6C60086848400FF00FF00FF00FF00B17E6B00FEFAF600FBF7F6002338
      D0001843FF00133FFF006382FF00D4DEFF00A1B5FF009EB2FF00A3B7FF002348
      FF00032BFF00032BFF00001AD400B7949700E6AC7F0092636000000000000000
      00000000000000000000025F050000000000000000000000000000000000824B
      4B00F3777800F3777800F2767700F0757600EF747500EE737400ED727300B55D
      5D004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000B6816C00FAF6
      F400FFFFFF00FFFFFF00FFFCFB00BCDAB40000700000B8D3AA00F8EBDC00B7CC
      9D0000700000B7C792000475030000700000F2D4AF00F0D1A900F0CFA300EDC9
      990080504B00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00CC9A9900FFDEBD00FFDBB500FFD7AD00DFB89400B591
      770094807A007B6B6E0080717400897C7F00A49D9E00D9D8D800DADADA00B8B7
      B70086848400FF00FF00FF00FF00FF00FF00B9846F00FAF6F400FFFFFF008487
      D1000C2DE300234FFF00234FFF00BDCBFF00FFFFFF00FFFFFF00A3B7FF001139
      FF000C37FF000020E90035359D00FFD5A700D5A68A0091636000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F87B7D00F77A7B00F6797A00F4787900F3777800F2767700F0757600B75F
      5F004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000BB846E00FAF6
      F400FFFFFF00FFFFFF00FFFFFF00FFFEFB00BCDAB40000700000007000000070
      0000B7CC9D00F6E2CB00F6DEC40000700000F2D8B600F0D4AF00EFD0A700CEB4
      910080504B00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00CC9A9900FFE2C300FFDEBB00FFDAB400FFD6AC00FFD3
      A400FFCF9D00FFCD9900FFCE9C00CC9A99008684840086848400868484008684
      8400FF00FF00FF00FF00FF00FF00FF00FF00BC877000FAF6F400FFFFFF00F0EE
      F4003541C0001035EE001A47FF002854FF0091AAFF007B96FF001843FF00113E
      FF00042BF6002430B100CEACA600FFE4B400D5A68A0091625E00000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00FC7F8000FB7E7F00FA7D7E00F87B7D00F77A7B00F6797A00F4787900B860
      62004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000C0896F00FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2EA00FAEE
      E200F8EBDA00F7E6D300F6E2CB00F6DEC400F3DCBD00E5CEAF00C4B09600A192
      7F0080504B00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00CC9A9900FFE5C900FFE1C200FFDDBA00FFD9B200FFD6
      AB00FFD2A300FFCE9C00FFCE9C00CC9A9900FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00C28C7400FAF6F400FFFFFF00FFFF
      FF00EAE7F3005F67CC002439D0001035EE000E35F3000C31F0000C31F0001028
      CF00494DB500E5CEBC00FFEAC200FFE1B900D0AA960091625E00000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00FF818200FF818200FE808100FC7F8000FC7F8000FB7E7F00FA7D7E00BB63
      63004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000C58C7000FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FCF8F200FBF3
      EA00F8EEE200F8EAD900F8E7D400FAE9D000E0D0BA00B8AB9A00A79C8B00A497
      860080504B00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00CC9A9900FFEBD700FFE8D000FFE4C800FFE0C000FFDDB900FFD9
      B100FFD5AA00FFD1A200CC9A9900FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00C9907500FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DCD9EE009796D5006C70CB006C70CB008883C200CFC0
      CC00FFF2D400FFF2D400FFE5C900FFEAC200D0AA960091605E00000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00FF818200FF818200FF818200FF818200FF818200FE808100FE808100BD65
      65004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000CB917300FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FCF7
      F000FBF2E900FBF2E500E9D3C400A0675B00A0675B00A0675B00A0675B00A067
      5B00A0675B00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00CC9A9900FFEFDE00FFEBD600FFE7CE00FFE3C700FFE0BF00FFDC
      B800FFD8B000FFD4A800CC9A9900FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00C9907500FBF7F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFB00FFFFF300FFFFEE00E5CE
      BC00CB9F8F00C6978800C6988800C6988800B683730093655E00000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F77E7F00FF818200FF818200FF818200FF818200FF818200FF818200BF66
      66004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000CF967400FBF7
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFC
      FA00FCF7F000FFFAEF00DAC0B600A0675B00DAA16B00DD984F00E2903A00EA89
      2300A5686B00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00CC9A9900FFF2E400FFEEDC00FFEAD500FFE7CD00FFE3C600FFDF
      BE00FFDBB600F9D0AC00CC9A9900FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00D3997700FBF7F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEF800FFFFFB00CCAB
      A400A4695800CA906600CB8A5400D0823900D082390000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B00AF5E5F00D56F7000FF818200FF818200FF818200FF818200BF66
      66004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCFB00FFFEF700DDC4BC00A0675B00EAB47400EFA95200F6A03600A568
      6B0000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00CC9A9900FFF9F200FFF5EA00FFF1E300FFEDDB00FFEAD400FFE6CC00FFE2
      C400FFDEBD00CC9A9900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00D59A7700FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCAB
      A400B2796300EEB67000EFA95300EF9C39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000824B4B00824B4B0091515200B6626300EE7A7B00FF818200BF66
      66004E1E1F00914B4B00824B4B00824B4B00824B4B00824B4B00824B4B00824B
      4B00824B4B00824B4B0000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DDC7C200A0675B00EAB27300EFA75100A5686B000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00CC9A
      9900FFFBF600FFFBF600FFF8F100FFF4E900FFF0E200FFEDDA00FFE9D200FFE5
      CB00F5D4BB00CC9A9900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00D59A7700FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEAF
      A900B0766200EEB67000EFA95300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000824B4B00824B4B00985555009F58
      58004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987500FFFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E2D0CE00A0675B00EDB57200A5686B00000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00CC9A
      9900CC9A9900CC9A9900CC9A9900FFF7F000FFF4E800FFF0E000FFECD900FCE4
      CE00CC9A9900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00D5997700FAF2ED00FEFAF800FCF8
      F600FCF8F600FBF7F600FBF7F600FAF6F400FAF6F400FAF6F400FFFFFF00CCAB
      A400B2796300DAA56E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800A0675B00A5686B0000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00CC9A9900CC9A9900CC9A9900CC9A9900CC9A
      9900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00D3936F00D5997700D59A7700D59A
      7700D3997700CE957600C9907500C28C7400C1887200BC877000B6837300A974
      6700B17E6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DDBAA900D0B5
      AA00CCB0A400DCB7A60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFD6B500F7DEB500F7D6AD00F7D6A500F7CE9C00EFCE9400EFC69400EFC6
      8C00EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFC6
      8400EFBD7B009C6B6300000000000000000093655F00A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A46769000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B700000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0BDAF00CCC1BD00BCB6
      B600ADA5A500AF9F9A00D5B2A400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFD6BD00F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC69400EFC6
      8C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093655F00EED4B800F2DABC00F2D5
      B100EDCEA700E6C79D00E1C09300DEBB8C00E1BB8800E5BC8400E7BC8100E7BC
      7E00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC7E009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000005B7000005B7000005B700000000000000000000000000000000000000
      000000000000000000000000000000000000E0BDAF00DCD1D000D1CFD000C9C6
      C700BFB8BA00ADA5A500AD9D9900D4B4A4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFD6C600F7E7C600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC6
      9400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093655F00ECD5C200F4DEC000F0D8
      B700E9CCAB00D9BD9900C9AD8900C1A57F00C6A67E00D1AF7F00DAB47F00E1B7
      7D00E3BA7D00E7BC7E00E9BD7F00E9BD7F00EABF7F00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000005
      B7000005B7000005B70000000000000000000000000000000000000000000000
      0000000000000000000000000000E1BFAF00E6DCDA00E2E2E300DCDADD00D0BC
      B500C7B2AB00BFBABB00AFA6A700AC9D9800D5B4A50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFDEC600F7E7C600F7DEBD00F7DEB500F7D6B500F7D6AD00EFCEA500EFCE
      9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093655F00EFDAC500F6E1C600F2DA
      BC00E6CEAF00222123003E3935008C7960009D876700AA8F6B00B89A6F00C7A4
      7400D1AB7500DEB57900E5BB7D00E7BC7E00EABF7F00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000005B70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000005B7000000000000000000000000000000000000000000000000000000
      00000000000000000000E2C1B100EDE5E200EEEFF300E9E9EB00D0917400C052
      2300C0522300C2816400BFB8BA00AFA7A900AD9D9900D3B1A300000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      6300F7DECE00FFE7CE00F7E7C600F7DEBD00F7DEB500F7D6B500EFCEA500DEBD
      9400D6B58C00D6B58400DEB58400E7BD8400EFBD8400EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093656000F0DECB00F7E5CE00F4DE
      C500EAD4B6003C3835001F1F2100182A330034434400836F56008E7759009E83
      5F00B2926800C7A36F00D9B17600E3BA7D00E7BC7E00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000005B7000005
      B700000000000000000000000000000000000000000000000000000000000000
      000000000000E2C0B000F2EBE900F4F8FB00F3F7FB00D3906F00BA400F00BA41
      1100BB411200BB411100C1795800C0BABA00AFA7A900A99A9700D3B1A3000000
      0000000000000000000000000000000000000000000000000000000000009463
      6300F7E7D600FFEFD600F7E7CE00F7DEC600F7DEBD00F7DEBD00DEC6A500BDA5
      8400AD947300A58C6B00BD9C7300DEB58400EFC68C00EFBD8400EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000095666000F2E2D300FAEAD700F6E3
      CE00F0DAC200AC9D8A00113B4E0004689A00064F75000C3C52003A4948007764
      4C0089725300A4865F00BC996900D1AB7300E1B77900E3BA7B009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000005
      B7000005B7000005B7000005B7000005B7000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E1BDAD00F4EDE900FBFEFF00F8FEFF00D99F8200C2562700D9906D00DD9C
      7B00DD9C7B00D9906D00C4542400C1765300BFBABB00AFA7A900A99A9700D3B1
      A300000000000000000000000000000000000000000000000000000000009C6B
      6300F7E7DE00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DEBD00004A0000004A
      0000004A0000004A0000A58C6B00D6B58400EFC68C00EFC68C00EFBD8400EFBD
      7B00E7BD7B009C6B6300000000000000000098696300F2E6DA00FAEEDE00F7E7
      D400F4E1CA00EBD8BD001A3E4D00036A9D00056798001B506E002A3440004135
      38006A5542007E694C00987D5800B2916300CCA66E00DAB177009D6D5F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000006F6000005B7000005B7000005B7000005B70000000000000000000000
      000000000000000000000005B7000005B7000005B7000005B700000000000000
      000000000000000000000000000000000000000000000000000000000000E1BD
      AD00F6EDE900FEFFFF00FEFFFF00DEA68B00BC491900BC491900DD9D7E00FFFF
      FF00FFFFFF00DA977600BD4A1A00BF491800C27B5B00BFB8BA00B0A9AA00AB9C
      9800D3B1A3000000000000000000000000000000000000000000000000009C6B
      6300F7EFE700FFF7E700FFEFDE00F7E7CE00E7D6BD00DECEB500004A00000894
      100000940800004A0000A58C6B00C6AD8400D6B58400DEB58400E7BD8400EFBD
      8400E7BD7B009C6B630000000000000000009E6E6400F4EAE100FBF2E600F8EB
      DC00F7E6D300F3E0CA0074868600045983003150650095606000AA6E6E00965D
      5D00643B3A0065524000766347008E745100A9895D00C09C690096695A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B7000005B7000005B700000000000000
      00000005B7000005B7000005B7000005B7000005B70000000000000000000000
      0000000000000000000000000000000000000000000000000000E1BFAF00F8F0
      EE00FFFFFF00FFFFFF00E0A58800BD4A1A00BD4B1C00BC471600D17F5600FFFF
      FF00FFFFFF00CF784F00BC471800BF4E1E00BF4A1800C1755200C0B7B700B0A9
      AA00A99A9700CEAFA1000000000000000000000000000000000000000000A573
      6300F7EFEF00FFF7EF00FFEFE700E7DECE00C6B5A500AD9C8C00004A0000089C
      1800089C1000004A000094846B00A58C6B00A58C6B00BD9C7300DEB58400EFC6
      8C00E7BD84009C6B63000000000000000000A3726600F6EEE900FCF6ED00F8EE
      E300F7EADA00F7E6D300F0DECB000B4159008C5B5B00CC8E8E00BB7E7E00AA6E
      6E00965D5D00643B3A0064513E006F5D4300826C4B009A7E5500865D51000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000005B7000005B7000005
      B7000005B7000005B7000005B7000005B7000000000000000000000000000000
      00000000000000000000000000000000000000000000E1BCAC00F8EFEB00FFFF
      FF00FFFFFF00E7B79D00C5592600C4542400C0512200BC471600D3815900FFFF
      FF00FFFFFF00D07A5200BC471800BF4E1F00BF4E1E00BF491800C1724E00BDB5
      B500AFA7A900A6999700CEAFA10000000000000000000000000000000000A573
      6B00FFF7F700FFFFF700FFF7EF00004A0000004A0000004A0000004A000010A5
      210008A51800004A0000004A0000004A0000004A0000A58C6B00D6B58400EFC6
      8C00EFBD84009C6B63000000000000000000A7756800F8F3F000FEFBF600FBF3
      EA00F8EEE300F8EBDC00F6E6D1004E6C76009C696900DC9D9D00CB8C8C00BA7D
      7D00A96D6D00915959005A35350062503D006A5841007B664800735046000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000006F6000005
      B7000006F6000005B7000005B700000000000000000000000000000000000000
      000000000000000000000000000000000000E0BAA900F4E9E200FFFFFF00FFFF
      FF00EECAB000CF703A00CB683300C9643000C65C2A00C04D1C00D4825A00FFFF
      FF00FFFFFF00D07A5200BC471800BF4E1F00BF4E1F00BF4E1E00BF471700C178
      5700BFB8BA00AFA6A500AA9A9700D8B5A500000000000000000000000000AD7B
      6B00FFF7F700FFFFFF00FFFFF700004A000021C6420021C6420018BD390018B5
      310010AD290010A5210008A51800089C1000004A0000AD947300D6B58C00EFCE
      9400EFC68C00A57363000000000000000000AC796900FAF6F400FFFFFE00FDF8
      F300FBF2E900F8EEE300F8EBDA00F4E3D0007B504F00E2A4A400DC9D9D00CB8C
      8C00BA7D7D00A96D6D008C5757005A353500604F3D006C59410062443C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000006F6000005B70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7CABC00FFFFFF00FFFFFF00FEFB
      F800DC935D00D47A4100D1774000CF703A00CC693500C5592600D78A6300FFFF
      FF00FFFFFF00D07A5200BC471800BF4E1F00BF4E1F00BF4E1F00BF4C1D00C050
      2100C6B0A700BFBABB00AFA6A500CBAFA400000000000000000000000000B57B
      6B00FFF7F700FFFFFF00FFFFFF00004A000029D6520029CE4A0021C6420018BD
      390018B5310010B5290010AD210010A52100004A0000BDA58400DEBD9400EFCE
      9C00EFC69400A57363000000000000000000B17E6B00FAF6F400FFFFFF00FFFE
      FB00FEF7F000FBF3EA00FAEEE300F8EAD900E1CCBB007B504F00E2A3A300DC9D
      9D00CA8B8B00B87B7B00A76C6C008B5656005A35350066523F00583F37000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000006F6000005
      B7000005B7000006F6000006F600000000000000000000000000000000000000
      000000000000000000000000000000000000E7C9BC00FFFFFF00FFFFFF00FEFB
      F800E2A06900DA894B00D8844A00D47D4400D1763F00CB673000DA926A00FFFF
      FF00FFFFFF00D17D5400BC471800BF4E1F00BF4E1F00BF4E1F00BD4A1A00C056
      2800D1C0BB00C9C6C700BDB6B600D3B5A900000000000000000000000000B584
      6B00FFF7F700FFFFFF00FFFFFF00004A0000004A0000004A0000004A000021CE
      4A0021C64200004A0000004A0000004A0000004A0000E7C6A500EFCEA500F7CE
      A500EFCE9C009C7363000000000000000000B6816C00FAF6F400FFFFFF00FFFF
      FF00FFFCFB00FEF7F200FBF3EA00F8EEE300F8EBDC00E1CCBB0073484700E1A3
      A300DA9C9C00C98B8B00B87B7B00A76C6C008B5656005D383600533C35000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000006F6000005B7000006
      F6000006F6000006F6000005B7000006F6000000000000000000000000000000
      000000000000000000000000000000000000E0BAA900F6E9E300FFFFFF00FFFF
      FF00F4DCC200E19A5C00DD8F5200DA894F00D7824800D0723900E1A37B00FFFF
      FF00FFFFFF00D5875E00C04F1D00C0501F00BF4E1F00BD4B1C00BD4A1A00D4A0
      8800DCDDE000D1CFD000CFC0BC00E0BAA900000000000000000000000000BD84
      6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700004A000029D6
      5A0029CE5200004A0000AD9C8C00DECEB500F7DEBD00F7DEB500F7D6AD00EFD6
      A500CEB594008C6B63000000000000000000BB846E00FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFEFB00FEF7F200FBF3EA00FAEEE300F8EAD900BBA196007348
      4700E1A1A100DA9A9A00C98B8B00B77A7A00A66B6B008B5555005A3535000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000006F6000006F6000006F6000005B7000006F6000000
      0000000000000006F6000006F6000006F6000006F60000000000000000000000
      00000000000000000000000000000000000000000000E1BCAC00F8EFEA00FFFF
      FF00FFFFFF00F4DCC000E29E5F00DE955600DA8E5100DC8E5600EEC6A900F4DE
      CE00F4DDCC00D7865800C75C2800C55A2800C0501F00BD4B1C00D89F8400E9ED
      F000E2E2E300DCCFCB00E0BBAB0000000000000000000000000000000000C68C
      6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004A000031DE
      630031DE5A00004A0000C6B5A500E7D6BD00F7DEC600F7DEBD00E7CEAD00C6B5
      9400A5947B00846363000000000000000000C0896F00FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2E900FAEEE300F8EBDA00BBA1
      960073484700E1A1A100D99A9A00C78A8A00B77A7A00A66B6B008B5555005A35
      3500000000000000000000000000000000000000000000000000000000000000
      0000000000000006F6000006F6000005B7000006F6000006F600000000000000
      000000000000000000000006F6000006F6000006F6000006F600000000000000
      0000000000000000000000000000000000000000000000000000E1BCAC00F6EB
      E500FFFFFF00FFFFFF00F7E2CA00E6A66700E19A5A00E0985C00DD905500D988
      4E00D5804700D0743C00CE6E3800CA653000C65C2800E0AF9700F2F7FB00EDEF
      F200E5D9D500E0BBAB000000000000000000000000000000000000000000C68C
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004A0000004A
      0000004A0000004A0000E7DECE00F7E7CE00FFEFD600E7D6BD00BDAD9C00A59C
      8C00A5948400846B63000000000000000000C58C7000FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FDF8F300FBF3EA00F8EEE300F8EA
      D900BCA1960091606000EBAAAA00D9999900C78A8A00B6797900804E4E004148
      5500354756000000000000000000000000000000000000000000000000000000
      00000006F6000006F6000006F6000006F6000006F60000000000000000000000
      0000000000000000000000000000000000000006F6000006F6000006F6000000
      000000000000000000000000000000000000000000000000000000000000E0BB
      AB00F4E9E200FFFFFF00FFFFFF00F8E5CE00E9AC6D00E29D5B00E3A56D00F7E3
      D300F6DECE00DA8C5700D1763D00CF6F3700E7B79D00F8FEFF00F4F8FB00EDE2
      DE00E0BCAC00000000000000000000000000000000000000000000000000CE94
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7E700EFD6C6009C635A009C635A0094635A009463
      5A0094635A009C6B5A000000000000000000CB917300FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FCF7F000FBF2E900FBF2
      E600ECD5C20084544C0091606000EBAAAA00D9999900534E5700028AC40000AA
      EA0000A6E6000087C40000000000000000000000000000000000000000000006
      F6000006F6000006F6000006F6000006F6000000000000000000000000000000
      000000000000000000000000000000000000000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000000000000000
      0000E0BBAB00F4E9E300FFFFFF00FFFFFF00FAE9D300E9AB6700EFC99E00FFFF
      FF00FFFFFF00E7B28700D57D3F00E9BB9C00FEFFFF00FBFEFF00F0E9E600E1BF
      AF0000000000000000000000000000000000000000000000000000000000CE94
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFFFEF00DEC6B5009C635A00DEA56B00DE9C4A00E794
      3900EF8C2100A56B6B000000000000000000CF967400FBF7F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FCF7F000FFFA
      EF00DAC0B6009F675B00AA78560091606000C2898900097BAB0000BDFF0000BD
      FF0000A6E600001C9D00000082000000000000000000000000000006F6000006
      F6000006F6000006F6000006F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000006
      F600000000000000000000000000000000000000000000000000000000000000
      000000000000E1BCAC00F4E7E100FFFFFF00FFFFFF00F8E6CE00EFC08600F7E0
      C200F6DABD00E3A06500EEC7A500FFFFFF00FEFFFF00F6EDE900E2C0B0000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700DEC6BD009C635A00EFB57300EFAD5200F7A5
      3100A56B6B00000000000000000000000000D4987500FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FFFE
      F700DDC4BC009F675B00EAB47400B77D460073474700009FDE0000BDFF00008C
      D100001C9D00010D9D00010A970000008200000000000006F6000006F6000006
      F6000006F6000006F60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E0BAA900F3E5DE00FFFFFF00FFFFFF00FBEDD700F0C4
      8A00EBB77A00F4D8B800FFFFFF00FFFFFF00F7EEEA00E1BFAF00000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEC6C6009C635A00EFB57300EFA55200A56B
      6B0000000000000000000000000000000000D4987500FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DDC7C2009F675B00EAB27300EFA751007A494A000093D10000B1F200012B
      A7000725DC000420B800021DB100010A9700000000000006F6000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E0BAA900F3E5DE00FFFFFF00FFFFFF00FFFE
      FC00FEFBF800FFFFFF00FFFFFF00FAF3F000E2C0B00000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6CE009C635A00EFB57300A56B6B000000
      000000000000000000000000000000000000D4987500FFFFFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E2D0CE009F675B00EDB57200A5686B0000000000000000000084C1000C21
      BF002D4FF6000F2ECC00031EB10000058F00000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0BAA900F4E7E100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FAF3F000E3C2B4000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D694
      7300E7C6AD00E7C6B500E7C6B500E7C6B500E7C6B500E7C6AD00DEBDAD00DEBD
      AD00DEBDAD00D6B5AD00D6B5AD00C69C94009C635A00A56B6B00000000000000
      000000000000000000000000000000000000CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E68009F675B00A5686B00000000000000000000000000000000001624
      BF005270FC001839E30001099700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0BAA900F2E0D700FEFC
      FC00FFFEFE00F7EEEA00E3C2B200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001322BD00050DA50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E1BCAB00E6C5
      B700E7C9BC00E1BCAB0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000600000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00
      0000000000000000FF87FF000000000000000000FF03FF000000000000000000
      FF03FF000000000000000000FF03FF000000000000000000FF03FF0000000000
      00000000FF03FF000000000000000000FE01FF000000000000000000FC00FF00
      0000000000000000F800FF000000000000000000F8007F000000000000000000
      F0003F000000000000000000E0001F000000000000000000C0000F0000000000
      0000000080000600000000000000000000000000000000000000000080000600
      0000000000000000E0000F000000000000000000E8FF03000000000000000000
      F1FF07000000000000000000FFFF8F000000000000000000FFFFDF0000000000
      00000000FFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF3FFF
      FFFFC00007FFFFFF00001FFFFFFFC00007C0000300000FFFFFFFC00007C00003
      000007FFFE7FC00007C00003000003FFF81FC00007C00003000001FFE007C000
      07C00003000003FF8003C00007C00003000007FE0001C00007C0000300000FF8
      0001C00007C0000300001FE00001C00007C0000100003F800001C00007C00000
      00003F000001C00007C0000000003F000001C0000780000100003F000007C000
      0780000100003F00001FC0000700000100003F00007FC0000700000300003F80
      01FFC0000100000700003FE007FFC000010003FF00003FF81FFFC000078003FF
      00007FFE7FFFC0000F8007FF0000FFFFFFFFC0001FC00FFF0001FFFFFFFFC000
      3FE01FFF0003FFFFFFFFC0007FF87FFFFFE7FFFFFFFF000000FFFDFFFF07FFC0
      0007000000FFF9FFF807FFC0000700000000003FE00003C0000700000000003F
      E00003C0000700000000000FE00003C00007000000000007E00003C000070000
      00000003E00003C00007000000000003E00003C00007000000000001E00003C0
      0007000000000031E00003C00007000000000039E00003C00007000000000039
      E00003C0000700000000003DE00003C0000700000000003DE00003C000070000
      0000003FE00003C0000700000000003FE00003C0000700000000003FE00003C0
      000700000000003FE00003C0000700000000003FE00003C0000700000000007F
      E00003C0000F0000000000FFF80003C0001F0000000001FFFF07FFC0003F0000
      000003FFFFE7FFC0007F0000000007FFE00003FFFFFFFFFFFFFFC3FFE0000300
      001FFFFFF9FF81FFE0000300001FFFFFF1FF00FFE0000300001FC7FFE3FE007F
      E0000300001FC3FF87FC003FE0000300001FC1FF0FF8001FE0000300001FE0FE
      1FF0000FE0000300001FF07C3FE00007E0000300001FFC307FC00003E0000300
      001FFE00FF800001E0000300001FFF01FF000000E0000300001FFF83FF000000
      E0000300001FFF01FF000000E0000300001FFE00FF000000E0000300001FFC18
      7F800001E0000300000FF83C3FC00003E00003000007F07F1FE00007E0000300
      0003E0FF8FF0000FE00003000001C1FFEFF8001FE0000700000083FFFFFC003F
      E0000F00000087FFFFFE007FE0001F0000C08FFFFFFF00FFE0003F0001E1FFFF
      FFFF81FFFFFFFFFFFFF3FFFFFFFFC3FF00000000000000000000000000000000
      000000000000}
  end
end
