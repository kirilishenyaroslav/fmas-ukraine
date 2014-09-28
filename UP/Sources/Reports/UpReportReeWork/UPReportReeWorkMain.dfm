object frmUPReportReeWorkMain: TfrmUPReportReeWorkMain
  Left = 353
  Top = 250
  Width = 490
  Height = 123
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1088#1072#1094#1102#1102#1095#1080#1093
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
    Top = 70
    Width = 482
    Height = 19
    Panels = <>
  end
  object cxButtonFilter: TcxButton
    Left = 128
    Top = 24
    Width = 110
    Height = 25
    Action = FilterAction
    Caption = #1060#1110#1083#1100#1090#1088
    TabOrder = 1
  end
  object cxButtonPrint: TcxButton
    Left = 248
    Top = 24
    Width = 110
    Height = 25
    Action = PrintAction
    Caption = #1043#1072#1088#1072#1079#1076
    Enabled = False
    TabOrder = 2
  end
  object cxButtonClose: TcxButton
    Left = 368
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
    TimeoutAction = TACommit
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
    ReportOptions.LastChange = 39904.719135011580000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '       GroupNo: Integer;               // '#1085#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099
      
        '       MHeight: array of Extended;     // '#1084#1072#1089#1089#1080#1074' '#1074#1099#1089#1086#1090' '#1079#1072#1075#1086#1083#1086#1074#1086#1082 +
        ' '#1075#1088#1091#1087#1087#1099' + '#1087#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
      
        '       LastLine: Integer;              // '#1085#1086#1084#1077#1088' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1079#1072#1087#1080#1089#1080 +
        ' '#1074' '#1075#1083#1072#1074#1085#1086#1084' '#1085#1072#1073#1086#1088#1077
      '       FHeight: Extended;              // '#1074#1099#1089#1086#1090#1072' '#1080#1090#1086#1075#1086#1074
      '       LastGroup: Integer;             // '#1085#1086#1084#1077#1088' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1075#1088#1091#1087#1087#1099
      
        '       LastGroupOneRow: Boolean;       // '#1087#1086#1089#1083#1077#1076#1085#1103' '#1075#1088#1091#1087#1087#1072' '#1080#1079' '#1086#1076#1085 +
        #1086#1081' '#1089#1090#1088#1086#1082#1080'?'
      '       NeededHeight: Extended;         // '#1085#1091#1078#1085#1072#1103' '#1074#1099#1089#1086#1090#1072
      '       PLine:integer;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '       // '#1080#1085#1080#1094#1080#1072#1083#1080#1079#1080#1088#1086#1074#1072#1090#1100' '#1085#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099
      '       GroupNo := 0;'
      '       Pline:=0;'
      #19'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with MasterData1, Engine do'
      '  begin'
      '         // '#1087#1088#1086#1074#1077#1088#1080#1090#1100', '#1086#1076#1085#1072' '#1083#1080' '#1089#1090#1088#1086#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1074' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1075#1088#1091#1087#1087#1077
      '     if not FinalPass then'
      '            if <Line> > 1 then LastGroupOneRow := False'
      '            else LastGroupOneRow := True;'
      ''
      '         // '#1077#1089#1083#1080' '#1085#1077' '#1093#1074#1072#1090#1072#1077#1090' '#1084#1077#1089#1090#1072' '#1076#1083#1103' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1079#1072#1087#1080#1089#1080
      '         // '#1089' '#1080#1090#1086#1075#1072#1084#1080', '#1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1089#1090#1088#1072#1085#1080#1094#1091
      '     if FinalPass then'
      '        if ( <Line#> =  LastLine )'
      '           and ( FreeSpace < Height + FHeight )'
      '        then NewPage;'
      '  end'
      'end;'
      ''
      'procedure MasterData1OnAfterCalcHeight(Sender: TfrxComponent);'
      'begin'
      '       with MasterData1, Engine do'
      '       begin'
      '              // 1'#1081' '#1087#1088#1086#1093#1086#1076': '#1087#1088#1080#1073#1072#1074#1080#1090#1100' '#1082' '#1074#1099#1089#1086#1090#1077' '#1079#1072#1075#1086#1083#1086#1074#1082#1072' '#1075#1088#1091#1087#1087#1099
      '              // '#1074#1099#1089#1086#1090#1091' '#1087#1077#1088#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
      '          if not FinalPass and (<Line> = 1) then'
      '             MHeight[GroupNo] := MHeight[GroupNo] + Height;'
      ''
      '                // 1'#1081' '#1087#1088#1086#1093#1086#1076': '#1086#1073#1085#1086#1074#1080#1090#1100' '#1086#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1080#1089#1077#1081
      '          if not FinalPass then'
      '               LastLine := <Line#>;'
      '       end;'
      'end;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  with GroupHeader1, Engine do'
      '  begin'
      '         // '#1091#1074#1077#1083#1080#1095#1080#1090#1100' '#1085#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099
      '     inc(GroupNo);'
      '         // '#1086#1073#1085#1086#1074#1080#1090#1100' '#1085#1086#1084#1077#1088' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1075#1088#1091#1087#1087#1099
      '     if not FinalPass then LastGroup := GroupNo;'
      ''
      '         // 2'#1081' '#1087#1088#1086#1093#1086#1076': '#1077#1089#1083#1080' '#1085#1077' '#1093#1074#1072#1090#1072#1077#1090' '#1084#1077#1089#1090#1072' '#1076#1083#1103
      '         // '#1079#1072#1075#1086#1083#1086#1074#1082#1072' '#1075#1088#1091#1087#1087#1099' '#1080' '#1087#1077#1088#1074#1086#1081' '#1079#1072#1087#1080#1089#1080','
      '         // '#1087#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1089#1083#1077#1076#1091#1102#1097#1091#1102' '#1089#1090#1088#1072#1085#1080#1094#1091
      '         // '#1072' '#1077#1089#1083#1080' '#1075#1088#1091#1087#1087#1072' '#1087#1086#1089#1083#1077#1076#1085#1103#1103', '#1080' '#1090#1086#1083#1100#1082#1086' '#1086#1076#1085#1072
      '         // '#1089#1090#1088#1086#1082#1072' '#1089' '#1076#1072#1085#1085#1099#1084#1080', '#1087#1088#1086#1074#1077#1088#1080#1090#1100', '#1093#1074#1072#1090#1080#1090' '#1083#1080
      '         // '#1084#1077#1089#1090#1072' '#1076#1083#1103' '#1075#1088#1091#1087#1087#1099', '#1076#1072#1085#1085#1099#1093' '#1080' '#1080#1090#1086#1075#1086#1074
      '     if FinalPass then'
      '     begin'
      '       NeededHeight := MHeight[GroupNo];'
      '       if ( GroupNo = LastGroup ) and LastGroupOneRow then'
      '               NeededHeight := NeededHeight + FHeight;'
      ''
      '       if FreeSpace < NeededHeight then NewPage;'
      '     end;'
      '  end;'
      'end;'
      ''
      ''
      'procedure GroupHeader1OnAfterCalcHeight(Sender: TfrxComponent);'
      'begin'
      '       with GroupHeader1, Engine do'
      '       begin'
      '            // 1'#1081' '#1087#1088#1086#1093#1086#1076': '#1079#1072#1087#1086#1084#1085#1080#1090#1100' '#1074#1099#1089#1086#1090#1091' '#1079#1072#1075#1086#1083#1086#1074#1082#1072' '#1075#1088#1091#1087#1087#1099
      '            if not FinalPass then'
      '            begin'
      '                SetLength(MHeight, GroupNo+1);'
      '                MHeight[GroupNo] := Height;'
      '            end;'
      '       end;'
      'end;'
      ''
      
        'procedure ReportSummary1OnAfterCalcHeight(Sender: TfrxComponent)' +
        ';'
      'begin'
      '     // 1'#1081' '#1087#1088#1086#1093#1086#1076': '#1079#1072#1087#1086#1084#1085#1080#1090#1100' '#1074#1099#1089#1086#1090#1091' '#1080#1090#1086#1075#1086#1074
      '     with Engine, ReportSummary1 do'
      '     if not FinalPass and Visible then'
      '        FHeight := Height;'
      'end;'
      ''
      'procedure Memo1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' Pline:=Pline+1;'
      'end;'
      ''
      'begin'
      ''
      'end.')
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
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      OnBeforePrint = 'ReportTitle1OnBeforePrint'
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 332.598640000000000000
        Width = 1046.929810000000000000
        OnAfterCalcHeight = 'MasterData1OnAfterCalcHeight'
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        KeepChild = True
        KeepFooter = True
        KeepHeader = True
        KeepTogether = True
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[Pline]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 37.795300000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'FIO'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."FIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 287.244280000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'NAME_SEX'
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
            '[ReportDsetData."NAME_SEX"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 328.819110000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'BIRTH_DATE'
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
            '[ReportDsetData."BIRTH_DATE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 219.212740000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'TIN'
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
            '[ReportDsetData."TIN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 408.189240000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'BIRTH_PLACE'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."BIRTH_PLACE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 582.047620000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'ACTUAL_ADRESS'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."ACTUAL_ADRESS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 763.465060000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'PASPORT'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."PASPORT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 963.780150000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'PHONE'
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
            '[ReportDsetData."PHONE"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 291.023810000000000000
        Width = 1046.929810000000000000
        OnAfterCalcHeight = 'GroupHeader1OnAfterCalcHeight'
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = 'ReportDsetData."NAME_CAFEDRA"'
        ReprintOnNewPage = True
        Stretched = True
        object Memo14: TfrxMemoView
          Left = 400.630180000000000000
          Width = 646.299630000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 14869218
          DataField = 'NAME_CAFEDRA'
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_CAFEDRA"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Width = 408.189240000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 14869218
          DataSet = ReportDsetData
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_FACULTY"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 139.842610000000000000
        Width = 1046.929810000000000000
        PrintOnFirstPage = False
        object Memo8: TfrxMemoView
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [date]')
        end
        object Memo10: TfrxMemoView
          Left = 835.276130000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1086#1088'. [<Page>] '#1079' [<TotalPages>]')
        end
      end
      object Header1: TfrxHeader
        Height = 45.354360000000000000
        Top = 222.992270000000000000
        Width = 1046.929810000000000000
        ReprintOnNewPage = True
        object Memo16: TfrxMemoView
          Width = 37.795300000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 37.795300000000000000
          Width = 181.417440000000000000
          Height = 37.795300000000000000
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
            #1055'. '#1030'. '#1041'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 287.244280000000000000
          Width = 41.574830000000000000
          Height = 37.795300000000000000
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
            #1057#1090#1072#1090#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 328.819110000000000000
          Width = 79.370130000000000000
          Height = 37.795300000000000000
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
            #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 219.212740000000000000
          Width = 68.031540000000000000
          Height = 37.795300000000000000
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
            #1030#1076#1077#1085#1090#1080#1092'. '#1082#1086#1076)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 408.189240000000000000
          Width = 173.858380000000000000
          Height = 37.795300000000000000
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
            #1052#1110#1089#1094#1077' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 582.047620000000000000
          Width = 181.417440000000000000
          Height = 37.795300000000000000
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
            #1040#1076#1088#1077#1089#1072' '#1087#1086#1089#1090#1110#1081#1085#1086#1075#1086' '#1087#1088#1086#1078#1080#1074#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 763.465060000000000000
          Width = 200.315090000000000000
          Height = 37.795300000000000000
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
            #1055#1072#1089#1087#1086#1088#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 963.780150000000000000
          Width = 83.149660000000000000
          Height = 37.795300000000000000
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
            #1044#1086#1084#1072#1096#1085#1110#1081' '#1090#1077#1083#1077#1092#1086#1085)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 99.149660000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo11: TfrxMemoView
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1052#1072#1096'. '#1076#1072#1090#1072': [date]')
        end
        object Memo12: TfrxMemoView
          Left = 831.496600000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1086#1088'. [<Page>] '#1079' [<TotalPages>]')
        end
        object Memo13: TfrxMemoView
          Top = 52.913420000000000000
          Width = 1046.929810000000000000
          Height = 22.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            
              #1057#1087#1080#1089#1086#1082' '#1087#1088#1072#1094#1102#1102#1095#1080#1093' '#1074'  [ReportDsetData."FIRM_NAME_SHORT"] '#1085#1072' '#1076#1072#1090#1091'  ' +
              '[ReportDsetData."OUT_DATE_CHECK"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Top = 18.897650000000000000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          DataField = 'FIRM_NAME'
          DataSet = ReportDSetGlobalData
          DataSetName = 'ReportDsetGlobalData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[ReportDsetGlobalData."FIRM_NAME"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 22.677180000000000000
        Top = 411.968770000000000000
        Width = 1046.929810000000000000
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
    Left = 406
    Top = 53
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 440
    Top = 50
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
    Left = 374
    Top = 53
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
    Left = 368
    Top = 8
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 408
    Top = 16
  end
end
