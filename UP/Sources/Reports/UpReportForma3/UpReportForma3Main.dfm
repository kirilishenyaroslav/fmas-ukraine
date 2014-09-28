object frmUpReportForma3Main: TfrmUpReportForma3Main
  Left = 408
  Top = 331
  Width = 514
  Height = 124
  Caption = 
    #1047#1074#1110#1090#1085#1110' '#1076#1072#1085#1110' '#1087#1088#1086' '#1082#1110#1083#1100#1082#1110#1089#1085#1080#1081' '#1090#1072' '#1103#1082#1110#1089#1085#1080#1081' '#1089#1082#1083#1072#1076' '#1074#1080#1082#1083#1072#1076#1072#1095#1110#1074' ('#1092#1086#1088#1084#1072' '#8470'3' +
    ')'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 67
    Width = 498
    Height = 19
    Panels = <>
  end
  object cxButtonFilter: TcxButton
    Left = 131
    Top = 24
    Width = 110
    Height = 25
    Action = FilterAction
    Caption = #1060#1110#1083#1100#1090#1088
    TabOrder = 1
  end
  object cxButtonPrint: TcxButton
    Left = 255
    Top = 24
    Width = 110
    Height = 25
    Action = PrintAction
    Caption = #1043#1072#1088#1072#1079#1076
    Enabled = False
    TabOrder = 2
  end
  object cxButtonClose: TcxButton
    Left = 378
    Top = 24
    Width = 110
    Height = 25
    Cancel = True
    Caption = #1042#1080#1093#1110#1076
    TabOrder = 3
    OnClick = cxButtonCloseClick
  end
  object cxButtonDraft: TcxButton
    Left = 8
    Top = 24
    Width = 110
    Height = 25
    Action = FontAction
    Caption = #1064#1088#1080#1092#1090
    TabOrder = 4
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 96
    Top = 16
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 128
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 48
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 128
    Top = 48
  end
  object ActionList1: TActionList
    Left = 168
    Top = 48
    object FilterAction: TAction
      Caption = 'FilterAction'
      ShortCut = 16454
      OnExecute = FilterActionExecute
    end
    object PrintAction: TAction
      Caption = 'PrintAction'
      ShortCut = 121
      OnExecute = PrintActionExecute
    end
    object DesAction: TAction
      Caption = 'DesRep'
      ShortCut = 8315
    end
    object FontAction: TAction
      Caption = 'FontAction'
      ShortCut = 8262
      OnExecute = FontActionExecute
    end
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.ConvertNulls = False
    EngineOptions.DoublePass = True
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38464.547402754600000000
    ReportOptions.LastChange = 41625.679239571760000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'Var Disp, CntAllF, CntDF, CntKF, CntAll, CntD, CntK:Variant;'
      ''
      'procedure Child1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' // if <ReportDsetData."CNT_ALL">=0 then Child1.Visible:=False'
      '  //else Child1.Visible:=True;'
      'end;'
      ''
      'procedure Memo75OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumD:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo75.Clear;'
      '    SumD:=<SUM(<ReportDsetData."CNT_DOC_PROF">,MasterData1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumD*100)/SumAll;'
      '    Memo75.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure Memo101OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumD:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo101.Clear;'
      '    SumD:=<SUM(<ReportDsetData."CNT_DOC_PROF">,MasterData1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumD*100)/SumAll;'
      '    Memo101.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure Memo77OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumK:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo77.Clear;'
      '    SumK:=<SUM(<ReportDsetData."CNT_CAND_DOC">,MasterData1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumK*100)/SumAll;'
      '    Memo77.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure Memo103OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumK:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo103.Clear;'
      '    SumK:=<SUM(<ReportDsetData."CNT_CAND_DOC">,MasterData1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumK*100)/SumAll;'
      '    Memo103.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure Memo78OnBeforePrint(Sender: TfrxComponent);'
      'Var SumAll:Variant;'
      'begin'
      '    //CntAll:=0;'
      '    Memo78.Clear;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    CntAll:=CntAll/SumAll;'
      '    Memo78.Text:=IntToStr(CntAll);'
      '    CntAllF:=CntAllF+CntAll*SumAll;'
      '    CntAll:=0;'
      '   // ShowMessage(IntToStr(<ReportDsetData."DISPLAY_2">));'
      'end;'
      ''
      'procedure Memo82OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumD:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo82.Clear;'
      '    SumD:=<SUM(<ReportDsetData."CNT_EDU_UNIVER">,MasterData1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumD*100)/SumAll;'
      '    Memo82.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure Memo108OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumD:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo108.Clear;'
      '    SumD:=<SUM(<ReportDsetData."CNT_EDU_UNIVER">,MasterData1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumD*100)/SumAll;'
      '    Memo108.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure Memo87OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumD:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo87.Clear;'
      '    SumD:=<SUM(<ReportDsetData."CNT_AGE_LESS_40">,MasterData1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumD*100)/SumAll;'
      '    Memo87.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure Memo113OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumD:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo113.Clear;'
      '    SumD:=<SUM(<ReportDsetData."CNT_AGE_LESS_40">,MasterData1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumD*100)/SumAll;'
      '    Memo113.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure Memo89OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumD:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo89.Clear;'
      
        '    SumD:=<SUM(<ReportDsetData."CNT_AGE_BETW_40_AND_49">,MasterD' +
        'ata1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumD*100)/SumAll;'
      '    Memo89.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure Memo115OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumD:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo115.Clear;'
      
        '    SumD:=<SUM(<ReportDsetData."CNT_AGE_BETW_40_AND_49">,MasterD' +
        'ata1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumD*100)/SumAll;'
      '    Memo115.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure Memo91OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumD:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo91.Clear;'
      
        '    SumD:=<SUM(<ReportDsetData."CNT_AGE_BETW_50_AND_59">,MasterD' +
        'ata1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumD*100)/SumAll;'
      '    Memo91.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure Memo117OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumD:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo117.Clear;'
      
        '    SumD:=<SUM(<ReportDsetData."CNT_AGE_BETW_50_AND_59">,MasterD' +
        'ata1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumD*100)/SumAll;'
      '    Memo117.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure Memo93OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumD:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo93.Clear;'
      
        '    SumD:=<SUM(<ReportDsetData."CNT_AGE_BETW_60_AND_65">,MasterD' +
        'ata1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumD*100)/SumAll;'
      '    Memo93.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure Memo119OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumD:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo119.Clear;'
      
        '    SumD:=<SUM(<ReportDsetData."CNT_AGE_BETW_60_AND_65">,MasterD' +
        'ata1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumD*100)/SumAll;'
      '    Memo119.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure Memo95OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumD:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo95.Clear;'
      '    SumD:=<SUM(<ReportDsetData."CNT_AGE_MORE_65">,MasterData1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumD*100)/SumAll;'
      '    Memo95.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure Memo121OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumD:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo121.Clear;'
      '    SumD:=<SUM(<ReportDsetData."CNT_AGE_MORE_65">,MasterData1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumD*100)/SumAll;'
      '    Memo121.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure Memo97OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumD:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo97.Clear;'
      '    SumD:=<SUM(<ReportDsetData."CNT_AGE_PENSION">,MasterData1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumD*100)/SumAll;'
      '    Memo97.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure Memo123OnBeforePrint(Sender: TfrxComponent);'
      'Var Proc:Double;'
      '    SumD:Variant;'
      '    SumAll:Variant;'
      'begin'
      '    Memo123.Clear;'
      '    SumD:=<SUM(<ReportDsetData."CNT_AGE_PENSION">,MasterData1)>;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    Proc:=(SumD*100)/SumAll;'
      '    Memo123.Text:=FloatToStr(Proc);'
      'end;'
      ''
      'procedure ReportOnStartReport(Sender: TfrxComponent);'
      'begin'
      '  CntAll:=0;'
      '  CntD:=0;'
      '  CntK:=0;'
      '  CntAllF:=0;'
      '  CntDF:=0;'
      '  CntKF:=0;'
      'end;'
      ''
      'procedure Memo1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      ''
      '  // ShowMessage(IntTostr(CntAll));'
      'end;'
      ''
      'procedure Memo104OnBeforePrint(Sender: TfrxComponent);'
      'Var SumAll:Variant;'
      'begin'
      '    //CntAll:=0;'
      '    Memo104.Clear;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_ALL">,MasterData1)>;'
      '    if SumAll<>0 then'
      '    begin'
      '       CntAllF:=CntAllF/SumAll;'
      '       Memo104.Text:=IntToStr(CntAllF);'
      '       CntAllF:=0;'
      '    end;'
      '   // ShowMessage(IntToStr(<ReportDsetData."DISPLAY_2">));'
      'end;'
      ''
      'procedure Memo79OnBeforePrint(Sender: TfrxComponent);'
      'Var SumAll:Variant;'
      'begin'
      '    //CntAll:=0;'
      '    Memo79.Clear;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_DOC_PROF">,MasterData1)>;'
      '    If SumAll<>0 then'
      '    begin'
      '       CntD:=CntD/SumAll;'
      '       Memo79.Text:=IntToStr(CntD);'
      '       CntDF:=CntDF+CntD*SumAll;'
      '       CntD:=0;'
      '    end;'
      '   // ShowMessage(IntToStr(<ReportDsetData."DISPLAY_2">));'
      'end;'
      ''
      'procedure Memo1OnBeforePrint(Sender: TfrxComponent);'
      'var age, cnt:Variant;'
      'begin'
      '   age:=<ReportDsetData."AVG_AGE_ALL">;'
      '   cnt:=<ReportDsetData."CNT_ALL">;'
      '  If ((age<>0) and (cnt<>0)) then'
      
        '  CntAll:=CntAll+<ReportDsetData."AVG_AGE_ALL">*<ReportDsetData.' +
        '"CNT_ALL">;'
      'end;'
      ''
      'procedure Memo2OnBeforePrint(Sender: TfrxComponent);'
      'var age, cnt:Variant;'
      'begin'
      '   age:=<ReportDsetData."AVG_AGE_DOC_PROF">;'
      '   cnt:=<ReportDsetData."CNT_DOC_PROF">;'
      '  If ((age<>0) and (cnt<>0)) then'
      
        '   CntD:=CntD+<ReportDsetData."AVG_AGE_DOC_PROF">*<ReportDsetDat' +
        'a."CNT_DOC_PROF">;'
      '  //ShowMessage(IntToStr(CntD));'
      'end;'
      ''
      'procedure Memo3OnBeforePrint(Sender: TfrxComponent);'
      'var age, cnt:Variant;'
      'begin'
      '   age:=<ReportDsetData."AVG_AGE_CAND_DOC">;'
      '   cnt:=<ReportDsetData."CNT_CAND_DOC">;'
      '  If ((age<>0) and (cnt<>0)) then'
      
        '  CntK:=CntK+<ReportDsetData."AVG_AGE_CAND_DOC">*<ReportDsetData' +
        '."CNT_CAND_DOC">;'
      '  //Showmessage(IntToStr(CntK));'
      'end;'
      ''
      'procedure Memo80OnBeforePrint(Sender: TfrxComponent);'
      'Var SumAll:Variant;'
      'begin'
      '    //CntAll:=0;'
      '    Memo80.Clear;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_CAND_DOC">,MasterData1)>;'
      '    if SumAll<>0 then'
      '    begin'
      '       CntK:=CntK/SumAll;'
      '       CntKF:=CntKF+CntK*SumAll;'
      '       Memo80.Text:=IntToStr(CntK);'
      '       CntK:=0;'
      '    end;'
      'end;'
      ''
      'procedure Memo105OnBeforePrint(Sender: TfrxComponent);'
      'Var SumAll:Variant;'
      'begin'
      '    //CntAll:=0;'
      '    Memo105.Clear;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_DOC_PROF">,MasterData1)>;'
      '    if SumAll<>0 then'
      '    begin'
      '       CntDF:=CntDF/SumAll;'
      '       Memo105.Text:=IntToStr(CntDF);'
      '       CntDF:=0;'
      '    end;'
      'end;'
      ''
      'procedure Memo106OnBeforePrint(Sender: TfrxComponent);'
      'Var SumAll:Variant;'
      'begin'
      '    Memo106.Clear;'
      '    SumAll:=<SUM(<ReportDsetData."CNT_CAND_DOC">,MasterData1)>;'
      '    if SumAll<>0 then'
      '    begin'
      '       CntKF:=CntKF/SumAll;'
      '       Memo106.Text:=IntToStr(CntKF);'
      '       CntKF:=0;'
      '    end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnStartReport = 'ReportOnStartReport'
    Left = 256
    Top = 24
    Datasets = <
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
      end
      item
        DataSet = ReportDSetGlobalData
        DataSetName = 'ReportDsetGlobalData'
      end>
    Variables = <
      item
        Name = ' User Category'
        Value = Null
      end
      item
        Name = 'PDateForm'
        Value = #39' '#1079' 28.11.2005'#39
      end
      item
        Name = 'NameV'
        Value = #39#1044#1054#1053#1045#1062#1068#1050#1048#1049' '#1053#1040#1062#1030#1054#1053#1040#1051#1068#1053#1048#1049' '#1059#1053#1030#1042#1045#1056#1057#1048#1058#1045#1058#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 117.606370000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo14: TfrxMemoView
          Left = 952.441560000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470'3')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Top = 34.015770000000000000
          Width = 1048.063700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047' '#1042' '#1030' '#1058' '#1053' '#1030'      '#1044' '#1040' '#1053' '#1053' '#1030)
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Top = 83.149660000000000000
          Width = 1048.063700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            
              #1085#1072' [ReportDsetData."OUT_DATE_CHECK"] [ReportDsetData."REPORT_TIT' +
              'LE"]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Top = 56.692950000000000000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1088#1086' '#1082#1110#1083#1100#1082#1110#1089#1085#1080#1081' '#1090#1072' '#1103#1082#1110#1089#1085#1080#1081' '#1089#1082#1083#1072#1076' '#1074#1080#1082#1083#1072#1076#1072#1095#1110#1074' ('#1092#1086#1088#1084#1072' '#8470'3)')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clDefault
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 34.015770000000000000
        ParentFont = False
        Top = 449.764070000000000000
        Width = 1046.929810000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        KeepChild = True
        RowCount = 0
        object Memo1: TfrxMemoView
          Top = 18.897650000000000000
          Width = 45.354333150000000000
          Height = 15.118120000000000000
          OnAfterPrint = 'Memo1OnAfterPrint'
          OnBeforePrint = 'Memo1OnBeforePrint'
          DataField = 'CNT_ALL'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_ALL"]')
        end
        object Memo2: TfrxMemoView
          Left = 45.354360000000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo2OnBeforePrint'
          DataField = 'CNT_DOC_PROF'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_DOC_PROF"]')
        end
        object Memo3: TfrxMemoView
          Left = 86.929190000000000000
          Top = 18.897650000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo3OnBeforePrint'
          DataField = 'PROC_DOC_PROF'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_DOC_PROF"]')
        end
        object Memo4: TfrxMemoView
          Left = 124.724490000000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_CAND_DOC'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_CAND_DOC"]')
        end
        object Memo5: TfrxMemoView
          Left = 166.299320000000000000
          Top = 18.897650000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          DataField = 'PROC_CAND_DOC'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_CAND_DOC"]')
        end
        object Memo6: TfrxMemoView
          Left = 204.094620000000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataField = 'AVG_AGE_ALL'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."AVG_AGE_ALL"]')
        end
        object Memo7: TfrxMemoView
          Left = 245.669450000000000000
          Top = 18.897650000000000000
          Width = 60.472453150000000000
          Height = 15.118120000000000000
          DataField = 'AVG_AGE_DOC_PROF'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."AVG_AGE_DOC_PROF"]')
        end
        object Memo8: TfrxMemoView
          Left = 306.141930000000000000
          Top = 18.897650000000000000
          Width = 60.472453150000000000
          Height = 15.118120000000000000
          DataField = 'AVG_AGE_CAND_DOC'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."AVG_AGE_CAND_DOC"]')
        end
        object Memo9: TfrxMemoView
          Left = 366.614410000000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_EDU_UNIVER'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_EDU_UNIVER"]')
        end
        object Memo11: TfrxMemoView
          Left = 408.189240000000000000
          Top = 18.897650000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          DataField = 'PROC_EDU_UNIVER'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_EDU_UNIVER"]')
        end
        object Memo15: TfrxMemoView
          Left = 445.984540000000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_RUS_NATION'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_RUS_NATION"]')
        end
        object Memo16: TfrxMemoView
          Left = 487.559370000000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_UKR_NATION'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_UKR_NATION"]')
        end
        object Memo17: TfrxMemoView
          Left = 529.134200000000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_OTHER_NATION'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_OTHER_NATION"]')
        end
        object Memo18: TfrxMemoView
          Left = 570.709030000000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_AGE_LESS_40'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_AGE_LESS_40"]')
        end
        object Memo19: TfrxMemoView
          Left = 612.283860000000000000
          Top = 18.897650000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_AGE_LESS_40"]')
        end
        object Memo20: TfrxMemoView
          Left = 650.079160000000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_AGE_BETW_40_AND_49"]')
        end
        object Memo21: TfrxMemoView
          Left = 691.653990000000000000
          Top = 18.897650000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_AGE_BETW_40_AND_49"]')
        end
        object Memo22: TfrxMemoView
          Left = 729.449290000000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_AGE_BETW_50_AND_59"]')
        end
        object Memo23: TfrxMemoView
          Left = 771.024120000000000000
          Top = 18.897650000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_AGE_BETW_50_AND_59"]')
        end
        object Memo24: TfrxMemoView
          Left = 808.819420000000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_AGE_BETW_60_AND_65'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_AGE_BETW_60_AND_65"]')
        end
        object Memo26: TfrxMemoView
          Left = 850.394250000000000000
          Top = 18.897650000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          DataField = 'PROC_AGE_BETW_60_AND_65'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_AGE_BETW_60_AND_65"]')
        end
        object Memo27: TfrxMemoView
          Left = 888.189550000000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_AGE_MORE_65'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_AGE_MORE_65"]')
        end
        object Memo28: TfrxMemoView
          Left = 929.764380000000000000
          Top = 18.897650000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          DataField = 'PROC_AGE_MORE_65'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_AGE_MORE_65"]')
        end
        object Memo29: TfrxMemoView
          Left = 967.559680000000000000
          Top = 18.897650000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataField = 'CNT_AGE_PENSION'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."CNT_AGE_PENSION"]')
        end
        object Memo30: TfrxMemoView
          Left = 1009.134510000000000000
          Top = 18.897650000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          DataField = 'PROC_AGE_PENSION'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.1f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[ReportDsetData."PROC_AGE_PENSION"]')
        end
        object Memo125: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 60.472480000000000000
        Top = 196.535560000000000000
        Width = 1046.929810000000000000
        ReprintOnNewPage = True
        object Memo34: TfrxMemoView
          Width = 45.354333150000000000
          Height = 60.472480000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1074#1080#1082#1083'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 45.354360000000000000
          Top = 30.236240000000000000
          Width = 41.574803150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 86.929190000000000000
          Top = 30.236240000000000000
          Width = 37.795273150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 124.724490000000000000
          Top = 30.236240000000000000
          Width = 41.574803150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 166.299320000000000000
          Top = 30.236240000000000000
          Width = 37.795273150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 204.094620000000000000
          Top = 30.236240000000000000
          Width = 41.574803150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1110#1093)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 245.669450000000000000
          Top = 30.236240000000000000
          Width = 60.472453150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1082#1090'. '#1085'., '#1087#1088#1086#1092#1077#1089'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 306.141930000000000000
          Top = 30.236240000000000000
          Width = 60.472453150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1072#1085#1076'. '#1085'., '#1076#1086#1094#1077#1085#1090'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 366.614410000000000000
          Top = 30.236240000000000000
          Width = 41.574803150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 408.189240000000000000
          Top = 30.236240000000000000
          Width = 37.795273150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 445.984540000000000000
          Top = 30.236240000000000000
          Width = 41.574803150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 487.559370000000000000
          Top = 30.236240000000000000
          Width = 41.574803150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 529.134200000000000000
          Top = 30.236240000000000000
          Width = 41.574803150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 570.709030000000000000
          Top = 30.236240000000000000
          Width = 41.574803150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 612.283860000000000000
          Top = 30.236240000000000000
          Width = 37.795273150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 650.079160000000000000
          Top = 30.236240000000000000
          Width = 41.574803150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 691.653990000000000000
          Top = 30.236240000000000000
          Width = 37.795273150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 729.449290000000000000
          Top = 30.236240000000000000
          Width = 41.574803150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 771.024120000000000000
          Top = 30.236240000000000000
          Width = 37.795273150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 808.819420000000000000
          Top = 30.236240000000000000
          Width = 41.574803150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 850.394250000000000000
          Top = 30.236240000000000000
          Width = 37.795273150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 888.189550000000000000
          Top = 30.236240000000000000
          Width = 41.574803150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 929.764380000000000000
          Top = 30.236240000000000000
          Width = 37.795273150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 967.559680000000000000
          Top = 30.236240000000000000
          Width = 41.574803150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 1009.134510000000000000
          Top = 30.236240000000000000
          Width = 37.795273150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 45.354360000000000000
          Width = 79.370130000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1082#1090'. '#1085#1072#1091#1082', '#1087#1088#1086#1092#1077#1089#1086#1088#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 124.724490000000000000
          Width = 79.370130000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1072#1085#1076'. '#1085#1072#1091#1082', '#1076#1086#1094#1077#1085#1090#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 366.614410000000000000
          Width = 79.370130000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1072#1102#1090#1100' '#1091#1085#1110#1074'. '#1086#1089#1074#1110#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 570.709030000000000000
          Width = 79.370130000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086' 40')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 650.079160000000000000
          Width = 79.370130000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '40 - 49')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 729.449290000000000000
          Width = 79.370130000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '50 - 59')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 808.819420000000000000
          Width = 79.370130000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '60 - 65')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 888.189550000000000000
          Width = 79.370130000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1085#1072#1076' 65')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 967.559680000000000000
          Width = 79.370130000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1077#1085#1089#1110#1081#1085'. '#1074#1110#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 204.094620000000000000
          Width = 162.519790000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1077#1088#1077#1076#1085#1110#1081' '#1074#1110#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 445.984540000000000000
          Width = 41.574803150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1091#1089'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 487.559370000000000000
          Width = 41.574803150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1082#1088'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 529.134200000000000000
          Width = 41.574803150000000000
          Height = 30.236240000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1085#1096'.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Memo25: TfrxMemoView
        Top = 14.897650000000000000
        Width = 800.441560000000000000
        Height = 18.897650000000000000
        DataField = 'FIRM_NAME'
        DataSet = ReportDSetGlobalData
        DataSetName = 'ReportDsetGlobalData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[ReportDsetGlobalData."FIRM_NAME"]')
        ParentFont = False
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 604.724800000000000000
        Width = 1046.929810000000000000
        object Memo12: TfrxMemoView
          Left = 831.496600000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1086#1088'. [<Page>] '#1079' [<TotalPages>]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1088#1091#1082#1091': [ReportDsetData."CUR_DATE"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 404.409710000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."DISPLAY_1"'
        object Memo31: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 34.015770000000000000
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."DISPLAY_2"'
        object Memo13: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 34.015770000000000000
          Color = 14145495
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_DEPARTMENT_UPPER"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 37.795300000000000000
        Top = 544.252320000000000000
        Width = 1046.929810000000000000
        object Memo99: TfrxMemoView
          Top = 22.677180000000000000
          Width = 45.354333150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_ALL">,MasterData1)]')
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          Left = 45.354360000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_DOC_PROF">,MasterData1)]')
          ParentFont = False
        end
        object Memo101: TfrxMemoView
          Left = 86.929190000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo101OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Left = 124.724490000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_CAND_DOC">,MasterData1)]')
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          Left = 166.299320000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo103OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 204.094620000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo104OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."AVG_AGE_ALL">,MasterData1)]')
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          Left = 245.669450000000000000
          Top = 22.677180000000000000
          Width = 60.472453150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo105OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."AVG_AGE_DOC_PROF">,MasterData1)]')
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 306.141930000000000000
          Top = 22.677180000000000000
          Width = 60.472453150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo106OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."AVG_AGE_CAND_DOC">,MasterData1)]')
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Left = 366.614410000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_EDU_UNIVER">,MasterData1)]')
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 408.189240000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo108OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 445.984540000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_RUS_NATION">,MasterData1)]')
          ParentFont = False
        end
        object Memo110: TfrxMemoView
          Left = 487.559370000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_UKR_NATION">,MasterData1)]')
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 529.134200000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_OTHER_NATION">,MasterData1)]')
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 570.709030000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_AGE_LESS_40">,MasterData1)]')
          ParentFont = False
        end
        object Memo113: TfrxMemoView
          Left = 612.283860000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo113OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo114: TfrxMemoView
          Left = 650.079160000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_AGE_BETW_40_AND_49">,MasterData1)]')
          ParentFont = False
        end
        object Memo115: TfrxMemoView
          Left = 691.653990000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo115OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo116: TfrxMemoView
          Left = 729.449290000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_AGE_BETW_50_AND_59">,MasterData1)]')
          ParentFont = False
        end
        object Memo117: TfrxMemoView
          Left = 771.024120000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo117OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo118: TfrxMemoView
          Left = 808.819420000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_AGE_BETW_60_AND_65">,MasterData1)]')
        end
        object Memo119: TfrxMemoView
          Left = 850.394250000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo119OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo120: TfrxMemoView
          Left = 888.189550000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_AGE_MORE_65">,MasterData1)]')
          ParentFont = False
        end
        object Memo121: TfrxMemoView
          Left = 929.764380000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo121OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo122: TfrxMemoView
          Left = 967.559680000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_AGE_PENSION">,MasterData1)]')
          ParentFont = False
        end
        object Memo123: TfrxMemoView
          Left = 1009.134510000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo123OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo124: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Color = 14145495
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1030#1058#1054#1043#1054' '#1055#1054' '#1047#1042#1030#1058#1059': ')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 45.354360000000000000
        Top = 336.378170000000000000
        Width = 1046.929810000000000000
        object Memo33: TfrxMemoView
          Top = 22.677180000000000000
          Width = 45.354333150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_ALL">,MasterData1)]')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 45.354360000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_DOC_PROF">,MasterData1)]')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 86.929190000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo75OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 124.724490000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_CAND_DOC">,MasterData1)]')
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Left = 166.299320000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo77OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          Left = 204.094620000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo78OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."AVG_AGE_ALL">,MasterData1)]')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 245.669450000000000000
          Top = 22.677180000000000000
          Width = 60.472453150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo79OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."AVG_AGE_DOC_PROF">,MasterData1)]')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 306.141930000000000000
          Top = 22.677180000000000000
          Width = 60.472453150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo80OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."AVG_AGE_CAND_DOC">,MasterData1)]')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 366.614410000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_EDU_UNIVER">,MasterData1)]')
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Left = 408.189240000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo82OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          Left = 445.984540000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_RUS_NATION">,MasterData1)]')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Left = 487.559370000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_UKR_NATION">,MasterData1)]')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Left = 529.134200000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_OTHER_NATION">,MasterData1)]')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          Left = 570.709030000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_AGE_LESS_40">,MasterData1)]')
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Left = 612.283860000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo87OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          Left = 650.079160000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_AGE_BETW_40_AND_49">,MasterData1)]')
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          Left = 691.653990000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo89OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          Left = 729.449290000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_AGE_BETW_50_AND_59">,MasterData1)]')
          ParentFont = False
        end
        object Memo91: TfrxMemoView
          Left = 771.024120000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo91OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo92: TfrxMemoView
          Left = 808.819420000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_AGE_BETW_60_AND_65">,MasterData1)]')
        end
        object Memo93: TfrxMemoView
          Left = 850.394250000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo93OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          Left = 888.189550000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_AGE_MORE_65">,MasterData1)]')
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          Left = 929.764380000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo95OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          Left = 967.559680000000000000
          Top = 22.677180000000000000
          Width = 41.574803150000000000
          Height = 15.118120000000000000
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.0f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_AGE_PENSION">,MasterData1)]')
          ParentFont = False
        end
        object Memo97: TfrxMemoView
          Left = 1009.134510000000000000
          Top = 22.677180000000000000
          Width = 37.795273150000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo97OnBeforePrint'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Color = 14145495
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1030#1058#1054#1043#1054' "[ReportDsetData."NAME_DEPARTMENT_UPPER"]":')
          ParentFont = False
        end
      end
    end
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 288
    Top = 25
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSetData
    Left = 286
    Top = 55
  end
  object ReportDSetGlobalData: TfrxDBDataset
    UserName = 'ReportDsetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobalData
    Left = 206
    Top = 85
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 320
    Top = 82
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 320
    Top = 55
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 322
    Top = 24
  end
  object DSetGlobalData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 174
    Top = 85
    poSQLINT64ToBCD = True
  end
  object DSetData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 254
    Top = 55
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object FontDialogs: TFontDialog
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    Left = 64
    Top = 48
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
    Left = 360
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 408
  end
end
