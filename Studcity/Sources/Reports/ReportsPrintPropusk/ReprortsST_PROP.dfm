object frmST_PROP: TfrmST_PROP
  Left = 641
  Top = 277
  BorderStyle = bsDialog
  Caption = 'frmST_PROP'
  ClientHeight = 156
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxButtonOK: TcxButton
    Left = 166
    Top = 104
    Width = 75
    Height = 25
    Caption = 'cxButtonOK'
    TabOrder = 4
    OnClick = cxButtonOKClick
  end
  object cxButtonCancel: TcxButton
    Left = 246
    Top = 104
    Width = 75
    Height = 25
    Caption = 'cxButtonCancel'
    TabOrder = 5
    OnClick = cxButtonCancelClick
  end
  object cxLabelCount: TcxLabel
    Left = 8
    Top = 8
    Width = 172
    Height = 17
    TabOrder = 6
    Caption = 'cxLabelCount                                 '
  end
  object cxSpinEditCount: TcxSpinEdit
    Left = 200
    Top = 7
    Width = 121
    Height = 21
    Style.Color = clInfoBk
    TabOrder = 3
    Value = 1
  end
  object cxProgressBar1: TcxProgressBar
    Left = 8
    Top = 40
    Width = 321
    Height = 21
    TabOrder = 7
  end
  object cxLabelTypePrint: TcxLabel
    Left = 8
    Top = 8
    Width = 168
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 8
    Visible = False
    Caption = #1055#1088#1080#1095#1080#1085#1072' '#1076#1088#1091#1082#1091' '#1087#1077#1088#1077#1087#1091#1089#1090#1082#1080
  end
  object cxLabelBegEnd: TcxLabel
    Left = 8
    Top = 56
    Width = 122
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 9
    Visible = False
    Caption = #1063#1072#1089' '#1076#1110#1111' '#1087#1077#1088#1077#1087#1091#1089#1090#1082#1080
  end
  object cxDateEditBeg: TcxDateEdit
    Left = 32
    Top = 72
    Width = 121
    Height = 21
    ParentFont = False
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Visible = False
  end
  object cxDateEditEnd: TcxDateEdit
    Left = 184
    Top = 72
    Width = 121
    Height = 21
    ParentFont = False
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Visible = False
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 73
    Width = 17
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 10
    Visible = False
    Caption = #1047
  end
  object cxLabel2: TcxLabel
    Left = 156
    Top = 73
    Width = 23
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 11
    Caption = #1087#1086
  end
  object DBLookupComboBox: TDBLookupComboBox
    Left = 8
    Top = 32
    Width = 321
    Height = 21
    Color = clInfoBk
    KeyField = 'NOM'
    ListField = 'NAME_NOM'
    ListSource = DataSource1
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 137
    Width = 336
    Height = 19
    Panels = <
      item
        Width = 250
      end>
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38547.971870833300000000
    ReportOptions.LastChange = 40204.584879919000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 56
    Top = 120
    Datasets = <>
    Variables = <
      item
        Name = 'FAM'
        Value = #39#1051#1054#1041#1040#1053#1045#1062#39
      end
      item
        Name = 'IMYA'
        Value = #39#1045#1042#1043#1045#1053#1048#1049#39
      end
      item
        Name = 'OTCH'
        Value = #39#1052#1048#1061#1040#1049#1051#1054#1042#1048#1063#39
      end
      item
        Name = 'FAK'
        Value = #39#1052#1072#1090#1077#1084#1072#1090#1080#1095#1085#1080#1081' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#39
      end
      item
        Name = 'KURS'
        Value = #39'1'#39
      end
      item
        Name = 'BUILDS'
        Value = #39#1054#1073#1097'.'#8470'1'#39
      end
      item
        Name = 'BUILDS_NUM'
        Value = #39'1'#39
      end
      item
        Name = 'ROOMS'
        Value = #39'114('#1041')'#39
      end
      item
        Name = 'DATE_BEG'
        Value = #39'01.09.2006'#39
      end
      item
        Name = 'DATE_END'
        Value = #39'01.07.2007'#39
      end
      item
        Name = 'MAIN_DEP'
        Value = #39#1044#1086#1085#1077#1094#1100#1082#1080#1081' '#1053#1072#1094#1110#1086#1085#1072#1083#1100#1085#1080#1081' '#1059#1085#1110#1074#1077#1088#1089#1080#1090#1077#1090#39
      end
      item
        Name = 'MAIN_PEOPLE'
        Value = #39#1048'.'#1043'. '#1055#1072#1083#1082#1080#1085#39
      end
      item
        Name = 'MAIN_NUMBER_PROPUSK'
        Value = #39'910000005'#39
      end
      item
        Name = 'NAME_CAT_PAY'
        Value = #39#1057#1058#1059#1044#1045#1053#1058'('#1041#1070#1044#1046#1045#1058')'#39
      end
      item
        Name = 'NAME_PROP'
        Value = #39#1055#1056#1054#1055#1059#1057#1050' '#8470#39
      end
      item
        Name = 'OSN_PROP'
        Value = #39#1085#1072' '#1087#1088#1072#1074#1086' '#1074#1093#1086#1076#1072' '#1074#39
      end
      item
        Name = 'ROOMS_PROP'
        Value = #39#1082#1086#1084#1085'.'#39
      end
      item
        Name = 'FAM_PROP'
        Value = #39#1060#1072#1084#1080#1083#1080#1103#39
      end
      item
        Name = 'IMYA_PROP'
        Value = #39#1048#1084#1103#39
      end
      item
        Name = 'OTCH_PROP'
        Value = #39#1054#1090#1095#1077#1089#1090#1074#1086#39
      end
      item
        Name = 'CAT_PROP'
        Value = #39#1050#1072#1090#1077#1075#1086#1088#1080#1103#39
      end
      item
        Name = 'SROK1'
        Value = #39#1057#1088#1086#1082' '#1076#1077#1081#1089#1090#1074#1080#1103': '#1089#39
      end
      item
        Name = 'SROK2'
        Value = #39#1087#1086#39
      end
      item
        Name = 'SROKBEG'
        Value = #39'01.09.2006'#39
      end
      item
        Name = 'SROKEND'
        Value = #39'01.07.2007'#39
      end
      item
        Name = 'DIR_PROP'
        Value = #39#1044#1080#1088#1077#1082#1090#1086#1088#39
      end
      item
        Name = 'DIR0_PROP'
        Value = #39#1089#1090#1091#1076#1075#1086#1088#1086#1076#1082#1072'________________'#39
      end
      item
        Name = 'NAME_FAK'
        Value = #39#1060#1072#1082#1091#1083#1100#1090#1077#1090#39
      end
      item
        Name = 'NAME_KURS'
        Value = #39#1050#1091#1088#1089#39
      end
      item
        Name = 'NAME_VUDAN'
        Value = #39#1042#1099#1076#1072#1085#39
      end
      item
        Name = 'DATE_VUDAN'
        Value = #39'17.08.2006'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 2.000000000000000000
      RightMargin = 2.000000000000000000
      TopMargin = 2.000000000000000000
      BottomMargin = 2.000000000000000000
      object Memo12: TfrxMemoView
        Left = 1050.709340000000000000
        Top = 245.669450000000000000
        Width = 18.897650000000000000
        Height = 317.480520000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -3
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          
            #1089#1090#1091#1076#1075#1086#1088#1086#1076#1086#1082' '#1089#1090#1091#1076#1075#1086#1088#1086#1076#1086#1082' '#1089#1090#1091#1076#1075#1086#1088#1086#1076#1086#1082' '#1089#1090#1091#1076#1075#1086#1088#1086#1076#1086#1082' '#1089#1090#1091#1076#1075#1086#1088#1086#1076#1086#1082' '#1089#1090#1091#1076 +
            #1075#1086#1088#1086#1076#1086#1082' '#1089#1090#1091#1076#1075#1086#1088#1086#1076#1086#1082' '#1089#1090#1091#1076#1075#1086#1088#1086#1076#1086#1082' '#1089#1090#1091#1076#1075#1086#1088#1086#1076#1086#1082' '#1089#1090#1091#1076#1075#1086#1088#1086#1076#1086#1082' '#1089#1090#1091#1076#1075#1086#1088#1086 +
            #1076#1086#1082' '#1089#1090#1091#1076#1075#1086#1088#1086#1076#1086#1082' '#1089#1090#1091#1076#1075#1086#1088#1086#1076#1086#1082' '#1089#1090#1091#1076#1075#1086#1088#1086#1076#1086#1082' '#1089#1090#1091#1076#1075#1086#1088#1086#1076#1086#1082)
        ParentFont = False
        Rotation = 90
        VAlign = vaCenter
      end
      object Memo1: TfrxMemoView
        Left = 839.055586770000000000
        Top = 272.126160000000000000
        Width = 120.944960000000000000
        Height = 26.456710000000000000
        AutoWidth = True
        CharSpacing = 2.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[NAME_PROP]')
        ParentFont = False
      end
      object Memo2: TfrxMemoView
        Left = 850.394250000000000000
        Top = 298.582870000000000000
        Width = 226.771800000000000000
        Height = 18.897650000000000000
        StretchMode = smMaxHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        HAlign = haCenter
        Memo.Strings = (
          '[OSN_PROP]')
        ParentFont = False
      end
      object Memo3: TfrxMemoView
        Left = 944.882500000000000000
        Top = 313.700990000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[ROOMS_PROP]')
        ParentFont = False
      end
      object Memo4: TfrxMemoView
        Left = 850.394250000000000000
        Top = 332.598640000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[FAM_PROP]')
        ParentFont = False
      end
      object Memo5: TfrxMemoView
        Left = 850.394250000000000000
        Top = 347.716760000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[IMYA_PROP]')
        ParentFont = False
      end
      object Memo6: TfrxMemoView
        Left = 850.394250000000000000
        Top = 362.834880000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[OTCH_PROP]')
        ParentFont = False
      end
      object Memo7: TfrxMemoView
        Left = 850.394250000000000000
        Top = 377.953000000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[CAT_PROP]')
        ParentFont = False
      end
      object Memo8: TfrxMemoView
        Left = 850.394250000000000000
        Top = 408.189240000000000000
        Width = 136.063080000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[SROK1]')
        ParentFont = False
      end
      object Memo10: TfrxMemoView
        Left = 850.394250000000000000
        Top = 468.661720000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[DIR_PROP]')
        ParentFont = False
      end
      object Memo11: TfrxMemoView
        Left = 850.394250000000000000
        Top = 483.779840000000000000
        Width = 283.464750000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[DIR0_PROP][MAIN_PEOPLE]')
        ParentFont = False
      end
      object Memo9: TfrxMemoView
        Align = baLeft
        Left = 960.000546770000000000
        Top = 275.905690000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[MAIN_NUMBER_PROPUSK]')
        ParentFont = False
      end
      object Memo13: TfrxMemoView
        Left = 793.701300000000000000
        Top = 257.008040000000000000
        Width = 313.700990000000000000
        Height = 18.897650000000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        HAlign = haRight
        Memo.Strings = (
          '[MAIN_DEP]   ')
        ParentFont = False
      end
      object Memo14: TfrxMemoView
        Left = 948.662030000000000000
        Top = 332.598640000000000000
        Width = 154.960730000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[FAM]')
        ParentFont = False
      end
      object Memo15: TfrxMemoView
        Left = 948.662030000000000000
        Top = 347.716760000000000000
        Width = 154.960730000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[IMYA]')
        ParentFont = False
      end
      object Memo16: TfrxMemoView
        Left = 948.662030000000000000
        Top = 362.834880000000000000
        Width = 154.960730000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[OTCH]')
        ParentFont = False
      end
      object Memo17: TfrxMemoView
        Left = 1024.252630000000000000
        Top = 313.700990000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[ROOMS]')
        ParentFont = False
      end
      object Memo18: TfrxMemoView
        Left = 865.512370000000000000
        Top = 313.700990000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[BUILDS]')
        ParentFont = False
      end
      object Memo19: TfrxMemoView
        Left = 797.480830000000000000
        Top = 260.787570000000000000
        Width = 41.574830000000000000
        Height = 49.133890000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -37
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[BUILDS_NUM]')
        ParentFont = False
      end
      object Memo20: TfrxMemoView
        Left = 948.662030000000000000
        Top = 377.953000000000000000
        Width = 154.960730000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[NAME_CAT_PAY]')
        ParentFont = False
      end
      object Memo21: TfrxMemoView
        Left = 986.457330000000000000
        Top = 408.189240000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[SROKBEG]')
        ParentFont = False
      end
      object Memo22: TfrxMemoView
        Left = 941.102970000000000000
        Top = 427.086890000000000000
        Width = 45.354360000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[SROK2]')
        ParentFont = False
      end
      object Memo23: TfrxMemoView
        Left = 986.457330000000000000
        Top = 427.086890000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[SROKEND]')
        ParentFont = False
      end
      object Memo24: TfrxMemoView
        Left = 850.394250000000000000
        Top = 393.071120000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[NAME_FAK]')
        ParentFont = False
      end
      object Memo25: TfrxMemoView
        Left = 948.662030000000000000
        Top = 393.071120000000000000
        Width = 83.149660000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[FAK]')
        ParentFont = False
      end
      object Memo26: TfrxMemoView
        Left = 1031.811690000000000000
        Top = 393.071120000000000000
        Width = 34.015770000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[NAME_KURS]')
        ParentFont = False
      end
      object Memo27: TfrxMemoView
        Left = 1065.827460000000000000
        Top = 393.071120000000000000
        Width = 41.574830000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[KURS]')
        ParentFont = False
      end
      object Memo28: TfrxMemoView
        Left = 873.071430000000000000
        Top = 449.764070000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[NAME_VUDAN]')
        ParentFont = False
      end
      object Memo29: TfrxMemoView
        Left = 952.441560000000000000
        Top = 449.764070000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[DATE_VUDAN]')
        ParentFont = False
      end
      object Memo30: TfrxMemoView
        Left = 748.346940000000000000
        Top = 536.693260000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = pFIBDataSet
    Left = 232
    Top = 128
  end
  object pFIBDataSet: TpFIBDataSet
    Left = 264
    Top = 128
    poSQLINT64ToBCD = True
  end
  object pFIBStoredProc: TpFIBStoredProc
    Left = 296
    Top = 128
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 24
    Top = 120
  end
  object pFIBDatabase: TpFIBDatabase
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Top = 88
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TACommit
    Left = 24
    Top = 88
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSetTypePrint
    Left = 16
    Top = 24
  end
  object pFIBDataSetTypePrint: TpFIBDataSet
    Database = pFIBDatabase
    Transaction = Transaction
    SelectSQL.Strings = (
      'select * from ST_SP_TYPE_PRINT_PROP'
      'order by ORDER_FIELDS')
    Left = 48
    Top = 24
    poSQLINT64ToBCD = True
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TARollback
    Left = 56
    Top = 88
  end
  object ActionList1: TActionList
    Left = 280
    Top = 24
    object Designer: TAction
      Caption = 'Designer'
      ShortCut = 57412
      OnExecute = DesignerExecute
    end
  end
  object frxDesigner2: TfrxDesigner
    Restrictions = []
    Left = 88
    Top = 120
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 120
    Top = 120
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = DataSetPrint
    Left = 88
    Top = 88
  end
  object DataSetPrint: TpFIBDataSet
    Database = pFIBDatabase
    Transaction = Transaction
    SelectSQL.Strings = (
      'select * from ST_SP_TYPE_PRINT_PROP'
      'order by ORDER_FIELDS')
    Left = 120
    Top = 88
    poSQLINT64ToBCD = True
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 160
    Top = 88
  end
end
