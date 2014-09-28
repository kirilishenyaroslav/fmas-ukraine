object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 170
  Height = 341
  Width = 426
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 128
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 200
    Top = 116
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
    EngineOptions.ConvertNulls = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 40084.795678344900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 200
    Datasets = <
      item
        DataSet = ReportDsetDat
        DataSetName = 'ReportDsetDat'
      end
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
      end>
    Variables = <
      item
        Name = ' User Category'
        Value = Null
      end
      item
        Name = 'PDateForm'
        Value = #39'01.09.2005'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 160.220472440000000000
        ParentFont = False
        Top = 294.803340000000000000
        Width = 1046.920361175000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        KeepChild = True
        RowCount = 0
        Stretched = True
        object Memo30: TfrxMemoView
          Width = 301.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HideZeros = True
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086', '#1086#1089#1110#1073)
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 301.420000000000000000
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '01')
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 366.120000000000000000
          Width = 93.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL"]')
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 459.540000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_CANDIDAT"]')
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 559.540000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_DOCTOR"]')
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 659.540000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_DOCENT"]')
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 759.540000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_PROFESSOR"]')
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 859.540000000000000000
          Width = 187.380000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_NOT_FULL_STAV"]')
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Top = 20.031496059999990000
          Width = 301.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            #1091' '#1090#1086#1084#1091' '#1095#1080#1089#1083#1110':')
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 301.420000000000000000
          Top = 20.031496059999990000
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 366.120000000000000000
          Top = 20.031496059999990000
          Width = 93.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 459.540000000000000000
          Top = 20.031496059999990000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 559.540000000000000000
          Top = 20.031496059999990000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 659.540000000000000000
          Top = 20.031496059999990000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 759.540000000000000000
          Top = 20.031496059999990000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 859.540000000000000000
          Top = 20.031496059999990000
          Width = 187.380000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Top = 40.062992130000000000
          Width = 301.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            #1085#1072#1091#1082#1086#1074#1086'-'#1087#1077#1076#1072#1075#1086#1075#1110#1095#1085#1110' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1080)
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 301.420000000000000000
          Top = 40.062992125984180000
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '02')
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 366.120000000000000000
          Top = 40.062992130000000000
          Width = 93.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_P"]')
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 459.540000000000000000
          Top = 40.062992130000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_CANDIDAT_P"]')
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 559.540000000000000000
          Top = 40.062992130000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_DOCTOR_P"]')
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 659.540000000000000000
          Top = 40.062992130000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_DOCENT_P"]')
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 759.540000000000000000
          Top = 40.062992130000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_PROFESSOR_P"]')
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 859.540000000000000000
          Top = 40.062992130000000000
          Width = 187.380000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_NOT_FULL_STAV_P"]')
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Top = 60.094488189999990000
          Width = 301.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            '     '#1079' '#1085#1080#1093' '#1096#1090#1072#1090#1085#1110)
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 301.420000000000000000
          Top = 60.094488188976410000
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '03')
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 366.120000000000000000
          Top = 60.094488189999990000
          Width = 93.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SHTAT_P"]')
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 459.540000000000000000
          Top = 60.094488189999990000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SHTAT_CANDIDAT_P"]')
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 559.540000000000000000
          Top = 60.094488189999990000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SHTAT_DOCTOR_P"]')
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 659.540000000000000000
          Top = 60.094488189999990000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SHTAT_DOCENT_P"]')
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 759.540000000000000000
          Top = 60.094488189999990000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SHTAT_PROFESSOR_P"]')
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 859.540000000000000000
          Top = 60.094488189999990000
          Width = 187.380000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SHTAT_NOT_FULL_STAV_P"]')
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Top = 80.125984251968470000
          Width = 301.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            '     '#1079' '#1085#1080#1093' '#1089#1091#1084#1110#1089#1085#1080#1082#1080)
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 301.420000000000000000
          Top = 80.125984251968470000
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '04')
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 366.120000000000000000
          Top = 80.125984249999990000
          Width = 93.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SOVM_P"]')
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 459.540000000000000000
          Top = 80.125984249999990000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SOVM_CANDIDAT_P"]')
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 559.540000000000000000
          Top = 80.125984249999990000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SOVM_DOCTOR_P"]')
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 659.540000000000000000
          Top = 80.125984249999990000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SOVM_DOCENT_P"]')
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 759.540000000000000000
          Top = 80.125984249999990000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SOVM_PROFESSOR_P"]')
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 859.540000000000000000
          Top = 80.125984249999990000
          Width = 187.380000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SOVM_NOT_FULL_STAV_P"]')
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Top = 100.157480310000000000
          Width = 301.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            #1087#1077#1076#1072#1075#1086#1075#1110#1095#1085#1110' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1080)
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 301.420000000000000000
          Top = 100.157480314961000000
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '05')
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 366.120000000000000000
          Top = 100.157480310000000000
          Width = 93.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_NP"]')
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 459.540000000000000000
          Top = 100.157480310000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_CANDIDAT_NP"]')
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 559.540000000000000000
          Top = 100.157480310000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_DOCTOR_NP"]')
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 659.540000000000000000
          Top = 100.157480310000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_DOCENT_NP"]')
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 759.540000000000000000
          Top = 100.157480310000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_PROFESSOR_NP"]')
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 859.540000000000000000
          Top = 100.157480310000000000
          Width = 187.380000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL_NOT_FULL_STAV_NP"]')
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Top = 120.188976380000000000
          Width = 301.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            '     '#1079' '#1085#1080#1093' '#1096#1090#1072#1090#1085#1110)
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 301.420000000000000000
          Top = 120.188976377953000000
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '06')
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 366.120000000000000000
          Top = 120.188976380000000000
          Width = 93.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SHTAT_NP"]')
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 459.540000000000000000
          Top = 120.188976380000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SHTAT_CANDIDAT_NP"]')
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 559.540000000000000000
          Top = 120.188976380000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SHTAT_DOCTOR_NP"]')
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 659.540000000000000000
          Top = 120.188976380000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SHTAT_DOCENT_NP"]')
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 759.540000000000000000
          Top = 120.188976380000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SHTAT_PROFESSOR_NP"]')
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 859.540000000000000000
          Top = 120.188976380000000000
          Width = 187.380000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SHTAT_NOT_FULL_STAV_NP"]')
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Top = 140.220472440945000000
          Width = 301.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            '     '#1079' '#1085#1080#1093' '#1089#1091#1084#1110#1089#1085#1080#1082#1080)
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 301.420000000000000000
          Top = 140.220472440945000000
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '07')
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 366.120000000000000000
          Top = 140.220472440000000000
          Width = 93.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SOVM_NP"]')
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 459.540000000000000000
          Top = 140.220472440000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SOVM_CANDIDAT_NP"]')
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 559.540000000000000000
          Top = 140.220472440000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SOVM_DOCTOR_NP"]')
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 659.540000000000000000
          Top = 140.220472440000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SOVM_DOCENT_NP"]')
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 759.540000000000000000
          Top = 140.220472440000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SOVM_PROFESSOR_NP"]')
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 859.540000000000000000
          Top = 140.220472440000000000
          Width = 187.380000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetData."CNT_SOVM_NOT_FULL_STAV_NP"]')
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 88.692950000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1046.920361175000000000
        object Memo43: TfrxMemoView
          Left = 904.000000000000000000
          Top = 20.000000000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [date]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Top = 45.795300000000000000
          Width = 1048.063700000000000000
          Height = 42.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            'VI. '#1055#1077#1076#1072#1075#1086#1075#1110#1095#1085#1110' '#1110' '#1085#1072#1091#1082#1086#1074#1086'-'#1087#1077#1076#1072#1075#1086#1075#1110#1095#1085#1110' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1080)
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 904.000000000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470'14')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Width = 548.031850000000000000
          Height = 18.897650000000000000
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetData."FIRM_NAME"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 18.897650000000000000
        ParentFont = False
        Top = 253.228510000000000000
        Width = 1046.920361175000000000
        Condition = 'ReportDsetData."NAME_DEPARTMENT"'
        ReprintOnNewPage = True
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 1046.920000000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 60.000000000000000000
        ParentFont = False
        Top = 170.078850000000000000
        Width = 1046.920361175000000000
        Stretched = True
        object Memo11: TfrxMemoView
          Width = 301.417440000000000000
          Height = 40.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 366.120000000000000000
          Width = 93.420000000000000000
          Height = 40.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 459.540000000000000000
          Width = 200.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047' '#1085#1080#1093' '#1084#1072#1102#1090#1100' '#1085#1072#1091#1082#1086#1074#1080#1081' '#1089#1090#1091#1087#1110#1085#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 301.420000000000000000
          Width = 64.700000000000000000
          Height = 40.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1088#1103#1076#1082#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 459.540000000000000000
          Top = 20.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1072#1085#1076#1080#1076#1072#1090#1072' '#1085#1072#1091#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 559.540000000000000000
          Top = 20.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086#1082#1090#1086#1088#1072' '#1085#1072#1091#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 859.540000000000000000
          Width = 187.160000000000000000
          Height = 40.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1079' '#1075#1088'. 1 - '#1087#1088#1072#1094#1102#1102#1090#1100' '#1084#1077#1085#1096#1077' '#1085#1110#1078' '#1085#1072' '#1087#1086#1074#1085#1091' '#1089#1090#1072#1074#1082#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 659.540000000000000000
          Width = 200.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1079' '#1075#1088#1072#1092#1080' 1 - '#1084#1072#1102#1090#1100' '#1091#1095#1077#1085#1077' '#1079#1074#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 659.540000000000000000
          Top = 20.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086#1094#1077#1085#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 759.540000000000000000
          Top = 20.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1088#1086#1092#1077#1089#1086#1088#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Top = 40.000000000000000000
          Width = 301.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1040)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 301.420000000000000000
          Top = 40.000000000000000000
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1041)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 366.120000000000000000
          Top = 40.000000000000000000
          Width = 93.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 459.540000000000000000
          Top = 40.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 559.540000000000000000
          Top = 40.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 659.540000000000000000
          Top = 40.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 759.540000000000000000
          Top = 40.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 859.540000000000000000
          Top = 40.000000000000000000
          Width = 187.380000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 20.000000000000000000
        Top = 744.567410000000000000
        Width = 1046.920361175000000000
        object Memo88: TfrxMemoView
          Left = 968.000000000000000000
          Width = 80.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1089#1090#1086#1088'. [Page#] '#1110#1079' [TotalPages#]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 207.874150000000000000
        Top = 476.220780000000000000
        Width = 1046.920361175000000000
        Stretched = True
        object Memo89: TfrxMemoView
          Top = 41.574830000000020000
          Width = 301.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HideZeros = True
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086', '#1086#1089#1110#1073)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 301.420000000000000000
          Top = 41.574830000000020000
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '01')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo91: TfrxMemoView
          Left = 366.120000000000000000
          Top = 41.574830000000020000
          Width = 93.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_ALL_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo92: TfrxMemoView
          Left = 459.540000000000000000
          Top = 41.574830000000020000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_CANDIDAT_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 559.540000000000000000
          Top = 41.574830000000020000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_DOCTOR"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 659.540000000000000000
          Top = 41.574830000000020000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_DOCENT_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 759.540000000000000000
          Top = 41.574830000000020000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_PROFESSOR_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Left = 859.540000000000000000
          Top = 41.574830000000020000
          Width = 187.380000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_NOT_FULL_STAV_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Top = 61.606326060000010000
          Width = 301.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            #1091' '#1090#1086#1084#1091' '#1095#1080#1089#1083#1110':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 301.420000000000000000
          Top = 61.606326060000010000
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Left = 366.120000000000000000
          Top = 61.606326060000010000
          Width = 93.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo100: TfrxMemoView
          Left = 459.540000000000000000
          Top = 61.606326060000010000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo101: TfrxMemoView
          Left = 559.540000000000000000
          Top = 61.606326060000010000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo102: TfrxMemoView
          Left = 659.540000000000000000
          Top = 61.606326060000010000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo103: TfrxMemoView
          Left = 759.540000000000000000
          Top = 61.606326060000010000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo104: TfrxMemoView
          Left = 859.540000000000000000
          Top = 61.606326060000010000
          Width = 187.380000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo105: TfrxMemoView
          Top = 81.637822130000010000
          Width = 301.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            #1085#1072#1091#1082#1086#1074#1086'-'#1087#1077#1076#1072#1075#1086#1075#1110#1095#1085#1110' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo106: TfrxMemoView
          Left = 301.420000000000000000
          Top = 81.637822130000010000
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '02')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo107: TfrxMemoView
          Left = 366.120000000000000000
          Top = 81.637822130000010000
          Width = 93.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_ALL_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo108: TfrxMemoView
          Left = 459.540000000000000000
          Top = 81.637822130000010000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_ALL_CANDIDAT_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo109: TfrxMemoView
          Left = 559.540000000000000000
          Top = 81.637822130000010000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_ALL_DOCTOR_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Left = 659.540000000000000000
          Top = 81.637822130000010000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_ALL_DOCENT_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Left = 759.540000000000000000
          Top = 81.637822130000010000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_ALL_PROFESSOR_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo112: TfrxMemoView
          Left = 859.540000000000000000
          Top = 81.637822130000010000
          Width = 187.380000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_NOT_FULL_STAV_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Top = 101.669318190000000000
          Width = 301.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HideZeros = True
          Memo.Strings = (
            '     '#1079' '#1085#1080#1093' '#1096#1090#1072#1090#1085#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          Left = 301.420000000000000000
          Top = 101.669318190000000000
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '03')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo115: TfrxMemoView
          Left = 366.120000000000000000
          Top = 101.669318190000000000
          Width = 93.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SHTAT_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Left = 459.540000000000000000
          Top = 101.669318190000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SHTAT_CANDIDAT_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 559.540000000000000000
          Top = 101.669318190000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SHTAT_DOCTOR_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 659.540000000000000000
          Top = 101.669318190000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SHTAT_DOCENT_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          Left = 759.540000000000000000
          Top = 101.669318190000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SHTAT_PROFESSOR_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo120: TfrxMemoView
          Left = 859.540000000000000000
          Top = 101.669318190000000000
          Width = 187.380000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SHTAT_NOT_FULL_STAV_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo121: TfrxMemoView
          Top = 121.700814250000000000
          Width = 301.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            '     '#1079' '#1085#1080#1093' '#1089#1091#1084#1110#1089#1085#1080#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo122: TfrxMemoView
          Left = 301.420000000000000000
          Top = 121.700814250000000000
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '04')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo123: TfrxMemoView
          Left = 366.120000000000000000
          Top = 121.700814250000000000
          Width = 93.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SOVM_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo124: TfrxMemoView
          Left = 459.540000000000000000
          Top = 121.700814250000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SOVM_CANDIDAT_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo125: TfrxMemoView
          Left = 559.540000000000000000
          Top = 121.700814250000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SOVM_DOCTOR_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo126: TfrxMemoView
          Left = 659.540000000000000000
          Top = 121.700814250000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SOVM_DOCENT_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo127: TfrxMemoView
          Left = 759.540000000000000000
          Top = 121.700814250000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SOVM_PROFESSOR_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo128: TfrxMemoView
          Left = 859.540000000000000000
          Top = 121.700814250000000000
          Width = 187.380000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SOVM_NOT_FULL_STAV_P_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo129: TfrxMemoView
          Top = 141.732310310000000000
          Width = 301.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HideZeros = True
          Memo.Strings = (
            #1087#1077#1076#1072#1075#1086#1075#1110#1095#1085#1110' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo130: TfrxMemoView
          Left = 301.420000000000000000
          Top = 141.732310310000000000
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '05')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo131: TfrxMemoView
          Left = 366.120000000000000000
          Top = 141.732310310000000000
          Width = 93.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_ALL_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo132: TfrxMemoView
          Left = 459.540000000000000000
          Top = 141.732310310000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_ALL_CANDIDAT_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo133: TfrxMemoView
          Left = 559.540000000000000000
          Top = 141.732310310000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_ALL_DOCTOR_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo134: TfrxMemoView
          Left = 659.540000000000000000
          Top = 141.732310310000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_ALL_DOCENT_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo135: TfrxMemoView
          Left = 759.540000000000000000
          Top = 141.732310310000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_ALL_PROFESSOR_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo136: TfrxMemoView
          Left = 859.540000000000000000
          Top = 141.732310310000000000
          Width = 187.380000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_ALL_NOT_FULL_STAV_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo137: TfrxMemoView
          Top = 161.763806380000000000
          Width = 301.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            '     '#1079' '#1085#1080#1093' '#1096#1090#1072#1090#1085#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo138: TfrxMemoView
          Left = 301.420000000000000000
          Top = 161.763806380000000000
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '06')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo139: TfrxMemoView
          Left = 366.120000000000000000
          Top = 161.763806380000000000
          Width = 93.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SHTAT_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo140: TfrxMemoView
          Left = 459.540000000000000000
          Top = 161.763806380000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SHTAT_CANDIDAT_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo141: TfrxMemoView
          Left = 559.540000000000000000
          Top = 161.763806380000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SHTAT_DOCTOR_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo142: TfrxMemoView
          Left = 659.540000000000000000
          Top = 161.763806380000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SHTAT_DOCENT_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo143: TfrxMemoView
          Left = 759.540000000000000000
          Top = 161.763806380000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SHTAT_PROFESSOR_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo144: TfrxMemoView
          Left = 859.540000000000000000
          Top = 161.763806380000000000
          Width = 187.380000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SHTAT_NOT_FULL_STAV_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo145: TfrxMemoView
          Top = 181.795302440000000000
          Width = 301.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            '     '#1079' '#1085#1080#1093' '#1089#1091#1084#1110#1089#1085#1080#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo146: TfrxMemoView
          Left = 301.420000000000000000
          Top = 181.795302440000000000
          Width = 64.700000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '07')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo147: TfrxMemoView
          Left = 366.120000000000000000
          Top = 181.795302440000000000
          Width = 93.420000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SOVM_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo148: TfrxMemoView
          Left = 459.540000000000000000
          Top = 181.795302440000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SOVM_CANDIDAT_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo149: TfrxMemoView
          Left = 559.540000000000000000
          Top = 181.795302440000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SOVM_DOCTOR_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo150: TfrxMemoView
          Left = 659.540000000000000000
          Top = 181.795302440000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SOVM_DOCENT_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo151: TfrxMemoView
          Left = 759.540000000000000000
          Top = 181.795302440000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SOVM_PROFESSOR_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo152: TfrxMemoView
          Left = 859.540000000000000000
          Top = 181.795302440000000000
          Width = 187.380000000000000000
          Height = 20.000000000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[ReportDsetDat."CNT_SOVM_NOT_FULL_STAV_NP_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo153: TfrxMemoView
          Top = 15.118119999999980000
          Width = 1046.929810000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1090#1086#1075' '#1087#1086' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1072#1084)
          ParentFont = False
          VAlign = vaCenter
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
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 128
    Top = 117
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSetData1: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 344
    Top = 72
    poSQLINT64ToBCD = True
  end
  object ReportDsetDat: TfrxDBDataset
    UserName = 'ReportDsetDat'
    CloseDataSource = False
    DataSet = DSetData1
    Left = 344
    Top = 128
  end
  object PDFExp: TfrxPDFExport
    UseFileCache = True
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 248
    Top = 192
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 320
    Top = 200
  end
end
