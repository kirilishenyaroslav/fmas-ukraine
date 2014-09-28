object DataMod: TDataMod
  OldCreateOrder = False
  Left = 291
  Top = 138
  Height = 360
  Width = 342
  object pFIBD_Reestr: TpFIBDatabase
    DBParams.Strings = (
      'password=masterkey'
      'user_name=sysdba')
    DefaultTransaction = pFIBT_Read
    DefaultUpdateTransaction = pFIBT_Write
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    SaveDBParams = False
    WaitForRestoreConnect = 0
    Left = 24
    Top = 8
  end
  object pFIBT_Read: TpFIBTransaction
    DefaultDatabase = pFIBD_Reestr
    TimeoutAction = TARollback
    Left = 104
    Top = 8
  end
  object pFIBT_Write: TpFIBTransaction
    DefaultDatabase = pFIBD_Reestr
    TimeoutAction = TARollback
    Left = 104
    Top = 56
  end
  object pFIB_MainDS: TpFIBDataSet
    Database = pFIBD_Reestr
    Transaction = pFIBT_Read
    UpdateTransaction = pFIBT_Write
    SelectSQL.Strings = (
      'select HOLIDAY_FACT_EDIT_AVAIBLE from UP_SYS_INI_CONSTS;')
    Left = 48
    Top = 112
    poSQLINT64ToBCD = True
  end
  object pFIBDSHesh: TpFIBDataSet
    Database = pFIBD_Reestr
    Transaction = pFIBT_Read
    UpdateTransaction = pFIBT_Write
    SelectSQL.Strings = (
      'select HOLIDAY_FACT_EDIT_AVAIBLE from UP_SYS_INI_CONSTS;')
    Left = 56
    Top = 176
    poSQLINT64ToBCD = True
  end
  object StoredProc: TpFIBStoredProc
    Database = pFIBD_Reestr
    Transaction = pFIBT_Write
    Left = 48
    Top = 232
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40222.725441666670000000
    ReportOptions.LastChange = 40222.725441666670000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 160
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = ReportDataSet
    Left = 160
    Top = 56
  end
  object ReportDataSet: TpFIBDataSet
    Database = pFIBD_Reestr
    Transaction = pFIBT_Read
    UpdateTransaction = pFIBT_Write
    Left = 160
    Top = 112
    poSQLINT64ToBCD = True
  end
  object ReportDoc: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.ConvertNulls = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 40224.658492476850000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var PLine:integer=0;'
      '    CntPeople, CntDays:Integer;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  PLine:=0;'
      'end;'
      ''
      'procedure Memo12OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  inc(Pline);'
      'end;'
      ''
      'procedure Overlay1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   if <chernetka> = 1'
      '       then memo24.visible := true'
      '       else memo24.visible := false;'
      'end;'
      ''
      'procedure Memo44OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '     {  showmessage(inttostr(<chernetka>));'
      '      if <chernetka> = 1'
      '       then memo44.visible := true'
      '       else memo44.visible := false; }'
      'end;'
      ''
      'procedure Memo15OnBeforePrint(Sender: TfrxComponent);'
      'var is_use:Integer;'
      'begin'
      '   is_use:=<ReportDsetData."IS_USE_PERSONIF">;'
      '   memo15.clear;'
      '   if is_use=1 then memo15.Text:='#39#1058#1072#1082#39' else memo15.Text:='#39#1053#1110#39';'
      ''
      'end;'
      ''
      'procedure Memo4OnBeforePrint(Sender: TfrxComponent);'
      'var str, s, fio, imya, otch:String;'
      '    i, l, k:Integer;'
      '    fl:boolean;'
      'begin'
      '   fl:=true;'
      '   fio:='#39#39';'
      '   imya:='#39#39';'
      '   otch:='#39#39';'
      '   str:=<ReportDsetData."FIO_USER_MODIFY">;'
      '  // showmessage(str);'
      '   l:=length(str);'
      '   for i:=1 to l do'
      '   begin'
      '      s:=copy(str,i,1);'
      '      if s='#39' '#39' then fl:=false;'
      '      if fl=true then fio:=fio+s;'
      '      //showmessage(s);'
      '   end;'
      '   s:='#39#39';'
      '   fl:=true;'
      '   for i:=1 to l do'
      '   begin'
      '      if fl=true then s:=copy(str,i,1);'
      '      if s='#39' '#39' then'
      '      begin'
      '         s:=copy(str,i+1,1);'
      '         imya:=imya+s;'
      '         fl:=false;'
      '      end;'
      '   end;'
      '   k:=0;'
      '   s:='#39#39';'
      '   fl:=true;'
      '   for i:=1 to l do'
      '   begin'
      '      if fl=true then'
      '      begin'
      '         s:=copy(str,i,1);'
      '         if s='#39' '#39' then k:=k+1;'
      '         if k=2 then'
      '         begin'
      '            s:=copy(str,i+1,1);'
      '            otch:=otch+s;'
      '            fl:=false;'
      '            k:=0;'
      '         end;'
      '      end;'
      '   end;'
      '   memo4.clear;'
      
        '   memo4.Text:='#39#1042#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1080#1081' '#1079#1072' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103'  ____________ '#39'+imy' +
        'a+'#39'. '#39'+otch+'#39'. '#39'+fio;'
      'end;'
      ''
      'procedure Memo10OnBeforePrint(Sender: TfrxComponent);'
      '//var cnt:Integer;'
      'begin'
      '//  cnt:=<ReportDsetData."COUNT_PEOPLE">;'
      '//  CntPeople:=CntPeople+cnt;'
      '//  cnt:=0;'
      'end;'
      ''
      'procedure Memo9OnBeforePrint(Sender: TfrxComponent);'
      '//var cnt:Integer;'
      'begin'
      ' // cnt:=0;'
      '  //cnt:=<ReportDsetData."COUNT_DAYS">;'
      ' // CntDays:=CntDays+cnt;'
      ' // cnt:=0;'
      'end;'
      ''
      'procedure Memo22OnBeforePrint(Sender: TfrxComponent);'
      'var CntP:Variant;'
      'begin'
      '   //CntP:=<SUM(<ReportDsetData."COUNT_PEOPLE">,MasterData1)>;'
      '  // memo22.clear;'
      '  // memo22.Text:=VarToStr(CntP);'
      'end;'
      ''
      'procedure Memo23OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' // memo23.clear;'
      ' // memo23.Text:=IntToStr(CntDays);'
      'end;'
      ''
      'begin'
      '   CntPeople:=0;'
      '   CntDays:=0;'
      'end.')
    Left = 248
    Top = 8
    Datasets = <
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
        Name = 'PSpisok'
        Value = #39#1057#1055#1048#1057#1054#1050' '#1050#1040#1053#1044#1048#1044#1040#1058#1030#1042' '#1053#1040#1059#1050#39
      end
      item
        Name = 'chernetka'
        Value = Null
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 140.504020000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo3: TfrxMemoView
          Top = 86.929190000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1088#1086#1079#1088#1072#1093#1086#1074#1072#1085#1086#1075#1086' '#1089#1090#1072#1078#1091' '#1079#1072' '#1087#1077#1088#1110#1086#1076'  [ReportDsetData."PERIOD_DOC"] ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 506.457020000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1088#1091#1082#1091': [ReportDsetData."CUR_PRINT"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Top = 22.677180000000000000
          Width = 721.890230000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."FIRM_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Top = 64.252010000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1047' '#1042' '#1045' '#1044' '#1045' '#1053' '#1048' '#1049'   '#1047' '#1042' '#1030' '#1058)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 34.015770000000000000
        ParentFont = False
        Top = 219.212740000000000000
        Width = 718.110700000000000000
        KeepChild = True
        Stretched = True
        object Memo14: TfrxMemoView
          Left = 30.236240000000000000
          Width = 234.330860000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090#1072#1078)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 415.748300000000000000
          Width = 150.519790000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1075#1072#1083#1100#1085#1072' '#1082#1110#1083#1100#1082#1110#1089#1090#1100' '#1076#1085#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 264.567100000000000000
          Width = 151.181200000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1083#1102#1076#1077#1081)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Width = 30.236240000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1087'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 567.307086610000000000
          Width = 150.519790000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1074' '#1087#1077#1088#1089#1086#1085#1110#1092#1110#1082#1072#1094#1110#1111)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 1171.654300000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 653.858690000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
        object Memo13: TfrxMemoView
          Left = 619.842920000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1089#1090#1086#1088'.')
        end
        object Memo30: TfrxMemoView
          Left = 672.756340000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1110#1079)
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 687.874460000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[(<TotalPages#>)]')
        end
        object Memo5: TfrxMemoView
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              #1055#1088#1086#1077#1082#1090' '#8470' [ReportDsetData."REGEST_NUM"] ([ReportDsetData."HASH_KO' +
              'D"])')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 275.905690000000000000
        Width = 718.110700000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        KeepFooter = True
        KeepHeader = True
        KeepTogether = True
        RowCount = 0
        Stretched = True
        object Memo9: TfrxMemoView
          Left = 415.748300000000000000
          Width = 150.523760000000000000
          Height = 22.677170240000000000
          OnBeforePrint = 'Memo9OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."COUNT_DAYS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 264.567100000000000000
          Width = 151.181200000000000000
          Height = 22.677170240000000000
          OnBeforePrint = 'Memo10OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."COUNT_PEOPLE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Width = 30.236240000000000000
          Height = 22.677170240000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Pline]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 30.236240000000000000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          DataSetName = 'ReportDSetDataPeople'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_STAJ"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 22.677180000000000000
          OnBeforePrint = 'Memo15OnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."IS_USE_PERSONIF"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 170.078850000000000000
        Top = 978.898270000000000000
        Width = 718.110700000000000000
        object Memo4: TfrxMemoView
          Top = 132.283550000000900000
          Width = 718.110700000000000000
          Height = 37.795300000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1042#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1080#1081' '#1079#1072' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103'      ____________  [ReportDsetData.' +
              '"FIO_USER_MODIFY"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Width = 264.567100000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '         '#1030#1058#1054#1043#1054':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 264.567100000000000000
          Width = 151.181200000000000000
          Height = 22.677180000000000000
          OnBeforePrint = 'Memo22OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."CNT_PEOPLE_ALL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 415.748300000000000000
          Width = 150.425196850000000000
          Height = 22.677180000000000000
          OnBeforePrint = 'Memo23OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."CNT_DAYS_ALL"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Overlay1: TfrxOverlay
        Height = 597.165740000000000000
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'Overlay1OnBeforePrint'
        object Memo24: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 105.826840000000000000
          Width = 563.149970000000100000
          Height = 487.559370000000000000
          Visible = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -96
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            #1063#1045#1056#1053#1045#1058#1050#1040)
          ParentFont = False
          Rotation = 45
          VAlign = vaCenter
        end
      end
    end
  end
  object ReportDsetData1: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = ReportDataSet
    Left = 240
    Top = 56
  end
  object ReportDocDataSet: TpFIBDataSet
    Database = pFIBD_Reestr
    Transaction = pFIBT_Read
    UpdateTransaction = pFIBT_Write
    Left = 240
    Top = 112
    poSQLINT64ToBCD = True
  end
end
