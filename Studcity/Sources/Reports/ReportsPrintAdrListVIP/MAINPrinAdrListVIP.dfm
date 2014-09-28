object frmMAINPrinAdrListVIP: TfrmMAINPrinAdrListVIP
  Left = 397
  Top = 425
  Width = 440
  Height = 111
  Caption = 'frmMAINPrinAdrListVIP'
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
    Left = -1
    Top = 8
    Width = 429
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Caption = 
      'cxLabelStatus                                                   ' +
      '                                  '
  end
  object cxButton1: TcxButton
    Left = 261
    Top = 32
    Width = 75
    Height = 25
    Caption = #1044#1088#1091#1082
    Default = True
    TabOrder = 1
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 349
    Top = 32
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 2
    OnClick = cxButton2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 63
    Width = 432
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object pFIBDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 72
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TARollback
    Left = 72
    Top = 48
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TACommit
    Left = 104
    Top = 16
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    DataSet = pFIBDataSet
    Left = 248
    Top = 16
  end
  object pFIBDataSet: TpFIBDataSet
    Database = pFIBDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from ST_PRINT_ADRLIST_VUPISKA(:param_people) ')
    Left = 216
    Top = 16
    poSQLINT64ToBCD = True
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38581.983015405100000000
    ReportOptions.LastChange = 39345.581671782400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo39OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDataset."OUT_CHILD_1_D">='#39'0'#39' then'
      '    begin'
      '      Memo39.Text:='#39#39';'
      '    end;'
      'end;'
      ''
      'procedure Memo42OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if <frxDBDataset."OUT_CHILD_2_D">='#39'0'#39' then'
      '    begin'
      '      Memo42.Text:='#39#39';'
      '    end;'
      'end;'
      ''
      'procedure Memo45OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if <frxDBDataset."OUT_CHILD_3_D">='#39'0'#39' then'
      '    begin'
      '      Memo45.Text:='#39#39';'
      '    end;'
      'end;'
      ''
      'procedure Memo48OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if <frxDBDataset."OUT_CHILD_4_D">='#39'0'#39' then'
      '    begin'
      '      Memo48.Text:='#39#39';'
      '    end;'
      'end;'
      ''
      'procedure Memo51OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if <frxDBDataset."OUT_CHILD_5_D">='#39'0'#39' then'
      '    begin'
      '      Memo51.Text:='#39#39';'
      '    end;'
      'end;'
      ''
      'procedure Memo14OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'if   <frxDBDataset."OUT_DATE_VIP_END">=0 then'
      '  begin'
      
        '    Memo14.text:='#39'                      "  "                   '#1075 +
        '. '#39';'
      '    Memo55.text:='#39'"  "                   '#1075'. '#39';'
      '  end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 152
    Top = 48
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
      end>
    Variables = <
      item
        Name = 'NAME_REP'
        Value = #39#1058#1040#1051#1054#1053' '#1056#1045#1028#1057#1058#1056#1040#1062#1030#1031'   '#1047#1040' '#1052#1030#1057#1062#1045#1052' '#1055#1056#1054#1046#1048#1042#1040#1053#1053#1071#39
      end
      item
        Name = 'LISTPROPN1ADR'
        Value = #39'1.'#1055#1088#1110#1079#1074#1080#1097#1077#39
      end
      item
        Name = 'LISTPROPN2ADR'
        Value = #39'2.'#1030#1084#39#39#1103#39
      end
      item
        Name = 'LISTPROPN3ADR'
        Value = #39'3.'#1055#1086' '#1073#1072#1090#1100#1082#1086#1074#1110#39
      end
      item
        Name = 'LISTPROPDateRogADR'
        Value = #39#1072#39
      end
      item
        Name = 'LISTPROPN5ADR'
        Value = #39'6. '#1052#1110#1089#1094#1077' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103#39
      end
      item
        Name = 'LISTPROPN6ADR'
        Value = #39'7. '#1057#1090#1072#1090#1100#39
      end
      item
        Name = 'LISTPROPN6PolADR'
        Value = #39#1095#1086#1083'.,'#1078#1110#1085'.'#39
      end
      item
        Name = 'LISTPROPNOblADR'
        Value = #39#1086#1073#1083'.'#39
      end
      item
        Name = 'LISTPROPNRajADR'
        Value = #39#1088#1072#1081#1086#1085'.'#39
      end
      item
        Name = 'LISTPROPNTownADR'
        Value = #39#1084#1110#1089#1090#1086#39
      end
      item
        Name = 'LISTPROPNTownSelADR'
        Value = #39#1089#1077#1083#1086#39
      end
      item
        Name = 'LISTPROPNTownKrajADR'
        Value = #39'('#1082#1088#1072#1081#39
      end
      item
        Name = 'LISTPROPNTownRespADR'
        Value = #39#1088#1077#1089#1087#1091#1073#1083#1110#1082#1072')'#39
      end
      item
        Name = 'LISTPROPNTownDerADR'
        Value = #39#39
      end
      item
        Name = 'LISTPROPNStritADR'
        Value = #39#1074#1091#1083'.'#39
      end
      item
        Name = 'LISTPROPNBuildADR'
        Value = #39#1073#1091#1076'.'#39
      end
      item
        Name = 'LISTPROPNCorpADR'
        Value = #39#1082#1086#1088#1087'.'#39
      end
      item
        Name = 'LISTPROPNKvADR'
        Value = #39#1082#1074'.'#39
      end
      item
        Name = 'LISTPROPNPGTADR'
        Value = #39'('#1089#1084#1090')'#39
      end
      item
        Name = 'LISTPROPN7ADR'
        Value = #39'7. '#1053#1072#1094#1110#1086#1085#1072#1083#1100#1085#1110#1089#1090#1100#39
      end
      item
        Name = 'LISTPROPNYearADR'
        Value = #39#1088'.'#39
      end
      item
        Name = 'LISTPROPN8ADR'
        Value = #39'8. '#1047#1074#1110#1076#1082#1080' '#1087#1088#1080#1073#1091#1074' '#1091' '#1076#1072#1085#1085#1091' '#1084#1110#1089#1094#1077#1074#1110#1089#1090#1100' '#1110' '#1082#1086#1083#1080#39
      end
      item
        Name = 'LISTPROPN8ORGANADR'
        Value = #39#1071#1082#1080#1084' '#1086#1088#1075#1072#1085#1086#1084' '#1086#1092#1086#1088#1084#1083#1077#1085#1072' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1103#39
      end
      item
        Name = 'LISTPROPN9ADR'
        Value = #39'9. '#1041#1091#1074' '#1079#1072#1088#1077#1108#1089#1090#1088#1086#1074#1072#1085#1080#1081' '#1079#1072' '#1072#1076#1088#1077#1089#1086#1102#39
      end
      item
        Name = 'LISTPROPN9DONADR'
        Value = #39#1055#1077#1088#1077#1111#1093#1072#1074' '#1091' '#1090#1086#1084#1091' '#1078' '#1085#1072#1089#1077#1083#1077#1085#1085#1086#1084#1091' '#1087#1091#1085#1082#1090#1110' '#1079#39
      end
      item
        Name = 'LISTPROPN9CHANGEFAMADR'
        Value = #39#1095#1080' '#1079#1084#1110#1085#1080#1074' '#1087#1088#1110#1079#1074#1080#1097#1077' ,'#1110#1084#39#39#1103' , '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110' '#1079#39
      end
      item
        Name = 'LISTPROPN9CHANGE1ADR'
        Value = #39#1079#1072#1079#1085#1072#1095#1080#1090#1080#39
      end
      item
        Name = 'LISTPROPN9CHANGE2ADR'
        Value = #39#1087#1086#1087#1077#1088#1077#1076#1085#1110' '#1076#1072#1085#1085#1110#39
      end
      item
        Name = 'LISTPROPN9OTHERADR'
        Value = #39#39
      end
      item
        Name = 'LISTPROPN10ADR'
        Value = #39#1052#1077#1090#1072' '#1087#1088#1080#1111#1079#1076#1091#39
      end
      item
        Name = 'LISTPROPN101ADR'
        Value = #39#1085#1072' '#1088#1086#1073#1086#1090#1091', '#1085#1072#1074#1095#1072#1085#1085#1103' , '#1076#1086' '#1084#1110#1089#1094#1103#39
      end
      item
        Name = 'LISTPROPN102ADR'
        Value = #39#1087#1088#1086#1078#1080#1074#1072#1085#1085#1103' '#1110' '#1090'.'#1087'. '#1085#1072' '#1103#1082#1080#1081' '#1090#1077#1088#1084#1110#1085#39
      end
      item
        Name = 'LISTPROPN11ADR'
        Value = #39'11. '#1044#1077' '#1090#1072' '#1082#1080#1084' '#1087#1088#1072#1094#1102#1108#39
      end
      item
        Name = 'LISTPROPN111ADR'
        Value = #39#1103#1082#1097#1086' '#1085#1077' '#1087#1088#1072#1094#1102#1108' , '#1090#1086' '#1079#1072#1079#1085#1072#1095#1080#1090#1080' - '#39
      end
      item
        Name = 'LISTPROPN112ADR'
        Value = #39#39
      end
      item
        Name = 'LISTPROPN12ADR'
        Value = #39'11. '#1055#1072#1089#1087#1086#1088#1090' '#1089#1077#1088#1110#1103#39
      end
      item
        Name = 'LISTPROPN12NumberPass'
        Value = #39#8470#39
      end
      item
        Name = 'LISTPROPN12PassVudADR'
        Value = #39#39
      end
      item
        Name = 'LISTPROPN12PassORGANADR'
        Value = #39#1085#1072#1080#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1086#1088#1075#1072#1085#1072' '#1074#1085#1091#1090#1088#1110#1096#1085#1085#1110#1093' '#1089#1087#1088#1072#1074#39
      end
      item
        Name = 'LISTPROPN13ADR'
        Value = #39'14. '#1056#1072#1079#1086#1084' '#1079' '#1085#1080#1084'('#1085#1077#1102') '#1074#1080#1073#1091#1083#1080' '#1076#1110#1090#1080' '#1076#1086' 16 '#1088#1086#1082#1110#1074':'#39
      end
      item
        Name = 'LISTPROPN131ADR'
        Value = #39'1.'#1030#1084#39#39#1103#39
      end
      item
        Name = 'LISTPROPN132ADR'
        Value = #39#1089#1090#1072#1090#1100#39
      end
      item
        Name = 'LISTPROPN133ADR'
        Value = #39#1056#1110#1082' '#1110' '#1084#1110#1089#1103#1094#1100' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103#39
      end
      item
        Name = 'LISTPROPN134ADR'
        Value = #39#1055#1088#1080#1084#1110#1090#1082#1072'.'#39
      end
      item
        Name = 'LISTPROPN135ADR'
        Value = #39#39
      end
      item
        Name = 'LISTPROPN14ADR'
        Value = #39'15.'#1058#1072#1083#1086#1085' '#1089#1082#1083#1072#1076#1077#1085#1086#39
      end
      item
        Name = 'LISTPROPN141ADR'
        Value = #39#1055#1110#1076#1087#1080#1089#39
      end
      item
        Name = 'LISTPROPN142ADR'
        Value = #39#1074#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1086#1075#1086' '#1079#1072' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1102#39
      end
      item
        Name = 'LISTPROPN15ADR'
        Value = #39#39
      end
      item
        Name = 'LISTPROPN151ADR'
        Value = #39'"____"______________ _____ '#1088'.'#39
      end
      item
        Name = 'LISTPROPN13_TOADR'
        Value = #39#1090#1080#1084#1095#1072#1089#1086#1074#1086' '#1076#1086#39
      end
      item
        Name = 'LISTPROPN13_TSADR'
        Value = #39#1085#1072' '#1085#1072#1074#1095#1072#1085#1085#1103' '#1076#1086#39
      end
      item
        Name = 'LISTPROPNREASON'
        Value = #39#1052#1077#1090#1072' '#1074#1080#1111#1079#1076#1091#39
      end
      item
        Name = 'LISTPROPNREASONNAME'
        Value = #39#1085#1072' '#1087#1088#1086#1078#1080#1074#1072#1085#1085#1103' '#1087#1086#1089#1090#1110#1081#1085#1086#39
      end
      item
        Name = 'LISTPROPNWORK'
        Value = #39#1044#1077' '#1090#1072' '#1082#1086#1083#1080' '#1087#1088#1072#1094#1102#1074#1072#1074' '#1076#1086' '#1074#1080#1111#1076#1091#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 6.000000000000000000
      BottomMargin = 10.000000000000000000
      object Memo1: TfrxMemoView
        Left = 188.976500000000000000
        Width = 264.567100000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[LISTPROPN9DONADR]')
        ParentFont = False
      end
      object Memo2: TfrxMemoView
        Align = baLeft
        Left = 453.543600000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[LISTPROPNStritADR]')
        ParentFont = False
      end
      object Memo3: TfrxMemoView
        Align = baLeft
        Left = 532.913730000000000000
        Width = 94.488250000000000000
        Height = 15.118110236220500000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo4: TfrxMemoView
        Left = 188.976500000000000000
        Top = 15.118120000000000000
        Width = 151.181200000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_DON_STR"]')
        ParentFont = False
      end
      object Memo5: TfrxMemoView
        Align = baLeft
        Left = 340.157700000000000000
        Top = 15.118120000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          ' [LISTPROPNBuildADR] '#8470' ')
        ParentFont = False
      end
      object Memo6: TfrxMemoView
        Align = baLeft
        Left = 419.527830000000000000
        Top = 15.118120000000000000
        Width = 37.795300000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_DON_BUILD"]')
        ParentFont = False
      end
      object Memo7: TfrxMemoView
        Align = baLeft
        Left = 457.323130000000000000
        Top = 15.118120000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[LISTPROPNCorpADR]')
        ParentFont = False
      end
      object Memo8: TfrxMemoView
        Align = baLeft
        Left = 536.693260000000000000
        Top = 15.118120000000000000
        Width = 37.795300000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_DON_KORP"]')
        ParentFont = False
      end
      object Memo9: TfrxMemoView
        Align = baLeft
        Left = 574.488560000000000000
        Top = 15.118120000000000000
        Width = 71.811070000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[LISTPROPNKvADR]')
        ParentFont = False
      end
      object Memo10: TfrxMemoView
        Align = baLeft
        Left = 646.299630000000000000
        Top = 15.118120000000000000
        Width = 22.677180000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_DON_KV"]')
        ParentFont = False
      end
      object Memo11: TfrxMemoView
        Left = 188.976500000000000000
        Top = 30.236240000000000000
        Width = 79.370130000000000000
        Height = 15.118110236220500000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[LISTPROPN9CHANGEFAMADR]')
        ParentFont = False
      end
      object Memo12: TfrxMemoView
        Left = 442.205010000000000000
        Top = 45.354360000000000000
        Width = 105.826840000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftTop]
        HAlign = haCenter
        Memo.Strings = (
          '[LISTPROPN9CHANGE1ADR]')
        ParentFont = False
      end
      object Memo13: TfrxMemoView
        Left = 188.976500000000000000
        Top = 75.590600000000000000
        Width = 359.055350000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftTop]
        HAlign = haCenter
        Memo.Strings = (
          #1085#1086#1074#1099#1077' '#1076#1072#1085#1085#1099#1077)
        ParentFont = False
      end
      object Memo16: TfrxMemoView
        Left = 188.976500000000000000
        Top = 90.708720000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '11. [LISTPROPNREASON]')
        ParentFont = False
      end
      object Memo17: TfrxMemoView
        Align = baLeft
        Left = 268.346630000000000000
        Top = 90.708720000000000000
        Width = 257.008040000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[LISTPROPNREASONNAME]')
        ParentFont = False
      end
      object Memo19: TfrxMemoView
        Left = 268.346630000000000000
        Top = 105.826840000000000000
        Width = 343.937230000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        HAlign = haCenter
        Memo.Strings = (
          '[LISTPROPN101ADR]')
        ParentFont = False
      end
      object Memo20: TfrxMemoView
        Left = 188.976500000000000000
        Top = 136.063080000000000000
        Width = 359.055350000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftTop]
        HAlign = haCenter
        Memo.Strings = (
          '[LISTPROPN102ADR]')
        ParentFont = False
      end
      object Memo21: TfrxMemoView
        Left = 188.976500000000000000
        Top = 151.181200000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '12.[LISTPROPNWORK]')
        ParentFont = False
      end
      object Memo22: TfrxMemoView
        Left = 188.976500000000000000
        Top = 181.417440000000000000
        Width = 359.055350000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftTop]
        HAlign = haCenter
        Memo.Strings = (
          '[LISTPROPN111ADR]')
        ParentFont = False
      end
      object Memo23: TfrxMemoView
        Left = 188.976500000000000000
        Top = 211.653680000000000000
        Width = 359.055350000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftTop]
        HAlign = haCenter
        Memo.Strings = (
          '[LISTPROPN112ADR]')
        ParentFont = False
      end
      object Memo24: TfrxMemoView
        Left = 188.976500000000000000
        Top = 226.771800000000000000
        Width = 120.944960000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '13.'#1055#1072#1089#1087#1086#1088#1090' '#1089#1077#1088#1110#1103)
        ParentFont = False
      end
      object Memo25: TfrxMemoView
        Align = baLeft
        Left = 309.921460000000000000
        Top = 226.771800000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        DataField = 'OUT_SERIAL_PASP'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_SERIAL_PASP"]')
        ParentFont = False
      end
      object Memo26: TfrxMemoView
        Align = baLeft
        Left = 389.291590000000100000
        Top = 226.771800000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          ' [LISTPROPN12NumberPass] ')
        ParentFont = False
      end
      object Memo27: TfrxMemoView
        Align = baLeft
        Left = 468.661720000000100000
        Top = 226.771800000000000000
        Width = 86.929190000000000000
        Height = 15.118110240000000000
        DataField = 'OUT_NUM_PASP'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_NUM_PASP"]')
        ParentFont = False
      end
      object Memo28: TfrxMemoView
        Align = baLeft
        Left = 555.590910000000000000
        Top = 226.771800000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[LISTPROPN12PassVudADR]')
        ParentFont = False
      end
      object Memo29: TfrxMemoView
        Left = 188.976500000000000000
        Top = 241.889920000000000000
        Width = 355.275820000000000000
        Height = 15.118110240000000000
        DataField = 'OUT_VYDAN_PASP'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_VYDAN_PASP"]')
        ParentFont = False
      end
      object Memo30: TfrxMemoView
        Left = 317.480520000000000000
        Top = 260.787570000000000000
        Width = 30.236240000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_DATE_PASP_V"]')
        ParentFont = False
      end
      object Memo31: TfrxMemoView
        Left = 359.055350000000000000
        Top = 260.787570000000000000
        Width = 120.944960000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_MONTH_PASP_V"]')
        ParentFont = False
      end
      object Memo32: TfrxMemoView
        Left = 483.779840000000000000
        Top = 260.787570000000000000
        Width = 30.236240000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_YEAR_PASP_V"]')
        ParentFont = False
      end
      object Memo33: TfrxMemoView
        Align = baLeft
        Left = 514.016080000000000000
        Top = 260.787570000000000000
        Width = 18.897650000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[LISTPROPNYearADR]')
        ParentFont = False
      end
      object Memo34: TfrxMemoView
        Left = 188.976490240000000000
        Top = 275.905690000000000000
        Width = 79.370130000000000000
        Height = 15.118110236220500000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[LISTPROPN13ADR]')
        ParentFont = False
      end
      object Memo35: TfrxMemoView
        Left = 188.976500000000000000
        Top = 291.023810000000000000
        Width = 117.165430000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[LISTPROPN131ADR]')
        ParentFont = False
      end
      object Memo36: TfrxMemoView
        Align = baLeft
        Left = 306.141930000000000000
        Top = 291.023810000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[LISTPROPN132ADR]')
        ParentFont = False
      end
      object Memo37: TfrxMemoView
        Left = 385.512060000000000000
        Top = 291.023810000000000000
        Width = 162.519790000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[LISTPROPN133ADR]')
        ParentFont = False
      end
      object Memo38: TfrxMemoView
        Left = 188.976500000000000000
        Top = 306.141930000000000000
        Width = 117.165430000000000000
        Height = 15.118110240000000000
        DataField = 'OUT_CHILD_1'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftRight, ftTop, ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_CHILD_1"]')
        ParentFont = False
      end
      object Memo39: TfrxMemoView
        Align = baLeft
        Left = 385.512060000000000000
        Top = 306.141930000000000000
        Width = 162.519790000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo39OnBeforePrint'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        DisplayFormat.DecimalSeparator = ','
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_CHILD_1_D"]')
        ParentFont = False
      end
      object Memo40: TfrxMemoView
        Align = baLeft
        Left = 306.141930000000000000
        Top = 306.141930000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_CHILD_1_P"]')
        ParentFont = False
      end
      object Memo41: TfrxMemoView
        Left = 188.976500000000000000
        Top = 321.260050000000000000
        Width = 117.165430000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftRight, ftTop, ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_CHILD_2"]')
        ParentFont = False
      end
      object Memo42: TfrxMemoView
        Align = baLeft
        Left = 385.512060000000000000
        Top = 321.260050000000000000
        Width = 162.519790000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo42OnBeforePrint'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        DisplayFormat.DecimalSeparator = ','
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_CHILD_2_D"]')
        ParentFont = False
      end
      object Memo43: TfrxMemoView
        Align = baLeft
        Left = 306.141930000000000000
        Top = 321.260050000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_CHILD_2_P"]')
        ParentFont = False
      end
      object Memo44: TfrxMemoView
        Left = 188.976500000000000000
        Top = 336.378170000000000000
        Width = 117.165430000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftRight, ftTop, ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_CHILD_3"]')
        ParentFont = False
      end
      object Memo45: TfrxMemoView
        Align = baLeft
        Left = 385.512060000000000000
        Top = 336.378170000000000000
        Width = 162.519790000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo45OnBeforePrint'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        DisplayFormat.DecimalSeparator = ','
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_CHILD_3_D"]')
        ParentFont = False
      end
      object Memo46: TfrxMemoView
        Align = baLeft
        Left = 306.141930000000000000
        Top = 336.378170000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_CHILD_3_P"]')
        ParentFont = False
      end
      object Memo47: TfrxMemoView
        Left = 188.976500000000000000
        Top = 351.496290000000000000
        Width = 117.165430000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftRight, ftTop, ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_CHILD_4"]')
        ParentFont = False
      end
      object Memo48: TfrxMemoView
        Align = baLeft
        Left = 385.512060000000000000
        Top = 351.496290000000000000
        Width = 162.519790000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo48OnBeforePrint'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        DisplayFormat.DecimalSeparator = ','
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_CHILD_4_D"]')
        ParentFont = False
      end
      object Memo49: TfrxMemoView
        Align = baLeft
        Left = 306.141930000000000000
        Top = 351.496290000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_CHILD_5_P"]')
        ParentFont = False
      end
      object Memo50: TfrxMemoView
        Left = 188.976500000000000000
        Top = 366.614410000000000000
        Width = 117.165430000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftRight, ftTop, ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_CHILD_5"]')
        ParentFont = False
      end
      object Memo51: TfrxMemoView
        Align = baLeft
        Left = 385.512060000000000000
        Top = 366.614410000000000000
        Width = 162.519790000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo51OnBeforePrint'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        DisplayFormat.DecimalSeparator = ','
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_CHILD_5_D"]')
        ParentFont = False
      end
      object Memo52: TfrxMemoView
        Align = baLeft
        Left = 306.141930000000000000
        Top = 366.614410000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_CHILD_5_P"]')
        ParentFont = False
      end
      object Memo53: TfrxMemoView
        Left = 188.976500000000000000
        Top = 381.732530000000000000
        Width = 105.826840000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[LISTPROPN134ADR]')
        ParentFont = False
      end
      object Memo54: TfrxMemoView
        Left = 188.976500000000000000
        Top = 381.732530000000000000
        Width = 359.055350000000000000
        Height = 15.118110240000000000
        StretchMode = smMaxHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '             [LISTPROPN135ADR]')
        ParentFont = False
      end
      object Memo56: TfrxMemoView
        Left = 257.008040000000000000
        Top = 427.086890000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[LISTPROPN141ADR]')
        ParentFont = False
      end
      object Memo57: TfrxMemoView
        Left = 317.480520000000000000
        Top = 442.205010000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftTop]
        Memo.Strings = (
          '[LISTPROPN142ADR]')
        ParentFont = False
      end
      object Memo58: TfrxMemoView
        Left = 188.976500000000000000
        Top = 457.323130000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '16. [LISTPROPN15ADR]')
        ParentFont = False
      end
      object Memo60: TfrxMemoView
        Left = 404.409710000000000000
        Top = 476.220780000000000000
        Width = 139.842610000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftTop]
        HAlign = haCenter
        Memo.Strings = (
          '[LISTPROPN141ADR]')
        ParentFont = False
      end
      object Memo61: TfrxMemoView
        Left = 438.425480000000000000
        Top = 457.323130000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        AutoWidth = True
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_FAM_RVD"]')
        ParentFont = False
      end
      object Memo62: TfrxMemoView
        Align = baLeft
        Left = 268.346630000000000000
        Top = 151.181200000000000000
        Width = 162.519790000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_NAME_WORK"]')
        ParentFont = False
      end
      object Memo63: TfrxMemoView
        Left = 188.976500000000000000
        Top = 196.535560000000000000
        Width = 359.055350000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '[frxDBDataset."OUT_NAME_WORK_SPEC"]')
        ParentFont = False
      end
      object Memo64: TfrxMemoView
        Left = 188.976500000000000000
        Top = 166.299320000000000000
        Width = 359.055350000000000000
        Height = 15.118110240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        HAlign = haRight
        ParentFont = False
      end
      object Memo14: TfrxMemoView
        Left = 188.976500000000000000
        Top = 411.968770000000000000
        Width = 359.055350000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo14OnBeforePrint'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          
            '                      "[frxDBDataset."OUT_DATE_VIP_END"]"      [' +
            'frxDBDataset."OUT_MON_VIP_END"]       [frxDBDataset."OUT_YEAR_VI' +
            'P_END"] '#1075'.')
        ParentFont = False
      end
      object Memo15: TfrxMemoView
        Left = 188.976500000000000000
        Top = 411.968770000000000000
        Width = 139.842610000000000000
        Height = 15.118110240000000000
        Memo.Strings = (
          '[LISTPROPN14ADR]')
      end
      object Memo18: TfrxMemoView
        Left = 328.819110000000000000
        Top = 427.086890000000000000
        Width = 162.519790000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftTop]
        ParentFont = False
      end
      object Memo55: TfrxMemoView
        Left = 188.976500000000000000
        Top = 472.441250000000000000
        Width = 204.094620000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          
            '"[frxDBDataset."OUT_DATE_VIP_END"]"      [frxDBDataset."OUT_MON_' +
            'VIP_END"]       [frxDBDataset."OUT_YEAR_VIP_END"] '#1075'.')
        ParentFont = False
      end
    end
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 120
    Top = 48
  end
  object ActionList1: TActionList
    Left = 256
    Top = 48
    object Designer: TAction
      Caption = 'Designer'
      ShortCut = 57412
      OnExecute = DesignerExecute
    end
  end
  object pFIBStoredProc: TpFIBStoredProc
    Left = 216
    Top = 48
  end
end
