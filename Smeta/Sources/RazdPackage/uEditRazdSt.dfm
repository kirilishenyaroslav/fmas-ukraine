object frmEditRazdSt: TfrmEditRazdSt
  Left = 429
  Top = 67
  BorderStyle = bsDialog
  Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1086' '#1088#1086#1079#1076#1110#1083#1091'/'#1089#1090#1072#1090#1090#1110' '#1076#1086#1093#1086#1076#1110#1074' '#1090#1072' '#1074#1080#1076#1072#1090#1082#1110#1074
  ClientHeight = 533
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 631
    Height = 119
    Align = alTop
    Caption = #1054#1089#1085#1086#1074#1085#1110' '#1074#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1086' '#1088#1086#1079#1076#1110#1083#1091'/'#1089#1090#1072#1090#1090#1110
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 42
      Top = 21
      Width = 161
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1053#1086#1084#1077#1088' '#1088#1086#1079#1076#1110#1083#1091'/'#1089#1090#1072#1090#1090#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 45
      Width = 195
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1088#1086#1079#1076#1110#1083#1091'/'#1089#1090#1072#1090#1090#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 42
      Top = 68
      Width = 161
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1044#1086#1093#1086#1076#1085#1110#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object EdRazdStNum: TEdit
      Left = 207
      Top = 19
      Width = 417
      Height = 22
      Color = clInfoBk
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object EdRazdStTitle: TEdit
      Left = 207
      Top = 43
      Width = 417
      Height = 22
      Color = clInfoBk
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 106
      Top = 91
      Width = 479
      Height = 18
      Caption = #1044#1086#1089#1090#1091#1087#1085#1110#1089#1090#1100' '#1076#1083#1103' '#1074#1080#1082#1086#1088#1080#1090#1089#1090#1072#1085#1085#1103' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1089#1100#1082#1080#1084#1080' '#1089#1080#1089#1090#1077#1084#1072#1084#1080
      Checked = True
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      State = cbChecked
      TabOrder = 2
    end
    object cbProfitable: TcxComboBox
      Left = 206
      Top = 66
      Width = 419
      Height = 24
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #1042#1048#1044#1040#1058#1050#1048
        #1044#1054#1061#1054#1044#1048)
      Style.Color = clInfoBk
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 119
    Width = 631
    Height = 66
    Align = alTop
    TabOrder = 1
    object PlagGroup: TRadioGroup
      Left = 2
      Top = 18
      Width = 627
      Height = 46
      Align = alClient
      Caption = #1055#1083#1072#1085#1091#1074#1072#1085#1085#1103' '#1074#1110#1076#1073#1091#1074#1072#1108#1090#1100#1089#1103' '#1085#1072' '#1088#1110#1074#1085#1110' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pl_by_rz: TRadioButton
      Left = 24
      Top = 39
      Width = 74
      Height = 17
      Caption = #1056#1086#1079#1076#1110#1083#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object pl_by_st: TRadioButton
      Left = 128
      Top = 40
      Width = 113
      Height = 17
      Caption = #1057#1090#1072#1090#1090#1110
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = True
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 185
    Width = 631
    Height = 114
    Align = alTop
    TabOrder = 2
    object StPropGroup: TRadioGroup
      Left = 2
      Top = 18
      Width = 627
      Height = 94
      Align = alClient
      Caption = #1042' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1085#1086#1089#1092#1086#1088#1084#1086#1074#1072#1085#1080#1093' '#1089#1090#1086#1088#1085#1091#1102#1095#1080#1093' '#1087#1088#1086#1074#1086#1076#1082#1072#1093
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object OutProp: TRadioButton
      Left = 21
      Top = 38
      Width = 305
      Height = 17
      Caption = #1053#1077' '#1079#1084#1110#1085#1102#1074#1072#1090#1080' '#1089#1090#1072#1090#1090#1102
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = True
      OnClick = OutPropClick
    end
    object InProp: TRadioButton
      Left = 21
      Top = 60
      Width = 417
      Height = 17
      Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1085#1086' '#1079#1084#1110#1085#1102#1074#1072#1090#1080' '#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = InPropClick
    end
    object EdInSt_Title: TEdit
      Left = 21
      Top = 80
      Width = 459
      Height = 22
      Color = clInfoBk
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object In_St_Button: TButton
      Left = 485
      Top = 80
      Width = 29
      Height = 21
      Caption = '...'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = In_St_ButtonClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 369
    Width = 631
    Height = 126
    Align = alClient
    TabOrder = 3
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 88
      Height = 124
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object cxButton3: TcxButton
        Left = 7
        Top = 9
        Width = 75
        Height = 25
        Caption = #1044#1086#1076#1072#1090#1080
        TabOrder = 0
        OnClick = cxButton3Click
      end
      object cxButton4: TcxButton
        Left = 7
        Top = 41
        Width = 75
        Height = 25
        Caption = #1047#1084#1110#1085#1080#1090#1080
        TabOrder = 1
        OnClick = cxButton4Click
      end
      object cxButton5: TcxButton
        Left = 7
        Top = 73
        Width = 75
        Height = 25
        Caption = #1042#1080#1076#1072#1083#1080#1090#1080
        TabOrder = 2
        OnClick = cxButton5Click
      end
    end
    object cxGrid1: TcxGrid
      Left = 89
      Top = 1
      Width = 541
      Height = 124
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object cxGridDBBandedTableView1: TcxGridDBBandedTableView
        DataController.DataSource = AnDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.Background = back
        Styles.Content = back
        Styles.Header = cxStyle1
        Styles.BandBackground = back
        Styles.BandHeader = cxStyle1
        Bands = <
          item
            Caption = #1050#1086#1085#1092#1110#1075#1091#1088#1072#1094#1110#1103' '#1079#1085#1072#1095#1077#1085#1100' '#1072#1085#1072#1083#1110#1090#1080#1082#1080
            Width = 247
          end>
        object cxGridDBBandedColumn1: TcxGridDBBandedColumn
          Caption = #1050#1086#1076' '#1072#1085#1072#1083#1110#1090#1080#1082#1080
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 115
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'enum_code'
        end
        object cxGridDBBandedColumn2: TcxGridDBBandedColumn
          Caption = #1047
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          SortOrder = soAscending
          Width = 81
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'date_beg'
        end
        object cxGridDBBandedColumn3: TcxGridDBBandedColumn
          Caption = #1055#1086
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 96
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'date_end'
        end
        object cxGridDBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn
          Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1072#1085#1072#1083#1110#1090#1080#1082#1080
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 214
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'enum_title'
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = cxGridDBBandedTableView1
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 495
    Width = 631
    Height = 38
    Align = alBottom
    TabOrder = 4
    object cxButton1: TcxButton
      Left = 231
      Top = 4
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 312
      Top = 4
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 299
    Width = 631
    Height = 70
    Align = alTop
    TabOrder = 5
    object RadioGroup1: TRadioGroup
      Left = 1
      Top = 1
      Width = 629
      Height = 68
      Align = alClient
      Caption = #1047#1074#39#1103#1079#1072#1090#1080' '#1094#1102' '#1074#1080#1076#1072#1090#1082#1086#1074#1091' '#1089#1090#1072#1090#1090#1102' '#1079#1110' '#1089#1090#1072#1090#1077#1102' '#1076#1083#1103' '#1072#1089#1080#1075#1085#1091#1074#1072#1085#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object ExtendedLink: TEdit
      Left = 21
      Top = 42
      Width = 457
      Height = 22
      Color = clInfoBk
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object Button1: TButton
      Left = 485
      Top = 43
      Width = 27
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 21
      Top = 18
      Width = 457
      Height = 22
      Color = clInfoBk
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 8
    Top = 63
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
  object AnDataSet: TpFIBDataSet
    Left = 72
    Top = 61
    poSQLINT64ToBCD = True
  end
  object AnDataSource: TDataSource
    DataSet = AnDataSet
    Left = 40
    Top = 61
  end
  object ActionList1: TActionList
    Left = 17
    Top = 453
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
  end
end
