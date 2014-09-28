object frmMainReportZajavStay: TfrmMainReportZajavStay
  Left = 502
  Top = 280
  Width = 335
  Height = 114
  Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077' '#1076#1083#1103' '#1089#1085#1103#1090#1080#1103' '#1089' '#1088#1077#1075#1080#1089#1090#1088#1080#1094#1080#1080
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
  object cxButton1: TcxButton
    Left = 96
    Top = 16
    Width = 75
    Height = 25
    Caption = #1044#1088#1091#1082
    Default = True
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 180
    Top = 16
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 61
    Width = 327
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
    Left = 200
  end
  object pFIBDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from ST_PRINT_FORMAN35_VIP(:param_people) ')
    Left = 168
    poSQLINT64ToBCD = True
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38574.593894120400000000
    ReportOptions.LastChange = 40332.665419189810000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  CNTPeople:Integer;'
      'procedure Memo32OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDataset."OUT_FIO_2">='#39#39' then'
      '    begin'
      '      Memo32.Text:='#39#39';'
      '    end'
      '    else'
      '    begin'
      '      CNTPeople:=CNTPeople+1;'
      '    end;'
      'end;'
      ''
      'procedure Memo47OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'CNTPeople:=<frxDBDataset."OUT_COUNT_PEOPLE">-CNTPeople;'
      '  if CNTPeople<0 then'
      '    begin'
      '         CNTPeople:=0;'
      '    end;'
      '  Memo47.Text:=IntToStr(CNTPeople);'
      'end;'
      ''
      'procedure Memo31OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  CNTPeople:=CNTPeople+1;'
      'end;'
      ''
      'procedure Memo33OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDataset."OUT_CHILD_NAME"><>'#39#39' then'
      '    begin'
      ''
      '    end;'
      'end;'
      ''
      'procedure Memo50OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'if <frxDBDataset."OUT_DATE_END_PROPI"> =0'
      '  then Memo50.text:='#39#39';'
      'end;'
      ''
      'procedure Memo59OnBeforePrint(Sender: TfrxComponent);'
      'Var'
      ' OBL,TOWN,RAJ,SELO,STREET,HOUSE,KVART,STR:String;'
      'begin'
      ' STR:='#39#39';'
      ' OBL    :='#39#1086#1073#1083'. '#39'+ <frxDBDataset."OUT_AFTE_OBL">;'
      ' TOWN   :='#39#1084'. '#39'+ <frxDBDataset."OUT_AFTE_TOWN">;'
      ' RAJ    :='#39#1088'. '#39'+ <frxDBDataset."OUT_AFTE_RAJ">;'
      ' SELO   :='#39#1089'. '#39'+<frxDBDataset."OUT_AFTE_SELO">;'
      ' STREET :='#39#1074#1091#1083'. '#39'+<frxDBDataset."OUT_AFTE_D_STREET">;'
      ' HOUSE  :='#39#1073#1091#1076'. '#39'+<frxDBDataset."OUT_AFTE_D_HOUSE">;'
      ' KVART  :='#39#1082#1074'. '#39'+<frxDBDataset."OUT_AFTE_D_KVART">;'
      ' STR:=OBL+'#39', '#39'+TOWN+'#39', '#39'+RAJ+'#39', '#39'+SELO+'#39', '#39';'
      'end;'
      ''
      'begin'
      '  CNTPeople:=0;'
      'end.')
    OnGetValue = frxReportGetValue
    Left = 152
    Top = 48
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      PaperWidth = 148.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 11
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 10.000000000000000000
      object Memo1: TfrxMemoView
        Width = 245.669450000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        HAlign = haCenter
        Memo.Strings = (
          #1042#1074#1086#1076#1080#1090#1100#1089#1103' '#1090#1080#1084#1095#1072#1089#1086#1074#1086' '#1085#1072' '#1087#1077#1088#1110#1086#1076' '#1076#1110#1111' '#1087#1086#1089#1090#1072#1085#1086#1074#1080)
        ParentFont = False
      end
      object Memo2: TfrxMemoView
        Top = 15.118120000000000000
        Width = 245.669450000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        HAlign = haCenter
        Memo.Strings = (
          #1050#1072#1073#1110#1085#1077#1090#1091' '#1052#1110#1085#1110#1089#1090#1088#1110#1074' '#1059#1082#1088#1072#1111#1085#1080)
        ParentFont = False
      end
      object Memo3: TfrxMemoView
        Top = 30.236240000000000000
        Width = 245.669450000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = []
        HAlign = haCenter
        Memo.Strings = (
          #1074#1110#1076' 16.01.2003'#1088'. '#8470' 35')
        ParentFont = False
      end
      object Memo4: TfrxMemoView
        Left = 268.346630000000000000
        Width = 253.228510000000000000
        Height = 37.795290240000000000
        StretchMode = smMaxHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        HAlign = haBlock
        Memo.Strings = (
          
            #1059' '#1074#1110#1076#1076#1110#1083' ('#1074#1110#1076#1076#1110#1083#1077#1085#1085#1103') '#1091' '#1089#1087#1088#1072#1074#1072#1093' '#1075#1088#1086#1084#1072#1076#1103#1085#1089#1090#1074#1072', '#1110#1084#1110#1075#1088#1072#1094#1110#1111' '#1090#1072' '#1088#1077#1108#1089#1090 +
            #1088#1072#1094#1110#1111' '#1092#1110#1079#1080#1095#1085#1080#1093' '#1086#1089#1110#1073)
        ParentFont = False
      end
      object Memo5: TfrxMemoView
        Left = 211.653680000000000000
        Top = 90.708720000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          #1047#1040#1071#1042#1040)
        ParentFont = False
      end
      object Memo6: TfrxMemoView
        Left = 147.401670000000000000
        Top = 109.606370000000000000
        Width = 272.126160000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          #1076#1083#1103' '#1079#1085#1103#1090#1090#1103' '#1079' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1086#1075#1086' '#1086#1073#1083#1110#1082#1091)
        ParentFont = False
      end
      object Memo7: TfrxMemoView
        Top = 139.842610000000000000
        Width = 18.897650000000000000
        Height = 15.118110240000000000
        Memo.Strings = (
          #1071',')
      end
      object Memo8: TfrxMemoView
        Top = 177.637910000000000000
        Width = 521.575140000000000000
        Height = 15.118110240000000000
        Memo.Strings = (
          
            #1087#1088#1086#1096#1091' '#1079#1085#1103#1090#1080' '#1079' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1086#1075#1086' '#1086#1073#1083#1110#1082#1091' '#1084#1077#1085#1077'('#1084#1086#1102' '#1085#1077#1087#1086#1074#1085#1086#1083#1110#1090#1085#1102' '#1076#1080#1090#1080#1085#1091 +
            ')')
      end
      object Memo9: TfrxMemoView
        Top = 226.771800000000000000
        Width = 521.575140000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftTop]
        HAlign = haCenter
        Memo.Strings = (
          '('#1072#1076#1084#1110#1085#1110#1089#1090#1088#1072#1090#1080#1074#1085#1086'-'#1090#1077#1088#1080#1090#1086#1088#1110#1072#1083#1100#1085#1072' '#1086#1076#1080#1085#1080#1094#1103')')
        ParentFont = False
      end
      object Memo10: TfrxMemoView
        Top = 241.889920000000000000
        Width = 113.385900000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          #1079#1072' '#1072#1076#1088#1077#1089#1086#1102': '#1074#1091#1083'.')
      end
      object Memo11: TfrxMemoView
        Top = 287.244280000000000000
        Width = 64.252010000000000000
        Height = 15.118110240000000000
        Memo.Strings = (
          #1044#1086#1082#1091#1084#1077#1085#1090':')
      end
      object Memo12: TfrxMemoView
        Left = 64.252010000000000000
        Top = 302.362400000000000000
        Width = 457.323130000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftTop]
        Memo.Strings = (
          
            #1087#1072#1089#1087#1086#1088#1090', '#1090#1080#1084#1095#1072#1089#1086#1074#1077' '#1087#1086#1089#1074#1110#1076#1095#1077#1085#1085#1103' '#1075#1088#1086#1084#1072#1076#1103#1085#1080#1085#1072' '#1059#1082#1088#1072#1111#1085#1080', '#1087#1086#1089#1074#1110#1076#1082#1072' '#1085#1072' ' +
            #1085#1072#1088#1086#1076#1078#1077#1085#1085#1103',')
        ParentFont = False
      end
      object Memo13: TfrxMemoView
        Top = 317.480520000000000000
        Width = 521.575140000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[frxDBDataset."OUT_PASP"] [frxDBDataset."OUT_PASP_DATE"] '#1088'.')
        ParentFont = False
      end
      object Memo14: TfrxMemoView
        Top = 332.598640000000000000
        Width = 521.575140000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftTop]
        HAlign = haCenter
        Memo.Strings = (
          
            '('#1089#1074#1110#1076#1086#1094#1090#1074#1086' '#1087#1088#1086' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103', '#1089#1074#1110#1076#1086#1094#1090#1074#1086' '#1087#1088#1086' '#1085#1072#1083#1077#1078#1085#1110#1089#1090#1100' '#1076#1086' '#1075#1088#1086#1084#1072#1076#1103#1085#1089 +
            #1090#1074#1072' '#1059#1082#1088#1072#1111#1085#1080',')
        ParentFont = False
      end
      object Memo16: TfrxMemoView
        Top = 355.275820000000000000
        Width = 521.575140000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftTop]
        HAlign = haCenter
        Memo.Strings = (
          #1089#1077#1088#1110#1103', '#1085#1086#1084#1077#1088', '#1076#1072#1090#1072' '#1074#1080#1076#1072#1095#1110', '#1086#1088#1075#1072#1085', '#1103#1082#1080#1081' '#1074#1080#1076#1072#1074')')
        ParentFont = False
      end
      object Memo17: TfrxMemoView
        Top = 453.543600000000000000
        Width = 521.575140000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          
            #1047#1085#1103#1090#1090#1103' '#1079' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1086#1075#1086' '#1086#1073#1083#1110#1082#1091' '#1085#1077#1087#1086#1074#1085#1086#1083#1110#1090#1085#1110#1093','#1103#1082#1110' '#1085#1077' '#1084#1072#1102#1090#1100' '#1073#1072#1090#1100#1082#1110 +
            #1074', '#1095#1080' '#1086#1089#1110#1073','#1089#1090#1086#1089#1086#1074#1085#1086' '#1103#1082#1080#1093' '#1074#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086' '#1086#1087#1110#1082#1091)
        ParentFont = False
      end
      object Memo31: TfrxMemoView
        Left = 18.897650000000000000
        Top = 139.842610000000000000
        Width = 502.677490000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo31OnBeforePrint'
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
          
            '[frxDBDataset."OUT_FIO_1"] [frxDBDataset."OUT_YEAR_R_1"] '#1088'.'#1085'.([f' +
            'rxDBDataset."OUT_NATIONAL_1"])')
        ParentFont = False
      end
      object Memo32: TfrxMemoView
        Top = 154.960730000000000000
        Width = 521.575140000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo32OnBeforePrint'
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
          '[frxDBDataset."OUT_FIO_2"] [frxDBDataset."OUT_YEAR_R_2"] '#1088'.'#1085'.')
        ParentFont = False
      end
      object Memo33: TfrxMemoView
        Top = 192.756030000000000000
        Width = 521.575140000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo33OnBeforePrint'
        DataField = 'OUT_CHILD_NAME'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_CHILD_NAME"]')
        ParentFont = False
      end
      object Memo34: TfrxMemoView
        Top = 211.653680000000000000
        Width = 521.575140000000000000
        Height = 15.118110240000000000
        DataField = 'OUT_TOWN_ADMIN'
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
          '[frxDBDataset."OUT_TOWN_ADMIN"]')
        ParentFont = False
      end
      object Memo35: TfrxMemoView
        Left = 268.346630000000000000
        Top = 37.795300000000000000
        Width = 253.228510000000000000
        Height = 26.456700240000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsUnderline]
        HAlign = haBlock
        Memo.Strings = (
          '[frxDBDataset."OUT_RVD_UKR"]')
        ParentFont = False
      end
      object Memo36: TfrxMemoView
        Align = baLeft
        Left = 113.385900000000000000
        Top = 241.889920000000000000
        Width = 94.488250000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        DataField = 'OUT_STREET'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_STREET"]')
        ParentFont = False
      end
      object Memo37: TfrxMemoView
        Align = baLeft
        Left = 207.874150000000000000
        Top = 241.889920000000000000
        Width = 34.015770000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          ','#1073#1091#1076'.')
        ParentFont = False
      end
      object Memo38: TfrxMemoView
        Left = 241.889920000000000000
        Top = 241.889920000000000000
        Width = 22.677180000000000000
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
          '[frxDBDataset."OUT_BUILDS_NUM"]')
        ParentFont = False
      end
      object Memo39: TfrxMemoView
        Align = baLeft
        Left = 264.567100000000000000
        Top = 241.889920000000000000
        Width = 34.015770000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          ','#1082#1086#1088#1087'.')
        ParentFont = False
      end
      object Memo40: TfrxMemoView
        Left = 298.582870000000000000
        Top = 241.889920000000000000
        Width = 136.063080000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          #1075#1091#1088#1090#1086#1078#1080#1090#1086#1082)
        ParentFont = False
      end
      object Memo41: TfrxMemoView
        Left = 113.385900000000000000
        Top = 257.008040000000000000
        Width = 22.677180000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          #1082#1074'.')
      end
      object Memo42: TfrxMemoView
        Left = 136.063080000000000000
        Top = 257.008040000000000000
        Width = 52.913420000000000000
        Height = 15.118110240000000000
        DataField = 'OUT_ROOMSTR'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_ROOMSTR"]')
        ParentFont = False
      end
      object Memo43: TfrxMemoView
        Left = 188.976500000000000000
        Top = 257.008040000000000000
        Width = 170.078850000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          ',('#1078#1080#1090#1083#1086#1074#1072' '#1087#1083#1086#1097#1072' '#1089#1090#1072#1085#1086#1074#1080#1090#1100)
        ParentFont = False
      end
      object Memo44: TfrxMemoView
        Left = 359.055350000000000000
        Top = 257.008040000000000000
        Width = 60.472480000000000000
        Height = 15.118110240000000000
        DataField = 'OUT_SIZE'
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
          '[frxDBDataset."OUT_SIZE"]')
        ParentFont = False
      end
      object Memo45: TfrxMemoView
        Left = 419.527830000000000000
        Top = 257.008040000000000000
        Width = 22.677180000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Memo.Strings = (
          #1082#1074'.'#1084',')
      end
      object Memo46: TfrxMemoView
        Left = 113.385900000000000000
        Top = 272.126160000000000000
        Width = 207.874150000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          #1085#1072' '#1085#1110#1081' '#1083#1080#1096#1072#1102#1090#1100#1089#1103' '#1079#1072#1088#1077#1108#1089#1090#1088#1086#1074#1072#1085#1080#1084#1080)
        ParentFont = False
      end
      object Memo47: TfrxMemoView
        Left = 325.039580000000000000
        Top = 272.126160000000000000
        Width = 79.370130000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo47OnBeforePrint'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        ParentFont = False
      end
      object Memo48: TfrxMemoView
        Left = 404.409710000000000000
        Top = 272.126160000000000000
        Width = 71.811070000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          #1086#1089#1110#1073')')
        ParentFont = False
      end
      object Memo49: TfrxMemoView
        Left = 64.252010000000000000
        Top = 287.244280000000000000
        Width = 457.323130000000000000
        Height = 15.118110240000000000
        DataField = 'OUT_PASP_NOM'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[frxDBDataset."OUT_PASP_NOM"]')
        ParentFont = False
      end
      object Memo51: TfrxMemoView
        Top = 427.086890000000000000
        Width = 226.771800000000000000
        Height = 15.118110240000000000
        Memo.Strings = (
          '"___" _______________ 20___ '#1088'.')
      end
      object Memo52: TfrxMemoView
        Left = 362.834880000000000000
        Top = 480.000310000000000000
        Width = 158.740260000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftTop]
        HAlign = haCenter
        Memo.Strings = (
          '('#1085#1072#1079#1074#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1091')')
        ParentFont = False
      end
      object Memo15: TfrxMemoView
        Top = 468.661720000000000000
        Width = 359.055350000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          
            #1072#1073#1086' '#1087#1110#1082#1083#1091#1074#1072#1085#1085#1103' '#1087#1086#1075#1086#1076#1078#1077#1085#1086' '#1079' '#1086#1088#1075#1072#1085#1072#1084#1080' '#1086#1087#1110#1082#1080' '#1110' '#1087#1110#1082#1083#1091#1074#1072#1085#1085#1103' '#1090#1072' '#1087#1110#1076#1090#1074#1077 +
            #1088#1076#1078#1091#1102#1090#1100#1089#1103)
        ParentFont = False
      end
      object Memo18: TfrxMemoView
        Top = 495.118430000000000000
        Width = 120.944960000000000000
        Height = 22.677180000000000000
        Memo.Strings = (
          #1055#1077#1095#1072#1090#1082#1072' '#1086#1088#1075#1072#1085#1091)
      end
      object Memo19: TfrxMemoView
        Left = 139.842610000000000000
        Top = 521.575140000000000000
        Width = 30.236240000000000000
        Height = 18.897650000000000000
        Memo.Strings = (
          #1052'.'#1055'.')
      end
      object Memo20: TfrxMemoView
        Left = 211.653680000000000000
        Top = 498.897960000000000000
        Width = 113.385900000000000000
        Height = 15.118110240000000000
        Memo.Strings = (
          #1087'/'#1087)
      end
      object Memo21: TfrxMemoView
        Left = 234.330860000000000000
        Top = 498.897960000000000000
        Width = 287.244280000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '        '#1053#1072#1095'. '#1087#1072#1089#1087#1086#1088#1090#1085#1086#1075#1086' '#1074#1110#1076#1076#1110#1083#1091)
        ParentFont = False
      end
      object Memo22: TfrxMemoView
        Left = 211.653680000000000000
        Top = 514.016080000000000000
        Width = 309.921460000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '             '#1044#1086#1085#1053#1059)
        ParentFont = False
      end
      object Memo23: TfrxMemoView
        Left = 211.653680000000000000
        Top = 529.134199999999900000
        Width = 309.921460000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '                          [NA4ALNIK]')
        ParentFont = False
      end
      object Memo24: TfrxMemoView
        Left = 211.653680000000000000
        Top = 544.252320000000100000
        Width = 309.921460000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        HAlign = haRight
        Memo.Strings = (
          '    ')
        ParentFont = False
      end
      object Memo25: TfrxMemoView
        Left = 211.653680000000000000
        Top = 559.370440000000000000
        Width = 309.921460000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo27: TfrxMemoView
        Top = 574.488560000000000000
        Width = 192.756030000000000000
        Height = 15.118110240000000000
        Memo.Strings = (
          '"___" _______________ 20__ '#1088'.')
      end
      object Memo28: TfrxMemoView
        Left = 211.653680000000000000
        Top = 574.488560000000000000
        Width = 309.921460000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = []
        HAlign = haCenter
        Memo.Strings = (
          '('#1087#1086#1089#1072#1076#1072', '#1087'.,'#1110'.,'#1087#1086'-'#1073'. '#1086#1089#1086#1073#1080', '#1103#1082#1072' '#1087#1088#1080#1081#1085#1103#1083#1072' '#1090#1072' '#1086#1073#1083#1110#1082#1091#1074#1072#1083#1072' '#1079#1072#1103#1074#1091')')
        ParentFont = False
      end
      object Memo29: TfrxMemoView
        Top = 589.606680000000000000
        Width = 521.575140000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo30: TfrxMemoView
        Top = 604.724800000000000000
        Width = 226.771800000000000000
        Height = 15.118120000000000000
        HAlign = haBlock
        Memo.Strings = (
          #1044#1072#1090#1072' '#1079#1085#1103#1090#1090#1103' '#1079' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1086#1075#1086' '#1086#1073#1083#1110#1082#1091)
      end
      object Memo50: TfrxMemoView
        Left = 226.771800000000000000
        Top = 604.724800000000000000
        Width = 113.385900000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo50OnBeforePrint'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '  [frxDBDataset."OUT_DATE_END_PROPI"] '#1088'.')
        ParentFont = False
      end
      object Memo55: TfrxMemoView
        Left = 211.653680000000000000
        Top = 627.401980000000000000
        Width = 113.385900000000000000
        Height = 15.118110240000000000
        Memo.Strings = (
          #1087'/'#1087)
      end
      object Memo57: TfrxMemoView
        Left = 211.653680000000000000
        Top = 642.520100000000000000
        Width = 309.921460000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo58: TfrxMemoView
        Left = 211.653680000000000000
        Top = 657.638220000000000000
        Width = 309.921460000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo62: TfrxMemoView
        Left = 211.653680000000000000
        Top = 672.756340000000000000
        Width = 309.921460000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = []
        HAlign = haCenter
        Memo.Strings = (
          '('#1087#1086#1089#1072#1076#1072', '#1087'.,'#1110'.,'#1087#1086'-'#1073'. '#1086#1089#1086#1073#1080', '#1103#1082#1072' '#1086#1092#1086#1088#1084#1080#1083#1072' '#1079#1085#1103#1090#1090#1103' '#1079' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1111')')
        ParentFont = False
      end
      object Memo64: TfrxMemoView
        Top = 687.874460000000000000
        Width = 113.385900000000000000
        Height = 15.118110240000000000
        Memo.Strings = (
          #1054#1089#1086#1073#1086#1074#1110' '#1074#1110#1076#1084#1110#1090#1082#1080':')
      end
      object Memo65: TfrxMemoView
        Left = 113.385900000000000000
        Top = 687.874460000000000000
        Width = 408.189240000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo66: TfrxMemoView
        Top = 702.992580000000000000
        Width = 521.575140000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo67: TfrxMemoView
        Top = 718.110700000000000000
        Width = 521.575140000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo53: TfrxMemoView
        Left = 332.598640000000000000
        Top = 434.645950000000000000
        Width = 200.315090000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftTop]
        HAlign = haCenter
        Memo.Strings = (
          #1087#1110#1076#1087#1080#1089' '#1079#1072#1103#1074#1085#1080#1082#1072)
        ParentFont = False
      end
      object Memo26: TfrxMemoView
        Top = 45.354360000000000000
        Width = 245.669450000000000000
        Height = 15.118110240000000000
        AutoWidth = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          #1047#1085#1103#1090#1090#1103' '#1079' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1086#1075#1086' '#1086#1073#1083#1110#1082#1091)
        ParentFont = False
      end
      object Memo54: TfrxMemoView
        Top = 381.732530000000000000
        Width = 521.575140000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftTop]
        HAlign = haCenter
        Memo.Strings = (
          #1082#1091#1076#1080' '#1074#1080#1073#1091#1074)
        ParentFont = False
      end
      object Memo59: TfrxMemoView
        Left = 26.456710000000000000
        Top = 370.393940000000000000
        Width = 98.267780000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo59OnBeforePrint'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[frxDBDataset."OUT_AFTE_OBL"]')
        ParentFont = False
      end
      object Memo56: TfrxMemoView
        Left = 238.110390000000000000
        Top = 627.401980000000000000
        Width = 283.464566930000000000
        Height = 13.228346460000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          '[frxDBDataset."OUT_MAIN_RVD_PEOPLE_UKR"]')
        ParentFont = False
      end
      object Memo60: TfrxMemoView
        Top = 370.393940000000000000
        Width = 30.236240000000000000
        Height = 15.118120000000000000
        Memo.Strings = (
          #1086#1073#1083'. ')
      end
      object Memo61: TfrxMemoView
        Left = 124.724490000000000000
        Top = 370.393940000000000000
        Width = 26.456710000000000000
        Height = 15.118120000000000000
        Memo.Strings = (
          ','#1084'. ')
      end
      object Memo63: TfrxMemoView
        Left = 245.669450000000000000
        Top = 370.393940000000000000
        Width = 26.456710000000000000
        Height = 15.118120000000000000
        Memo.Strings = (
          ','#1088'. ')
      end
      object Memo68: TfrxMemoView
        Left = 377.953000000000000000
        Top = 370.393940000000000000
        Width = 26.456710000000000000
        Height = 15.118120000000000000
        Memo.Strings = (
          ','#1089'. ')
      end
      object Memo69: TfrxMemoView
        Left = 26.456710000000000000
        Top = 393.071120000000000000
        Width = 34.015770000000000000
        Height = 15.118120000000000000
        Memo.Strings = (
          #1074#1091#1083'. ')
      end
      object Memo70: TfrxMemoView
        Left = 200.315090000000000000
        Top = 393.071120000000000000
        Width = 37.795300000000000000
        Height = 15.118120000000000000
        Memo.Strings = (
          ','#1073#1091#1076'. ')
      end
      object Memo71: TfrxMemoView
        Left = 343.937230000000000000
        Top = 393.071120000000000000
        Width = 30.236240000000000000
        Height = 15.118120000000000000
        Memo.Strings = (
          ','#1082#1074'. ')
      end
      object Memo72: TfrxMemoView
        Left = 147.401670000000000000
        Top = 370.393940000000000000
        Width = 98.267780000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo59OnBeforePrint'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[frxDBDataset."OUT_AFTE_TOWN"]')
        ParentFont = False
      end
      object Memo73: TfrxMemoView
        Left = 268.346630000000000000
        Top = 370.393940000000000000
        Width = 109.606370000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo59OnBeforePrint'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[frxDBDataset."OUT_AFTE_RAJ"]')
        ParentFont = False
      end
      object Memo74: TfrxMemoView
        Left = 400.630180000000000000
        Top = 370.393940000000000000
        Width = 113.385900000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo59OnBeforePrint'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[frxDBDataset."OUT_AFTE_SELO"]')
        ParentFont = False
      end
      object Memo75: TfrxMemoView
        Left = 56.692950000000000000
        Top = 393.071120000000000000
        Width = 124.724490000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo59OnBeforePrint'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[frxDBDataset."OUT_AFTE_D_STREET"]')
        ParentFont = False
      end
      object Memo76: TfrxMemoView
        Left = 234.330860000000000000
        Top = 393.071120000000000000
        Width = 83.149660000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo59OnBeforePrint'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[frxDBDataset."OUT_AFTE_D_HOUSE"]')
        ParentFont = False
      end
      object Memo77: TfrxMemoView
        Left = 370.393940000000000000
        Top = 393.071120000000000000
        Width = 71.811070000000000000
        Height = 15.118110240000000000
        OnBeforePrint = 'Memo59OnBeforePrint'
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[frxDBDataset."OUT_AFTE_D_KVART"]')
        ParentFont = False
      end
      object Memo78: TfrxMemoView
        Top = 404.409710000000000000
        Width = 521.575140000000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = []
        Frame.Typ = [ftTop]
        HAlign = haCenter
        Memo.Strings = (
          #1074#1080#1073#1091#1074' '#1091' '#1044#1086#1085#1077#1094#1100#1082)
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
    Left = 248
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
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 16
    Top = 24
  end
end
