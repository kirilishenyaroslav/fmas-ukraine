object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 352
  Top = 308
  Height = 355
  Width = 520
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 272
    Top = 72
  end
  object DSet2: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSource1
    Left = 384
    Top = 72
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 273
    Top = 17
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 385
    Top = 17
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSource3: TDataSource
    DataSet = DSet3
    Left = 273
    Top = 129
  end
  object DSet3: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    DataSource = DSource1
    Left = 385
    Top = 129
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 64
    Top = 8
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 64
    Top = 64
  end
  object IndexChildHelpProc: TpFIBStoredProc
    Database = DB
    SQL.Strings = (
      'EXECUTE PROCEDURE Z_INDEX_DOP_NACH (?"PERCENT", ?KOD_SETUP)')
    Transaction = WriteTransaction
    StoredProcName = 'Z_INDEX_DOP_NACH'
    Left = 64
    Top = 144
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 8
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38830.431511273100000000
    ReportOptions.LastChange = 38832.806300625000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var pLine:integer=0;'
      '    pVo:integer=0;'
      ''
      'procedure GroupHeader1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  if pVo<><fDSet4."KOD_VIDOPL"> then'
      '     pLine:=0;'
      '  pVo:=<fDSet4."KOD_VIDOPL">;'
      'end;'
      ''
      'procedure Memo6OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  pLine:=pLine+1;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    Left = 136
    Top = 224
    Datasets = <
      item
        DataSet = fDSet4
        DataSetName = 'fDSet4'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
      end
      item
        Name = 'Data'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 56.692950000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1074#1110#1090
            #1087#1088#1086' '#1076#1086#1076#1072#1090#1082#1086#1074#1110' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1091' '#1087#1077#1088#1110#1086#1076
            '[PFILTER]')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        DataSet = fDSet4
        DataSetName = 'fDSet4'
        KeepChild = True
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo4: TfrxMemoView
          Left = 132.283550000000000000
          Width = 264.567100000000000000
          Height = 22.677180000000000000
          Memo.Strings = (
            '[fDSet4."FIO"]')
          VAlign = vaCenter
        end
        object Line5: TfrxLineView
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo6OnBeforePrint'
          HAlign = haCenter
          Memo.Strings = (
            '[pLine]')
        end
        object Line7: TfrxLineView
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line8: TfrxLineView
          Left = 45.354360000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          Top = 22.677179999999910000
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 124.724490000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo8: TfrxMemoView
          Left = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[fDSet4."TN"]')
        end
        object Line4: TfrxLineView
          Left = 400.630180000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo11: TfrxMemoView
          Left = 404.409710000000000000
          Width = 83.149660000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          HAlign = haCenter
          Memo.Strings = (
            '[fDSet4."SUMMA"]')
          VAlign = vaCenter
        end
        object Line13: TfrxLineView
          Left = 491.338900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line16: TfrxLineView
          Left = 604.724800000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo14: TfrxMemoView
          Left = 495.118430000000000000
          Width = 105.826840000000000000
          Height = 22.677180000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[fDSet4."DATE_BEG"]')
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 608.504330000000000000
          Width = 105.826840000000000000
          Height = 22.677180000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[fDSet4."DATE_END"]')
          VAlign = vaCenter
        end
        object Line18: TfrxLineView
          Left = 718.110700000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 60.472480000000000000
        Top = 139.842610000000000000
        Width = 718.110700000000000000
        OnAfterPrint = 'GroupHeader1OnAfterPrint'
        Condition = 'fDSet4."KOD_VIDOPL"'
        ReprintOnNewPage = True
        object Line9: TfrxLineView
          Top = 22.677179999999990000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          Left = 45.354360000000000000
          Top = 22.677179999999990000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo7: TfrxMemoView
          Top = 26.456709999999990000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1087'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line11: TfrxLineView
          Top = 60.472479999999990000
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
        end
        object Line12: TfrxLineView
          Top = 22.677179999999990000
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
        end
        object Line1: TfrxLineView
          Left = 124.724490000000000000
          Top = 22.677179999999990000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo5: TfrxMemoView
          Left = 45.354360000000000000
          Top = 22.677179999999990000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1058'. '#1085'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 124.724490000000000000
          Top = 22.677179999999990000
          Width = 275.905690000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1055'.'#1030'.'#1041'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Left = 400.630180000000000000
          Top = 22.677179999999990000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo10: TfrxMemoView
          Left = 404.409710000000000000
          Top = 22.677179999999990000
          Width = 83.149660000000000000
          Height = 37.795300000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line14: TfrxLineView
          Left = 491.338900000000000000
          Top = 22.677179999999990000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
        end
        object Line15: TfrxLineView
          Left = 604.724800000000000000
          Top = 22.677179999999990000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo12: TfrxMemoView
          Left = 491.338900000000000000
          Top = 22.677179999999990000
          Width = 113.385900000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1095#1072#1090#1086#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 604.724800000000000000
          Top = 22.677179999999990000
          Width = 113.385900000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line17: TfrxLineView
          Left = 718.110700000000000000
          Top = 22.677179999999990000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo18: TfrxMemoView
          Left = 41.574830000000000000
          Width = 676.535870000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1042#1080#1076' '#1086#1087#1077#1088#1072#1094#1110#1111':  [fDSet4."KOD_VIDOPL"] - [fDSet4."NAME_VIDOPL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 52.913420000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        object Memo16: TfrxMemoView
          Left = 400.630180000000000000
          Width = 90.708720000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<fDSet4."SUMMA">,0,0)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 26.456710000000000000
          Width = 158.740260000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line19: TfrxLineView
          Left = 400.630180000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line20: TfrxLineView
          Left = 491.338900000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line21: TfrxLineView
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line22: TfrxLineView
          Left = 718.110700000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft]
        end
        object Line23: TfrxLineView
          Top = 22.677180000000020000
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object DSet4: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    SelectSQL.Strings = (
      '')
    Left = 216
    Top = 224
    poSQLINT64ToBCD = True
  end
  object fDSet4: TfrxDBDataset
    UserName = 'fDSet4'
    CloseDataSource = False
    DataSet = DSet4
    Left = 176
    Top = 224
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 40
    Top = 296
  end
end
