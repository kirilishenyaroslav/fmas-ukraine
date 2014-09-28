object DModule: TDModule
  OldCreateOrder = False
  Left = 562
  Top = 413
  Height = 460
  Width = 670
  object DB: TpFIBDatabase
    DefaultTransaction = RTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object RTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 8
  end
  object StTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 184
    Top = 8
  end
  object DSource: TDataSource
    Left = 344
    Top = 128
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StTransaction
    Left = 248
    Top = 8
  end
  object DSetCalendar: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 248
    Top = 72
    poSQLINT64ToBCD = True
  end
  object DSourceException: TDataSource
    DataSet = DSetWork
    Left = 128
    Top = 200
  end
  object DSetCalendarById: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 248
    Top = 176
    poSQLINT64ToBCD = True
  end
  object DSourceWeekend: TDataSource
    DataSet = DSetWeekend
    Left = 120
    Top = 136
  end
  object DSetWork: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 248
    Top = 128
    poSQLINT64ToBCD = True
  end
  object DSetWeekend: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 24
    Top = 136
    poSQLINT64ToBCD = True
  end
  object DSetHoliday: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 40
    Top = 72
    poSQLINT64ToBCD = True
  end
  object DSourceHoliday: TDataSource
    DataSet = DSetHoliday
    Left = 112
    Top = 72
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1047#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
    ReportOptions.CreateDate = 39825.734949189800000000
    ReportOptions.LastChange = 40268.443611527800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure MasterData1OnAfterCalcHeight(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure MNumOnAfterData(Sender: TfrxComponent);'
      'var k:integer;'
      'begin'
      ''
      'end;'
      ''
      'procedure MemoMonthOnAfterData(Sender: TfrxComponent);'
      'var k:integer;'
      'begin'
      'k:=MemoMonth.value mod 2;'
      ' if k=0 then'
      ' begin'
      '    MemoMonth.color:=clMenuBar;'
      '    MemoSmena.color:=clMenuBar;'
      '    M1.color:=clMenuBar;'
      '    M2.color:=clMenuBar;'
      '    M3.color:=clMenuBar;'
      '    M4.color:=clMenuBar;'
      '    M5.color:=clMenuBar;'
      '    M6.color:=clMenuBar;'
      '    M7.color:=clMenuBar;'
      '    M8.color:=clMenuBar;'
      '    M9.color:=clMenuBar;'
      '    M10.color:=clMenuBar;'
      '    M11.color:=clMenuBar;'
      '    M12.color:=clMenuBar;'
      '    M13.color:=clMenuBar;'
      '    M14.color:=clMenuBar;'
      '    M15.color:=clMenuBar;'
      '    M16.color:=clMenuBar;'
      '    M17.color:=clMenuBar;'
      '    M18.color:=clMenuBar;'
      '    M19.color:=clMenuBar;'
      '    M20.color:=clMenuBar;'
      '    M21.color:=clMenuBar;'
      '    M22.color:=clMenuBar;'
      '    M23.color:=clMenuBar;'
      '    M24.color:=clMenuBar;'
      '    M25.color:=clMenuBar;'
      '    M26.color:=clMenuBar;'
      '    M27.color:=clMenuBar;'
      '    M28.color:=clMenuBar;'
      '    M29.color:=clMenuBar;'
      '    M30.color:=clMenuBar;'
      '    M31.color:=clMenuBar;'
      '    Mem1.color:=clMenuBar;'
      '    Mem2.color:=clMenuBar;'
      '    Mem3.color:=clMenuBar;'
      '    Mem4.color:=clMenuBar;'
      '    Mem5.color:=clMenuBar;'
      '    Mem6.color:=clMenuBar;'
      '    Mem7.color:=clMenuBar;'
      '    Mem8.color:=clMenuBar;'
      '    Mem9.color:=clMenuBar;'
      '    Mem10.color:=clMenuBar;'
      '    Mem11.color:=clMenuBar;'
      '    Mem12.color:=clMenuBar;'
      '    Mem13.color:=clMenuBar;'
      '    Mem14.color:=clMenuBar;'
      '    Mem15.color:=clMenuBar;'
      '    Mem16.color:=clMenuBar;'
      '    Mem17.color:=clMenuBar;'
      '    Mem18.color:=clMenuBar;'
      '    Mem19.color:=clMenuBar;'
      '    Mem20.color:=clMenuBar;'
      '    Mem21.color:=clMenuBar;'
      '    Mem22.color:=clMenuBar;'
      '    Mem23.color:=clMenuBar;'
      '    Mem24.color:=clMenuBar;'
      '    Mem25.color:=clMenuBar;'
      '    Mem26.color:=clMenuBar;'
      '    Mem27.color:=clMenuBar;'
      '    Mem28.color:=clMenuBar;'
      '    Mem29.color:=clMenuBar;'
      '    Mem30.color:=clMenuBar;'
      '    Mem31.color:=clMenuBar;'
      '    Mem32.color:=clMenuBar;'
      '    Mem33.color:=clMenuBar;'
      '    Mem35.color:=clMenuBar;'
      ' end'
      ' else'
      ' begin'
      '    MemoMonth.color:=clWindow;'
      '    MemoSmena.color:=clWindow;'
      '    M1.color:=clWindow;'
      '    M2.color:=clWindow;'
      '    M3.color:=clWindow;'
      '    M4.color:=clWindow;'
      '    M5.color:=clWindow;'
      '    M6.color:=clWindow;'
      '    M7.color:=clWindow;'
      '    M8.color:=clWindow;'
      '    M9.color:=clWindow;'
      '    M10.color:=clWindow;'
      '    M11.color:=clWindow;'
      '    M12.color:=clWindow;'
      '    M13.color:=clWindow;'
      '    M14.color:=clWindow;'
      '    M15.color:=clWindow;'
      '    M16.color:=clWindow;'
      '    M17.color:=clWindow;'
      '    M18.color:=clWindow;'
      '    M19.color:=clWindow;'
      '    M20.color:=clWindow;'
      '    M21.color:=clWindow;'
      '    M22.color:=clWindow;'
      '    M23.color:=clWindow;'
      '    M24.color:=clWindow;'
      '    M25.color:=clWindow;'
      '    M26.color:=clWindow;'
      '    M27.color:=clWindow;'
      '    M28.color:=clWindow;'
      '    M29.color:=clWindow;'
      '    M30.color:=clWindow;'
      '    M31.color:=clWindow;'
      '    Mem1.color:=clWindow;'
      '    Mem2.color:=clWindow;'
      '    Mem3.color:=clWindow;'
      '    Mem4.color:=clWindow;'
      '    Mem5.color:=clWindow;'
      '    Mem6.color:=clWindow;'
      '    Mem7.color:=clWindow;'
      '    Mem8.color:=clWindow;'
      '    Mem9.color:=clWindow;'
      '    Mem10.color:=clWindow;'
      '    Mem11.color:=clWindow;'
      '    Mem12.color:=clWindow;'
      '    Mem13.color:=clWindow;'
      '    Mem14.color:=clWindow;'
      '    Mem15.color:=clWindow;'
      '    Mem16.color:=clWindow;'
      '    Mem17.color:=clWindow;'
      '    Mem18.color:=clWindow;'
      '    Mem19.color:=clWindow;'
      '    Mem20.color:=clWindow;'
      '    Mem21.color:=clWindow;'
      '    Mem22.color:=clWindow;'
      '    Mem23.color:=clWindow;'
      '    Mem24.color:=clWindow;'
      '    Mem25.color:=clWindow;'
      '    Mem26.color:=clWindow;'
      '    Mem27.color:=clWindow;'
      '    Mem28.color:=clWindow;'
      '    Mem29.color:=clWindow;'
      '    Mem30.color:=clWindow;'
      '    Mem31.color:=clWindow;'
      '    Mem32.color:=clWindow;'
      '    Mem33.color:=clWindow;'
      '    Mem35.color:=clWindow;'
      ''
      ' end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 152
    Top = 304
    Datasets = <
      item
        DataSet = DBDataset
        DataSetName = 'DBDataset'
      end
      item
        DataSet = DM.DBDataset1
        DataSetName = 'DBDataset1'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 8.000000000000000000
      RightMargin = 8.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Color = clWindow
      object Memo12: TfrxMemoView
        Left = 627.401980000000000000
        Top = -3.779530000000000000
        Width = 438.425480000000000000
        Height = 34.015770000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          #1047#1040#1058#1042#1045#1056#1044#1046#1059#1070
          #1056#1077#1082#1090#1086#1088' ________[DBDataset1."DIRECTOR"]')
        ParentFont = False
      end
      object MasterData1: TfrxMasterData
        Height = 26.456710000000000000
        Top = 351.496290000000000000
        Width = 1062.047930000000000000
        DataSet = DBDataset
        DataSetName = 'DBDataset'
        RowCount = 0
        object M1: TfrxMemoView
          Left = 90.708720000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME1"]')
          ParentFont = False
        end
        object MemoMonth: TfrxMemoView
          Left = 30.236240000000000000
          Width = 41.574803150000000000
          Height = 26.456692910000000000
          OnAfterData = 'MemoMonthOnAfterData'
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."NUM_MONTH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object M2: TfrxMemoView
          Left = 117.165430000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME2"]')
          ParentFont = False
        end
        object M3: TfrxMemoView
          Left = 143.622140000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME3"]')
          ParentFont = False
        end
        object M4: TfrxMemoView
          Left = 170.078850000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME4"]')
          ParentFont = False
        end
        object M5: TfrxMemoView
          Left = 196.535560000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME5"]')
          ParentFont = False
        end
        object M6: TfrxMemoView
          Left = 222.992270000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME6"]')
          ParentFont = False
        end
        object M7: TfrxMemoView
          Left = 249.448980000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME7"]')
          ParentFont = False
        end
        object M8: TfrxMemoView
          Left = 275.905690000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME8"]')
          ParentFont = False
        end
        object M9: TfrxMemoView
          Left = 302.362400000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME9"]')
          ParentFont = False
        end
        object M10: TfrxMemoView
          Left = 328.819110000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME10"]')
          ParentFont = False
        end
        object M11: TfrxMemoView
          Left = 355.275820000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME11"]')
          ParentFont = False
        end
        object M12: TfrxMemoView
          Left = 381.732530000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME12"]')
          ParentFont = False
        end
        object M13: TfrxMemoView
          Left = 408.189240000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME13"]')
          ParentFont = False
        end
        object M14: TfrxMemoView
          Left = 434.645950000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME14"]')
          ParentFont = False
        end
        object M15: TfrxMemoView
          Left = 461.102660000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME15"]')
          ParentFont = False
        end
        object M16: TfrxMemoView
          Left = 487.559370000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME16"]')
          ParentFont = False
        end
        object M17: TfrxMemoView
          Left = 514.016080000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME17"]')
          ParentFont = False
        end
        object M18: TfrxMemoView
          Left = 540.472790000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME18"]')
          ParentFont = False
        end
        object M19: TfrxMemoView
          Left = 566.929500000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME19"]')
          ParentFont = False
        end
        object M20: TfrxMemoView
          Left = 593.386210000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME20"]')
          ParentFont = False
        end
        object M21: TfrxMemoView
          Left = 619.842920000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME21"]')
          ParentFont = False
        end
        object M22: TfrxMemoView
          Left = 646.299630000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME22"]')
          ParentFont = False
        end
        object M23: TfrxMemoView
          Left = 672.756340000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME23"]')
          ParentFont = False
        end
        object M24: TfrxMemoView
          Left = 699.213050000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME24"]')
          ParentFont = False
        end
        object M25: TfrxMemoView
          Left = 725.669760000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME25"]')
          ParentFont = False
        end
        object M26: TfrxMemoView
          Left = 752.126470000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME26"]')
          ParentFont = False
        end
        object M28: TfrxMemoView
          Left = 805.039890000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME28"]')
          ParentFont = False
        end
        object M29: TfrxMemoView
          Left = 831.496600000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME29"]')
          ParentFont = False
        end
        object M30: TfrxMemoView
          Left = 857.953310000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME30"]')
          ParentFont = False
        end
        object M31: TfrxMemoView
          Left = 884.410020000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME31"]')
          ParentFont = False
        end
        object M27: TfrxMemoView
          Left = 778.583180000000000000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."DAY_NAME27"]')
          ParentFont = False
        end
        object Mem1: TfrxMemoView
          Left = 90.708720000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS1"]')
          ParentFont = False
        end
        object Mem2: TfrxMemoView
          Left = 117.165430000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS2"]')
          ParentFont = False
        end
        object Mem3: TfrxMemoView
          Left = 143.622140000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS3"]')
          ParentFont = False
        end
        object Mem4: TfrxMemoView
          Left = 170.078850000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS4"]')
          ParentFont = False
        end
        object Mem5: TfrxMemoView
          Left = 196.535560000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS1"]')
          ParentFont = False
        end
        object Mem6: TfrxMemoView
          Left = 222.992270000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS6"]')
          ParentFont = False
        end
        object Mem7: TfrxMemoView
          Left = 249.448980000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS7"]')
          ParentFont = False
        end
        object Mem8: TfrxMemoView
          Left = 275.905690000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS8"]')
          ParentFont = False
        end
        object Mem9: TfrxMemoView
          Left = 302.362400000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS9"]')
          ParentFont = False
        end
        object Mem10: TfrxMemoView
          Left = 328.819110000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS10"]')
          ParentFont = False
        end
        object Mem11: TfrxMemoView
          Left = 355.275820000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS11"]')
          ParentFont = False
        end
        object Mem12: TfrxMemoView
          Left = 381.732530000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS12"]')
          ParentFont = False
        end
        object Mem13: TfrxMemoView
          Left = 408.189240000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS13"]')
          ParentFont = False
        end
        object Mem14: TfrxMemoView
          Left = 434.645950000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS14"]')
          ParentFont = False
        end
        object Mem15: TfrxMemoView
          Left = 461.102660000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS15"]')
          ParentFont = False
        end
        object Mem16: TfrxMemoView
          Left = 487.559370000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS16"]')
          ParentFont = False
        end
        object Mem17: TfrxMemoView
          Left = 514.016080000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS17"]')
          ParentFont = False
        end
        object Mem18: TfrxMemoView
          Left = 540.472790000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS18"]')
          ParentFont = False
        end
        object Mem19: TfrxMemoView
          Left = 566.929500000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS19"]')
          ParentFont = False
        end
        object Mem20: TfrxMemoView
          Left = 593.386210000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS20"]')
          ParentFont = False
        end
        object Mem21: TfrxMemoView
          Left = 619.842920000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS21"]')
          ParentFont = False
        end
        object Mem22: TfrxMemoView
          Left = 646.299630000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS22"]')
          ParentFont = False
        end
        object Mem23: TfrxMemoView
          Left = 672.756340000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS23"]')
          ParentFont = False
        end
        object Mem24: TfrxMemoView
          Left = 699.213050000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS24"]')
          ParentFont = False
        end
        object Mem25: TfrxMemoView
          Left = 725.669760000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS25"]')
          ParentFont = False
        end
        object Mem26: TfrxMemoView
          Left = 752.126470000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS26"]')
          ParentFont = False
        end
        object Mem28: TfrxMemoView
          Left = 805.039890000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS28"]')
          ParentFont = False
        end
        object Mem29: TfrxMemoView
          Left = 831.496600000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS29"]')
          ParentFont = False
        end
        object Mem30: TfrxMemoView
          Left = 857.953310000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS30"]')
          ParentFont = False
        end
        object Mem31: TfrxMemoView
          Left = 884.410020000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS31"]')
          ParentFont = False
        end
        object Mem27: TfrxMemoView
          Left = 778.583180000000000000
          Top = 13.228346460000010000
          Width = 26.456692910000000000
          Height = 13.228346460000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."HOURS27"]')
          ParentFont = False
        end
        object MemoSmena: TfrxMemoView
          Left = 71.811070000000000000
          Width = 18.897632910000000000
          Height = 26.456692910000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."NUM_SMENU"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Mem32: TfrxMemoView
          Left = 910.866730000000000000
          Width = 37.795282910000000000
          Height = 26.456685590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Mem33: TfrxMemoView
          Left = 948.662030000000000000
          Width = 37.795282910000000000
          Height = 26.456685590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Mem35: TfrxMemoView
          Left = 986.457330000000000000
          Width = 37.795282910000000000
          Height = 26.456685590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Line4: TfrxLineView
          Left = 30.236240000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line6: TfrxLineView
          Left = 1024.252630000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 185.196970000000000000
        Top = 18.897650000000000000
        Width = 1062.047930000000000000
        object Memo13: TfrxMemoView
          Left = 291.023810000000000000
          Top = 71.811070000000000000
          Width = 529.134200000000000000
          Height = 113.385900000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1043#1056#1040#1092#1030#1050' '#8470'3-0'
            '([NameWorkMode])'
            #1088#1086#1073#1086#1090#1080' '#1110' '#1074#1110#1076#1087#1086#1095#1080#1085#1082#1091' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074
            #1044#1086#1085#1077#1094#1100#1082#1086#1075#1086' '#1085#1072#1094#1110#1086#1085#1072#1083#1100#1085#1086#1075#1086' '#1091#1085#1110#1074#1077#1088#1089#1080#1090#1077#1090#1091
            #1087#1088#1080' '#1096#1077#1089#1090#1080#1076#1077#1085#1085#1086#1084#1091' '#1088#1086#1073#1086#1095#1086#1084#1091' '#1090#1080#1078#1085#1110' '
            #1085#1072' [Year]  '#1088#1110#1082)
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 64.251985590000000000
        Top = 264.567100000000000000
        Width = 1062.047930000000000000
        object Memo2: TfrxMemoView
          Left = 117.165430000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 143.622140000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 170.078850000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 196.535560000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 222.992270000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 249.448980000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '7')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 275.905690000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '8')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 302.362400000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '9')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 328.819110000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '10')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 355.275820000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '11')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 381.732530000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '12')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 408.189240000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '13')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 434.645950000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '14')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 461.102660000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '15')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 487.559370000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '16')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 514.016080000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '17')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 540.472790000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '18')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 566.929500000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '19')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 593.386210000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '20')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 619.842920000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '21')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 646.299630000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '22')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 672.756340000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '23')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 699.213050000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '24')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 725.669760000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '25')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 752.126470000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '26')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 778.583180000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '27')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 805.039890000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '28')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 831.496600000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '29')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 857.953310000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '30')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 884.410020000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '31')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 90.708720000000000000
          Top = 26.456709999999990000
          Width = 26.456692910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 910.866730000000000000
          Top = 26.456709999999990000
          Width = 37.795282910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1072#1083#1077#1085#1076#1072#1088#1085#1080#1093' '#1076#1085#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 948.662030000000000000
          Top = 26.456709999999990000
          Width = 37.795282910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1073#1086#1095#1080#1093' '#1076#1085#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 986.457330000000000000
          Top = 26.456709999999990000
          Width = 37.795282910000000000
          Height = 37.795275590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1073#1086#1095#1080#1093' '#1075#1086#1076#1080#1085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 90.708720000000000000
          Top = 7.559059999999988000
          Width = 820.158010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1063#1080#1089#1083#1072' '#1084#1110#1089#1103#1094#1103' '#1110' '#1090#1088#1080#1074#1072#1083#1110#1089#1090#1100' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1076#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 30.236240000000000000
          Top = 7.559059999999988000
          Width = 41.574812910000000000
          Height = 56.692925590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1110#1089#1103#1094#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 71.811070000000000000
          Top = 7.559059999999988000
          Width = 18.897632910000000000
          Height = 56.692925590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1084#1110#1085#1072)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 910.866730000000000000
          Top = 7.559059999999988000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = 30.236240000000000000
          Top = 7.559059999999988000
          Width = 994.015748030000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line2: TfrxLineView
          Left = 30.236240000000000000
          Top = 7.559055119999982000
          Height = 64.252010000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line3: TfrxLineView
          Left = 1024.252630000000000000
          Top = 7.559059999999988000
          Height = 56.692950000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
      end
      object Memo37: TfrxMemoView
        Left = -86.929190000000000000
        Top = -3.779530000000000000
        Width = 480.000310000000000000
        Height = 75.590600000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          #1055#1054#1043#1054#1044#1046#1045#1053#1054
          #1085#1072' '#1079#1072#1089#1110#1076#1072#1085#1085#1110'  '#1087#1088#1086#1092#1089#1087#1110#1083#1082#1086#1074#1086#1075#1086' '#1082#1086#1084#1110#1090#1077#1090#1091','
          #1087#1088#1086#1090#1086#1082#1086#1083' '#8470'__'#1074#1110#1076'__.__.__'#1088'.'
          #1043#1086#1083#1086#1074#1072' _______[DBDataset1."PROF_KOM"]')
        ParentFont = False
      end
      object Footer1: TfrxFooter
        Height = 143.622140000000000000
        Top = 400.630180000000000000
        Width = 1062.047930000000000000
        object Memo42: TfrxMemoView
          Left = -177.637910000000000000
          Top = 26.456709999999990000
          Width = 933.543910000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1059#1084#1086#1074#1085#1110' '#1087#1086#1079#1085#1072#1095#1082#1080':      '#1042'      -      '#1074#1080#1093#1110#1076#1085#1080#1081' '#1076#1077#1085#1100
            
              '                                                  '#1057'       -     ' +
              #1089#1074#1103#1090#1082#1086#1074#1080#1081' '#1076#1077#1085#1100' '#1072#1073#1086' '#1076#1077#1085#1100' '#1088#1077#1083#1110#1075#1110#1081#1085#1086#1075#1086' '#1089#1074#1103#1090#1072)
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 264.567100000000000000
          Top = 75.590599999999990000
          Width = 933.543910000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1047#1072#1089#1090#1091#1087#1085#1080#1082' '#1075#1086#1083#1086#1074#1085#1086#1075#1086' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072' '
            
              #1079' '#1087#1083#1072#1085#1086#1074#1086#1075#1086'-'#1092#1110#1085#1072#1085#1089#1086#1074#1086#1075#1086' '#1074#1110#1076#1076#1110#1083#1091'                        [DBDatase' +
              't1."ZAV_BUH"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 30.236240000000000000
          Width = 880.630490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.Strings = (
            #1030#1090#1086#1075#1086':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 910.866730000000000000
          Width = 37.795282910000000000
          Height = 18.897625590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 948.662030000000000000
          Width = 37.795282910000000000
          Height = 18.897625590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 986.457330000000000000
          Width = 37.795282910000000000
          Height = 18.897625590000000000
          DataSet = DBDataset
          DataSetName = 'DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Line5: TfrxLineView
          Left = 1024.252630000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line7: TfrxLineView
          Left = 907.087200000000000000
          Top = 18.897650000000000000
          Width = 117.165430000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line8: TfrxLineView
          Left = 907.087200000000000000
          Width = 117.165430000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
    end
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 240
    Top = 272
  end
  object DataSet: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 32
    Top = 272
    poSQLINT64ToBCD = True
  end
  object DBDataset: TfrxDBDataset
    UserName = 'DBDataset'
    CloseDataSource = False
    DataSet = DataSet
    Left = 80
    Top = 272
  end
  object DataSet1: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    SelectSQL.Strings = (
      'SELECT * FROM GR_DT_GRANT_PRINT(NULL)')
    Left = 16
    Top = 328
    poSQLINT64ToBCD = True
  end
  object DBDataset1: TfrxDBDataset
    UserName = 'DBDataset1'
    CloseDataSource = False
    DataSet = DataSet1
    Left = 80
    Top = 336
  end
end
