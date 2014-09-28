object frmPlanSum: TfrmPlanSum
  Left = 342
  Top = 176
  Width = 931
  Height = 424
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1087#1086#1082#1072#1079#1085#1080#1082#1086#1084' '#1087#1110#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1084' '#1087#1083#1072#1085#1091#1074#1072#1085#1085#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel2: TPanel
    Left = 0
    Top = 350
    Width = 915
    Height = 36
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 450
      Top = 5
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 530
      Top = 5
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 616
    Height = 350
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1047#1085#1072#1095#1077#1085#1085#1103' '#1087#1086#1082#1072#1079#1085#1080#1082#1072
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 608
        Height = 319
        Align = alClient
        TabOrder = 0
        object Label1: TLabel
          Left = 46
          Top = 55
          Width = 211
          Height = 43
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1056#1077#1082#1074#1110#1079#1080#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1082#1086#1088#1077#1075#1091#1074#1072#1085#1085#1103' '
          WordWrap = True
        end
        object Label2: TLabel
          Left = 8
          Top = 11
          Width = 249
          Height = 46
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1056#1086#1079#1076#1110#1083'/'#1089#1090#1072#1090#1090#1103', '#1087#1086' '#1103#1082#1110#1081' '#1074#1110#1076#1073#1091#1074#1072#1108#1090#1100#1089#1103' '#1088#1086#1073#1086#1090#1072' '#1079' '#1087#1086#1082#1072#1079#1085#1080#1082#1086#1084
          WordWrap = True
        end
        object Label3: TLabel
          Left = 64
          Top = 99
          Width = 255
          Height = 48
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1047#1085#1072#1095#1077#1085#1085#1103' '#1087#1083#1072#1085#1086#1074#1086#1075#1086' '#1087#1086#1082#1072#1079#1085#1080#1082#1072' "'#1044#1054'" '#1082#1086#1088#1080#1075#1091#1074#1072#1085#1085#1103' '#1094#1080#1084' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1084
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label4: TLabel
          Left = 7
          Top = 221
          Width = 317
          Height = 36
          Alignment = taRightJustify
          AutoSize = False
          Caption = 
            #1055#1086#1090#1086#1095#1085#1077' '#1079#1085#1072#1095#1077#1085#1085#1103' '#1087#1083#1072#1085#1086#1074#1086#1075#1086' '#1087#1086#1082#1072#1079#1085#1080#1082#1072' "'#1047' '#1042#1056#1040#1061#1059#1042#1040#1053#1053#1071#1052'" '#1094#1100#1086#1075#1086' '#1076#1086#1082#1091#1084 +
            #1077#1085#1090#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object EdObj: TEdit
          Left = 264
          Top = 11
          Width = 323
          Height = 22
          TabStop = False
          Color = clInactiveBorder
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object EdDoc: TEdit
          Left = 264
          Top = 55
          Width = 323
          Height = 22
          TabStop = False
          Color = clInactiveBorder
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
        end
        object EdCurrentValue: TcxTextEdit
          Left = 328
          Top = 222
          Width = 260
          Height = 24
          TabStop = False
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clGray
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 2
        end
        object GroupBox2: TGroupBox
          Left = 32
          Top = 133
          Width = 555
          Height = 77
          TabOrder = 3
          object checkDelta: TcxRadioButton
            Left = 10
            Top = 18
            Width = 168
            Height = 17
            Caption = #1057#1091#1084#1072' '#1082#1086#1088#1077#1075#1091#1074#1072#1085#1085#1103
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            TabStop = True
            OnClick = checkDeltaClick
          end
          object EdDeltaSum: TcxCalcEdit
            Left = 231
            Top = 18
            Width = 153
            Height = 24
            EditValue = '0'
            Properties.Alignment.Horz = taRightJustify
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnEditValueChanged = EdDeltaSumPropertiesEditValueChanged
            Style.Color = clInfoBk
            TabOrder = 1
            OnEnter = EdDeltaSumEnter
          end
          object checknewsum: TcxRadioButton
            Left = 10
            Top = 45
            Width = 144
            Height = 17
            Caption = #1053#1086#1074#1077' '#1079#1085#1072#1095#1077#1085#1085#1103' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = checknewsumClick
          end
          object EdNewSum: TcxCalcEdit
            Left = 231
            Top = 45
            Width = 153
            Height = 24
            EditValue = '0'
            Enabled = False
            Properties.Alignment.Horz = taRightJustify
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnEditValueChanged = EdNewSumPropertiesEditValueChanged
            Style.Color = clInfoBk
            TabOrder = 3
            OnEnter = EdNewSumEnter
          end
        end
        object BeforeSumma: TcxTextEdit
          Left = 328
          Top = 103
          Width = 260
          Height = 24
          TabStop = False
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          Style.Color = cl3DLight
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 4
        end
        object UseAutoByMonth: TcxRadioButton
          Left = 32
          Top = 264
          Width = 265
          Height = 17
          Caption = #1055#1086#1084#1110#1089#1103#1095#1085#1091' '#1088#1086#1079#1073#1080#1074#1082#1091'  '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1085#1086
          Checked = True
          TabOrder = 5
          TabStop = True
          OnClick = UseAutoByMonthClick
        end
        object cxRadioButton2: TcxRadioButton
          Left = 32
          Top = 288
          Width = 241
          Height = 17
          Caption = #1055#1086#1084#1110#1089#1103#1095#1085#1091' '#1088#1086#1079#1073#1080#1074#1082#1091' '#1089#1072#1084#1086#1089#1090#1110#1081#1085#1086
          TabOrder = 6
          OnClick = cxRadioButton2Click
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 624
    Top = 0
    Width = 291
    Height = 350
    Align = alRight
    Caption = 'Panel1'
    TabOrder = 2
    object cxGrid1: TcxGrid
      Left = 1
      Top = 42
      Width = 289
      Height = 307
      Align = alClient
      BevelKind = bkFlat
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object cxGridDBTableView3: TcxGridDBTableView
        OnDblClick = cxGridDBTableView3DblClick
        DataController.DataSource = MonthDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'PLAN_SUM'
            Column = cxGridDBTableView3DBColumn2
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.Header = cxStyle1
        object cxGridDBTableView3DBColumn1: TcxGridDBColumn
          Caption = #1055#1077#1088#1110#1086#1076
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          SortOrder = soAscending
          Width = 106
          DataBinding.FieldName = 'DATE_REG'
        end
        object cxGridDBTableView3DBColumn2: TcxGridDBColumn
          Caption = #1047#1085#1072#1095#1077#1085#1085#1103' '#1087#1086#1082#1072#1079#1085#1080#1082#1072
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00 ;-,0.00 '
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 127
          DataBinding.FieldName = 'PLAN_SUM'
        end
      end
      object cxGridLevel3: TcxGridLevel
        GridView = cxGridDBTableView3
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 289
      Height = 41
      Align = alTop
      TabOrder = 1
      object cxButton1: TcxButton
        Left = 7
        Top = 8
        Width = 78
        Height = 25
        Caption = #1047#1084#1110#1085#1080#1090#1080
        Enabled = False
        TabOrder = 0
        OnClick = cxButton1Click
      end
      object cxButton2: TcxButton
        Left = 87
        Top = 8
        Width = 78
        Height = 25
        Caption = #1042#1089#1110' 0'
        Enabled = False
        TabOrder = 1
        OnClick = cxButton2Click
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 616
    Top = 0
    Width = 8
    Height = 350
    HotZoneClassName = 'TcxMediaPlayer8Style'
    AlignSplitter = salRight
    Control = Panel1
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 76
    Top = 34
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object columnst: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
  end
  object MonthValuesDataSetBuffer: TRxMemoryData
    FieldDefs = <>
    Left = 199
    Top = 35
  end
  object SchFibDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      '')
    Left = 139
    Top = 35
    poSQLINT64ToBCD = True
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <>
    StorageName = 'cxPropertiesStore1'
    Left = 44
    Top = 35
  end
  object MonthDataSource: TDataSource
    DataSet = MonthValuesDataSetBuffer
    Left = 108
    Top = 35
  end
  object MonthValues: TpFIBDataSet
    Left = 12
    Top = 35
    poSQLINT64ToBCD = True
  end
end
