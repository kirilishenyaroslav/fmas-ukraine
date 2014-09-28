object frmEditOtch: TfrmEditOtch
  Left = 296
  Top = 92
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1074#1110#1076#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084' '#1079' '#1073#1102#1076#1078#1077#1090#1091
  ClientHeight = 524
  ClientWidth = 479
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
    Width = 479
    Height = 483
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 278
      Width = 477
      Height = 204
      Align = alClient
      Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1079#1072' '#1092#1086#1088#1084#1091#1083#1086#1102
      TabOrder = 0
      object cxGrid1: TcxGrid
        Left = 10
        Top = 59
        Width = 453
        Height = 137
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfStandard
        RootLevelStyles.Tab = column_gray
        RootLevelStyles.TabsBackground = column_gray
        object PkvView: TcxGridDBTableView
          DataController.DataSource = PercentsDataSource
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
          object PkvViewDBColumn2: TcxGridDBColumn
            Caption = #1055#1086#1095#1072#1090#1086#1082
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            SortOrder = soAscending
            Styles.Content = back
            Width = 99
            DataBinding.FieldName = 'DATE_BEG'
          end
          object PkvViewDBColumn1: TcxGridDBColumn
            Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Styles.Content = back
            Width = 164
            DataBinding.FieldName = 'DATE_END'
          end
          object PkvViewDBColumn5: TcxGridDBColumn
            Caption = #1055#1088#1086#1094#1077#1085#1090
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 102
            DataBinding.FieldName = 'PERCENT'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          Caption = #1056#1077#1108#1089#1090#1088' '#1087#1088#1086#1075#1088#1072#1084' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
          GridView = PkvView
        end
      end
      object cxButton3: TcxButton
        Left = 13
        Top = 27
        Width = 68
        Height = 25
        Caption = #1044#1086#1076#1072#1090#1080
        TabOrder = 1
        OnClick = cxButton3Click
      end
      object cxButton4: TcxButton
        Left = 86
        Top = 27
        Width = 68
        Height = 25
        Caption = #1042#1080#1076#1072#1083#1080#1090#1080
        TabOrder = 2
        OnClick = cxButton4Click
      end
      object cxButton5: TcxButton
        Left = 159
        Top = 27
        Width = 68
        Height = 25
        Caption = #1047#1084#1110#1085#1080#1090#1080
        TabOrder = 3
        OnClick = cxButton5Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 477
      Height = 152
      Align = alTop
      Caption = #1041#1102#1076#1078#1077#1090' "'#1044#1078#1077#1088#1077#1083#1086'"'
      TabOrder = 1
      object Label2: TLabel
        Left = 49
        Top = 44
        Width = 137
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1044#1086#1093#1086#1076#1085#1080#1081' '#1088#1086#1079#1076#1110#1083
      end
      object Label3: TLabel
        Left = 64
        Top = 67
        Width = 122
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1044#1086#1093#1086#1076#1085#1072' '#1089#1090#1072#1090#1090#1103
      end
      object Label7: TLabel
        Left = 54
        Top = 99
        Width = 131
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1058#1088#1072#1085#1079#1080#1090#1085#1080#1081' '#1088#1086#1079#1076#1110#1083
      end
      object Label8: TLabel
        Left = 58
        Top = 123
        Width = 127
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1058#1088#1072#1085#1079#1080#1090#1085#1072' '#1089#1090#1072#1090#1090#1103
      end
      object Label10: TLabel
        Left = 85
        Top = 17
        Width = 101
        Height = 18
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1041#1102#1076#1078#1077#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdSourceFRazdel: TcxTextEdit
        Left = 193
        Top = 41
        Width = 273
        Height = 24
        Properties.ReadOnly = True
        Style.Color = clSilver
        TabOrder = 0
      end
      object EdSourceTRazdel: TcxTextEdit
        Left = 194
        Top = 97
        Width = 273
        Height = 24
        Properties.ReadOnly = True
        Style.Color = clSilver
        TabOrder = 1
      end
      object EdSourceFSt: TcxButtonEdit
        Left = 193
        Top = 66
        Width = 273
        Height = 24
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = EdSourceFStPropertiesButtonClick
        Style.Color = clInfoBk
        TabOrder = 2
      end
      object EdSourceTSt: TcxButtonEdit
        Left = 194
        Top = 122
        Width = 273
        Height = 24
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = EdPropertiesButtonClick
        Style.Color = clInfoBk
        TabOrder = 3
      end
      object EdSourceBudget: TcxButtonEdit
        Left = 193
        Top = 14
        Width = 273
        Height = 24
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = EdSourceBudgetPropertiesButtonClick
        Style.Color = clInfoBk
        TabOrder = 4
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 153
      Width = 477
      Height = 125
      Align = alTop
      Caption = #1041#1102#1076#1078#1077#1090' "'#1055#1088#1080#1081#1084#1072#1095'"'
      TabOrder = 2
      object Label5: TLabel
        Left = 58
        Top = 44
        Width = 127
        Height = 21
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1044#1086#1093#1086#1076#1085#1080#1081' '#1088#1086#1079#1076#1110#1083
      end
      object Label6: TLabel
        Left = 60
        Top = 71
        Width = 125
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1044#1086#1093#1086#1076#1085#1072' '#1089#1090#1072#1090#1090#1103
      end
      object Label9: TLabel
        Left = 68
        Top = 18
        Width = 117
        Height = 19
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1041#1102#1076#1078#1077#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdTargetRazdel: TcxTextEdit
        Left = 193
        Top = 41
        Width = 273
        Height = 24
        Enabled = False
        Properties.ReadOnly = True
        Style.Color = clSilver
        TabOrder = 0
      end
      object EdTargetSt: TcxButtonEdit
        Left = 193
        Top = 67
        Width = 273
        Height = 24
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
        Style.Color = clInfoBk
        TabOrder = 1
      end
      object EdTargetBudget: TcxButtonEdit
        Left = 193
        Top = 15
        Width = 273
        Height = 24
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
        Style.Color = clInfoBk
        TabOrder = 2
      end
      object Enable: TcxCheckBox
        Left = 14
        Top = 94
        Width = 450
        Height = 24
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1060#1086#1088#1084#1091#1083#1072' '#1074#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1108#1090#1100#1089#1103' '
        TabOrder = 3
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 483
    Width = 479
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 8
    Top = 216
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
  object PercentsDataSet: TpFIBDataSet
    Left = 23
    Top = 326
    poSQLINT64ToBCD = True
  end
  object PercentsDataSource: TDataSource
    DataSet = PercentsDataSet
    Left = 55
    Top = 326
  end
end
