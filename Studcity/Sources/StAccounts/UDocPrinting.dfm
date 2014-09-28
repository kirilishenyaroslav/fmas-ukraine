object frmDocPrinting: TfrmDocPrinting
  Left = 329
  Top = 164
  BorderStyle = bsDialog
  Caption = #1044#1088#1091#1082' '#1088#1072#1093#1091#1085#1082#1072
  ClientHeight = 409
  ClientWidth = 559
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
    Top = 367
    Width = 559
    Height = 42
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 392
      Top = 8
      Width = 75
      Height = 25
      Caption = #1044#1088#1091#1082
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 472
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 559
    Height = 367
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1050#1086#1085#1092#1110#1075#1091#1088#1072#1094#1110#1103' '#1079#1074#1110#1090#1091
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 551
        Height = 336
        Align = alClient
        TabOrder = 0
        object cxFixedBuValues: TcxCheckBox
          Left = 11
          Top = 9
          Width = 249
          Height = 24
          Enabled = False
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = cxFixedBuValuesPropertiesChange
          Properties.Caption = #1058#1110#1083#1100#1082#1080' '#1087#1086' '#1074#1080#1073#1088#1072#1085#1085#1080#1084' '#1079#1085#1072#1095#1077#1085#1085#1103#1084
          TabOrder = 0
        end
        object EdSm: TcxTextEdit
          Left = 11
          Top = 37
          Width = 426
          Height = 24
          Enabled = False
          Properties.ReadOnly = True
          Style.Color = clInfoBk
          TabOrder = 1
        end
        object EdRz: TcxTextEdit
          Left = 11
          Top = 61
          Width = 426
          Height = 24
          Enabled = False
          Properties.ReadOnly = True
          Style.Color = clInfoBk
          TabOrder = 2
        end
        object EdSt: TcxButtonEdit
          Left = 11
          Top = 85
          Width = 426
          Height = 24
          Enabled = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = EdStPropertiesButtonClick
          Style.Color = clInfoBk
          TabOrder = 3
        end
        object cxFixedTypeCalcValues: TcxCheckBox
          Left = 17
          Top = 159
          Width = 249
          Height = 24
          Enabled = False
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = cxFixedTypeCalcValuesPropertiesChange
          Properties.Caption = #1058#1110#1083#1100#1082#1080' '#1087#1086' '#1074#1080#1073#1088#1072#1085#1085#1080#1084' '#1079#1085#1072#1095#1077#1085#1085#1103#1084
          TabOrder = 4
        end
        object RGTypeCalc: TcxRadioGroup
          Left = 13
          Top = 176
          Width = 421
          Height = 58
          Enabled = False
          ItemIndex = 0
          Properties.Items = <
            item
              Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1079#1072' '#1087#1077#1088#1110#1086#1076
            end
            item
              Caption = #1055#1077#1088#1077#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1079#1072' '#1084#1080#1085#1091#1083#1110' '#1087#1077#1088#1110#1086#1076#1080
            end>
          Properties.OnChange = RGTypeCalcPropertiesChange
          TabOrder = 5
          Caption = ''
        end
        object RGTypeStud: TcxRadioGroup
          Left = 14
          Top = 258
          Width = 421
          Height = 58
          Enabled = False
          ItemIndex = 0
          Properties.Items = <
            item
              Caption = #1057#1090#1091#1076#1077#1085#1090#1080
            end
            item
              Caption = #1030#1085#1096#1110' '#1082#1072#1090#1077#1075#1086#1088#1110#1111
            end>
          Properties.OnChange = RGTypeStudPropertiesChange
          TabOrder = 6
          Caption = ''
        end
        object cxFixedTypeStudValues: TcxCheckBox
          Left = 18
          Top = 240
          Width = 249
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = cxFixedTypeStudValuesPropertiesChange
          Properties.Caption = #1058#1110#1083#1100#1082#1080' '#1087#1086' '#1074#1080#1073#1088#1072#1085#1085#1080#1084' '#1079#1085#1072#1095#1077#1085#1085#1103#1084
          TabOrder = 7
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1110' '#1087#1072#1088#1077#1084#1077#1090#1088#1080
      ImageIndex = 1
      object CheckDep: TcxCheckBox
        Left = 7
        Top = 6
        Width = 257
        Height = 24
        Enabled = False
        ParentFont = False
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = CheckDepPropertiesChange
        Properties.Caption = #1060#1110#1083#1100#1090#1088' '#1087#1086' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1091
        TabOrder = 0
      end
      object EdDepartments: TcxButtonEdit
        Left = 11
        Top = 27
        Width = 426
        Height = 24
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = EdDepartmentsPropertiesButtonClick
        Style.Color = clInfoBk
        TabOrder = 1
      end
    end
  end
  object WaitPanel: TPanel
    Left = 56
    Top = 72
    Width = 433
    Height = 105
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
    object Label1: TLabel
      Left = 64
      Top = 16
      Width = 309
      Height = 16
      Caption = #1063#1077#1082#1072#1081#1090#1077', '#1081#1076#1077' '#1087#1110#1076#1075#1086#1090#1086#1074#1082#1072' '#1076#1072#1085#1085#1080#1093' '#1076#1086' '#1076#1088#1091#1082#1091
    end
    object ProgressBar1: TProgressBar
      Left = 13
      Top = 40
      Width = 407
      Height = 16
      TabOrder = 0
    end
    object cxButton3: TcxButton
      Left = 176
      Top = 72
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton3Click
    end
  end
  object PrintDataSet: TpFIBDataSet
    Left = 24
    Top = 143
    poSQLINT64ToBCD = True
  end
  object PrintDataSource: TDataSource
    DataSet = PrintDataSet
    Left = 24
    Top = 175
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup]
    PreviewOptions.ShowCaptions = True
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38516.665087581000000000
    ReportOptions.LastChange = 38827.673735937500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  SumD,SumP,OutSumD,OutSumP:Variant;'
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   if <Page#>=1 then PageHeader1.visible:=false'
      '  else PageHeader1.visible:=true;'
      'end;'
      ''
      'procedure Memo5OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '     if (<frxDBDatasetDetails."IN_NACH"><0)'
      '     then begin'
      '               Memo5.text:='#39'0.00'#39';'
      
        '               Memo27.Text:=FloatToStr(-1*<frxDBDatasetDetails."' +
        'IN_NACH">);'
      '               SumP:=SumP+(-1*<frxDBDatasetDetails."IN_NACH">);'
      '     end'
      '     else begin'
      '               Memo27.Text:='#39'0.00'#39';'
      '               SumD:=SumD+(<frxDBDatasetDetails."IN_NACH">);'
      '     end;'
      ''
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SumD:=0;'
      '  SumP:=0;'
      '  OutSumD:=0;'
      '  OutSumP:=0;'
      ''
      'end;'
      ''
      'procedure Memo23OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '     if (<frxDBDatasetDetails."OUT_NACH"><0)'
      '     then begin'
      '               Memo23.Text:='#39'0.00'#39';'
      
        '               Memo8.Text:=FloatToStr(-1*<frxDBDatasetDetails."O' +
        'UT_NACH">);'
      
        '               OutSumP:=OutSumP+(-1*<frxDBDatasetDetails."OUT_NA' +
        'CH">);'
      '     end'
      '     else begin'
      '               Memo8.Text:='#39'0.00'#39';'
      
        '               OutSumD:=OutSumD+(<frxDBDatasetDetails."OUT_NACH"' +
        '>);'
      '     end;'
      ''
      'end;'
      ''
      'begin'
      '  SumD:=0;'
      '  SumP:=0;'
      '  OutSumD:=0;'
      '  OutSumP:=0;'
      'end.')
    Left = 24
    Top = 207
    Datasets = <>
    Variables = <
      item
        Name = 'BUILDS'
        Value = #39#1054#1073#1097#1077#1078#1080#1090#1080#1077#39
      end
      item
        Name = 'FAK'
        Value = #39#1060#1072#1082#1091#1083#1100#1090#1077#1090#39
      end
      item
        Name = 'KURS'
        Value = #39#1050#1091#1088#1089#39
      end
      item
        Name = 'CATPAY'
        Value = #39#1050#1072#1090#1077#1075#1086#1088#1103' '#1086#1087#1083#1072#1090#1099#39
      end
      item
        Name = 'TYPELIVE'
        Value = #39#1058#1080#1087' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103#39
      end
      item
        Name = 'CLASSLIVE'
        Value = #39#1050#1083#1072#1089#1089' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103#39
      end
      item
        Name = 'NAMEREPORT'
        Value = #39#1056#1077#1077#1089#1090#1088' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1087#1088#1086#1078#1080#1074#1072#1102#1097#1080#1093#39
      end
      item
        Name = 'DATEROJ'
        Value = #39#1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103#39
      end
      item
        Name = 'BEGPROPI'
        Value = #39#1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1087#1088#1086#1087#1080#1089#1082#1080#39
      end
      item
        Name = 'ENDPROPI'
        Value = #39#1044#1072#1090#1072' '#1082#1086#1085#1094#1072' '#1087#1088#1086#1087#1080#1089#1082#1080#39
      end
      item
        Name = 'ROOM'
        Value = #39#1050#1086#1084#1085#1072#1090#1072#39
      end
      item
        Name = 'FIO'
        Value = #39#1060'.'#1048'.'#1054'.'#39
      end
      item
        Name = 'NN'
        Value = #39#8470' '#1087'/'#1087#39
      end
      item
        Name = 'VNAMEREPORT'
        Value = #39#1056#1077#1077#1089#1090#1088' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1087#1088#1086#1078#1080#1074#1072#1102#1097#1080#1093#39
      end
      item
        Name = 'VPAGE'
        Value = #39#1057#1090#1088#39
      end
      item
        Name = 'DATEBEG'
        Value = #39'01.03.2006'#39
      end
      item
        Name = 'DATEEND'
        Value = #39'31.03.2006'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 30.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 20.000000000000000000
      BottomMargin = 20.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 60.031540000000000000
        Top = 222.992270000000000000
        Width = 642.520100000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSetName = 'frxDBDatasetMaster'
        RowCount = 0
        StartNewPage = True
        object MemoBUILD_TEXT: TfrxMemoView
          Align = baLeft
          Top = 1.102350000000001000
          Width = 247.200000000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[BUILDS]:[frxDBDatasetMaster."BUILD_TEXT"]')
          ParentFont = False
        end
        object MemoFAK_TEXT: TfrxMemoView
          Align = baLeft
          Top = 20.000000000000000000
          Width = 240.800000000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[FAK]:[frxDBDatasetMaster."FAK_TEXT"]')
          ParentFont = False
        end
        object MemoKurs: TfrxMemoView
          Align = baLeft
          Left = 240.800000000000000000
          Top = 20.000000000000000000
          Width = 221.600000000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[KURS]:[frxDBDatasetMaster."KURS"]')
          ParentFont = False
        end
        object MemoGROUP_SHORT_NAME: TfrxMemoView
          Align = baLeft
          Left = 462.400000000000100000
          Top = 20.031496059999990000
          Width = 180.025170000000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1043#1088#1091#1087#1087#1099' '#1086#1073#1091#1095#1077#1085#1080#1103':[frxDBDatasetMaster."GROUP_SHORT_NAME"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 18.897650000000000000
        Top = 385.512060000000000000
        Width = 642.520100000000000000
        DataSetName = 'frxDBDatasetDetails'
        RowCount = 0
        Stretched = True
        object Memo3: TfrxMemoView
          Left = 37.795275590000000000
          Width = 151.181029130000100000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'FIO'
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetDetails."FIO"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[Line#] ')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 188.976304720000100000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo5OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetDetails."IN_NACH"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 309.921264720000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetDetails."CUR_NACH"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 453.543404720000000000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetDetails."CUR_PAY"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 582.047424720000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetDetails."OUT_NACH"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 521.575140000000100000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo23OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetDetails."OUT_NACH"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 249.448979999999600000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetDetails."IN_NACH"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 381.732530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetDetails."SB_SUM"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 56.692950000000010000
        Top = 306.141930000000000000
        Width = 642.520100000000000000
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 37.795275590000000000
          Height = 56.692950000000010000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[NN]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 37.795275590000000000
          Width = 151.181200000000100000
          Height = 56.692950000000010000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[FIO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 188.976475590000100000
          Width = 120.944908740000000000
          Height = 34.015770000000010000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1093#1110#1076#1085#1077' '#1089#1072#1083#1100#1076#1086','#1075#1088#1085)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 309.921384329999600000
          Width = 71.811028500000000000
          Height = 56.692950000000010000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1086#1074#1072'-'
            #1085#1086','
            #1075#1088#1085)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 453.543482830000000000
          Width = 68.031488740000000000
          Height = 56.692950000000010000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1087#1083#1072#1095#1077#1085#1086','
            #1075#1088#1085)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Align = baLeft
          Left = 521.574971570000000000
          Width = 120.944908740000000000
          Height = 34.015770000000010000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1093#1110#1076#1085#1077' '#1089#1072#1083#1100#1076#1086','#1075#1088#1085)
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 582.047424720000000000
          Top = 34.015769999999970000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1055#1077#1088#1077#1087#1083#1072#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 521.575140000000100000
          Top = 34.015769999999970000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1041#1086#1088#1075)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 188.976500000000100000
          Top = 34.015769999999970000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1041#1086#1088#1075)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 249.449175279999600000
          Top = 34.015769999999970000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1077#1088#1077#1087#1083#1072#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 381.732649610000000000
          Width = 71.811028500000000000
          Height = 56.692950000000010000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1073#1089#1080#1076#1110#1103','
            #1075#1088#1085)
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 642.520100000000000000
        object Memo18: TfrxMemoView
          Align = baLeft
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[Date]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 332.598640000000000000
          Top = 49.133889999999990000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '-[DATEEND]')
        end
        object Memo19: TfrxMemoView
          Left = 158.740260000000000000
          Top = 49.133889999999990000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[DATEBEG]')
        end
        object Memo20: TfrxMemoView
          Left = 71.811070000000000000
          Top = 22.677180000000000000
          Width = 514.016080000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1054#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1087#1086' '#1086#1087#1083#1072#1090#1110' '#1087#1088#1086#1078#1080#1074#1072#1085#1085#1103' '#1079#1072' '#1087#1077#1088#1110#1086#1076)
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 139.842610000000000000
        Width = 642.520100000000000000
        OnBeforePrint = 'PageHeader1OnBeforePrint'
        object Memo13: TfrxMemoView
          Left = 510.236550000000000000
          Top = 3.779529999999994000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 427.086890000000000000
        Width = 642.520100000000000000
        object Memo14: TfrxMemoView
          Width = 188.976500000000100000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1030#1090#1086#1075#1086':')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 188.976500000000100000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SumD]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 381.732530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetDetails."SB_SUM">,DetailData1)]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 453.543600000000000000
          Width = 68.031539999999990000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetDetails."CUR_PAY">,DetailData1)]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 582.047620000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[OutSumP]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 521.575335280000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[OutSumD]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 249.449175279999600000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SumP]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 309.921460000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetDetails."CUR_NACH">,DetailData1)]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = PrintDataSet
    Left = 24
    Top = 239
  end
end
