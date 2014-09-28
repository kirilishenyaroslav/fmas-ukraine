object frmDocPrinting: TfrmDocPrinting
  Left = 530
  Top = 251
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
      Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1110' '#1087#1072#1088#1072#1084#1077#1090#1088#1080
      ImageIndex = 1
      object CheckDep: TcxCheckBox
        Left = 7
        Top = 6
        Width = 257
        Height = 24
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
    ReportOptions.LastChange = 39052.588752604170000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  NFacult,NSum:Double;'
      '  FlagFac,FlagSum,FlagNewPage:Integer;'
      ''
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   if <Page#>=1 then MemoPage.visible:=false'
      '  else MemoPage.visible:=true;'
      ''
      'end;'
      ''
      'procedure MemoNAME_FACULTOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'FlagNewPage:=0;'
      'if MemoNAME_FACULT.Visible = true then'
      '    begin'
      '      FlagFac:=1;'
      '    end;'
      '  if FlagFac = 1 then'
      '    begin'
      
        '      if ( NFacult<><frxDBDatasetDetails."ID_FAK">)and(NFacult<>' +
        '0) then'
      '        begin'
      '          MemoNAME_FACULT.Visible := true;'
      '          Engine.NewPage();'
      '          FlagNewPage:=1;'
      '        end'
      '        else'
      '        begin'
      '          if (NFacult<>0) then'
      '            begin'
      '              MemoNAME_FACULT.Visible := false;'
      '            end;'
      '        end;'
      '      NFacult:=<frxDBDatasetDetails."ID_FAK">;'
      '    end;'
      'end;'
      ''
      ''
      ''
      'begin'
      '  NFacult:=0;'
      '  FlagFac:=0;'
      '  NSum:=0;'
      '  FlagSum:=0;'
      '  FlagNewPage:=0;'
      'end.')
    Left = 24
    Top = 207
    Datasets = <
      item
        DataSetName = 'frxDBDatasetDetails'
      end
      item
        DataSetName = 'frxDBDatasetMaster'
      end>
    Variables = <
      item
        Name = 'NAME_REPORT'
        Value = #39#1056#1077#1077#1089#1090#1088#39
      end
      item
        Name = 'NAME_REPORT_MAIN'
        Value = #39#1089#1090#1091#1076#1077#1085#1090#1110#1074', '#1097#1086' '#1085#1072#1074#1095#1072#1102#1090#1100#1089#1103' '#1079#1072' '#1086#1089#1085#1086#1074#1085#1080#1084#1080' '#1076#1086#1075#1086#1074#1086#1088#1072#1084#1080#39
      end
      item
        Name = 'NAME_REPORT_DOP'
        Value = #39#1089#1090#1091#1076#1077#1085#1090#1110#1074', '#1097#1086' '#1085#1072#1074#1095#1072#1102#1090#1100#1089#1103' '#1079#1072' '#1076#1086#1076#1072#1090#1082#1086#1074#1080#1084#1080' '#1076#1086#1075#1086#1074#1086#1088#1072#1084#1080#39
      end
      item
        Name = 'NAME_REPORT_REIOD'
        Value = #39#1079#1072' '#1087#1077#1088#1110#1086#1076#39
      end
      item
        Name = 'SPEC'
        Value = #39#1057#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100#39
      end
      item
        Name = 'NATIONAL'
        Value = #39#1043#1088#1086#1084#1072#1076#1103#1085#1089#1090#1074#1086#39
      end
      item
        Name = 'FORMSTUD'
        Value = #39#1060#1086#1088#1084#1072' '#1085#1072#1074#1095#1072#1085#1085#1103#39
      end
      item
        Name = 'KATSTUD'
        Value = #39#1050#1072#1090#1077#1075#1086#1088#1110#1103' '#1085#1072#1074#1095#1072#1085#1085#1103#39
      end
      item
        Name = 'KURS'
        Value = #39#1050#1091#1088#1089#39
      end
      item
        Name = 'GROUP'
        Value = #39#1043#1088#1091#1087#1072#39
      end
      item
        Name = 'FIO'
        Value = #39#1055'.'#1030'.'#1041'.'#39
      end
      item
        Name = 'DOG'
        Value = #39#1044#1086#1075#1086#1074#1110#1088' '#8470#39
      end
      item
        Name = 'DATEDOG'
        Value = #39#1044#1072#1090#1072' '#1079#1072#1082#1083#1102#1095#1077#1085#1085#1103#39
      end
      item
        Name = 'PERIODDOG'
        Value = #39#1055#1077#1088#1110#1086#1076' '#1076#1110#1111' '#1076#1086#1075#1086#1074#1086#1088#1091#39
      end
      item
        Name = 'PAYDOG'
        Value = #39#1055#1083#1072#1090#1085#1080#1082' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091#39
      end
      item
        Name = 'SUMENDDOG'
        Value = #39#1057#1091#1084#1072' '#1076#1086#1075#1086#1074#1086#1088#1091', '#1075#1088#1085#39
      end
      item
        Name = 'BEGIN'
        Value = #39#1079#39
      end
      item
        Name = 'END'
        Value = #39#1087#1086#39
      end
      item
        Name = 'cn_RepDogSumNeed'
        Value = #39#1057#1087#1083'. '#1085#1072' '#1076#1072#1090#1091' '#1088#1072#1079#1088#1072#1093#1091#1085#1082#1091', '#1075#1088#1085#39
      end
      item
        Name = 'cn_RepDogSumPay'
        Value = #39#1057#1087#1083#1072#1095#1077#1085#1086', '#1075#1088#1085#39
      end
      item
        Name = 'cn_RepDogSumOverPay'
        Value = #39#1055#1077#1088#1077#1087#1083#1072#1090#1072', '#1075#1088#1085#39
      end
      item
        Name = 'cn_RepDogSumNeedPay'
        Value = #39#1047#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1110#1089#1090#1100', '#1075#1088#1085#39
      end
      item
        Name = 'cn_RepDogSumDate'
        Value = #39#1057#1087#1083#1072#1095#1077#1085#1086' '#1087#1086#39
      end
      item
        Name = 'cn_RepDogSumTextOver'
        Value = #39#1057#1091#1084#1072' '#1087#1077#1088#1077#1087#1083#1072#1090#1080#39
      end
      item
        Name = 'cn_RepDogSumText'
        Value = #39#1058#1086#1095#1085#1072' '#1089#1087#1083#1072#1090#1072#39
      end
      item
        Name = 'cn_RepDogSumTextNEED'
        Value = #39#1057#1091#1084#1072' '#1079#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1086#1089#1090#1110#39
      end
      item
        Name = 'cn_RepPere'
        Value = #39#1089#1090#1091#1076#1077#1085#1090#1110#1074', '#1097#1086' '#1087#1077#1088#1077#1087#1083#1072#1090#1080#1083#1080' '#1079#1072' '#1085#1072#1074#1095#1072#1085#1085#1103#39
      end
      item
        Name = 'cn_RepNeed'
        Value = #39#1089#1090#1091#1076#1077#1085#1090#1110#1074', '#1097#1086' '#1079#1072#1073#1086#1088#1075#1091#1074#1072#1083#1080' '#1079#1072' '#1085#1072#1074#1095#1072#1085#1085#1103#39
      end
      item
        Name = 'cn_RepToch'
        Value = #39#1089#1090#1091#1076#1077#1085#1090#1110#1074', '#1097#1086' '#1087#1086#1074#1085#1110#1089#1090#1102' '#1089#1087#1083#1072#1090#1080#1083#1080' '#1079#1072' '#1085#1072#1074#1095#1072#1085#1085#1103#39
      end
      item
        Name = 'cn_RepOpldate'
        Value = #39#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1089#1091#1084#1080' '#1076#1086' '#1089#1087#1083#1072#1090#1080' '#1085#1072#39
      end
      item
        Name = 'cn_RepMainDogEX'
        Value = #39#1079#1072' '#1086#1089#1085#1086#1074#1085#1080#1084#1080' '#1076#1086#1075#1086#1074#1086#1088#1072#1084#1080#39
      end
      item
        Name = 'cn_RepDopDogEX'
        Value = #39#1079#1072' '#1076#1086#1076#1072#1090#1082#1086#1074#1080#1084#1080' '#1076#1086#1075#1086#1074#1086#1088#1072#1084#1080#39
      end
      item
        Name = 'cn_RepSumAll'
        Value = #39#1059#1089#1100#1086#1075#1086':'#39
      end
      item
        Name = 'DATE_BEG'
        Value = #39'01.01.2006'#39
      end
      item
        Name = 'DATE_END'
        Value = #39'31.12.2006'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 11.338590000000000000
        Top = 132.283550000000000000
        Width = 718.110700000000000000
        DataSetName = 'frxDBDatasetMaster'
        KeepChild = True
        KeepTogether = True
        RowCount = 0
      end
      object DetailData1: TfrxDetailData
        Height = 18.897650000000000000
        Top = 332.598640000000000000
        Width = 718.110700000000000000
        DataSetName = 'frxDBDatasetDetails'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        object Memo3: TfrxMemoView
          Left = 49.133865590000000000
          Width = 147.401499130000000000
          Height = 18.897650000000000000
          DataField = 'FIO'
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.Strings = (
            '[frxDBDatasetDetails."FIO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          Left = 15.118120000000000000
          Width = 34.015745590000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Line#] ')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 196.535364720000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'IN_NACH_DOLG'
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetDetails."IN_NACH_DOLG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 347.716503700000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataField = 'CUR_NACH'
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetDetails."CUR_NACH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 272.125964720000000000
          Width = 75.590538980000000000
          Height = 18.897650000000000000
          DataField = 'IN_NACH_PERE'
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetDetails."IN_NACH_PERE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 442.204692680000000000
          Width = 86.929128980000000000
          Height = 18.897650000000000000
          DataField = 'CUR_PAY'
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetDetails."CUR_PAY"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 529.134200000000000000
          Width = 86.929128980000000000
          Height = 18.897650000000000000
          DataField = 'OUT_NACH_DOLG'
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetDetails."OUT_NACH_DOLG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 616.063390000000000000
          Width = 83.149618500000000000
          Height = 18.897650000000000000
          DataField = 'OUT_NACH_PERE'
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetDetails."OUT_NACH_PERE"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 143.622140000000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo1: TfrxMemoView
          Left = 15.118120000000000000
          Top = 64.252009999999990000
          Width = 34.015745590000000000
          Height = 64.252010000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #8470'/'#8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 49.133865590000000000
          Top = 64.252009999999990000
          Width = 147.401670000000000000
          Height = 64.252010000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[FIO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 196.535484330000000000
          Top = 64.252009999999990000
          Width = 151.181158500000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072' '#1087#1086#1095#1072#1090#1086#1082','#1075#1088#1085)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 347.716581810000000000
          Top = 94.488249999999960000
          Width = 94.488188980000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTITLENAME_SPEC: TfrxMemoView
          Top = 15.118120000000010000
          Width = 113.385900000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[SPEC]:')
          ParentFont = False
        end
        object MemoTITLENAME_NATIONAL: TfrxMemoView
          Left = 381.732530000000000000
          Top = 15.118120000000010000
          Width = 113.385900000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[NATIONAL]:')
          ParentFont = False
        end
        object MemoNAME_SPEC: TfrxMemoView
          Left = 113.385900000000000000
          Top = 15.118120000000010000
          Width = 264.567100000000000000
          Height = 13.228346460000000000
          DataField = 'NAME_SPEC'
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDBDatasetDetails."NAME_SPEC"]')
          ParentFont = False
        end
        object MemoNAME_NATIONAL: TfrxMemoView
          Left = 529.134200000000000000
          Top = 15.118120000000010000
          Width = 158.740260000000000000
          Height = 13.228346460000000000
          DataField = 'NAME_NATIONAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDBDatasetDetails."NAME_NATIONAL"]')
          ParentFont = False
        end
        object MemoTITLENAME_FORM_STUD: TfrxMemoView
          Top = 30.236240000000010000
          Width = 113.385900000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[FORMSTUD]:')
          ParentFont = False
        end
        object MemoNAME_FORM_STUD: TfrxMemoView
          Left = 113.385900000000000000
          Top = 30.236240000000010000
          Width = 154.960730000000000000
          Height = 13.228346460000000000
          AutoWidth = True
          DataField = 'NAME_FORM_STUD'
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDBDatasetDetails."NAME_FORM_STUD"]')
          ParentFont = False
        end
        object MemoTITLENAME_KAT_STUD: TfrxMemoView
          Left = 381.732530000000000000
          Top = 30.236240000000010000
          Width = 147.401670000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[KATSTUD]:')
          ParentFont = False
        end
        object MemoNAME_KAT_STUD: TfrxMemoView
          Align = baLeft
          Left = 529.134199999999900000
          Top = 30.236240000000010000
          Width = 185.196970000000000000
          Height = 13.228346460000000000
          DataField = 'NAME_KAT_STUD'
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDBDatasetDetails."NAME_KAT_STUD"]')
          ParentFont = False
        end
        object MemoTITLEKURS: TfrxMemoView
          Top = 41.574829999999990000
          Width = 56.692950000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[KURS]:')
          ParentFont = False
        end
        object MemoTITLENAME_GROUP: TfrxMemoView
          Left = 94.488250000000000000
          Top = 41.574829999999990000
          Width = 56.692950000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[GROUP]:')
          ParentFont = False
        end
        object MemoKURS: TfrxMemoView
          Left = 56.692950000000000000
          Top = 41.574829999999990000
          Width = 37.795300000000000000
          Height = 13.228346460000000000
          DataField = 'KURS'
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDBDatasetDetails."KURS"]')
          ParentFont = False
        end
        object MemoNAME_GROUP: TfrxMemoView
          Left = 151.181200000000000000
          Top = 41.574829999999990000
          Width = 411.968770000000000000
          Height = 13.228346460000000000
          DataField = 'NAME_GROUP'
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDBDatasetDetails."NAME_GROUP"]')
          ParentFont = False
        end
        object MemoNAME_FACULT: TfrxMemoView
          Width = 718.110700000000000000
          Height = 15.118110240000000000
          OnBeforePrint = 'MemoNAME_FACULTOnBeforePrint'
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDatasetDetails."NAME_FACULT"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 442.204770790000000000
          Top = 94.488249999999960000
          Width = 86.929128980000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 196.535560000000000000
          Top = 94.488249999999960000
          Width = 75.590558500000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 272.126160000000000000
          Top = 94.488249999999960000
          Width = 75.590558500000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 529.134200000000000000
          Top = 64.252009999999990000
          Width = 170.078808500000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072' '#1082#1110#1085#1077#1094#1100','#1075#1088#1085)
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 529.134275670000000000
          Top = 94.488249999999960000
          Width = 86.929148500000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 616.063465670000000000
          Top = 94.488249999999960000
          Width = 83.149618500000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 347.716760000000000000
          Top = 64.252009999999990000
          Width = 181.417398500000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1054#1073#1086#1088#1086#1090#1080','#1075#1088#1085)
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 52.913420000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'PageHeader1OnBeforePrint'
        object MemoPage: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1088'. [Page#]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Top = 15.118120000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1087#1086' '#1086#1087#1083#1072#1090#1110' '#1079#1072' '#1085#1072#1074#1095#1072#1085#1085#1103)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 272.126160000000000000
          Top = 34.015769999999990000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[DATE_BEG]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 438.425480000000000000
          Top = 34.015769999999990000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[DATE_END]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 124.724490000000000000
          Top = 34.015769999999990000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1079#1072' '#1087#1077#1088#1110#1086#1076)
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 415.748300000000000000
          Top = 34.015769999999990000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '-')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
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
            '[Date]:[Time]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 18.897650000000000000
        Top = 453.543600000000000000
        Width = 718.110700000000000000
        KeepChild = True
        object Memo14: TfrxMemoView
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[cn_RepSumAll]')
          ParentFont = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 196.535560000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetDetails."IN_NACH_DOLG">,DetailData1,2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo8: TfrxSysMemoView
          Left = 272.126160000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetDetails."IN_NACH_PERE">,DetailData1,2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo9: TfrxSysMemoView
          Left = 347.716760000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetDetails."CUR_NACH">,DetailData1,2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo10: TfrxSysMemoView
          Left = 442.205010000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetDetails."CUR_PAY">,DetailData1,2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo11: TfrxSysMemoView
          Left = 529.134200000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetDetails."OUT_NACH_DOLG">,DetailData1,2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo12: TfrxSysMemoView
          Left = 616.063390000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetDetails."OUT_NACH_PERE">,DetailData1,2)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 374.173470000000000000
        Width = 718.110700000000000000
        KeepChild = True
        object Memo19: TfrxMemoView
          Align = baLeft
          Left = 699.213050000000000000
          Width = 68.031478980000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haRight
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Width = 196.535498980000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 196.535560000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
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
            '[SUM(<frxDBDatasetDetails."IN_NACH_DOLG">,DetailData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo2: TfrxSysMemoView
          Left = 272.126160000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
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
            '[SUM(<frxDBDatasetDetails."IN_NACH_PERE">,DetailData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo3: TfrxSysMemoView
          Left = 347.716760000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
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
          VAlign = vaCenter
        end
        object SysMemo4: TfrxSysMemoView
          Left = 442.205010000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
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
          VAlign = vaCenter
        end
        object SysMemo5: TfrxSysMemoView
          Left = 529.134200000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
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
            '[SUM(<frxDBDatasetDetails."OUT_NACH_DOLG">,DetailData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo6: TfrxSysMemoView
          Left = 616.063390000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = '.'
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
            '[SUM(<frxDBDatasetDetails."OUT_NACH_PERE">,DetailData1)]')
          ParentFont = False
          VAlign = vaCenter
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
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 136
    Top = 152
  end
end
