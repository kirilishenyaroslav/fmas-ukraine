object fmShtatAdd: TfmShtatAdd
  Left = 268
  Top = 206
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fmShtatAdd'
  ClientHeight = 544
  ClientWidth = 703
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object FormControl: TqFFormControl
    Left = 40
    Top = 488
    Width = 60
    Height = 21
    ControlsOwner = Owner
    InsertSQL.Strings = (
      'SELECT Id_ShtatRas_Smet'
      
        'FROM Shtat_Insert(:add, :Id_Department, :Id_Type_Post, :Id_Post_' +
        'Salary,'
      ':Id_Pay_Form, :Id_Work_Cond, :Id_Work_Mode, :Comment, :Kod_Sm,'
      ':Kol_Stavok, :Oklad, :Date_Beg, :Date_End, :Koeff_Pps,'
      
        ':Kod_Sm_Pps, :Id_Spz, :Base_Oklad, :Oklad_Pps, :Acc_Id_User, :wh' +
        'ere, :Bonus_Dates)')
    UpdateSQL.Strings = (
      'EXECUTE PROCEDURE Shtat_Update :where, :add,'
      ':Id_Department, :Id_Type_Post, :Id_Post_Salary, :Id_Pay_Form,'
      ':Id_Work_Cond, :Id_Work_Mode, :Comment, :Kod_Sm, :Kol_Stavok,'
      ':Oklad, :Date_Beg, :Date_End,  :Koeff_Pps, :Kod_Sm_Pps,'
      ':Id_Spz, :Base_Oklad, :Oklad_Pps, :Acc_Id_User, :Bonus_Dates')
    SelectSQL.Strings = (
      'SELECT * FROM Shtat_Smet_Info(:where)')
    AddCaption = #1044#1086#1076#1072#1090#1080' '#1087#1086#1079#1080#1094#1110#1102' '#1096#1090#1072#1090#1085#1086#1075#1086' '#1088#1086#1079#1082#1083#1072#1076#1091
    ModifyCaption = #1047#1084#1110#1085#1080#1090#1080' '#1087#1086#1079#1080#1094#1110#1102' '#1096#1090#1072#1090#1085#1086#1075#1086' '#1088#1086#1079#1082#1083#1072#1076#1091
    InfoCaption = #1055#1086#1079#1080#1094#1110#1103' '#1096#1090#1072#1090#1085#1086#1075#1086' '#1088#1086#1079#1082#1083#1072#1076#1091': '#1087#1077#1088#1077#1075#1083#1103#1076
    AfterPrepare = FormControlAfterPrepare
    NewRecordAfterPrepare = FormControlNewRecordAfterPrepare
    AfterRecordAdded = FormControlAfterRecordAdded
    DatabaseEventBefore = FormControlDatabaseEventBefore
    Mode = fmAdd
    CheckWhere = True
    CloseForm = True
    ShowErrorDialog = True
    ShowDebugInfoInOk = False
  end
  object OkButton: TBitBtn
    Left = 214
    Top = 488
    Width = 97
    Height = 28
    Action = Accept
    Caption = #1043#1072#1088#1072#1079#1076
    Default = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
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
    Left = 398
    Top = 487
    Width = 97
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
  object PageControl: TPageControl
    Left = 16
    Top = 15
    Width = 681
    Height = 466
    ActivePage = MainPage
    TabOrder = 2
    object MainPage: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
      object OkladRange: TLabel
        Left = 146
        Top = 243
        Width = 13
        Height = 13
        Caption = '---'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 620
        Top = 20
        Width = 40
        Height = 13
        Caption = '[Ctrl-'#1050']'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 620
        Top = 52
        Width = 41
        Height = 13
        Caption = '[Ctrl-'#1055']'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 620
        Top = 89
        Width = 41
        Height = 13
        Caption = '[Ctrl-'#1054']'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object qFSimpleCheck1: TqFSimpleCheck
        Left = DateBeg
        Top = 320
        Width = 36
        Height = 21
        Right = DateEnd
        ErrorMessage = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1087#1077#1088#1110#1086#1076#1091' '#1087#1086#1074#1080#1085#1085#1072' '#1073#1091#1090#1080' '#1084#1077#1085#1096#1086#1102' '#1079#1072' '#1076#1072#1090#1091' '#1082#1110#1085#1094#1103'!'
      end
      object OkladCheck: TqFLogicCheck
        Left = 192
        Top = 240
        Width = 36
        Height = 21
        OnCheck = OkladCheckCheck
        LightControl = Base_Oklad
      end
      object Label4: TLabel
        Left = 620
        Top = 348
        Width = 40
        Height = 13
        Caption = '[Ctrl-'#1058']'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 620
        Top = 196
        Width = 40
        Height = 13
        Caption = '[Ctrl-'#1042']'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 620
        Top = 380
        Width = 40
        Height = 13
        Caption = '[Ctrl-'#1042']'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object UsePpsLabel: TLabel
        Left = 368
        Top = 170
        Width = 13
        Height = 13
        Caption = '---'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object OkladPpsRange: TLabel
        Left = 503
        Top = 243
        Width = 13
        Height = 13
        Caption = '---'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 0
        Top = 77
        Width = 650
        Height = 4
      end
      object Bevel2: TBevel
        Left = 0
        Top = 224
        Width = 649
        Height = 4
      end
      object Bevel3: TBevel
        Left = 0
        Top = 152
        Width = 649
        Height = 4
      end
      object Bevel4: TBevel
        Left = 0
        Top = 298
        Width = 649
        Height = 4
      end
      object CheckOkladPps: TqFLogicCheck
        Left = 528
        Top = 240
        Width = 36
        Height = 21
        OnCheck = CheckOkladPpsCheck
        LightControl = Oklad_Pps
      end
      object Smeta: TqFSpravControl
        Left = 8
        Top = 16
        Width = 601
        Height = 21
        FieldName = 'Kod_Sm'
        DisplayName = '&'#1050#1086#1096#1090#1086#1088#1080#1089
        Interval = 140
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 1
        AutoSaveToRegistry = False
        OnOpenSprav = SmetaOpenSprav
        DisplayText = ''
        DisplayTextField = 'Smeta_Title'
      end
      object Department: TqFSpravControl
        Left = 8
        Top = 48
        Width = 601
        Height = 21
        FieldName = 'Id_Department'
        DisplayName = '&'#1055#1110#1076#1088#1086#1079#1076#1110#1083
        Interval = 140
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 3
        AutoSaveToRegistry = False
        OnOpenSprav = DepartmentOpenSprav
        DisplayText = ''
        DisplayTextField = 'Name_Department'
      end
      object PostSalary: TqFSpravControl
        Left = 8
        Top = 89
        Width = 601
        Height = 21
        FieldName = 'Id_Post_Salary'
        DisplayName = #1055#1086#1089#1072#1076#1086#1074#1080#1081' &'#1086#1082#1083#1072#1076
        Interval = 120
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        OnChange = PostSalaryChange
        Blocked = False
        TabOrder = 4
        AutoSaveToRegistry = False
        OnOpenSprav = PostSalaryOpenSprav
        DisplayText = ''
        DisplayTextField = 'Salary_Name'
      end
      object Base_Oklad: TqFFloatControl
        Left = 8
        Top = 239
        Width = 137
        Height = 21
        FieldName = 'Base_Oklad'
        DisplayName = #1054#1082#1083#1072#1076
        Interval = 60
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = False
        Enabled = True
        OnChange = Base_OkladChange
        Default = Null
        Blocked = False
        TabOrder = 9
        AutoSaveToRegistry = False
        MaxLength = 0
        NegativeAllowed = False
        Precision = 2
        Format = '########0.00'
      end
      object Kol_Stavok: TqFFloatControl
        Left = 8
        Top = 120
        Width = 209
        Height = 21
        FieldName = 'Kol_Stavok'
        DisplayName = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1089#1090#1072#1074#1086#1082
        Interval = 120
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 5
        AutoSaveToRegistry = False
        MaxLength = 0
        NegativeAllowed = False
        Precision = 4
        Format = '#########0.0000'
      end
      object DateBeg: TqFDateControl
        Left = 8
        Top = 312
        Width = 225
        Height = 21
        FieldName = 'Date_Beg'
        DisplayName = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091
        Interval = 120
        Value = 38476
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = True
        Enabled = True
        OnChange = DateBegChange
        Blocked = False
        TabOrder = 12
        AutoSaveToRegistry = False
        CheckDateIsEmpty = False
      end
      object DateEnd: TqFDateControl
        Left = 344
        Top = 312
        Width = 225
        Height = 21
        FieldName = 'Date_End'
        DisplayName = #1050#1110#1085#1077#1094#1100' '#1087#1077#1088#1110#1086#1076#1091
        Interval = 120
        Value = 38476
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = True
        Enabled = True
        OnChange = DateEndChange
        Blocked = False
        TabOrder = 13
        AutoSaveToRegistry = False
        CheckDateIsEmpty = False
      end
      object Koeff_Pps: TqFFloatControl
        Left = 8
        Top = 166
        Width = 361
        Height = 21
        FieldName = 'Koeff_Pps'
        DisplayName = #1050#1086#1077#1092#1110#1094#1110#1077#1085#1090' '#1087#1110#1076#1074#1080#1097#1077#1085#1085#1103' '#1086#1082#1083#1072#1076#1091
        Interval = 270
        Value = Null
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = True
        Enabled = True
        OnChange = Koeff_PpsChange
        Blocked = False
        TabOrder = 7
        AutoSaveToRegistry = False
        MaxLength = 0
        NegativeAllowed = False
        Precision = 2
        Format = '#########0.000'
      end
      object Kod_Sm_Pps: TqFSpravControl
        Left = 8
        Top = 194
        Width = 601
        Height = 21
        FieldName = 'Kod_Sm_Pps'
        DisplayName = #1047#1072' '#1088#1072#1093#1091#1085#1086#1082' '#1103#1082#1086#1075#1086' '#1082#1086#1096#1090#1086#1088#1080#1089#1091' '#1087#1110#1076'&'#1074#1080#1097#1077#1085#1085#1103
        Interval = 270
        Value = Null
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 8
        AutoSaveToRegistry = False
        OnOpenSprav = SmetaOpenSprav
        DisplayText = ''
        DisplayTextField = 'Pps_Smeta_Title'
      end
      object Type_Post: TqFSpravControl
        Left = 8
        Top = 344
        Width = 600
        Height = 21
        FieldName = 'Id_Type_Post'
        DisplayName = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
        Interval = 120
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 14
        AutoSaveToRegistry = False
        OnOpenSprav = Type_PostOpenSprav
        DisplayText = ''
        DisplayTextField = 'Name_Type_Post'
      end
      object Spz: TqFSpravControl
        Left = 8
        Top = 374
        Width = 600
        Height = 21
        FieldName = 'Id_Spz'
        DisplayName = #1042#1080#1076' '#1074#1080#1090#1088#1072#1090
        Interval = 120
        Value = Null
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 15
        AutoSaveToRegistry = False
        OnOpenSprav = SpzOpenSprav
        DisplayText = ''
        DisplayTextField = 'Name_Spz'
      end
      object Oklad_Pps: TqFFloatControl
        Left = 295
        Top = 239
        Width = 209
        Height = 21
        FieldName = 'Oklad_Pps'
        DisplayName = #1055#1110#1076#1074#1080#1097#1077#1085#1085#1103' '#1086#1082#1083#1072#1076#1091
        Interval = 150
        Value = 0.000000000000000000
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = False
        Enabled = True
        OnChange = Base_OkladChange
        Default = 0.000000000000000000
        Blocked = False
        TabOrder = 10
        AutoSaveToRegistry = False
        MaxLength = 0
        NegativeAllowed = False
        Precision = 2
        Format = '########0.00'
      end
      object Oklad: TqFFloatControl
        Left = 8
        Top = 271
        Width = 297
        Height = 21
        FieldName = 'Oklad'
        DisplayName = #1054#1082#1083#1072#1076' ('#1088#1072#1079#1086#1084' '#1079' '#1087#1110#1076#1074#1080#1097#1077#1085#1085#1103#1084')'
        Interval = 200
        Value = Null
        LabelColor = clMaroon
        Required = True
        Semicolon = True
        Asterisk = False
        Enabled = True
        Blocked = True
        TabOrder = 11
        AutoSaveToRegistry = False
        MaxLength = 0
        NegativeAllowed = False
        Precision = 2
        Format = '########0.00'
      end
      object VacantStavok: TqFCharControl
        Left = 384
        Top = 120
        Width = 193
        Height = 21
        FieldName = 'VACANTIONS_STR'
        DisplayName = #1042#1072#1082#1072#1085#1090#1085#1080#1093' '#1089#1090#1072#1074#1086#1082
        Interval = 120
        Value = ''
        LabelColor = clMaroon
        Required = False
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = True
        TabOrder = 6
        AutoSaveToRegistry = False
        MaxLength = 0
      end
      object BonusDates: TqFBoolControl
        Left = 16
        Top = 408
        Width = 200
        Height = 21
        FieldName = 'Bonus_Dates'
        DisplayName = #1050#1086#1088#1077#1075#1091#1074#1072#1090#1080' '#1076#1072#1090#1080' '#1085#1072#1076#1073#1072#1074#1086#1082
        Interval = 120
        Value = True
        LabelColor = clGreen
        Required = True
        Semicolon = False
        Asterisk = False
        Enabled = True
        Blocked = False
        TabOrder = 16
        AutoSaveToRegistry = False
        StoreAs = StoreAs01
      end
      object SmetEdit: TcxTextEdit
        Left = 87
        Top = 16
        Width = 49
        Height = 21
        Properties.MaxLength = 10
        Properties.OnChange = SmetEditPropertiesChange
        Style.Color = 16114144
        Style.LookAndFeel.Kind = lfStandard
        TabOrder = 0
        OnKeyPress = SmetEditKeyPress
      end
      object DepartEdit: TcxTextEdit
        Left = 87
        Top = 47
        Width = 49
        Height = 21
        Properties.MaxLength = 10
        Properties.OnChange = DepartEditPropertiesChange
        Style.Color = 16114144
        Style.LookAndFeel.Kind = lfStandard
        TabOrder = 2
        OnKeyPress = DepartEditKeyPress
      end
    end
    object AddPage: TTabSheet
      Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
      ImageIndex = 1
      object WorkMode: TqFSpravControl
        Left = 8
        Top = 16
        Width = 617
        Height = 21
        FieldName = 'Id_Work_Mode'
        DisplayName = #1056#1077#1078#1080#1084' '#1088#1086#1073#1086#1090#1080
        Interval = 120
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        OnChange = WorkModeChange
        Blocked = False
        TabOrder = 0
        AutoSaveToRegistry = False
        OnOpenSprav = WorkModeOpenSprav
        DisplayText = ''
        DisplayTextField = 'Name_Work_Mode'
      end
      object WorkCond: TqFSpravControl
        Left = 8
        Top = 120
        Width = 617
        Height = 21
        FieldName = 'Id_Work_Cond'
        DisplayName = #1059#1084#1086#1074#1080' '#1087#1088#1072#1094#1110
        Interval = 120
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 1
        AutoSaveToRegistry = False
        OnOpenSprav = WorkCondOpenSprav
        DisplayText = ''
        DisplayTextField = 'Name_Work_Cond'
      end
      object PayForm: TqFSpravControl
        Left = 8
        Top = 160
        Width = 617
        Height = 21
        FieldName = 'Id_Pay_Form'
        DisplayName = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1080
        Interval = 120
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 2
        AutoSaveToRegistry = False
        OnOpenSprav = PayFormOpenSprav
        DisplayText = ''
        DisplayTextField = 'Name_Pay_Form'
      end
      object qFMemoControl1: TqFMemoControl
        Left = 8
        Top = 200
        Width = 617
        Height = 205
        FieldName = 'Comment'
        DisplayName = #1044#1086#1076#1072#1090#1082#1086#1074#1086
        Interval = 120
        Value = ''
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 3
        AutoSaveToRegistry = False
        MaxLength = 0
      end
      object WorkModeGrid: TcxGrid
        Left = 8
        Top = 48
        Width = 617
        Height = 57
        TabOrder = 4
        object WorkModeGridDBTableView: TcxGridDBTableView
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsCustomize.ColumnFiltering = False
          OptionsData.Editing = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = qizzStyle
          object WorkModeGridDBTableViewDBColumn1: TcxGridDBColumn
            Styles.Content = stHeader
            Styles.Footer = stHeader
            Styles.Header = stHeader
          end
          object WorkModeGridDBTableViewDBColumn2: TcxGridDBColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object WorkModeGridDBTableViewDBColumn3: TcxGridDBColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object WorkModeGridDBTableViewDBColumn4: TcxGridDBColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object WorkModeGridDBTableViewDBColumn5: TcxGridDBColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object WorkModeGridDBTableViewDBColumn6: TcxGridDBColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object WorkModeGridDBTableViewDBColumn7: TcxGridDBColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object WorkModeGridDBTableViewDBColumn8: TcxGridDBColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
          end
        end
        object WorkModeGridLevel: TcxGridLevel
          GridView = WorkModeGridDBTableView
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 516
    Width = 703
    Height = 28
    Align = alBottom
    Caption = 
      'F10 '#1072#1073#1086' Enter = '#1079#1072#1085#1077#1089#1090#1080', Ctrl+Enter = '#1074#1110#1076#1082#1088#1080#1090#1080' '#1076#1086#1074#1110#1076#1085#1080#1082', Esc = '#1079 +
      #1072#1082#1088#1080#1090#1080' '#1092#1086#1088#1084#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object ActionList1: TActionList
    Left = 584
    Top = 472
    object OpenSmeta: TAction
      Caption = 'OpenSmeta'
      ShortCut = 16466
      OnExecute = OpenSmetaExecute
    end
    object OpenDepartment: TAction
      Caption = 'OpenDepartment'
      ShortCut = 16455
      OnExecute = OpenDepartmentExecute
    end
    object OpenSalary: TAction
      Caption = 'OpenSalary'
      ShortCut = 16458
      OnExecute = OpenSalaryExecute
    end
    object Accept: TAction
      Caption = #1043#1072#1088#1072#1079#1076
      ShortCut = 121
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
      OnExecute = AcceptExecute
    end
    object OpenTypePost: TAction
      Caption = 'OpenTypePost'
      ShortCut = 16462
      OnExecute = OpenTypePostExecute
    end
    object OpenSmetaPps: TAction
      Caption = 'OpenSmetaPps'
      ShortCut = 16452
      OnExecute = OpenSmetaPpsExecute
    end
    object OpenSPz: TAction
      Caption = 'OpenSPz'
      ShortCut = 16452
      OnExecute = OpenSPzExecute
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 232
    Top = 224
    object stBackground: TcxStyle
      AssignedValues = [svColor]
      Color = 14745599
    end
    object stContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stContentEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stContentOdd: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stFilterBox: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object stFooter: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object stGroup: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object stGroupByBox: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object stHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stInactive: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object stIncSearch: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object stIndicator: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object stPreview: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object stSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stHotTrack: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clMaroon
    end
    object qizzStyle: TcxGridTableViewStyleSheet
      Styles.Background = stBackground
      Styles.Content = stContent
      Styles.ContentEven = stContentEven
      Styles.ContentOdd = stContentOdd
      Styles.Inactive = stInactive
      Styles.IncSearch = stIncSearch
      Styles.Selection = stSelection
      Styles.FilterBox = stFilterBox
      Styles.Footer = stFooter
      Styles.Group = stGroup
      Styles.GroupByBox = stGroupByBox
      Styles.Header = stHeader
      Styles.Indicator = stIndicator
      Styles.Preview = stPreview
      BuiltIn = True
    end
  end
end
