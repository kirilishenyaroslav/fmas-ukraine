object frmMainPrintListProp: TfrmMainPrintListProp
  Left = 333
  Top = 297
  BorderIcons = [biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmMainPrintListProp'
  ClientHeight = 83
  ClientWidth = 389
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
  object cxLabelStatus: TcxLabel
    Left = 0
    Top = 8
    Width = 361
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Caption = 
      'cxLabelStatus                                                   ' +
      '                 '
  end
  object cxButton1: TcxButton
    Left = 304
    Top = 32
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 1
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 224
    Top = 32
    Width = 75
    Height = 25
    Caption = #1044#1088#1091#1082
    Default = True
    TabOrder = 0
    OnClick = cxButton2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 64
    Width = 389
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
    ReportOptions.CreateDate = 38574.593894120400000000
    ReportOptions.LastChange = 40337.425023321760000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo11OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDataset."OUT_OBL_R_ID">=1 then'
      '    begin'
      '      MemoObl_R.Frame.Typ:=ftBottom;'
      '    end;'
      '  if <frxDBDataset."OUT_OBL_R_ID">=2 then'
      '    begin'
      '      MemoKraj_R.Frame.Typ:=ftBottom;'
      '    end;'
      '  if <frxDBDataset."OUT_OBL_R_ID">=3 then'
      '    begin'
      '      MemoResp_R.Frame.Typ:=ftBottom;'
      '    end;'
      'end;'
      ''
      'procedure Memo43OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDataset."OUT_TOWN_R_ID">=1 then'
      '    begin'
      '       MemoTown_R.Frame.Typ:=ftBottom;'
      '    end;'
      '  if <frxDBDataset."OUT_TOWN_R_ID">=2 then'
      '    begin'
      '       MemoSelo_R.Frame.Typ:=ftBottom;'
      '    end;'
      'end;'
      ''
      'procedure Memo44OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDataset."OUT_OBL_L_ID">=1 then'
      '    begin'
      '      MemoObl_L.Frame.Typ:=ftBottom;'
      '    end;'
      '  if <frxDBDataset."OUT_OBL_L_ID">=2 then'
      '    begin'
      '      MemoKraj_L.Frame.Typ:=ftBottom;'
      '    end;'
      '  if <frxDBDataset."OUT_OBL_L_ID">=3 then'
      '    begin'
      '      MemoResp_L.Frame.Typ:=ftBottom;'
      '    end;'
      ''
      'end;'
      ''
      'procedure MemoTYPE_STANOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDataset."OUT_POL_MAN">=1 then'
      '    begin'
      '      MemoTYPE_STAN.Text:=<LISTPROPN0STAN1>;'
      '    end;'
      '  if <frxDBDataset."OUT_POL_MAN">=2 then'
      '    begin'
      '      MemoTYPE_STAN.Text:=<LISTPROPN0STAN2>;'
      '    end;'
      '  if <frxDBDataset."OUT_POL_MAN">=3 then'
      '    begin'
      '      MemoTYPE_STAN.Text:=<LISTPROPN0STAN3>;'
      '    end;'
      '  if <frxDBDataset."OUT_POL_MAN">=4 then'
      '    begin'
      '      MemoTYPE_STAN.Text:=<LISTPROPN0STAN4>;'
      '    end;'
      'end;'
      ''
      'procedure Memo20OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDataset."OUT_TOWN_L_ID">=1 then'
      '    begin'
      '      MemoTown_L.Frame.Typ:=ftBottom;'
      '    end;'
      '  if <frxDBDataset."OUT_TOWN_L_ID">=2 then'
      '    begin'
      '      MemoSelo_L.Frame.Typ:=ftBottom;'
      '    end;'
      'end;'
      ''
      ''
      'begin'
      ''
      'end.')
    Left = 32
    Top = 32
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
      end>
    Variables = <
      item
        Name = 'LISTPROPN1'
        Value = #39'1. '#1060#1072#1084#1080#1083#1080#1103#39
      end
      item
        Name = 'LISTPROPN2'
        Value = #39'2. '#1048#1084#1103#39
      end
      item
        Name = 'LISTPROPN3'
        Value = #39'3. '#1054#1090#1095#1077#1089#1090#1074#1086#39
      end
      item
        Name = 'LISTPROPN4'
        Value = #39'4. '#1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100#39
      end
      item
        Name = 'LISTPROPDateRog'
        Value = #39#1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103#39
      end
      item
        Name = 'LISTPROPN6'
        Value = #39'6. '#1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103#39
      end
      item
        Name = 'LISTPROPNCountry'
        Value = #39#1043#1086#1089#1091#1076#1072#1088#1089#1090#1074#1086#39
      end
      item
        Name = 'LISTPROPNObl'
        Value = #39#1086#1073#1083#1072#1089#1090#1100#39
      end
      item
        Name = 'LISTPROPNRaj'
        Value = #39#1088#1072#1081#1086#1085#39
      end
      item
        Name = 'LISTPROPNTown'
        Value = #39#1075#1086#1088#1086#1076#39
      end
      item
        Name = 'LISTPROPNTownSel'
        Value = #39'['#1089#1077#1083#1077#1085#1080#1077']'#39
      end
      item
        Name = 'LISTPROPNTownKraj'
        Value = #39'['#1082#1088#1072#1081#39
      end
      item
        Name = 'LISTPROPNTownResp'
        Value = #39#1088#1077#1089#1087#1091#1073#1083#1080#1082#1072']'#39
      end
      item
        Name = 'LISTPROPNStrit'
        Value = #39#1091#1083'.'#39
      end
      item
        Name = 'LISTPROPNBuild'
        Value = #39#1076#1086#1084#39
      end
      item
        Name = 'LISTPROPNCorp'
        Value = #39#1082#1086#1088#1087'.'#39
      end
      item
        Name = 'LISTPROPNKv'
        Value = #39#1082#1074'.'#39
      end
      item
        Name = 'LISTPROPN7'
        Value = #39'7. '#1054#1090#1082#1091#1076#1072' '#1080' '#1082#1086#1075#1076#1072' '#1087#1088#1080#1073#1099#1083#39
      end
      item
        Name = 'LISTPROPNYear'
        Value = #39#1075'.'#39
      end
      item
        Name = 'LISTPROPN8'
        Value = #39'8. '#1055#1072#1089#1087#1086#1088#1090' '#1089#1077#1088#1080#1103#39
      end
      item
        Name = 'LISTPROPN8NumberPass'
        Value = #39#1085#1086#1084#1077#1088#39
      end
      item
        Name = 'LISTPROPN8PassVud'
        Value = #39#1082#1072#1082#1080#1084' '#1086#1088#1075#1072#1085#1086#1084' '#1074#1085#1091#1090#1088#1077#1085#1085#1080#1093' '#1076#1077#1083' '#1080' '#1082#1086#1075#1076#1072' '#1074#1099#1076#1072#1085#39
      end
      item
        Name = 'LISTPROPN9'
        Value = #39'9. '#1040#1076#1088#1077#1089' '#1084#1077#1089#1090#1072' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072#39
      end
      item
        Name = 'LISTPROPN10'
        Value = #39'10. '#1043#1076#1077' '#1080' '#1074' '#1082#1072#1095#1077#1089#1090#1074#1077' '#1082#1086#1075#1086' '#1088#1072#1073#1086#1090#1072#1077#1090#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 210.000000000000000000
      PaperHeight = 148.000000000000000000
      PaperSize = 11
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Memo1: TfrxMemoView
        Align = baLeft
        Left = 37.795300000000000000
        Top = 22.677180000000000000
        Width = 79.370078740000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[LISTPROPN1]')
        ParentFont = False
      end
      object Memo2: TfrxMemoView
        Align = baLeft
        Left = 37.795300000000000000
        Top = 37.795300000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[LISTPROPN2]')
        ParentFont = False
      end
      object Memo3: TfrxMemoView
        Align = baLeft
        Left = 37.795300000000000000
        Top = 52.913420000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[LISTPROPN3]')
        ParentFont = False
      end
      object Memo4: TfrxMemoView
        Align = baLeft
        Left = 37.795300000000000000
        Top = 68.031540000000010000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[LISTPROPN4]')
        ParentFont = False
      end
      object Memo5: TfrxMemoView
        Align = baLeft
        Left = 37.795300000000000000
        Top = 90.708720000000000000
        Width = 714.331170000000000000
        Height = 3.779530000000000000
        Frame.Typ = [ftTop]
        Frame.Width = 2.000000000000000000
      end
      object Memo6: TfrxMemoView
        Left = 37.795300000000000000
        Top = 98.267780000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPDateRog]')
      end
      object Memo7: TfrxMemoView
        Left = 181.417440000000000000
        Top = 94.488249999999990000
        Width = 18.897650000000000000
        Height = 71.811070000000000000
        Frame.Typ = [ftLeft]
      end
      object Memo8: TfrxMemoView
        Align = baLeft
        Left = 37.795300000000000000
        Top = 166.299320000000000000
        Width = 714.331170000000000000
        Height = 3.779530000000000000
        Frame.Typ = [ftTop]
        Frame.Width = 2.000000000000000000
      end
      object Memo9: TfrxMemoView
        Align = baLeft
        Left = 200.315090000000000000
        Top = 102.047310000000000000
        Width = 86.929190000000010000
        Height = 30.236220470000000000
        StretchMode = smMaxHeight
        Memo.Strings = (
          '[LISTPROPN6]')
      end
      object Memo10: TfrxMemoView
        Left = 287.244280000000000000
        Top = 94.488250000000000000
        Width = 113.385900000000000000
        Height = 15.118110240000000000
        Memo.Strings = (
          '[LISTPROPNCountry]')
      end
      object MemoObl_R: TfrxMemoView
        Left = 287.244280000000000000
        Top = 109.606370000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNObl]')
      end
      object Memo12: TfrxMemoView
        Left = 287.244280000000000000
        Top = 124.724490000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNRaj]')
      end
      object MemoTown_R: TfrxMemoView
        Left = 287.244280000000000000
        Top = 139.842610000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNTown]')
      end
      object Memo14: TfrxMemoView
        Align = baLeft
        Left = 37.795300000000000000
        Top = 279.685220000000000000
        Width = 714.331170000000000000
        Height = 3.779530000000000000
        Frame.Typ = [ftTop]
        Frame.Width = 2.000000000000000000
      end
      object Memo15: TfrxMemoView
        Align = baLeft
        Left = 37.795300000000000000
        Top = 393.071120000000000000
        Width = 714.331170000000000000
        Height = 3.779530000000000000
        Frame.Typ = [ftTop]
        Frame.Width = 2.000000000000000000
      end
      object Memo16: TfrxMemoView
        Left = 37.795300000000000000
        Top = 173.858380000000000000
        Width = 79.370130000000000000
        Height = 49.133890000000000000
        Memo.Strings = (
          '[LISTPROPN7]')
      end
      object Memo17: TfrxMemoView
        Left = 139.842610000000000000
        Top = 166.299320000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNCountry]')
      end
      object MemoObl_L: TfrxMemoView
        Left = 139.842610000000000000
        Top = 181.417440000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNObl]')
      end
      object Memo19: TfrxMemoView
        Left = 139.842610000000000000
        Top = 196.535560000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNRaj]')
      end
      object MemoTown_L: TfrxMemoView
        Left = 139.842610000000000000
        Top = 211.653680000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        Memo.Strings = (
          '[LISTPROPNTown]')
      end
      object Memo21: TfrxMemoView
        Left = 544.252320000000000000
        Top = 166.299320000000000000
        Width = 7.559060000000000000
        Height = 71.811070000000000000
        Frame.Typ = [ftLeft]
      end
      object Memo22: TfrxMemoView
        Left = 559.370440000000000000
        Top = 166.299320000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNRaj]')
      end
      object Memo23: TfrxMemoView
        Left = 559.370440000000000000
        Top = 181.417440000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNStrit]')
      end
      object Memo24: TfrxMemoView
        Left = 559.370440000000000000
        Top = 196.535560000000000000
        Width = 37.795300000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNBuild]')
      end
      object Memo25: TfrxMemoView
        Align = baLeft
        Left = 623.622450000000100000
        Top = 196.535560000000000000
        Width = 45.354360000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          ' [LISTPROPNCorp]')
      end
      object Memo26: TfrxMemoView
        Align = baLeft
        Left = 684.094930000000100000
        Top = 196.535560000000000000
        Width = 52.913420000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNKv]')
      end
      object Memo27: TfrxMemoView
        Align = baLeft
        Left = 117.165378740000000000
        Top = 22.677180000000000000
        Width = 260.787570000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_FAM"]')
        ParentFont = False
      end
      object Memo28: TfrxMemoView
        Align = baLeft
        Left = 117.165430000000000000
        Top = 37.795300000000000000
        Width = 291.023810000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_IMYA"]')
        ParentFont = False
      end
      object Memo29: TfrxMemoView
        Align = baLeft
        Left = 117.165430000000000000
        Top = 52.913420000000000000
        Width = 253.228510000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_OTCH"]')
        ParentFont = False
      end
      object Memo30: TfrxMemoView
        Left = 415.748300000000000000
        Top = 22.677180000000000000
        Width = 309.921460000000000000
        Height = 15.118110240000000000
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_FAM_UA"]')
      end
      object Memo31: TfrxMemoView
        Left = 415.748300000000000000
        Top = 37.795300000000000000
        Width = 309.921460000000000000
        Height = 15.118110240000000000
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_IMYA_UA"]')
      end
      object Memo32: TfrxMemoView
        Left = 415.748300000000000000
        Top = 52.913420000000000000
        Width = 309.921460000000000000
        Height = 15.118110240000000000
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_OTCH_UA"]')
      end
      object Memo33: TfrxMemoView
        Left = 415.748300000000000000
        Top = 68.031540000000000000
        Width = 309.921460000000000000
        Height = 15.118110240000000000
        Frame.Typ = [ftBottom]
      end
      object Memo34: TfrxMemoView
        Align = baLeft
        Left = 117.165430000000000000
        Top = 68.031540000000000000
        Width = 204.094488190000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          ' [frxDBDataset."OUT_NATIONAL"]')
        ParentFont = False
      end
      object Memo35: TfrxMemoView
        Left = 37.795300000000000000
        Top = 113.385900000000000000
        Width = 30.236240000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        DataField = 'OUT_DATE'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_DATE"]')
        ParentFont = False
      end
      object Memo36: TfrxMemoView
        Align = baLeft
        Left = 68.031540000000010000
        Top = 113.385900000000000000
        Width = 102.047310000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        DataField = 'OUT_MONTH'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_MONTH"]')
        ParentFont = False
      end
      object Memo37: TfrxMemoView
        Left = 68.031540000000000000
        Top = 128.504020000000000000
        Width = 102.047310000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        DataField = 'OUT_YEAR'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_YEAR"]')
        ParentFont = False
      end
      object Memo38: TfrxMemoView
        Align = baLeft
        Left = 170.078850000000000000
        Top = 128.504020000000000000
        Width = 18.897650000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[LISTPROPNYear]')
        ParentFont = False
      end
      object Memo39: TfrxMemoView
        Align = baLeft
        Left = 400.630180000000000000
        Top = 94.488250000000000000
        Width = 325.039580000000000000
        Height = 15.118110240000000000
        DataField = 'OUT_COUNTRY_R'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_COUNTRY_R"]')
        ParentFont = False
      end
      object MemoKraj_R: TfrxMemoView
        Align = baLeft
        Left = 366.614410000000000000
        Top = 109.606370000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNTownKraj]')
      end
      object MemoResp_R: TfrxMemoView
        Align = baLeft
        Left = 457.323130000000000000
        Top = 109.606370000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNTownResp]')
      end
      object Memo42: TfrxMemoView
        Align = baLeft
        Left = 445.984540000000000000
        Top = 109.606370000000000000
        Width = 11.338590000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          ',')
      end
      object Memo11: TfrxMemoView
        Align = baLeft
        Left = 536.693260000000000000
        Top = 109.606370000000000000
        Width = 230.551330000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo11OnBeforePrint'
        DataField = 'OUT_OBL_R'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_OBL_R"]')
        ParentFont = False
      end
      object Memo40: TfrxMemoView
        Align = baLeft
        Left = 366.614410000000000000
        Top = 124.724490000000000000
        Width = 393.071120000000000000
        Height = 15.118110240000000000
        DataField = 'OUT_RAJ_R'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_RAJ_R"]')
        ParentFont = False
      end
      object MemoSelo_R: TfrxMemoView
        Align = baLeft
        Left = 366.614410000000000000
        Top = 139.842610000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNTownSel]')
      end
      object Memo43: TfrxMemoView
        Align = baLeft
        Left = 445.984540000000000000
        Top = 139.842610000000000000
        Width = 317.480520000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo43OnBeforePrint'
        DataField = 'OUT_TOWN_R'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_TOWN_R"]')
        ParentFont = False
      end
      object Memo13: TfrxMemoView
        Left = 234.330860000000000000
        Top = 166.299320000000000000
        Width = 283.464750000000000000
        Height = 15.118110240000000000
        DataField = 'OUT_COUNTRY_L'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_COUNTRY_L"]')
        ParentFont = False
      end
      object MemoKraj_L: TfrxMemoView
        Left = 219.212740000000000000
        Top = 181.417440000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNTownKraj]')
      end
      object MemoResp_L: TfrxMemoView
        Align = baLeft
        Left = 309.921460000000000000
        Top = 181.417440000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNTownResp]')
      end
      object Memo41: TfrxMemoView
        Align = baLeft
        Left = 298.582870000000000000
        Top = 181.417440000000000000
        Width = 11.338590000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          ',')
      end
      object Memo44: TfrxMemoView
        Align = baLeft
        Left = 389.291590000000000000
        Top = 181.417440000000000000
        Width = 151.181200000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo44OnBeforePrint'
        DataField = 'OUT_OBL_L'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_OBL_L"]')
        ParentFont = False
      end
      object Memo18: TfrxMemoView
        Left = 219.212740000000000000
        Top = 196.535560000000000000
        Width = 298.582870000000000000
        Height = 15.118110240000000000
        DataField = 'OUT_RAJ_L'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_RAJ_L"]')
        ParentFont = False
      end
      object MemoSelo_L: TfrxMemoView
        Left = 219.212740000000000000
        Top = 211.653680000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        Memo.Strings = (
          '[LISTPROPNTownSel]')
      end
      object Memo20: TfrxMemoView
        Align = baLeft
        Left = 298.582870000000000000
        Top = 211.653680000000000000
        Width = 219.212740000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo20OnBeforePrint'
        DataField = 'OUT_TOWN_L'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_TOWN_L"]')
        ParentFont = False
      end
      object Memo45: TfrxMemoView
        Align = baLeft
        Left = 638.740570000000000000
        Top = 166.299320000000000000
        Width = 128.504020000000000000
        Height = 15.118110240000000000
        Frame.Typ = [ftBottom]
      end
      object Memo47: TfrxMemoView
        Align = baLeft
        Left = 638.740570000000000000
        Top = 181.417440000000000000
        Width = 143.622140000000000000
        Height = 15.118110240000000000
        Frame.Typ = [ftBottom]
      end
      object Memo46: TfrxMemoView
        Align = baLeft
        Left = 597.165740000000000000
        Top = 196.535560000000000000
        Width = 26.456710000000000000
        Height = 15.118110240000000000
        Frame.Typ = [ftBottom]
      end
      object Memo48: TfrxMemoView
        Align = baLeft
        Left = 668.976810000000100000
        Top = 196.535560000000000000
        Width = 15.118120000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          ' ')
      end
      object Memo49: TfrxMemoView
        Align = baLeft
        Left = 737.008350000000100000
        Top = 196.535560000000000000
        Width = 18.897650000000000000
        Height = 15.118110240000000000
        Frame.Typ = [ftBottom]
      end
      object Memo50: TfrxMemoView
        Left = 139.842610000000000000
        Top = 226.771800000000000000
        Width = 30.236240000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        DataField = 'OUT_END_DATE'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_END_DATE"]')
        ParentFont = False
      end
      object Memo51: TfrxMemoView
        Align = baLeft
        Left = 170.078850000000000000
        Top = 226.771800000000000000
        Width = 120.944960000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        DataField = 'OUT_END_MONTH'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_END_MONTH"]')
        ParentFont = False
      end
      object Memo52: TfrxMemoView
        Align = baLeft
        Left = 291.023810000000000000
        Top = 226.771800000000000000
        Width = 30.236240000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        DataField = 'OUT_END_YEAR'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_END_YEAR"]')
        ParentFont = False
      end
      object Memo53: TfrxMemoView
        Align = baLeft
        Left = 321.260050000000000000
        Top = 226.771800000000000000
        Width = 18.897650000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[LISTPROPNYear]')
        ParentFont = False
      end
      object Memo54: TfrxMemoView
        Align = baLeft
        Left = 37.795300000000000000
        Top = 234.330860000000000000
        Width = 680.315400000000000000
        Height = 15.118110240000000000
        Frame.Typ = [ftBottom]
      end
      object Memo55: TfrxMemoView
        Align = baLeft
        Left = 37.795300000000000000
        Top = 249.448980000000000000
        Width = 680.315400000000000000
        Height = 15.118110240000000000
        Frame.Typ = [ftBottom]
      end
      object Memo56: TfrxMemoView
        Left = 559.370440000000000000
        Top = 211.653680000000000000
        Width = 37.795300000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '"  "')
      end
      object Memo57: TfrxMemoView
        Align = baLeft
        Left = 597.165740000000000000
        Top = 211.653680000000000000
        Width = 75.590600000000000000
        Height = 15.118110240000000000
        Frame.Typ = [ftBottom]
      end
      object Memo58: TfrxMemoView
        Left = 676.535870000000000000
        Top = 211.653680000000000000
        Width = 41.574830000000000000
        Height = 15.118110240000000000
        Frame.Typ = [ftBottom]
      end
      object Memo59: TfrxMemoView
        Align = baLeft
        Left = 718.110700000000000000
        Top = 211.653680000000000000
        Width = 18.897650000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNYear]')
      end
      object Memo60: TfrxMemoView
        Left = 37.795300000000000000
        Top = 287.244280000000000000
        Width = 94.488250000000000000
        Height = 30.236240000000000000
        Frame.Typ = [ftRight, ftBottom]
        Memo.Strings = (
          '[LISTPROPN8]')
      end
      object Memo61: TfrxMemoView
        Left = 132.283550000000000000
        Top = 287.244280000000000000
        Width = 79.370130000000000000
        Height = 30.236240000000000000
        Frame.Typ = [ftRight, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[LISTPROPN8NumberPass]')
        VAlign = vaBottom
      end
      object Memo62: TfrxMemoView
        Left = 211.653680000000000000
        Top = 287.244280000000000000
        Width = 514.016080000000000000
        Height = 30.236240000000000000
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[LISTPROPN8PassVud]')
        VAlign = vaBottom
      end
      object Memo63: TfrxMemoView
        Left = 37.795300000000000000
        Top = 317.480520000000000000
        Width = 94.488250000000000000
        Height = 15.118110240000000000
        DataField = 'OUT_SERIAL_PASP'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftRight, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_SERIAL_PASP"]')
        ParentFont = False
      end
      object Memo64: TfrxMemoView
        Left = 132.283550000000000000
        Top = 317.480520000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        DataField = 'OUT_NUM_PASP'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftRight, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_NUM_PASP"]')
        ParentFont = False
      end
      object Memo65: TfrxMemoView
        Left = 211.653680000000000000
        Top = 317.480520000000000000
        Width = 514.016080000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_VYDAN_PASP"] [frxDBDataset."OUT_DATE_PASP"]')
        ParentFont = False
      end
      object Memo66: TfrxMemoView
        Left = 37.795300000000000000
        Top = 332.598640000000000000
        Width = 94.488250000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftRight, ftBottom]
        HAlign = haCenter
        ParentFont = False
      end
      object Memo67: TfrxMemoView
        Left = 132.283550000000000000
        Top = 332.598640000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftRight, ftBottom]
        HAlign = haCenter
        ParentFont = False
      end
      object Memo68: TfrxMemoView
        Left = 211.653680000000000000
        Top = 332.598640000000000000
        Width = 514.016080000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo69: TfrxMemoView
        Left = 37.795300000000000000
        Top = 347.716760000000000000
        Width = 94.488250000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftRight, ftBottom]
        HAlign = haCenter
        ParentFont = False
      end
      object Memo70: TfrxMemoView
        Left = 132.283550000000000000
        Top = 347.716760000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftRight, ftBottom]
        HAlign = haCenter
        ParentFont = False
      end
      object Memo71: TfrxMemoView
        Left = 211.653680000000000000
        Top = 347.716760000000000000
        Width = 514.016080000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo72: TfrxMemoView
        Left = 37.795300000000000000
        Top = 362.834880000000000000
        Width = 94.488250000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftRight, ftBottom]
        HAlign = haCenter
        ParentFont = False
      end
      object Memo73: TfrxMemoView
        Left = 132.283550000000000000
        Top = 362.834880000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftRight, ftBottom]
        HAlign = haCenter
        ParentFont = False
      end
      object Memo74: TfrxMemoView
        Left = 211.653680000000000000
        Top = 362.834880000000000000
        Width = 514.016080000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo75: TfrxMemoView
        Left = 37.795300000000000000
        Top = 404.409710000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPN9]')
      end
      object MemoTown_N: TfrxMemoView
        Left = 264.567100000000000000
        Top = 396.850650000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[LISTPROPNTown]')
      end
      object Memo76: TfrxMemoView
        Align = baLeft
        Left = 343.937230000000000000
        Top = 396.850650000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        Memo.Strings = (
          '[LISTPROPNTownSel]')
      end
      object Memo77: TfrxMemoView
        Left = 423.307360000000000000
        Top = 396.850650000000000000
        Width = 260.787570000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_TOWN_LIVE"]-[frxDBDataset."OUT_IND_LIVE"]')
        ParentFont = False
      end
      object Memo78: TfrxMemoView
        Left = 264.567100000000000000
        Top = 411.968770000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNStrit]')
      end
      object Memo79: TfrxMemoView
        Align = baLeft
        Left = 343.937230000000000000
        Top = 411.968770000000000000
        Width = 162.519790000000000000
        Height = 15.118110240000000000
        DataField = 'OUT_STR_LIVE'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_STR_LIVE"]')
        ParentFont = False
      end
      object Memo80: TfrxMemoView
        Align = baLeft
        Left = 506.457020000000000000
        Top = 411.968770000000000000
        Width = 26.456710000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNBuild]')
      end
      object Memo81: TfrxMemoView
        Align = baLeft
        Left = 532.913730000000000000
        Top = 411.968770000000000000
        Width = 41.574830000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        DataField = 'OUT_NUMBER_LIVE'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_NUMBER_LIVE"]')
        ParentFont = False
      end
      object Memo82: TfrxMemoView
        Align = baLeft
        Left = 616.063390000000000000
        Top = 411.968770000000000000
        Width = 34.015770000000000000
        Height = 15.118110240000000000
        DataField = 'OUT_NAME_LIVE'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_NAME_LIVE"]')
        ParentFont = False
      end
      object Memo83: TfrxMemoView
        Align = baLeft
        Left = 574.488560000000000000
        Top = 411.968770000000000000
        Width = 41.574830000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNCorp]')
      end
      object Memo84: TfrxMemoView
        Align = baLeft
        Left = 650.079160000000000000
        Top = 411.968770000000000000
        Width = 41.574830000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPNKv]')
      end
      object Memo85: TfrxMemoView
        Align = baLeft
        Left = 691.653990000000000000
        Top = 411.968770000000000000
        Width = 41.574830000000000000
        Height = 15.118110240000000000
        Frame.Typ = [ftBottom]
      end
      object Memo86: TfrxMemoView
        Left = 37.795300000000000000
        Top = 427.086890000000000000
        Width = 691.653990000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo87: TfrxMemoView
        Left = 37.795300000000000000
        Top = 442.205010000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        AutoWidth = True
        Memo.Strings = (
          '[LISTPROPN10]')
      end
      object Memo105: TfrxMemoView
        Width = 37.795300000000000000
        Height = 487.559370000000000000
        CharSpacing = 10.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          #1050#1040#1056#1058#1054#1063#1050#1040' '#1055#1056#1054#1055#1048#1057#1050#1048)
        ParentFont = False
        Rotation = 90
        VAlign = vaCenter
      end
      object Memo107: TfrxMemoView
        Left = 313.700990000000000000
        Top = 442.205010000000000000
        Width = 415.748300000000000000
        Height = 18.897650000000000000
        DataField = 'OUT_NAME_WORK'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_NAME_WORK"]')
        ParentFont = False
      end
      object Memo109: TfrxMemoView
        Left = 37.795300000000000000
        Top = 461.102660000000000000
        Width = 691.653990000000000000
        Height = 18.897650000000000000
        DataField = 'OUT_NAME_WORK_SPEC'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_NAME_WORK_SPEC"]')
      end
      object MemoTYPE_STAN: TfrxMemoView
        Left = 37.795300000000000000
        Width = 94.488249999999990000
        Height = 18.897650000000000000
        OnBeforePrint = 'MemoTYPE_STANOnBeforePrint'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Memo111: TfrxMemoView
        Left = 612.283860000000000000
        Top = 3.779530000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          #1060#1054#1056#1052#1040' '#1040)
        ParentFont = False
      end
    end
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Top = 32
  end
  object pFIBDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 64
  end
  object pFIBDataSet: TpFIBDataSet
    Database = pFIBDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from ST_PRINT_LIST_PROPISKA(:param_people) ')
    Left = 96
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TACommit
    Left = 64
    Top = 32
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    DataSet = pFIBDataSet
    Left = 128
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
  object pFIBStoredProc: TpFIBStoredProc
    Database = pFIBDatabase
    Transaction = WriteTransaction
    Left = 160
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TARollback
    Left = 96
    Top = 32
  end
end
