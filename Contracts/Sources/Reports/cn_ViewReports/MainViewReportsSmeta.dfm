object frmMainViewReportsSmeta: TfrmMainViewReportsSmeta
  Left = 375
  Top = 216
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmMainViewReportsSmeta'
  ClientHeight = 390
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxGridDB: TcxGrid
    Left = 0
    Top = 0
    Width = 297
    Height = 161
    TabOrder = 0
    object cxGridDBDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSourceDB
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DevExpress_Style
      object CxSelectField: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 20
        DataBinding.FieldName = 'RxSelectField'
        IsCaptionAssigned = True
      end
      object CxNameField: TcxGridDBColumn
        Options.Editing = False
        Width = 76
        DataBinding.FieldName = 'RxNameField'
        IsCaptionAssigned = True
      end
      object RxNameVariantDB: TcxGridDBColumn
        Caption = #1044#1077#1073#1077#1090#1086#1074#1099#1077' '#1089#1095#1077#1090#1072
        Options.Editing = False
        Width = 199
        DataBinding.FieldName = 'RxNameVariant'
      end
    end
    object cxGridDBLevel1: TcxGridLevel
      GridView = cxGridDBDBTableView1
    end
  end
  object cxGridCR: TcxGrid
    Left = 304
    Top = 0
    Width = 297
    Height = 161
    TabOrder = 1
    object cxGridDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSourceCR
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DevExpress_Style
      object cxGridDBColumn1: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 20
        DataBinding.FieldName = 'RxSelectField'
        IsCaptionAssigned = True
      end
      object cxGridDBColumn2: TcxGridDBColumn
        Options.Editing = False
        Width = 76
        DataBinding.FieldName = 'RxNameField'
        IsCaptionAssigned = True
      end
      object RxNameVariantKD: TcxGridDBColumn
        Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1099#1077' '#1089#1095#1077#1090#1072
        Options.Editing = False
        Width = 199
        DataBinding.FieldName = 'RxNameVariant'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object cxGridSM: TcxGrid
    Left = 0
    Top = 168
    Width = 601
    Height = 169
    TabOrder = 2
    object cxGridDBTableView2: TcxGridDBTableView
      DataController.DataSource = DataSourceSM
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DevExpress_Style
      object cxGridDBColumn4: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 20
        DataBinding.FieldName = 'RxSelectField'
        IsCaptionAssigned = True
      end
      object RxNameVariantSmRzSt: TcxGridDBColumn
        Caption = #1057#1084'\'#1056#1072#1079#1076'\'#1057#1090'\'#1050#1045#1050#1042
        Options.Editing = False
        Width = 76
        DataBinding.FieldName = 'RxNameField'
      end
      object RxNameVariantSmeta: TcxGridDBColumn
        Caption = #1057#1084#1077#1090#1072
        Options.Editing = False
        Width = 199
        DataBinding.FieldName = 'RxNameVariant'
      end
    end
    object cxGridLevel2: TcxGridLevel
      GridView = cxGridDBTableView2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 371
    Width = 620
    Height = 19
    Panels = <>
  end
  object cxButtonOK: TcxButton
    Left = 416
    Top = 344
    Width = 91
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088
    TabOrder = 4
    OnClick = cxButtonOKClick
  end
  object cxButtonCancel: TcxButton
    Left = 512
    Top = 344
    Width = 83
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = cxButtonCancelClick
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=sysdba')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 256
    Top = 176
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 288
    Top = 176
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TACommit
    Left = 256
    Top = 208
  end
  object pFIBStoredProcSaveRX: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 288
    Top = 208
  end
  object DataSourceMaster: TDataSource
    DataSet = pFIBDataSetPrintMaster
    Left = 368
    Top = 184
  end
  object pFIBDataSetPrintMaster: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    Left = 400
    Top = 184
    poSQLINT64ToBCD = True
  end
  object frxDBDatasetMaster: TfrxDBDataset
    UserName = 'frxDBDatasetMaster'
    CloseDataSource = False
    DataSet = pFIBDataSetPrintMaster
    Left = 432
    Top = 184
  end
  object pFIBDataSetPrintDetail: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    DataSource = DataSourceMaster
    Left = 400
    Top = 216
    poSQLINT64ToBCD = True
  end
  object frxDBDatasetDetails: TfrxDBDataset
    UserName = 'frxDBDatasetDetails'
    CloseDataSource = False
    DataSet = pFIBDataSetPrintDetail
    Left = 432
    Top = 216
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 400
    Top = 248
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.500000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38516.665087581000000000
    ReportOptions.LastChange = 39254.600632094910000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  NFacult,NSum:Double;'
      '  FlagFac,FlagSum,FlagNewPage,CurPage,CntLine,CntAll:Integer;'
      '  CountRec:Integer;'
      '  TextFIO:String;'
      ''
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   if <Page#>=1 then MemoPage.visible:=false'
      '  else MemoPage.visible:=true;'
      '   MemoNAME_FACULT.Visible := true;'
      '   CountRec:=10;'
      ''
      'end;'
      ''
      'procedure MemoNAME_FACULTOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'FlagNewPage:=0;'
      'if MemoNAME_FACULT.Visible = true then'
      '    begin'
      '      FlagFac:=1;'
      '    end;'
      '  if FlagFac = 1 then'
      '    begin'
      
        '      if ( NFacult<><frxDBDatasetDetails."ID_FAK">)and(NFacult<>' +
        '0) then'
      '        begin'
      '//          MemoNAME_FACULT.Visible := true;'
      '          Engine.NewPage();'
      '          FlagNewPage:=1;'
      '        end'
      '        else'
      '        begin'
      '          if (NFacult<>0) then'
      '            begin'
      '//              MemoNAME_FACULT.Visible := false;'
      '            end;'
      '        end;'
      '      NFacult:=<frxDBDatasetDetails."ID_FAK">;'
      '    end;'
      'end;'
      ''
      ''
      'procedure Memo15OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'if <frxDBDatasetDetails."ISMAINDOG">=1 then'
      '  begin'
      '     Memo15.Text:=<cn_RepDocProvROS>;'
      '  end;'
      'if <frxDBDatasetDetails."ISMAINDOG">=0 then'
      '  begin'
      '     Memo15.Text:=<cn_RepDocProvRDop>;'
      '  end;'
      'end;'
      ''
      'procedure Memo3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'CountRec:=CountRec+1;'
      'if TextFIO = <frxDBDatasetDetails."FIO"> then'
      '  begin'
      '    TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight;'
      '    Memo4.Text := '#39#39';'
      '  end'
      '  else'
      '  begin'
      '    Memo4.Text :=IntToStr(CntLine);'
      '    CntLine := CntLine + 1;'
      '  end;'
      'TextFIO := <frxDBDatasetDetails."FIO">;'
      'CntAll := CntAll + 1;'
      'end;'
      ''
      ''
      'procedure Memo1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'if CountRec>=20 then'
      '  begin'
      '     Engine.NewPage();'
      '  end;'
      'TextFIO := '#39#39';'
      'end;'
      ''
      ''
      'procedure MemoNAME_SPECOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if MemoName_SPEC.Visible = true then'
      '    begin'
      '      MemoTITLEName_SPEC.Visible := true;'
      '    end'
      '    else'
      '    begin'
      '      MemoTITLEName_SPEC.Visible := false;'
      '    end;'
      'end;'
      ''
      'procedure MemoNAME_NATIONALOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if MemoName_NATIONAL.Visible = true then'
      '    begin'
      '      MemoTITLEName_NATIONAL.Visible := true;'
      '    end'
      '    else'
      '    begin'
      '      MemoTITLEName_NATIONAL.Visible := false;'
      '    end;'
      'end;'
      ''
      
        'procedure MemoNAME_FORM_STUDOnBeforePrint(Sender: TfrxComponent)' +
        ';'
      'begin'
      '  if MemoName_FORM_STUD.Visible = true then'
      '    begin'
      '      MemoTITLEName_FORM_STUD.Visible := true;'
      '    end'
      '    else'
      '    begin'
      '      MemoTITLEName_FORM_STUD.Visible := false;'
      '    end;'
      'end;'
      ''
      'procedure MemoNAME_KAT_STUDOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if MemoName_KAT_STUD.Visible = true then'
      '    begin'
      '      MemoTITLEName_KAT_STUD.Visible := true;'
      '    end'
      '    else'
      '    begin'
      '      MemoTITLEName_KAT_STUD.Visible := false;'
      '    end;'
      'end;'
      ''
      'procedure MemoKURSOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if MemoKURS.Visible = true then'
      '    begin'
      '      MemoTITLEKURS.Visible := true;'
      '    end'
      '    else'
      '    begin'
      '      MemoTITLEKURS.Visible := false;'
      '    end;'
      'end;'
      ''
      'procedure MemoNAME_GROUPOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if MemoName_GROUP.Visible = true then'
      '    begin'
      '      MemoTITLEName_GROUP.Visible := true;'
      '    end'
      '    else'
      '    begin'
      '      MemoTITLEName_GROUP.Visible := false;'
      '    end;'
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  CntLine := 1;'
      'end;'
      ''
      
        'procedure MemoNAME_SP_CEL_ZAMOVNIKOnBeforePrint(Sender: TfrxComp' +
        'onent);'
      'begin'
      '  if  MemoNAME_SP_CEL_ZAMOVNIK.Visible = true then'
      '    begin'
      '       MemoTitleNAME_SP_CEL_ZAMOVNIK.Visible := true;'
      '    end'
      '    else'
      '    begin'
      '       MemoTitleNAME_SP_CEL_ZAMOVNIK.Visible := false;'
      '    end;'
      'end;'
      ''
      'begin'
      '  NFacult :=0;'
      '  FlagFac :=0;'
      '  NSum :=0;'
      '  FlagSum :=0;'
      '  FlagNewPage :=0;'
      '  CurPage:= 1;'
      '  CntAll := 0;'
      'end.')
    Left = 432
    Top = 248
    Datasets = <
      item
        DataSet = frxDBDatasetDetails
        DataSetName = 'frxDBDatasetDetails'
      end
      item
        DataSet = frxDBDatasetMaster
        DataSetName = 'frxDBDatasetMaster'
      end>
    Variables = <
      item
        Name = 'NAME_REPORT'
        Value = #39#1056#1077#1077#1089#1090#1088#39
      end
      item
        Name = 'NAME_REPORT_MAIN'
        Value = #39#1089#1090#1091#1076#1077#1085#1090#1110#1074', '#1097#1086' '#1085#1072#1074#1095#1072#1102#1090#1100#1089#1103' '#1079#1072' '#1086#1089#1085#1086#1074#1085#1080#1084#1080' '#1076#1086#1075#1086#1074#1086#1088#1072#1084#1080#39
      end
      item
        Name = 'NAME_REPORT_DOP'
        Value = #39#1089#1090#1091#1076#1077#1085#1090#1110#1074', '#1097#1086' '#1085#1072#1074#1095#1072#1102#1090#1100#1089#1103' '#1079#1072' '#1076#1086#1076#1072#1090#1082#1086#1074#1080#1084#1080' '#1076#1086#1075#1086#1074#1086#1088#1072#1084#1080#39
      end
      item
        Name = 'NAME_REPORT_REIOD'
        Value = #39#1079#1072' '#1087#1077#1088#1110#1086#1076#39
      end
      item
        Name = 'SPEC'
        Value = #39#1057#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100#39
      end
      item
        Name = 'NATIONAL'
        Value = #39#1043#1088#1086#1084#1072#1076#1103#1085#1089#1090#1074#1086#39
      end
      item
        Name = 'FORMSTUD'
        Value = #39#1060#1086#1088#1084#1072' '#1085#1072#1074#1095#1072#1085#1085#1103#39
      end
      item
        Name = 'KATSTUD'
        Value = #39#1050#1072#1090#1077#1075#1086#1088#1110#1103' '#1085#1072#1074#1095#1072#1085#1085#1103#39
      end
      item
        Name = 'KURS'
        Value = #39#1050#1091#1088#1089#39
      end
      item
        Name = 'GROUP'
        Value = #39#1043#1088#1091#1087#1072#39
      end
      item
        Name = 'FIO'
        Value = #39#1055'.'#1030'.'#1041'.'#39
      end
      item
        Name = 'DOG'
        Value = #39#1044#1086#1075#1086#1074#1110#1088' '#8470#39
      end
      item
        Name = 'DATEDOG'
        Value = #39#1044#1072#1090#1072' '#1079#1072#1082#1083#1102#1095#1077#1085#1085#1103#39
      end
      item
        Name = 'PERIODDOG'
        Value = #39#1055#1077#1088#1110#1086#1076' '#1076#1110#1111' '#1076#1086#1075#1086#1074#1086#1088#1091#39
      end
      item
        Name = 'PAYDOG'
        Value = #39#1055#1083#1072#1090#1085#1080#1082' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091#39
      end
      item
        Name = 'SUMENDDOG'
        Value = #39#1057#1091#1084#1072' '#1076#1086#1075#1086#1074#1086#1088#1091', '#1075#1088#1085#39
      end
      item
        Name = 'BEGIN'
        Value = #39#1079#39
      end
      item
        Name = 'END'
        Value = #39#1087#1086#39
      end
      item
        Name = 'cn_RepDogSumNeed'
        Value = #39#1057#1087#1083'. '#1085#1072' '#1076#1072#1090#1091' '#1088#1072#1079#1088#1072#1093#1091#1085#1082#1091', '#1075#1088#1085#39
      end
      item
        Name = 'cn_RepDogSumPay'
        Value = #39#1057#1087#1083#1072#1095#1077#1085#1086', '#1075#1088#1085#39
      end
      item
        Name = 'cn_RepDogSumOverPay'
        Value = #39#1055#1077#1088#1077#1087#1083#1072#1090#1072', '#1075#1088#1085#39
      end
      item
        Name = 'cn_RepDogSumDate'
        Value = #39#1057#1087#1083#1072#1095#1077#1085#1086' '#1087#1086#39
      end
      item
        Name = 'cn_RepDogSumTextOver'
        Value = #39#1057#1091#1084#1072' '#1087#1077#1088#1077#1087#1083#1072#1090#1080#39
      end
      item
        Name = 'cn_RepDogSumText'
        Value = #39#1058#1086#1095#1085#1072' '#1089#1087#1083#1072#1090#1072#39
      end
      item
        Name = 'cn_RepDogSumTextNEED'
        Value = #39#1057#1091#1084#1072' '#1079#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1086#1089#1090#1110#39
      end
      item
        Name = 'cn_RepPere'
        Value = #39#1089#1090#1091#1076#1077#1085#1090#1110#1074', '#1097#1086' '#1087#1077#1088#1077#1087#1083#1072#1090#1080#1083#1080' '#1079#1072' '#1085#1072#1074#1095#1072#1085#1085#1103#39
      end
      item
        Name = 'cn_RepNeed'
        Value = #39#1089#1090#1091#1076#1077#1085#1090#1110#1074', '#1097#1086' '#1079#1072#1073#1086#1088#1075#1091#1074#1072#1083#1080' '#1079#1072' '#1085#1072#1074#1095#1072#1085#1085#1103#39
      end
      item
        Name = 'cn_RepToch'
        Value = #39#1089#1090#1091#1076#1077#1085#1090#1110#1074', '#1097#1086' '#1087#1086#1074#1085#1110#1089#1090#1102' '#1089#1087#1083#1072#1090#1080#1083#1080' '#1079#1072' '#1085#1072#1074#1095#1072#1085#1085#1103#39
      end
      item
        Name = 'cn_RepOpldate'
        Value = #39#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1089#1091#1084#1080' '#1076#1086' '#1089#1087#1083#1072#1090#1080' '#1085#1072#39
      end
      item
        Name = 'cn_RepMainDogEX'
        Value = #39#1079#1072' '#1086#1089#1085#1086#1074#1085#1080#1084#1080' '#1076#1086#1075#1086#1074#1086#1088#1072#1084#1080#39
      end
      item
        Name = 'cn_RepDopDogEX'
        Value = #39#1079#1072' '#1076#1086#1076#1072#1090#1082#1086#1074#1080#1084#1080' '#1076#1086#1075#1086#1074#1086#1088#1072#1084#1080#39
      end
      item
        Name = 'cn_RepSumAll'
        Value = #39#1059#1089#1100#1086#1075#1086':'#39
      end
      item
        Name = 'cn_RepDocProvR2'
        Value = #39#1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079#39
      end
      item
        Name = 'cn_RepDocProvR3'
        Value = #39#1076#1086#39
      end
      item
        Name = 'cn_RepDocProvR6'
        Value = #39#1057#1091#1084#1084#1072', '#1075#1088#1085#39
      end
      item
        Name = 'cn_RepDocProvR7'
        Value = #39#1044#1086#1082#1091#1084#1077#1085#1090' '#8470#39
      end
      item
        Name = 'cn_RepDocProvR8'
        Value = #39#1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1091#39
      end
      item
        Name = 'cn_RepDocProvR9'
        Value = #39#1055#1083#1072#1090#1085#1080#1082'/  '#1054#1090#1088#1080#1084#1091#1074#1072#1095#39
      end
      item
        Name = 'cn_RepDocProvR10'
        Value = #39#1055#1088#1080#1079#1085#1072#1095#1077#1085#1085#1103' '#1087#1083#1072#1090#1077#1078#1091#39
      end
      item
        Name = 'cn_RepDocProvR11'
        Value = #39#1057#1091#1084#1084#1072' '#1085#1072#1076#1093#1086#1076#1078#1077#1085#1100#39
      end
      item
        Name = 'cn_RepDocProvR12'
        Value = #39#1074#1110#1076#39
      end
      item
        Name = 'cn_RepDocProvR13'
        Value = #39#1030#1089#1090'. '#1092#1110#1085'.'#39
      end
      item
        Name = 'cn_RepDocProvROS'
        Value = #39#1056#1108#1077#1089#1090#1088' '#1085#1072#1076#1093#1086#1076#1078#1077#1085#1100' '#1079#1072' '#1085#1072#1074#1095#1072#1085#1085#1103' '#1079#1072' '#1086#1089#1085#1086#1074#1085#1080#1084#1080' '#1076#1086#1075#1086#1074#1086#1088#1072#1084#1080#39
      end
      item
        Name = 'cn_RepDocProvRDop'
        Value = #39#1056#1108#1077#1089#1090#1088' '#1085#1072#1076#1093#1086#1076#1078#1077#1085#1100' '#1079#1072' '#1085#1072#1074#1095#1072#1085#1085#1103' '#1079#1072' '#1076#1086#1076#1072#1090#1082#1086#1074#1080#1084#1080' '#1076#1086#1075#1086#1074#1086#1088#1072#1084#1080#39
      end
      item
        Name = 'cn_RepDocAllSum'
        Value = #39#1053#1072#1076#1088#1091#1082#1086#1074#1072#1085#1072' '#1089#1091#1084#1084#1072' '#1085#1072#1076#1093#1086#1076#1078#1077#1085#1100#39
      end
      item
        Name = 'cn_RepDocAllDoc'
        Value = #39#1047#1072#1075#1072#1083#1100#1085#1072' '#1082#1110#1083#1100#1082#1110#1089#1090#1100' '#1085#1072#1076#1093#1086#1076#1078#1077#1085#1100#39
      end
      item
        Name = 'DATE_BEG'
        Value = #39'01.11.2006'#39
      end
      item
        Name = 'DATE_END'
        Value = #39'30.11.2006'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 3.779530000000000000
        Top = 173.858380000000000000
        Width = 737.008350000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBDatasetMaster
        DataSetName = 'frxDBDatasetMaster'
        KeepChild = True
        KeepFooter = True
        KeepHeader = True
        KeepTogether = True
        RowCount = 0
      end
      object DetailData1: TfrxDetailData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 26.456710000000000000
        ParentFont = False
        Top = 362.834880000000000000
        Width = 737.008350000000000000
        DataSet = frxDBDatasetDetails
        DataSetName = 'frxDBDatasetDetails'
        KeepChild = True
        KeepFooter = True
        KeepHeader = True
        KeepTogether = True
        RowCount = 0
        object Memo5: TfrxMemoView
          Align = baLeft
          Left = 211.653484720000000000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.Strings = (
            
              '[frxDBDatasetDetails."DOC_TYPE"] '#8470' [frxDBDatasetDetails."DOC_NUM' +
              '"]'
            '[cn_RepDocProvR12] [frxDBDatasetDetails."DOC_DATE"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          Left = 317.480324720000000000
          Width = 68.031540000000000000
          Height = 26.456710000000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetDetails."SUMMA"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Left = 385.511864720000000000
          Width = 98.267780000000000000
          Height = 26.456710000000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.Strings = (
            '[frxDBDatasetDetails."NAME_PAYER"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Align = baLeft
          Left = 483.779644720000000000
          Width = 253.228510000000000000
          Height = 26.456710000000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.Strings = (
            '[frxDBDatasetDetails."DOC_NOTE"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baLeft
          Left = 37.795275590000000000
          Width = 173.858209130000000000
          Height = 26.456710000000000000
          OnBeforePrint = 'Memo3OnBeforePrint'
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          Memo.Strings = (
            '[frxDBDatasetDetails."FIO"]'
            '[frxDBDatasetDetails."NUM_DOG"] [frxDBDatasetDetails."DATE_DOG"]')
          ParentFont = False
          SuppressRepeated = True
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Width = 37.795275590000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 117.165430000000000000
        Top = 200.315090000000000000
        Width = 737.008350000000000000
        KeepChild = True
        ReprintOnNewPage = True
        Stretched = True
        object Memo1: TfrxMemoView
          Align = baLeft
          Top = 79.370130000000010000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            #8470'/'#8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Align = baLeft
          Left = 37.795275590000000000
          Top = 79.370130000000010000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[FIO]'
            '[DOG]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          Left = 211.653655590000000000
          Top = 79.370130000000010000
          Width = 105.826788740000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[cn_RepDocProvR7]'
            '[cn_RepDocProvR8]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTITLENAME_SPEC: TfrxMemoView
          Top = 52.913420000000000000
          Width = 113.385900000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[SPEC]:')
          ParentFont = False
        end
        object MemoTITLENAME_NATIONAL: TfrxMemoView
          Left = 291.023810000000000000
          Top = 52.913420000000000000
          Width = 113.385900000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[NATIONAL]:')
          ParentFont = False
        end
        object MemoNAME_SPEC: TfrxMemoView
          Left = 113.385900000000000000
          Top = 52.913420000000000000
          Width = 173.858380000000000000
          Height = 13.228346460000000000
          Visible = False
          OnBeforePrint = 'MemoNAME_SPECOnBeforePrint'
          DataField = 'NAME_SPEC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDBDatasetDetails."NAME_SPEC"]')
          ParentFont = False
        end
        object MemoNAME_NATIONAL: TfrxMemoView
          Left = 404.409710000000000000
          Top = 52.913420000000000000
          Width = 113.385900000000000000
          Height = 13.228346460000000000
          Visible = False
          OnBeforePrint = 'MemoNAME_NATIONALOnBeforePrint'
          DataField = 'NAME_NATIONAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDBDatasetDetails."NAME_NATIONAL"]')
          ParentFont = False
        end
        object MemoTITLENAME_FORM_STUD: TfrxMemoView
          Top = 64.252009999999990000
          Width = 113.385900000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[FORMSTUD]:')
          ParentFont = False
        end
        object MemoNAME_FORM_STUD: TfrxMemoView
          Left = 113.385900000000000000
          Top = 64.252009999999990000
          Width = 173.858380000000000000
          Height = 13.228346460000000000
          Visible = False
          OnBeforePrint = 'MemoNAME_FORM_STUDOnBeforePrint'
          DataField = 'NAME_FORM_STUD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDBDatasetDetails."NAME_FORM_STUD"]')
          ParentFont = False
        end
        object MemoTITLENAME_KAT_STUD: TfrxMemoView
          Left = 291.023810000000000000
          Top = 64.252009999999990000
          Width = 113.385900000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[KATSTUD]:')
          ParentFont = False
        end
        object MemoNAME_KAT_STUD: TfrxMemoView
          Left = 404.409710000000000000
          Top = 64.252009999999990000
          Width = 113.385900000000000000
          Height = 13.228346460000000000
          Visible = False
          OnBeforePrint = 'MemoNAME_KAT_STUDOnBeforePrint'
          DataField = 'NAME_KAT_STUD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDBDatasetDetails."NAME_KAT_STUD"]')
          ParentFont = False
        end
        object MemoTITLEKURS: TfrxMemoView
          Left = 517.795610000000000000
          Top = 64.252009999999990000
          Width = 56.692950000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[KURS]:')
          ParentFont = False
        end
        object MemoKURS: TfrxMemoView
          Left = 574.488560000000000000
          Top = 64.252009999999990000
          Width = 37.795300000000000000
          Height = 13.228346460000000000
          Visible = False
          OnBeforePrint = 'MemoKURSOnBeforePrint'
          DataField = 'KURS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDBDatasetDetails."KURS"]')
          ParentFont = False
        end
        object MemoSch: TfrxMemoView
          Top = 30.236240000000010000
          Width = 718.110700000000000000
          Height = 13.228346460000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              #1044#1090' - [frxDBDatasetDetails."SCH_NUMBER_DB"] '#1050#1090' - [frxDBDatasetDet' +
              'ails."SCH_NUMBER_KD"]')
          ParentFont = False
        end
        object MemoSmeta: TfrxMemoView
          Top = 41.574829999999990000
          Width = 644.050650000000000000
          Height = 13.228346460000000000
          Visible = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              '[cn_RepDocProvR13] [frxDBDatasetMaster."SMETA_KOD"].[frxDBDatase' +
              'tMaster."RAZD_KOD"].[frxDBDatasetMaster."ST_KOD"].[frxDBDatasetM' +
              'aster."KEKV_KOD"] [frxDBDatasetDetails."SMETA_TITLE"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baLeft
          Left = 317.480444330000000000
          Top = 79.370130000000010000
          Width = 68.031488740000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[cn_RepDocProvR6]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Align = baLeft
          Left = 385.511933070000000000
          Top = 79.370130000000010000
          Width = 98.267728740000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[cn_RepDocProvR9]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Align = baLeft
          Left = 483.779661810000000000
          Top = 79.370130000000010000
          Width = 253.228458740000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[cn_RepDocProvR10]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoNAME_GROUP: TfrxMemoView
          Left = 668.976810000000000000
          Top = 64.252009999999990000
          Width = 68.031540000000000000
          Height = 13.228346460000000000
          Visible = False
          OnBeforePrint = 'MemoNAME_GROUPOnBeforePrint'
          DataField = 'NAME_GROUP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDBDatasetDetails."NAME_GROUP"]')
          ParentFont = False
        end
        object MemoTITLENAME_GROUP: TfrxMemoView
          Left = 612.283860000000000000
          Top = 64.252009999999990000
          Width = 56.692950000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[GROUP]:')
          ParentFont = False
        end
        object MemoNAME_FACULT: TfrxMemoView
          Width = 718.110700000000000000
          Height = 15.118110240000000000
          OnBeforePrint = 'MemoNAME_FACULTOnBeforePrint'
          DataField = 'NAME_FACULT'
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDatasetDetails."NAME_FACULT"]')
          ParentFont = False
        end
        object MemoTitleNAME_SP_CEL_ZAMOVNIK: TfrxMemoView
          Top = 15.118120000000010000
          Width = 151.181200000000000000
          Height = 13.228346460000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1057#1087#1086#1078#1080#1074#1095#1072' '#1089#1087#1080#1083#1082#1072':')
          ParentFont = False
        end
        object MemoNAME_SP_CEL_ZAMOVNIK: TfrxMemoView
          Left = 151.181200000000000000
          Top = 15.118120000000010000
          Width = 302.362400000000000000
          Height = 13.228346460000000000
          Visible = False
          OnBeforePrint = 'MemoNAME_SP_CEL_ZAMOVNIKOnBeforePrint'
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDBDatasetDetails."NAME_SP_CEL_ZAMOVNIK"]')
          ParentFont = False
        end
        object MemoTitleNAME_FACULT: TfrxMemoView
          Left = 616.063390000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 18.897650000000000000
        Top = 18.897650000000000000
        Width = 737.008350000000000000
        object Memo18: TfrxMemoView
          Align = baLeft
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[Date]:[Time]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 52.913420000000000000
        Top = 60.472480000000000000
        Width = 737.008350000000000000
        OnBeforePrint = 'PageHeader1OnBeforePrint'
        object MemoPage: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1088'. [Page#]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Top = 15.118120000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo15OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Top = 34.015769999999990000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[cn_RepDocProvR2] [DATE_BEG] [cn_RepDocProvR3] [DATE_END]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 45.354360000000000000
        Top = 532.913730000000000000
        Width = 737.008350000000000000
        KeepChild = True
        object Memo14: TfrxMemoView
          Top = 26.456709999999930000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[cn_RepDocAllSum]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 245.669450000000000000
          Top = 26.456709999999930000
          Width = 143.622078980000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetDetails."SUMMA">,DetailData1)] '#1075#1088#1085)
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Width = 389.291590000000000000
          Height = 3.779530000000000000
          Frame.Typ = [ftTop]
        end
        object Memo26: TfrxMemoView
          Top = 7.559060000000045000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[cn_RepDocAllDoc]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 245.669450000000000000
          Top = 7.559060000000045000
          Width = 143.622078980000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[CntAll]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 453.543600000000000000
        Width = 737.008350000000000000
        KeepChild = True
        object Memo19: TfrxMemoView
          Align = baLeft
          Left = 185.196908980000000000
          Width = 154.960668980000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetDetails."SUMMA">,DetailData1)] '#1075#1088#1085)
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Width = 185.196908980000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[cn_RepDocProvR11]:')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Top = 340.157700000000000000
        Width = 737.008350000000000000
        Condition = 'frxDBDatasetDetails."FIO"'
        KeepTogether = True
        Stretched = True
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 411.968770000000000000
        Width = 737.008350000000000000
        KeepChild = True
        object Memo10: TfrxMemoView
          Left = 37.795300000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[cn_RepSumAll]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Align = baLeft
          Left = 317.480520000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetDetails."SUMMA">,DetailData1)]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Align = baLeft
          Left = 385.512060000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          Left = 483.779840000000100000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDatasetDetails
          DataSetName = 'frxDBDatasetDetails'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Align = baLeft
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object TimerReports: TTimer
    Enabled = False
    Left = 464
    Top = 248
  end
  object RxMemoryData: TRxMemoryData
    Active = True
    FieldDefs = <>
    Left = 504
    Top = 184
  end
  object frxDBDatasetMasterRX: TfrxDBDataset
    UserName = 'frxDBDatasetMasterRX'
    CloseDataSource = False
    DataSet = pFIBDataSetPrintMasterRX
    Left = 536
    Top = 184
  end
  object pFIBDataSetPrintMasterRX: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    Left = 568
    Top = 184
    poSQLINT64ToBCD = True
  end
  object pFIBDataSetSchDB: TpFIBDataSet
    SelectSQL.Strings = (
      'select distinct P.sch_number_db,'
      'P.sch_title_db'
      'from CN_TMP_REPORT_PAY_DOC_PROV P'
      'where P.id_session=:id_session')
    Left = 120
    Top = 32
    poSQLINT64ToBCD = True
  end
  object pFIBDataSetSchCR: TpFIBDataSet
    SelectSQL.Strings = (
      'select distinct P.sch_number_kd,'
      'P.sch_title_kd'
      'from CN_TMP_REPORT_PAY_DOC_PROV P'
      'where P.id_session=:id_session')
    Left = 328
    Top = 48
    poSQLINT64ToBCD = True
  end
  object pFIBDataSetSM: TpFIBDataSet
    SelectSQL.Strings = (
      'select distinct P.smeta_kod,'
      'P.razd_kod,'
      'P.st_kod,'
      'P.kekv_kod,'
      'P.smeta_title'
      'from CN_TMP_REPORT_PAY_DOC_PROV P'
      'where P.id_session=:id_session')
    Left = 120
    Top = 200
    poSQLINT64ToBCD = True
  end
  object RxMemoryDataDB: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxSelectField'
        DataType = ftSmallint
      end
      item
        Name = 'RxNameField'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'RxNameVariant'
        DataType = ftString
        Size = 1000
      end>
    Left = 148
    Top = 32
  end
  object DataSourceDB: TDataSource
    DataSet = RxMemoryDataDB
    Left = 120
    Top = 60
  end
  object RxMemoryDataCR: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxSelectField'
        DataType = ftSmallint
      end
      item
        Name = 'RxNameField'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'RxNameVariant'
        DataType = ftString
        Size = 1000
      end>
    Left = 356
    Top = 48
  end
  object DataSourceCR: TDataSource
    DataSet = RxMemoryDataCR
    Left = 328
    Top = 76
  end
  object DataSourceSM: TDataSource
    DataSet = RxMemoryDataSM
    Left = 120
    Top = 228
  end
  object RxMemoryDataSM: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxSelectField'
        DataType = ftSmallint
      end
      item
        Name = 'RxNameField'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'RxNameVariant'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'RxMemoryDataKEKV'
        DataType = ftVariant
      end
      item
        Name = 'RxMemoryDataST'
        DataType = ftVariant
      end
      item
        Name = 'RxMemoryDataRAZD'
        DataType = ftVariant
      end
      item
        Name = 'RxMemoryDataSM'
        DataType = ftVariant
      end>
    Left = 148
    Top = 200
  end
  object Styles: TcxStyleRepository
    Left = 200
    Top = 283
    object BackGround: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object FocusedRecord: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 11037222
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clDefault
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Header: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object DesabledRecord: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 13875838
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = 15850428
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15850428
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14531001
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object Default_StyleSheet: TcxGridTableViewStyleSheet
      Styles.Background = BackGround
      Styles.Content = BackGround
      Styles.ContentEven = cxStyle1
      Styles.ContentOdd = cxStyle2
      Styles.Inactive = DesabledRecord
      Styles.Selection = FocusedRecord
      Styles.Header = Header
      BuiltIn = True
    end
    object DevExpress_Style: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle3
      Styles.Content = cxStyle4
      Styles.ContentEven = cxStyle5
      Styles.ContentOdd = cxStyle6
      Styles.Inactive = cxStyle12
      Styles.IncSearch = cxStyle13
      Styles.Selection = cxStyle16
      Styles.FilterBox = cxStyle7
      Styles.Footer = cxStyle8
      Styles.Group = cxStyle9
      Styles.GroupByBox = cxStyle10
      Styles.Header = cxStyle11
      Styles.Indicator = cxStyle14
      Styles.Preview = cxStyle15
      BuiltIn = True
    end
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 8
    Top = 264
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 40
    Top = 264
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 72
    Top = 264
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 8
    Top = 296
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 40
    Top = 296
  end
end
