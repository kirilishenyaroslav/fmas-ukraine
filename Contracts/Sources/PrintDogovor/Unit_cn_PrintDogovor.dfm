object Form_cn_printDogovor: TForm_cn_printDogovor
  Left = 481
  Top = 284
  Width = 450
  Height = 140
  Caption = #1044#1088#1091#1082' '#1082#1086#1085#1090#1088#1072#1082#1090#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shablon: TLabel
    Left = 16
    Top = 16
    Width = 46
    Height = 13
    Caption = #1064#1072#1073#1083#1086#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button_print: TcxButton
    Left = 97
    Top = 72
    Width = 120
    Height = 25
    Caption = #1044#1088#1091#1082
    TabOrder = 0
    OnClick = Button_printClick
  end
  object Button_cancel: TcxButton
    Left = 225
    Top = 72
    Width = 120
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 1
    OnClick = Button_cancelClick
  end
  object PD_Box: TcxComboBox
    Left = 72
    Top = 11
    Width = 361
    Height = 24
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.OnChange = PD_BoxPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 2
  end
  object OnPrint: TcxCheckBox
    Left = 16
    Top = 40
    Width = 177
    Height = 24
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1085#1072' '#1087#1088#1080#1085#1090#1077#1088
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 3
  end
  object kol_exampl: TcxSpinEdit
    Left = 384
    Top = 40
    Width = 49
    Height = 24
    ParentFont = False
    Properties.MaxValue = 99.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 4
    Value = 1
  end
  object cxLabel1: TcxLabel
    Left = 272
    Top = 42
    Width = 102
    Height = 20
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 5
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1082#1086#1087#1110#1081
  end
  object PD_Database: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = PD_Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 72
  end
  object PD_Transaction: TpFIBTransaction
    DefaultDatabase = PD_Database
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 48
    Top = 72
  end
  object PD_DataSet: TpFIBDataSet
    Database = PD_Database
    Transaction = PD_Transaction
    SelectSQL.Strings = (
      'SELECT * FROM cn_dogovor_print(:Id_Dogovor,:cur_date)')
    Left = 88
    Top = 72
    poSQLINT64ToBCD = True
  end
  object PD_Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Copies = 2
    PrintOptions.Printer = 'Default'
    PrintOptions.Reverse = True
    ReportOptions.CreateDate = 39975.428839513900000000
    ReportOptions.LastChange = 40198.622333622700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var d1,m1,y1,d2,m2,y2:Word;'
      'procedure Memo190OnBeforePrint(Sender: TfrxComponent);'
      'var //d1,m1,y1,d2,m2,y2:Word;'
      '  d,m,y:Double;'
      'begin'
      '  memo190.text:='#39#39';'
      '  //DecodeDate(<PD_DBDataset."BEG_DOG">,y1,m1,d1);'
      '  DecodeDate(<PD_DBDataset."END_DOG">,y2,m2,d2);'
      '  y:=y2-y1;'
      '  m:=m2-m1;'
      '  d:=d2-d1;'
      '  if d>0 then'
      '          Begin'
      '            m:=m+1;'
      '          End;'
      '  if m<=0 then'
      '           begin'
      '             y:=y-1;'
      '             m:=m+12;'
      '           end;'
      '  if m>=10 then'
      '            begin'
      '              y:=y+1;'
      '              m:=0;'
      '            end;'
      '  if (y = 0)and (m<>0) then memo190.text:='#39'1'#39';'
      
        '  if (y<>0) and (m<>0) then memo190.text:=FloatToStr(y)+'#39','#39'+Floa' +
        'tToStr(m);'
      '  if (y<>0) and (m = 0)then memo190.text:=FloatToStr(y);'
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  DecodeDate(<PD_DBDataset."BEG_DOG">,y1,m1,d1);'
      '    if <PD_DBDataset_stage_opl."ID_TYPE_PAYER"> = 1 then'
      '   begin'
      '   if <PD_DBDataset_stage_opl."ID_TYPE_STAGE"> <> 4 then'
      '    begin'
      '    {'#1055#1083#1072#1090#1077#1083#1100#1097#1080#1082' '#1092#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086'}'
      
        '     if (<PD_DBDataset_stage_opl."YEAR1_BEG">='#39#39') and (<PD_DBDat' +
        'aset_stage_opl."YEAR1_END">='#39#39')'
      '     then Memo56.text:='#39#39' else'
      
        '     Memo56.text:=(<PD_DBDataset_stage_opl."YEAR1_BEG">)+'#39'/ '#39'+(<' +
        'PD_DBDataset_stage_opl."YEAR1_END">);'
      
        '     if (<PD_DBDataset_stage_opl."YEAR2_BEG">='#39#39') and (<PD_DBDat' +
        'aset_stage_opl."YEAR2_END">='#39#39')'
      '     then Memo53.text:='#39#39' else'
      
        '     Memo53.text:=(<PD_DBDataset_stage_opl."YEAR2_BEG">)+'#39'/ '#39'+(<' +
        'PD_DBDataset_stage_opl."YEAR2_END">);'
      
        '     if (<PD_DBDataset_stage_opl."YEAR3_BEG">='#39#39') and (<PD_DBDat' +
        'aset_stage_opl."YEAR3_END">='#39#39')'
      '     then Memo54.text:='#39#39' else'
      
        '     Memo54.text:=(<PD_DBDataset_stage_opl."YEAR3_BEG">)+'#39'/ '#39'+(<' +
        'PD_DBDataset_stage_opl."YEAR3_END">);'
      
        '     if (<PD_DBDataset_stage_opl."YEAR4_BEG">='#39#39') and (<PD_DBDat' +
        'aset_stage_opl."YEAR4_END">='#39#39')'
      '     then Memo55.text:='#39#39' else'
      
        '     Memo55.text:=(<PD_DBDataset_stage_opl."YEAR4_BEG">)+'#39'/ '#39'+(<' +
        'PD_DBDataset_stage_opl."YEAR4_END">);'
      
        '     if (<PD_DBDataset_stage_opl."YEAR5_BEG">='#39#39') and (<PD_DBDat' +
        'aset_stage_opl."YEAR5_END">='#39#39')'
      '     then Memo57.text:='#39#39' else'
      
        '     Memo57.text:=(<PD_DBDataset_stage_opl."YEAR5_BEG">)+'#39'/ '#39'+(<' +
        'PD_DBDataset_stage_opl."YEAR5_END">);'
      ''
      '     {'#1086#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1087#1077#1088#1077#1086#1076#1080#1095#1085#1086#1089#1090#1080' '#1086#1087#1083#1072#1090#1099'}'
      '     if <PD_DBDataset_stage_opl."ID_TYPE_STAGE"> = 1 then'
      '       begin'
      '         {'#1087#1086#1084#1077#1089#1103#1095#1085#1072#1103' '#1086#1087#1083#1072#1090#1072'}'
      
        '         if <PD_DBDataset_stage_opl."SUMM1"><>0 then Memo68.text' +
        ':=floattostr(<PD_DBDataset_stage_opl."NUM_MONTH1">)+'#39'x '#39'+floatto' +
        'str( <PD_DBDataset_stage_opl."SUMM1">)'
      '          else memo68.text:='#39#39';'
      
        '         if <PD_DBDataset_stage_opl."SUMM2"><>0 then Memo69.text' +
        ':= floattostr(<PD_DBDataset_stage_opl."NUM_MONTH2">)+'#39'x '#39'+floatt' +
        'ostr(<PD_DBDataset_stage_opl."SUMM2">)'
      '          else memo69.text:='#39#39';'
      
        '         if <PD_DBDataset_stage_opl."SUMM3"><>0 then Memo70.text' +
        ':=floattostr(<PD_DBDataset_stage_opl."NUM_MONTH3">)+'#39'x '#39'+floatto' +
        'str( <PD_DBDataset_stage_opl."SUMM3">)'
      '          else memo70.text:='#39#39';'
      
        '         if <PD_DBDataset_stage_opl."SUMM4"><>0 then Memo71.text' +
        ':=floattostr( <PD_DBDataset_stage_opl."NUM_MONTH4">)+'#39'x '#39'+floatt' +
        'ostr(<PD_DBDataset_stage_opl."SUMM4">)'
      '          else memo71.text:='#39#39';'
      
        '         if <PD_DBDataset_stage_opl."SUMM5"><>0 then Memo72.text' +
        ':=floattostr(<PD_DBDataset_stage_opl."NUM_MONTH5">) +'#39'x '#39'+floatt' +
        'ostr(<PD_DBDataset_stage_opl."SUMM5">)'
      '          else memo72.text:='#39#39';'
      '       end'
      '     else'
      '       begin'
      '         {'#1075#1086#1076#1086#1074#1072#1103'}'
      
        '         if <PD_DBDataset_stage_opl."SUMM1"> <> 0 then Memo63.te' +
        'xt:=<PD_DBDataset_stage_opl."SUMM1">'
      '         else memo63.text:='#39#39';'
      
        '         if <PD_DBDataset_stage_opl."SUMM2"> <> 0 then Memo64.te' +
        'xt:=<PD_DBDataset_stage_opl."SUMM2">'
      '         else memo64.text:='#39#39';'
      
        '         if <PD_DBDataset_stage_opl."SUMM3"> <> 0 then Memo65.te' +
        'xt:=<PD_DBDataset_stage_opl."SUMM3">'
      '         else memo65.text:='#39#39';'
      
        '         if <PD_DBDataset_stage_opl."SUMM4"> <> 0 then Memo66.te' +
        'xt:=<PD_DBDataset_stage_opl."SUMM4">'
      '         else memo66.text:='#39#39';'
      
        '         if <PD_DBDataset_stage_opl."SUMM5"> <> 0 then Memo67.te' +
        'xt:=<PD_DBDataset_stage_opl."SUMM5">'
      '         else memo67.text:='#39#39';'
      '       end;'
      '       {'#1089#1077#1084#1077#1089#1090#1088#1086#1074#1072#1103'}'
      
        '       if <PD_DBDataset_stage_opl."SUMM1_SEM1"> <> 0 then Memo93' +
        '.text:=<PD_DBDataset_stage_opl."SUMM1_SEM1">'
      '       else memo93.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM2_SEM1"> <> 0 then Memo94' +
        '.text:=<PD_DBDataset_stage_opl."SUMM2_SEM1">'
      '       else memo94.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM3_SEM1"> <> 0 then Memo95' +
        '.text:=<PD_DBDataset_stage_opl."SUMM3_SEM1">'
      '       else memo95.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM4_SEM1"> <> 0 then Memo96' +
        '.text:=<PD_DBDataset_stage_opl."SUMM4_SEM1">'
      '       else memo96.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM5_SEM1"> <> 0 then Memo97' +
        '.text:=<PD_DBDataset_stage_opl."SUMM5_SEM1">'
      '       else memo97.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM1_SEM2"> <> 0 then Memo98' +
        '.text:=<PD_DBDataset_stage_opl."SUMM1_SEM2">'
      '       else memo98.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM2_SEM2"> <> 0 then Memo99' +
        '.text:=<PD_DBDataset_stage_opl."SUMM2_SEM2">'
      '       else memo99.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM3_SEM2"> <> 0 then Memo10' +
        '0.text:=<PD_DBDataset_stage_opl."SUMM3_SEM2">'
      '       else memo100.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM4_SEM2"> <> 0 then Memo10' +
        '1.text:=<PD_DBDataset_stage_opl."SUMM4_SEM2">'
      '       else memo101.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM5_SEM2"> <> 0 then Memo10' +
        '2.text:=<PD_DBDataset_stage_opl."SUMM5_SEM2">'
      '       else memo102.text:='#39#39';'
      '    End'
      '     else'
      '      begin'
      '       memo147.text:=<PD_DBDataset."SUMM_DOG">;'
      '       memo30.text:='#39#1076#1086' 1 '#1078#1086#1074#1090#1085#1103' '#39'+ IntTostr(y1)+'#39' '#1088#1086#1082#1091#39';'
      '      End'
      '   end'
      '   else'
      '   begin'
      '    if <PD_DBDataset_stage_opl."ID_TYPE_STAGE"> <> 4 then'
      '    begin'
      '    {'#1055#1083#1072#1090#1077#1083#1100#1097#1080#1082' '#1102#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086'}'
      
        '     if (<PD_DBDataset_stage_opl."YEAR1_BEG">='#39#39') and (<PD_DBDat' +
        'aset_stage_opl."YEAR1_END">='#39#39')'
      '     then Memo58.text:='#39#39' else'
      
        '     Memo58.text:=(<PD_DBDataset_stage_opl."YEAR1_BEG">)+'#39'/ '#39'+(<' +
        'PD_DBDataset_stage_opl."YEAR1_END">);'
      
        '     if (<PD_DBDataset_stage_opl."YEAR2_BEG">='#39#39') and (<PD_DBDat' +
        'aset_stage_opl."YEAR2_END">='#39#39')'
      '     then Memo59.text:='#39#39' else'
      
        '     Memo59.text:=(<PD_DBDataset_stage_opl."YEAR2_BEG">)+'#39'/ '#39'+(<' +
        'PD_DBDataset_stage_opl."YEAR2_END">);'
      
        '     if (<PD_DBDataset_stage_opl."YEAR3_BEG">='#39#39') and (<PD_DBDat' +
        'aset_stage_opl."YEAR3_END">='#39#39')'
      '     then Memo60.text:='#39#39' else'
      
        '     Memo60.text:=(<PD_DBDataset_stage_opl."YEAR3_BEG">)+'#39'/ '#39'+(<' +
        'PD_DBDataset_stage_opl."YEAR3_END">);'
      
        '     if (<PD_DBDataset_stage_opl."YEAR4_BEG">='#39#39') and (<PD_DBDat' +
        'aset_stage_opl."YEAR4_END">='#39#39')'
      '     then Memo61.text:='#39#39' else'
      
        '     Memo61.text:=(<PD_DBDataset_stage_opl."YEAR4_BEG">)+'#39'/ '#39'+(<' +
        'PD_DBDataset_stage_opl."YEAR4_END">);'
      
        '     if (<PD_DBDataset_stage_opl."YEAR5_BEG">='#39#39') and (<PD_DBDat' +
        'aset_stage_opl."YEAR5_END">='#39#39')'
      '     then Memo62.text:='#39#39' else'
      
        '     Memo62.text:=(<PD_DBDataset_stage_opl."YEAR5_BEG">)+'#39'/ '#39'+(<' +
        'PD_DBDataset_stage_opl."YEAR5_END">);'
      ''
      '     {'#1086#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1087#1077#1088#1077#1086#1076#1080#1095#1085#1086#1089#1090#1080' '#1086#1087#1083#1072#1090#1099'}'
      '     if <PD_DBDataset_stage_opl."ID_TYPE_STAGE"> = 1 then'
      '      begin'
      '        {'#1087#1086#1084#1077#1089#1103#1095#1085#1072#1103' '#1086#1087#1083#1072#1090#1072'}'
      
        '        if <PD_DBDataset_stage_opl."SUMM1"><>0 then Memo73.text:' +
        '= floattostr(<PD_DBDataset_stage_opl."NUM_MONTH1">)+'#39'x '#39'+ floatt' +
        'ostr(<PD_DBDataset_stage_opl."SUMM1">)'
      '        else memo73.text:='#39#39';'
      
        '        if <PD_DBDataset_stage_opl."SUMM2"><>0 then Memo74.text:' +
        '= floattostr(<PD_DBDataset_stage_opl."NUM_MONTH2">)+'#39'x '#39'+floatto' +
        'str(<PD_DBDataset_stage_opl."SUMM2">)'
      '        else memo74.text:='#39#39';'
      
        '        if <PD_DBDataset_stage_opl."SUMM3"><>0 then Memo75.text:' +
        '= floattostr(<PD_DBDataset_stage_opl."NUM_MONTH3">)+'#39'x '#39'+floatto' +
        'str(<PD_DBDataset_stage_opl."SUMM3">)'
      '        else memo75.text:='#39#39';'
      
        '        if <PD_DBDataset_stage_opl."SUMM4"><>0 then Memo76.text:' +
        '= floattostr(<PD_DBDataset_stage_opl."NUM_MONTH4">)+'#39'x '#39'+floatto' +
        'str(<PD_DBDataset_stage_opl."SUMM4">)'
      '        else memo76.text:='#39#39';'
      
        '        if <PD_DBDataset_stage_opl."SUMM5"><>0 then Memo77.text:' +
        '=floattostr(<PD_DBDataset_stage_opl."NUM_MONTH5">)+'#39'x '#39'+floattos' +
        'tr(<PD_DBDataset_stage_opl."SUMM5">)'
      '        else memo77.text:='#39#39';'
      '      end'
      '     else'
      '      begin'
      '        {'#1075#1086#1076#1086#1074#1072#1103'}'
      
        '        if <PD_DBDataset_stage_opl."SUMM1"><>0 then Memo78.text:' +
        '=<PD_DBDataset_stage_opl."SUMM1">'
      '        else memo78.text:='#39#39';'
      
        '        if <PD_DBDataset_stage_opl."SUMM2"><>0 then Memo79.text:' +
        '=<PD_DBDataset_stage_opl."SUMM2">'
      '        else memo79.text:='#39#39';'
      
        '        if <PD_DBDataset_stage_opl."SUMM3"><>0 then Memo80.text:' +
        '=<PD_DBDataset_stage_opl."SUMM3">'
      '        else memo80.text:='#39#39';'
      
        '        if <PD_DBDataset_stage_opl."SUMM4"><>0 then Memo81.text:' +
        '=<PD_DBDataset_stage_opl."SUMM4">'
      '        else memo81.text:='#39#39';'
      
        '        if <PD_DBDataset_stage_opl."SUMM5"><>0 then Memo82.text:' +
        '=<PD_DBDataset_stage_opl."SUMM5">'
      '        else memo82.text:='#39#39';'
      '      end;'
      '       {'#1089#1077#1084#1077#1089#1090#1088#1086#1074#1072#1103'}'
      
        '       if <PD_DBDataset_stage_opl."SUMM1_SEM1"> <> 0 then Memo83' +
        '.text:=<PD_DBDataset_stage_opl."SUMM1_SEM1">'
      '       else memo83.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM2_SEM1"> <> 0 then Memo84' +
        '.text:=<PD_DBDataset_stage_opl."SUMM2_SEM1">'
      '       else memo84.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM3_SEM1"> <> 0 then Memo85' +
        '.text:=<PD_DBDataset_stage_opl."SUMM3_SEM1">'
      '       else memo85.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM4_SEM1"> <> 0 then Memo86' +
        '.text:=<PD_DBDataset_stage_opl."SUMM4_SEM1">'
      '       else memo86.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM5_SEM1"> <> 0 then Memo87' +
        '.text:=<PD_DBDataset_stage_opl."SUMM5_SEM1">'
      '       else memo87.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM1_SEM2"> <> 0 then Memo88' +
        '.text:=<PD_DBDataset_stage_opl."SUMM1_SEM2">'
      '       else memo88.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM2_SEM2"> <> 0 then Memo89' +
        '.text:=<PD_DBDataset_stage_opl."SUMM2_SEM2">'
      '       else memo89.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM3_SEM2"> <> 0 then Memo90' +
        '.text:=<PD_DBDataset_stage_opl."SUMM3_SEM2">'
      '       else memo90.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM4_SEM2"> <> 0 then Memo91' +
        '.text:=<PD_DBDataset_stage_opl."SUMM4_SEM2">'
      '       else memo91.text:='#39#39';'
      
        '       if <PD_DBDataset_stage_opl."SUMM5_SEM2"> <> 0 then Memo92' +
        '.text:=<PD_DBDataset_stage_opl."SUMM5_SEM2">'
      '       else memo92.text:='#39#39';'
      '    end'
      '     else'
      '      Begin'
      '       memo170.text:=<PD_DBDataset."SUMM_DOG">;'
      '       memo32.text:='#39#1076#1086' 1 '#1078#1086#1074#1090#1085#1103' '#39'+ IntTostr(y1)+'#39' '#1088#1086#1082#1091#39';'
      '      End'
      '   end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 376
    Datasets = <
      item
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
      end
      item
        DataSet = PD_BDataset_stage_opl
        DataSetName = 'PD_DBDataset_stage_opl'
      end>
    Variables = <
      item
        Name = 'Y_DOG'
        Value = #39'2009'#39
      end
      item
        Name = 'M_DOG'
        Value = #39#1042#1077#1088#1077#1089#1085#1103#39
      end
      item
        Name = 'D_DOG'
        Value = #39'30'#39
      end
      item
        Name = 'S_Y_PAS'
        Value = #39'2005'#39
      end
      item
        Name = 'S_M_PAS'
        Value = #39#1051#1080#1087#1085#1103#39
      end
      item
        Name = 'S_D_PAS'
        Value = #39'5'#39
      end
      item
        Name = 'FIZ_Y_PAS'
        Value = #39#39
      end
      item
        Name = 'FIZ_M_PAS'
        Value = #39#39
      end
      item
        Name = 'FIZ_D_PAS'
        Value = #39#39
      end
      item
        Name = 'PRED_Y_PAS'
        Value = #39#39
      end
      item
        Name = 'PRED_M_PAS'
        Value = #39#39
      end
      item
        Name = 'PRED_D_PAS'
        Value = #39#39
      end
      item
        Name = 'S_PAS_VIDAN_PAT1'
        Value = #39#1051#1045#1053#1030#1053#1057#1068#1050#1048#1052' '#1056#1042' '#1059#1052#1042#1057' '#1059#1050#1056#1040#1031#1053#1048' '#1059' '#1052'. '#39
      end
      item
        Name = 'S_PAS_VIDAN_PAT2'
        Value = #39#1044#1054#1053#1045#1062#1068#1050#1059#39
      end
      item
        Name = 'FIZ_PAS_VIDAN_PAT1'
        Value = #39#39
      end
      item
        Name = 'FIZ_PAS_VIDAN_PAT2'
        Value = #39#39
      end
      item
        Name = 'PRED_PAS_VIDAN_PAT1'
        Value = #39#39
      end
      item
        Name = 'PRED_PAS_VIDAN_PAT2'
        Value = #39#39
      end
      item
        Name = 'S_PROF'
        Value = #39#39
      end
      item
        Name = 'S_SPEC'
        Value = #39#1060#1030#1053#1040#1053#1057#1048#39
      end
      item
        Name = 'SUMM_IN_SEMESTR'
        Value = #39'0'#39
      end
      item
        Name = 'SUMM_YEAR1'
        Value = #39'0'#39
      end
      item
        Name = 'SUMM_YEAR2'
        Value = #39'0'#39
      end
      item
        Name = 'SUMM_YEAR3'
        Value = #39'0'#39
      end
      item
        Name = 'SUMM_YEAR4'
        Value = #39'0'#39
      end
      item
        Name = 'SUMM_YEAR1_SEM'
        Value = #39'0'#39
      end
      item
        Name = 'SUMM_YEAR2_SEM'
        Value = #39'0'#39
      end
      item
        Name = 'SUMM_YEAR3_SEM'
        Value = #39'0'#39
      end
      item
        Name = 'SUMM_YEAR4_SEM'
        Value = #39'0'#39
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
      Frame.Width = 1.500000000000000000
      OnBeforePrint = 'Page1OnBeforePrint'
      object Memo1: TfrxMemoView
        Top = 3.779530000000000000
        Width = 718.110700000000000000
        Height = 22.677180000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          #1044' '#1054' '#1043' '#1054' '#1042' '#1030' '#1056'   '#8470' [PD_DBDataset."NUM_DOG"]')
        ParentFont = False
      end
      object BarCode1: TfrxBarCodeView
        Left = 597.165740000000000000
        Top = 7.559060000000000000
        Width = 129.000000000000000000
        Height = 18.897650000000000000
        BarType = bcCode39
        Expression = '9800000399'
        Rotation = 0
        Text = '12345678'
        Zoom = 1.000000000000000000
      end
      object Overlay1: TfrxOverlay
        Height = 1039.370750000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo4: TfrxMemoView
          Left = 464.882190000000000000
          Top = 26.456710000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '"       "')
          ParentFont = False
        end
        object Memo133: TfrxMemoView
          Left = 472.441250000000000000
          Top = 26.456710000000000000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[D_DOG]')
          ParentFont = False
        end
        object Memo134: TfrxMemoView
          Left = 506.457020000000000000
          Top = 26.456710000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[M_DOG]')
          ParentFont = False
        end
        object Memo135: TfrxMemoView
          Left = 585.827150000000000000
          Top = 26.456710000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Y_DOG] ')
          ParentFont = False
        end
        object Memo189: TfrxMemoView
          Left = 650.079160000000000000
          Top = 26.456710000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1088'.')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1056#1054' '#1053#1040#1042#1063#1040#1053#1053#1071)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Top = 18.897650000000000000
          Width = 714.331170000000000000
          Height = 385.511449760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haBlock
          Memo.Strings = (
            
              '          '#1044#1086#1085#1077#1094#1100#1082#1080#1081' '#1085#1072#1094#1110#1086#1085#1072#1083#1100#1085#1080#1081' '#1091#1085#1110#1074#1077#1088#1089#1080#1090#1077#1090', '#1074' '#1086#1089#1086#1073#1110' '#1088#1077#1082#1090#1086#1088#1072' '#1064#1077 +
              #1074#1095#1077#1085#1082#1072' '#1042#1086#1083#1086#1076#1080#1084#1080#1088#1072' '#1055#1072#1074#1083#1086#1074#1080#1095#1072', '#1097#1086' '#1076#1110#1108' '#1085#1072' '#1087#1110#1076#1089#1090#1072#1074#1110
            #1057#1090#1072#1090#1091#1090#1091', '#1076#1072#1083#1110' "'#1042#1080#1082#1086#1085#1072#1074#1077#1094#1100'", '#1090#1072' '#1092#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072' '
            #1072#1073#1086' ('#1090#1072') '#1102#1088#1080#1076#1080#1095#1085#1072' '#1086#1089#1086#1073#1072' '
            
              ' '#1074' '#1086#1089#1086#1073#1110'                                                        ' +
              '                                      , '#1103#1082#1080#1081'('#1072') '#1076#1110#1108' '#1085#1072' '#1087#1110#1076#1089#1090#1072#1074#1110' '
            ' '
            #1091' '#1087#1086#1076#1072#1083#1100#1096#1086#1084#1091'  "'#1047#1072#1084#1086#1074#1085#1080#1082'('#1080')", '#1110' '#1075#1088'-'#1085', '
            
              #1091' '#1087#1086#1076#1072#1083#1100#1096#1086#1084#1091' "'#1057#1090#1091#1076#1077#1085#1090'", '#1076#1072#1083#1110' '#1088#1072#1079#1086#1084' '#1110#1084#1077#1085#1091#1102#1090#1100#1089#1103' '#1089#1090#1086#1088#1086#1085#1080', '#1091#1082#1083#1072#1083#1080' '#1094#1077 +
              #1081' '#1076#1086#1075#1086#1074#1110#1088' '#1087#1088#1086' '#1090#1072#1082#1077':'
            ' '
            
              #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100' '#1073#1077#1088#1077' '#1085#1072' '#1089#1077#1073#1077' '#1079#1086#1073#1086#1074#39#1103#1079#1072#1085#1085#1103' '#1079#1072' '#1088#1072#1093#1091#1085#1086#1082' '#1082#1086#1096#1090#1110#1074' '#1047#1072#1084#1086#1074#1085#1080#1082#1072 +
              '('#1110#1074') '#1079#1076#1110#1081#1089#1085#1080#1090#1080' '#1085#1072#1074#1095#1072#1085#1085#1103', '#1076#1072#1083#1110' - '#1086#1089#1074#1110#1090#1085#1103' '#1087#1086#1089#1083#1091#1075#1072', '
            
              #1057#1090#1091#1076#1077#1085#1090#1072' '#1079#1072' '#1086#1089#1074#1110#1090#1085#1100#1086'-'#1082#1074#1072#1083#1110#1092#1110#1082#1072#1094#1110#1081#1085#1080#1084' '#1088#1110#1074#1085#1077#1084'                     ' +
              '                                    '#1092#1086#1088#1084#1086#1102' '#1085#1072#1074#1095#1072#1085#1085#1103'             ' +
              '                     '
            
              '                                                                ' +
              '                                                                '
            
              #1079'           '#1082#1091#1088#1089#1091'                                               ' +
              '                                                                ' +
              '                                                         '#1092#1072#1082#1091#1083#1100#1090 +
              #1077#1090#1091
            #1079#1072' '#1089#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1102
            #1079#1075#1110#1076#1085#1086' '#1110#1079' '#1085#1072#1074#1095#1072#1083#1100#1085#1080#1084' '#1087#1083#1072#1085#1086#1084', '#1079#1072#1087#1088#1086#1087#1086#1085#1086#1074#1072#1085#1080#1084' '#1042#1080#1082#1086#1085#1072#1074#1094#1077#1084'.'
            #1054#1089#1074#1110#1090#1085#1103' '#1087#1086#1089#1083#1091#1075#1072' '#1079#1072' '#1094#1080#1084' '#1076#1086#1075#1086#1074#1086#1088#1086#1084' '#1079#1076#1086#1073#1091#1074#1072#1108#1090#1100#1089#1103' '#1057#1090#1091#1076#1077#1085#1090#1086#1084
            '  '
            ''
            #1054#1089#1074#1110#1090#1085#1103' '#1087#1086#1089#1083#1091#1075#1072' '#1079#1072' '#1094#1080#1084' '#1076#1086#1075#1086#1074#1086#1088#1086#1084' '#1085#1072#1076#1072#1108#1090#1100#1089#1103' '#1057#1090#1091#1076#1077#1085#1090#1091' '#1091' '#1079#1074#39#1103#1079#1082#1091' '#1079
            
              '                                                                ' +
              '                                                                ' +
              '                                               '
            ''
            
              ' 2.1.'#1056#1086#1079#1084#1110#1088' '#1087#1083#1072#1090#1080' '#1074#1089#1090#1072#1085#1086#1074#1083#1102#1108#1090#1100#1089#1103' '#1079#1072' '#1074#1077#1089#1100' '#1089#1090#1088#1086#1082' '#1085#1072#1076#1072#1085#1085#1103' '#1086#1089#1074#1110#1090#1085#1100#1086#1111 +
              ' '#1087#1086#1089#1083#1091#1075#1080' '#1110' '#1085#1077' '#1084#1086#1078#1077' '#1079#1084#1110#1085#1102#1074#1072#1090#1080#1089#1100'.'
            
              ' 2.2.'#1047#1072#1075#1072#1083#1100#1085#1072' '#1074#1072#1088#1090#1110#1089#1090#1100' '#1086#1089#1074#1110#1090#1085#1100#1086#1111' '#1087#1086#1089#1083#1091#1075#1080' '#1089#1090#1072#1085#1086#1074#1080#1090#1100'              ' +
              '                                           '#1075#1088#1080#1074#1077#1085#1100' '#1079#1072' '#1074#1077#1089#1100' '#1089#1090#1088#1086#1082 +
              ' '#1085#1072#1074#1095#1072#1085#1085#1103
            '(                       '#1088#1086#1082#1110#1074' '#1085#1072#1074#1095#1072#1085#1085#1103'). '
            
              ' 2.3.'#1055#1083#1072#1090#1072' '#1079#1072' '#1086#1089#1074#1110#1090#1085#1102' '#1087#1086#1089#1083#1091#1075#1091' '#1074#1085#1086#1089#1080#1090#1080#1089#1103' '#1047#1072#1084#1086#1074#1085#1080#1082#1086#1084' '#1079#1072' '#1081#1086#1075#1086' '#1074#1080#1073#1086#1088 +
              #1086#1084' '#1091' '#1088#1086#1079#1084#1110#1088#1110' '#1090#1072' '#1091' '#1089#1090#1088#1086#1082' '#1079#1072#1079#1085#1072#1095#1077#1085#1080#1081' '#1091' '#1090#1072#1073#1083#1080#1094#1110' ('#1087#1086#1074#1085#1110#1089#1090#1102' '#1086#1076#1085#1086#1088#1072#1079#1086#1074 +
              #1086', '#1072#1073#1086' '#1095#1072#1089#1090#1082#1072#1084#1080': '#1087#1086#1084#1110#1089#1103#1095#1085#1086', '#1087#1086' '#1089#1077#1084#1077#1089#1090#1088#1072#1093', '#1097#1086#1088#1110#1095#1085#1086'). ')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 253.228510000000000000
          Top = 34.015770000000010000
          Width = 461.102660000000000000
          Height = 15.118120000000000000
          DataSet = PD_DBDataset
          DataSetName = 'PD_DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PD_DBDataset."PAYER_FIO"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 49.133890000000000000
          Top = 64.252010000000000000
          Width = 306.141930000000000000
          Height = 15.118120000000000000
          DataField = 'JUR_PREDST_FIO'
          DataSet = PD_DBDataset
          DataSetName = 'PD_DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PD_DBDataset."JUR_PREDST_FIO"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 143.622140000000000000
          Top = 49.133889999999990000
          Width = 570.709030000000000000
          Height = 15.118120000000000000
          DataField = 'JUR_NAZV_PREDPR'
          DataSet = PD_DBDataset
          DataSetName = 'PD_DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PD_DBDataset."JUR_NAZV_PREDPR"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 495.118430000000000000
          Top = 64.252010000000000000
          Width = 219.212740000000000000
          Height = 15.118120000000000000
          DataField = 'JUR_NA_OSN_DOC'
          DataSet = PD_DBDataset
          DataSetName = 'PD_DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PD_DBDataset."JUR_NA_OSN_DOC"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 109.606370000000000000
          Top = 79.370130000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '('#1087#1086#1089#1072#1076#1072', '#1087#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103' '#1110' '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110')')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 211.653680000000000000
          Top = 94.488250000000000000
          Width = 502.677490000000000000
          Height = 15.118120000000000000
          DataField = 'STUD_FIO'
          DataSet = PD_DBDataset
          DataSetName = 'PD_DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PD_DBDataset."STUD_FIO"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 30.236240000000000000
          Top = 124.724490000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Memo.Strings = (
            '1.'#1055#1088#1077#1076#1084#1077#1090' '#1076#1086#1075#1086#1074#1086#1088#1091)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 268.346630000000000000
          Top = 155.716493940000000000
          Width = 170.078850000000000000
          Height = 15.118120000000000000
          DataField = 'S_KAT'
          DataSet = PD_DBDataset
          DataSetName = 'PD_DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PD_DBDataset."S_KAT"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 563.149970000000000000
          Top = 155.716493940000000000
          Width = 147.401670000000000000
          Height = 15.118120000000000000
          DataField = 'S_FORMSTUD'
          DataSet = PD_DBDataset
          DataSetName = 'PD_DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PD_DBDataset."S_FORMSTUD"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 279.685220000000000000
          Top = 170.078850000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '('#1073#1072#1082#1072#1083#1072#1074#1088', '#1089#1087#1077#1094#1110#1072#1083#1110#1089#1090', '#1084#1072#1075#1110#1089#1090#1088')')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 604.724800000000000000
          Top = 170.078850000000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '('#1076#1077#1085#1085#1072', '#1079#1072#1086#1095#1085#1072')')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 11.338590000000000000
          Top = 185.196970000000000000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          DataField = 'S_KURS'
          DataSet = PD_DBDataset
          DataSetName = 'PD_DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PD_DBDataset."S_KURS"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 83.149660000000000000
          Top = 188.976500000000000000
          Width = 551.811380000000000000
          Height = 15.118120000000000000
          DataField = 'S_FACUL'
          DataSet = PD_DBDataset
          DataSetName = 'PD_DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PD_DBDataset."S_FACUL"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 332.598640000000000000
          Top = 246.425155350000000000
          Width = 389.291590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              '('#1074#1087#1077#1088#1096#1077', '#1087#1077#1088#1077#1087#1110#1076#1075#1086#1090#1086#1074#1082#1072', '#1087#1072#1088#1072#1083#1077#1083#1100#1085#1077' '#1085#1072#1074#1095#1072#1085#1085#1103', '#1079#1072' '#1089#1082#1086#1088#1086#1095#1077#1085#1080#1084' '#1090#1077#1088#1084 +
              #1110#1085#1086#1084' '#1085#1072#1074#1095#1072#1085#1085#1103'.)')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 98.267780000000000000
          Top = 204.094620000000000000
          Width = 616.063390000000000000
          Height = 15.118120000000000000
          DataField = 'S_SPEC'
          DataSet = PD_DBDataset
          DataSetName = 'PD_DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PD_DBDataset."S_SPEC"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 343.937230000000000000
          Top = 234.330860000000000000
          Width = 370.393940000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 374.173470000000000000
          Top = 279.685220000000000000
          Width = 340.157700000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 476.220780000000000000
          Top = 291.023810000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '('#1087#1077#1088#1077#1074#1077#1076#1077#1085#1085#1103#1084', '#1087#1086#1085#1086#1074#1083#1077#1085#1085#1103#1084')')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 30.236240000000000000
          Top = 306.141930000000000000
          Width = 548.031850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Memo.Strings = (
            '2.'#1055#1083#1072#1090#1072' '#1079#1072' '#1085#1072#1076#1072#1085#1085#1103' '#1086#1089#1074#1110#1090#1085#1100#1086#1111' '#1087#1086#1089#1083#1091#1075#1080' '#1090#1072' '#1087#1086#1088#1103#1076#1086#1082' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1110#1074)
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 291.023810000000000000
          Top = 340.157700000000000000
          Width = 185.196970000000000000
          Height = 15.118120000000000000
          DataField = 'SUMM_DOG'
          DataSet = PD_DBDataset
          DataSetName = 'PD_DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PD_DBDataset."SUMM_DOG"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Top = 706.772110000000000000
          Width = 714.331170000000000000
          Height = 268.346630000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haBlock
          Memo.Strings = (
            
              #1055#1088#1080' '#1086#1087#1083#1072#1090#1110' '#1087#1086#1084#1110#1089#1103#1095#1085#1086' '#1088#1086#1079#1084#1110#1088' '#1087#1083#1072#1090#1080' '#1079#1072' '#1086#1089#1074#1110#1090#1085#1102' '#1087#1086#1089#1083#1091#1075#1091' '#1088#1086#1079#1088#1072#1093#1086#1074#1091#1108#1090 +
              #1100#1089#1103' '#1085#1072' 10 '#1084#1110#1089#1103#1094#1110#1074' ('#1074#1077#1088#1077#1089#1077#1085#1100'-'#1095#1077#1088#1074#1077#1085#1100') '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1088#1086#1082#1091'.'
            
              ' 2.4. '#1059' '#1088#1072#1079#1110' '#1087#1086#1088#1091#1096#1077#1085#1085#1103' '#1047#1072#1084#1086#1074#1085#1080#1082#1086#1084' '#1089#1090#1088#1086#1082#1110#1074' '#1087#1083#1072#1090#1077#1078#1110#1074' '#1074#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1093' ' +
              #1091' '#1087'.2.3. '#1094#1100#1086#1075#1086' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1087#1086#1085#1072#1076' '#1086#1076#1080#1085' '#1084#1110#1089#1103#1094#1100', '#1042#1080#1082#1086#1085#1072#1074#1077#1094#1100' '#1084#1072#1108' '#1087#1088#1072#1074#1086' ' +
              #1087#1088#1080#1087#1080#1085#1080#1090#1080' '#1085#1072#1074#1095#1072#1085#1085#1103' '#1057#1090#1091#1076#1077#1085#1090#1072' '#1090#1072' '#1074#1110#1076#1088#1072#1093#1086#1074#1091#1108' '#1081#1086#1075#1086'.'
            ''
            
              ' 3.1.'#1053#1072#1076#1072#1090#1080' '#1057#1090#1091#1076#1077#1085#1090#1091' '#1086#1089#1074#1110#1090#1085#1102' '#1087#1086#1089#1083#1091#1075#1091' '#1085#1072' '#1088#1110#1074#1085#1110' '#1076#1077#1088#1078#1072#1074#1085#1080#1093' '#1089#1090#1072#1085#1076#1072#1088#1090 +
              #1110#1074' '#1086#1089#1074#1110#1090#1080'.'
            
              ' 3.2.'#1047#1072#1073#1077#1079#1087#1077#1095#1080#1090#1080' '#1076#1086#1090#1088#1080#1084#1072#1085#1085#1103' '#1087#1088#1072#1074' '#1091#1095#1072#1089#1085#1080#1082#1110#1074' '#1085#1072#1074#1095#1072#1083#1100#1085#1086#1075#1086' '#1087#1088#1086#1094#1077#1089#1091' '#1074 +
              #1110#1076#1087#1086#1074#1110#1076#1085#1086' '#1076#1086' '#1079#1072#1082#1086#1085#1086#1076#1072#1074#1089#1090#1074#1072'.'
            ' 3.3.'#1042#1080#1076#1072#1090#1080' '#1057#1090#1091#1076#1077#1085#1090#1091' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1087#1088#1086' '#1086#1089#1074#1110#1090#1091' '#1076#1077#1088#1078#1072#1074#1085#1086#1075#1086' '#1079#1088#1072#1079#1082#1072'.'
            
              ' 3.4.'#1030#1085#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1047#1072#1084#1086#1074#1085#1080#1082#1072'('#1110#1074') '#1090#1072' '#1057#1090#1091#1076#1077#1085#1090#1072' '#1087#1088#1086' '#1087#1088#1072#1074#1080#1083#1072' '#1090#1072' '#1074#1080#1084#1086#1075#1080 +
              ' '#1097#1086#1076#1086' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111' '#1085#1072#1076#1072#1085#1085#1103' '#1086#1089#1074#1110#1090#1085#1100#1086#1111' '#1087#1086#1089#1083#1091#1075#1080', '#1111#1111' '#1103#1082#1086#1089#1090#1110' '#1090#1072' '#1079#1084#1110#1089#1090#1091 +
              ', '#1087#1088#1086' '#1087#1088#1072#1074#1072' '#1110' '#1086#1073#1086#1074#39#1103#1079#1082#1080' '#1089#1090#1086#1088#1110#1085' '#1087#1110#1076' '#1095#1072#1089' '#1085#1072#1076#1072#1085#1085#1103' '#1090#1072' '#1086#1090#1088#1080#1084#1072#1085#1085#1103' '#1090#1072#1082#1080 +
              #1093' '#1087#1086#1089#1083#1091#1075'.'
            
              ' 3.5.'#1059' '#1088#1072#1079#1110' '#1076#1086#1089#1090#1088#1086#1082#1086#1074#1086#1075#1086' '#1087#1088#1080#1087#1080#1085#1077#1085#1085#1103' '#1076#1110#1111' '#1076#1086#1075#1086#1074#1086#1088#1091' ('#1085#1077#1079#1072#1083#1077#1078#1085#1086' '#1074#1110#1076' ' +
              #1087#1110#1076#1089#1090#1072#1074' '#1076#1083#1103' '#1090#1072#1082#1086#1075#1086' '#1087#1088#1080#1087#1080#1085#1077#1085#1085#1103') '#1091' '#1079#1074#39#1103#1079#1082#1091' '#1079' '#1085#1077#1085#1072#1076#1072#1085#1085#1103#1084' '#1057#1090#1091#1076#1077#1085#1090#1091' '#1086 +
              #1089#1074#1110#1090#1085#1100#1086#1111' '#1087#1086#1089#1083#1091#1075#1080' - '#1087#1086#1074#1077#1088#1085#1091#1090#1080' '#1095#1072#1089#1090#1080#1085#1091' '#1082#1086#1096#1090#1110#1074', '#1097#1086' '#1073#1091#1083#1080' '#1074#1085#1077#1089#1077#1085#1110' '#1047#1072#1084 +
              #1086#1074#1085#1080#1082#1086#1084'('#1072#1084#1080') '#1103#1082' '#1087#1086#1087#1077#1088#1077#1076#1085#1103' '#1087#1083#1072#1090#1072' '#1079#1072' '#1085#1072#1076#1072#1085#1085#1103' '#1086#1089#1074#1110#1090#1085#1100#1086#1111' '#1087#1086#1089#1083#1091#1075#1080'.'
            ''
            
              ' 4.1.'#1057#1074#1086#1108#1095#1072#1089#1085#1086' '#1074#1085#1086#1089#1080#1090#1080' '#1087#1083#1072#1090#1091' '#1079#1072' '#1086#1090#1088#1080#1084#1072#1085#1091' '#1086#1089#1074#1110#1090#1085#1102' '#1087#1086#1089#1083#1091#1075#1091' '#1074' '#1088#1086#1079#1084#1110 +
              #1088#1072#1093' '#1090#1072' '#1091' '#1089#1090#1088#1086#1082#1080', '#1097#1086' '#1074#1089#1090#1072#1085#1086#1074#1083#1077#1085#1110' '#1088#1086#1079#1076#1110#1083#1086#1084' 2 '#1094#1100#1086#1075#1086' '#1044#1086#1075#1086#1074#1086#1088#1091'.'
            
              ' 4.2.'#1042#1080#1082#1086#1085#1091#1074#1072#1090#1080' '#1074#1080#1084#1086#1075#1080' '#1079#1072#1082#1086#1085#1086#1076#1072#1074#1089#1090#1074#1072' '#1090#1072' '#1089#1090#1072#1090#1091#1090#1091' '#1042#1080#1082#1086#1085#1072#1074#1094#1103' '#1079' '#1086#1088#1075#1072 +
              #1085#1110#1079#1072#1094#1110#1111' '#1085#1072#1076#1072#1085#1085#1103' '#1086#1089#1074#1110#1090#1085#1110#1093' '#1087#1086#1089#1083#1091#1075'.'
            
              ' 4.3.'#1047#1072#1084#1086#1074#1085#1080#1082' - '#1102#1088#1080#1076#1080#1095#1085#1072' '#1086#1089#1086#1073#1072' _________________________________' +
              '_______ '#1087#1110#1089#1083#1103' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1090#1077#1088#1084#1110#1085#1091' '#1085#1072#1074#1095#1072#1085#1085#1103' ')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Top = 415.748300000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1084#1086#1074#1085#1080#1082' - '#1092#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072)
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 359.055350000000000000
          Top = 415.748300000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1084#1086#1074#1085#1080#1082' - '#1102#1088#1080#1076#1080#1095#1085#1072' '#1086#1089#1086#1073#1072)
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Top = 434.645950000000000000
          Width = 283.464750000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1076#1085#1086#1088#1072#1079#1086#1074#1086)
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Top = 449.764070000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086' 1 '#1078#1086#1074#1090#1085#1103' '#1087#1077#1088#1096#1086#1075#1086' '#1088#1086#1082#1091' '#1085#1072#1074#1095#1072#1085#1085#1103)
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 359.055350000000000000
          Top = 449.764070000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086' 1 '#1078#1086#1074#1090#1085#1103' '#1087#1077#1088#1096#1086#1075#1086' '#1088#1086#1082#1091' '#1085#1072#1074#1095#1072#1085#1085#1103)
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 359.055350000000000000
          Top = 434.645950000000000000
          Width = 283.464750000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1076#1085#1086#1088#1072#1079#1086#1074#1086)
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Top = 468.661720000000000000
          Width = 45.354360000000000000
          Height = 64.252010000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1088#1110#1082' '#1085#1072#1074#1095#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 45.354360000000000000
          Top = 468.661720000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1097#1086#1088#1110#1095#1085#1086)
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 404.409710000000000000
          Top = 468.661720000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1097#1086#1088#1110#1095#1085#1086)
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 359.055350000000000000
          Top = 468.661720000000000000
          Width = 45.354360000000000000
          Height = 64.252010000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1088#1110#1082' '#1085#1072#1074#1095#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 283.464750000000000000
          Top = 468.661720000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1086#1084#1110#1089#1103#1095#1085#1086)
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 642.520100000000000000
          Top = 468.661720000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1086#1084#1110#1089#1103#1095#1085#1086)
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 120.944960000000000000
          Top = 468.661720000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1086' '#1089#1077#1084#1077#1089#1090#1088#1072#1093)
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 480.000310000000000000
          Top = 468.661720000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1086' '#1089#1077#1084#1077#1089#1090#1088#1072#1093)
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 45.354360000000000000
          Top = 487.559370000000000000
          Width = 75.590600000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086' 1 '#1078#1086#1074#1090#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 404.409710000000000000
          Top = 487.559370000000000000
          Width = 75.590600000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086' 1 '#1078#1086#1074#1090#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 283.464750000000000000
          Top = 487.559370000000000000
          Width = 75.590600000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086' 1 '#1095#1080#1089#1083#1072' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1084#1110#1089#1103#1094#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 642.520100000000000000
          Top = 487.559370000000000000
          Width = 75.590600000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086' 1 '#1095#1080#1089#1083#1072' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1084#1110#1089#1103#1094#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 120.944960000000000000
          Top = 487.559370000000000000
          Width = 81.259842520000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1086#1089#1110#1085#1085#1110#1081)
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 480.000310000000000000
          Top = 487.559370000000000000
          Width = 81.259842519685000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1086#1089#1110#1085#1085#1110#1081)
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 117.165430000000000000
          Top = 506.457020000000100000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086' 15 '#1074#1077#1088#1077#1089#1085#1103)
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 476.220780000000000000
          Top = 506.457020000000100000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086' 15 '#1074#1077#1088#1077#1089#1085#1103)
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 201.826771650000000000
          Top = 487.559370000000000000
          Width = 81.259842520000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1074#1077#1089#1085#1103#1085#1080#1081)
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 561.259837640000000000
          Top = 487.559370000000000000
          Width = 81.259842520000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1074#1077#1089#1085#1103#1085#1080#1081)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 200.315090000000000000
          Top = 506.457020000000100000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086' 1 '#1073#1077#1088#1077#1079#1085#1103)
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 563.149970000000000000
          Top = 506.457020000000100000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1076#1086' 1 '#1073#1077#1088#1077#1079#1085#1103)
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Top = 532.913730000000000000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Top = 563.149970000000100000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Top = 593.386210000000000000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Top = 623.622450000000000000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Top = 653.858690000000000000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 359.055350000000000000
          Top = 532.913730000000000000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 359.055350000000000000
          Top = 563.149970000000100000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo60: TfrxMemoView
          Left = 359.055350000000000000
          Top = 593.386210000000000000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 359.055350000000000000
          Top = 623.622450000000000000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 359.055350000000000000
          Top = 653.858690000000000000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 45.354360000000000000
          Top = 532.913730000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 45.354360000000000000
          Top = 563.149970000000100000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 45.354360000000000000
          Top = 593.386210000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 45.354360000000000000
          Top = 623.622450000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 45.354360000000000000
          Top = 653.858690000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 283.464750000000000000
          Top = 532.913730000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 283.464750000000000000
          Top = 563.149970000000100000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 283.464750000000000000
          Top = 593.386210000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 283.464750000000000000
          Top = 623.622450000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 283.464750000000000000
          Top = 653.858690000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 642.520100000000000000
          Top = 532.913730000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 642.520100000000000000
          Top = 563.149970000000100000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 642.520100000000000000
          Top = 593.386210000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 642.520100000000000000
          Top = 623.622450000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 642.520100000000000000
          Top = 653.858690000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 404.409710000000000000
          Top = 532.913730000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 404.409710000000000000
          Top = 563.149970000000100000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 404.409710000000000000
          Top = 593.386210000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 404.409710000000000000
          Top = 623.622450000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 404.409710000000000000
          Top = 653.858690000000000000
          Width = 75.590600000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 480.000310000000000000
          Top = 532.913730000000000000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 480.000310000000000000
          Top = 563.149970000000100000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 480.000310000000000000
          Top = 593.386210000000000000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 480.000310000000000000
          Top = 623.622450000000000000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 480.000310000000000000
          Top = 653.858690000000000000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 561.259842520000000000
          Top = 532.913730000000000000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo89: TfrxMemoView
          Left = 561.259842519685000000
          Top = 563.149970000000100000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 561.259842519685000000
          Top = 593.386210000000000000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo91: TfrxMemoView
          Left = 561.259842519685000000
          Top = 623.622450000000000000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo92: TfrxMemoView
          Left = 561.259842520000000000
          Top = 653.858690000000000000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 120.944960000000000000
          Top = 532.913730000000000000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 120.944960000000000000
          Top = 563.149970000000100000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 120.944960000000000000
          Top = 593.386210000000000000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Left = 120.944960000000000000
          Top = 623.622450000000000000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 120.944960000000000000
          Top = 653.858690000000000000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 202.204492520000000000
          Top = 532.913730000000000000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Left = 202.204492520000000000
          Top = 563.149970000000100000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo100: TfrxMemoView
          Left = 202.204492520000000000
          Top = 593.386210000000000000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo101: TfrxMemoView
          Left = 202.204492520000000000
          Top = 623.622450000000000000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo102: TfrxMemoView
          Left = 202.204492520000000000
          Top = 653.858690000000000000
          Width = 81.259842520000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo103: TfrxMemoView
          Left = 30.236220470000000000
          Top = 752.126470000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Memo.Strings = (
            ' 3.'#1054#1073#1086#1074#39#1103#1079#1082#1080' '#1042#1080#1082#1086#1085#1072#1074#1094#1103)
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 200.315090000000000000
          Top = 963.780150000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1079#1086#1073#1086#1074#39#1103#1079#1091#1108#1090#1100#1089#1103', '#1085#1077' '#1079#1086#1073#1086#1074#39#1103#1079#1091#1108#1090#1100#1089#1103' ('#1085#1077#1086#1073#1093#1110#1076#1085#1086' '#1074#1087#1080#1089#1072#1090#1080')')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 359.055350000000000000
          Top = 415.748300000000000000
          Height = 268.346630000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Memo190: TfrxMemoView
          Left = 7.559060000000000000
          Top = 355.275820000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo190OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          HideZeros = True
          ParentFont = False
        end
        object Memo191: TfrxMemoView
          Left = 30.236220472440900000
          Top = 888.189550000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Memo.Strings = (
            ' 4.'#1054#1073#1086#1074#39#1103#1079#1082#1080' '#1047#1072#1084#1086#1074#1085#1080#1082#1072)
          ParentFont = False
        end
        object Memo193: TfrxMemoView
          Left = 343.937230000000000000
          Top = 234.330860000000000000
          Width = 370.393940000000000000
          Height = 18.897650000000000000
          DataField = 'S_FORMPOSLUG'
          DataSet = PD_DBDataset
          DataSetName = 'PD_DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[PD_DBDataset."S_FORMPOSLUG"]')
          ParentFont = False
        end
        object Memo192: TfrxMemoView
          Left = 374.173470000000000000
          Top = 279.685220000000000000
          Width = 340.157577950000000000
          Height = 18.897650000000000000
          DataField = 'NAME_ACTION'
          DataSet = PD_DBDataset
          DataSetName = 'PD_DBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[PD_DBDataset."NAME_ACTION"]')
          ParentFont = False
        end
        object Memo147: TfrxMemoView
          Left = 283.464750000000000000
          Top = 434.645950000000000000
          Width = 75.590600000000000000
          Height = 34.015770000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo170: TfrxMemoView
          Left = 642.520100000000000000
          Top = 434.645950000000000000
          Width = 75.590600000000000000
          Height = 34.015770000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Memo105: TfrxMemoView
        Width = 718.110700000000000000
        Height = 627.401980000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          ''
          
            '  5.1.'#1059' '#1087#1086#1074#1085#1086#1084#1091' '#1086#1073#1089#1103#1079#1110' '#1074#1080#1082#1086#1085#1091#1074#1072#1090#1080', '#1074#1080#1084#1086#1075#1080' '#1085#1072#1074#1095#1072#1083#1100#1085#1086#1075#1086' '#1087#1083#1072#1085#1091'. '#1054#1074#1086 +
            #1083#1086#1076#1110#1090#1080' '#1087#1088#1072#1082#1090#1080#1095#1085#1080#1084#1080' '#1085#1072#1074#1080#1095#1082#1072#1084#1080', '#1087#1088#1086#1092#1077#1089#1110#1081#1085#1086#1102' '#1084#1072#1081#1089#1090#1077#1088#1085#1110#1089#1090#1102' '#1079#1075#1110#1076#1085#1086' '#1079' ' +
            #1086#1073#1088#1072#1085#1086#1102' '#1089#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1102'. '#1044#1086#1076#1077#1088#1078#1091#1074#1072#1090#1080#1089#1103' '#1057#1090#1072#1090#1091#1090#1091' '#1110' '#1055#1088#1072#1074#1080#1083' '#1074#1085#1091#1090#1088#1110#1096#1085#1100#1086 +
            #1075#1086' '#1088#1086#1079#1087#1086#1088#1103#1076#1082#1091' '#1042#1080#1082#1086#1085#1072#1074#1094#1103' '#1090#1072' '#1079#1072#1075#1072#1083#1100#1085#1086#1087#1088#1080#1081#1085#1103#1090#1080#1093' '#1091' '#1089#1091#1089#1087#1110#1083#1100#1089#1090#1074#1110' '#1084#1086#1088#1072#1083 +
            #1100#1085#1086'-'#1077#1090#1080#1095#1085#1080#1093' '#1085#1086#1088#1084' '#1087#1086#1074#1077#1076#1110#1085#1082#1080'. '
          
            '  5.2.'#1047#1072' '#1074#1080#1084#1086#1075#1072#1084#1080' '#1047#1072#1084#1086#1074#1085#1080#1082#1072' - '#1102#1088#1080#1076#1080#1095#1085#1086#1111' '#1086#1089#1086#1073#1080' '#1087#1088#1086#1093#1086#1076#1080#1090#1080' '#1074#1080#1088#1086#1073#1085#1080#1095 +
            #1091' '#1090#1072' '#1110#1085#1096#1110' '#1087#1088#1072#1082#1090#1080#1082#1080' '#1085#1072' '#1081#1086#1075#1086' '#1073#1072#1079#1110'. '#1047#1072#1093#1080#1089#1090#1080#1090#1080' '#1076#1080#1087#1083#1086#1084#1085#1091' '#1088#1086#1073#1086#1090#1091' '#1079#1072' '#1090#1077 +
            #1084#1086#1102', '#1079#1072#1087#1088#1086#1087#1086#1085#1086#1074#1072#1085#1086#1102' '#1047#1072#1084#1086#1074#1085#1080#1082#1086#1084' - '#1102#1088#1080#1076#1080#1095#1085#1086#1102' '#1086#1089#1086#1073#1086#1102' '#1072#1073#1086' '#1074#1110#1076#1087#1086#1074#1110#1076#1085#1086 +
            #1102' '#1082#1072#1092#1077#1076#1088#1086#1102' '#1079#1072' '#1087#1086#1075#1086#1076#1078#1077#1085#1085#1103#1084' '#1110#1079' '#1047#1072#1084#1086#1074#1085#1080#1082#1086#1084' - '#1102#1088#1080#1076#1080#1095#1085#1086#1102' '#1086#1089#1086#1073#1086#1102'.'
          
            '  5.3.'#1047#1072' '#1074#1080#1084#1086#1075#1086#1102' '#1047#1072#1084#1086#1074#1085#1080#1082#1072' - '#1102#1088#1080#1076#1080#1095#1085#1086#1111' '#1086#1089#1086#1073#1080' '#1087#1088#1080#1073#1091#1090#1080' '#1085#1072' '#1087#1110#1076#1087#1088#1080#1108#1084 +
            #1089#1090#1074#1086' '#1110' '#1088#1086#1079#1087#1086#1095#1072#1090#1080' '#1088#1086#1073#1086#1090#1091' '#1085#1072' '#1087#1086#1089#1072#1076#1110'.'
          ''
          
            '  6.1.'#1047#1072' '#1085#1077#1074#1080#1082#1086#1085#1072#1085#1085#1103' '#1072#1073#1086' '#1085#1077#1085#1072#1083#1077#1078#1085#1077' '#1074#1080#1082#1086#1085#1072#1085#1085#1103' '#1079#1086#1073#1086#1074#39#1103#1079#1072#1085#1100' '#1079#1072' '#1094#1080#1084' ' +
            #1076#1086#1075#1086#1074#1086#1088#1086#1084' '#1089#1090#1086#1088#1086#1085#1080' '#1085#1077#1089#1091#1090#1100' '#1074#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1110#1089#1090#1100' '#1079#1075#1110#1076#1085#1086' '#1079' '#1095#1080#1085#1085#1080#1084' '#1079#1072#1082#1086#1085#1086 +
            #1076#1072#1074#1089#1090#1074#1086#1084'.'
          
            '  6.2.'#1047#1072' '#1087#1086#1088#1091#1096#1077#1085#1085#1103' '#1089#1090#1088#1086#1082#1110#1074', '#1087#1077#1088#1077#1076#1073#1072#1095#1077#1085#1080#1093' '#1087'.2.3. '#1094#1100#1086#1075#1086' '#1044#1086#1075#1086#1074#1086#1088#1091', ' +
            #1074#1085#1077#1089#1077#1085#1085#1103' '#1087#1083#1072#1090#1080' '#1079#1072' '#1085#1072#1076#1072#1085#1085#1103' '#1086#1089#1074#1110#1090#1085#1100#1086#1111' '#1087#1086#1089#1083#1091#1075#1080' '#1047#1072#1084#1086#1074#1085#1080#1082'('#1080') '#1089#1087#1083#1072#1095#1091#1108'(' +
            #1102#1090#1100') '#1042#1080#1082#1086#1085#1072#1074#1094#1102' '#1087#1077#1085#1102', '#1110#1079' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091' '#1087#1086#1076#1074#1110#1081#1085#1086#1111' '#1086#1073#1083#1110#1082#1086#1074#1086#1111' '#1089#1090#1072#1074#1082#1080' '#1053#1072 +
            #1094#1110#1086#1085#1072#1083#1100#1085#1086#1075#1086' '#1073#1072#1085#1082#1091' '#1059#1082#1088#1072#1111#1085#1080', '#1097#1086' '#1076#1110#1103#1083#1072' '#1091' '#1087#1077#1088#1110#1086#1076', '#1079#1072' '#1103#1082#1080#1081' '#1089#1087#1083#1072#1095#1091#1108#1090#1100#1089 +
            #1103' '#1087#1077#1085#1103', '#1074#1110#1076' '#1089#1091#1084#1080' '#1087#1088#1086#1089#1090#1088#1086#1095#1077#1085#1086#1075#1086' '#1087#1083#1072#1090#1077#1078#1091' '#1079#1072' '#1082#1086#1078#1085#1080#1081' '#1076#1077#1085#1100' '#1087#1086#1088#1091#1096#1077#1085#1085#1103' ' +
            #1090#1077#1088#1084#1110#1085#1091' '#1086#1087#1083#1072#1090#1080', '#1074#1082#1083#1102#1095#1072#1102#1095#1080' '#1076#1077#1085#1100' '#1086#1087#1083#1072#1090#1080'.'
          ''
          '  7.1. '#1044#1110#1103' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1087#1088#1080#1087#1080#1085#1103#1108#1090#1100#1089#1103':'
          '  7.1.1. '#1079#1072' '#1079#1075#1086#1076#1086#1102' '#1089#1090#1086#1088#1110#1085';'
          
            '  7.1.2. '#1103#1082#1097#1086' '#1074#1080#1082#1086#1085#1072#1085#1085#1103' '#1089#1090#1086#1088#1086#1085#1086#1102' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1089#1074#1086#1111#1093' '#1079#1086#1073#1086#1074#39#1103#1079#1072#1085#1100' '#1108' '#1085#1077 +
            #1084#1086#1078#1083#1080#1074#1080#1084' '#1091' '#1079#1074#39#1103#1079#1082#1091' '#1079' '#1087#1088#1080#1081#1085#1103#1090#1090#1103#1084' '#1085#1086#1088#1084#1072#1090#1080#1074#1085#1086'-'#1087#1088#1072#1074#1086#1074#1080#1093' '#1072#1082#1090#1110#1074', '#1097#1086' '#1079#1084 +
            #1110#1085#1080#1083#1080' '#1091#1084#1086#1074#1080', '#1074#1089#1090#1072#1085#1086#1074#1083#1077#1085#1110' '#1076#1086#1075#1086#1074#1086#1088#1086#1084' '#1097#1086#1076#1086' '#1086#1089#1074#1110#1090#1085#1100#1086#1111' '#1087#1086#1089#1083#1091#1075#1080', '#1110' '#1073#1091#1076 +
            #1100'-'#1103#1082#1072' '#1110#1079' '#1089#1090#1086#1088#1110#1085' '#1085#1077' '#1087#1086#1075#1086#1076#1078#1091#1108#1090#1100#1089#1103' '#1087#1088#1086' '#1074#1085#1077#1089#1077#1085#1085#1103' '#1079#1084#1110#1085' '#1076#1086' '#1076#1086#1075#1086#1074#1086#1088#1091'; '
          
            '  7.1.3. '#1091' '#1088#1072#1079#1110' '#1083#1110#1082#1074#1110#1076#1072#1094#1110#1111' '#1102#1088#1080#1076#1080#1095#1085#1086#1111' '#1086#1089#1086#1073#1080' - '#1047#1072#1084#1086#1074#1085#1080#1082#1072' '#1072#1073#1086' '#1042#1080#1082#1086#1085 +
            #1072#1074#1094#1103', '#1103#1082#1097#1086' '#1085#1077' '#1074#1080#1079#1085#1072#1095#1077#1085#1072' '#1102#1088#1080#1076#1080#1095#1085#1072' '#1086#1089#1086#1073#1072', '#1097#1086' '#1108' '#1087#1088#1072#1074#1086#1085#1072#1089#1090#1091#1087#1085#1080#1082#1086#1084' '#1083#1110 +
            #1082#1074#1110#1076#1086#1074#1072#1085#1086#1111' '#1089#1090#1086#1088#1086#1085#1080';'
          
            '  7.1.4. '#1091' '#1088#1072#1079#1110' '#1074#1110#1076#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1057#1090#1091#1076#1077#1085#1090#1072' '#1079' '#1085#1072#1074#1095#1072#1083#1100#1085#1086#1075#1086' '#1079#1072#1082#1083#1072#1076#1091' '#1079#1075#1110#1076 +
            #1085#1086' '#1110#1079' '#1079#1072#1082#1086#1085#1086#1076#1072#1074#1089#1090#1074#1086#1084';'
          
            '  7.1.5. '#1079#1072' '#1088#1110#1096#1077#1085#1085#1103#1084' '#1089#1091#1076#1091' '#1074' '#1088#1072#1079#1110' '#1089#1080#1089#1090#1077#1084#1072#1090#1080#1095#1085#1086#1075#1086' '#1087#1086#1088#1091#1096#1077#1085#1085#1103' '#1072#1073#1086' '#1085#1077 +
            #1074#1080#1082#1086#1085#1072#1085#1085#1103' '#1091#1084#1086#1074' '#1076#1086#1075#1086#1074#1086#1088#1091'.'
          
            '  7.2.'#1044#1110#1103' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1079#1091#1087#1080#1085#1103#1108#1090#1100#1089#1103' '#1091' '#1088#1072#1079#1110' '#1085#1072#1076#1072#1085#1085#1103' '#1072#1082#1072#1076#1077#1084#1110#1095#1085#1086#1111' '#1074#1110#1076#1087#1091#1089 +
            #1090#1082#1080' '#1057#1090#1091#1076#1077#1085#1090#1091' '#1079#1075#1110#1076#1085#1086' '#1110#1079' '#1079#1072#1082#1086#1085#1086#1076#1072#1074#1089#1090#1074#1086#1084' '#1085#1072' '#1074#1077#1089#1100' '#1089#1090#1088#1086#1082' '#1090#1072#1082#1086#1111' '#1074#1110#1076#1087#1091#1089 +
            #1090#1082#1080'.'
          ''
          
            '  8.1.'#1044#1086#1075#1086#1074#1110#1088' '#1085#1072#1073#1091#1074#1072#1108' '#1095#1080#1085#1085#1086#1089#1090#1110' '#1079' '#1076#1085#1103' '#1074#1080#1076#1072#1085#1085#1103' '#1042#1080#1082#1086#1085#1072#1074#1094#1077#1084' '#1085#1072#1082#1072#1079#1091' '#1087 +
            #1088#1086' '#1079#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1057#1090#1091#1076#1077#1085#1090#1072' '#1085#1072' '#1087#1110#1076#1089#1090#1072#1074#1110' '#1082#1086#1085#1082#1091#1088#1089#1085#1086#1075#1086' '#1074#1110#1076#1073#1086#1088#1091' '#1110' '#1079#1072#1082#1110#1085#1095 +
            #1091#1108#1090#1100#1089#1103' '#1076#1072#1090#1086#1102' '#1074#1080#1087#1091#1089#1082#1091' '#1072#1073#1086' '#1074#1110#1076#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1057#1090#1091#1076#1077#1085#1090#1072'.'
          
            '  8.2. '#1042#1080#1082#1086#1085#1072#1074#1077#1094#1100' '#1085#1077' '#1085#1077#1089#1077' '#1074#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1086#1089#1090#1110' '#1087#1086' '#1079#1086#1073#1086#1074#39#1103#1079#1072#1085#1085#1103#1093' '#1047#1072#1084#1086 +
            #1074#1085#1080#1082#1072'('#1110#1074') '#1090#1072' '#1057#1090#1091#1076#1077#1085#1090#1072'.'
          
            '  8.3.'#1057#1090#1086#1088#1086#1085#1080' '#1085#1077#1089#1091#1090#1100' '#1087#1086#1074#1085#1091' '#1074#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1110#1089#1090#1100' '#1079#1072' '#1087#1088#1072#1074#1080#1083#1100#1085#1110#1089#1090#1100' '#1074#1082#1072#1079 +
            #1072#1085#1080#1093' '#1085#1080#1084#1080' '#1091' '#1094#1100#1086#1084#1091' '#1076#1086#1075#1086#1074#1086#1088#1110' '#1088#1077#1082#1074#1110#1079#1080#1090#1110#1074' '#1090#1072' '#1079#1086#1073#1086#1074#39#1103#1079#1091#1102#1090#1100#1089#1103' '#1089#1074#1086#1108#1095#1072#1089#1085 +
            #1086' '#1091' '#1087#1080#1089#1100#1084#1086#1074#1110#1081' '#1092#1086#1088#1084#1110' '#1087#1086#1074#1110#1076#1086#1084#1083#1103#1090#1080' '#1110#1085#1096#1091' '#1089#1090#1086#1088#1086#1085#1091' '#1087#1088#1086' '#1111#1093' '#1079#1084#1110#1085#1091', '#1072' '#1091' '#1088 +
            #1072#1079#1110' '#1085#1077#1087#1086#1074#1110#1076#1086#1084#1083#1077#1085#1085#1103' '#1085#1077#1089#1091#1090#1100' '#1088#1080#1079#1080#1082' '#1085#1072#1089#1090#1072#1085#1085#1103' '#1087#1086#1074#39#1103#1079#1072#1085#1080#1093' '#1110#1079' '#1094#1080#1084' '#1085#1077#1089#1087#1088 +
            #1080#1103#1090#1083#1080#1074#1080#1093' '#1085#1072#1089#1083#1110#1076#1082#1110#1074'.'
          
            '  8.4.'#1059#1084#1086#1074#1080' '#1094#1100#1086#1075#1086' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1079#1084#1110#1085#1102#1102#1090#1100#1089#1103' '#1079#1072' '#1079#1075#1086#1076#1086#1102' '#1089#1090#1086#1088#1110#1085', '#1097#1086' '#1086#1092#1086#1088#1084 +
            #1083#1102#1108#1090#1100#1089#1103' '#1076#1086#1076#1072#1090#1082#1086#1074#1080#1084#1080' '#1091#1075#1086#1076#1072#1084#1080', '#1103#1082#1110' '#1108' '#1081#1086#1075#1086' '#1085#1077#1074#1110#1076#39#1108#1084#1085#1080#1084#1080' '#1095#1072#1089#1090#1080#1085#1072#1084#1080' '#1110 +
            ' '#1084#1072#1102#1090#1100' '#1102#1088#1080#1076#1080#1095#1085#1091' '#1089#1080#1083#1091' '#1091' '#1088#1072#1079#1110', '#1103#1082#1097#1086' '#1074#1086#1085#1080' '#1074#1080#1082#1083#1072#1076#1077#1085#1110' '#1091' '#1087#1080#1089#1100#1084#1086#1074#1110#1081' '#1092#1086#1088 +
            #1084#1110', '#1087#1110#1076#1087#1080#1089#1072#1085#1110' '#1089#1090#1086#1088#1086#1085#1072#1084#1080' '#1090#1072' '#1089#1082#1088#1110#1087#1083#1077#1085#1110' '#1111#1093' '#1087#1077#1095#1072#1090#1082#1072#1084#1080'.'
          
            '  8.5.'#1062#1077#1081' '#1076#1086#1075#1086#1074#1110#1088' '#1091#1082#1083#1072#1076#1072#1108#1090#1100#1089#1103' '#1091' '#1082#1110#1083#1100#1082#1086#1089#1090#1110' '#1087#1088#1080#1084#1110#1088#1085#1080#1082#1110#1074' '#1087#1086' '#1095#1080#1089#1083#1091' '#1089 +
            #1090#1086#1088#1110#1085' '#1076#1086#1075#1086#1074#1086#1088#1091'. '#1055#1088#1080#1084#1110#1088#1085#1080#1082#1080' '#1079#1085#1072#1093#1086#1076#1103#1090#1100#1089#1103' '#1091' '#1082#1086#1078#1085#1086#1111' '#1089#1090#1086#1088#1086#1085#1080' '#1110' '#1084#1072#1102#1090#1100' ' +
            #1086#1076#1085#1072#1082#1086#1074#1091' '#1102#1088#1080#1076#1080#1095#1085#1091' '#1089#1080#1083#1091'.'
          
            '  8.6.'#1047#1072' '#1092#1110#1079#1080#1095#1085#1091' '#1086#1089#1086#1073#1091', '#1103#1082#1072' '#1085#1077' '#1084#1072#1108' '#1087#1086#1074#1085#1086#1111' '#1076#1110#1108#1079#1076#1072#1090#1085#1086#1089#1090#1110', '#1076#1086#1075#1086#1074#1110#1088' ' +
            #1087#1110#1076#1087#1080#1089#1091#1102#1090#1100' '#1111#1111' '#1073#1072#1090#1100#1082#1080' '#1072#1073#1086' '#1110#1085#1096#1110' '#1079#1072#1082#1086#1085#1085#1110' '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1080'. '
          
            '  8.7.'#1055#1088#1080' '#1087#1077#1088#1077#1088#1072#1093#1091#1074#1072#1085#1085#1110' '#1075#1088#1086#1096#1077#1081' '#1079#1072' '#1086#1089#1074#1110#1090#1085#1102' '#1087#1086#1089#1083#1091#1075#1091' '#1085#1077#1086#1073#1093#1110#1076#1085#1086' '#1086#1073#1086#1074 +
            #39#1103#1079#1082#1086#1074#1086' '#1074#1082#1072#1079#1091#1074#1072#1090#1080' '#1092#1072#1082#1091#1083#1100#1090#1077#1090', '#1089#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100', '#1082#1091#1088#1089', '#1092#1086#1088#1084#1091' '#1085#1072#1074#1095#1072#1085#1085#1103 +
            ', '#1085#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1091', '#1087#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103' '#1110' '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110' '#1057#1090#1091#1076#1077#1085#1090#1072'.')
        ParentFont = False
      end
      object Memo106: TfrxMemoView
        Left = 30.236220470000000000
        Width = 170.078850000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        Memo.Strings = (
          '5.'#1054#1073#1086#1074#39#1103#1079#1082#1080' '#1057#1090#1091#1076#1077#1085#1090#1072)
        ParentFont = False
      end
      object Memo107: TfrxMemoView
        Left = 30.236220470000000000
        Top = 120.944960000000000000
        Width = 234.330860000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        Memo.Strings = (
          ' 6.'#1042#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1110#1089#1090#1100' '#1089#1090#1086#1088#1110#1085)
        ParentFont = False
      end
      object Memo108: TfrxMemoView
        Left = 30.236220470000000000
        Top = 211.653680000000000000
        Width = 222.992270000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        Memo.Strings = (
          ' 7.'#1055#1088#1080#1087#1080#1085#1077#1085#1085#1103' '#1076#1086#1075#1086#1074#1086#1088#1091)
        ParentFont = False
      end
      object Memo109: TfrxMemoView
        Left = 30.236220470000000000
        Top = 396.850650000000000000
        Width = 173.858380000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        Memo.Strings = (
          ' 8.'#1030#1085#1096#1110' '#1091#1084#1086#1074#1080)
        ParentFont = False
      end
      object Memo110: TfrxMemoView
        Top = 627.401980000000000000
        Width = 718.110700000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          #1056#1077#1082#1074#1110#1079#1080#1090#1080' '#1089#1090#1086#1088#1110#1085)
        ParentFont = False
      end
      object Memo111: TfrxMemoView
        Top = 646.299630000000000000
        Width = 185.196970000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          #1047#1072#1084#1086#1074#1085#1080#1082' - '#1102#1088#1080#1076#1080#1095#1085#1072' '#1086#1089#1086#1073#1072': ')
        ParentFont = False
      end
      object Memo116: TfrxMemoView
        Left = 177.637910000000000000
        Top = 642.520100000000000000
        Width = 241.889920000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo117: TfrxMemoView
        Top = 646.299630000000000000
        Width = 419.527830000000000000
        Height = 34.015770000000000000
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          
            '                                                        [PD_DBDa' +
            'taset."JUR_NAZV_PREDPR"]')
        ParentFont = False
      end
      object Memo118: TfrxMemoView
        Top = 687.874460000000000000
        Width = 102.047310000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1072#1076#1088#1077#1089#1072', '#1090#1077#1083#1077#1092#1086#1085':')
        ParentFont = False
      end
      object Memo119: TfrxMemoView
        Left = 102.047310000000000000
        Top = 687.874460000000000000
        Width = 317.480520000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo120: TfrxMemoView
        Top = 687.874460000000000000
        Width = 419.527830000000000000
        Height = 34.015770000000000000
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          
            '                              [PD_DBDataset."JUR_ADR"]   [PD_DBD' +
            'ataset."JUR_PHONE"]')
        ParentFont = False
      end
      object Memo121: TfrxMemoView
        Top = 721.890230000000000000
        Width = 90.708720000000000000
        Height = 64.252010000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1050#1088#1072#1111#1085#1072':'
          #1088'/'#1088#1072#1093':'
          #1052#1060#1054':'
          #1082#1086#1076' '#1028#1044#1056#1055#1054#1059':')
        ParentFont = False
      end
      object Memo122: TfrxMemoView
        Left = 49.133890000000000000
        Top = 721.890230000000000000
        Width = 370.393940000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        HideZeros = True
        Memo.Strings = (
          '[PD_DBDataset."JUR_COUNTRY"]')
        ParentFont = False
      end
      object Memo123: TfrxMemoView
        Left = 49.133890000000000000
        Top = 737.008350000000000000
        Width = 370.393940000000000000
        Height = 15.118120000000000000
        DataField = 'JUR_RR'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[PD_DBDataset."JUR_RR"]')
        ParentFont = False
      end
      object Memo124: TfrxMemoView
        Left = 49.133890000000000000
        Top = 752.126470000000000000
        Width = 370.393940000000000000
        Height = 15.118120000000000000
        DataField = 'JUR_MFO'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[PD_DBDataset."JUR_MFO"]')
        ParentFont = False
      end
      object Memo125: TfrxMemoView
        Left = 86.929190000000000000
        Top = 767.999990240000000000
        Width = 332.598640000000000000
        Height = 15.118120000000000000
        DataField = 'JUR_KOD'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[PD_DBDataset."JUR_KOD"]')
        ParentFont = False
      end
      object Memo126: TfrxMemoView
        Top = 786.142240000000000000
        Width = 170.078850000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          #1047#1072#1084#1086#1074#1085#1080#1082' - '#1092#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072':')
        ParentFont = False
      end
      object Memo127: TfrxMemoView
        Left = 162.519790000000000000
        Top = 786.142240000000000000
        Width = 548.031850000000000000
        Height = 15.118120000000000000
        DataField = 'PAYER_FIO'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[PD_DBDataset."PAYER_FIO"]')
        ParentFont = False
      end
      object Memo128: TfrxMemoView
        Top = 805.039890000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1087#1072#1089#1087#1086#1088#1090': '#1089#1077#1088#1110#1103)
        ParentFont = False
      end
      object Memo129: TfrxMemoView
        Left = 90.708720000000000000
        Top = 805.039890000000000000
        Width = 49.133890000000000000
        Height = 15.118120000000000000
        DataField = 'FIZ_PAY_PAS_SR'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[PD_DBDataset."FIZ_PAY_PAS_SR"]')
        ParentFont = False
      end
      object Memo130: TfrxMemoView
        Left = 143.622140000000000000
        Top = 805.039890000000000000
        Width = 18.897650000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #8470)
        ParentFont = False
      end
      object Memo131: TfrxMemoView
        Left = 166.299320000000000000
        Top = 805.039890000000000000
        Width = 109.606370000000000000
        Height = 15.118120000000000000
        DataField = 'FIZ_PAY_PAS_N'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[PD_DBDataset."FIZ_PAY_PAS_N"]')
        ParentFont = False
      end
      object Memo132: TfrxMemoView
        Left = 279.685220000000000000
        Top = 805.039890000000000000
        Width = 60.472480000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1074#1080#1076#1072#1085#1080#1081)
        ParentFont = False
      end
      object Memo138: TfrxMemoView
        Left = 430.866420000000000000
        Top = 820.158010000000000000
        Width = 41.574830000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          '"      "')
        ParentFont = False
      end
      object Memo139: TfrxMemoView
        Left = 438.425480000000000000
        Top = 823.937540000000000000
        Width = 22.677180000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[FIZ_D_PAS]')
        ParentFont = False
      end
      object Memo140: TfrxMemoView
        Left = 472.441250000000000000
        Top = 823.937540000000000000
        Width = 117.165430000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[FIZ_M_PAS]')
        ParentFont = False
      end
      object Memo141: TfrxMemoView
        Left = 589.606680000000000000
        Top = 823.937540000000000000
        Width = 86.929190000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[FIZ_Y_PAS]')
        ParentFont = False
      end
      object Memo142: TfrxMemoView
        Top = 842.835190000000000000
        Width = 109.606370000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1084#1110#1089#1094#1077' '#1087#1088#1086#1078#1080#1074#1072#1085#1085#1103)
        ParentFont = False
      end
      object Memo148: TfrxMemoView
        Left = 449.764070000000000000
        Top = 857.953310000000000000
        Width = 30.236240000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1090#1077#1083':')
        ParentFont = False
      end
      object Memo149: TfrxMemoView
        Left = 480.000310000000000000
        Top = 857.953310000000000000
        Width = 230.551330000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo150: TfrxMemoView
        Top = 873.071430000000000000
        Width = 132.283550000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1110#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1082#1086#1076':')
        ParentFont = False
      end
      object Memo151: TfrxMemoView
        Left = 132.283550000000000000
        Top = 873.071430000000000000
        Width = 272.126160000000000000
        Height = 15.118120000000000000
        DataField = 'FIZ_PAY_TIN'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[PD_DBDataset."FIZ_PAY_TIN"]')
        ParentFont = False
      end
      object Memo152: TfrxMemoView
        Left = 408.189240000000000000
        Top = 873.071430000000000000
        Width = 109.606370000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103':')
        ParentFont = False
      end
      object Memo153: TfrxMemoView
        Left = 517.795610000000000000
        Top = 873.071430000000000000
        Width = 192.756030000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo154: TfrxMemoView
        Top = 888.189550000000000000
        Width = 64.252010000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          #1057#1090#1091#1076#1077#1085#1090':')
        ParentFont = False
      end
      object Memo155: TfrxMemoView
        Left = 64.252010000000000000
        Top = 888.189550000000000000
        Width = 646.299630000000000000
        Height = 15.118120000000000000
        DataField = 'STUD_FIO'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[PD_DBDataset."STUD_FIO"]')
        ParentFont = False
      end
      object Memo156: TfrxMemoView
        Top = 903.307670000000000000
        Width = 117.165430000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1075#1088#1086#1084#1072#1076#1103#1085#1080#1085' '#1082#1088#1072#1111#1085#1080':')
        ParentFont = False
      end
      object Memo157: TfrxMemoView
        Left = 117.165430000000000000
        Top = 903.307670000000000000
        Width = 593.386210000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo158: TfrxMemoView
        Top = 918.425790000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1087#1072#1089#1087#1086#1088#1090': '#1089#1077#1088#1110#1103)
        ParentFont = False
      end
      object Memo160: TfrxMemoView
        Left = 143.622140000000000000
        Top = 918.425790000000000000
        Width = 18.897650000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #8470)
        ParentFont = False
      end
      object Memo162: TfrxMemoView
        Left = 279.685220000000000000
        Top = 918.425790000000000000
        Width = 60.472480000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1074#1080#1076#1072#1085#1080#1081)
        ParentFont = False
      end
      object Memo165: TfrxMemoView
        Left = 430.866420000000000000
        Top = 933.543910000000000000
        Width = 41.574830000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          '"      "')
        ParentFont = False
      end
      object Memo159: TfrxMemoView
        Left = 86.929190000000000000
        Top = 918.425790000000000000
        Width = 56.692950000000000000
        Height = 15.118120000000000000
        DataField = 'S_PAS_SR'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[PD_DBDataset."S_PAS_SR"]')
        ParentFont = False
      end
      object Memo161: TfrxMemoView
        Left = 162.519790000000000000
        Top = 918.425790000000000000
        Width = 117.165430000000000000
        Height = 15.118120000000000000
        DataField = 'S_PAS_N'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[PD_DBDataset."S_PAS_N"]')
        ParentFont = False
      end
      object Memo163: TfrxMemoView
        Left = 340.157700000000000000
        Top = 918.425790000000000000
        Width = 370.393940000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo164: TfrxMemoView
        Top = 933.543910000000000000
        Width = 430.866420000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo166: TfrxMemoView
        Left = 434.645950000000000000
        Top = 933.543910000000000000
        Width = 22.677180000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[S_D_PAS]')
        ParentFont = False
      end
      object Memo167: TfrxMemoView
        Left = 472.441250000000000000
        Top = 933.543910000000000000
        Width = 128.504020000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[S_M_PAS]')
        ParentFont = False
      end
      object Memo168: TfrxMemoView
        Left = 600.945270000000000000
        Top = 933.543910000000000000
        Width = 75.590600000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[S_Y_PAS] ')
        ParentFont = False
      end
      object Memo169: TfrxMemoView
        Top = 948.662030000000000000
        Width = 188.976500000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1072#1076#1088#1077#1089#1072' '#1087#1086#1089#1090#1110#1081#1085#1086#1075#1086'  '#1087#1088#1086#1078#1080#1074#1072#1085#1085#1103':  ')
        ParentFont = False
      end
      object Memo175: TfrxMemoView
        Left = 445.984540000000000000
        Top = 963.780150000000000000
        Width = 30.236240000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1090#1077#1083': ')
        ParentFont = False
      end
      object Memo176: TfrxMemoView
        Left = 476.220780000000000000
        Top = 963.780150000000000000
        Width = 234.330860000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo177: TfrxMemoView
        Top = 978.898270000000000000
        Width = 132.283550000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1110#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1082#1086#1076':')
        ParentFont = False
      end
      object Memo178: TfrxMemoView
        Left = 408.189240000000000000
        Top = 978.898270000000000000
        Width = 109.606370000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103':')
        ParentFont = False
      end
      object Memo179: TfrxMemoView
        Left = 132.283550000000000000
        Top = 978.898270000000000000
        Width = 275.905690000000000000
        Height = 15.118120000000000000
        DataField = 'S_TIN'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        HAlign = haCenter
        Memo.Strings = (
          '[PD_DBDataset."S_TIN"]')
        ParentFont = False
      end
      object Memo180: TfrxMemoView
        Left = 517.795610000000000000
        Top = 978.898270000000000000
        Width = 192.756030000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo181: TfrxMemoView
        Top = 997.795920000000000000
        Width = 718.110700000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          #1055#1110#1076#1087#1080#1089#1080' '#1089#1090#1086#1088#1110#1085)
        ParentFont = False
      end
      object Memo182: TfrxMemoView
        Top = 1012.914040000000000000
        Width = 721.890230000000000000
        Height = 34.015770000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.Strings = (
          
            #1047#1072#1084#1086#1074#1085#1080#1082' - '#1092#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072'                '#1047#1072#1084#1086#1074#1085#1080#1082' - '#1102#1088#1080#1076#1080#1095#1085#1072' '#1086#1089#1086#1073 +
            #1072'              '#1042#1080#1082#1086#1085#1072#1074#1077#1094#1100'            '#1057#1090#1091#1076#1077#1085#1090)
        ParentFont = False
      end
      object Memo183: TfrxMemoView
        Left = 68.031540000000000000
        Top = 1028.032160000000000000
        Width = 147.401670000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo184: TfrxMemoView
        Left = 279.685220000000000000
        Top = 1028.032160000000000000
        Width = 147.401670000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo185: TfrxMemoView
        Left = 483.779840000000000000
        Top = 1028.032160000000000000
        Width = 83.149660000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo186: TfrxMemoView
        Left = 604.724800000000000000
        Top = 1028.032160000000000000
        Width = 52.913420000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo187: TfrxMemoView
        Left = 676.535870000000000000
        Top = 823.937540000000000000
        Width = 34.015770000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          ' '#1088#1086#1082#1091)
        ParentFont = False
      end
      object Memo188: TfrxMemoView
        Left = 676.535870000000000000
        Top = 933.543910000000000000
        Width = 34.015770000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          ' '#1088#1086#1082#1091)
        ParentFont = False
      end
      object Memo194: TfrxMemoView
        Top = 665.197280000000000000
        Width = 419.527830000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo195: TfrxMemoView
        Top = 704.881889763780000000
        Width = 419.527830000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo136: TfrxMemoView
        Left = 340.157700000000000000
        Top = 805.039890000000000000
        Width = 370.393940000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo137: TfrxMemoView
        Top = 823.937540000000000000
        Width = 430.866420000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo196: TfrxMemoView
        Left = -3.779530000000000000
        Top = 805.039890000000000000
        Width = 710.551640000000000000
        Height = 34.015770000000000000
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          
            '                                                                ' +
            '                                        [PD_DBDataset."FIZ_PAY_P' +
            'AS_VIDAN"]')
        ParentFont = False
      end
      object Memo197: TfrxMemoView
        Top = 918.425790000000000000
        Width = 710.551640000000000000
        Height = 34.015770000000000000
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          
            '                                                                ' +
            '                                      [PD_DBDataset."S_PAS_VIDAN' +
            '"]')
        ParentFont = False
      end
      object Memo200: TfrxMemoView
        Left = 521.575140000000000000
        Top = 873.071430000000000000
        Width = 128.504020000000000000
        Height = 18.897650000000000000
        DataField = 'FIZ_BIRTH_DAY'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        HAlign = haCenter
        Memo.Strings = (
          '[PD_DBDataset."FIZ_BIRTH_DAY"]')
        ParentFont = False
      end
      object Memo201: TfrxMemoView
        Left = 517.795610000000000000
        Top = 978.898270000000000000
        Width = 120.944960000000000000
        Height = 18.897650000000000000
        DataField = 'S_BIRTH_DAY'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        HAlign = haCenter
        Memo.Strings = (
          '[PD_DBDataset."S_BIRTH_DAY"]')
        ParentFont = False
      end
      object Memo202: TfrxMemoView
        Left = 120.944960000000000000
        Top = 903.307670000000000000
        Width = 960.000620000000000000
        Height = 18.897650000000000000
        DataField = 'S_COUNTRY'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          '[PD_DBDataset."S_COUNTRY"]')
        ParentFont = False
      end
      object Memo112: TfrxMemoView
        Left = 427.086890000000000000
        Top = 646.299630000000000000
        Width = 257.008040000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100': ')
        ParentFont = False
      end
      object Memo113: TfrxMemoView
        Left = 427.086890000000000000
        Top = 680.315400000000000000
        Width = 294.803340000000000000
        Height = 52.913420000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Memo.Strings = (
          '83001, '#1084'. '#1044#1086#1085#1077#1094#1100#1082', '#1074#1091#1083'. '#1059#1085#1110#1074#1077#1088#1089#1080#1090#1077#1090#1089#1100#1082#1072', 24'
          #1090#1077#1083': _______________        '
          #1088'/'#1088#1072#1093': ')
        ParentFont = False
      end
      object Memo114: TfrxMemoView
        Left = 427.086890000000000000
        Top = 661.417750000000000000
        Width = 291.023687950000000000
        Height = 15.118120000000000000
        DataField = 'VUZ_NAME'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[PD_DBDataset."VUZ_NAME"]')
        ParentFont = False
      end
      object Memo115: TfrxMemoView
        Left = 464.882190000000000000
        Top = 712.062992130000000000
        Width = 215.433210000000000000
        Height = 13.606299210000000000
        DataField = 'VUZ_RR'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[PD_DBDataset."VUZ_RR"]')
        ParentFont = False
      end
      object Memo203: TfrxMemoView
        Left = 427.086890000000000000
        Top = 729.449290000000000000
        Width = 291.023687950000000000
        Height = 17.385829210000000000
        DataField = 'VUZ_BANK_MFO_NAME'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[PD_DBDataset."VUZ_BANK_MFO_NAME"]')
        ParentFont = False
      end
      object Memo204: TfrxMemoView
        Left = 427.086890000000000000
        Top = 748.346940000000000000
        Width = 90.708720000000000000
        Height = 37.795300000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          #1052#1060#1054':'
          #1082#1086#1076' '#1028#1044#1056#1055#1054#1059':')
        ParentFont = False
      end
      object Memo205: TfrxMemoView
        Left = 468.661720000000000000
        Top = 748.346940000000000000
        Width = 249.448980000000000000
        Height = 13.606299210000000000
        DataField = 'VUZ_BANK_MFO'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[PD_DBDataset."VUZ_BANK_MFO"]')
        ParentFont = False
      end
      object Memo206: TfrxMemoView
        Left = 517.795610000000000000
        Top = 763.465060000000000000
        Width = 200.315090000000000000
        Height = 13.606299210000000000
        DataField = 'VUZ_EDRPOU'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Memo.Strings = (
          '[PD_DBDataset."VUZ_EDRPOU"]')
        ParentFont = False
      end
      object Memo207: TfrxMemoView
        Left = 472.441250000000000000
        Top = 963.780150000000000000
        Width = 238.110390000000000000
        Height = 18.897650000000000000
        DataField = 'S_PHONE'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        HAlign = haCenter
        Memo.Strings = (
          '[PD_DBDataset."S_PHONE"]')
        ParentFont = False
      end
      object Memo208: TfrxMemoView
        Left = 480.000310000000000000
        Top = 857.953310000000000000
        Width = 230.551330000000000000
        Height = 18.897650000000000000
        DataField = 'FIZ_PHONE'
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        HAlign = haCenter
        Memo.Strings = (
          '[PD_DBDataset."FIZ_PHONE"]')
        ParentFont = False
      end
      object Memo143: TfrxMemoView
        Left = -3.779530000000000000
        Top = 842.835190000000000000
        Width = 710.551640000000000000
        Height = 30.236240000000000000
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          
            '                                [PD_DBDataset."FIZ_PAY_ADR_ZIPCO' +
            'DE"]      [PD_DBDataset."FIZ_PAY_ADR_CT"]      [PD_DBDataset."FI' +
            'Z_PAY_ADR_PLC"]      [PD_DBDataset."FIZ_PAY_ADR_STRT"]      [PD_' +
            'DBDataset."FIZ_PAY_ADR_KORP"]      [PD_DBDataset."FIZ_PAY_ADR_HO' +
            'USE"]      [PD_DBDataset."FIZ_PAY_ADR_FLAT"]')
        ParentFont = False
      end
      object Memo144: TfrxMemoView
        Left = -3.779530000000000000
        Top = 948.662030000000000000
        Width = 710.551640000000000000
        Height = 30.236240000000000000
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Memo.Strings = (
          
            '                                                        [PD_DBDa' +
            'taset."S_ADR_ZIPCODE"]       [PD_DBDataset."S_ADR_CT"]      [PD_' +
            'DBDataset."S_ADR_PLC"]      [PD_DBDataset."S_ADR_STRT"]      [PD' +
            '_DBDataset."S_ADR_KORP"]      [PD_DBDataset."S_ADR_HOUSE"]      ' +
            '[PD_DBDataset."S_ADR_FLAT"]')
        ParentFont = False
      end
      object Memo145: TfrxMemoView
        Left = 185.196970000000000000
        Top = 948.662030000000000000
        Width = 517.795610000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
      object Memo146: TfrxMemoView
        Left = 109.606370000000000000
        Top = 839.055660000000000000
        Width = 597.165740000000000000
        Height = 18.897650000000000000
        DataSet = PD_DBDataset
        DataSetName = 'PD_DBDataset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Frame.Typ = [ftBottom]
        ParentFont = False
      end
    end
  end
  object PD_DBDataset: TfrxDBDataset
    UserName = 'PD_DBDataset'
    CloseDataSource = False
    DataSet = PD_DataSet
    Left = 384
    Top = 72
  end
  object ActionList1: TActionList
    Left = 96
    Top = 8
    object acDebug: TAction
      Caption = 'acDebug'
      ShortCut = 57412
      OnExecute = acDebugExecute
    end
    object close_act: TAction
      Caption = 'close_act'
      ShortCut = 27
      OnExecute = close_actExecute
    end
  end
  object DataSet_stage_opl: TpFIBDataSet
    Database = PD_Database
    Transaction = PD_Transaction
    SelectSQL.Strings = (
      '')
    Left = 160
    poSQLINT64ToBCD = True
  end
  object PD_BDataset_stage_opl: TfrxDBDataset
    UserName = 'PD_DBDataset_stage_opl'
    CloseDataSource = False
    DataSet = DataSet_stage_opl
    Left = 200
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 240
    Top = 32
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 352
    Top = 72
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 304
    Top = 64
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 280
    Top = 72
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
    Left = 248
    Top = 72
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 216
    Top = 72
  end
end
