object St_pfio_OplataSprav_Form: TSt_pfio_OplataSprav_Form
  Left = 362
  Top = 203
  Width = 703
  Height = 513
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1060#1086#1088#1084#1072' '#1072#1085#1072#1083#1080#1079#1072' '#1086#1087#1083#1072#1090#1099
  Color = clBtnFace
  Constraints.MinHeight = 383
  Constraints.MinWidth = 699
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    687
    475)
  PixelsPerInch = 96
  TextHeight = 13
  object FIO_Label: TLabel
    Left = 8
    Top = 8
    Width = 42
    Height = 13
    Caption = #1060'.'#1048'.'#1054'. :'
  end
  object Fac_Label: TLabel
    Left = 8
    Top = 32
    Width = 59
    Height = 13
    Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090':'
  end
  object Kurs_Label: TLabel
    Left = 280
    Top = 32
    Width = 27
    Height = 13
    Caption = #1050#1091#1088#1089':'
  end
  object DataRog_Label: TLabel
    Left = 338
    Top = 32
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
  end
  object FIOCOMBO_Label: TLabel
    Left = 56
    Top = 8
    Width = 3
    Height = 13
    Transparent = True
  end
  object Comment_Label: TLabel
    Left = 8
    Top = 433
    Width = 401
    Height = 40
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099' '#1086#1087#1083#1072#1090#1099' '#1085#1077' '#1085#1072#1081#1076#1077#1085#1099
    Transparent = True
    WordWrap = True
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 56
    Width = 677
    Height = 233
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataModeController.GridMode = True
      DataController.DataModeController.SmartRefresh = True
      DataController.DataSource = DataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'ID_KATEGORIYA'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
      Styles.Inactive = cxStyle4
      Styles.Selection = cxStyle2
      Styles.Header = cxStyle3
      object id_kategory: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_KATEGORIYA'
      end
      object Beg_Date: TcxGridDBColumn
        Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
        HeaderAlignmentHorz = taCenter
        Options.Sorting = False
        Width = 83
        DataBinding.FieldName = 'BEG_DATE'
      end
      object End_Date: TcxGridDBColumn
        Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
        HeaderAlignmentHorz = taCenter
        Width = 77
        DataBinding.FieldName = 'END_DATE'
      end
      object Pay_Sum: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072' '#1086#1087#1083#1072#1090#1099' '#1074' '#1084#1077#1089#1103#1094', '#1075#1088#1085
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '0.00;'
        HeaderAlignmentHorz = taCenter
        Width = 122
        DataBinding.FieldName = 'PAY_SUM'
      end
      object Persent: TcxGridDBColumn
        Caption = #1055#1088#1086#1094#1077#1085#1090' '#1086#1087#1083#1072#1090#1099', %'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = '0.0000;'
        HeaderAlignmentHorz = taCenter
        Width = 98
        DataBinding.FieldName = 'PERCENT'
      end
      object Sum_Subs: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072' '#1078#1080#1083#1080#1097#1085#1086#1081' '#1089#1091#1073#1089#1080#1076#1080#1080', '#1075#1088#1085
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '0.00;'
        HeaderAlignmentHorz = taCenter
        Width = 135
        DataBinding.FieldName = 'SUM_SUBS'
      end
      object Cnt_Month: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086' '#1084#1077#1089#1103#1094#1077#1074
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '0.00;'
        HeaderAlignmentHorz = taCenter
        Width = 98
        DataBinding.FieldName = 'CNT_MONTH'
      end
      object Summa: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072' '#1082' '#1086#1087#1083#1072#1090#1077', '#1075#1088#1085
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '0.00;'
        HeaderAlignmentHorz = taCenter
        Width = 82
        DataBinding.FieldName = 'SUMMA'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object CancelButton: TcxButton
    Left = 588
    Top = 444
    Width = 99
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1082
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxGrid2: TcxGrid
    Left = 6
    Top = 296
    Width = 405
    Height = 133
    Align = alCustom
    Anchors = [akLeft, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    LookAndFeel.Kind = lfUltraFlat
    object cxGridDBTableView1: TcxGridDBTableView
      OnDblClick = cxGridDBTableView1DblClick
      OnKeyPress = cxGridDBTableView1KeyPress
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
      Styles.Inactive = cxStyle4
      Styles.Selection = cxStyle2
      Styles.Header = cxStyle3
      object Doc_num: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#8470
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 182
        DataBinding.FieldName = 'DOC_NOMER_COMBO'
      end
      object Doc_date: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084'.'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.SaveTime = False
        Properties.ShowTime = False
        HeaderAlignmentHorz = taCenter
        Width = 110
        DataBinding.FieldName = 'DATE_DOC'
      end
      object Doc_summa: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1075#1088#1085'.'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '0,00;'
        HeaderAlignmentHorz = taCenter
        Width = 107
        DataBinding.FieldName = 'SUMMA'
      end
      object Note: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'NOTE'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 420
    Top = 290
    Width = 265
    Height = 139
    Alignment = alTopLeft
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1048#1090#1086#1075#1086
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object Label4: TLabel
      Left = 6
      Top = 18
      Width = 78
      Height = 13
      Caption = #1053#1072#1076#1086' '#1086#1087#1083#1072#1090#1080#1090#1100':'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 6
      Top = 42
      Width = 75
      Height = 13
      Caption = #1059#1078#1077' '#1086#1087#1083#1072#1095#1077#1085#1086':'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Zadolg_Label: TLabel
      Left = 6
      Top = 66
      Width = 83
      Height = 13
      Caption = #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100':'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object DateOpl_Label: TLabel
      Left = 46
      Top = 90
      Width = 171
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #1054#1087#1083#1072#1095#1077#1085#1086' '#1087#1086' '
      Color = 13598296
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4756269
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 6
      Top = 114
      Width = 107
      Height = 13
      Caption = #1050' '#1086#1087#1083#1072#1090#1077' '#1085#1072' '#1089#1077#1075#1086#1076#1085#1103':'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 222
      Top = 18
      Width = 20
      Height = 13
      Caption = #1075#1088#1085'.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label10: TLabel
      Left = 222
      Top = 42
      Width = 20
      Height = 13
      Caption = #1075#1088#1085'.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object zadolg_grn_Label: TLabel
      Left = 222
      Top = 66
      Width = 20
      Height = 13
      Caption = #1075#1088#1085'.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label12: TLabel
      Left = 222
      Top = 114
      Width = 20
      Height = 13
      Caption = #1075#1088#1085'.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object St_SNeed_Edit: TcxCurrencyEdit
      Left = 132
      Top = 14
      Width = 89
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Properties.ReadOnly = True
      Style.Color = clBtnFace
      TabOrder = 0
    end
    object St_UplSum_Edit: TcxCurrencyEdit
      Left = 132
      Top = 38
      Width = 89
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Properties.ReadOnly = True
      Style.Color = clBtnFace
      TabOrder = 1
    end
    object Zadolgnost_Edit: TcxCurrencyEdit
      Left = 132
      Top = 62
      Width = 89
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Properties.ReadOnly = True
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object Today_Opl_Edit: TcxCurrencyEdit
      Left = 132
      Top = 110
      Width = 89
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Properties.ReadOnly = True
      Style.Color = clBtnFace
      TabOrder = 3
    end
  end
  object DataSet: TpFIBDataSet
    Database = DataModule1.DB
    Transaction = DataModule1.ReadTransaction
    UpdateTransaction = DataModule1.WriteTransaction
    SQLScreenCursor = crSQLWait
    SelectSQL.Strings = (
      'SELECT'
      '    ID_KATEGORIYA,'
      '    TYPE_KAT,'
      '    BEG_DATE,'
      '    END_DATE,'
      '    PAY_SUM,'
      '    "PERCENT",'
      '    SUM_SUBS,'
      '    SUMMA,'
      '    SUM_KAT,'
      '    CNT_MONTH,'
      '    NOT_LIVE,'
      '    SUB_MAX'
      'FROM'
      '    ST_TMP_TN_CALC_SELECT'
      '    ('
      '    ?ID_SESSION'
      '    ) ')
    AutoCalcFields = False
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 328
    Top = 148
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 384
    Top = 148
  end
  object DataSource1: TDataSource
    DataSet = ReadDataSet
    Left = 54
    Top = 308
  end
  object ReadDataSet: TpFIBDataSet
    Database = DataModule1.DB
    Transaction = DataModule1.ReadTransaction
    UpdateTransaction = DataModule1.WriteTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    DOC_NOMER_COMBO,'
      '    DATE_DOC,'
      '    SUMMA,'
      '    NOTE,'
      '    ID_DOC_VARCHAR'
      'FROM'
      '    ST_TMP_DOC_SELECT'
      '    ('
      '    ?ID_SESSION'
      '    ) ')
    AfterOpen = ReadDataSetAfterOpen
    AfterScroll = ReadDataSetAfterScroll
    Left = 126
    Top = 308
    poSQLINT64ToBCD = True
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 580
    Top = 6
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 12937777
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
  end
end
