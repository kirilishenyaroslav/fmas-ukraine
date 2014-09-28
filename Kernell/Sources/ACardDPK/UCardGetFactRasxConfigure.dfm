object frmFactrasxConfigureFrm: TfrmFactrasxConfigureFrm
  Left = 348
  Top = 207
  Width = 529
  Height = 248
  Caption = #1050#1072#1088#1090#1082#1072' '#1072#1085#1072#1083#1110#1090#1080#1095#1085#1086#1075#1086' '#1086#1073#1083#1110#1082#1091' '#1092#1072#1082#1090#1080#1095#1085#1080#1093' '#1074#1080#1076#1072#1090#1082#1110#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label2: TLabel
    Left = 99
    Top = 124
    Width = 56
    Height = 16
    Caption = #1055#1086#1095#1072#1090#1086#1082
  end
  object Label3: TLabel
    Left = 83
    Top = 150
    Width = 74
    Height = 16
    Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
  end
  object Label4: TLabel
    Left = 107
    Top = 92
    Width = 321
    Height = 16
    Caption = #1055#1077#1088#1110#1086#1076', '#1079#1072' '#1103#1082#1080#1081' '#1090#1088#1077#1073#1072' '#1087#1086#1082#1072#1079#1072#1090#1080' '#1087#1086#1082#1072#1079#1085#1080#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 79
    Top = 23
    Width = 74
    Height = 16
    Caption = #1055#1088#1086#1075#1088#1072#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 73
    Top = 50
    Width = 81
    Height = 16
    Caption = #1058#1080#1087' '#1082#1086#1096#1090#1110#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cbMonthBeg: TcxComboBox
    Left = 176
    Top = 120
    Width = 169
    Height = 24
    Properties.DropDownListStyle = lsFixedList
    Properties.ReadOnly = False
    Style.Color = clInfoBk
    TabOrder = 0
  end
  object cbYearBeg: TcxComboBox
    Left = 352
    Top = 128
    Width = 121
    Height = 24
    Properties.DropDownListStyle = lsFixedList
    Style.Color = clInfoBk
    TabOrder = 1
  end
  object cbMonthEnd: TcxComboBox
    Left = 176
    Top = 146
    Width = 169
    Height = 24
    Properties.DropDownListStyle = lsFixedList
    Properties.ReadOnly = False
    Style.Color = clInfoBk
    TabOrder = 2
  end
  object cxButton1: TcxButton
    Left = 344
    Top = 184
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 3
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 424
    Top = 184
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 4
    OnClick = cxButton2Click
  end
  object cxButtonEdit2: TcxButtonEdit
    Left = 168
    Top = 46
    Width = 297
    Height = 24
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
    Style.Color = clInfoBk
    TabOrder = 5
  end
  object cxButtonEdit3: TcxButtonEdit
    Left = 168
    Top = 19
    Width = 297
    Height = 24
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit3PropertiesButtonClick
    Style.Color = clInfoBk
    TabOrder = 6
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38554.649386689800000000
    ReportOptions.LastChange = 38911.523497129630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo4OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'end;'
      ''
      'procedure Memo1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      '     if (<DBDataset."BU_FINANCE_FACT"><0)'
      '     then Memo3.Font.Color:=clRed'
      '     else Memo3.Font.Color:=clBlack;'
      ''
      '     if (<DBDataset."BU_KASSA_FACT"><0)'
      '     then Memo9.Font.Color:=clRed'
      '     else Memo9.Font.Color:=clBlack;'
      ''
      '     if (<DBDataset."OBJECT_TYPE">=1)'
      '     then begin'
      ''
      '               Memo1.Color:=$00E4E4E4;'
      '               Memo3.Color:=$00E4E4E4;'
      '               Memo9.Color:=$00E4E4E4;'
      '     end;'
      '     if (<DBDataset."OBJECT_TYPE">=2)'
      '     then begin'
      '               Memo1.Color:=$00E4E4E4;'
      '               Memo3.Color:=$00E4E4E4;'
      '               Memo9.Color:=$00E4E4E4;'
      '     end;'
      '     if (<DBDataset."OBJECT_TYPE">=0)'
      '     then begin'
      '               Memo1.Color:=clWindow;'
      '               Memo3.Color:=clWindow;'
      '               Memo9.Color:=clWindow;'
      '     end;'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 8
    Top = 224
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'DBDataset'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 113.385900000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Left = 86.929190000000000000
          Top = 34.015770000000010000
          Width = 536.693260000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1082#1086#1085#1072#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1091'('#1082#1072#1089#1086#1074#1080#1081' '#1086#1073#1083#1110#1082')')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 64.252010000000000000
          Width = 718.110700000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          HAlign = haCenter
          Memo.Strings = (
            '[TITLE]')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 105.826840000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '[DATE]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1088#1091#1082#1091)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'DBDataset'
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 532.913730000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."SHOW_TITLE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 532.913730000000000000
          Width = 90.708637010000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."BU_KASSA_FACT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488167010000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."BU_FINANCE_FACT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 37.795300000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        Condition = 'DBDataset."PROFIT_FLAG"'
        KeepChild = True
        KeepTogether = True
        OutlineText = 'DBDataset."PROFIT_FLAG"'
        object Memo2: TfrxMemoView
          Width = 532.913730000000000000
          Height = 37.795300000000000000
          AllowHTMLTags = True
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."PROFIT_FLAG_TITLE_EX"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 532.914110790000000000
          Width = 90.708720000000000000
          Height = 37.795300000000000000
          AllowHTMLTags = True
          Color = 14211288
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 623.622830790000000000
          Width = 94.488250000000000000
          Height = 37.795300000000000000
          AllowHTMLTags = True
          Color = 14211288
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 37.795300000000000000
        Top = 555.590910000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Left = 578.268090000000000000
          Top = 7.559060000000159000
          Width = 136.063080000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[Page]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = -0.000000000000000444
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559060000000159000
          Width = 570.709030000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1089#1092#1086#1088#1084#1086#1074#1072#1085#1086' [date]'
            #1089#1090#1072#1085' '#1073#1102#1076#1078#1077#1090#1091' [date_data]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 37.795300000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        RowCount = 1
        Stretched = True
        object Memo13: TfrxMemoView
          Width = 532.913730000000000000
          Height = 37.795300000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1076#1110#1083'/'#1089#1090#1072#1090#1090#1103' '#1073#1102#1076#1078#1077#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 532.913730000000000000
          Width = 90.708637010000000000
          Height = 37.795300000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1072#1089#1086#1074#1080#1081' '
            #1086#1073#1083#1110#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488167010000000000
          Height = 37.795300000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1110#1085#1072#1085#1089#1086#1074#1080#1081' '#1086#1073#1083#1110#1082)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          Left = 532.913730000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -12
          Highlight.Font.Name = 'Times New Roman'
          Highlight.Font.Style = []
          Highlight.Color = clSilver
          Highlight.Condition = 'Value<0'
          Memo.Strings = (
            '[SUM(<DBDataset."BU_KASSA_FACT_FC">,MasterData1)]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Width = 532.913730000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."PROFIT_FLAG_TITLE"]:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -12
          Highlight.Font.Name = 'Times New Roman'
          Highlight.Font.Style = []
          Highlight.Color = clSilver
          Highlight.Condition = 'Value<0'
          Memo.Strings = (
            '[SUM(<DBDataset."BU_FINANCE_FACT_FC">,MasterData1)]')
          ParentFont = False
        end
      end
      object MasterData3: TfrxMasterData
        Height = 98.267780000000000000
        Top = 396.850650000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object Memo25: TfrxMemoView
          Top = 18.897650000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1082#1086#1096#1090#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Top = 64.252009999999990000
          Width = 351.496290000000000000
          Height = 30.236240000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -12
          Highlight.Font.Name = 'Times New Roman'
          Highlight.Font.Style = []
          Highlight.Condition = 'Value<0'
          Memo.Strings = (
            '[frxDBDataset2."REST_K"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Top = 41.574830000000020000
          Width = 351.496290000000000000
          Height = 22.677180000000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1072#1089#1086#1074#1080#1081)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 351.496290000000000000
          Top = 41.574830000000020000
          Width = 366.614410000000000000
          Height = 22.677180000000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1110#1085#1072#1085#1089#1086#1074#1080#1081)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 351.496290000000000000
          Top = 64.252009999999990000
          Width = 366.614410000000000000
          Height = 30.236240000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -12
          Highlight.Font.Name = 'Times New Roman'
          Highlight.Font.Style = []
          Highlight.Condition = 'Value<0'
          Memo.Strings = (
            '[frxDBDataset2."REST_F"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'DBDataset'
    CloseDataSource = False
    Left = 40
    Top = 224
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    Left = 72
    Top = 224
  end
end
