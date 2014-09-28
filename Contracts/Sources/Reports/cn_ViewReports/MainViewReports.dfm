object frmMainViewReports: TfrmMainViewReports
  Left = 416
  Top = 327
  Width = 369
  Height = 173
  Caption = 'frmMainViewReports'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 353
    Height = 135
    Align = alClient
    TabOrder = 0
    Visible = False
    object Gauge: TGauge
      Left = 8
      Top = 112
      Width = 345
      Height = 20
      Progress = 0
    end
    object Animate1: TAnimate
      Left = 9
      Top = 16
      Width = 96
      Height = 60
      CommonAVI = aviDeleteFile
      StopFrame = 24
    end
    object cxLabel1: TcxLabel
      Left = 112
      Top = 40
      Width = 202
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = #1046#1076#1080#1090#1077'. '#1048#1076#1077#1090' '#1086#1073#1088#1072#1073#1086#1090#1082#1072' '#1076#1072#1085#1085#1099#1093'!'
    end
  end
  object pFIBDataSetPrintMaster: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    Left = 144
    Top = 8
    poSQLINT64ToBCD = True
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TACommit
    Top = 32
  end
  object RxMemoryData: TRxMemoryData
    Active = True
    FieldDefs = <>
    Left = 248
    Top = 8
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DataSetName = 'frxDBDatasetRX'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.500000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38448.688970509300000000
    ReportOptions.LastChange = 39342.631674756940000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure MemoKursOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."Kurs"> = '#39#39' then'
      '         begin'
      '            if <frxDBDatasetMasterRX."KursTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      '            if <frxDBDatasetMasterRX."KursTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      ''
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '{  if <Page#>=1 then PageHeader1.visible:=false'
      '  else PageHeader1.visible:=true;}'
      ''
      'end;'
      ''
      'procedure MemoName_GroupOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."NAME_GROUP"> = '#39#39' then'
      '         begin'
      '            if <frxDBDatasetMasterRX."NAME_GROUPTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      '            if <frxDBDatasetMasterRX."NAME_GROUPTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      'procedure MemoNAME_FACULTOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."NAME_FACULT"> = '#39#39' then'
      '         begin'
      '            if <frxDBDatasetMasterRX."NAME_FACULTTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      '            if <frxDBDatasetMasterRX."NAME_FACULTTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      'procedure MemoNAME_SPECOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."Name_SPEC"> = '#39#39' then'
      '         begin'
      '            if <frxDBDatasetMasterRX."Name_SPECTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      '            if <frxDBDatasetMasterRX."Name_SPECTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      ''
      
        'procedure MemoNAME_FORM_STUDOnBeforePrint(Sender: TfrxComponent)' +
        ';'
      'begin'
      '  if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."NAME_FORM_STUD"> = '#39#39' then'
      '         begin'
      '            if <frxDBDatasetMasterRX."NAME_FORM_STUDTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      '            if <frxDBDatasetMasterRX."NAME_FORM_STUDTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      'procedure MemoNAME_KAT_STUDOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."NAME_KAT_STUD"> = '#39#39' then'
      '         begin'
      '            if <frxDBDatasetMasterRX."NAME_KAT_STUDTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      '            if <frxDBDatasetMasterRX."NAME_KAT_STUDTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      'procedure MemoNAME_NATIONALOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      '         if <frxDBDatasetMasterRX."NAME_NATIONAL"> = '#39#39' then'
      '         begin'
      '            if <frxDBDatasetMasterRX."NAME_NATIONALTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      '            if <frxDBDatasetMasterRX."NAME_NATIONALTB">=1 then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      ''
      
        'procedure MemoNAME_SP_CEL_ZAMOVNIKOnBeforePrint(Sender: TfrxComp' +
        'onent);'
      'begin'
      '  if TfrxMemoView(Sender).DataSet <> nil then'
      '   begin'
      
        '         if <frxDBDatasetMasterRX."NAME_SP_CEL_ZAMOVNIK"> = '#39#39' t' +
        'hen'
      '         begin'
      
        '            if <frxDBDatasetMasterRX."NAME_SP_CEL_ZAMOVNIKTB">=1' +
        ' then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        ';'
      '              end;'
      '         end'
      '         else'
      '         begin'
      
        '            if <frxDBDatasetMasterRX."NAME_SP_CEL_ZAMOVNIKTB">=1' +
        ' then'
      '              begin'
      
        '                TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRigh' +
        't+ftBottom+ftTop;'
      '              end'
      '              else'
      '              begin'
      
        '               TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight' +
        '+ftTop;'
      '              end;'
      '         end;'
      '   end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 176
    Top = 72
    Datasets = <
      item
        DataSet = frxDBDatasetMasterRX
        DataSetName = 'frxDBDatasetMasterRX'
      end>
    Variables = <
      item
        Name = 'NAME_REPORT'
        Value = #39#1047#1074#1110#1090#1085#1072' '#1092#1086#1088#1084#1072' '#1079#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1086#1089#1090#1110#39
      end
      item
        Name = 'NAME_REPORT1'
        Value = #39#1079#1072' '#1089#1087#1083#1072#1090#1091' '#1076#1086#1075#1086#1074#1086#1088#1110#1074' '#1079#1072' '#1085#1072#1074#1095#1072#1085#1085#1103' '#1085#1072#39
      end
      item
        Name = 'NAME_REPORT_MAIN'
        Value = #39#1089#1090#1091#1076#1077#1085#1090#1110#1074', '#1097#1086' '#1085#1072#1074#1095#1072#1102#1090#1100#1089#1103' '#1079#1072' '#1086#1089#1085#1086#1074#1085#1080#1084#1080' '#1076#1086#1075#1086#1074#1086#1088#1072#1084#1080#39
      end
      item
        Name = 'NAME_REPORT_REIOD'
        Value = #39#1079#1072' '#1087#1077#1088#1110#1086#1076#39
      end
      item
        Name = 'FACULT'
        Value = #39#1060#1072#1082#1091#1083#1100#1090#1077#1090#39
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
        Name = 'cn_RepStudSVFT'
        Value = #39#1059#1089#1100#1086#1075#1086':'#39
      end
      item
        Name = 'cn_RepSVPAYPERE'
        Value = #39#1047#1074#1110#1090#1085#1072' '#1092#1086#1088#1084#1072' '#1087#1077#1088#1077#1087#1083#1072#1090#1080#39
      end
      item
        Name = 'DATE_BEG'
        Value = #39'01.01.2006'#39
      end
      item
        Name = 'DATE_END'
        Value = #39'31.12.2006'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 30.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 234.330860000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDatasetMasterRX
        DataSetName = 'frxDBDatasetMasterRX'
        KeepFooter = True
        PrintIfDetailEmpty = True
        RowCount = 0
        Stretched = True
        object MemoNAME_FACULT: TfrxMemoView
          Align = baLeft
          Width = 105.826791180000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'MemoNAME_FACULTOnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetMasterRX
          DataSetName = 'frxDBDatasetMasterRX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."NAME_FACULT"]')
          ParentFont = False
        end
        object MemoNAME_SPEC: TfrxMemoView
          Align = baLeft
          Left = 204.094522360000000000
          Width = 90.708597950000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'MemoNAME_SPECOnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."NAME_SPEC"]')
          ParentFont = False
        end
        object MemoKurs: TfrxMemoView
          Align = baLeft
          Left = 483.779278570000000000
          Width = 30.236213150000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'MemoKursOnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."KURS"] ')
          ParentFont = False
        end
        object MemoIN_NACH_DOLG: TfrxMemoView
          Align = baLeft
          Left = 563.149354870000000000
          Width = 71.811008980000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'IN_NACH_DOLG'
          DataSet = frxDBDatasetMasterRX
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetMasterRX."IN_NACH_DOLG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoName_Group: TfrxMemoView
          Align = baLeft
          Left = 514.015491720000000000
          Width = 49.133863150000010000
          Height = 18.897650000000000000
          OnBeforePrint = 'MemoName_GroupOnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."NAME_GROUP"] ')
          ParentFont = False
        end
        object MemoNAME_NATIONAL: TfrxMemoView
          Align = baLeft
          Left = 294.803120310000000000
          Width = 64.251912360000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'MemoNAME_NATIONALOnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."NAME_NATIONAL"]')
          ParentFont = False
        end
        object MemoNAME_FORM_STUD: TfrxMemoView
          Align = baLeft
          Left = 359.055032670000000000
          Width = 56.692852360000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'MemoNAME_FORM_STUDOnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."NAME_FORM_STUD"]')
          ParentFont = False
        end
        object MemoNAME_KAT_STUD: TfrxMemoView
          Align = baLeft
          Left = 415.747885030000000000
          Width = 68.031393540000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'MemoNAME_KAT_STUDOnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."NAME_KAT_STUD"]')
          ParentFont = False
        end
        object MemoIN_NACH_PERE: TfrxMemoView
          Align = baLeft
          Left = 634.960363850000000000
          Width = 79.370068980000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'IN_NACH_PERE'
          DataSet = frxDBDatasetMasterRX
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetMasterRX."IN_NACH_PERE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoCUR_NACH: TfrxMemoView
          Align = baLeft
          Left = 714.330432830000000000
          Width = 83.149598979999990000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'CUR_NACH'
          DataSet = frxDBDatasetMasterRX
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetMasterRX."CUR_NACH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoCUR_PAY: TfrxMemoView
          Align = baLeft
          Left = 797.480031810000000000
          Width = 86.929128980000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'CUR_PAY'
          DataSet = frxDBDatasetMasterRX
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetMasterRX."CUR_PAY"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoOUT_NACH_DOLG: TfrxMemoView
          Align = baLeft
          Left = 884.409160790000000000
          Width = 83.149598979999990000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'OUT_NACH_DOLG'
          DataSet = frxDBDatasetMasterRX
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetMasterRX."OUT_NACH_DOLG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoOUT_NACH_PERE: TfrxMemoView
          Align = baLeft
          Left = 967.558759770000000000
          Width = 75.590538980000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'OUT_NACH_PERE'
          DataSet = frxDBDatasetMasterRX
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetMasterRX."OUT_NACH_PERE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoNAME_SP_CEL_ZAMOVNIK: TfrxMemoView
          Align = baLeft
          Left = 105.826791180000000000
          Width = 98.267731180000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'MemoNAME_SP_CEL_ZAMOVNIKOnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetMasterRX
          DataSetName = 'frxDBDatasetMasterRX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetMasterRX."NAME_SP_CEL_ZAMOVNIK"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'PageHeader1OnBeforePrint'
        object Memo3: TfrxMemoView
          Left = 948.662030000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1089#1090#1086#1088'.[Page#]')
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Top = -0.000000000000028422
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[Date]:[Time]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Top = 22.677180000000000000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1081' '#1078#1091#1088#1085#1072#1083', '#1074#1080#1082#1086#1085#1072#1085#1085#1103' '#1076#1086#1075#1086#1074#1086#1088#1110#1074' '#1079#1072' '#1085#1072#1074#1095#1072#1085#1085#1103)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 453.543600000000000000
          Top = 41.574830000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[DATE_BEG]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 578.268090000000000000
          Top = 41.574830000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[DATE_END]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 343.937230000000000000
          Top = 41.574830000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072' '#1087#1077#1088#1110#1086#1076)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 559.370440000000000000
          Top = 41.574830000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '-')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 71.811070000000000000
        Top = 139.842610000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBDatasetMasterRX."ID_SESSION"'
        ReprintOnNewPage = True
        StartNewPage = True
        Stretched = True
        object MemoTitleNAME_FACULT: TfrxMemoView
          Align = baLeft
          Width = 105.826791180000000000
          Height = 71.811070000000000000
          StretchMode = smMaxHeight
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[FACULT]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleNAME_SPEC: TfrxMemoView
          Align = baLeft
          Left = 204.094522360000000000
          Width = 90.708597950000000000
          Height = 71.811070000000000000
          StretchMode = smMaxHeight
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SPEC]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleKurs: TfrxMemoView
          Align = baLeft
          Left = 483.779278570000000000
          Width = 30.236213150000000000
          Height = 71.811070000000000000
          StretchMode = smMaxHeight
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[KURS]')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object MemoTitleName_Group: TfrxMemoView
          Align = baLeft
          Left = 514.015491720000000000
          Width = 49.133863150000000000
          Height = 71.811070000000000000
          StretchMode = smMaxHeight
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[GROUP]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleNAME_NATIONAL: TfrxMemoView
          Align = baLeft
          Left = 294.803120310000000000
          Width = 64.251912360000000000
          Height = 71.811070000000000000
          StretchMode = smMaxHeight
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[NATIONAL]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleNAME_FORM_STUD: TfrxMemoView
          Align = baLeft
          Left = 359.055032670000000000
          Width = 56.692852360000000000
          Height = 71.811070000000000000
          StretchMode = smMaxHeight
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[FORMSTUD]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleNAME_KAT_STUD: TfrxMemoView
          Align = baLeft
          Left = 415.747885030000000000
          Width = 68.031393540000000000
          Height = 71.811070000000000000
          StretchMode = smMaxHeight
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[KATSTUD]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleCUR_NACH: TfrxMemoView
          Align = baLeft
          Left = 714.330432830000000000
          Top = 37.795300000000000000
          Width = 83.149598979999990000
          Height = 34.015770000000010000
          StretchMode = smMaxHeight
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleCUR_PAY: TfrxMemoView
          Align = baLeft
          Left = 797.480031810000000000
          Top = 37.795300000000000000
          Width = 86.929128980000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleIN_NACH_DOLG: TfrxMemoView
          Align = baLeft
          Left = 563.149354870000000000
          Top = 37.795300000000000000
          Width = 71.811008980000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleIN_NACH_PERE: TfrxMemoView
          Align = baLeft
          Left = 634.960363850000000000
          Top = 37.795300000000000000
          Width = 79.370068980000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleOUT_NACH_DOLG: TfrxMemoView
          Align = baLeft
          Left = 884.409160790000000000
          Top = 37.795300000000000000
          Width = 83.149598980000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleOUT_NACH_PERE: TfrxMemoView
          Align = baLeft
          Left = 967.558759770000000000
          Top = 37.795300000000000000
          Width = 75.590538980000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Align = baLeft
          ShiftMode = smDontShift
          Left = 563.149354870000000000
          Width = 151.181138980000000000
          Height = 37.795300000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072' '#1087#1086#1095#1072#1090#1086#1082', '#1075#1088#1085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Align = baLeft
          ShiftMode = smDontShift
          Left = 714.330493850000000000
          Width = 170.078788980000000000
          Height = 37.795300000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1073#1086#1088#1086#1090#1080', '#1075#1088#1085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          ShiftMode = smDontShift
          Left = 884.409282830000000000
          Width = 158.740198980000000000
          Height = 37.795300000000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072' '#1082#1110#1085#1077#1094#1100', '#1075#1088#1085)
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoTitleNAME_SP_CEL_ZAMOVNIK: TfrxMemoView
          Align = baLeft
          Left = 105.826791180000000000
          Width = 98.267731180000000000
          Height = 71.811070000000000000
          StretchMode = smMaxHeight
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ZAMOV]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 275.905690000000000000
        Width = 1046.929810000000000000
        object MemoSumNAME_FACULT: TfrxMemoView
          Align = baLeft
          Width = 105.826791180000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftTop, ftBottom]
        end
        object MemoSumNAME_SPEC: TfrxMemoView
          Align = baLeft
          Left = 204.094522360000000000
          Width = 90.708597950000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftTop, ftBottom]
        end
        object MemoSumKurs: TfrxMemoView
          Align = baLeft
          Left = 483.779278570000000000
          Width = 30.236213150000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftTop, ftBottom]
        end
        object MemoSumName_Group: TfrxMemoView
          Align = baLeft
          Left = 514.015491720000000000
          Width = 48.755903070000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftTop, ftBottom]
        end
        object MemoSumNAME_NATIONAL: TfrxMemoView
          Align = baLeft
          Left = 294.803120310000000000
          Width = 64.251912360000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftTop, ftBottom]
        end
        object MemoSumNAME_FORM_STUD: TfrxMemoView
          Align = baLeft
          Left = 359.055032670000000000
          Width = 60.472382360000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftTop, ftBottom]
        end
        object MemoSumNAME_KAT_STUD: TfrxMemoView
          Align = baLeft
          Left = 419.527415030000000000
          Width = 64.251863540000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftTop, ftBottom]
        end
        object MemoSUMNAME_SP_CEL_ZAMOVNIK: TfrxMemoView
          Align = baLeft
          Left = 105.826791180000000000
          Width = 98.267731180000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftTop, ftBottom]
        end
        object MemoSumIN_NACH_DOLG: TfrxMemoView
          Align = baLeft
          Left = 562.771394790000100000
          Width = 71.811008980000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetMasterRX
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetMasterRX."IN_NACH_DOLG">,MasterData1,2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoSUMIN_NACH_PERE: TfrxMemoView
          Align = baLeft
          Left = 634.582403770000000000
          Width = 79.370068980000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetMasterRX
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetMasterRX."IN_NACH_PERE">,MasterData1,2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoSumCUR_NACH: TfrxMemoView
          Align = baLeft
          Left = 713.952472750000100000
          Width = 83.149598979999990000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetMasterRX
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetMasterRX."CUR_NACH">,MasterData1,2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoSumCUR_PAY: TfrxMemoView
          Align = baLeft
          Left = 797.102071730000000000
          Width = 86.929128980000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetMasterRX
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetMasterRX."CUR_PAY">,MasterData1,2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoSumOUT_NACH_DOLG: TfrxMemoView
          Align = baLeft
          Left = 884.031200710000000000
          Width = 83.149598979999990000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetMasterRX
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetMasterRX."OUT_NACH_DOLG">,MasterData1,2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoSumOUT_NACH_PERE: TfrxMemoView
          Align = baLeft
          Left = 967.180799690000000000
          Width = 75.590538980000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetMasterRX
          DataSetName = 'frxDBDatasetMasterRX'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetMasterRX."OUT_NACH_PERE">,MasterData1,2)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 144
    Top = 72
  end
  object pFIBDataSetPrintDetail: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    DataSource = DataSourceMaster
    Left = 144
    Top = 40
    poSQLINT64ToBCD = True
  end
  object DataSourceMaster: TDataSource
    DataSet = pFIBDataSetPrintMaster
    Left = 112
    Top = 8
  end
  object frxDBDatasetDetails: TfrxDBDataset
    UserName = 'frxDBDatasetDetails'
    CloseDataSource = False
    DataSet = pFIBDataSetPrintDetail
    Left = 176
    Top = 40
  end
  object frxDBDatasetMaster: TfrxDBDataset
    UserName = 'frxDBDatasetMaster'
    CloseDataSource = False
    DataSet = pFIBDataSetPrintMaster
    Left = 176
    Top = 8
  end
  object pFIBStoredProcSaveRX: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 32
    Top = 32
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 32
  end
  object pFIBDataSetPrintMasterRX: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    Left = 312
    Top = 8
    poSQLINT64ToBCD = True
  end
  object frxDBDatasetMasterRX: TfrxDBDataset
    UserName = 'frxDBDatasetMasterRX'
    CloseDataSource = False
    DataSet = pFIBDataSetPrintMasterRX
    Left = 280
    Top = 8
  end
  object TimerReports: TTimer
    Enabled = False
    OnTimer = TimerReportsTimer
    Left = 208
    Top = 72
  end
  object pFIBDataSetPere: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    Left = 236
    Top = 72
    poSQLINT64ToBCD = True
  end
  object pFIBDataSetZad: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    Left = 268
    Top = 72
    poSQLINT64ToBCD = True
  end
  object frxDBDatasetPere: TfrxDBDataset
    UserName = 'frxDBDatasetPere'
    CloseDataSource = False
    DataSet = pFIBDataSetPere
    Left = 236
    Top = 104
  end
  object frxDBDatasetZad: TfrxDBDataset
    UserName = 'frxDBDatasetZad'
    CloseDataSource = False
    DataSet = pFIBDataSetZad
    Left = 268
    Top = 104
  end
  object pFIBDataSetPere2: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    Left = 300
    Top = 71
    poSQLINT64ToBCD = True
  end
  object frxDBDatasetPere2: TfrxDBDataset
    UserName = 'frxDBDatasetPere2'
    CloseDataSource = False
    DataSet = pFIBDataSetPere2
    Left = 300
    Top = 103
  end
  object pFIBDataSetZad2: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    Left = 332
    Top = 71
    poSQLINT64ToBCD = True
  end
  object frxDBDatasetZad2: TfrxDBDataset
    UserName = 'frxDBDatasetZad2'
    CloseDataSource = False
    DataSet = pFIBDataSetZad2
    Left = 332
    Top = 103
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Top = 64
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 32
    Top = 64
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 64
    Top = 64
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
    Top = 96
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 32
    Top = 96
  end
  object DataSet_diss: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    Left = 216
    Top = 40
    poSQLINT64ToBCD = True
  end
  object frxDataset_diss: TfrxDBDataset
    UserName = 'frxDBDatasetDiss'
    CloseDataSource = False
    DataSet = DataSet_diss
    Left = 248
    Top = 40
  end
end
