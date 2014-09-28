object Form1: TForm1
  Left = 278
  Top = 118
  BorderStyle = bsDialog
  Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1080#1084#1077#1085#1080' '#1089#1082#1088#1080#1087#1090#1072
  ClientHeight = 674
  ClientWidth = 819
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Courier New'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object ScriptFileEdit: TcxButtonEdit
    Left = 112
    Top = 192
    Width = 697
    Height = 23
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = ScriptFileEditPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 0
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 192
    Width = 92
    Height = 19
    TabOrder = 1
    Caption = #1060#1072#1081#1083' '#1089#1082#1088#1080#1087#1090#1072
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 216
    Width = 106
    Height = 19
    TabOrder = 2
    Caption = #1040#1088#1093#1080#1074' '#1089#1082#1088#1080#1087#1090#1086#1074
  end
  object ScriptsNumPathEdit: TcxButtonEdit
    Left = 112
    Top = 216
    Width = 697
    Height = 23
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = ScriptsNumPathEditPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 3
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 264
    Width = 801
    Height = 33
    Alignment = alTopLeft
    Caption = ' '#1058#1080#1087
    TabOrder = 4
    object rbMetadata: TcxRadioButton
      Left = 80
      Top = 12
      Width = 89
      Height = 17
      Caption = #1052#1077#1090#1072#1076#1072#1085#1085#1099#1077
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = cxButton5Click
    end
    object rbData: TcxRadioButton
      Left = 208
      Top = 12
      Width = 65
      Height = 17
      Caption = #1044#1072#1085#1085#1099#1077
      TabOrder = 1
      OnClick = cxButton6Click
    end
    object rbIndex: TcxRadioButton
      Left = 312
      Top = 12
      Width = 65
      Height = 17
      Caption = #1048#1085#1076#1077#1082#1089
      TabOrder = 2
      OnClick = cxButton5Click
    end
    object rbModules: TcxRadioButton
      Left = 504
      Top = 12
      Width = 65
      Height = 17
      Caption = #1052#1086#1076#1091#1083#1080
      Enabled = False
      TabOrder = 3
      OnClick = rbModulesClick
    end
  end
  object ScriptNameEdit: TcxTextEdit
    Left = 128
    Top = 608
    Width = 681
    Height = 23
    Properties.ReadOnly = True
    Style.Color = clSilver
    TabOrder = 5
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 608
    Width = 120
    Height = 19
    TabOrder = 6
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1082#1088#1080#1087#1090#1072
  end
  object cxButton1: TcxButton
    Left = 688
    Top = 640
    Width = 121
    Height = 25
    Cancel = True
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 7
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 240
    Top = 640
    Width = 129
    Height = 25
    Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100
    TabOrder = 8
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 432
    Top = 640
    Width = 201
    Height = 25
    Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100' '#1080' '#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
    Default = True
    TabOrder = 9
    OnClick = cxButton3Click
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 240
    Width = 92
    Height = 19
    TabOrder = 10
    Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074
  end
  object ScriptsPathEdit: TcxButtonEdit
    Left = 112
    Top = 240
    Width = 697
    Height = 23
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = ScriptsPathEditPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 11
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 0
    Width = 457
    Height = 17
    AutoSize = False
    TabOrder = 12
    Caption = #1057#1082#1088#1080#1087#1090#1099' '#1079#1072' '#1089#1077#1075#1086#1076#1085#1103
  end
  object lbScripts: TcxListBox
    Left = 8
    Top = 16
    Width = 801
    Height = 177
    ItemHeight = 15
    ParentColor = False
    PopupMenu = PopupMenu1
    Style.Color = clMoneyGreen
    Style.Shadow = False
    TabOrder = 13
    ScrollWidth = 1
    OnDblClick = lbScriptsDblClick
    OnKeyDown = lbScriptsKeyDown
  end
  object cxLabel6: TcxLabel
    Left = 8
    Top = 584
    Width = 85
    Height = 19
    TabOrder = 14
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
  end
  object CommentEdit: TcxTextEdit
    Left = 128
    Top = 584
    Width = 217
    Height = 23
    Properties.MaxLength = 28
    Properties.ReadOnly = False
    Properties.OnChange = CommentEditPropertiesChange
    Style.Color = clMoneyGreen
    TabOrder = 15
  end
  object cxButton4: TcxButton
    Left = 8
    Top = 640
    Width = 161
    Height = 25
    Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1073#1091#1092#1077#1088
    TabOrder = 16
    OnClick = cxButton4Click
  end
  object cxButton5: TcxButton
    Left = 368
    Top = 576
    Width = 137
    Height = 25
    Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1076#1083#1103' '#1074#1089#1077#1093
    TabOrder = 17
    OnClick = cxButton5Click
  end
  object cxButton6: TcxButton
    Left = 520
    Top = 576
    Width = 137
    Height = 25
    Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1086#1090#1084#1077#1090#1082#1080
    TabOrder = 18
    OnClick = cxButton6Click
  end
  object cxButton7: TcxButton
    Left = 672
    Top = 576
    Width = 137
    Height = 25
    Caption = #1048#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 19
    OnClick = cxButton7Click
  end
  object grdProjects: TcxGrid
    Left = 16
    Top = 296
    Width = 801
    Height = 273
    Align = alCustom
    TabOrder = 20
    RootLevelOptions.DetailFrameColor = clMoneyGreen
    object grdProjectsDBTableView1: TcxGridDBTableView
      DataController.DataModeController.GridMode = True
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnEditChanged = grdProjectsDBTableView1EditChanged
      OptionsView.ScrollBars = ssNone
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
      Styles.ContentEven = cxStyle1
      Styles.ContentOdd = cxStyle1
      Styles.Inactive = cxStyle1
      Styles.IncSearch = cxStyle1
      Styles.Selection = cxStyle1
      Styles.FilterBox = cxStyle1
      Styles.Footer = cxStyle1
      Styles.Group = cxStyle1
      Styles.GroupByBox = cxStyle1
      Styles.Header = cxStyle1
      Styles.Indicator = cxStyle1
      Styles.NewItemRowInfoText = cxStyle1
      Styles.Preview = cxStyle1
      object cheked: TcxGridDBColumn
        Caption = #1044#1083#1103' '#1087#1088#1086#1077#1082#1090#1072
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = False
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Options.Filtering = False
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 83
        DataBinding.FieldName = 'RxMemoryData1Field1'
      end
      object grdProjectsDBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1059#1078#1077' '#1087#1088#1080#1084#1077#1085#1105#1085
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = False
        Properties.ValueChecked = 1
        Properties.ValueGrayed = '-1'
        Properties.ValueUnchecked = 0
        Options.Filtering = False
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 89
        DataBinding.FieldName = 'RxMemoryData1Field3'
      end
      object grdProjectsDBTableView1DBColumn3: TcxGridDBColumn
        Caption = 'KEY'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 82
        DataBinding.FieldName = 'RxMemoryData1Field4'
      end
      object grdProjectsDBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1047#1072#1082#1072#1079#1095#1080#1082
        FooterAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Width = 545
        DataBinding.FieldName = 'RxMemoryData1Field2'
      end
    end
    object grdProjectsLevel1: TcxGridLevel
      GridView = grdProjectsDBTableView1
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.*'
    Filter = 
      'All files(*.*)|*.*|SQL files(*.sql)|*.sql|Text files(*.txt)|*.tx' +
      't|Modules (*.rar)|*.rar'
    Left = 136
    Top = 56
  end
  object PopupMenu1: TPopupMenu
    Left = 168
    Top = 56
    object N1: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1087#1086#1088#1103#1076#1086#1082' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080
      OnClick = N4Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1073#1091#1092#1077#1088' '#1086#1073#1084#1077#1085#1072
      OnClick = N2Click
    end
    object Notepad1: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
      OnClick = Notepad1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    Left = 200
    Top = 56
  end
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <
      item
        Name = 'RxMemoryData1Field1'
        DataType = ftInteger
      end
      item
        Name = 'RxMemoryData1Field2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RxMemoryData1Field3'
        DataType = ftInteger
      end
      item
        Name = 'RxMemoryData1Field4'
        DataType = ftString
        Size = 20
      end>
    Left = 232
    Top = 56
    object RxMemoryData1RxMemoryData1Field1: TIntegerField
      FieldName = 'RxMemoryData1Field1'
    end
    object RxMemoryData1RxMemoryData1Field2: TStringField
      FieldName = 'RxMemoryData1Field2'
    end
    object RxMemoryData1RxMemoryData1Field3: TIntegerField
      FieldName = 'RxMemoryData1Field3'
    end
    object RxMemoryData1RxMemoryData1Field4: TStringField
      FieldName = 'RxMemoryData1Field4'
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 264
    Top = 56
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
  end
end
