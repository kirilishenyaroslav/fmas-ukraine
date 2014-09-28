object DM: TDM
  OldCreateOrder = False
  Left = 419
  Top = 183
  Height = 305
  Width = 429
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 128
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 200
    Top = 116
  end
  object ReportDSetGlobalData: TfrxDBDataset
    UserName = 'ReportDsetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobalData
    Left = 200
    Top = 180
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 56
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 128
    Top = 56
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1047#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
    ReportOptions.CreateDate = 38776.750022419000000000
    ReportOptions.LastChange = 39147.425551724540000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 200
    Datasets = <
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
      object GroupHeader1: TfrxGroupHeader
        Height = 916.000000000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Condition = 'ReportDsetData."FAMILIA"'
        KeepTogether = True
        object Memo2: TfrxMemoView
          Align = baCenter
          Left = 199.055350000000000000
          Width = 320.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1044#1045#1056#1046#1040#1042#1053#1040' '#1057#1058#1040#1058#1048#1057#1058#1048#1063#1053#1040' '#1047#1042#1030#1058#1053#1030#1057#1058#1068)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baWidth
          Left = 1.000000000000000000
          Top = 24.000000000000000000
          Width = 717.100000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1054#1044#1048)
          VAlign = vaBottom
        end
        object Memo4: TfrxMemoView
          Top = 56.000000000000000000
          Width = 56.000000000000000000
          Height = 124.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1092#1086#1088#1084#1080' '#1076#1086#1082#1091
            #1084#1077#1085#1090#1072' '#1079#1072' '#1044#1050#1059#1044)
        end
        object Memo5: TfrxMemoView
          Left = 56.000000000000000000
          Top = 56.000000000000000000
          Width = 76.000000000000000000
          Height = 124.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111', '#1103#1082#1072' '#1089#1082#1083#1072#1076#1072#1108' '#1110#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1082#1086#1076' '#1079#1072' '#1028#1044#1056#1055#1054#1059)
        end
        object Memo6: TfrxMemoView
          Left = 132.000000000000000000
          Top = 56.000000000000000000
          Width = 68.000000000000000000
          Height = 124.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1090#1077#1088#1110#1090#1086#1088#1110#1111' '#1079#1072' '#1050#1054#1040#1058#1059#1059)
        end
        object Memo7: TfrxMemoView
          Left = 252.000000000000000000
          Top = 56.000000000000000000
          Width = 44.000000000000000000
          Height = 124.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1074#1080#1076#1091' '#1077#1082#1086#1085#1086#1084#1110#1095#1085#1086#1111' '#1076#1110#1103#1083#1100
            #1085#1086#1089#1090#1110' '#1079#1072' '#1050#1042#1045#1044)
        end
        object Memo8: TfrxMemoView
          Left = 296.000000000000000000
          Top = 56.000000000000000000
          Width = 60.000000000000000000
          Height = 124.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1092#1086#1088#1084#1080' '#1074#1083#1072#1089
            #1085#1086#1089#1090#1110' '#1079#1072' '#1050#1060#1042)
        end
        object Memo9: TfrxMemoView
          Left = 356.000000000000000000
          Top = 56.000000000000000000
          Width = 94.100000000000000000
          Height = 124.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1081#1085#1086'-'
            #1087#1088#1072#1074#1086#1074#1086#1111' '#1092#1086#1088#1084#1080' '#1075#1086#1089#1087#1086#1076#1072#1088#1102#1074#1072#1085#1085#1103' '#1079#1072' '#1050#1054#1055#1060#1043)
        end
        object Memo10: TfrxMemoView
          Left = 200.000000000000000000
          Top = 56.000000000000000000
          Width = 52.000000000000000000
          Height = 124.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1075#1072#1083#1091#1079#1110' '#1079#1072' '#1047#1050#1043#1053#1043)
        end
        object Memo11: TfrxMemoView
          Top = 180.000000000000000000
          Width = 56.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          VAlign = vaBottom
        end
        object Memo12: TfrxMemoView
          Left = 56.000000000000000000
          Top = 180.000000000000000000
          Width = 76.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '2')
          VAlign = vaBottom
        end
        object Memo13: TfrxMemoView
          Left = 132.000000000000000000
          Top = 180.000000000000000000
          Width = 68.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3')
          VAlign = vaBottom
        end
        object Memo14: TfrxMemoView
          Left = 200.000000000000000000
          Top = 180.000000000000000000
          Width = 52.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '4')
          VAlign = vaBottom
        end
        object Memo15: TfrxMemoView
          Left = 252.000000000000000000
          Top = 180.000000000000000000
          Width = 44.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '5')
          VAlign = vaBottom
        end
        object Memo16: TfrxMemoView
          Left = 296.000000000000000000
          Top = 180.000000000000000000
          Width = 60.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '6')
          VAlign = vaBottom
        end
        object Memo17: TfrxMemoView
          Left = 356.000000000000000000
          Top = 180.000000000000000000
          Width = 94.100000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '7')
          VAlign = vaBottom
        end
        object Memo18: TfrxMemoView
          Left = 450.100000000000000000
          Top = 56.000000000000000000
          Width = 72.000000000000000000
          Height = 124.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1084#1110#1085#1110#1089#1090#1077#1088#1089#1090#1074#1072', '#1110#1085#1096#1086#1075#1086' '#1094#1077#1085#1090#1088#1072#1083#1100
            #1085#1086#1075#1086' '#1086#1088#1075#1072#1085#1091' '#1074#1080#1082#1086#1085#1072#1074#1095#1086#1111' '#1074#1083#1072#1076#1080' '#1079#1072' '#1057#1055#1054#1044#1059)
        end
        object Memo19: TfrxMemoView
          Left = 522.100000000000000000
          Top = 56.000000000000000000
          Width = 76.000000000000000000
          Height = 124.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1074#1080#1097#1086#1111' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111' - '#1110#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1082#1086#1076' '#1079#1072' '#1028#1044#1056#1055#1054#1059)
        end
        object Memo20: TfrxMemoView
          Left = 598.100000000000000000
          Top = 56.000000000000000000
          Width = 40.000000000000000000
          Height = 124.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1075#1088#1091#1087#1080' '#1087#1086#1089#1072#1076)
        end
        object Memo21: TfrxMemoView
          Left = 638.100000000000000000
          Top = 56.000000000000000000
          Width = 36.000000000000000000
          Height = 124.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1074#1080#1076#1091' '#1091#1089#1090#1072#1085#1086#1074#1080)
        end
        object Memo22: TfrxMemoView
          Left = 674.100000000000000000
          Top = 56.000000000000000000
          Width = 44.000000000000000000
          Height = 124.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1057)
        end
        object Memo23: TfrxMemoView
          Left = 450.100000000000000000
          Top = 180.000000000000000000
          Width = 72.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '8')
          VAlign = vaBottom
        end
        object Memo24: TfrxMemoView
          Left = 522.100000000000000000
          Top = 180.000000000000000000
          Width = 76.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '9')
          VAlign = vaBottom
        end
        object Memo25: TfrxMemoView
          Left = 638.100000000000000000
          Top = 180.000000000000000000
          Width = 36.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '11')
          VAlign = vaBottom
        end
        object Memo26: TfrxMemoView
          Left = 674.100000000000000000
          Top = 180.000000000000000000
          Width = 44.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '12')
          VAlign = vaBottom
        end
        object Memo27: TfrxMemoView
          Left = 598.100000000000000000
          Top = 180.000000000000000000
          Width = 40.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '10')
          VAlign = vaBottom
        end
        object Memo28: TfrxMemoView
          Top = 40.000000000000000000
          Width = 56.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 56.000000000000000000
          Top = 40.000000000000000000
          Width = 76.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 132.000000000000000000
          Top = 40.000000000000000000
          Width = 68.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 200.000000000000000000
          Top = 40.000000000000000000
          Width = 52.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 252.000000000000000000
          Top = 40.000000000000000000
          Width = 44.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 296.000000000000000000
          Top = 40.000000000000000000
          Width = 60.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 356.000000000000000000
          Top = 40.000000000000000000
          Width = 94.100000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 450.100000000000000000
          Top = 40.000000000000000000
          Width = 72.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 522.100000000000000000
          Top = 40.000000000000000000
          Width = 76.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 638.100000000000000000
          Top = 40.000000000000000000
          Width = 36.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 674.100000000000000000
          Top = 40.000000000000000000
          Width = 44.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 598.100000000000000000
          Top = 40.000000000000000000
          Width = 40.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 196.000000000000000000
          Width = 718.100000000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 1.500000000000000000
        end
        object Line2: TfrxLineView
          Top = 24.000000000000000000
          Width = 718.100000000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 1.500000000000000000
        end
        object Line3: TfrxLineView
          Left = 1.000000000000000000
          Top = 24.000000000000000000
          Height = 172.000000000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 1.500000000000000000
        end
        object Line4: TfrxLineView
          Left = 718.100000000000000000
          Top = 24.000000000000000000
          Height = 172.000000000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 1.500000000000000000
        end
        object Memo40: TfrxMemoView
          Left = 8.000000000000000000
          Top = 232.000000000000000000
          Width = 104.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1050#1086#1084#1091' '#1087#1086#1076#1072#1108#1090#1100#1089#1103)
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 8.000000000000000000
          Top = 268.000000000000000000
          Width = 328.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1052#1110#1085#1110#1089#1090#1077#1088#1089#1090#1074#1086', '#1110#1085#1096#1080#1081' '#1094#1077#1085#1090#1088#1072#1083#1100#1085#1080#1081' '#1086#1088#1075#1072#1085' '#1074#1080#1082#1086#1085#1072#1074#1095#1086#1111' '#1074#1083#1072#1076#1080)
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 8.000000000000000000
          Top = 292.000000000000000000
          Width = 216.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1050#1086#1085#1094#1077#1088#1085', '#1072#1089#1086#1094#1110#1072#1094#1110#1103' '#1090#1072' '#1110#1085#1096#1110' '#1086#1073#39#1108#1076#1085#1072#1085#1085#1103)
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 8.000000000000000000
          Top = 316.000000000000000000
          Width = 176.000000000000000000
          Height = 16.000000000000000000
          Memo.Strings = (
            #1054#1088#1075#1072#1085#1110#1079#1072#1094#1110#1103', '#1091#1089#1090#1072#1085#1086#1074#1072', '#1042#1053#1047)
        end
        object Memo44: TfrxMemoView
          Left = 8.000000000000000000
          Top = 340.000000000000000000
          Width = 216.000000000000000000
          Height = 16.000000000000000000
          Memo.Strings = (
            #1040#1076#1088#1077#1089#1072' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111', '#1091#1089#1090#1072#1085#1086#1074#1080', '#1042#1053#1047)
        end
        object Memo45: TfrxMemoView
          Left = 8.000000000000000000
          Top = 364.000000000000000000
          Width = 120.000000000000000000
          Height = 16.000000000000000000
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#1074#1083#1072#1089#1085#1086#1089#1090#1110)
        end
        object Memo46: TfrxMemoView
          Left = 8.000000000000000000
          Top = 388.000000000000000000
          Width = 296.000000000000000000
          Height = 16.000000000000000000
          Memo.Strings = (
            #1054#1088#1075#1072#1085#1110#1079#1072#1094#1110#1081#1085#1086'-'#1087#1088#1072#1074#1086#1074#1072' '#1092#1086#1088#1084#1072' '#1075#1086#1089#1087#1086#1076#1072#1088#1102#1074#1072#1085#1085#1103)
        end
        object Memo47: TfrxMemoView
          Left = 8.000000000000000000
          Top = 412.000000000000000000
          Width = 244.000000000000000000
          Height = 16.000000000000000000
          Memo.Strings = (
            #1042#1080#1076' '#1077#1082#1086#1085#1086#1084#1110#1095#1085#1086#1111' '#1076#1110#1103#1083#1100#1085#1086#1089#1090#1110' ('#1086#1089#1085#1086#1074#1085#1080#1081')')
        end
        object Memo48: TfrxMemoView
          Left = 616.000000000000000000
          Top = 224.000000000000000000
          Width = 100.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haRight
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470' '#1050#1053)
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 572.440940000000000000
          Top = 240.000000000000000000
          Width = 143.559060000000000000
          Height = 48.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1047#1072#1090#1074#1077#1088#1076#1078#1077#1085#1072' '#1085#1072#1082#1072#1079#1086#1084
            #1044#1077#1088#1078#1082#1086#1084#1089#1090#1072#1090#1091' '#1059#1082#1088#1072#1111#1085#1080
            #1074#1110#1076' 18.12.99 '#8470' 205')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 524.000000000000000000
          Top = 304.000000000000000000
          Width = 112.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1096#1090#1086#1074#1072' - '#1088#1110#1095#1085#1072)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 472.000000000000000000
          Top = 328.000000000000000000
          Width = 244.000000000000000000
          Height = 72.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1055#1086#1076#1072#1102#1090#1100' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111', '#1091#1089#1090#1072#1085#1086#1074#1080', '#1042#1053#1047' '#1085#1077
            #1087#1110#1079#1085#1110#1096#1077' '#1085#1110#1078' 5 '#1078#1086#1074#1090#1085#1103':'
            '1. '#1054#1088#1075#1072#1085#1091' '#1076#1077#1088#1078#1072#1074#1085#1086#1111' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080' '#1079#1072' '#1084#1110#1089#1094#1077#1084' '
            #1087#1077#1088#1077#1073#1091#1074#1072#1085#1085#1103'.'
            '2. '#1057#1074#1086#1111#1081' '#1074#1080#1097#1077#1087#1086#1089#1090#1072#1074#1083#1077#1085#1110#1081' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111'.')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 72.000000000000000000
          Top = 480.000000000000000000
          Width = 80.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
          Memo.Strings = (
            #8470' '#1082#1072#1088#1090#1082#1080)
        end
        object Memo53: TfrxMemoView
          Left = 152.000000000000000000
          Top = 480.000000000000000000
          Width = 80.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo54: TfrxMemoView
          Left = 72.000000000000000000
          Top = 524.000000000000000000
          Width = 80.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
        end
        object Memo55: TfrxMemoView
          Left = 152.000000000000000000
          Top = 524.000000000000000000
          Width = 80.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo56: TfrxMemoView
          Left = 312.000000000000000000
          Top = 480.000000000000000000
          Width = 36.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 1.500000000000000000
        end
        object Memo57: TfrxMemoView
          Left = 348.000000000000000000
          Top = 480.000000000000000000
          Width = 196.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."UCH_STEPEN_DOC"]')
        end
        object Memo58: TfrxMemoView
          Left = 312.000000000000000000
          Top = 496.000000000000000000
          Width = 232.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1057#1077#1088#1110#1103' '#1090#1072' '#1085#1086#1084#1077#1088' '#1076#1080#1087#1083#1086#1084#1072' '#1082#1072#1085#1076#1080#1076#1072#1090#1072' '#1085#1072#1091#1082)
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Align = baCenter
          Left = 161.055350000000000000
          Top = 836.000000000000000000
          Width = 396.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1040#1056#1058#1050#1040' '#1054#1041#1051#1030#1050#1059' '#1050#1040#1053#1044#1048#1044#1040#1058#1040' '#1053#1040#1059#1050)
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Align = baCenter
          Left = 253.055350000000000000
          Top = 864.000000000000000000
          Width = 212.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1085#1072' [ReportDsetData."D_REPORT_DATE"]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Align = baCenter
          Left = 225.055350000000000000
          Top = 888.000000000000000000
          Width = 268.000000000000000000
          Height = 16.000000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '('#1085#1072#1076#1089#1080#1083#1072#1108#1090#1100#1089#1103' '#1074' '#1085#1072#1076#1088#1091#1082#1086#1074#1072#1085#1086#1084#1091' '#1074#1080#1075#1083#1103#1076#1110')')
        end
        object Memo129: TfrxMemoView
          Left = 108.000000000000000000
          Top = 248.000000000000000000
          Width = 312.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1085#1072#1079#1074#1072' '#1090#1072' '#1072#1076#1088#1077#1089#1072' '#1086#1076#1077#1088#1078#1091#1074#1072#1095#1072')')
          ParentFont = False
        end
        object Memo130: TfrxMemoView
          Left = 112.000000000000000000
          Top = 232.000000000000000000
          Width = 308.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo131: TfrxMemoView
          Left = 336.000000000000000000
          Top = 268.000000000000000000
          Width = 84.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo132: TfrxMemoView
          Left = 224.000000000000000000
          Top = 292.000000000000000000
          Width = 196.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo133: TfrxMemoView
          Left = 184.000000000000000000
          Top = 316.000000000000000000
          Width = 236.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo134: TfrxMemoView
          Left = 224.000000000000000000
          Top = 340.000000000000000000
          Width = 196.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo135: TfrxMemoView
          Left = 128.000000000000000000
          Top = 364.000000000000000000
          Width = 292.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo136: TfrxMemoView
          Left = 304.000000000000000000
          Top = 388.000000000000000000
          Width = 116.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo137: TfrxMemoView
          Left = 252.000000000000000000
          Top = 412.000000000000000000
          Width = 168.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftBottom]
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 92.000000000000000000
        Top = 1644.095550000000000000
        Width = 718.110700000000000000
        object Memo121: TfrxMemoView
          Top = 8.000000000000000000
          Width = 72.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1055#1088#1080#1084#1110#1090#1082#1072':')
          ParentFont = False
        end
        object Memo122: TfrxMemoView
          Left = 72.000000000000000000
          Top = 8.000000000000000000
          Width = 272.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1082#1080' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111' '#1085#1077' '#1079#1072#1087#1086#1074#1085#1102#1102#1090#1100)
          ParentFont = False
        end
        object Memo123: TfrxMemoView
          Left = 8.000000000000000000
          Top = 32.000000000000000000
          Width = 208.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."D_REPORT_DATE"] ')
        end
        object Memo124: TfrxMemoView
          Left = 4.000000000000000000
          Top = 60.000000000000000000
          Width = 216.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo125: TfrxMemoView
          Left = 4.000000000000000000
          Top = 72.000000000000000000
          Width = 216.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1088#1110#1079#1074#1080#1097#1077' '#1090#1072' '#8470' '#1090#1077#1083#1077#1092#1086#1085#1091' '#1074#1080#1082#1086#1085#1072#1074#1094#1103')')
          ParentFont = False
        end
        object Memo126: TfrxMemoView
          Left = 344.000000000000000000
          Top = 44.000000000000000000
          Width = 104.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1050#1077#1088#1110#1074#1085#1080#1082)
          ParentFont = False
        end
        object Memo127: TfrxMemoView
          Left = 448.000000000000000000
          Top = 44.000000000000000000
          Width = 248.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo128: TfrxMemoView
          Left = 448.000000000000000000
          Top = 60.000000000000000000
          Width = 248.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1088#1110#1079#1074#1080#1097#1077', '#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 664.000000000000000000
        Top = 956.221090000000000000
        Width = 718.110700000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        StartNewPage = True
        object Memo1: TfrxMemoView
          Width = 80.000000000000000000
          Height = 48.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1088#1103#1076#1082#1072)
        end
        object Memo62: TfrxMemoView
          Left = 80.000000000000000000
          Width = 492.000000000000000000
          Height = 48.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo63: TfrxMemoView
          Left = 572.000000000000000000
          Width = 146.010000000000000000
          Height = 48.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1076#1080' ('#1079#1072#1087#1086#1074#1085#1102#1102#1090#1100' '#1091' '#1076#1077#1088#1078#1072#1074#1085#1080#1093' '#1086#1088#1075#1072#1085#1072#1093' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080')')
        end
        object Memo64: TfrxMemoView
          Top = 48.000000000000000000
          Width = 80.000000000000000000
          Height = 48.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 80.000000000000000000
          Top = 48.000000000000000000
          Width = 168.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1055#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103' '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo66: TfrxMemoView
          Left = 572.000000000000000000
          Top = 48.000000000000000000
          Width = 146.010000000000000000
          Height = 48.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo67: TfrxMemoView
          Top = 96.000000000000000000
          Width = 80.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '2')
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 80.000000000000000000
          Top = 72.000000000000000000
          Width = 492.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."IMYA_OTCHESTVO"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo69: TfrxMemoView
          Left = 572.000000000000000000
          Top = 96.000000000000000000
          Width = 146.010000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo70: TfrxMemoView
          Left = 80.000000000000000000
          Top = 96.000000000000000000
          Width = 52.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1057#1090#1072#1090#1100)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo71: TfrxMemoView
          Top = 120.000000000000000000
          Width = 80.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3')
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 572.000000000000000000
          Top = 120.000000000000000000
          Width = 146.010000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo73: TfrxMemoView
          Left = 80.000000000000000000
          Top = 120.000000000000000000
          Width = 168.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103':    '#1095#1080#1089#1083#1086)
          VAlign = vaBottom
        end
        object Memo74: TfrxMemoView
          Top = 144.000000000000000000
          Width = 80.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '4')
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 572.000000000000000000
          Top = 144.000000000000000000
          Width = 146.010000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo76: TfrxMemoView
          Left = 80.000000000000000000
          Top = 144.000000000000000000
          Width = 144.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1056#1110#1082' '#1074#1080#1076#1072#1085#1085#1103' '#1076#1080#1087#1083#1086#1084#1091)
          VAlign = vaBottom
        end
        object Memo77: TfrxMemoView
          Top = 168.000000000000000000
          Width = 80.000000000000000000
          Height = 48.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '5')
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 572.000000000000000000
          Top = 168.000000000000000000
          Width = 146.010000000000000000
          Height = 48.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo79: TfrxMemoView
          Left = 80.000000000000000000
          Top = 168.000000000000000000
          Width = 492.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1043#1072#1083#1091#1079#1100' '#1085#1072#1091#1082#1080', '#1079' '#1103#1082#1086#1111' '#1087#1088#1080#1074#1086#1108#1085#1086' '#1089#1090#1091#1087#1110#1085#1100' '#1082#1072#1085#1076#1080#1076#1072#1090#1072' '#1085#1072#1091#1082)
          VAlign = vaBottom
        end
        object Memo80: TfrxMemoView
          Top = 216.000000000000000000
          Width = 80.000000000000000000
          Height = 52.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '6')
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 572.000000000000000000
          Top = 216.000000000000000000
          Width = 146.010000000000000000
          Height = 52.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo82: TfrxMemoView
          Left = 80.000000000000000000
          Top = 192.000000000000000000
          Width = 492.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."UCH_STEPEN"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo83: TfrxMemoView
          Left = 80.000000000000000000
          Top = 216.000000000000000000
          Width = 492.000000000000000000
          Height = 28.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            
              #1057#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100', '#1079' '#1103#1082#1086#1111' '#1087#1110#1076#1075#1086#1090#1086#1074#1072#1085#1072' '#1076#1080#1089#1077#1088#1090#1072#1094#1110#1103' '#1085#1072' '#1086#1076#1077#1088#1078#1072#1085#1085#1103' '#1085#1072#1091#1082#1086#1074 +
              #1086#1075#1086' '#1089#1090#1077#1087#1077#1085#1103' '#1082#1072#1085#1076#1080#1076#1072#1090#1072' '#1085#1072#1091#1082)
          VAlign = vaBottom
        end
        object Memo84: TfrxMemoView
          Left = 80.000000000000000000
          Top = 244.000000000000000000
          Width = 492.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."DISCIPLINE"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo85: TfrxMemoView
          Top = 268.000000000000000000
          Width = 80.000000000000000000
          Height = 84.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '7')
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 572.000000000000000000
          Top = 268.000000000000000000
          Width = 146.010000000000000000
          Height = 84.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo87: TfrxMemoView
          Left = 80.000000000000000000
          Top = 268.000000000000000000
          Width = 492.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1058#1077#1084#1072' '#1082#1072#1085#1076#1080#1076#1072#1090#1089#1100#1082#1086#1111' '#1076#1080#1089#1077#1088#1090#1072#1094#1110#1111)
          VAlign = vaBottom
        end
        object Memo88: TfrxMemoView
          Left = 80.000000000000000000
          Top = 284.000000000000000000
          Width = 492.000000000000000000
          Height = 44.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          VAlign = vaBottom
        end
        object Memo89: TfrxMemoView
          Left = 80.000000000000000000
          Top = 328.000000000000000000
          Width = 492.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          VAlign = vaBottom
        end
        object Memo90: TfrxMemoView
          Top = 352.000000000000000000
          Width = 80.000000000000000000
          Height = 64.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '8')
          VAlign = vaCenter
        end
        object Memo91: TfrxMemoView
          Left = 572.000000000000000000
          Top = 352.000000000000000000
          Width = 146.010000000000000000
          Height = 64.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo92: TfrxMemoView
          Left = 80.000000000000000000
          Top = 352.000000000000000000
          Width = 492.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1054#1073#1088#1072#1085#1086' '#1072#1082#1072#1076#1077#1084#1110#1082#1086#1084', '#1095#1083#1077#1085#1086#1084'-'#1082#1086#1088#1077#1089#1087#1086#1085#1076#1077#1085#1090#1086#1084' ('#1087#1086#1090#1088#1110#1073#1085#1077' '#1087#1110#1076#1082#1088#1077#1089#1083#1080#1090#1080')')
          VAlign = vaBottom
        end
        object Memo93: TfrxMemoView
          Left = 80.000000000000000000
          Top = 376.000000000000000000
          Width = 104.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1040#1082#1072#1076#1077#1084#1110#1111' '#1085#1072#1091#1082)
          VAlign = vaBottom
        end
        object Memo94: TfrxMemoView
          Left = 184.000000000000000000
          Top = 400.000000000000000000
          Width = 388.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '('#1085#1072#1079#1074#1072' '#1040#1082#1072#1076#1077#1084#1110#1111')')
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          Top = 416.000000000000000000
          Width = 80.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '9')
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Left = 572.000000000000000000
          Top = 416.000000000000000000
          Width = 146.010000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo97: TfrxMemoView
          Left = 80.000000000000000000
          Top = 416.000000000000000000
          Width = 104.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1056#1110#1082' '#1086#1073#1088#1072#1085#1085#1103)
          VAlign = vaBottom
        end
        object Memo98: TfrxMemoView
          Top = 440.000000000000000000
          Width = 80.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '10')
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Left = 572.000000000000000000
          Top = 440.000000000000000000
          Width = 146.010000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo100: TfrxMemoView
          Left = 80.000000000000000000
          Top = 440.000000000000000000
          Width = 92.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1095#1077#1085#1077' '#1079#1074#1072#1085#1085#1103':')
          VAlign = vaBottom
        end
        object Memo101: TfrxMemoView
          Top = 464.000000000000000000
          Width = 80.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '11')
          VAlign = vaCenter
        end
        object Memo102: TfrxMemoView
          Left = 572.000000000000000000
          Top = 440.000000000000000000
          Width = 146.010000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo103: TfrxMemoView
          Left = 80.000000000000000000
          Top = 464.000000000000000000
          Width = 276.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1056#1110#1082' '#1087#1088#1080#1089#1074#1086#1108#1085#1085#1103' '#1086#1089#1090#1072#1085#1085#1100#1086#1075#1086' '#1074#1095#1077#1085#1086#1075#1086' '#1079#1074#1072#1085#1085#1103)
          VAlign = vaBottom
        end
        object Memo104: TfrxMemoView
          Top = 488.000000000000000000
          Width = 80.000000000000000000
          Height = 48.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '12')
          VAlign = vaCenter
        end
        object Memo105: TfrxMemoView
          Left = 572.000000000000000000
          Top = 488.000000000000000000
          Width = 146.010000000000000000
          Height = 48.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo106: TfrxMemoView
          Left = 80.000000000000000000
          Top = 488.000000000000000000
          Width = 492.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072', '#1103#1082#1091' '#1086#1073#1110#1081#1084#1072#1108#1090#1077)
          VAlign = vaBottom
        end
        object Memo107: TfrxMemoView
          Top = 536.000000000000000000
          Width = 80.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '13')
          VAlign = vaCenter
        end
        object Memo108: TfrxMemoView
          Left = 572.000000000000000000
          Top = 536.000000000000000000
          Width = 146.010000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo109: TfrxMemoView
          Left = 80.000000000000000000
          Top = 536.000000000000000000
          Width = 372.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            #1047#1072#1075#1072#1083#1100#1075#1080#1081' '#1089#1090#1072#1078' '#1085#1072#1091#1082#1086#1074#1086#1111' '#1090#1072' '#1085#1072#1091#1082#1086#1074#1086'-'#1087#1077#1076#1072#1075#1086#1075#1110#1095#1085#1086#1111' '#1076#1110#1103#1083#1100#1085#1086#1089#1090#1110)
          VAlign = vaBottom
        end
        object Memo110: TfrxMemoView
          Top = 560.000000000000000000
          Width = 80.000000000000000000
          Height = 48.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '14')
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Left = 572.000000000000000000
          Top = 560.000000000000000000
          Width = 146.010000000000000000
          Height = 48.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo112: TfrxMemoView
          Left = 80.000000000000000000
          Top = 560.000000000000000000
          Width = 492.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1057#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100' '#1079#1072' '#1086#1089#1085#1086#1074#1085#1080#1084' '#1085#1072#1087#1088#1103#1084#1082#1086#1084' '#1085#1072#1091#1082#1086#1074#1086#1111' '#1076#1110#1103#1083#1100#1085#1086#1089#1090#1110)
          VAlign = vaBottom
        end
        object Memo113: TfrxMemoView
          Left = 80.000000000000000000
          Top = 584.000000000000000000
          Width = 492.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          VAlign = vaBottom
        end
        object Memo114: TfrxMemoView
          Top = 608.000000000000000000
          Width = 80.000000000000000000
          Height = 56.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '15')
          VAlign = vaCenter
        end
        object Memo115: TfrxMemoView
          Left = 572.000000000000000000
          Top = 608.000000000000000000
          Width = 146.010000000000000000
          Height = 56.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo116: TfrxMemoView
          Left = 80.000000000000000000
          Top = 608.000000000000000000
          Width = 492.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1055#1077#1088#1077#1083#1110#1082' '#1084#1086#1074', '#1103#1082#1080#1084#1080' '#1074#1086#1083#1086#1076#1110#1108#1090#1077', '#1088#1110#1074#1077#1085#1100' '#1074#1086#1083#1086#1076#1110#1085#1085#1103)
          VAlign = vaBottom
        end
        object Memo117: TfrxMemoView
          Left = 80.000000000000000000
          Top = 632.000000000000000000
          Width = 164.000000000000000000
          Height = 32.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1095#1080#1090#1072#1108#1090#1077' '#1090#1072' '#1087#1077#1088#1077#1082#1083#1072#1076#1072#1108#1090#1077' '#1079#1110' '#1089#1083#1086#1074#1085#1080#1082#1086#1084)
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 244.000000000000000000
          Top = 632.000000000000000000
          Width = 164.000000000000000000
          Height = 32.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1095#1080#1090#1072#1108#1090#1077' '#1090#1072' '#1088#1086#1079#1084#1086#1074#1083#1103#1108#1090#1077)
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          Left = 408.000000000000000000
          Top = 632.000000000000000000
          Width = 164.000000000000000000
          Height = 32.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1074#1086#1083#1086#1076#1110#1108#1090#1077' '#1074#1110#1083#1100#1085#1086)
          VAlign = vaCenter
        end
        object Line5: TfrxLineView
          Left = 644.000000000000000000
          Top = 628.000000000000000000
          Width = 8.000000000000000000
          Height = 16.000000000000000000
          Frame.Width = 1.500000000000000000
          Diagonal = True
        end
        object Line6: TfrxLineView
          Left = 653.055350000000000000
          Top = 628.000000000000000000
          Width = -12.000000000000000000
          Height = 16.000000000000000000
          Frame.Width = 1.500000000000000000
          Diagonal = True
        end
        object Memo120: TfrxMemoView
          Left = 248.000000000000000000
          Top = 120.000000000000000000
          Width = 44.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."BIRTH_DATE_DAY"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo138: TfrxMemoView
          Left = 292.000000000000000000
          Top = 120.000000000000000000
          Width = 52.000000000000000000
          Height = 24.000000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1084#1110#1089#1103#1094#1100)
          VAlign = vaBottom
        end
        object Memo139: TfrxMemoView
          Left = 344.000000000000000000
          Top = 120.000000000000000000
          Width = 48.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."BIRTH_DATE_MONTH"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo140: TfrxMemoView
          Left = 392.000000000000000000
          Top = 120.000000000000000000
          Width = 24.000000000000000000
          Height = 24.000000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #1088#1110#1082)
          VAlign = vaBottom
        end
        object Memo141: TfrxMemoView
          Left = 416.000000000000000000
          Top = 120.000000000000000000
          Width = 80.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."BIRTH_DATE_YEAR"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo142: TfrxMemoView
          Left = 224.000000000000000000
          Top = 144.000000000000000000
          Width = 348.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."UCH_STEPEN_DATE"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo143: TfrxMemoView
          Left = 184.000000000000000000
          Top = 376.000000000000000000
          Width = 388.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."AKAD"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo144: TfrxMemoView
          Left = 184.000000000000000000
          Top = 416.000000000000000000
          Width = 220.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."AKAD_DATE"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo145: TfrxMemoView
          Left = 172.000000000000000000
          Top = 440.000000000000000000
          Width = 400.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.Strings = (
            '[ReportDsetData."UCH_ZVANIE"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo146: TfrxMemoView
          Left = 356.000000000000000000
          Top = 464.000000000000000000
          Width = 52.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."UCH_ZVANIE_DATE"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo147: TfrxMemoView
          Left = 408.000000000000000000
          Top = 464.000000000000000000
          Width = 164.000000000000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1088'.')
          VAlign = vaBottom
        end
        object Memo148: TfrxMemoView
          Left = 80.000000000000000000
          Top = 512.000000000000000000
          Width = 492.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."POST"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo149: TfrxMemoView
          Left = 452.000000000000000000
          Top = 536.000000000000000000
          Width = 120.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."STAJ"] '#1088#1086#1082#1110#1074)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo150: TfrxMemoView
          Left = 248.000000000000000000
          Top = 48.000000000000000000
          Width = 324.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '        [ReportDsetData."FAMILIA"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo151: TfrxMemoView
          Left = 132.000000000000000000
          Top = 96.000000000000000000
          Width = 440.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."SEX"]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
    end
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 200
    Top = 59
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 272
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 272
    Top = 56
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 272
    Top = 112
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 117
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 179
    poSQLINT64ToBCD = True
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 128
    Top = 117
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object PDFExport: TfrxPDFExport
    UseFileCache = True
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 280
    Top = 168
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 344
    Top = 8
  end
end
