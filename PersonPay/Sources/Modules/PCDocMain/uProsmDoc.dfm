object ProsmDocForm: TProsmDocForm
  Left = 455
  Top = 200
  Width = 569
  Height = 382
  Caption = #1044#1086#1082#1091#1084#1077#1085#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 561
    Height = 62
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 5
      Top = 12
      Width = 40
      Height = 13
      Caption = #1053#1086#1084#1077#1088
    end
    object lbl2: TLabel
      Left = 195
      Top = 13
      Width = 31
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object lbl3: TLabel
      Left = 379
      Top = 13
      Width = 31
      Height = 13
      Caption = #1057#1091#1084#1072
    end
    object lbl4: TLabel
      Left = 4
      Top = 37
      Width = 54
      Height = 13
      Caption = #1055#1110#1076#1089#1090#1072#1074#1072
    end
    object NumDoc: TcxTextEdit
      Left = 48
      Top = 9
      Width = 134
      Height = 21
      Properties.ReadOnly = True
      TabOrder = 0
    end
    object DateDoc: TcxTextEdit
      Left = 235
      Top = 9
      Width = 134
      Height = 21
      Properties.ReadOnly = True
      TabOrder = 1
    end
    object SumDoc: TcxTextEdit
      Left = 419
      Top = 9
      Width = 134
      Height = 21
      Properties.ReadOnly = True
      TabOrder = 2
    end
    object ContrDoc: TcxTextEdit
      Left = 79
      Top = 34
      Width = 474
      Height = 21
      Properties.ReadOnly = True
      TabOrder = 3
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 62
    Width = 561
    Height = 288
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = dsDS
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cxGrid1DBTableView1CustomDrawCell
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle3
      Styles.Content = cxStyle3
      Styles.Header = cxStyle8
      object cxGridDB_SCH_NUMBER: TcxGridDBColumn
        Caption = #1044#1077#1073#1077#1090#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
        Options.Editing = False
        Options.Filtering = False
        SortOrder = soAscending
        Width = 133
        DataBinding.FieldName = 'DB_SCH_NUMBER'
      end
      object cxGridKR_SCH_NUMBER: TcxGridDBColumn
        Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
        Options.Editing = False
        Options.Filtering = False
        Width = 132
        DataBinding.FieldName = 'KR_SCH_NUMBER'
      end
      object cxGridSM_KOD: TcxGridDBColumn
        Caption = #1050#1086#1096#1090#1086#1088#1080#1089
        Options.Editing = False
        Options.Filtering = False
        Width = 93
        DataBinding.FieldName = 'SM_KOD'
      end
      object cxGridRZ_KOD: TcxGridDBColumn
        Caption = #1056#1086#1079#1076#1110#1083
        Options.Editing = False
        Options.Filtering = False
        Width = 77
        DataBinding.FieldName = 'RZ_KOD'
      end
      object cxGridST_KOD: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1090#1103
        Options.Editing = False
        Options.Filtering = False
        Width = 72
        DataBinding.FieldName = 'ST_KOD'
      end
      object cxGridKEKV_KOD: TcxGridDBColumn
        Caption = #1050#1045#1050#1042
        Options.Editing = False
        Options.Filtering = False
        Width = 79
        DataBinding.FieldName = 'KEKV_KOD'
      end
      object cxGridSUMMA: TcxGridDBColumn
        Caption = #1057#1091#1084#1072
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'SUMMA'
      end
      object cxGridIS_OUR_DOC: TcxGridDBColumn
        Visible = False
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'IS_OUR_DOC'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 640
    Top = 9
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
  end
  object dsDS: TDataSource
    DataSet = ForProsmotr
    Left = 9
    Top = 90
  end
  object ForProsmotr: TpFIBDataSet
    Database = DocForm.DebDB
    Transaction = DocForm.ReadTr
    SelectSQL.Strings = (
      
        'SELECT IS_OUR_DOC, ID_DOG, KOD_DOG, ID_SM, ID_RZ, ID_ST, ID_KEKV' +
        ', SUMMA,'
      
        '       FIO, DATE_DOC, POPER_DB_ID_SCH, POPER_KR_ID_SCH, KR_SCH_N' +
        'UMBER, DB_SCH_NUMBER,'
      
        '       SM_TITLE, SM_KOD, RZ_TITLE, RZ_KOD, ST_TITLE, ST_KOD, KEK' +
        'V_TITLE, KEKV_KOD'
      
        'FROM PC_DT_DEB_KR_DOC_PROSMOTR(:DATE_BEG, :DATE_END, :IS_DEB_KR,' +
        ' :PK_ID, :ID_REG)')
    Left = 46
    Top = 90
    poSQLINT64ToBCD = True
    object ForProsmotrIS_OUR_DOC: TFIBIntegerField
      FieldName = 'IS_OUR_DOC'
    end
    object ForProsmotrID_DOG: TFIBBCDField
      FieldName = 'ID_DOG'
      Size = 0
      RoundByScale = True
    end
    object ForProsmotrKOD_DOG: TFIBBCDField
      FieldName = 'KOD_DOG'
      Size = 0
      RoundByScale = True
    end
    object ForProsmotrID_SM: TFIBBCDField
      FieldName = 'ID_SM'
      Size = 0
      RoundByScale = True
    end
    object ForProsmotrID_RZ: TFIBBCDField
      FieldName = 'ID_RZ'
      Size = 0
      RoundByScale = True
    end
    object ForProsmotrID_ST: TFIBBCDField
      FieldName = 'ID_ST'
      Size = 0
      RoundByScale = True
    end
    object ForProsmotrID_KEKV: TFIBBCDField
      FieldName = 'ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object ForProsmotrSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object ForProsmotrFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 60
      EmptyStrToNull = True
    end
    object ForProsmotrDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object ForProsmotrPOPER_DB_ID_SCH: TFIBBCDField
      FieldName = 'POPER_DB_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object ForProsmotrPOPER_KR_ID_SCH: TFIBBCDField
      FieldName = 'POPER_KR_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object ForProsmotrKR_SCH_NUMBER: TFIBStringField
      FieldName = 'KR_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object ForProsmotrDB_SCH_NUMBER: TFIBStringField
      FieldName = 'DB_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object ForProsmotrSM_TITLE: TFIBStringField
      FieldName = 'SM_TITLE'
      Size = 180
      EmptyStrToNull = True
    end
    object ForProsmotrSM_KOD: TFIBIntegerField
      FieldName = 'SM_KOD'
    end
    object ForProsmotrRZ_TITLE: TFIBStringField
      FieldName = 'RZ_TITLE'
      Size = 180
      EmptyStrToNull = True
    end
    object ForProsmotrRZ_KOD: TFIBIntegerField
      FieldName = 'RZ_KOD'
    end
    object ForProsmotrST_TITLE: TFIBStringField
      FieldName = 'ST_TITLE'
      Size = 180
      EmptyStrToNull = True
    end
    object ForProsmotrST_KOD: TFIBIntegerField
      FieldName = 'ST_KOD'
    end
    object ForProsmotrKEKV_TITLE: TFIBStringField
      FieldName = 'KEKV_TITLE'
      Size = 180
      EmptyStrToNull = True
    end
    object ForProsmotrKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
  end
  object actlst1: TActionList
    Left = 88
    Top = 94
    object act1: TAction
      Caption = 'actClose'
      ShortCut = 115
      OnExecute = act1Execute
    end
  end
end
