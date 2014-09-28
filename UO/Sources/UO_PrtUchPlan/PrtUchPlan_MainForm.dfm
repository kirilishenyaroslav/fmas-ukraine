object fMainForm: TfMainForm
  Left = 192
  Top = 107
  Width = 465
  Height = 267
  Caption = 'fMainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object SpecBE: TcxButtonEdit
    Left = 160
    Top = 40
    Width = 185
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    TabOrder = 0
  end
  object FormObuchBE: TcxButtonEdit
    Left = 160
    Top = 72
    Width = 185
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = FormObuchBEPropertiesButtonClick
    TabOrder = 1
  end
  object KatStudBE: TcxButtonEdit
    Left = 160
    Top = 104
    Width = 185
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = KatStudBEPropertiesButtonClick
    TabOrder = 2
  end
  object GodNaboraBE: TcxButtonEdit
    Left = 160
    Top = 136
    Width = 185
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = GodNaboraBEPropertiesButtonClick
    TabOrder = 3
  end
  object SpecializME: TcxMaskEdit
    Left = 160
    Top = 168
    Width = 185
    Height = 21
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '\d+'
    Properties.MaxLength = 0
    Properties.OnChange = SpecializMEPropertiesChange
    TabOrder = 4
  end
  object cxLabel1: TcxLabel
    Left = 48
    Top = 48
    Width = 89
    Height = 17
    AutoSize = False
    TabOrder = 5
    Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
  end
  object cxLabel2: TcxLabel
    Left = 48
    Top = 72
    Width = 97
    Height = 17
    AutoSize = False
    TabOrder = 6
    Caption = #1060#1086#1088#1084#1072' '#1086#1073#1091#1095#1077#1085#1080#1103
  end
  object cxLabel3: TcxLabel
    Left = 48
    Top = 104
    Width = 110
    Height = 17
    TabOrder = 7
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1086#1073#1091#1095#1077#1085#1080#1103
  end
  object cxLabel4: TcxLabel
    Left = 48
    Top = 136
    Width = 105
    Height = 17
    AutoSize = False
    TabOrder = 8
    Caption = #1043#1086#1076' '#1085#1072#1073#1086#1088#1072
  end
  object cxLabel5: TcxLabel
    Left = 40
    Top = 168
    Width = 113
    Height = 17
    AutoSize = False
    TabOrder = 9
    Caption = 'ID_SPECIALIZATION'
  end
  object cxButton1: TcxButton
    Left = 144
    Top = 200
    Width = 161
    Height = 25
    Caption = #1054#1058#1063#1045#1058
    TabOrder = 10
    OnClick = cxButton1Click
  end
  object IsNullCB: TcxCheckBox
    Left = 352
    Top = 168
    Width = 65
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = IsNullCBPropertiesChange
    Properties.Caption = 'NULL'
    TabOrder = 11
  end
  object DB: TpFIBDatabase
    DBName = 'D:\Yatsishin\FILES\DB\UO_FULL_DB_POLTAVA.FDB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=win1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 48
    Top = 8
  end
  object DSetHeader: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID_SP_KURS,'
      '    ID_SP_UCH_PL_SEM,'
      '    ID_SP_SEMESTR,'
      '    ID_SP_TYPE_DISC_LESSON,'
      '    TRIVALIST,'
      '    NAME_KURS,'
      '    NAME_SEMESTR,'
      '    NAME_TYPE_DISC_LESSON'
      'FROM'
      '    UO_PRT_UCH_PL_HEADER'
      '    ('
      '    ?ID_SP_UCH_PLAN'
      '    ) ')
    Left = 352
    Top = 56
    poSQLINT64ToBCD = True
  end
  object DSetHeaderTypeLesson: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID_SP_TYPE_DISC_LESSON,'
      '    NAME'
      'FROM'
      '    UO_PRT_UCH_PL_HEADER_TYPE_LESS ')
    Left = 352
    Top = 88
    poSQLINT64ToBCD = True
  end
  object DSetHeaderControl: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID_SP_TYPE_CONTROL,'
      '    NAME'
      'FROM'
      '    UO_PRT_UCH_PL_HEADER_CONTROL ')
    Left = 352
    Top = 120
    poSQLINT64ToBCD = True
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39361.865589004600000000
    ReportOptions.LastChange = 39452.396943356480000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var iHoursNPP,iSemNPP:Integer;'
      '    iLastRow:Integer=-1;'
      ''
      'procedure ReportOnStartReport(Sender: TfrxComponent);'
      
        'var iLeft{, iLeft2, iLeft3}:Extended; // '#1055#1086#1079#1080#1094#1080#1080' '#1087#1086' '#1091#1088#1086#1074#1085#1103#1084' '#1074#1083#1086#1078 +
        #1077#1085#1085#1086#1089#1090#1080
      '    iNPP:Integer; // '#8470' '#1087'/'#1087
      
        '    ID_KURS, ID_SEM:Extended; // '#1058#1077#1082#1097#1080#1077' ID_SP_KURS '#1080' ID_SP_UCH_P' +
        'L_SEM,'
      '//  '#1090'.'#1082'. '#1089#1077#1084#1077#1089#1090#1088' '#1084#1086#1078#1077#1090' '#1073#1099#1090#1100' '#1088#1072#1079#1073#1080#1090' '#1085#1072' '#1085#1077#1089#1082#1086#1083#1100#1082#1086' '#1095#1072#1089#1090#1077#1081
      
        '    MK, MS:TfrxMemoView; // '#1058#1077#1082#1091#1097#1080#1077' '#1103#1095#1077#1081#1082#1080' '#1082#1091#1088#1089#1072' '#1080' '#1089#1077#1084#1077#1089#1090#1088#1072', '#1089#1086#1086 +
        #1090#1074'.'
      'begin'
      '  iNPP:=2;'
      '  iLeft:=MControl.Left;'
      '  MControlTitle.DataSet.First;'
      '  while not MControlTitle.DataSet.Eof do'
      '    begin'
      
        '      CreateMemo(MControl.Top,iLeft,MControl.Width,MControl.Heig' +
        'ht,'
      '                 <rDSHeaderControl."NAME">,MControl.Font.Name,'
      '                 MControl.Font.Size,MControl.Rotation);'
      ''
      
        '      CreateMemo(MControlNPP.Top,iLeft,MControlNPP.Width,MContro' +
        'lNPP.Height,'
      '                 IntToStr(iNPP),MControlNPP.Font.Name,'
      '                 MControlNPP.Font.Size,MControlNPP.Rotation);'
      '      iLeft:=iLeft+MControl.Width;'
      '      iNPP:=iNPP+1;'
      '      MControlTitle.DataSet.Next;'
      '    end;'
      '  MControlTitle.Width:=iLeft-MControlTitle.Left;'
      ''
      '  MHoursTitle.Left:=iLeft;'
      ''
      
        '  MHoursAll.Left:=iLeft;    //'#1047#1072#1075#1072#1083#1100#1085#1080#1081' '#1086#1073#1089#1103#1075' '#1090#1088#1091#1076#1086#1084#1110#1089#1090#1082#1086#1089#1090#1110' '#1085#1072#1074 +
        #1095#1072#1083#1100#1085#1086#1075#1086' '#1085#1072#1074#1072#1085#1090#1072#1078#1077#1085#1085#1103
      '  MHoursAllNPP.Left:=iLeft;'
      '  iLeft:=iLeft+MHoursAll.Width;'
      ''
      '  MCredits.Left:=iLeft;     //'#1050#1088#1077#1076#1080#1090#1080' ECTS'
      '  MCreditsNPP.Left:=iLeft;'
      '  iLeft:=iLeft+MCredits.Width;'
      ''
      '  MSRS.Left:=iLeft;         //'#1057#1056#1057
      '  MSRSNPP.Left:=iLeft;'
      '  iLeft:=iLeft+MSRS.Width;'
      ''
      '  MHoursAllAuditor.Left:=iLeft;  //'#1042#1089#1100#1086#1075#1086
      '  MHoursAllAuditorNPP.Left:=iLeft;'
      '  MAmongThem.Left:=iLeft;'
      '  iLeft:=iLeft+MHoursAllAuditor.Width;'
      ''
      '  MHoursAllNPP.Text:=IntToStr(iNPP);'
      '  MCreditsNPP.Text:=IntToStr(iNPP+1);'
      '  MSRSNPP.Text:=IntToStr(iNPP+2);'
      '  MHoursAllAuditorNPP.Text:=IntToStr(iNPP+3);'
      '  iNPP:=iNPP+4;'
      ''
      '  iHoursNPP:=iNPP-1;'
      ''
      '  MTeacher.Left:=iLeft;'
      ''
      '  MHoursTitle.DataSet.First;'
      '  while not MHoursTitle.DataSet.Eof do'
      '    begin'
      
        '      CreateMemo(MTypeLesson.Top,iLeft,MTypeLesson.Width,MTypeLe' +
        'sson.Height,'
      
        '                <rDSHeaderTypeLesson."NAME">,MTypeLesson.Font.Na' +
        'me,'
      '                 MTypeLesson.Font.Size,MTypeLesson.Rotation);'
      ''
      
        '      CreateMemo(MTypeLessonNPP.Top,iLeft,MTypeLessonNPP.Width,M' +
        'TypeLessonNPP.Height,'
      '                 IntToStr(iNPP),MTypeLessonNPP.Font.Name,'
      
        '                 MTypeLessonNPP.Font.Size,MTypeLessonNPP.Rotatio' +
        'n);'
      ''
      '      iLeft:=iLeft+MTypeLesson.Width;'
      '      iNPP:=iNPP+1;'
      '      MHoursTitle.DataSet.Next;'
      '    end;'
      
        '// '#1057#1082#1088#1099#1074#1072#1077#1084' '#1086#1073#1088#1072#1079#1077#1094', '#1085#1086' '#1085#1077' '#1091#1076#1072#1083#1103#1077#1084', '#1090'.'#1082'. '#1090#1086#1095#1085#1086' '#1079#1085#1072#1077#1084' '#1077#1075#1086' '#1080#1084#1103' '#1080' '#1074 +
        #1089#1077#1075#1076#1072' '#1084#1086#1078#1077#1084' '#1082' '#1085#1077#1084#1091' '#1086#1073#1088#1072#1090#1080#1090#1100#1089#1103
      '  MTypeLesson.Left:=iLeft;'
      '  MTypeLessonNPP.Left:=iLeft;'
      '  MTypeLesson.Visible:=False;'
      '  MTypeLessonNPP.Visible:=False;'
      ''
      '{  MTypeLessonNPP.Text:=IntToStr(iNPP);'
      '  iLeft:=iLeft+MTypeLesson.Width;'
      '  iNPP:=iNPP+1;              }'
      ''
      
        '  MAmongThem.Width:={MTypeLesson.Left+MTypeLesson.Width}iLeft-MA' +
        'mongThem.Left;'
      
        '  MHoursTitle.Width:={MTypeLesson.Left+MTypeLesson.Width}iLeft-M' +
        'HoursTitle.Left;'
      '  MTeacher.Width:=iLeft-MTeacher.Left;'
      ''
      '  iSemNPP:=iNPP-1;'
      ''
      '  MRozpodilTitle.Left:=iLeft;'
      '  MGodin.Left:=iLeft;'
      '  MKurs.Left:=iLeft;'
      '  MSem.Left:=iLeft;'
      '  MTL.Left:=iLeft;'
      '  MTLNPP.Left:=iLeft;'
      ''
      '  ID_KURS:=-1;'
      '  ID_SEM:=-1;'
      '  MK:=nil;'
      '  MS:=nil;'
      ''
      '  MRozpodilTitle.DataSet.First;'
      '  while not MRozpodilTitle.DataSet.Eof do'
      '    begin'
      '      if ID_KURS<><rDSHeader."ID_SP_KURS"> then'
      '        begin'
      '          ID_KURS:=<rDSHeader."ID_SP_KURS">;'
      '          if MK<>nil then'
      '            MK.Width:=iLeft-MK.Left;'
      
        '          MK:=CreateMemo(MKurs.Top,iLeft,MKurs.Width,MKurs.Heigh' +
        't,'
      '                 <rDSHeader."NAME_KURS">,MKurs.Font.Name,'
      '                 MKurs.Font.Size,MKurs.Rotation);'
      '        end;'
      ''
      '      if ID_SEM<><rDSHeader."ID_SP_SEMESTR"> then'
      '        begin'
      '          ID_SEM:=<rDSHeader."ID_SP_SEMESTR">;'
      '          if MS<>nil then'
      '            MS.Width:=iLeft-MS.Left;'
      '          MS:=CreateMemo(MSem.Top,iLeft,MSem.Width,MSem.Height,'
      
        '                 <rDSHeader."NAME_SEMESTR">+#13+<rDSHeader."TRIV' +
        'ALIST">,'
      '                 MSem.Font.Name,'
      '                 MSem.Font.Size,MSem.Rotation);'
      '        end;'
      ''
      '      CreateMemo(MTL.Top,iLeft,MTL.Width,MTL.Height,'
      
        '                 <rDSHeader."NAME_TYPE_DISC_LESSON">,MTL.Font.Na' +
        'me,'
      '                 MTL.Font.Size,MTL.Rotation);'
      ''
      '      CreateMemo(MTLNPP.Top,iLeft,MTLNPP.Width,MTLNPP.Height,'
      '                 IntToStr(iNPP),MTLNPP.Font.Name,'
      '                 MTLNPP.Font.Size,MTLNPP.Rotation);'
      ''
      '      iLeft:=iLeft+MTL.Width;'
      '      iNPP:=iNPP+1;'
      '      MRozpodilTitle.DataSet.Next;'
      '    end;'
      ''
      '  MRozpodilTitle.Width:=iLeft-MRozpodilTitle.Left;'
      '  MGodin.Width:=iLeft-MGodin.Left;'
      ''
      '          if MK<>nil then'
      '            MK.Width:=iLeft-MK.Left;'
      '          if MS<>nil then'
      '            MS.Width:=iLeft-MS.Left;'
      ''
      'end;'
      ''
      'function CreateMemo(xTop,xLeft,xWidth,xHeight: Extended;'
      
        '       xText,xFont_Name: String; xFont_Size, xRotation: Integer)' +
        ':TfrxMemoView;'
      'var'
      '  Memo: TfrxMemoView;'
      'begin'
      '  Memo := TfrxMemoView.Create(PageHeader1);'
      '  Memo.Top := xTop;'
      '  Memo.Left := xLeft;'
      '  Memo.Width := xWidth;'
      '  Memo.Height := xHeight;'
      '  Memo.Text := xText;'
      '  Memo.Frame.Typ := ftLeft  +ftRight + ftTop + ftBottom;'
      '  Memo.VAlign := vaCenter;'
      '  Memo.HAlign := haCenter;'
      '  Memo.Font.Name := xFont_Name;'
      '  Memo.Font.Size := xFont_Size;'
      '  Memo.Rotation := xRotation;'
      '  Result:=Memo;'
      'end;'
      ''
      
        'procedure DBCross1OnCalcWidth(ColumnIndex: Integer; ColumnValues' +
        ': Variant; var Width: Extended);'
      'begin'
      '  case ColumnIndex of'
      '    0:Width:=MShifr.Width;'
      '    1:Width:=MDisc.Width;'
      '    2..iHoursNPP-4:Width:=MControl.Width;'
      '    iHoursNPP-3:Width:=MHoursAll.Width;'
      '    iHoursNPP-2:Width:=MCredits.Width;'
      '    iHoursNPP-1:Width:=MSRS.Width;'
      '    iHoursNPP:Width:=MHoursAllAuditor.Width;'
      '    iHoursNPP+1..iSemNPP:Width:=MTypeLesson.Width;'
      '  else Width:=MTL.Width;'
      '  end;'
      'end;'
      ''
      
        'procedure DBCross1OnPrintCell(Memo: TfrxMemoView; RowIndex, Colu' +
        'mnIndex, CellIndex: Integer; RowValues, ColumnValues, Value: Var' +
        'iant);'
      'var i:Integer;'
      '    k:Variant;'
      'begin'
      '  if (RowIndex=0) and (ColumnIndex>1) then'
      '    Memo.Frame.Typ := ftBottom;'
      '  if (RowIndex=0) and (ColumnIndex<=1) then'
      '    begin'
      '      Memo.Color:=clSilver;'
      '      Memo.Font.Style:=fsBold;'
      '      Memo.Font.Size:=Memo.Font.Size-1;'
      '    end;'
      '  if Pos('#39'X'#39',Memo.Text)>0 then'
      '    begin'
      '      iLastRow:=RowIndex;'
      '      Memo.Text:='#39#39';'
      '    end;'
      
        '  if (iLastRow>-1) and (RowIndex=iLastRow) and (ColumnIndex<iHou' +
        'rsNPP-3) then'
      '      Memo.Frame.Typ := ftTop;'
      '  if (RowIndex=iLastRow) and (ColumnIndex=iHoursNPP-3) then'
      '    begin'
      '      Memo.Text:='#39#1042#1089#1100#1086#1075#1086#39';'
      '      Memo.Font.Style:=fsBold;'
      '      Memo.Font.Size:=Memo.Font.Size-3;'
      '    end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnStartReport = 'ReportOnStartReport'
    Left = 104
    Top = 192
    Datasets = <
      item
        DataSet = rDSDisc
        DataSetName = 'rDSDisc'
      end
      item
        DataSet = rDSHeader
        DataSetName = 'rDSHeader'
      end
      item
        DataSet = rDSHeaderControl
        DataSetName = 'rDSHeaderControl'
      end
      item
        DataSet = rDSHeaderTypeLesson
        DataSetName = 'rDSHeaderTypeLesson'
      end
      item
        DataSet = rDSMain
        DataSetName = 'rDSMain'
      end>
    Variables = <>
    Style = <>
    object Page2: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 420.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Memo1: TfrxMemoView
        Left = 495.118430000000000000
        Top = 94.488250000000000000
        Width = 359.055350000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          #1052#1030#1053#1030#1057#1058#1045#1056#1057#1058#1042#1054' '#1054#1057#1042#1030#1058#1048' '#1030' '#1053#1040#1059#1050#1048' '#1059#1050#1056#1040#1031#1053#1048)
        ParentFont = False
      end
      object Memo3: TfrxMemoView
        Left = 495.118430000000000000
        Top = 113.385900000000000000
        Width = 359.055350000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          #1044#1054#1053#1045#1062#1068#1050#1048#1049' '#1053#1040#1062#1030#1054#1053#1040#1051#1068#1053#1048#1049' '#1059#1053#1030#1042#1045#1056#1057#1048#1058#1045#1058)
        ParentFont = False
      end
      object Memo5: TfrxMemoView
        Left = 457.323130000000000000
        Top = 132.283550000000000000
        Width = 370.393940000000000000
        Height = 26.456710000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          #1056#1054#1041#1054#1063#1048#1049' '#1053#1040#1042#1063#1040#1051#1068#1053#1048#1049' '#1055#1051#1040#1053' '#1085#1072#1073#1086#1088#1091)
        ParentFont = False
      end
      object Memo6: TfrxMemoView
        Left = 835.276130000000000000
        Top = 132.283550000000000000
        Width = 151.181200000000000000
        Height = 26.456710000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          '2007 '#1088#1110#1082)
        ParentFont = False
      end
      object Memo7: TfrxMemoView
        Left = 411.968770000000000000
        Top = 170.078850000000000000
        Width = 90.708720000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          #1075#1072#1083#1091#1079#1100' '#1079#1085#1072#1085#1100':')
        ParentFont = False
      end
      object Memo8: TfrxMemoView
        Left = 411.968770000000000000
        Top = 192.756030000000000000
        Width = 124.724490000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          #1085#1072#1087#1088#1103#1084' '#1087#1110#1076#1075#1086#1090#1086#1074#1082#1080':')
        ParentFont = False
      end
      object Memo9: TfrxMemoView
        Left = 411.968770000000000000
        Top = 215.433210000000000000
        Width = 109.606370000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          #1092#1086#1088#1084#1072' '#1085#1072#1074#1095#1072#1085#1085#1103':')
        ParentFont = False
      end
      object Memo10: TfrxMemoView
        Left = 672.756340000000000000
        Top = 166.299320000000000000
        Width = 83.149660000000000000
        Height = 18.897650000000000000
        StretchMode = smMaxHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        Memo.Strings = (
          '0402 ')
        ParentFont = False
      end
      object Memo11: TfrxMemoView
        Left = 672.756340000000000000
        Top = 188.976500000000000000
        Width = 83.149660000000000000
        Height = 18.897650000000000000
        StretchMode = smMaxHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic, fsUnderline]
        Memo.Strings = (
          '6.040201')
        ParentFont = False
      end
      object Memo12: TfrxMemoView
        Left = 672.756340000000000000
        Top = 211.653680000000000000
        Width = 362.834880000000000000
        Height = 18.897650000000000000
        StretchMode = smMaxHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic, fsUnderline]
        Memo.Strings = (
          #1076#1077#1085#1085#1072)
        ParentFont = False
      end
      object Memo13: TfrxMemoView
        Left = 759.685530000000000000
        Top = 166.299320000000000000
        Width = 275.905690000000000000
        Height = 18.897650000000000000
        StretchMode = smMaxHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        Memo.Strings = (
          #1060#1110#1079#1080#1082#1086' '#1084#1072#1090#1077#1084#1072#1090#1080#1095#1085#1110' '#1085#1072#1091#1082#1080)
        ParentFont = False
      end
      object Memo14: TfrxMemoView
        Left = 759.685530000000000000
        Top = 188.976500000000000000
        Width = 275.905690000000000000
        Height = 18.897650000000000000
        StretchMode = smMaxHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic, fsUnderline]
        Memo.Strings = (
          ' '#1052#1072#1090#1077#1084#1072#1090#1080#1082#1072)
        ParentFont = False
      end
      object Memo15: TfrxMemoView
        Left = 18.897650000000000000
        Top = 109.606370000000000000
        Width = 90.708720000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          #1047#1072#1090#1074#1077#1088#1076#1078#1077#1085#1086)
        ParentFont = False
      end
      object Memo16: TfrxMemoView
        Left = 3.779530000000000000
        Top = 132.283550000000000000
        Width = 226.771800000000000000
        Height = 49.133890000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          
            #1085#1072' '#1079#1072#1089#1110#1076#1072#1085#1085#1110' '#1042#1095#1077#1085#1086#1111' '#1056#1072#1076#1080' '#1084#1072#1090#1077#1084#1072#1090#1080#1095#1085#1086#1075#1086' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1091' '#1044#1086#1085#1053#1059' '#1055#1088#1086#1090#1086#1082#1086#1083 +
            ' '#8470'______ '#1074#1110#1076' ___________ '#1088'.')
        ParentFont = False
      end
      object Memo17: TfrxMemoView
        Left = 3.779530000000000000
        Top = 196.535560000000000000
        Width = 336.378170000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1043#1086#1083#1086#1074#1072' '#1056#1072#1076#1080'_______________________________________')
        ParentFont = False
      end
      object Memo18: TfrxMemoView
        Left = 3.779530000000000000
        Top = 257.008040000000000000
        Width = 219.212740000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          #1054#1089#1074#1110#1090#1085#1100#1086'-'#1082#1074#1072#1083#1110#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1088#1110#1074#1077#1085#1100':')
        ParentFont = False
      end
      object Memo19: TfrxMemoView
        Left = 3.779530000000000000
        Top = 279.685220000000000000
        Width = 90.708720000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          #1050#1074#1072#1083#1110#1092#1110#1082#1072#1094#1110#1103':')
        ParentFont = False
      end
      object Memo20: TfrxMemoView
        Left = 3.779530000000000000
        Top = 302.362400000000000000
        Width = 124.724490000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          #1058#1077#1088#1084#1110#1085' '#1085#1072#1074#1095#1072#1085#1085#1103':')
        ParentFont = False
      end
      object Memo21: TfrxMemoView
        Left = 234.330860000000000000
        Top = 257.008040000000000000
        Width = 362.834880000000000000
        Height = 18.897650000000000000
        StretchMode = smMaxHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic, fsUnderline]
        Memo.Strings = (
          #1073#1072#1082#1072#1083#1072#1074#1088)
        ParentFont = False
      end
      object Memo22: TfrxMemoView
        Left = 234.330860000000000000
        Top = 279.685220000000000000
        Width = 362.834880000000000000
        Height = 18.897650000000000000
        StretchMode = smMaxHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic, fsUnderline]
        Memo.Strings = (
          #1073#1072#1082#1072#1083#1072#1074#1088' '#1079' '#1084#1072#1090#1077#1084#1072#1090#1080#1082#1080)
        ParentFont = False
      end
      object Memo23: TfrxMemoView
        Left = 234.330860000000000000
        Top = 302.362400000000000000
        Width = 362.834880000000000000
        Height = 18.897650000000000000
        StretchMode = smMaxHeight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic, fsUnderline]
        Memo.Strings = (
          '4 '#1088#1086#1082#1080)
        ParentFont = False
      end
      object Memo24: TfrxMemoView
        Top = 355.275820000000000000
        Width = 1511.812000000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          'I. '#1043#1088#1072#1092#1110#1082' '#1085#1072#1074#1095#1072#1083#1100#1085#1086#1075#1086' '#1087#1088#1086#1094#1077#1089#1091)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo25: TfrxMemoView
        Top = 377.953000000000000000
        Width = 1508.032470000000000000
        Height = 328.819110000000000000
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -35
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          #1042' '#1056#1054#1047#1056#1054#1041#1062#1030)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo26: TfrxMemoView
        Top = 721.890230000000000000
        Width = 604.724800000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          'II. '#1047#1074#1077#1076#1077#1085#1080#1081' '#1073#1102#1076#1078#1077#1090' '#1095#1072#1089#1091)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo27: TfrxMemoView
        Left = 982.677800000000000000
        Top = 718.110700000000000000
        Width = 219.212740000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          'III. '#1055#1088#1072#1082#1090#1080#1082#1080)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo28: TfrxMemoView
        Left = 971.339210000000000000
        Top = 899.528140000000000000
        Width = 241.889920000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          'IV. '#1044#1077#1088#1078#1072#1074#1085#1072' '#1072#1090#1077#1089#1090#1072#1094#1110#1103)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo29: TfrxMemoView
        Left = 668.976810000000000000
        Top = 744.567410000000000000
        Width = 842.835190000000000000
        Height = 113.385900000000000000
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -35
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          #1042' '#1056#1054#1047#1056#1054#1041#1062#1030)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo30: TfrxMemoView
        Left = 672.756340000000000000
        Top = 925.984850000000000000
        Width = 839.055660000000000000
        Height = 113.385900000000000000
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -35
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          #1042' '#1056#1054#1047#1056#1054#1041#1062#1030)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo31: TfrxMemoView
        Top = 748.346940000000000000
        Width = 604.724800000000000000
        Height = 291.023810000000000000
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -35
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          #1042' '#1056#1054#1047#1056#1054#1041#1062#1030)
        ParentFont = False
        VAlign = vaCenter
      end
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 420.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 8
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 181.417440000000000000
        Top = 18.897650000000000000
        Width = 1511.812000000000000000
        object MShifr: TfrxMemoView
          Align = baLeft
          Width = 37.795300000000000000
          Height = 151.181200000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1064#1080#1092#1088)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Top = 151.181200000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          VAlign = vaCenter
        end
        object MHoursAll: TfrxMemoView
          Left = 453.543600000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 132.283550000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1075#1072#1083#1100#1085#1080#1081' '#1086#1073#1089#1103#1075' '#1090#1088#1091#1076#1086#1084#1110#1089#1090#1082#1086#1089#1090#1110' '#1085#1072#1074#1095#1072#1083#1100#1085#1086#1075#1086' '#1085#1072#1074#1072#1085#1090#1072#1078#1077#1085#1085#1103)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 37.795300000000000000
          Top = 151.181200000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '2')
          VAlign = vaCenter
        end
        object MDisc: TfrxMemoView
          Left = 37.795300000000000000
          Width = 245.669450000000000000
          Height = 151.181200000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1076#1080#1089#1094#1080#1087#1083#1110#1085)
          ParentFont = False
          VAlign = vaCenter
        end
        object MHoursTitle: TfrxMemoView
          Left = 453.543600000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          DataSet = rDSHeaderTypeLesson
          DataSetName = 'rDSHeaderTypeLesson'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1043#1086#1076#1080#1085' '#1079#1072' '#1082#1088#1077#1076#1080#1090#1072#1084#1080' ECTS')
          ParentFont = False
          VAlign = vaCenter
        end
        object MControlTitle: TfrxMemoView
          Left = 283.464750000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          DataSet = rDSHeaderControl
          DataSetName = 'rDSHeaderControl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1087#1086#1076#1110#1083' '#1087#1086' '#1089#1077#1084#1077#1089#1090#1088#1072#1093)
          ParentFont = False
          VAlign = vaCenter
        end
        object MControlNPP: TfrxMemoView
          Left = 283.464750000000000000
          Top = 151.181200000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Visible = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          VAlign = vaCenter
        end
        object MControl: TfrxMemoView
          Left = 283.464750000000000000
          Top = 18.897650000000000000
          Width = 37.795300000000000000
          Height = 132.283550000000000000
          Visible = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1077#1082#1079#1072#1084#1077#1085)
          Rotation = 90
          VAlign = vaCenter
        end
        object MHoursAllNPP: TfrxMemoView
          Left = 453.543600000000000000
          Top = 151.181200000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          VAlign = vaCenter
        end
        object MHoursAllAuditor: TfrxMemoView
          Left = 582.047620000000000000
          Top = 37.795300000000000000
          Width = 37.795300000000000000
          Height = 113.385900000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          Rotation = 90
          VAlign = vaCenter
        end
        object MHoursAllAuditorNPP: TfrxMemoView
          Left = 582.047620000000000000
          Top = 151.181200000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          VAlign = vaCenter
        end
        object MAmongThem: TfrxMemoView
          Left = 582.047620000000000000
          Top = 18.897650000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1110#1079' '#1085#1080#1093)
          VAlign = vaCenter
        end
        object MTypeLesson: TfrxMemoView
          Left = 619.842920000000000000
          Top = 56.692950000000000000
          Width = 37.795300000000000000
          Height = 94.488250000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1056#1057)
          Rotation = 90
          VAlign = vaCenter
        end
        object MTypeLessonNPP: TfrxMemoView
          Left = 619.842920000000000000
          Top = 151.181200000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          VAlign = vaCenter
        end
        object MRozpodilTitle: TfrxMemoView
          Left = 793.701300000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DataSet = rDSHeader
          DataSetName = 'rDSHeader'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1087#1086#1076#1110#1083' '#1087#1086' '#1082#1091#1088#1089#1072#1084' '#1090#1072' '#1089#1077#1084#1077#1089#1090#1088#1072#1084)
          ParentFont = False
          VAlign = vaCenter
        end
        object MKurs: TfrxMemoView
          Left = 793.701300000000000000
          Top = 18.897650000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Visible = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1091#1088#1089)
        end
        object MSem: TfrxMemoView
          Left = 793.701300000000000000
          Top = 37.795300000000000000
          Width = 75.590600000000000000
          Height = 37.795300000000000000
          Visible = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1089#1077#1084#1077#1089#1090#1088' '#1090#1080#1078#1085#1110#1074)
          VAlign = vaCenter
        end
        object MGodin: TfrxMemoView
          Left = 793.701300000000000000
          Top = 132.283550000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1075#1086#1076#1080#1085' '#1074' '#1090#1080#1078#1076#1077#1085#1100)
          VAlign = vaCenter
        end
        object MTL: TfrxMemoView
          Left = 793.701300000000000000
          Top = 75.590600000000000000
          Width = 22.677180000000000000
          Height = 56.692950000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1088#1072#1082#1090'.')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object MTLNPP: TfrxMemoView
          Left = 793.701300000000000000
          Top = 151.181200000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Visible = False
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          VAlign = vaCenter
        end
        object MCredits: TfrxMemoView
          Left = 506.457020000000000000
          Top = 18.897650000000000000
          Width = 37.795300000000000000
          Height = 132.283550000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090#1080' ECTS')
          Rotation = 90
          VAlign = vaCenter
        end
        object MCreditsNPP: TfrxMemoView
          Left = 506.457020000000000000
          Top = 151.181200000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          VAlign = vaCenter
        end
        object MSRS: TfrxMemoView
          Left = 544.252320000000000000
          Top = 18.897650000000000000
          Width = 37.795300000000000000
          Height = 132.283550000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1056#1057)
          Rotation = 90
          VAlign = vaCenter
        end
        object MSRSNPP: TfrxMemoView
          Left = 544.252320000000000000
          Top = 151.181200000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          VAlign = vaCenter
        end
        object MTeacher: TfrxMemoView
          Left = 619.842920000000000000
          Top = 37.795300000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1079#1072#1085#1103#1090#1090#1103' '#1079' '#1074#1080#1082#1083#1072#1076#1072#1095#1072#1084#1080)
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 30.236240000000000000
        Top = 260.787570000000000000
        Width = 1511.812000000000000000
        DataSet = rDSDisc
        DataSetName = 'rDSDisc'
        RowCount = 0
        object DBCross1: TfrxDBCrossView
          Align = baWidth
          Width = 1511.812000000000000000
          Height = 18.897650000000000000
          Border = False
          DownThenAcross = False
          ShowColumnHeader = False
          ShowColumnTotal = False
          ShowRowHeader = False
          ShowRowTotal = False
          OnCalcWidth = 'DBCross1OnCalcWidth'
          OnPrintCell = 'DBCross1OnPrintCell'
          CellFields.Strings = (
            'VAL')
          ColumnFields.Strings = (
            'NPPC')
          DataSet = rDSMain
          DataSetName = 'rDSMain'
          RowFields.Strings = (
            'NPPR')
          Memos = {
            3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
            662D38223F3E3C63726F73733E3C63656C6C6D656D6F733E3C546672784D656D
            6F56696577204E616D653D2222204C6566743D2231302220546F703D22313022
            2057696474683D22343322204865696768743D2232322220416C6C6F77457870
            72657373696F6E733D2246616C736522204672616D652E5479703D2231352220
            476170583D22332220476170593D2233222048416C69676E3D22686143656E74
            657222204D656D6F2E546578743D223022205374796C653D2263656C6C222056
            416C69676E3D22766143656E746572222F3E3C2F63656C6C6D656D6F733E3C63
            6F6C756D6E6D656D6F733E3C546672784D656D6F56696577204E616D653D2222
            205461673D2231303022204C6566743D2235332220546F703D22313022205769
            6474683D2232303022204865696768743D2231303030302220416C6C6F774578
            7072657373696F6E733D2246616C736522204672616D652E5479703D22313522
            20476170583D22332220476170593D2233222048416C69676E3D22686143656E
            74657222204D656D6F2E546578743D2222205374796C653D22636F6C756D6E22
            2056416C69676E3D22766143656E746572222F3E3C2F636F6C756D6E6D656D6F
            733E3C636F6C756D6E746F74616C6D656D6F733E3C546672784D656D6F566965
            77204E616D653D2222205461673D2233303022204C6566743D22313334222054
            6F703D223130222057696474683D2232303022204865696768743D2231303030
            30222056697369626C653D2246616C73652220416C6C6F774578707265737369
            6F6E733D2246616C73652220466F6E742E436861727365743D22312220466F6E
            742E436F6C6F723D22302220466F6E742E4865696768743D222D31332220466F
            6E742E4E616D653D22417269616C2220466F6E742E5374796C653D2231222046
            72616D652E5479703D2231352220476170583D22332220476170593D22332220
            48416C69676E3D22686143656E74657222204D656D6F2E546578743D22477261
            6E6420546F74616C2220506172656E74466F6E743D2246616C73652220537479
            6C653D22636F6C6772616E64222056416C69676E3D22766143656E746572222F
            3E3C2F636F6C756D6E746F74616C6D656D6F733E3C726F776D656D6F733E3C54
            6672784D656D6F56696577204E616D653D2222205461673D2232303022204C65
            66743D2231302220546F703D223130222057696474683D223230302220486569
            6768743D2231303030302220416C6C6F7745787072657373696F6E733D224661
            6C736522204672616D652E5479703D2231352220476170583D22332220476170
            593D2233222048416C69676E3D22686143656E74657222204D656D6F2E546578
            743D2222205374796C653D22726F77222056416C69676E3D22766143656E7465
            72222F3E3C2F726F776D656D6F733E3C726F77746F74616C6D656D6F733E3C54
            6672784D656D6F56696577204E616D653D2222205461673D2234303022204C65
            66743D2231302220546F703D223332222057696474683D223230302220486569
            6768743D223130303030222056697369626C653D2246616C73652220416C6C6F
            7745787072657373696F6E733D2246616C73652220466F6E742E436861727365
            743D22312220466F6E742E436F6C6F723D22302220466F6E742E486569676874
            3D222D31332220466F6E742E4E616D653D22417269616C2220466F6E742E5374
            796C653D223122204672616D652E5479703D2231352220476170583D22332220
            476170593D2233222048416C69676E3D22686143656E74657222204D656D6F2E
            546578743D224772616E6420546F74616C2220506172656E74466F6E743D2246
            616C736522205374796C653D22726F776772616E64222056416C69676E3D2276
            6143656E746572222F3E3C2F726F77746F74616C6D656D6F733E3C63656C6C66
            756E6374696F6E733E3C6974656D20302F3E3C2F63656C6C66756E6374696F6E
            733E3C636F6C756D6E736F72743E3C6974656D20322F3E3C2F636F6C756D6E73
            6F72743E3C726F77736F72743E3C6974656D20322F3E3C2F726F77736F72743E
            3C2F63726F73733E}
        end
      end
    end
  end
  object rDSHeader: TfrxDBDataset
    UserName = 'rDSHeader'
    CloseDataSource = False
    DataSet = DSetHeader
    Left = 384
    Top = 56
  end
  object rDSHeaderTypeLesson: TfrxDBDataset
    UserName = 'rDSHeaderTypeLesson'
    CloseDataSource = False
    DataSet = DSetHeaderTypeLesson
    Left = 384
    Top = 88
  end
  object rDSHeaderControl: TfrxDBDataset
    UserName = 'rDSHeaderControl'
    CloseDataSource = False
    DataSet = DSetHeaderControl
    Left = 384
    Top = 120
  end
  object DSetMain: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    NPPR,'
      '    NPPC,'
      '    VAL'
      'FROM'
      '    UO_PRT_UCH_PLAN_DATA'
      '    ('
      '    ?ID_SP_UCH_PLAN,'
      '    ?ID_SP_CIKL_PIDG'
      '    ) ')
    DataSource = DSourceDisc
    Left = 352
    Top = 152
    poSQLINT64ToBCD = True
  end
  object rDSMain: TfrxDBDataset
    UserName = 'rDSMain'
    CloseDataSource = False
    DataSet = DSetMain
    Left = 384
    Top = 152
  end
  object DSetDisc: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID_SP_CIKL_PIDG,'
      '    NAME,'
      '    SHORT_NAME'
      'FROM'
      '    UO_UCH_PL_GET_CIKL_PIDG'
      '    ('
      '    ?ID_SP_UCH_PLAN'
      '    ) ')
    Left = 208
    Top = 192
    poSQLINT64ToBCD = True
  end
  object rDSDisc: TfrxDBDataset
    UserName = 'rDSDisc'
    CloseDataSource = False
    DataSet = DSetDisc
    Left = 240
    Top = 192
  end
  object DSetGetIdUchPl: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID_SP_UCH_PLAN'
      'FROM'
      '    UO_SP_UCH_PLAN_GET_ID'
      '    ('
      '    ?ID_SP_SPEC,'
      '    ?ID_SP_FORM_STUD,'
      '    ?ID_SP_KAT_STUD,'
      '    ?ID_GOD_NABORA,'
      '    ?ID_SP_SPECIALIZATION'
      '    ) ')
    Left = 176
    Top = 192
    poSQLINT64ToBCD = True
  end
  object DSourceDisc: TDataSource
    DataSet = DSetDisc
    Left = 272
    Top = 192
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 216
    Top = 136
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 80
    Top = 192
  end
end
