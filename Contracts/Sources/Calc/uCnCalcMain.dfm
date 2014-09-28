object fmCalcMain: TfmCalcMain
  Left = 613
  Top = 353
  Width = 247
  Height = 124
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 38
    Top = 13
    Width = 60
    Height = 13
    Caption = #1047#1074#1110#1090' '#1085#1072' '#1076#1072#1090#1091
  end
  object cxButtonOk: TcxButton
    Left = 12
    Top = 43
    Width = 100
    Height = 25
    Caption = 'cxButtonOk'
    TabOrder = 0
    OnClick = cxButtonOkClick
  end
  object cxButtonCancel: TcxButton
    Left = 124
    Top = 43
    Width = 100
    Height = 25
    Caption = 'cxButtonCancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = cxButtonCancelClick
  end
  object cxDateCalc: TcxDateEdit
    Left = 110
    Top = 8
    Width = 89
    Height = 21
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 2
    EditValue = 0d
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38532.975292777800000000
    ReportOptions.LastChange = 39849.745479953700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure Memo12OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if <DOLG_FINAL>=0.00 then'
      '    begin'
      '//       Memo39.Text:=<PAYCONF1>+'#39' '#39'+<PAYCONF2>+'#39'.'#39';'
      '//       Memo35.visible := false;'
      '//       Memo36.visible := false'
      '    end;'
      ''
      'end;'
      ''
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' { if <REC>>=25 then'
      '    begin'
      '      Page1.BottomMargin:=55;'
      '    end;}'
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
    Left = 8
    Top = 24
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = 'PLATIL_FINAL'
        Value = #39'10964'#39
      end
      item
        Name = 'NADO_FINAL'
        Value = #39'10964'#39
      end
      item
        Name = 'DOLG_FINAL'
        Value = #39'0'#39
      end
      item
        Name = 'CNDATEOPL_cap'
        Value = #39#1057#1087#1083#1072#1095#1077#1085#1086' '#1087#1086' '#39
      end
      item
        Name = 'CNDATEOPL'
        Value = #39'01.07.2003'#39
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
        Value = #39#1057#1087#1083#1072#1095#1077#1085#1086#39
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
        Value = #39#1044#1086#1085#1077#1094#1100#1082#1080#1081' '#1085#1072#1094#1110#1086#1085#1072#1083#1100#1085#1080#1081' '#1091#1085#1110#1074#1077#1088#1089#1080#1090#1077#1090#39
      end
      item
        Name = 'FIO'
        Value = #39#1047#1059#1041#1045#1053#1050#1054' '#1040#1051#1068#1054#1053#1040' '#1042#1040#1044#1048#1052#1030#1042#1053#1040#39
      end
      item
        Name = 'NUMBER'
        Value = #39#8470'100657'#39
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
        Value = #39#1044#1086#1074#1110#1076#1082#1072' '#1074#1080#1076#1072#1085#1072' '#1076#1083#1103' '#1087#1088#1077#1076#39#39#1103#1074#1083#1077#1085#1085#1103' '#1079#1072' '#1084#1110#1089#1094#1077#1084' '#1074#1080#1084#1086#1075#1080#39
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
        Value = #39'4942/25-70/02'#39
      end
      item
        Name = 'SUM_DOLG_FINAL'
        Value = #39'0'#39
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
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ORG]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Align = baCenter
          Left = 0.000000000000012074
          Top = 49.133889999999990000
          Width = 653.858690000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1074#1110#1076#1082#1072' [NUMBER]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Align = baCenter
          Left = 0.000000000000012074
          Top = 64.252010000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1088#1086' '#1089#1090#1072#1085' '#1074#1080#1082#1086#1085#1072#1085#1085#1103' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1079#1072' '#1085#1072#1074#1095#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
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
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1044#1086#1075#1086#1074#1110#1088' '#8470)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 170.078850000000000000
          Top = 113.385900000000000000
          Width = 476.220780000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Memo.Strings = (
            '[FIO]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Align = baLeft
          Top = 113.385900000000000000
          Width = 162.519790000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1054#1089#1086#1073#1072', '#1097#1086' '#1085#1072#1074#1095#1072#1108#1090#1100#1089#1103)
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
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[NUM_DOG]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 260.787570000000000000
        Width = 653.858690000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo1: TfrxMemoView
          Align = baLeft
          Width = 71.811016300000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
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
          Font.Name = 'Arial'
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
          Font.Name = 'Arial'
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
          Font.Name = 'Arial'
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
          Font.Name = 'Arial'
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
          Font.Name = 'Arial'
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
          Font.Name = 'Arial'
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
          Left = 502.677170240000000000
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
          Font.Name = 'Arial'
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
          Left = 578.267721420000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo7OnBeforePrint'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
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
        Height = 26.456710000000000000
        Top = 211.653680000000000000
        Width = 653.858690000000000000
        Stretched = True
        object Memo20: TfrxMemoView
          Align = baLeft
          Width = 71.811016300000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1095#1072#1090#1086#1082
            #1087#1077#1088#1110#1086#1076#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Align = baLeft
          Left = 71.811016300000000000
          Width = 71.811016300000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1085#1077#1094#1100
            #1087#1077#1088#1110#1086#1076#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Align = baLeft
          Left = 143.622032600000000000
          Width = 68.031491180000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1042#1072#1088#1090#1110#1089#1090#1100
            #1085#1072#1074#1095'., '#1075#1088#1085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          Left = 211.653523780000000000
          Width = 71.811035830000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1086#1074#1072
            #1087#1110#1083#1100#1075#1072', '#1075#1088#1085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Align = baLeft
          Left = 283.464559610000000000
          Width = 71.811021180000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1089#1086#1090#1086#1082
            #1087#1110#1083#1100#1075#1080', %')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Align = baLeft
          Left = 355.275580790000000000
          Width = 71.811038270000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1041#1086#1088#1075' '#1085#1072' '
            #1087#1086#1095#1072#1090#1086#1082', '#1075#1088#1085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Align = baLeft
          Left = 427.086619060000000000
          Width = 75.590551180000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072' '#1079#1072
            #1087#1077#1088#1110#1086#1076', '#1075#1088#1085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Align = baLeft
          Left = 502.677170239999900000
          Width = 75.590551180000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072', '#1097#1086
            #1085#1072#1076#1110#1081#1096#1083#1072', '#1075#1088#1085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Align = baLeft
          Left = 578.267721419999900000
          Width = 75.590551180000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1041#1086#1088#1075' '#1085#1072
            #1082#1110#1085#1077#1094#1100', '#1075#1088#1085)
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 188.976500000000000000
        ParentFont = False
        Top = 381.732530000000000000
        Width = 653.858690000000000000
        object Memo12: TfrxMemoView
          Left = 166.299320000000000000
          Top = 64.252009999999990000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[NADO_FINAL]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Align = baLeft
          Top = 162.519790000000100000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1041#1091#1093#1075#1072#1083#1090#1077#1088)
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Align = baLeft
          Top = 136.063080000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1044#1086#1074#1110#1076#1082#1072' '#1074#1080#1076#1072#1085#1072' '#1076#1083#1103' '#1087#1088#1077#1076#39#1103#1074#1083#1077#1085#1085#1103' '#1079#1072' '#1084#1110#1089#1094#1077#1084' '#1074#1080#1084#1086#1075)
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Align = baLeft
          Top = 49.133890000000010000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1056#1072#1079#1086#1084':')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 166.299320000000000000
          Top = 79.370130000000010000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[PLATIL_FINAL]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 11.338590000000000000
          Top = 102.047310000000000000
          Width = 264.567100000000000000
          Frame.Typ = [ftTop]
        end
        object Memo33: TfrxMemoView
          Left = 238.110390000000000000
          Top = 64.252009999999990000
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
          Top = 79.370130000000010000
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
          Top = 105.826840000000000000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[DOLG_FINAL]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 238.110390000000000000
          Top = 105.826840000000000000
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
          Top = 65.364873330000030000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1057#1091#1084#1072' '#1086#1087#1083#1072#1090#1080)
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 12.671923330000000000
          Top = 80.482993340000010000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1042#1078#1077' '#1089#1087#1083#1072#1095#1077#1085#1086)
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 12.338590000000000000
          Top = 105.826840000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1057#1091#1084#1072' '#1073#1086#1088#1075#1091)
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Align = baLeft
          Top = 18.897650000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1057#1087#1072#1083#1077#1085#1086' '#1087#1086)
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 98.267780000000000000
          Top = 18.897650000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CNDATEOPL] '#1088'.')
          ParentFont = False
        end
      end
      object Memo29: TfrxMemoView
        Align = baLeft
        Top = 15.118120000000000000
        Width = 113.385900000000000000
        Height = 41.574830000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.Strings = (
          '[Date]')
        ParentFont = False
      end
      object Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 298.582870000000000000
        Width = 653.858690000000000000
        object Memo8: TfrxMemoView
          Width = 427.086890000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            #1056#1072#1079#1086#1084':')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          Left = 427.086890000000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[SUM([frxDBDataset1."SUMMA_ZA_PERIOD"])]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          Left = 502.677441179999900000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[SUM([frxDBDataset1."POSTUPIV_SUMMA"])]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baLeft
          Left = 578.267992360000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo7OnBeforePrint'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[SUM([frxDBDataset1."DOLG_KONEZ"])]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = dmCalc.DataSet
    Left = 48
    Top = 16
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 64
    Top = 16
  end
  object DataSet: TpFIBDataSet
    Database = dmCalc.DB
    Transaction = dmCalc.ReadTransaction
    UpdateTransaction = dmCalc.WriteTransaction
    Left = 56
    Top = 72
    poSQLINT64ToBCD = True
  end
  object ActionList1: TActionList
    Left = 160
    Top = 56
    object acDebug: TAction
      Caption = 'acDebug'
      ShortCut = 57412
      OnExecute = acDebugExecute
    end
  end
end
