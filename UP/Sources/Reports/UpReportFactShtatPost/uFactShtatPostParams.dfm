object fmFactShtatReport2: TfmFactShtatReport2
  Left = 192
  Top = 124
  BorderStyle = bsSingle
  ClientHeight = 602
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDefault
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 25
    Top = 268
    Width = 212
    Height = 16
    Caption = #1060#1110#1083#1100#1090#1088' '#1079#1072' '#1075#1088#1091#1087#1072#1084#1080' '#1073#1102#1076#1078#1077#1090#1110#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DLabel: TLabel
    Left = 60
    Top = 580
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object FormControl: TqFFormControl
    Left = 464
    Top = 224
    Width = 58
    Height = 21
    ControlsOwner = Owner
    Mode = fmAdd
    CheckWhere = True
    CloseForm = True
    ShowErrorDialog = True
    ShowDebugInfoInOk = False
  end
  object OkButton: TBitBtn
    Left = 113
    Top = 557
    Width = 133
    Height = 28
    Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080
    Default = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = OkButtonClick
    Glyph.Data = {
      8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
      180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003300FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0033000099
      33003300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
      969696666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00330000
      9933009900009933003300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6666
      66969696868686999999666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003300
      009933009933009900009900009933003300FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66
      6666999999999999969696969696999999666666FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0033
      0033CC3333CC3333CC33009933003300009933009900009933003300FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      666666C0C0C0B2B2B2B2B2B2969696666666999999969696999999666666FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      330000800033CC6633CC33339933003300FFFFFF003300009933009900009933
      003300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF666666868686C0C0C0C0C0C0A4A0A0666666FFFFFF66666699999996969699
      9999666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF00330033CC6633CC66339933003300993333FFFFFFFFFFFF0033000080
      00009900009933003300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF666666CCCCCCC0C0C0B2B2B2666666808080FFFFFFFFFFFF666666
      868686969696999999666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF003300339933339933003300CC3333CC6666993333FFFFFFFF
      FFFFFFFFFF003300009900009933FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF666666A4A0A0B2B2B2666666969696999999808080FFFF
      FFFFFFFFFFFFFF666666969696969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF993333003300003300CC6666CC3333CC3333CC6666
      993333FFFFFFFFFFFFFFFFFF003300009933003300FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF80808066666666666699999999999996969699
      9999808080FFFFFFFFFFFFFFFFFF666666969696666666FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF993333CC3333CC6666CC6666CC3333993333CC66
      66CC3333CC6666993333FFFFFFFFFFFFFFFFFF003300009900003300FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080969696B2B2B2A4A0A0999999808080
      A4A0A0969696999999808080FFFFFFFFFFFFFFFFFF666666969696666666FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF993333CC3333CC6666CC6666CC6666993333FF
      FFFF993333CC6666CC3333CC6666993333FFFFFFFFFFFFFFFFFF003300008000
      003300FFFFFFFFFFFFFFFFFFFFFFFF808080969696C0C0C0B2B2B2A4A0A08080
      80FFFFFF808080999999969696999999808080FFFFFFFFFFFFFFFFFF66666686
      8686666666FFFFFFFFFFFFFFFFFFFFFFFF993333CC9999CC9999CC9999993333
      FFFFFFFFFFFFFFFFFF993333CC3333CC3333CC3333993333FFFFFFFFFFFFFFFF
      FF003300006600003300FFFFFFFFFFFFFFFFFF808080C0C0C0C0C0C0C0C0C080
      8080FFFFFFFFFFFFFFFFFF808080868686999999999999808080FFFFFFFFFFFF
      FFFFFF666666777777666666FFFFFFFFFFFFFFFFFF993333CC6666CC9999CC66
      66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333CC3333CC3333993333FF
      FFFFFFFFFFFFFFFFFFFFFF003300003300FFFFFFFFFFFF808080A4A0A0C0C0C0
      B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080809999999999998080
      80FFFFFFFFFFFFFFFFFFFFFFFF666666666666FFFFFFFFFFFFFFFFFF993333CC
      6666993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333CC3333
      CC3333993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003300FFFFFFFFFFFF8080
      80B2B2B2808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808099
      9999969696808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666FFFFFFFFFFFF
      FFFFFF993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF993333CC3333CC3333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF808080868686969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFCC3333993333FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686808080FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333993333FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
      3333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    NumGlyphs = 2
  end
  object CancelButton: TBitBtn
    Left = 343
    Top = 557
    Width = 95
    Height = 28
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 1
    OnClick = CancelButtonClick
    Glyph.Data = {
      8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
      180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000066000066FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000066000066
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6666
      66666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66
      6666666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660033FF0033FF
      0033FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660000CC0000
      FF0000FF0000FF000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666B2
      B2B2B2B2B2A4A0A0969696666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
      969696999999999999999999666666FFFFFFFFFFFFFFFFFFFFFFFF0000660000
      CC0033FF0033FF0033FF0000CC000066FFFFFFFFFFFFFFFFFF0000660000CC00
      00FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      666666A4A0A0B2B2B2B2B2B2B2B2B2969696666666FFFFFFFFFFFFFFFFFF6666
      66969696999999999999999999969696666666FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000660000CC0033FF0033FF0033FF0000CC000066FFFFFF0000660000CC
      0000FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF666666A4A0A0B2B2B2B2B2B2B2B2B2999999666666FFFFFF66
      6666999999999999999999999999969696666666FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF0000660000CC0033FF0033FF0033FF0000CC0000660000
      CC0000FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF666666A4A0A0B2B2B2B2B2B2B2B2B2999999
      666666999999999999999999999999969696666666FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660000CC0033FF0033FF0033FF00
      00FF0000FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666A4A0A0B2B2B2B2B2
      B2B2B2B2999999999999999999999999969696666666FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660000CC0033FF
      0033FF0000FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666A4
      A0A0B2B2B2B2B2B2A4A0A0A4A0A0999999969696666666FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      660033CC0033FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF666666A4A0A0B2B2B2A4A0A0A4A0A0999999666666FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      00660033CC0033FF0033FF0033FF0033FF0033FF0000CC000066FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF666666B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A0A0666666FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000660033CC0033FF0033FF0033FF0033CC0033FF0033FF0033FF0000CC0000
      66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF666666B2B2B2B2B2B2B2B2B2B2B2B2A4A0A0B2B2B2B2B2B2B2B2B2
      A4A0A0666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF0000660033CC0033FF0033FF0033FF0033CC0000660033CC0033FF0033FF00
      33FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF666666B2B2B2C0C0C0B2B2B2B2B2B2B2B2B2666666A4A0A0B2B2
      B2B2B2B2B2B2B2A4A0A0666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000660033CC0033FF0033FF0033FF0033CC000066FFFFFF0000660000CC
      0033FF0033FF0033FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF666666B2B2B2C0C0C0C0C0C0C0C0C0A4A0A0666666FFFFFF66
      6666A4A0A0B2B2B2B2B2B2B2B2B2A4A0A0666666FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF0000660033CC0033FF0033FF0033FF0033CC000066FFFFFFFFFFFFFFFF
      FF0000660000CC0033FF0033FF0033FF0033CC000066FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF666666C0C0C0C0C0C0C0C0C0C0C0C0A4A0A0666666FFFFFF
      FFFFFFFFFFFF666666999999B2B2B2B2B2B2B2B2B2A4A0A0666666FFFFFFFFFF
      FFFFFFFFFFFFFF0000663333FF3333FF3333FF0033CC000066FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF0000660000CC0033FF0033FF0033CC000066FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF666666C0C0C0C0C0C0C0C0C0A4A0A0666666FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF666666999999B2B2B2B2B2B2A4A0A0666666FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000663333CC0033CC000066FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660033CC0033CC000066FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666C0C0C0B2B2B2666666FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666A4A0A0B2B2B2666666
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    NumGlyphs = 2
  end
  object CurDate: TqFDateControl
    Left = 16
    Top = 8
    Width = 321
    Height = 21
    DisplayName = #1053#1072' '#1076#1072#1090#1091
    Interval = 200
    Value = 0
    LabelColor = clGreen
    Required = True
    Semicolon = True
    Asterisk = False
    Enabled = True
    Blocked = False
    TabOrder = 2
    AutoSaveToRegistry = True
    CheckDateIsEmpty = False
  end
  object Department: TqFSpravControl
    Left = 16
    Top = 65
    Width = 510
    Height = 31
    DisplayName = #1055#1110#1076#1088#1086#1079#1076#1110#1083
    Interval = 200
    Value = Null
    LabelColor = clGreen
    Required = True
    Semicolon = True
    Asterisk = True
    Enabled = True
    Blocked = False
    TabOrder = 3
    AutoSaveToRegistry = True
    OnOpenSprav = DepartmentOpenSprav
    DisplayText = ''
  end
  object Level: TqFSpravControl
    Left = 16
    Top = 135
    Width = 510
    Height = 20
    DisplayName = #1056#1110#1074#1077#1085#1100' '#1072#1082#1090#1091#1072#1083#1100#1085#1086#1089#1090#1110
    Interval = 200
    Value = Null
    LabelColor = clGreen
    Required = True
    Semicolon = True
    Asterisk = True
    Enabled = True
    Blocked = False
    TabOrder = 4
    AutoSaveToRegistry = True
    OnOpenSprav = LevelOpenSprav
    DisplayText = ''
  end
  object FilterPanel: TPanel
    Left = 8
    Top = 288
    Width = 529
    Height = 257
    TabOrder = 5
  end
  object SR: TqFSpravControl
    Left = 16
    Top = 37
    Width = 510
    Height = 21
    DisplayName = #1044#1086#1082#1091#1084#1077#1085#1090' '#1096#1090#1072#1090#1085#1086#1075#1086' '#1088#1086#1079#1082#1083#1072#1076#1091
    Interval = 200
    Value = Null
    LabelColor = clGreen
    Required = True
    Semicolon = True
    Asterisk = True
    Enabled = True
    Blocked = False
    TabOrder = 6
    AutoSaveToRegistry = True
    OnOpenSprav = SROpenSprav
    DisplayText = ''
  end
  object Type_Post: TqFSpravControl
    Left = 16
    Top = 104
    Width = 510
    Height = 22
    FieldName = 'Id_Type_Post'
    DisplayName = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
    Interval = 200
    Value = Null
    LabelColor = clGreen
    Required = False
    Semicolon = True
    Asterisk = False
    Enabled = True
    Blocked = False
    TabOrder = 7
    AutoSaveToRegistry = False
    OnOpenSprav = Type_PostOpenSprav
    DisplayText = ''
    DisplayTextField = 'Name_Type_Post'
  end
  object UseColumn5: TqFBoolControl
    Left = 24
    Top = 240
    Width = 417
    Height = 25
    DisplayName = #1055#1110#1076#1088#1072#1093#1086#1074#1091#1074#1072#1090#1080' '#1087#1088#1086#1094#1077#1085#1090' '#1085#1072#1076#1073#1072#1074#1082#1080' '#1076#1083#1103' '#1074#1110#1076#1087#1086#1074#1110#1076#1085#1086#1089#1090#1110' '#1079' '#1092#1072#1082#1090#1086#1084
    Interval = 120
    Value = False
    LabelColor = clGreen
    Required = True
    Semicolon = False
    Asterisk = False
    Enabled = True
    Blocked = False
    TabOrder = 8
    AutoSaveToRegistry = True
    StoreAs = StoreAs01
  end
  object ShowRaise: TqFBoolControl
    Left = 24
    Top = 168
    Width = 200
    Height = 21
    DisplayName = #1055#1086#1082#1072#1079#1091#1074#1072#1090#1080' '#1085#1072#1076#1073#1072#1074#1082#1080
    Interval = 120
    Value = True
    LabelColor = clGreen
    Required = True
    Semicolon = False
    Asterisk = False
    Enabled = True
    Default = True
    Blocked = False
    TabOrder = 9
    AutoSaveToRegistry = False
    StoreAs = StoreAs01
  end
  object ShowOnlyOverflow: TqFBoolControl
    Left = 24
    Top = 200
    Width = 225
    Height = 21
    DisplayName = #1055#1086#1082#1072#1079#1091#1074#1072#1090#1080' '#1090#1110#1083#1100#1082#1080' '#1087#1077#1088#1077#1074#1080#1097#1077#1085#1085#1103
    Interval = 120
    Value = False
    LabelColor = clGreen
    Required = True
    Semicolon = False
    Asterisk = False
    Enabled = True
    Blocked = False
    TabOrder = 10
    AutoSaveToRegistry = False
    StoreAs = StoreAs01
  end
  object PostTotals: TqFBoolControl
    Left = 328
    Top = 168
    Width = 200
    Height = 21
    DisplayName = #1055#1110#1076#1089#1091#1084#1082#1080' '#1079#1072' '#1087#1086#1089#1072#1076#1086#1102
    Interval = 120
    Value = True
    LabelColor = clGreen
    Required = True
    Semicolon = False
    Asterisk = False
    Enabled = True
    Default = 'True'
    Blocked = False
    TabOrder = 11
    AutoSaveToRegistry = True
    StoreAs = StoreAs01
  end
  object DepartmentTotals: TqFBoolControl
    Left = 328
    Top = 192
    Width = 200
    Height = 21
    DisplayName = #1055#1110#1076#1089#1091#1084#1082#1080' '#1079#1072' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1086#1084
    Interval = 120
    Value = True
    LabelColor = clGreen
    Required = True
    Semicolon = False
    Asterisk = False
    Enabled = True
    Default = 'True'
    Blocked = False
    TabOrder = 12
    AutoSaveToRegistry = True
    StoreAs = StoreAs01
  end
  object SmetaTotals: TqFBoolControl
    Left = 328
    Top = 216
    Width = 200
    Height = 21
    DisplayName = #1055#1110#1076#1089#1091#1084#1082#1080' '#1079#1072' '#1073#1102#1076#1078#1077#1090#1086#1084
    Interval = 120
    Value = True
    LabelColor = clGreen
    Required = True
    Semicolon = False
    Asterisk = False
    Enabled = True
    Default = 'True'
    Blocked = False
    TabOrder = 13
    AutoSaveToRegistry = True
    StoreAs = StoreAs01
  end
  object DB: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 204
    Top = 426
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 244
    Top = 426
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 276
    Top = 426
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39604.616261018500000000
    ReportOptions.LastChange = 40973.860571620370000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      
        'procedure AppStyle(Memo: TfrxMemoView; App: Boolean; Center: Boo' +
        'lean = False);'
      'begin'
      '    if App then'
      '       begin'
      '               Memo.Font.Style := fsBold;'
      '               if Center then'
      '                      Memo.HAlign := haCenter;'
      '               Memo.Color := $F0F0F0;'
      '       end'
      '       else'
      '       begin'
      '               Memo.Font.Style := 0;'
      '               if Center then'
      '                       Memo.HAlign := haLeft;'
      '               Memo.Color := clWhite;'
      '       end'
      'end;'
      ''
      ''
      'procedure Memo1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'end;'
      ''
      'procedure ReportOnStartReport(Sender: TfrxComponent);'
      'begin'
      '{ if <UseColumn5> = False then'
      '  begin'
      '       Memo10.Visible := False;'
      '       Memo11.Visible := False;'
      '       Memo1.Width := Memo1.Width + Memo10.Width;'
      '       Memo16.Visible := False;'
      '       Memo12.Width := Memo12.Width + Memo16.Width;'
      ''
      '       Memo21.Visible := False;'
      '       Memo17.Width := Memo17.Width + Memo21.Width;'
      ''
      '       Memo29.Visible := False;'
      '       Memo30.Visible := False;'
      '       Memo22.Width := Memo22.Width + Memo29.Width;'
      ''
      '       Memo47.Visible := False;'
      '       Memo48.Visible := False;'
      '       Memo40.Width := Memo40.Width + Memo47.Width;'
      ''
      '       Memo39.Visible := False;'
      '       Memo35.Visible := False;'
      '       Memo31.Width := Memo31.Width + Memo35.Width;'
      '  end;'
      ''
      '  GroupFooter1.Visible := <PostTotals>;'
      '  GroupFooter2.Visible := <DepartmentTotals>;'
      '  GroupFooter3.Visible := <SmetaTotals>;          }'
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      ''
      'begin'
      ''
      'end.')
    OnStartReport = 'ReportOnStartReport'
    Left = 509
    Top = 7
    Datasets = <
      item
        DataSet = frxData
        DataSetName = 'Data'
      end>
    Variables = <
      item
        Name = 'UseColumn5'
        Value = 'False'
      end
      item
        Name = 'Act_Date'
        Value = #39'09.06.2008'#39
      end
      item
        Name = 'PostTotals'
        Value = 'False'
      end
      item
        Name = 'DepartmentTotals'
        Value = 'False'
      end
      item
        Name = 'SmetaTotals'
        Value = 'False'
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
      OnBeforePrint = 'Page1OnBeforePrint'
      object MasterData1: TfrxMasterData
        Height = 16.000000000000000000
        Top = 385.512060000000000000
        Width = 1046.929810000000000000
        DataSet = frxData
        DataSetName = 'Data'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 22.677180000000000000
          Width = 374.173213700000000000
          Height = 15.874015750000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          DataSet = frxData
          DataSetName = 'Data'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            '[Data."bonus_name"]')
        end
        object Memo69: TfrxMemoView
          Left = 396.850650000000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          AllowExpressions = False
          DataSet = frxData
          DataSetName = 'Data'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
        end
        object Memo70: TfrxMemoView
          Align = baLeft
          Left = 532.913642120000000000
          Width = 68.031496060000000000
          Height = 15.874015748031500000
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo71: TfrxMemoView
          Align = baLeft
          Left = 668.976634240000000000
          Width = 68.031496060000000000
          Height = 15.874015748031500000
          DataSet = frxData
          DataSetName = 'Data'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
        end
        object Memo72: TfrxMemoView
          Align = baLeft
          Left = 464.882146060000000000
          Width = 68.031496060000000000
          Height = 15.874015748031500000
          DataSet = frxData
          DataSetName = 'Data'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
        end
        object Memo73: TfrxMemoView
          Align = baLeft
          Left = 600.945138180000000000
          Width = 68.031496060000000000
          Height = 15.874015748031500000
          DataSet = frxData
          DataSetName = 'Data'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
        end
        object Memo74: TfrxMemoView
          Align = baLeft
          Left = 737.008130300000000000
          Width = 68.031496060000000000
          Height = 15.874015748031500000
          DataSet = frxData
          DataSetName = 'Data'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
        end
        object Memo75: TfrxMemoView
          Left = 857.953532130000000000
          Width = 68.031496060000000000
          Height = 15.874015748031500000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[Data."Sum_Nadb_Obov"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 805.040146300000000000
          Width = 52.913385830000000000
          Height = 15.874015748031500000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[Data."Percent_Obov"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 978.898414020000000000
          Width = 68.031496060000000000
          Height = 15.874015748031500000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[Data."Sum_Nadb_Neobov"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 925.985028190000000000
          Width = 52.913385830000000000
          Height = 15.874015748031500000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[Data."Percent_neobov"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Height = 21.779530000000000000
        ParentFont = False
        Top = 264.567100000000000000
        Width = 1046.929810000000000000
        Condition = 'Data."DEPARTMENT_NAME"'
        Stretched = True
        object Memo2: TfrxMemoView
          Align = baClient
          Width = 1046.929810000000000000
          Height = 21.779530000000000000
          StretchMode = smMaxHeight
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1088#1086#1079#1076#1110#1083': [Data."DEPARTMENT_NAME"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 20.031496060000000000
        Top = 181.417440000000000000
        Width = 1046.929810000000000000
        Condition = 'Data."id_smet"'
        Stretched = True
        object Memo9: TfrxMemoView
          Align = baClient
          Width = 1046.929810000000000000
          Height = 20.031496060000000000
          StretchMode = smMaxHeight
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1041#1102#1076#1078#1077#1090': [Data."SMETA_TITLE"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 56.960622600000000000
        Top = 64.252010000000000000
        Width = 1046.929810000000000000
        object Memo12: TfrxMemoView
          Align = baLeft
          Top = 7.826764330000000000
          Width = 396.850393700000000000
          Height = 49.133858270000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072' / '#1085#1072#1076#1073#1072#1074#1082#1080' '#1090#1072' '#1076#1086#1087#1083#1072#1090#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 600.944881880000000000
          Top = 32.393693460000000000
          Width = 68.031496060000000000
          Height = 24.566929130000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1089#1091#1084#1072' '#1087#1086' '#1086#1082#1083#1072#1076#1072#1084)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 532.913385820000000000
          Top = 32.393693460000000000
          Width = 68.031496060000000000
          Height = 24.566929130000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1089#1090#1072#1074#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 396.850393700000000000
          Top = 7.826764330000000000
          Width = 136.062992130000000000
          Height = 24.566929130000000000
          Color = 15000804
          DataSet = frxData
          DataSetName = 'Data'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1083#1072#1085)
        end
        object Memo16: TfrxMemoView
          Left = 464.881889760000000000
          Top = 32.393693460000000000
          Width = 68.031496060000000000
          Height = 24.566929130000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1089#1091#1084#1072' '#1087#1086' '#1086#1082#1083#1072#1076#1072#1084)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 396.850393700000000000
          Top = 32.393693460000000000
          Width = 68.031496060000000000
          Height = 24.566929130000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1089#1090#1072#1074#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 532.913385830000000000
          Top = 7.826764330000000000
          Width = 136.062992130000000000
          Height = 24.566929130000000000
          Color = 15000804
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1072#1082#1090)
        end
        object Memo14: TfrxMemoView
          Left = 737.007874000000000000
          Top = 32.393693460000000000
          Width = 68.031496060000000000
          Height = 24.566929130000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1089#1091#1084#1072' '#1087#1086' '#1086#1082#1083#1072#1076#1072#1084)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 668.976377940000000000
          Top = 32.393693460000000000
          Width = 68.031496060000000000
          Height = 24.566929130000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1089#1090#1072#1074#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 668.976377960000000000
          Top = 7.826764330000000000
          Width = 136.062992130000000000
          Height = 24.566929130000000000
          Color = 15000804
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1093#1080#1083#1077#1085#1085#1103)
        end
        object Memo35: TfrxMemoView
          Left = 857.952755890000000000
          Top = 32.393693460000000000
          Width = 68.031496060000000000
          Height = 24.566929130000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1089#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 805.039370060000000000
          Top = 32.393693460000000000
          Width = 52.913385830000000000
          Height = 24.566929130000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 805.039370090000000000
          Top = 7.826764330000000000
          Width = 120.944881890000000000
          Height = 24.566929130000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1076#1073#1072#1074#1082#1080' '#1086#1073#1086#1074'. '#1093#1072#1088#1072#1082#1090#1077#1088#1091)
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 978.897637780000000000
          Top = 32.393693460000000000
          Width = 68.031496060000000000
          Height = 24.566929130000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1089#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 925.984251950000000000
          Top = 32.393693460000000000
          Width = 52.913385830000000000
          Height = 24.566929130000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '%')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 925.984251980000000000
          Top = 7.826764330000000000
          Width = 120.944881890000000000
          Height = 24.566929130000000000
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1076#1073#1072#1074#1082#1080' '#1085#1077#1086#1073#1086#1074'. '#1093#1072#1088#1072#1082#1090#1077#1088#1091)
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 16.000000000000000000
        Top = 461.102660000000000000
        Width = 1046.929810000000000000
        object Memo17: TfrxMemoView
          Align = baLeft
          Width = 396.850393700000000000
          Height = 16.000000000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1056#1040#1047#1054#1052' '#1079#1072' '#1087#1086#1089#1072#1076#1086#1102':')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Align = baLeft
          Left = 464.882146060000000000
          Width = 68.031496060000000000
          Height = 16.000000000000000000
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[Data."PLAN_SUM"]')
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          Left = 600.945226060000000000
          Width = 68.031496060000000000
          Height = 16.000000000000000000
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Oklad_People">,MasterData1)]')
        end
        object Memo20: TfrxMemoView
          Align = baLeft
          Left = 737.008306060000000000
          Width = 68.031496060000000000
          Height = 16.000000000000000000
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."DIFF_SUM">,MasterData1)]')
        end
        object Memo91: TfrxMemoView
          Left = 396.850650000000000000
          Width = 68.031496060000000000
          Height = 16.000000000000000000
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[Data."Column2"]')
        end
        object Memo92: TfrxMemoView
          Left = 532.913730000000000000
          Width = 68.031496060000000000
          Height = 16.000000000000000000
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<Data."Kol_Stavok_People">,MasterData1)]')
        end
        object Memo93: TfrxMemoView
          Left = 668.976810000000000000
          Width = 68.031496060000000000
          Height = 16.000000000000000000
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<Data."COLUMN4">,MasterData1)]')
        end
        object Memo94: TfrxMemoView
          Left = 805.039890000000000000
          Width = 52.913385830000000000
          Height = 15.874015750000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 857.953310000000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Sum_Nadb_Obov">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Left = 925.984850000000000000
          Width = 52.913385830000000000
          Height = 15.874015750000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 978.898270000000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Sum_Nadb_Neobov">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 15.874018190000000000
        Top = 309.921460000000000000
        Width = 1046.929810000000000000
        Condition = 'Data."FULL_POST_NAME"'
        object Memo51: TfrxMemoView
          Top = 0.000002439999999992
          Width = 396.850393700000000000
          Height = 15.874015750000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[Data."FULL_POST_NAME"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 396.850393700000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[Data."COLUMN2"]')
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Left = 532.913385820000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[Data."COLUMN3"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          Left = 668.976377940000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[Data."COLUMN4"]')
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          Left = 464.881889760000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[Data."PLAN_SUM"]')
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Left = 600.944881880000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[Data."FACT_SUM"]')
        end
        object Memo8: TfrxMemoView
          Align = baLeft
          Left = 737.007874000000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[Data."DIFF_SUM"]')
        end
        object Memo55: TfrxMemoView
          Left = 857.953275830000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 805.039890000000000000
          Width = 52.913385830000000000
          Height = 15.874015750000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 978.898157720000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 925.984771890000000000
          Width = 52.913385830000000000
          Height = 15.874015750000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 15.874018190000000000
        Top = 498.897960000000000000
        Width = 1046.929810000000000000
        object Memo22: TfrxMemoView
          Align = baLeft
          Width = 396.850393700000000000
          Height = 15.874015750000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1056#1040#1047#1054#1052' '#1079#1072' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1086#1084':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          Left = 396.850393700000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."PLAN_RATE_COUNT_SMET">,MasterData1)]')
        end
        object Memo24: TfrxMemoView
          Align = baLeft
          Left = 532.913385820000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Kol_Stavok_People">,MasterData1)]')
        end
        object Memo25: TfrxMemoView
          Align = baLeft
          Left = 668.976377940000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."DIFF_RATE_COUNT_SMET">,MasterData1)]')
        end
        object Memo26: TfrxMemoView
          Align = baLeft
          Left = 464.881889760000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."PLAN_SUM">)]')
        end
        object Memo27: TfrxMemoView
          Align = baLeft
          Left = 600.944881880000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Oklad_People">,MasterData1)]')
        end
        object Memo28: TfrxMemoView
          Align = baLeft
          Left = 737.007874000000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."DIFF_SUM">,MasterData1)]')
        end
        object Memo98: TfrxMemoView
          Align = baLeft
          Left = 805.039370060000000000
          Top = 0.000002439999999992
          Width = 52.913385830000000000
          Height = 15.874015750000000000
          Color = 15000804
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Align = baLeft
          Left = 857.952755890000000000
          Top = 0.000002439999999992
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = 15000804
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Sum_Nadb_Obov">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo100: TfrxMemoView
          Align = baLeft
          Left = 925.984251950000000000
          Top = 0.000002439999999992
          Width = 52.913385830000000000
          Height = 15.874015750000000000
          Color = 15000804
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo101: TfrxMemoView
          Align = baLeft
          Left = 978.897637780000000000
          Top = 0.000002439999999992
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = 15000804
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Sum_Nadb_Neobov">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 75.590551180000000000
        Top = 657.638220000000000000
        Width = 1046.929810000000000000
        object Memo117: TfrxMemoView
          Align = baLeft
          Top = 3.779530000000000000
          Width = 396.850393700000000000
          Height = 22.677165350000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          Color = 15790320
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1047#1040#1043#1040#1051#1068#1053#1048#1049' '#1055#1030#1044#1057#1059#1052#1054#1050':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 859.023810000000000000
          Top = 34.015770000000000000
          Width = 150.000000000000000000
          Height = 16.000000000000000000
          HAlign = haRight
          Memo.Strings = (
            #1089#1090#1086#1088'. [Page#] '#1079' [TotalPages#]')
        end
        object Memo31: TfrxMemoView
          Left = 396.850606060000000000
          Top = 3.779530000000000000
          Width = 68.031496060000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."PLAN_RATE_COUNT_SMET">,MasterData1)]')
        end
        object Memo32: TfrxMemoView
          Left = 532.913642120000000000
          Top = 3.779530000000000000
          Width = 68.031496060000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Kol_Stavok_People">,MasterData1)]')
        end
        object Memo33: TfrxMemoView
          Left = 668.976634240000000000
          Top = 3.779530000000000000
          Width = 68.031496060000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."DIFF_RATE_COUNT_SMET">,MasterData1)]')
        end
        object Memo34: TfrxMemoView
          Left = 464.882190000000000000
          Top = 3.779530000000000000
          Width = 68.031496060000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."PLAN_SUM">,MasterData1)]')
        end
        object Memo36: TfrxMemoView
          Left = 600.945138180000000000
          Top = 3.779530000000000000
          Width = 68.031496060000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."FACT_SUM">,MasterData1)]')
        end
        object Memo37: TfrxMemoView
          Left = 737.008130300000000000
          Top = 3.779530000000000000
          Width = 68.031496060000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."DIFF_SUM">,MasterData1)]')
        end
        object Memo38: TfrxMemoView
          Left = 805.039626360000000000
          Top = 3.779532440000000000
          Width = 52.913385830000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 857.953012190000000000
          Top = 3.779532440000000000
          Width = 68.031496060000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Sum_Nadb_Obov">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          Left = 925.984508250000000000
          Top = 3.779532440000000000
          Width = 52.913385830000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo120: TfrxMemoView
          Align = baLeft
          Left = 978.897894080000000000
          Top = 3.779532440000000000
          Width = 68.031496060000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Sum_Nadb_Neobov">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter3: TfrxGroupFooter
        Height = 22.677167790000000000
        Top = 574.488560000000000000
        Width = 1046.929810000000000000
        object Memo40: TfrxMemoView
          Align = baLeft
          Width = 396.850393700000000000
          Height = 22.677165350000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          Color = 15790320
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1056#1040#1047#1054#1052' '#1079#1072' '#1073#1102#1076#1078#1077#1090#1086#1084':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 396.850606060000000000
          Width = 68.031496060000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."PLAN_RATE_COUNT_SMET">,MasterData1)]')
        end
        object Memo42: TfrxMemoView
          Left = 532.913642120000000000
          Width = 68.031496060000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Kol_Stavok_People">,MasterData1)]')
        end
        object Memo43: TfrxMemoView
          Left = 668.976634240000000000
          Width = 68.031496060000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."DIFF_RATE_COUNT_SMET">,MasterData1)]')
        end
        object Memo44: TfrxMemoView
          Left = 464.882190000000000000
          Width = 68.031496060000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."PLAN_SUM">,MasterData1)]')
        end
        object Memo45: TfrxMemoView
          Left = 600.945138180000000000
          Width = 68.031496060000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Oklad_People">,MasterData1)]')
        end
        object Memo46: TfrxMemoView
          Left = 737.008130300000000000
          Width = 68.031496060000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."DIFF_SUM">,MasterData1)]')
        end
        object Memo113: TfrxMemoView
          Left = 805.039626360000000000
          Top = 0.000002439999999992
          Width = 52.913385830000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          Left = 857.953012190000000000
          Top = 0.000002439999999992
          Width = 68.031496060000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Sum_Nadb_Obov">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo115: TfrxMemoView
          Left = 925.984508250000000000
          Top = 0.000002439999999992
          Width = 52.913385830000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Align = baLeft
          Left = 978.897894080000000000
          Top = 0.000002439999999992
          Width = 68.031496060000000000
          Height = 22.677165350000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Sum_Nadb_Neobov">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 21.102350000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo49: TfrxMemoView
          Align = baClient
          Width = 1046.929810000000000000
          Height = 21.102350000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1048#1050#1054#1053#1040#1053#1053#1071' '#1064#1058#1040#1058#1053#1054#1043#1054' '#1056#1054#1047#1050#1051#1040#1044#1059' '#1053#1040' [Act_Date]')
          ParentFont = False
        end
      end
      object GroupHeader4: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 222.992270000000000000
        Width = 1046.929810000000000000
        Condition = 'Data."id_type_post"'
        object Memo80: TfrxMemoView
          Align = baClient
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Color = 14737632
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091': [Data."Name_Type_Post"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter4: TfrxGroupFooter
        Height = 15.874018190000000000
        Top = 536.693260000000000000
        Width = 1046.929810000000000000
        object Memo102: TfrxMemoView
          Align = baLeft
          Width = 396.850393700000000000
          Height = 15.874015750000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1056#1040#1047#1054#1052' '#1079#1072' '#1090#1080#1087#1086#1084' '#1087#1077#1088#1089#1086#1085#1072#1083#1091': ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo103: TfrxMemoView
          Align = baLeft
          Left = 396.850393700000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."PLAN_RATE_COUNT_SMET">,MasterData1)]')
        end
        object Memo104: TfrxMemoView
          Align = baLeft
          Left = 532.913385820000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Kol_Stavok_People">,MasterData1)]')
        end
        object Memo105: TfrxMemoView
          Align = baLeft
          Left = 668.976377940000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."DIFF_RATE_COUNT_SMET">,MasterData1)]')
        end
        object Memo106: TfrxMemoView
          Align = baLeft
          Left = 464.881889760000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."PLAN_SUM">,MasterData1)]')
        end
        object Memo107: TfrxMemoView
          Align = baLeft
          Left = 600.944881880000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Oklad_People">,MasterData1)]')
        end
        object Memo108: TfrxMemoView
          Align = baLeft
          Left = 737.007874000000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = 14737632
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."DIFF_SUM">,MasterData1)]')
        end
        object Memo109: TfrxMemoView
          Align = baLeft
          Left = 805.039370060000000000
          Top = 0.000002439999999992
          Width = 52.913385830000000000
          Height = 15.874015750000000000
          Color = 15000804
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Align = baLeft
          Left = 857.952755890000000000
          Top = 0.000002439999999992
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = 15000804
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Sum_Nadb_Obov">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Align = baLeft
          Left = 925.984251950000000000
          Top = 0.000002439999999992
          Width = 52.913385830000000000
          Height = 15.874015750000000000
          Color = 15000804
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo112: TfrxMemoView
          Align = baLeft
          Left = 978.897637780000000000
          Top = 0.000002439999999992
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = 15000804
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Sum_Nadb_Neobov">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader5: TfrxGroupHeader
        Height = 16.000000000000000000
        Top = 347.716760000000000000
        Width = 1046.929810000000000000
        Condition = 'Data."id_man_moving"'
        Stretched = True
        object Memo52: TfrxMemoView
          Width = 396.850393700000000000
          Height = 15.874015750000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[Data."FIO"]')
        end
        object Memo59: TfrxMemoView
          Left = 396.850650000000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          StretchMode = smMaxHeight
          DataSet = frxData
          DataSetName = 'Data'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
        end
        object Memo60: TfrxMemoView
          Align = baLeft
          Left = 532.913642120000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          StretchMode = smMaxHeight
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[Data."Kol_Stavok_People"]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Align = baLeft
          Left = 668.976634240000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          StretchMode = smMaxHeight
          DataSet = frxData
          DataSetName = 'Data'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
        end
        object Memo62: TfrxMemoView
          Align = baLeft
          Left = 464.882146060000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          StretchMode = smMaxHeight
          DataSet = frxData
          DataSetName = 'Data'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
        end
        object Memo63: TfrxMemoView
          Align = baLeft
          Left = 600.945138180000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          StretchMode = smMaxHeight
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[Data."Oklad_People"]')
        end
        object Memo64: TfrxMemoView
          Align = baLeft
          Left = 737.008130300000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          StretchMode = smMaxHeight
          DataSet = frxData
          DataSetName = 'Data'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
        end
        object Memo65: TfrxMemoView
          Left = 857.953532130000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 805.040146300000000000
          Width = 52.913385830000000000
          Height = 15.874015750000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 978.898414020000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 925.985028190000000000
          Width = 52.913385830000000000
          Height = 15.874015750000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter5: TfrxGroupFooter
        Height = 16.000000000000000000
        Top = 423.307360000000000000
        Width = 1046.929810000000000000
        object Memo79: TfrxMemoView
          Align = baLeft
          Width = 396.850393700000000000
          Height = 16.000000000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1056#1040#1047#1054#1052' '#1079#1072' '#1083#1102#1076#1080#1085#1086#1102':')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 396.850650000000000000
          Width = 68.031496060000000000
          Height = 16.000000000000000000
          DataSet = frxData
          DataSetName = 'Data'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
        end
        object Memo82: TfrxMemoView
          Align = baLeft
          Left = 532.913642120000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[Data."Kol_Stavok_People"]')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          Align = baLeft
          Left = 668.976634240000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          DataSet = frxData
          DataSetName = 'Data'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
        end
        object Memo84: TfrxMemoView
          Align = baLeft
          Left = 464.882146060000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          DataSet = frxData
          DataSetName = 'Data'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
        end
        object Memo85: TfrxMemoView
          Align = baLeft
          Left = 600.945138180000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[Data."Oklad_People"]')
        end
        object Memo86: TfrxMemoView
          Align = baLeft
          Left = 737.008130300000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          DataSet = frxData
          DataSetName = 'Data'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
        end
        object Memo87: TfrxMemoView
          Left = 857.953532130000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Sum_Nadb_Obov">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 805.040146300000000000
          Width = 52.913385830000000000
          Height = 15.874015750000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo89: TfrxMemoView
          Left = 978.898414020000000000
          Width = 68.031496060000000000
          Height = 15.874015750000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[SUM(<Data."Sum_Nadb_Neobov">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 925.985028190000000000
          Width = 52.913385830000000000
          Height = 15.874015750000000000
          Color = clWhite
          DataSet = frxData
          DataSetName = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 406
    Top = 426
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 374
    Top = 426
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
    Left = 446
    Top = 426
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 342
    Top = 426
  end
  object frxData: TfrxDBDataset
    UserName = 'Data'
    CloseDataSource = False
    DataSet = ReportData
    Left = 432
    Top = 8
  end
  object ReportData: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM UP_SHTAT_REPORT_EXEC(:Id_SR, :Filter_Id_Department' +
        ', :Id_Sm_Session,'
      
        ':Act_Date, :Filter_Id_Type_Post, :Id_Level, :Show_Raise, :Show_O' +
        'nly_Overflow)')
    Left = 472
    Top = 8
    poSQLINT64ToBCD = True
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 308
    Top = 426
  end
  object GetIdSession: TpFIBDataSet
    Database = DB
    Transaction = WriteTransaction
    SelectSQL.Strings = (
      'SELECT Ret_Value'
      'FROM Pub_Get_Id_By_Gen('#39'GEN_PUB_SP_SMETA_TEMP'#39', 1)')
    Left = 72
    Top = 336
    poSQLINT64ToBCD = True
  end
  object LevelsSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT Id_Level, Level_Order, Level_Name FROM UP_SYS_LEVEL'
      'ORDER BY Level_Order')
    Left = 408
    Top = 248
    poSQLINT64ToBCD = True
    object LevelsSelectID_LEVEL: TFIBBCDField
      FieldName = 'ID_LEVEL'
      Visible = False
      Size = 0
      RoundByScale = True
    end
    object LevelsSelectLEVEL_ORDER: TFIBIntegerField
      DisplayLabel = #1056#1110#1074#1077#1085#1100
      DisplayWidth = 20
      FieldName = 'LEVEL_ORDER'
    end
    object LevelsSelectLEVEL_NAME: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1088#1110#1074#1085#1103' '#1072#1082#1090#1091#1072#1083#1100#1085#1086#1089#1090#1110
      FieldName = 'LEVEL_NAME'
      Size = 50
      EmptyStrToNull = True
    end
  end
  object SelectTypePost: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Sp_Type_Post'
      'ORDER BY Display_Order')
    Left = 472
    Top = 184
    poSQLINT64ToBCD = True
    object SelectTypePostID_TYPE_POST: TFIBIntegerField
      FieldName = 'ID_TYPE_POST'
      Visible = False
    end
    object SelectTypePostNAME_TYPE_POST: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1090#1080#1087#1091' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
      FieldName = 'NAME_TYPE_POST'
      Size = 50
      EmptyStrToNull = True
    end
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 272
    Top = 518
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 488
    Top = 424
  end
end
