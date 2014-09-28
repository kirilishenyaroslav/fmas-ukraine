object frmMainPrint: TfrmMainPrint
  Left = 814
  Top = 501
  Width = 417
  Height = 218
  Caption = #1044#1088#1091#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 161
    Width = 401
    Height = 19
    Panels = <>
  end
  object cxButton1: TcxButton
    Left = 232
    Top = 136
    Width = 75
    Height = 25
    Caption = #1044#1088#1091#1082
    Default = True
    TabOrder = 1
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 312
    Top = 136
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 2
    OnClick = cxButton2Click
  end
  object cxButtonEditRS: TcxButtonEdit
    Left = 0
    Top = 24
    Width = 385
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditRSPropertiesButtonClick
    Style.Color = 15204351
    TabOrder = 3
  end
  object cxLabel1: TcxLabel
    Left = 0
    Top = 0
    Width = 69
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Caption = #1056'\'#1056'+'#1052#1060#1054
  end
  object cxLabel2: TcxLabel
    Left = 0
    Top = 48
    Width = 113
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
    Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074
  end
  object cxDateEditDate: TcxDateEdit
    Left = 0
    Top = 72
    Width = 121
    Height = 21
    Style.Color = 15204351
    TabOrder = 6
  end
  object GroupBox1: TGroupBox
    Left = 136
    Top = 48
    Width = 249
    Height = 73
    Caption = #1044#1088#1091#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    TabOrder = 7
    object cxCheckBoxPR: TcxCheckBox
      Left = 8
      Top = 16
      Width = 121
      Height = 21
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
      Properties.Caption = #1056#1077#1077#1089#1090#1088' '#1074#1080#1076#1072#1090#1082#1091
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object cxCheckBoxALL: TcxCheckBox
      Left = 8
      Top = 40
      Width = 201
      Height = 21
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
      Properties.Caption = #1044#1088#1091#1082' '#1074#1080#1087#1080#1089#1082#1080' '#1073#1072#1085#1082#1091
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 96
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 24
    Top = 128
  end
  object pFIBDataSetPrint: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    Left = 64
    Top = 96
    poSQLINT64ToBCD = True
  end
  object frxDBDatasetPrint: TfrxDBDataset
    UserName = 'frxDBDatasetPrint'
    CloseDataSource = False
    DataSet = pFIBDataSetPrint
    Left = 64
    Top = 128
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38607.027064340300000000
    ReportOptions.LastChange = 39255.585549398150000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo16OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDatasetPrint."SUM_PRIHOD">=0 then'
      '    begin'
      '      Memo16.Text:='#39' '#39';'
      '    end;'
      'end;'
      ''
      'procedure Memo12OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if <frxDBDatasetPrint."SUM_RAS">=0 then'
      '    begin'
      '      Memo12.Text:='#39' '#39';'
      '    end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 96
    Top = 128
    Datasets = <
      item
        DataSet = frxDBDatasetPrint
        DataSetName = 'frxDBDatasetPrint'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 132.283550000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 45.354360000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103': ')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 188.976500000000000000
          Width = 854.173780000000000000
          Height = 18.897650000000000000
          DataField = 'NATIVE_DEP'
          DataSet = frxDBDatasetPrint
          DataSetName = 'frxDBDatasetPrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold, fsUnderline]
          Memo.Strings = (
            '[frxDBDatasetPrint."NATIVE_DEP"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 113.385900000000000000
          Top = 18.897650000000000000
          Width = 521.575140000000100000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1041#1072#1085#1082#1086#1074#1089#1082#1072#1103' '#1074#1099#1087#1080#1089#1082#1072' '#1086#1090' [DATE_BEG]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 56.692949999999990000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            
              #1052#1060#1054' [frxDBDatasetPrint."MFO_N"]   [frxDBDatasetPrint."BANK_N"] '#1056 +
              '/'#1057' [frxDBDatasetPrint."RS_N"]')
        end
        object Memo5: TfrxMemoView
          Left = 75.590600000000000000
          Top = 113.385900000000000000
          Width = 113.385900000000000000
          Height = 18.897637800000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1044#1086#1082'.')
        end
        object Memo6: TfrxMemoView
          Left = 302.362400000000000000
          Top = 113.385900000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1093#1086#1076)
        end
        object Memo15: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1057#1090#1088'.[Page]')
        end
        object Memo7: TfrxMemoView
          Left = 188.976500000000000000
          Top = 113.385900000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1044#1086#1082'.')
        end
        object Memo8: TfrxMemoView
          Top = 113.385900000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #8470'  '#1087'/'#1087)
        end
        object Memo11: TfrxMemoView
          Left = 491.338900000000000000
          Top = 113.385900000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1089#1093#1086#1076)
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 211.653680000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetPrint
        DataSetName = 'frxDBDatasetPrint'
        RowCount = 0
        Stretched = True
        object Memo9: TfrxMemoView
          Left = 75.590600000000000000
          Width = 113.385900000000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetPrint."NUM_DOC"]')
        end
        object Memo10: TfrxMemoView
          Left = 188.976500000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDatasetPrint."DATE_DOC"]')
        end
        object Memo12: TfrxMemoView
          Left = 491.338900000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          DataField = 'SUM_RAS'
          DataSet = frxDBDatasetPrint
          DataSetName = 'frxDBDatasetPrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetPrint."SUM_RAS"]')
        end
        object Memo16: TfrxMemoView
          Left = 302.362400000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo16OnBeforePrint'
          DataSet = frxDBDatasetPrint
          DataSetName = 'frxDBDatasetPrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetPrint."SUM_PRIHOD"]')
        end
        object Memo17: TfrxMemoView
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[Line] ')
        end
      end
      object Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        object Memo13: TfrxMemoView
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1048#1090#1086#1075#1086':')
        end
        object Memo14: TfrxMemoView
          Left = 302.362400000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetPrint."SUM_PRIHOD">,MasterData1)]')
        end
        object Memo18: TfrxMemoView
          Left = 491.338900000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetPrint."SUM_RAS">,MasterData1)]')
        end
      end
    end
  end
  object frxDesigner: TfrxDesigner
    Restrictions = []
    Left = 128
    Top = 128
  end
end
