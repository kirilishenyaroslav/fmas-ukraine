object frmCalc: TfrmCalc
  Left = 528
  Top = 179
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmCalc'
  ClientHeight = 138
  ClientWidth = 246
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TcxButton
    Left = 61
    Top = 80
    Width = 87
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 155
    Top = 80
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 65
    Alignment = alTopLeft
    TabOrder = 2
    object cxDateEdit: TcxDateEdit
      Left = 128
      Top = 16
      Width = 97
      Height = 21
      Properties.DateButtons = []
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxLabelDate: TcxLabel
      Left = 4
      Top = 17
      Width = 117
      Height = 17
      AutoSize = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 111
    Width = 246
    Height = 27
    Panels = <
      item
        Width = 200
      end>
  end
  object ProgressBar: TcxProgressBar
    Left = 124
    Top = 115
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object Database: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 64
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 168
    Top = 56
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 16
    Top = 8
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 32
    Top = 104
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38532.975292777800000000
    ReportOptions.LastChange = 38855.916175833300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure Memo12OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if <DOLG_FINAL>=0.00 then'
      '    begin'
      '       Memo39.Text:=<PAYCONF1>+'#39' '#39'+<PAYCONF2>+'#39'.'#39';'
      '       Memo35.visible := false;'
      '       Memo36.visible := false'
      '    end;'
      ''
      'end;'
      ''
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <REC>>=25 then'
      '    begin'
      '      Page1.BottomMargin:=55;'
      '    end;'
      'end;'
      ''
      'procedure Memo11OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnPrintReport = frxReportPrintReport
    Left = 112
    Top = 64
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = 'PLATIL_FINAL'
        Value = #39'7746'#39
      end
      item
        Name = 'NADO_FINAL'
        Value = #39'7746'#39
      end
      item
        Name = 'DOLG_FINAL'
        Value = #39'0'#39
      end
      item
        Name = 'NAMEREP0'
        Value = #39#1056#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1085#1072#39
      end
      item
        Name = 'NAMEREP'
        Value = #39#1044#1086#1074#1110#1076#1082#1072' '#8470#39
      end
      item
        Name = 'NAMEREP1'
        Value = #39#1087#1088#1086' '#1089#1090#1072#1085' '#1074#1080#1082#1086#1085#1072#1085#1085#1103' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1079#1072' '#1085#1072#1074#1095#1072#1085#1085#1103#39
      end
      item
        Name = 'NAMEREP2'
        Value = #39#1044#1086#1075#1086#1074#1110#1088' '#8470#39
      end
      item
        Name = 'OBUCHAEMIY'
        Value = #39#1054#1089#1086#1073#1072', '#1097#1086' '#1085#1072#1074#1095#1072#1108#1090#1100#1089#1103#39
      end
      item
        Name = 'BEGDATE'
        Value = #39#1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091#39
      end
      item
        Name = 'ENDDATE'
        Value = #39#1050#1110#1085#1077#1094#1100' '#1087#1077#1088#1110#1086#1076#1091#39
      end
      item
        Name = 'STOIMOTS'
        Value = #39#1042#1072#1088#1090#1110#1089#1090#1100' '#1085#1072#1074#1095'., '#1075#1088#1085#39
      end
      item
        Name = 'SUMMA_LG'
        Value = #39#1057#1091#1084#1086#1074#1072' '#1087#1110#1083#1100#1075#1072', '#1075#1088#1085#39
      end
      item
        Name = 'PERCENT_LG'
        Value = #39#1042#1110#1076#1089#1086#1090#1086#1082' '#1087#1110#1083#1100#1075#1080', %'#39
      end
      item
        Name = 'BEG_DOLG'
        Value = #39#1041#1086#1088#1075' '#1085#1072' '#1087#1086#1095#1072#1090#1086#1082', '#1075#1088#1085#39
      end
      item
        Name = 'ALLPERIOD'
        Value = #39#1057#1091#1084#1072' '#1079#1072' '#1087#1077#1088#1110#1086#1076', '#1075#1088#1085#39
      end
      item
        Name = 'SUMPAY'
        Value = #39#1057#1091#1084#1072', '#1097#1086' '#1085#1072#1076#1110#1081#1096#1083#1072', '#1075#1088#1085#39
      end
      item
        Name = 'SUMDOLG'
        Value = #39#1041#1086#1088#1075' '#1085#1072' '#1082#1110#1085#1077#1094#1100', '#1075#1088#1085#39
      end
      item
        Name = 'PAYCONF1'
        Value = #39#1054#1087#1083#1072#1095#1077#1085#1086#39
      end
      item
        Name = 'PAYCONF2'
        Value = #39#1087#1086#1074#1085#1110#1089#1090#1102#39
      end
      item
        Name = 'BUHG'
        Value = #39#1041#1091#1093#1075#1072#1083#1090#1077#1088#39
      end
      item
        Name = 'ORG'
        Value = #39#1044#1086#1085#1077#1094#1100#1082#1080#1081' '#1053#1072#1094#1110#1086#1085#1072#1083#1100#1085#1080#1081' '#1059#1085#1110#1074#1077#1088#1089#1080#1090#1077#1090#39
      end
      item
        Name = 'FIO'
        Value = #39#1030#1047#1054#1058#1054#1042#1040' '#1054#1051#1045#1053#1040' '#1042#1030#1050#1058#1054#1056#1030#1042#1053#1040#39
      end
      item
        Name = 'NUMBER'
        Value = #39'100002'#39
      end
      item
        Name = 'SUMOPL'
        Value = #39'0'#39
      end
      item
        Name = 'REC'
        Value = #39'3'#39
      end
      item
        Name = 'SP_VIDANA'
        Value = #39#1044#1086#1074#1110#1076#1082#1072' '#1074#1080#1076#1072#1085#1072' '#1076#1083#1103' '#1087#1088#1077#1076#1103#39#39#1074#1083#1077#1085#1085#1103' '#1079#1072' '#1084#1110#1089#1094#1077#1084' '#1074#1080#1084#1086#1075#1080#39
      end
      item
        Name = 'VSEGO'
        Value = #39#1056#1072#1079#1086#1084':'#39
      end
      item
        Name = 'SUMMA_K_OPLATE'
        Value = #39#1057#1091#1084#1072' '#1086#1087#1083#1072#1090#1080#39
      end
      item
        Name = 'UGE_OPLACHENO'
        Value = #39#1042#1078#1077' '#1089#1087#1083#1072#1095#1077#1085#1086#39
      end
      item
        Name = 'SUMMA_DOLGA'
        Value = #39#1057#1091#1084#1072' '#1073#1086#1088#1075#1091#39
      end
      item
        Name = 'NUM_DOG'
        Value = #39'446/01-59/98'#39
      end
      item
        Name = 'SUM_DOLG_FINAL'
        Value = #39'249'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 27.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 20.000000000000000000
      BottomMargin = 20.000000000000000000
      OnBeforePrint = 'Page1OnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        Height = 132.283550000000000000
        Top = 18.897650000000000000
        Width = 653.858690000000000000
        object Memo16: TfrxMemoView
          Align = baCenter
          Left = 177.637910000000000000
          Top = 15.118120000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          CharSpacing = 2.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ORG]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Align = baCenter
          Left = 287.244280000000000000
          Top = 49.133889999999990000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[NAMEREP] [NUMBER]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Align = baCenter
          Left = 287.244280000000000000
          Top = 64.252010000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[NAMEREP1]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Align = baLeft
          Top = 98.267780000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[NAMEREP2]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 170.078850000000000000
          Top = 113.385900000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold, fsItalic, fsUnderline]
          Memo.Strings = (
            '[FIO]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Align = baLeft
          Top = 113.385900000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[OBUCHAEMIY]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 75.590600000000000000
          Top = 98.267780000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[NUM_DOG]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 253.228510000000000000
        Width = 653.858690000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo1: TfrxMemoView
          Align = baLeft
          Width = 71.811016300000000000
          Height = 15.118120000000000000
          DataField = 'BEG_DATE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."BEG_DATE"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baLeft
          Left = 71.811016300000000000
          Width = 71.811016300000000000
          Height = 15.118120000000000000
          DataField = 'END_DATE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."END_DATE"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baLeft
          Left = 143.622032600000000000
          Width = 68.031491180000000000
          Height = 15.118120000000000000
          DataField = 'STOIMOST'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."STOIMOST"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Left = 211.653523780000000000
          Width = 71.811035830000000000
          Height = 15.118120000000000000
          DataField = 'SUMMA_LG'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."SUMMA_LG"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          Left = 283.464559610000000000
          Width = 71.811021180000000000
          Height = 15.118120000000000000
          DataField = 'PERCENT_LG'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."PERCENT_LG"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          Left = 355.275580790000000000
          Width = 71.811038270000000000
          Height = 15.118120000000000000
          DataField = 'DOLG_NACHALO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."DOLG_NACHALO"]')
          ParentFont = False
        end
        object MemoKatPay: TfrxMemoView
          Align = baLeft
          Left = 427.086619060000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DataField = 'SUMMA_ZA_PERIOD'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."SUMMA_ZA_PERIOD"]')
          ParentFont = False
        end
        object MemoPayPeriod: TfrxMemoView
          Align = baLeft
          Left = 502.677170239999900000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DataField = 'POSTUPIV_SUMMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."POSTUPIV_SUMMA"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Left = 578.267721419999900000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo7OnBeforePrint'
          DataField = 'DOLG_KONEZ'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."DOLG_KONEZ"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 18.897650000000000000
        Top = 211.653680000000000000
        Width = 653.858690000000000000
        Stretched = True
        object Memo20: TfrxMemoView
          Align = baLeft
          Width = 71.811016300000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[BEGDATE]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Align = baLeft
          Left = 71.811016300000000000
          Width = 71.811016300000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ENDDATE]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Align = baLeft
          Left = 143.622032600000000000
          Width = 68.031491180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[STOIMOTS]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          Left = 211.653523780000000000
          Width = 71.811035830000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[SUMMA_LG]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Align = baLeft
          Left = 283.464559610000000000
          Width = 71.811021180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[PERCENT_LG]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Align = baLeft
          Left = 355.275580790000000000
          Width = 71.811038270000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[BEG_DOLG]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Align = baLeft
          Left = 427.086619060000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ALLPERIOD]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Align = baLeft
          Left = 502.677170239999900000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[SUMPAY]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Align = baLeft
          Left = 578.267721419999900000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[SUMDOLG]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 173.858380000000000000
        Top = 328.819110000000000000
        Width = 653.858690000000000000
        object Memo8: TfrxMemoView
          Width = 427.086890000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[VSEGO]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          Left = 427.086890000000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[NADO_FINAL]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          Left = 502.677441179999900000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[PLATIL_FINAL]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baLeft
          Left = 578.267992360000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo11OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[DOLG_FINAL]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 166.299320000000000000
          Top = 52.913419999999970000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[NADO_FINAL]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Align = baLeft
          Top = 151.181200000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[BUHG]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Align = baLeft
          Top = 124.724490000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[SP_VIDANA]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Align = baLeft
          Top = 37.795300000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[VSEGO]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 166.299320000000000000
          Top = 68.031540000000010000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[PLATIL_FINAL]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 90.708720000000030000
          Width = 264.567100000000000000
          Frame.Typ = [ftTop]
        end
        object Memo33: TfrxMemoView
          Left = 238.110390000000000000
          Top = 52.913419999999970000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1075#1088#1085'.')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 238.110390000000000000
          Top = 68.031540000000010000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1075#1088#1085'.')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 166.299320000000000000
          Top = 90.708720000000030000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[DOLG_FINAL]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 238.110390000000000000
          Top = 90.708720000000030000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1075#1088#1085'.')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 12.451453330000000000
          Top = 54.026283330000010000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[SUMMA_K_OPLATE]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 12.671923330000000000
          Top = 69.144403340000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[UGE_OPLACHENO]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 11.338590000000000000
          Top = 90.708720000000030000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[SUMMA_DOLGA]')
          ParentFont = False
        end
      end
      object Memo29: TfrxMemoView
        Align = baLeft
        Top = 15.118120000000000000
        Width = 113.385900000000000000
        Height = 45.354360000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[Date]')
        ParentFont = False
      end
    end
  end
  object pFIBDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from cn_tmp_print_cn_calc'
      'where cn_tmp_print_cn_calc.id_session =:param_id_transaction')
    Left = 80
    poSQLINT64ToBCD = True
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = pFIBDataSet
    Left = 280
    Top = 16
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 312
    Top = 16
  end
  object pFIBDataSet3: TpFIBDataSet
    Left = 280
    Top = 48
    poSQLINT64ToBCD = True
  end
  object ActionList1: TActionList
    Left = 200
    Top = 8
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 57412
      OnExecute = Action1Execute
    end
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 128
    Top = 144
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 168
    Top = 144
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 208
    Top = 144
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
    Left = 248
    Top = 144
  end
  object pFIBStoredProcFinal: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 128
    Top = 8
  end
end
