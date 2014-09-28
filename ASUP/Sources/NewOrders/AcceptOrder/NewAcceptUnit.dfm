object NewAcceptForm: TNewAcceptForm
  Left = 354
  Top = 57
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 520
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object FormControl: TqFFormControl
    Left = 376
    Top = 480
    Width = 65
    Height = 21
    ControlsOwner = Owner
    InsertSQL.Strings = (
      'SELECT * FROM ASUP_MAN_MOVING_INSERT ('
      '    :ID_PCARD,'
      '    :DATE_BEG,'
      '    :DATE_END,'
      '    :ID_MOVING_TYPE,'
      '    :TEST_TERM,'
      '    :STAJIROVKA_TERM,'
      '    :IS_MAIN,'
      '    :ID_WORK_MODE,'
      '    :ID_SPZ,'
      '    :WORK_MODE_SHIFT,'
      '    :ID_DEPARTMENT,'
      '    null,'
      '    :TARIF,'
      '    :ID_POST_SALARY,'
      '    :ID_PAY_FORM,'
      '    :ID_WORK_COND,'
      '    :ID_ORDER_TYPE,'
      '    :NUM_ITEM,'
      '    :SUB_ITEM,'
      '    :ID_ORDER_GROUP,'
      '    :INTRO,'
      '    :ID_TYPE_POST,'
      '    :REASON,'
      '    :Is_Main_Post,'
      '    :ACCEPT_COND_DATE_BEG,'
      '    :ACCEPT_COND_DATE_END,'
      '    :ID_ACCEPT_COND,'
      '    :ID_WORK_REASON,'
      '    :ACCEPT_COND_YEARS,'
      '    :HOSPITAL_ID_PCARD,'
      '    :HOLIDAY_ID_PCARD,'
      '    :NOTE);')
    UpdateSQL.Strings = (
      'EXECUTE PROCEDURE ASUP_MAN_MOVING_UPDATE('
      '    :where,'
      '    :ID_PCARD,'
      '    :DATE_BEG,'
      '    :DATE_END,'
      '    :ID_MOVING_TYPE,'
      '    :ID_ORDER,'
      '    :TEST_TERM,'
      '    :STAJIROVKA_TERM,'
      '    :IS_MAIN,'
      '    :ID_WORK_MODE,'
      '    :ID_SPZ,'
      '    :WORK_MODE_SHIFT,'
      '    :ID_DEPARTMENT,'
      '    :NUM_DIGIT,'
      '    :TARIF,'
      '    :ID_POST_SALARY,'
      '    :id_pay_form,'
      '    :id_work_cond,'
      '    :ID_TYPE_POST,'
      '    :REASON,'
      '    :Is_Main_Post,'
      '    :ACCEPT_COND_DATE_BEG,'
      '    :ACCEPT_COND_DATE_END,'
      '    :ID_ACCEPT_COND,'
      '    :ID_WORK_REASON,'
      '    :ACCEPT_COND_YEARS,'
      '    :HOSPITAL_ID_PCARD,'
      '    :HOLIDAY_ID_PCARD,'
      '    :NOTE)')
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_MAN_MOVING_SELECT(:where)')
    AddCaption = #1057#1090#1074#1086#1088#1077#1085#1085#1103' '#1087#1088#1080#1081#1086#1084#1091
    ModifyCaption = #1056#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103' '#1087#1088#1080#1081#1086#1084#1091
    InfoCaption = #1055#1077#1088#1077#1075#1083#1103#1076' '#1087#1088#1080#1081#1086#1084#1091
    NewRecordAfterPrepare = FormControlNewRecordAfterPrepare
    ModifyRecordAfterPrepare = FormControlModifyRecordAfterPrepare
    InfoRecordAfterPrepare = FormControlInfoRecordAfterPrepare
    AfterRecordAdded = FormControlAfterRecordAdded
    Mode = fmAdd
    CheckWhere = True
    CloseForm = True
  end
  object OkButton: TBitBtn
    Left = 144
    Top = 481
    Width = 89
    Height = 27
    Caption = #1043#1072#1088#1072#1079#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
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
    Left = 264
    Top = 481
    Width = 97
    Height = 27
    Caption = #1042#1110#1076#1084#1110#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 1
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
    Left = 8
    Top = 4
    Width = 473
    Height = 461
    ActivePage = WorkModeSheet
    TabOrder = 2
    object MainSheet: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
      object qFSimpleCheck1: TqFSimpleCheck
        Left = DateBeg
        Top = 64
        Width = 25
        Height = 21
        LightControl = DateBeg
        Right = DateEnd
        ErrorMessage = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1087#1077#1088#1110#1086#1076#1091' '#1087#1086#1074#1080#1085#1085#1072' '#1073#1091#1090#1080' '#1084#1077#1085#1096#1086#1102' '#1079#1072' '#1076#1072#1090#1091' '#1082#1110#1085#1094#1103'!'
      end
      object qFLogicCheck1: TqFLogicCheck
        Left = 304
        Top = 104
        Width = 36
        Height = 21
        OnCheck = qFLogicCheck1Check
      end
      object Fio: TqFSpravControl
        Left = 8
        Top = 16
        Width = 449
        Height = 21
        FieldName = 'ID_PCARD'
        DisplayName = #1055#1030#1041
        Interval = 120
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 0
        AutoSaveToRegistry = True
        OnOpenSprav = FioOpenSprav
        DisplayText = ''
        DisplayTextField = 'FIO'
      end
      object DateBeg: TqFDateControl
        Left = 8
        Top = 48
        Width = 225
        Height = 21
        FieldName = 'DATE_BEG'
        DisplayName = #1055#1088#1080#1081#1085#1103#1090#1080' '#1079
        Interval = 120
        Value = 38526
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = False
        Enabled = True
        OnChange = DateBegChange
        Blocked = False
        TabOrder = 1
        AutoSaveToRegistry = True
      end
      object DateEnd: TqFDateControl
        Left = 8
        Top = 80
        Width = 225
        Height = 21
        FieldName = 'DATE_END'
        DisplayName = #1055#1088#1080#1081#1085#1103#1090#1080' '#1076#1086
        Interval = 120
        Value = 38526
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = False
        Enabled = True
        OnChange = DateEndChange
        Blocked = False
        TabOrder = 2
        AutoSaveToRegistry = True
      end
      object MovingType: TqFSpravControl
        Left = 8
        Top = 208
        Width = 449
        Height = 21
        FieldName = 'ID_MOVING_TYPE'
        DisplayName = #1058#1080#1087' '#1087#1077#1088#1077#1084#1110#1097#1077#1085#1085#1103
        Interval = 120
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 3
        AutoSaveToRegistry = False
        OnOpenSprav = MovingTypeOpenSprav
        DisplayText = ''
        DisplayTextField = 'NAME_MOVING_TYPE'
      end
      object Department: TqFSpravControl
        Left = 8
        Top = 304
        Width = 449
        Height = 21
        FieldName = 'Id_Department'
        DisplayName = #1055#1110#1076#1088#1086#1079#1076#1110#1083
        Interval = 120
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        OnChange = DepartmentChange
        Blocked = False
        TabOrder = 5
        AutoSaveToRegistry = True
        OnOpenSprav = DepartmentOpenSprav
        DisplayText = ''
        DisplayTextField = 'Name_Department'
      end
      object PostSalary: TqFSpravControl
        Left = 8
        Top = 336
        Width = 449
        Height = 21
        FieldName = 'Id_Post_Salary'
        DisplayName = #1055#1086#1089#1072#1076#1086#1074#1080#1081' '#1086#1082#1083#1072#1076
        Interval = 120
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        OnChange = PostSalaryChange
        Blocked = False
        TabOrder = 6
        AutoSaveToRegistry = False
        OnOpenSprav = PostSalaryOpenSprav
        DisplayText = ''
        DisplayTextField = 'Salary_Name'
      end
      object IsForever: TqFBoolControl
        Left = 8
        Top = 112
        Width = 169
        Height = 21
        FieldName = 'IS_FOREVER'
        DisplayName = #1055#1088#1080#1081#1085#1103#1090#1080' '#1073#1077#1079#1089#1090#1088#1086#1082#1086#1074#1086
        Interval = 120
        Value = False
        LabelColor = clGreen
        Required = False
        Semicolon = False
        Asterisk = False
        Enabled = True
        OnChange = IsForeverChange
        Default = 'False'
        Blocked = False
        TabOrder = 8
        AutoSaveToRegistry = True
        StoreAs = StoreAs01
      end
      object PayType: TqFEnumControl
        Left = 8
        Top = 368
        Width = 449
        Height = 21
        FieldName = 'TARIF'
        DisplayName = #1054#1087#1083#1072#1090#1072
        Interval = 120
        Value = 1
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Default = '1'
        Blocked = False
        TabOrder = 7
        AutoSaveToRegistry = False
        Items.Strings = (
          #1054#1082#1083#1072#1076
          #1058#1072#1088#1080#1092)
        ValuesString = '1,2'
      end
      object WorkType: TqFSpravControl
        Left = 8
        Top = 240
        Width = 449
        Height = 21
        FieldName = 'IS_MAIN'
        DisplayName = #1058#1080#1087' '#1088#1086#1073#1086#1090#1080
        Interval = 120
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 4
        AutoSaveToRegistry = False
        OnOpenSprav = WorkTypeOpenSprav
        DisplayText = ''
        DisplayTextField = 'Work_Type_Name'
      end
      object IsMainPost: TqFBoolControl
        Left = 16
        Top = 400
        Width = 121
        Height = 21
        FieldName = 'Is_Main_Post'
        DisplayName = #1054#1089#1085#1086#1074#1085#1072' '#1087#1086#1089#1072#1076#1072
        Interval = 120
        Value = True
        LabelColor = clGreen
        Required = True
        Semicolon = False
        Asterisk = False
        Enabled = True
        Default = 'T'
        Blocked = False
        TabOrder = 9
        AutoSaveToRegistry = False
        StoreAs = StoreAsTF
      end
      object WorkReason: TqFSpravControl
        Left = 8
        Top = 272
        Width = 449
        Height = 21
        FieldName = 'ID_WORK_REASON'
        DisplayName = #1055#1110#1076#1089#1090#1072#1074#1072' '#1088#1086#1073#1086#1090#1080
        Interval = 120
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 10
        AutoSaveToRegistry = False
        OnOpenSprav = WorkReasonOpenSprav
        DisplayText = ''
        DisplayTextField = 'NAME_WORK_REASON'
      end
      object IsHoliday: TqFBoolControl
        Left = 8
        Top = 144
        Width = 185
        Height = 21
        FieldName = 'IS_HOLIDAY'
        DisplayName = #1055#1088#1080#1081#1085#1103#1090#1080' '#1085#1072' '#1095#1072#1089' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
        Interval = 120
        Value = False
        LabelColor = clGreen
        Required = False
        Semicolon = False
        Asterisk = False
        Enabled = True
        OnChange = IsHolidayChange
        Default = 'False'
        Blocked = False
        TabOrder = 11
        AutoSaveToRegistry = True
        StoreAs = StoreAs01
      end
      object IsHospital: TqFBoolControl
        Left = 8
        Top = 176
        Width = 177
        Height = 21
        FieldName = 'IS_HOSPITAL'
        DisplayName = #1055#1088#1080#1081#1085#1103#1090#1080' '#1085#1072' '#1095#1072#1089' '#1093#1074#1086#1088#1086#1073#1080
        Interval = 120
        Value = False
        LabelColor = clGreen
        Required = False
        Semicolon = False
        Asterisk = False
        Enabled = True
        OnChange = IsHospitalChange
        Default = 'False'
        Blocked = False
        TabOrder = 12
        AutoSaveToRegistry = True
        StoreAs = StoreAs01
      end
      object HolidayFio: TqFSpravControl
        Left = 200
        Top = 144
        Width = 257
        Height = 21
        FieldName = 'HOLIDAY_ID_PCARD'
        DisplayName = #1055#1088#1072#1094#1110#1074#1085#1080#1082', '#1103#1082#1080#1081' '#1091' '#1074#1110#1076#1087#1091#1089#1090#1094#1110
        Interval = 0
        Value = Null
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = True
        TabOrder = 13
        AutoSaveToRegistry = False
        OnOpenSprav = HolidayFioOpenSprav
        DisplayText = ''
        DisplayTextField = 'HOLIDAY_FIO'
      end
      object HospitalFio: TqFSpravControl
        Left = 200
        Top = 176
        Width = 257
        Height = 21
        FieldName = 'HOSPITAL_ID_PCARD'
        DisplayName = #1055#1088#1072#1094#1110#1074#1085#1080#1082', '#1103#1082#1080#1081' '#1093#1074#1086#1088#1110#1108
        Interval = 0
        Value = Null
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = True
        TabOrder = 14
        AutoSaveToRegistry = False
        OnOpenSprav = HolidayFioOpenSprav
        DisplayText = ''
        DisplayTextField = 'HOSPITAL_FIO'
      end
    end
    object WorkModeSheet: TTabSheet
      Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1086
      ImageIndex = 2
      object Label1: TLabel
        Left = 192
        Top = 210
        Width = 25
        Height = 13
        Caption = #1076#1085#1110#1074
      end
      object Label2: TLabel
        Left = 16
        Top = 232
        Width = 146
        Height = 13
        Caption = #1059#1084#1086#1074#1080' '#1074#1089#1090#1091#1087#1091' '#1085#1072' '#1087#1086#1089#1072#1076#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Spz: TqFSpravControl
        Left = 8
        Top = 60
        Width = 449
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
        TabOrder = 2
        AutoSaveToRegistry = False
        OnOpenSprav = SpzOpenSprav
        DisplayText = ''
        DisplayTextField = 'Name_Spz'
      end
      object WorkMode: TqFSpravControl
        Left = 8
        Top = 115
        Width = 449
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
        Blocked = False
        TabOrder = 4
        AutoSaveToRegistry = False
        OnOpenSprav = WorkModeOpenSprav
        DisplayText = ''
        DisplayTextField = 'Name_Work_Mode'
      end
      object qFIntControl1: TqFIntControl
        Left = 8
        Top = 206
        Width = 169
        Height = 21
        FieldName = 'Work_Mode_Shift'
        DisplayName = #1047#1089#1091#1074' '#1079#1084#1110#1085#1080' '#1085#1072
        Interval = 120
        Value = 0
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = False
        Enabled = True
        Default = '0'
        Blocked = False
        TabOrder = 6
        AutoSaveToRegistry = False
        MaxLength = 10
        NegativeAllowed = True
        ZeroAllowed = True
      end
      object PayForm: TqFSpravControl
        Left = 8
        Top = 34
        Width = 449
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
        TabOrder = 1
        AutoSaveToRegistry = False
        OnOpenSprav = PayFormOpenSprav
        DisplayText = ''
        DisplayTextField = 'Name_Pay_Form'
      end
      object WorkCond: TqFSpravControl
        Left = 8
        Top = 8
        Width = 449
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
        TabOrder = 0
        AutoSaveToRegistry = False
        OnOpenSprav = WorkCondOpenSprav
        DisplayText = ''
        DisplayTextField = 'Name_Work_Cond'
      end
      object Type_Post: TqFSpravControl
        Left = 9
        Top = 87
        Width = 448
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
        TabOrder = 3
        AutoSaveToRegistry = False
        OnOpenSprav = Type_PostOpenSprav
        DisplayText = ''
        DisplayTextField = 'Name_Type_Post'
      end
      object Reason: TqFCharControl
        Left = 8
        Top = 144
        Width = 449
        Height = 21
        FieldName = 'REASON'
        DisplayName = #1055#1110#1076#1089#1090#1072#1074#1072
        Interval = 120
        Value = ''
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 5
        AutoSaveToRegistry = True
        MaxLength = 255
      end
      object CondDateBeg: TqFDateControl
        Left = 8
        Top = 256
        Width = 217
        Height = 21
        FieldName = 'ACCEPT_COND_DATE_BEG'
        DisplayName = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
        Interval = 120
        Value = 38660
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = False
        Enabled = True
        Blocked = False
        TabOrder = 7
        AutoSaveToRegistry = False
      end
      object CondDateEnd: TqFDateControl
        Left = 248
        Top = 256
        Width = 201
        Height = 21
        FieldName = 'ACCEPT_COND_DATE_END'
        DisplayName = #1044#1072#1090#1072' '#1082#1110#1085#1094#1103
        Interval = 100
        Value = 38660
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = False
        Enabled = True
        Blocked = False
        TabOrder = 8
        AutoSaveToRegistry = False
      end
      object IdAcceptCond: TqFSpravControl
        Left = 8
        Top = 288
        Width = 449
        Height = 21
        FieldName = 'ID_ACCEPT_COND'
        DisplayName = #1059#1084#1086#1074#1080
        Interval = 120
        Value = Null
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 9
        AutoSaveToRegistry = False
        OnOpenSprav = IdAcceptCondOpenSprav
        DisplayText = ''
        DisplayTextField = 'NAME_ACCEPT_COND'
      end
      object AcceptCondYears: TqFFloatControl
        Left = 8
        Top = 320
        Width = 200
        Height = 21
        FieldName = 'ACCEPT_COND_YEARS'
        DisplayName = #1050#1110#1083'-'#1090#1100' '#1088#1086#1082#1110#1074
        Interval = 120
        Value = Null
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 10
        AutoSaveToRegistry = False
        MaxLength = 0
        NegativeAllowed = False
        Precision = 2
        Format = '#########0.00'
      end
      object AcceptHistoryButton: TButton
        Left = 248
        Top = 320
        Width = 171
        Height = 25
        Caption = #1030#1089#1090#1086#1088#1110#1103' '#1074#1089#1090#1091#1087#1110#1074' '#1085#1072' '#1087#1086#1089#1072#1076#1091
        TabOrder = 11
        OnClick = AcceptHistoryButtonClick
      end
      object StagirovkaSrok: TqFIntControl
        Left = 8
        Top = 392
        Width = 305
        Height = 21
        FieldName = 'STAJIROVKA_TERM'
        DisplayName = #1057#1090#1088#1086#1082' '#1089#1090#1072#1078#1091#1074#1072#1085#1085#1103' ('#1084#1110#1089#1103#1094#1110#1074')'
        Interval = 250
        Value = 0
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = False
        Enabled = True
        Default = '0'
        Blocked = False
        TabOrder = 12
        AutoSaveToRegistry = False
        MaxLength = 10
        NegativeAllowed = False
        ZeroAllowed = True
      end
      object IspitSrok: TqFIntControl
        Left = 8
        Top = 360
        Width = 305
        Height = 21
        FieldName = 'TEST_TERM'
        DisplayName = #1047' '#1074#1080#1087#1088#1086#1073#1085#1080#1084' '#1090#1077#1088#1084#1110#1085#1086#1084' ('#1074' '#1084#1110#1089#1103#1094#1103#1093')'
        Interval = 250
        Value = 0
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = False
        Enabled = True
        Default = '0'
        Blocked = False
        TabOrder = 13
        AutoSaveToRegistry = False
        MaxLength = 10
        NegativeAllowed = False
        ZeroAllowed = True
      end
      object Note: TqFCharControl
        Left = 8
        Top = 172
        Width = 449
        Height = 21
        FieldName = 'NOTE'
        DisplayName = #1055#1088#1080#1084#1110#1090#1082#1072' ('#1076#1088#1091#1082'.)'
        Interval = 120
        Value = ''
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 14
        AutoSaveToRegistry = True
        MaxLength = 255
      end
    end
    object OkladSheet: TTabSheet
      Caption = #1060#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      ImageIndex = 2
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 465
        Height = 61
        Align = alTop
        Locked = True
        TabOrder = 0
        object AddItemButton: TSpeedButton
          Left = 3
          Top = 2
          Width = 62
          Height = 57
          Action = AddSmeta
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFF9966669966669966669966669966669966669966669966669966669966
            66996666996666996666996666996666996666996666FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF969696999999999999999999999999999999999999999999999999
            999999999999999999999999999999999999999999999999FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF996666F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6FFCC99FF
            CC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC66996666FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF969696DDDDDDDDDDDDD7D7D7D7D7D7CCCCCCCCCCCCCCCC
            CCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0969696FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF996666F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6
            FFCC99FFCC99FFCC99FFCC66FFCC66FFCC66FFCC66FFCC66CCCC66996666FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF969696DDDDDDDDDDDDDDDDDDD7D7D7D7D7D7CC
            CCCCCCCCCCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0969696
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666FFCCCCFFECCCF0CAA6F0CAA6F0CA
            A6F0CAA6F0CAA6FFCC99FFCC99FFCC99FFCC66FFCC66FFCC66FFCC66CCCC6699
            6666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3DDDDDDDDDDDDDDDDDD
            D7D7D7D7D7D7CCCCCCCCCCCCCCCCCCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCCF0CAA6F0
            CAA6F0CAA6F0CAA6F0CAA6F0CAA6FFCC99FFCC99FFCC99FFCC66FFCC66FFCC66
            CCCC66996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3E3E3E3DDDD
            DDDDDDDDDDDDDDD7D7D7D7D7D7CCCCCCCCCCCCCCCCCCC0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCC
            FFECCCF0CAA6F0CAA6F0CAA6CCCC99CCCC99CCCC99CCCC99CCCC99FFCC99FFCC
            66FFCC66CCCC66996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3E3
            E3E3E3E3E3DDDDDDDDDDDDD7D7D7C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666EAEA
            EAFFECCCFFECCCFFECCCFFECCC003300003300003300003300999966CCCC99FF
            CC99FFCC99FFCC66CCCC66996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696
            EAEAEAEAEAEAE3E3E3E3E3E3E3E3E3868686868686868686868686969696C0C0
            C0CCCCCCC0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            6666EAEAEAFFECCCFFECCCF0CAA6F0CAA6003300009900009900003300999966
            CC9999CCCC99CCCC99FFCC99CCCC66996666FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF999999EAEAEAEAEAEAE3E3E3D7D7D7CCCCCC868686B2B2B2A4A0A086868696
            9696B2B2B2C0C0C0C0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF996666F1F1F1F1F1F1D7D7D7B2B2B2A4A0A00033000099330099000033
            00999966999966999966CCCC99FFCC99CCCC99996666FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF999999F1F1F1F1F1F1DDDDDDB2B2B2A4A0A0868686B2B2B2B2B2B2
            868686868686868686969696C0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF996666F8F8F8F1F1F100330000330000330000330000993300
            9933003300003300003300003300CCCC99FFCC99FFCC99996666FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF999999F1F1F1F1F1F1868686868686868686868686B2B2
            B2B2B2B2868686868686868686868686C0C0C0CCCCCCC0C0C0969696FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF996666F8F8F8F8F8F800330033CC3333CC3333CC33
            33CC33009933009933009933009900003300CCCC99F0CAA6FFCC99996666FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFF868686CCCCCCCCCCCCC0
            C0C0C0C0C0C0C0C0B2B2B2B2B2B2B2B2B2868686C0C0C0CCCCCCCCCCCC999999
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC6666F8F8F8FFFFFF00330033CC6633CC
            3333CC3333CC3333CC3300CC33009933009933003300CCCC99F0CAA6F0CAA699
            6666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFF868686D7D7D7
            D7D7D7CCCCCCCCCCCCC0C0C0C0C0C0C0C0C0B2B2B2868686C0C0C0D7D7D7CCCC
            CC999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFF00330000
            330000330000330033CC3333CC33003300003300003300003300F0CAA6F0CAA6
            F0CAA6996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFF8686
            86868686868686868686D7D7D7CCCCCC868686868686868686868686D7D7D7D7
            D7D7CCCCCC999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFF
            FFFFFFFFFFFFF8F8F800330033CC6633CC66003300A4A0A0F0CAA6FFECCCF0CA
            A6F0CAA6CCCC99996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF868686DDDDDDD7D7D7868686A4A0A0CCCCCCE3E3E3
            DDDDDDD7D7D7C0C0C0868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8
            F8FFFFFFFFFFFFFFFFFFFFFFFF00330033CC6633CC66003300B2B2B2F0CAA6FF
            ECCCF0CAA6CCCC99999966996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686DDDDDDDDDDDD868686B2B2B2D7D7
            D7E3E3E3D7D7D7C0C0C0A4A0A0868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC
            9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFF003300003300003300003300D7D7D7
            FFECCCFFECCCB2B2B2999999969696996666FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686868686868686DD
            DDDDE3E3E3EAEAEAC0C0C0B2B2B2B2B2B2868686FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F1F1
            F1F1F1F1FFCCCC996666996666996666996666996666FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F1F1F1F1F1F1DDDDDD969696969696969696969696969696FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF8F8F8CBCBCB996666FF9966FF9933996666FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFDDDDDD969696B2B2B2A4A0A0999999FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFCCCCCC996666FF9966996666FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDD969696B2B2B2999999FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7996666996666FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3969696999999FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F0CAA6F0CAA6F0CAA6F0
            CAA6F0CAA6F0CAA6F0CAA6F0CAA6C0C0C0C0C0C0CC9999996666FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2B2B2B2B2B2B2B2B2
            B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2969696FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object ModifyItemButton: TSpeedButton
          Left = 65
          Top = 2
          Width = 62
          Height = 57
          Action = ModifySmeta
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9966
            6699666699666699666699666699666699666699666699666699666699666699
            6666996666996666996666996666996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            9696969999999999999999999999999999999999999999999999999999999999
            99999999999999999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF996666F0CAA6FFECCCF0CAA6F0CAA6F0CAA6CCCC99CCCC99CCCC99CCCC99
            CCCC66FFCC66FFCC66FFCC66FFCC66FFCC66996666FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF969696DDDDDDE3E3E3DDDDDDD7D7D7CCCCCCC0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF996666FFCCCCFFECCCF0CAA6F0CAA6CC9999CC9966CC9966CC99
            66CCCC66CCCC66CCCC66CCCC66FFCC66FFCC66FFCC66996666FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF969696E3E3E3E3E3E3DDDDDDD7D7D7C0C0C0C0C0C0B2B2B2
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0969696FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCCFFECCCF0CAA639393999666699
            9966999966CC9966CC9966CC9966CCCC66CCCC66CCCC66FFCC66996666FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3E3E3E3DDDDDDD7D7D78686868686
            86999999A4A0A0B2B2B2B2B2B2B2B2B2C0C0C0C0C0C0C0C0C0C0C0C0969696FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCCFFECCCF0CAA61C1C1C
            292929424242996666996666999966CC9966CC9966CCCC66CCCC66CCCC669966
            66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3EAEAEAE3E3E3DDDDDD66
            6666666666868686868686868686969696A4A0A0B2B2B2C0C0C0C0C0C0C0C0C0
            969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666EAEAEAFFECCCFFECCCFFEC
            CC393939006699006699336666393939393939666633666633996666CC9966CC
            9966996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696EAEAEAF1F1F1EAEAEA
            E3E3E3808080868686868686868686808080666666777777808080969696A4A0
            A0B2B2B2969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666EAEAEAF1F1F1FF
            ECCCFFECCC808080006699336666996666996666996666663333555555666633
            996666999966996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999EAEAEAF1F1
            F1EAEAEAEAEAEAB2B2B2868686666666969696A4A0A096969666666666666680
            8080868686999999969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666F1F1F1
            F1F1F1F1F1F1EAEAEAFFECCC003366996666CC9999CC66669966669966666633
            33666633666633996633996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999F1
            F1F1F1F1F1F1F1F1EAEAEAE3E3E3555555868686C0C0C0B2B2B2A4A0A0969696
            666666666666777777868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9966
            66F8F8F8F8F8F8F1F1F1F1F1F1FFECCC336666996666CC9999CC9999CC666699
            6666996666663333666633666633666633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            999999F1F1F1FFFFFFF1F1F1F1F1F1EAEAEA868686999999CCCCCCC0C0C0B2B2
            B2A4A0A0868686666666666666666666777777FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF996666F8F8F8FFFFFFF8F8F8F1F1F1FFECCCFFECCC5F5F5FCC9999CC9999
            CC9999CC6666996666996666663333663333663333FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFA4A0A0FFFFFFFFFFFFFFFFFFF1F1F1EAEAEAEAEAEA808080D7D7D7CC
            CCCCC0C0C0B2B2B2A4A0A0868686666666666666666666FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFCC6666F8F8F8FFFFFFFFFFFFF8F8F8F1F1F1FFECCCF0CAA65F5F
            5FCC9999CC9999CC9999CC6666996666996666663333663333FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1EAEAEADDDDDD
            808080CCCCCCCCCCCCC0C0C0B2B2B2A4A0A0868686666666666666FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFF1F1F1F1F1F1FF
            ECCCF0CAA6663333CC9999CC9999CC9999CC6666996666996666663333FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F1F1
            F1EAEAEADDDDDD777777CCCCCCCCCCCCC0C0C0B2B2B2A4A0A08686865F5F5FFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFF8F8F8
            F1F1F1F1F1F1FFECCCCC9999663333CC9999CC9999CC9999CC66669966666633
            33FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF1F1F1F1F1F1EAEAEAC0C0C0777777CCCCCCCCCCCCC0C0C0B2B2B2999999
            666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFF
            FFFFFFFFF8F8F8F1F1F1F1F1F1FFECCCCC9999663333CC9999CC9999CC9999CC
            6666996666663333FFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF1F1F1F1F1F1EAEAEAC0C0C0777777CCCCCCCCCCCCC0C0
            C0B2B2B2868686777777FFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFF8F8F8F1F1F1F1F1F1FFECCCCC9999996666F0CAA6
            CC9999CC99999933334D4D4D424242FFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F1F1F1EAEAEAC0C0C0969696D7
            D7D7CCCCCCC0C0C0868686777777666666FFFFFFFFFFFFFFFFFFCC9966F8F8F8
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F1F1F1F1F1F1FFCCCC9966
            33996666F0CAA6CC99990099CC0099FF0099CC0099CCFFFFFFFFFFFFB2B2B2FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F1F1F1DDDDDD
            868686969696D7D7D7C0C0C0808080868686868686777777FFFFFFFFFFFFCC99
            66F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8CB
            CBCB996666FFCC66CC663366333300CCFF0099CC003399000099000099000080
            B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFDDDDDD969696C0C0C09696968686868686868080806666666666666666665F
            5F5FCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFCCCCCC996666FFCC66FF99665F5F5F00CCFF0033990033CC0033CC0033
            CC000099B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFDDDDDD969696C0C0C0B2B2B2808080868686666666868686808080
            777777666666CC9966FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFD7D7D7996666FFCC66996666FFFFFF0099CC0033CC3333FF00
            33CC0033CC000080B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE3E3E3969696C0C0C0999999FFFFFF777777868686B2B2
            B2868686777777666666CC9966CC9966CC9966CC9966CC9966CC9966CC9966CC
            9966CC9966CC9966CC9966CC9966996666996666FFFFFFFFFFFFFFFFFF0033CC
            6666FF3333CC000099FFFFFFB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
            B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2969696999999FFFFFFFFFFFFFFFFFF86
            8686C0C0C0999999666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF0033CC000099FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF868686777777FFFFFFFFFFFF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object DeleteItemButton: TSpeedButton
          Left = 191
          Top = 2
          Width = 62
          Height = 57
          Action = DeleteSmeta
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CCFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000
            CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686
            868686FFFFFFFFFFFFFFFFFF0000CC0000CC0000CCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC00
            00CCFFFFFFFFFFFFFFFFFFFFFFFF868686868686868686FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686868686
            86868686FFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000CCFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC
            0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686868686FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86868686
            8686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000CC0000CC
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000
            CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86868686868686868686
            8686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686
            868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            FF0000CC0000CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC00
            00CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            999999868686868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686868686
            86868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF0000CC0000CC0000CC0000CCFFFFFFFFFFFF0000CC0000CC0000CC
            0000CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF868686868686868686868686FFFFFFFFFFFF86868686868686
            8686868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000CC0000CC0000CC0000CC0000
            CC0000CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686868686868686868686868686
            868686868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000FF0000CC00
            00FF0000CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686868686869999998686
            86999999868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC
            0000CC0000FF0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86868686
            8686868686999999868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000
            CC0000FF0000CC0000CC0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686
            868686999999868686868686999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC00
            00CC0000FF0000CC0000FF0000FF0000FF0000CC0000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686
            86868686999999868686999999999999999999868686999999FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF
            0000FF0000FF0000CC0000FFFFFFFFFFFFFF0000FF0000FF0000FF0000FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            9999999999999999868686999999FFFFFFFFFFFF999999999999999999999999
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF0000FF0000CC0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF00
            00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF999999868686999999999999FFFFFFFFFFFFFFFFFFFFFFFF9999999999
            99999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF999999999999999999FFFFFFFFFFFFFFFFFFFFFFFF
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
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object SpeedButton1: TSpeedButton
          Left = 127
          Top = 2
          Width = 64
          Height = 57
          Action = ViewSmeta
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            B60D0000424DB60D000000000000360000002800000030000000180000000100
            180000000000800D0000C40E0000C40E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF885D406947316947
            31885D40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            939393808080808080939393FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF694731B09A8BC3B0A3C3B0A2AF9889694731FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF808080C2C2C2D1D1D1D1D1D1C1C1C1808080FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF694731AF998ADDCFC6E3D6CEE1D3
            CBD9C9C0AD9787694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080C2C2C2
            E4E4E4E8E8E8E6E6E6E1E1E1C0C0C0808080FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF69
            4731B09A8CDFD2CAE6DAD3983000983000E1D3CBD8C9BFAD9787694731FF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FF808080C2C2C2E6E6E6EBEBEB6A6A6A6A6A6AE6E6E6E0E0E0C0
            C0C0808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF694731B29D8EE3D8D1E9E0DA983000C86000C860
            00983000E1D3CBD9C9C0AF9989694731FF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080C4C4C4E9E9E9EEEEEE
            6A6A6A8E8E8E8E8E8E6A6A6AE6E6E6E1E1E1C2C2C2808080FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF694731B49F90E8
            E0DAEDE4DF983000C86000DA8338D77D2FC86000983000E1D3CBDCCCC3B29C8D
            694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FF808080C6C6C6EEEEEEF0F0F06A6A6A8E8E8EADADADA9A9A98E8E8E6A6A6AE6
            E6E6E2E2E2C3C3C3808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF694731B5A092F2ECE8ECE2DB983000C86000E08E4BDD8942DA83
            38D77D2FC86000983000DFCDC4E1D2C9B29C8D694731FF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF808080C6C6C6F5F5F5EFEFEF6A6A6A8E8E8E
            B6B6B6B2B2B2ADADADA9A9A98E8E8E6A6A6AE3E3E3E6E6E6C3C3C3808080FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF694731B4A092EEE8E4EFE6E198
            3000F68B56E59A5DD79D80C59075C38C71C08361C08361C86000983000DFCDC4
            DCCDC4AF9989694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080C6C6
            C6F2F2F2F1F1F16A6A6AB9B9B9BFBFBFC5C5C5BCBCBCB9B9B9B2B2B2B2B2B28E
            8E8E6A6A6AE3E3E3E3E3E3C2C2C2808080FF00FFFF00FFFF00FFFF00FFFF00FF
            694731B4A193EDE8E4F7F3F1983000F68B56ECA670F7BD9FFFFFFFFFFFFFFFFF
            FFFFFFFFC08361D77D2FC86000983000E2D4CCDACAC1AE9788694731FF00FFFF
            00FFFF00FFFF00FF808080C7C7C7F2F2F2F8F8F86A6A6AB9B9B9C8C8C8DADADA
            FFFFFFFFFFFFFFFFFFFFFFFFB2B2B2A9A9A98E8E8E6A6A6AE7E7E7E1E1E1C0C0
            C0808080FF00FFFF00FFFF00FF694731B5A294EFEAE7FAF8F7983000F68B56F2
            B282EFAC79F7A175EBA882FFFFFFFFFFFFC08361DD8942DA8338D77D2FC86000
            983000E2D4CCD9C9C0AE9788694731FF00FFFF00FF808080C8C8C8F4F4F4FBFB
            FB6A6A6AB9B9B9D0D0D0CCCCCCC8C8C8CCCCCCFFFFFFFFFFFFB2B2B2B2B2B2AD
            ADADA9A9A98E8E8E6A6A6AE7E7E7E1E1E1C0C0C0808080FF00FFB7A293C2AFA2
            F3EFEDFDFDFD983000F68B56F8BE95F5B88CF2B282F9AC81EBA882FFFFFFFFFF
            FFC08361E08E4BDD8942DA8338D77D2FC86000983000E2D4CCDACAC1AF998A88
            5D40C8C8C8D0D0D0F6F6F6FEFEFE6A6A6AB9B9B9D8D8D8D5D5D5D0D0D0CECECE
            CCCCCCFFFFFFFFFFFFB2B2B2B6B6B6B2B2B2ADADADA9A9A98E8E8E6A6A6AE7E7
            E7E1E1E1C2C2C2939393B7A293FAF8F6FFFFFFC86000F68B56FBC39FFBC39FF8
            BE95F5B88CF9B187EBA882FFFFFFFFFFFFC08361E29453E08E4BDD8942DA8338
            D77D2FC86000983000E3D5CDC3B0A3694731C8C8C8FBFBFBFFFFFF8E8E8EB9B9
            B9DCDCDCDCDCDCD8D8D8D5D5D5D2D2D2CCCCCCFFFFFFFFFFFFB2B2B2BBBBBBB6
            B6B6B2B2B2ADADADA9A9A98E8E8E6A6A6AE8E8E8D1D1D1808080D0BBACFFFFFF
            FFFFFFC86000F6BF9CFBC39FFBC39FFBC39FF8BE95F9B78FEBA882FFFFFFFFFF
            FFC08361E59A5DE29453E08E4BDE8B46DB863DC86000983000E4D8D0C3B1A469
            4731D7D7D7FFFFFFFFFFFF8E8E8EDADADADCDCDCDCDCDCDCDCDCD8D8D8D5D5D5
            CCCCCCFFFFFFFFFFFFB2B2B2BFBFBFBBBBBBB6B6B6B4B4B4AFAFAF8E8E8E6A6A
            6AE9E9E9D2D2D2808080D0BBACF5F1EDFFFFFFFFFFFFC86000F6BF9CFBC39FFB
            C39FFBC39FEFBEA0EBA882FFFFFFFFFFFFD29674EAA36BE79D61E49758E1914F
            C86000983000E7DCD6DED1C8B09A8B885D40D7D7D7F8F8F8FFFFFFFFFFFF8E8E
            8EDADADADCDCDCDCDCDCDCDCDCDADADACCCCCCFFFFFFFFFFFFC0C0C0C6C6C6C1
            C1C1BCBCBCB9B9B98E8E8E6A6A6AECECECE5E5E5C2C2C2939393FF00FFD0BBAC
            F3EEEAFFFFFFFFFFFFC86000F6BF9CFBC39FFBC39FFABF99FFFFFFFFFFFFFFFF
            FFF0AF7EEDA974EAA36BE79D61C86000983000EAE1DCE0D3CCAF9A8B694731FF
            00FFFF00FFD7D7D7F6F6F6FFFFFFFFFFFF8E8E8EDADADADCDCDCDCDCDCDADADA
            FFFFFFFFFFFFFFFFFFCECECEC9C9C9C6C6C6C1C1C18E8E8E6A6A6AEFEFEFE6E6
            E6C2C2C2808080FF00FFFF00FFFF00FFD0BBACF3EEEAFFFFFFFFFFFFC86000F6
            BF9CFBC39FFBC39FFBC39FC49375C49375F3B587F0AF7EEDA974F68B56983000
            EEE6E1E3D9D2B09B8C694731FF00FFFF00FFFF00FFFF00FFD7D7D7F6F6F6FFFF
            FFFFFFFF8E8E8EDADADADCDCDCDCDCDCDCDCDCBDBDBDBDBDBDD2D2D2CECECEC9
            C9C9B9B9B96A6A6AF1F1F1EAEAEAC3C3C3808080FF00FFFF00FFFF00FFFF00FF
            FF00FFD0BBACF5F1EEFFFFFFFCF8F4C86000F6BF9CFBC39FEDD7C9FFFFFFD0BF
            B4C49375F3B587F68B56983000EEE4DEEAE1DCB29D8E694731FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFD7D7D7F8F8F8FFFFFFFBFBFB8E8E8EDADADADCDCDC
            E8E8E8FFFFFFDADADABDBDBDD2D2D2B9B9B96A6A6AF0F0F0EFEFEFC4C4C48080
            80FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0BBACF9F6F4FFFFFFFC
            F8F4C86000F6BF9CFFFFFFFFFEFEFFFFFFC49375F68B56983000F1E8E3F3EEEA
            B49F91694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7
            D7FAFAFAFFFFFFFBFBFB8E8E8EDADADAFFFFFFFEFEFEFFFFFFBDBDBDB9B9B96A
            6A6AF2F2F2F6F6F6C6C6C6808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFD0BBACF9F6F4FFFFFFFFFFFFC86000F6BF9CFFFFFFD296
            74F68B56983000F8F5F3EFEAE6B5A092694731FF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7D7FAFAFAFFFFFFFFFFFF8E8E8E
            DADADAFFFFFFC0C0C0B9B9B96A6A6AFAFAFAF4F4F4C6C6C6808080FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0BBACF5
            F1EDFFFFFFFFFFFFC86000F6BF9CF68B56983000FBFAF9EEE9E5B4A092694731
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFD7D7D7F8F8F8FFFFFFFFFFFF8E8E8EDADADAB9B9B96A6A6AFCFCFCF3
            F3F3C6C6C6808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFD0BBACF3EEEAFFFFFFFFFFFFC86000C860
            00FEFEFEF0ECE9B4A194694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7D7F6F6F6FFFFFF
            FFFFFF8E8E8E8E8E8EFEFEFEF5F5F5C7C7C7808080FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFD0BBACF7EFEBFFFFFFFFFFFFFFFFFFF3EFEDB5A295694731FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFD7D7D7F6F6F6FFFFFFFFFFFFFFFFFFF6F6F6C8C8C880
            8080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0BBACF5F1EEFFFFFFFAF8
            F6C2AEA1694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7D7
            F8F8F8FFFFFFFBFBFBCFCFCF808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFD0BBACD0BBACB7A293B7A293FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7D7D7D7D7C8C8C8C8C8C8FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
      end
      object ItemsGrid: TcxGrid
        Left = 0
        Top = 61
        Width = 465
        Height = 372
        Align = alClient
        TabOrder = 1
        object cxGridDBTableView5: TcxGridDBTableView
          DataController.DataSource = SmetSource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsBehavior.CellHints = True
          OptionsSelection.CellSelect = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = qizzStyle
          object cxGridDBTableView5DBColumn1: TcxGridDBColumn
            Caption = #1050#1086#1096#1090#1086#1088#1080#1089
            Width = 106
            DataBinding.FieldName = 'SM_TITLE'
          end
          object cxGridDBTableView5DBColumn6: TcxGridDBColumn
            Caption = #1057#1090#1072#1074#1086#1082
            Width = 65
            DataBinding.FieldName = 'KOL_STAVOK'
          end
          object cxGridDBTableView5DBColumn3: TcxGridDBColumn
            Caption = #1050#1086#1096#1090'. '#1087#1110#1076#1074#1080#1097'.'
            Width = 122
            DataBinding.FieldName = 'SM_PPS_TITLE'
          end
          object cxGridDBTableView5DBColumn2: TcxGridDBColumn
            Caption = #1054#1082#1083#1072#1076
            DataBinding.FieldName = 'OKLAD_BASE'
          end
          object cxGridDBTableView5DBColumn4: TcxGridDBColumn
            Caption = #1055#1110#1076#1074#1080#1097#1077#1085#1085#1103
            Width = 96
            DataBinding.FieldName = 'OKLAD_PPS'
          end
          object cxGridDBTableView5DBColumn5: TcxGridDBColumn
            Caption = #1057#1091#1084#1072#1088#1085#1086
            Width = 74
            DataBinding.FieldName = 'OKLAD'
          end
        end
        object cxGridLevel5: TcxGridLevel
          GridView = cxGridDBTableView5
        end
      end
    end
    object BonusSheet: TTabSheet
      Caption = #1044#1086#1087#1083#1072#1090#1080' '#1090#1072' '#1085#1072#1076#1073#1072#1074#1082#1080
      ImageIndex = 3
      object BonusButtonsPanel: TPanel
        Left = 0
        Top = 0
        Width = 465
        Height = 61
        Align = alTop
        Locked = True
        TabOrder = 0
        object AddBonusButton: TSpeedButton
          Left = 3
          Top = 2
          Width = 62
          Height = 57
          Action = AddBonus
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFF9966669966669966669966669966669966669966669966669966669966
            66996666996666996666996666996666996666996666FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF969696999999999999999999999999999999999999999999999999
            999999999999999999999999999999999999999999999999FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF996666F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6FFCC99FF
            CC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC66996666FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF969696DDDDDDDDDDDDD7D7D7D7D7D7CCCCCCCCCCCCCCCC
            CCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0969696FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF996666F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6
            FFCC99FFCC99FFCC99FFCC66FFCC66FFCC66FFCC66FFCC66CCCC66996666FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF969696DDDDDDDDDDDDDDDDDDD7D7D7D7D7D7CC
            CCCCCCCCCCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0969696
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666FFCCCCFFECCCF0CAA6F0CAA6F0CA
            A6F0CAA6F0CAA6FFCC99FFCC99FFCC99FFCC66FFCC66FFCC66FFCC66CCCC6699
            6666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3DDDDDDDDDDDDDDDDDD
            D7D7D7D7D7D7CCCCCCCCCCCCCCCCCCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCCF0CAA6F0
            CAA6F0CAA6F0CAA6F0CAA6F0CAA6FFCC99FFCC99FFCC99FFCC66FFCC66FFCC66
            CCCC66996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3E3E3E3DDDD
            DDDDDDDDDDDDDDD7D7D7D7D7D7CCCCCCCCCCCCCCCCCCC0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCC
            FFECCCF0CAA6F0CAA6F0CAA6CCCC99CCCC99CCCC99CCCC99CCCC99FFCC99FFCC
            66FFCC66CCCC66996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3E3
            E3E3E3E3E3DDDDDDDDDDDDD7D7D7C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666EAEA
            EAFFECCCFFECCCFFECCCFFECCC003300003300003300003300999966CCCC99FF
            CC99FFCC99FFCC66CCCC66996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696
            EAEAEAEAEAEAE3E3E3E3E3E3E3E3E3868686868686868686868686969696C0C0
            C0CCCCCCC0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            6666EAEAEAFFECCCFFECCCF0CAA6F0CAA6003300009900009900003300999966
            CC9999CCCC99CCCC99FFCC99CCCC66996666FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF999999EAEAEAEAEAEAE3E3E3D7D7D7CCCCCC868686B2B2B2A4A0A086868696
            9696B2B2B2C0C0C0C0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF996666F1F1F1F1F1F1D7D7D7B2B2B2A4A0A00033000099330099000033
            00999966999966999966CCCC99FFCC99CCCC99996666FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF999999F1F1F1F1F1F1DDDDDDB2B2B2A4A0A0868686B2B2B2B2B2B2
            868686868686868686969696C0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF996666F8F8F8F1F1F100330000330000330000330000993300
            9933003300003300003300003300CCCC99FFCC99FFCC99996666FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF999999F1F1F1F1F1F1868686868686868686868686B2B2
            B2B2B2B2868686868686868686868686C0C0C0CCCCCCC0C0C0969696FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF996666F8F8F8F8F8F800330033CC3333CC3333CC33
            33CC33009933009933009933009900003300CCCC99F0CAA6FFCC99996666FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFF868686CCCCCCCCCCCCC0
            C0C0C0C0C0C0C0C0B2B2B2B2B2B2B2B2B2868686C0C0C0CCCCCCCCCCCC999999
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC6666F8F8F8FFFFFF00330033CC6633CC
            3333CC3333CC3333CC3300CC33009933009933003300CCCC99F0CAA6F0CAA699
            6666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFF868686D7D7D7
            D7D7D7CCCCCCCCCCCCC0C0C0C0C0C0C0C0C0B2B2B2868686C0C0C0D7D7D7CCCC
            CC999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFF00330000
            330000330000330033CC3333CC33003300003300003300003300F0CAA6F0CAA6
            F0CAA6996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFF8686
            86868686868686868686D7D7D7CCCCCC868686868686868686868686D7D7D7D7
            D7D7CCCCCC999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFF
            FFFFFFFFFFFFF8F8F800330033CC6633CC66003300A4A0A0F0CAA6FFECCCF0CA
            A6F0CAA6CCCC99996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF868686DDDDDDD7D7D7868686A4A0A0CCCCCCE3E3E3
            DDDDDDD7D7D7C0C0C0868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8
            F8FFFFFFFFFFFFFFFFFFFFFFFF00330033CC6633CC66003300B2B2B2F0CAA6FF
            ECCCF0CAA6CCCC99999966996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686DDDDDDDDDDDD868686B2B2B2D7D7
            D7E3E3E3D7D7D7C0C0C0A4A0A0868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC
            9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFF003300003300003300003300D7D7D7
            FFECCCFFECCCB2B2B2999999969696996666FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686868686868686DD
            DDDDE3E3E3EAEAEAC0C0C0B2B2B2B2B2B2868686FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F1F1
            F1F1F1F1FFCCCC996666996666996666996666996666FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F1F1F1F1F1F1DDDDDD969696969696969696969696969696FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF8F8F8CBCBCB996666FF9966FF9933996666FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFDDDDDD969696B2B2B2A4A0A0999999FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFCCCCCC996666FF9966996666FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDD969696B2B2B2999999FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7996666996666FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3969696999999FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F0CAA6F0CAA6F0CAA6F0
            CAA6F0CAA6F0CAA6F0CAA6F0CAA6C0C0C0C0C0C0CC9999996666FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2B2B2B2B2B2B2B2B2
            B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2969696FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object ModifyBonusButton: TSpeedButton
          Left = 65
          Top = 2
          Width = 62
          Height = 57
          Action = ModifyBonus
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9966
            6699666699666699666699666699666699666699666699666699666699666699
            6666996666996666996666996666996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            9696969999999999999999999999999999999999999999999999999999999999
            99999999999999999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF996666F0CAA6FFECCCF0CAA6F0CAA6F0CAA6CCCC99CCCC99CCCC99CCCC99
            CCCC66FFCC66FFCC66FFCC66FFCC66FFCC66996666FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF969696DDDDDDE3E3E3DDDDDDD7D7D7CCCCCCC0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0969696FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF996666FFCCCCFFECCCF0CAA6F0CAA6CC9999CC9966CC9966CC99
            66CCCC66CCCC66CCCC66CCCC66FFCC66FFCC66FFCC66996666FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF969696E3E3E3E3E3E3DDDDDDD7D7D7C0C0C0C0C0C0B2B2B2
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0969696FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCCFFECCCF0CAA639393999666699
            9966999966CC9966CC9966CC9966CCCC66CCCC66CCCC66FFCC66996666FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3E3E3E3DDDDDDD7D7D78686868686
            86999999A4A0A0B2B2B2B2B2B2B2B2B2C0C0C0C0C0C0C0C0C0C0C0C0969696FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF996666FFECCCFFECCCFFECCCF0CAA61C1C1C
            292929424242996666996666999966CC9966CC9966CCCC66CCCC66CCCC669966
            66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696E3E3E3EAEAEAE3E3E3DDDDDD66
            6666666666868686868686868686969696A4A0A0B2B2B2C0C0C0C0C0C0C0C0C0
            969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666EAEAEAFFECCCFFECCCFFEC
            CC393939006699006699336666393939393939666633666633996666CC9966CC
            9966996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696EAEAEAF1F1F1EAEAEA
            E3E3E3808080868686868686868686808080666666777777808080969696A4A0
            A0B2B2B2969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666EAEAEAF1F1F1FF
            ECCCFFECCC808080006699336666996666996666996666663333555555666633
            996666999966996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999EAEAEAF1F1
            F1EAEAEAEAEAEAB2B2B2868686666666969696A4A0A096969666666666666680
            8080868686999999969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996666F1F1F1
            F1F1F1F1F1F1EAEAEAFFECCC003366996666CC9999CC66669966669966666633
            33666633666633996633996666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999F1
            F1F1F1F1F1F1F1F1EAEAEAE3E3E3555555868686C0C0C0B2B2B2A4A0A0969696
            666666666666777777868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9966
            66F8F8F8F8F8F8F1F1F1F1F1F1FFECCC336666996666CC9999CC9999CC666699
            6666996666663333666633666633666633FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            999999F1F1F1FFFFFFF1F1F1F1F1F1EAEAEA868686999999CCCCCCC0C0C0B2B2
            B2A4A0A0868686666666666666666666777777FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF996666F8F8F8FFFFFFF8F8F8F1F1F1FFECCCFFECCC5F5F5FCC9999CC9999
            CC9999CC6666996666996666663333663333663333FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFA4A0A0FFFFFFFFFFFFFFFFFFF1F1F1EAEAEAEAEAEA808080D7D7D7CC
            CCCCC0C0C0B2B2B2A4A0A0868686666666666666666666FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFCC6666F8F8F8FFFFFFFFFFFFF8F8F8F1F1F1FFECCCF0CAA65F5F
            5FCC9999CC9999CC9999CC6666996666996666663333663333FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1EAEAEADDDDDD
            808080CCCCCCCCCCCCC0C0C0B2B2B2A4A0A0868686666666666666FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFF1F1F1F1F1F1FF
            ECCCF0CAA6663333CC9999CC9999CC9999CC6666996666996666663333FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFA4A0A0FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F1F1
            F1EAEAEADDDDDD777777CCCCCCCCCCCCC0C0C0B2B2B2A4A0A08686865F5F5FFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFFFFF8F8F8
            F1F1F1F1F1F1FFECCCCC9999663333CC9999CC9999CC9999CC66669966666633
            33FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF1F1F1F1F1F1EAEAEAC0C0C0777777CCCCCCCCCCCCC0C0C0B2B2B2999999
            666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFFFFFFFFFF
            FFFFFFFFF8F8F8F1F1F1F1F1F1FFECCCCC9999663333CC9999CC9999CC9999CC
            6666996666663333FFFFFFFFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF1F1F1F1F1F1EAEAEAC0C0C0777777CCCCCCCCCCCCC0C0
            C0B2B2B2868686777777FFFFFFFFFFFFFFFFFFFFFFFFCC9966F8F8F8FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFF8F8F8F1F1F1F1F1F1FFECCCCC9999996666F0CAA6
            CC9999CC99999933334D4D4D424242FFFFFFFFFFFFFFFFFFB2B2B2FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F1F1F1EAEAEAC0C0C0969696D7
            D7D7CCCCCCC0C0C0868686777777666666FFFFFFFFFFFFFFFFFFCC9966F8F8F8
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F1F1F1F1F1F1FFCCCC9966
            33996666F0CAA6CC99990099CC0099FF0099CC0099CCFFFFFFFFFFFFB2B2B2FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F1F1F1DDDDDD
            868686969696D7D7D7C0C0C0808080868686868686777777FFFFFFFFFFFFCC99
            66F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8CB
            CBCB996666FFCC66CC663366333300CCFF0099CC003399000099000099000080
            B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFDDDDDD969696C0C0C09696968686868686868080806666666666666666665F
            5F5FCC9966F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFCCCCCC996666FFCC66FF99665F5F5F00CCFF0033990033CC0033CC0033
            CC000099B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFDDDDDD969696C0C0C0B2B2B2808080868686666666868686808080
            777777666666CC9966FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFD7D7D7996666FFCC66996666FFFFFF0099CC0033CC3333FF00
            33CC0033CC000080B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE3E3E3969696C0C0C0999999FFFFFF777777868686B2B2
            B2868686777777666666CC9966CC9966CC9966CC9966CC9966CC9966CC9966CC
            9966CC9966CC9966CC9966CC9966996666996666FFFFFFFFFFFFFFFFFF0033CC
            6666FF3333CC000099FFFFFFB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
            B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2969696999999FFFFFFFFFFFFFFFFFF86
            8686C0C0C0999999666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF0033CC000099FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF868686777777FFFFFFFFFFFF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object DeleteBonusButton: TSpeedButton
          Left = 191
          Top = 2
          Width = 62
          Height = 57
          Action = DeleteBonus
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CCFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000
            CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686
            868686FFFFFFFFFFFFFFFFFF0000CC0000CC0000CCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC00
            00CCFFFFFFFFFFFFFFFFFFFFFFFF868686868686868686FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686868686
            86868686FFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000CCFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC
            0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686868686FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86868686
            8686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000CC0000CC
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000
            CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86868686868686868686
            8686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686
            868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            FF0000CC0000CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC00
            00CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            999999868686868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686868686
            86868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF0000CC0000CC0000CC0000CCFFFFFFFFFFFF0000CC0000CC0000CC
            0000CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF868686868686868686868686FFFFFFFFFFFF86868686868686
            8686868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000CC0000CC0000CC0000CC0000
            CC0000CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686868686868686868686868686
            868686868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC0000FF0000CC00
            00FF0000CC0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686868686869999998686
            86999999868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000CC
            0000CC0000FF0000CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86868686
            8686868686999999868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC0000
            CC0000FF0000CC0000CC0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686
            868686999999868686868686999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CC00
            00CC0000FF0000CC0000FF0000FF0000FF0000CC0000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686
            86868686999999868686999999999999999999868686999999FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF
            0000FF0000FF0000CC0000FFFFFFFFFFFFFF0000FF0000FF0000FF0000FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
            9999999999999999868686999999FFFFFFFFFFFF999999999999999999999999
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF0000FF0000CC0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF00
            00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF999999868686999999999999FFFFFFFFFFFFFFFFFFFFFFFF9999999999
            99999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF999999999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF999999999999999999FFFFFFFFFFFFFFFFFFFFFFFF
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
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object ViewBonusButton: TSpeedButton
          Left = 127
          Top = 2
          Width = 64
          Height = 57
          Action = ViewBonus
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            B60D0000424DB60D000000000000360000002800000030000000180000000100
            180000000000800D0000C40E0000C40E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF885D406947316947
            31885D40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            939393808080808080939393FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF694731B09A8BC3B0A3C3B0A2AF9889694731FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF808080C2C2C2D1D1D1D1D1D1C1C1C1808080FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF694731AF998ADDCFC6E3D6CEE1D3
            CBD9C9C0AD9787694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080C2C2C2
            E4E4E4E8E8E8E6E6E6E1E1E1C0C0C0808080FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF69
            4731B09A8CDFD2CAE6DAD3983000983000E1D3CBD8C9BFAD9787694731FF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FF808080C2C2C2E6E6E6EBEBEB6A6A6A6A6A6AE6E6E6E0E0E0C0
            C0C0808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF694731B29D8EE3D8D1E9E0DA983000C86000C860
            00983000E1D3CBD9C9C0AF9989694731FF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080C4C4C4E9E9E9EEEEEE
            6A6A6A8E8E8E8E8E8E6A6A6AE6E6E6E1E1E1C2C2C2808080FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF694731B49F90E8
            E0DAEDE4DF983000C86000DA8338D77D2FC86000983000E1D3CBDCCCC3B29C8D
            694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FF808080C6C6C6EEEEEEF0F0F06A6A6A8E8E8EADADADA9A9A98E8E8E6A6A6AE6
            E6E6E2E2E2C3C3C3808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF694731B5A092F2ECE8ECE2DB983000C86000E08E4BDD8942DA83
            38D77D2FC86000983000DFCDC4E1D2C9B29C8D694731FF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF808080C6C6C6F5F5F5EFEFEF6A6A6A8E8E8E
            B6B6B6B2B2B2ADADADA9A9A98E8E8E6A6A6AE3E3E3E6E6E6C3C3C3808080FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF694731B4A092EEE8E4EFE6E198
            3000F68B56E59A5DD79D80C59075C38C71C08361C08361C86000983000DFCDC4
            DCCDC4AF9989694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080C6C6
            C6F2F2F2F1F1F16A6A6AB9B9B9BFBFBFC5C5C5BCBCBCB9B9B9B2B2B2B2B2B28E
            8E8E6A6A6AE3E3E3E3E3E3C2C2C2808080FF00FFFF00FFFF00FFFF00FFFF00FF
            694731B4A193EDE8E4F7F3F1983000F68B56ECA670F7BD9FFFFFFFFFFFFFFFFF
            FFFFFFFFC08361D77D2FC86000983000E2D4CCDACAC1AE9788694731FF00FFFF
            00FFFF00FFFF00FF808080C7C7C7F2F2F2F8F8F86A6A6AB9B9B9C8C8C8DADADA
            FFFFFFFFFFFFFFFFFFFFFFFFB2B2B2A9A9A98E8E8E6A6A6AE7E7E7E1E1E1C0C0
            C0808080FF00FFFF00FFFF00FF694731B5A294EFEAE7FAF8F7983000F68B56F2
            B282EFAC79F7A175EBA882FFFFFFFFFFFFC08361DD8942DA8338D77D2FC86000
            983000E2D4CCD9C9C0AE9788694731FF00FFFF00FF808080C8C8C8F4F4F4FBFB
            FB6A6A6AB9B9B9D0D0D0CCCCCCC8C8C8CCCCCCFFFFFFFFFFFFB2B2B2B2B2B2AD
            ADADA9A9A98E8E8E6A6A6AE7E7E7E1E1E1C0C0C0808080FF00FFB7A293C2AFA2
            F3EFEDFDFDFD983000F68B56F8BE95F5B88CF2B282F9AC81EBA882FFFFFFFFFF
            FFC08361E08E4BDD8942DA8338D77D2FC86000983000E2D4CCDACAC1AF998A88
            5D40C8C8C8D0D0D0F6F6F6FEFEFE6A6A6AB9B9B9D8D8D8D5D5D5D0D0D0CECECE
            CCCCCCFFFFFFFFFFFFB2B2B2B6B6B6B2B2B2ADADADA9A9A98E8E8E6A6A6AE7E7
            E7E1E1E1C2C2C2939393B7A293FAF8F6FFFFFFC86000F68B56FBC39FFBC39FF8
            BE95F5B88CF9B187EBA882FFFFFFFFFFFFC08361E29453E08E4BDD8942DA8338
            D77D2FC86000983000E3D5CDC3B0A3694731C8C8C8FBFBFBFFFFFF8E8E8EB9B9
            B9DCDCDCDCDCDCD8D8D8D5D5D5D2D2D2CCCCCCFFFFFFFFFFFFB2B2B2BBBBBBB6
            B6B6B2B2B2ADADADA9A9A98E8E8E6A6A6AE8E8E8D1D1D1808080D0BBACFFFFFF
            FFFFFFC86000F6BF9CFBC39FFBC39FFBC39FF8BE95F9B78FEBA882FFFFFFFFFF
            FFC08361E59A5DE29453E08E4BDE8B46DB863DC86000983000E4D8D0C3B1A469
            4731D7D7D7FFFFFFFFFFFF8E8E8EDADADADCDCDCDCDCDCDCDCDCD8D8D8D5D5D5
            CCCCCCFFFFFFFFFFFFB2B2B2BFBFBFBBBBBBB6B6B6B4B4B4AFAFAF8E8E8E6A6A
            6AE9E9E9D2D2D2808080D0BBACF5F1EDFFFFFFFFFFFFC86000F6BF9CFBC39FFB
            C39FFBC39FEFBEA0EBA882FFFFFFFFFFFFD29674EAA36BE79D61E49758E1914F
            C86000983000E7DCD6DED1C8B09A8B885D40D7D7D7F8F8F8FFFFFFFFFFFF8E8E
            8EDADADADCDCDCDCDCDCDCDCDCDADADACCCCCCFFFFFFFFFFFFC0C0C0C6C6C6C1
            C1C1BCBCBCB9B9B98E8E8E6A6A6AECECECE5E5E5C2C2C2939393FF00FFD0BBAC
            F3EEEAFFFFFFFFFFFFC86000F6BF9CFBC39FFBC39FFABF99FFFFFFFFFFFFFFFF
            FFF0AF7EEDA974EAA36BE79D61C86000983000EAE1DCE0D3CCAF9A8B694731FF
            00FFFF00FFD7D7D7F6F6F6FFFFFFFFFFFF8E8E8EDADADADCDCDCDCDCDCDADADA
            FFFFFFFFFFFFFFFFFFCECECEC9C9C9C6C6C6C1C1C18E8E8E6A6A6AEFEFEFE6E6
            E6C2C2C2808080FF00FFFF00FFFF00FFD0BBACF3EEEAFFFFFFFFFFFFC86000F6
            BF9CFBC39FFBC39FFBC39FC49375C49375F3B587F0AF7EEDA974F68B56983000
            EEE6E1E3D9D2B09B8C694731FF00FFFF00FFFF00FFFF00FFD7D7D7F6F6F6FFFF
            FFFFFFFF8E8E8EDADADADCDCDCDCDCDCDCDCDCBDBDBDBDBDBDD2D2D2CECECEC9
            C9C9B9B9B96A6A6AF1F1F1EAEAEAC3C3C3808080FF00FFFF00FFFF00FFFF00FF
            FF00FFD0BBACF5F1EEFFFFFFFCF8F4C86000F6BF9CFBC39FEDD7C9FFFFFFD0BF
            B4C49375F3B587F68B56983000EEE4DEEAE1DCB29D8E694731FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFD7D7D7F8F8F8FFFFFFFBFBFB8E8E8EDADADADCDCDC
            E8E8E8FFFFFFDADADABDBDBDD2D2D2B9B9B96A6A6AF0F0F0EFEFEFC4C4C48080
            80FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0BBACF9F6F4FFFFFFFC
            F8F4C86000F6BF9CFFFFFFFFFEFEFFFFFFC49375F68B56983000F1E8E3F3EEEA
            B49F91694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7
            D7FAFAFAFFFFFFFBFBFB8E8E8EDADADAFFFFFFFEFEFEFFFFFFBDBDBDB9B9B96A
            6A6AF2F2F2F6F6F6C6C6C6808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFD0BBACF9F6F4FFFFFFFFFFFFC86000F6BF9CFFFFFFD296
            74F68B56983000F8F5F3EFEAE6B5A092694731FF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7D7FAFAFAFFFFFFFFFFFF8E8E8E
            DADADAFFFFFFC0C0C0B9B9B96A6A6AFAFAFAF4F4F4C6C6C6808080FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0BBACF5
            F1EDFFFFFFFFFFFFC86000F6BF9CF68B56983000FBFAF9EEE9E5B4A092694731
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFD7D7D7F8F8F8FFFFFFFFFFFF8E8E8EDADADAB9B9B96A6A6AFCFCFCF3
            F3F3C6C6C6808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFD0BBACF3EEEAFFFFFFFFFFFFC86000C860
            00FEFEFEF0ECE9B4A194694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7D7F6F6F6FFFFFF
            FFFFFF8E8E8E8E8E8EFEFEFEF5F5F5C7C7C7808080FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFD0BBACF7EFEBFFFFFFFFFFFFFFFFFFF3EFEDB5A295694731FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFD7D7D7F6F6F6FFFFFFFFFFFFFFFFFFF6F6F6C8C8C880
            8080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0BBACF5F1EEFFFFFFFAF8
            F6C2AEA1694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7D7
            F8F8F8FFFFFFFBFBFBCFCFCF808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFD0BBACD0BBACB7A293B7A293FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFD7D7D7D7D7D7C8C8C8C8C8C8FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object ReformBonusButton: TSpeedButton
          Left = 359
          Top = 2
          Width = 104
          Height = 57
          Action = FormShtatBonus
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            B60D0000424DB60D000000000000360000002800000030000000180000000100
            180000000000800D0000C40E0000C40E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF6947316947316947316947316947316947316947316947316947316947
            316947316947316947316947316947316947316947313C511CFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FF808080808080808080808080808080808080808080
            8080808080808080808080808080808080808080808080808080808080807B7B
            7BFF00FFFF00FFFF00FFFF00FFFF00FF00900072D28A00600000600000600000
            6000006000006000006000006000006000006000006000006000006000006000
            006000006000006000694731FF00FFFF00FFFF00FFFF00FF929292D4D4D47676
            7676767676767676767676767676767676767676767676767676767676767676
            7676767676767676767676767676767676808080FF00FFFF00FFFF00FFFF00FF
            009000FFFFFF41C15E3CBE5837BB5032B84A2EB5432AB23D25AF3620AC2F1BA9
            2716A62011A2190CA012089D0C039905009800009800006000694731FF00FFFF
            00FFFF00FFFF00FF929292FFFFFFC2C2C2BFBFBFBCBCBCB9B9B9B6B6B6B4B4B4
            B1B1B1ADADADAAAAAAA7A7A7A3A3A39F9F9F9D9D9D9999999797979797977676
            76808080FF00FFFF00FFFF00FFFF00FF009000FFFFFF45C46441C15E2FAB451B
            8D2732B84A2EB54321A1310B770F0F85171BA92716A62011A2190CA012089D0C
            029904009800006000694731FF00FFFF00FFFF00FFFF00FF929292FFFFFFC4C4
            C4C2C2C2B2B2B29C9C9CB9B9B9B6B6B6A9A9A98A8A8A939393AAAAAAA7A7A7A3
            A3A39F9F9F9D9D9D999999979797767676808080FF00FFFF00FFFF00FFFF00FF
            009000FFFFFF4CC86E46C566FFFFFF0568071B8D2829A63CFFFFFFFFFFFF0367
            051085171BA92817A62112A31A0DA013089D0C039905006000694731FF00FFFF
            00FFFF00FFFF00FF929292FFFFFFC8C8C8C5C5C5FFFFFF7D7D7D9D9D9DADADAD
            FFFFFFFFFFFF7C7C7C939393AAAAAAA7A7A7A4A4A49F9F9F9D9D9D9999997676
            76808080FF00FFFF00FFFF00FFFF00FF009000FFFFFF51CB754CC86EFFFFFFFF
            FFFF056807FFFFFFFFFFFFFFFFFFFFFFFF0367051085181CAA2917A72212A31B
            0DA013089D0C006000694731FF00FFFF00FFFF00FFFF00FF929292FFFFFFCBCB
            CBC8C8C8FFFFFFFFFFFF7D7D7DFFFFFFFFFFFFFFFFFFFFFFFF7C7C7C939393AB
            ABABA8A8A8A4A4A49F9F9F9D9D9D767676808080FF00FFFF00FFFF00FFFF00FF
            009000FFFFFF55CE7B51CB75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF0367051186191DAB2B19A72414A41C0EA115006000694731FF00FFFF
            00FFFF00FFFF00FF929292FFFFFFCDCDCDCBCBCBFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF7C7C7C949494ABABABA9A9A9A4A4A4A1A1A17676
            76808080FF00FFFF00FFFF00FFFF00FF009000FFFFFF57CF7F55CE7BFFFFFFFF
            FFFFFFFFFFFFFFFF0568071C8E2934B94DFFFFFFFFFFFF0B771022AD321DAB2B
            18A72314A41C006000694731FF00FFFF00FFFF00FFFF00FF929292FFFFFFCFCF
            CFCDCDCDFFFFFFFFFFFFFFFFFFFFFFFF7D7D7D9D9D9DBABABAFFFFFFFFFFFF8A
            8A8AAEAEAEABABABA8A8A8A4A4A4767676808080FF00FFFF00FFFF00FFFF00FF
            009000FFFFFF58D08057CF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0568071C8D
            2934B94DFFFFFF1A922613881C22AD321DAA2A18A723006000694731FF00FFFF
            00FFFF00FFFF00FF929292FFFFFFCFCFCFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF7D7D7D9D9D9DBABABAFFFFFF9E9E9E969696AEAEAEABABABA8A8A87676
            76808080FF00FFFF00FFFF00FFFF00FF009000FFFFFF58D08058D080FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF31AC4839BC5334B94DFFFFFF23A33327B139
            21AD311DAA2A006000694731FF00FFFF00FFFF00FFFF00FF929292FFFFFFCFCF
            CFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4B4B4BCBCBCBABABAFF
            FFFFAAAAAAB2B2B2AEAEAEABABAB767676808080FF00FFFF00FFFF00FFFF00FF
            009000FFFFFF58D08058D08058D08046B9662A963D52CC774EC9713BB155137C
            1C127B1A117B180F7A160E791416892028B13A22AD32006000694731FF00FFFF
            00FFFF00FFFF00FF929292FFFFFFCFCFCFCFCFCFCFCFCFC0C0C0A6A6A6CCCCCC
            C9C9C9B9B9B99090908F8F8F8E8E8E8D8D8D8B8B8B989898B2B2B2AEAEAE7676
            76808080FF00FFFF00FFFF00FFFF00FF009000FFFFFF58D08058D08058D080FF
            FFFF34A24C2A963D52CC77FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E7915
            2DB54229B13B006000694731FF00FFFF00FFFF00FFFF00FF929292FFFFFFCFCF
            CFCFCFCFCFCFCFFFFFFFB0B0B0A6A6A6CCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF8C8C8CB5B5B5B3B3B3767676808080FF00FFFF00FFFF00FFFF00FF
            009000FFFFFF58D08058D08058D08058D080FFFFFF07690B2A963D52CC77FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF107A1732B7492DB543006000694731FF00FFFF
            00FFFF00FFFF00FF929292FFFFFFCFCFCFCFCFCFCFCFCFCFCFCFFFFFFF7F7F7F
            A6A6A6CCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8D8DB9B9B9B6B6B67676
            76808080FF00FFFF00FFFF00FFFF00FF009000FFFFFF58D08058D08058D08058
            D080FFFFFFFFFFFF07690B198024177F22FFFFFFFFFFFFFFFFFFFFFFFF117B19
            36BA5032B749006000694731FF00FFFF00FFFF00FFFF00FF929292FFFFFFCFCF
            CFCFCFCFCFCFCFCFCFCFFFFFFFFFFFFF7F7F7F949494939393FFFFFFFFFFFFFF
            FFFFFFFFFF8E8E8EBCBCBCB9B9B9767676808080FF00FFFF00FFFF00FFFF00FF
            009000FFFFFF58D08058D08058D08058D08058D080FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF127B1B3BBD5636BA50006000694731FF00FFFF
            00FFFF00FFFF00FF929292FFFFFFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FBEBEBEBCBCBC7676
            76808080FF00FFFF00FFFF00FFFF00FF009000FFFFFF58D08058D08058D08058
            D08058D08058D080FFFFFFFFFFFFFFFFFFFFFFFF41B65FFFFFFFFFFFFF147C1D
            3FC05C3BBD56006000694731FF00FFFF00FFFF00FFFF00FF929292FFFFFFCFCF
            CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBDFF
            FFFFFFFFFF909090C1C1C1BEBEBE767676808080FF00FFFF00FFFF00FFFF00FF
            009000FFFFFF58D08058D08058D08058D08058D08058D08058D080FFFFFFFFFF
            FF46B96657CF7E54CE7AFFFFFF3DB35746C46640C15D006000694731FF00FFFF
            00FFFF00FFFF00FF929292FFFFFFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
            CFCFCFFFFFFFFFFFFFC0C0C0CFCFCFCDCDCDFFFFFFBABABAC5C5C5C2C2C27676
            76808080FF00FFFF00FFFF00FFFF00FF009000FFFFFF58D08058D08058D08058
            D08058D08058D08058D08058D08058D08058D08058D08057CF7E54CE7A50CB74
            4BC86C47C566006000694731FF00FFFF00FFFF00FFFF00FF929292FFFFFFCFCF
            CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
            CFCFCDCDCDCBCBCBC8C8C8C6C6C6767676808080FF00FFFF00FFFF00FFFF00FF
            009000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF76D48F694731FF00FFFF
            00FFFF00FFFF00FF929292FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D6
            D6808080FF00FFFF00FFFF00FFFF00FFFF00FF00900000900000900000900000
            9000009000009000009000009000009000009000009000009000009000009000
            009000009000009000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9292929292
            9292929292929292929292929292929292929292929292929292929292929292
            9292929292929292929292929292929292FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Layout = blGlyphTop
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
      end
      object BonusGrid: TcxGrid
        Left = 0
        Top = 61
        Width = 465
        Height = 339
        Align = alClient
        TabOrder = 1
        object cxGridDBTableView1: TcxGridDBTableView
          DataController.DataSource = BonusSource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsBehavior.CellHints = True
          OptionsSelection.CellSelect = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = qizzStyle
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = #1053#1072#1076#1073#1072#1074#1082#1072'/'#1076#1086#1087#1083#1072#1090#1072
            SortOrder = soAscending
            Width = 139
            DataBinding.FieldName = 'RAISE_NAME'
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = #1055#1086#1095#1072#1090#1086#1082
            Width = 78
            DataBinding.FieldName = 'Date_Beg'
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = #1050#1110#1085#1077#1094#1100
            Width = 83
            DataBinding.FieldName = 'Date_End'
          end
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = '% / '#1089#1091#1084#1072
            Width = 81
            DataBinding.FieldName = 'The_Bonus'
          end
          object cxGridDBColumn5: TcxGridDBColumn
            Caption = #1050#1086#1096#1090#1086#1088#1080#1089
            Width = 82
            DataBinding.FieldName = 'SMETA_NAME'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 400
        Width = 465
        Height = 33
        Align = alBottom
        TabOrder = 2
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 60
          Height = 13
          Caption = #1055#1088#1080#1084#1110#1090#1082#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 72
          Top = 8
          Width = 385
          Height = 17
          DataField = 'Note'
          ParentShowHint = False
          ShowHint = True
        end
      end
    end
  end
  object LocalDatabase: TpFIBDatabase
    DBName = '192.168.16.5:RELEASE'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=tpfibdataset'
      'sql_role_name=')
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 360
    Top = 40
  end
  object GetIdMovingQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      'select first(1) id_man_moving'
      'from   man_moving'
      'where id_order = :id_order')
    Left = 276
    Top = 44
    poSQLINT64ToBCD = True
    object GetIdMovingQueryID_MAN_MOVING: TFIBIntegerField
      FieldName = 'ID_MAN_MOVING'
    end
  end
  object LocalReadTransaction: TpFIBTransaction
    DefaultDatabase = LocalDatabase
    TimeoutAction = TARollback
    Left = 392
    Top = 40
  end
  object LocalWriteTransaction: TpFIBTransaction
    DefaultDatabase = LocalDatabase
    TimeoutAction = TARollback
    Left = 424
    Top = 40
  end
  object MovTypeQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from INI_MOVING_TYPE'
      'where is_first = 1')
    Left = 316
    Top = 44
    poSQLINT64ToBCD = True
    object MovTypeQueryID_MOVING_TYPE: TFIBIntegerField
      FieldName = 'ID_MOVING_TYPE'
      Visible = False
    end
    object MovTypeQueryNAME_MOVING_TYPE: TFIBStringField
      DisplayLabel = #1058#1080#1087' '#1087#1077#1088#1077#1084#1110#1097#1077#1085#1085#1103
      FieldName = 'NAME_MOVING_TYPE'
      Size = 100
      EmptyStrToNull = True
    end
  end
  object KeyList: TActionList
    Left = 52
    Top = 476
    object OkAction: TAction
      Caption = 'OkAction'
      ShortCut = 13
      SecondaryShortCuts.Strings = (
        'F10')
      OnExecute = OkActionExecute
    end
    object CancelAction: TAction
      Caption = 'q'
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
    object AddSmeta: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = AddSmetaExecute
    end
    object ModifySmeta: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = ModifySmetaExecute
    end
    object DeleteSmeta: TAction
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080
      OnExecute = DeleteSmetaExecute
    end
    object ViewSmeta: TAction
      Caption = #1055#1077#1088#1077#1075#1083#1103#1076
      OnExecute = ViewSmetaExecute
    end
    object AddBonus: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = AddBonusExecute
    end
    object ModifyBonus: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = ModifyBonusExecute
    end
    object DeleteBonus: TAction
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080
      OnExecute = DeleteBonusExecute
    end
    object ViewBonus: TAction
      Caption = #1055#1077#1088#1077#1075#1083#1103#1076
      OnExecute = ViewBonusExecute
    end
    object FormShtatBonus: TAction
      Caption = #1055#1077#1088#1077#1092#1086#1088#1084#1091#1074#1072#1090#1080
      OnExecute = FormShtatBonusExecute
    end
  end
  object SmetViewQuery: TRxMemoryData
    Active = True
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'ID_MAN_MOV_SMET'
        DataType = ftInteger
      end
      item
        Name = 'ID_MAN_MOVING'
        DataType = ftInteger
      end
      item
        Name = 'KOD_SM'
        DataType = ftInteger
      end
      item
        Name = 'KOD_SM_PPS'
        DataType = ftInteger
      end
      item
        Name = 'DATE_BEG'
        DataType = ftInteger
      end
      item
        Name = 'DATE_END'
        DataType = ftInteger
      end
      item
        Name = 'KOEFF_PPS'
        DataType = ftFloat
      end
      item
        Name = 'KOL_STAVOK'
        DataType = ftFloat
      end
      item
        Name = 'OKLAD'
        DataType = ftFloat
      end
      item
        Name = 'OKLAD_PPS'
        DataType = ftFloat
      end
      item
        Name = 'OKLAD_BASE'
        DataType = ftFloat
      end
      item
        Name = 'SM_TITLE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'SM_PPS_TITLE'
        DataType = ftString
        Size = 255
      end>
    Left = 396
    Top = 224
    object SmetViewQueryID_MAN_MOV_SMET: TIntegerField
      FieldName = 'ID_MAN_MOV_SMET'
    end
    object SmetViewQueryID_MAN_MOVING: TIntegerField
      FieldName = 'ID_MAN_MOVING'
    end
    object SmetViewQueryKOD_SM: TIntegerField
      FieldName = 'KOD_SM'
    end
    object SmetViewQueryKOD_SM_PPS: TIntegerField
      FieldName = 'KOD_SM_PPS'
    end
    object SmetViewQueryDATE_BEG: TIntegerField
      FieldName = 'DATE_BEG'
    end
    object SmetViewQueryDATE_END: TIntegerField
      FieldName = 'DATE_END'
    end
    object SmetViewQueryKOEFF_PPS: TFloatField
      FieldName = 'KOEFF_PPS'
    end
    object SmetViewQueryKOL_STAVOK: TFloatField
      FieldName = 'KOL_STAVOK'
    end
    object SmetViewQueryOKLAD: TFloatField
      FieldName = 'OKLAD'
    end
    object SmetViewQueryOKLAD_PPS: TFloatField
      FieldName = 'OKLAD_PPS'
    end
    object SmetViewQueryOKLAD_BASE: TFloatField
      FieldName = 'OKLAD_BASE'
    end
    object SmetViewQuerySM_TITLE: TStringField
      FieldName = 'SM_TITLE'
      Size = 255
    end
    object SmetViewQuerySM_PPS_TITLE: TStringField
      FieldName = 'SM_PPS_TITLE'
      Size = 255
    end
  end
  object SmetSource: TDataSource
    DataSet = SmetViewQuery
    Left = 420
    Top = 224
  end
  object GetSmTitle: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      'select * from DT_MAN_MOV_SMET_GET_TITLE(:kod_sm, :kod_sm_pps)')
    Left = 340
    Top = 44
    poSQLINT64ToBCD = True
    object GetSmTitleSM_TITLE: TFIBStringField
      FieldName = 'SM_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
    object GetSmTitleSM_PPS_TITLE: TFIBStringField
      FieldName = 'SM_PPS_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object WorkQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalWriteTransaction
    DeleteSQL.Strings = (
      'execute procedure DT_MAN_MOV_SMET_DELETE_BY_ORDER(:id_order)')
    InsertSQL.Strings = (
      'EXECUTE PROCEDURE DT_MAN_MOV_SMET_INSERT ('
      '    :ID_MAN_MOVING,'
      '    :KOD_SM,'
      '    :KOD_SM_PPS,'
      '    :KOEFF_PPS,'
      '    :OKLAD,'
      '    :OKLAD_PPS,'
      '    :KOL_STAVOK,'
      '    :ID_ORDER,'
      '    :DATE_BEG,'
      '    :DATE_END,'
      '    :OKLAD_BASE)')
    SelectSQL.Strings = (
      'select * from DT_MAN_MOV_SMET_SELECT_BY_ORDER(:id_order)')
    Left = 364
    Top = 112
    poSQLINT64ToBCD = True
    object WorkQueryID_MAN_MOV_SMET: TFIBIntegerField
      FieldName = 'ID_MAN_MOV_SMET'
    end
    object WorkQueryID_MAN_MOVING: TFIBIntegerField
      FieldName = 'ID_MAN_MOVING'
    end
    object WorkQueryKOD_SM: TFIBIntegerField
      FieldName = 'KOD_SM'
    end
    object WorkQueryKOD_SM_PPS: TFIBIntegerField
      FieldName = 'KOD_SM_PPS'
    end
    object WorkQueryKOEFF_PPS: TFIBFloatField
      FieldName = 'KOEFF_PPS'
    end
    object WorkQueryOKLAD: TFIBFloatField
      FieldName = 'OKLAD'
    end
    object WorkQueryOKLAD_PPS: TFIBFloatField
      FieldName = 'OKLAD_PPS'
    end
    object WorkQueryKOL_STAVOK: TFIBFloatField
      FieldName = 'KOL_STAVOK'
    end
    object WorkQueryDATE_BEG: TFIBDateField
      FieldName = 'DATE_BEG'
    end
    object WorkQueryDATE_END: TFIBDateField
      FieldName = 'DATE_END'
    end
    object WorkQueryOKLAD_BASE: TFIBFloatField
      FieldName = 'OKLAD_BASE'
    end
    object WorkQuerySM_TITLE: TFIBStringField
      FieldName = 'SM_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
    object WorkQuerySM_PPS_TITLE: TFIBStringField
      FieldName = 'SM_PPS_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object SelectTypePost: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM Shtat_Post_Types(:Id_Post)')
    Left = 400
    Top = 112
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
    object SelectTypePostSHORT_NAME: TFIBStringField
      DisplayLabel = #1057#1082#1086#1088#1086#1095#1077#1085#1072' '#1085#1072#1079#1074#1072
      FieldName = 'SHORT_NAME'
      Size = 10
      EmptyStrToNull = True
    end
  end
  object GetDefaultsQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      
        'SELECT ia.Default_Work_Mode, ia.Default_Pay_Form, ia.Default_Wor' +
        'k_Cond,'
      '       dwm.Name, iwc.Name_Work_Cond, ipf.Name_Pay_Form,'
      '       ia.ALLOW_EMPTY_SMETS_IN_ORDERS,'
      '       ia.DEFAULT_ID_MOVING_TYPE_ACCEPT,'
      '       ia.DEFAULT_ID_SOVMEST_ACCEPT,'
      '       imt.Name_Moving_Type,'
      '       ais.Name_Sovmest,'
      '       ia.Default_Id_Work_Reason,'
      '       aiwr.Name_Full,'
      '       ia.CHECK_SR_VACANT_ST'
      'from   ini_asup_consts ia'
      
        'left join dt_work_mode dwm on (dwm.id_work_mode = ia.Default_Wor' +
        'k_Mode)'
      
        'left join ini_work_cond iwc on (iwc.Id_Work_Cond = ia.Default_Wo' +
        'rk_Cond)'
      
        'left join ini_pay_form ipf on (ipf.Id_Pay_Form = ia.Default_Pay_' +
        'Form)'
      
        'left join ini_moving_type imt on (imt.Id_Moving_Type = ia.Defaul' +
        't_Id_Moving_Type_Accept)'
      
        'left join Asup_Ini_Sovmest ais on (ais.Id_Sovmest = ia.Default_I' +
        'd_Sovmest_Accept)'
      
        'left join Asup_Ini_Work_Reason aiwr on (aiwr.Id_Work_Reason = ia' +
        '.Default_Id_Work_Reason)')
    AfterOpen = GetDefaultsQueryAfterOpen
    Left = 432
    Top = 112
    poSQLINT64ToBCD = True
    object GetDefaultsQueryDEFAULT_WORK_MODE: TFIBIntegerField
      FieldName = 'DEFAULT_WORK_MODE'
    end
    object GetDefaultsQueryDEFAULT_PAY_FORM: TFIBIntegerField
      FieldName = 'DEFAULT_PAY_FORM'
    end
    object GetDefaultsQueryDEFAULT_WORK_COND: TFIBIntegerField
      FieldName = 'DEFAULT_WORK_COND'
    end
    object GetDefaultsQueryNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object GetDefaultsQueryNAME_WORK_COND: TFIBStringField
      FieldName = 'NAME_WORK_COND'
      Size = 255
      EmptyStrToNull = True
    end
    object GetDefaultsQueryNAME_PAY_FORM: TFIBStringField
      FieldName = 'NAME_PAY_FORM'
      Size = 255
      EmptyStrToNull = True
    end
    object GetDefaultsQueryALLOW_EMPTY_SMETS_IN_ORDERS: TFIBStringField
      FieldName = 'ALLOW_EMPTY_SMETS_IN_ORDERS'
      Size = 1
      EmptyStrToNull = True
    end
    object GetDefaultsQueryDEFAULT_ID_MOVING_TYPE_ACCEPT: TFIBIntegerField
      FieldName = 'DEFAULT_ID_MOVING_TYPE_ACCEPT'
    end
    object GetDefaultsQueryDEFAULT_ID_SOVMEST_ACCEPT: TFIBIntegerField
      FieldName = 'DEFAULT_ID_SOVMEST_ACCEPT'
    end
    object GetDefaultsQueryNAME_MOVING_TYPE: TFIBStringField
      FieldName = 'NAME_MOVING_TYPE'
      Size = 100
      EmptyStrToNull = True
    end
    object GetDefaultsQueryNAME_SOVMEST: TFIBStringField
      FieldName = 'NAME_SOVMEST'
      Size = 255
      EmptyStrToNull = True
    end
    object GetDefaultsQueryDEFAULT_ID_WORK_REASON: TFIBIntegerField
      FieldName = 'DEFAULT_ID_WORK_REASON'
    end
    object GetDefaultsQueryNAME_FULL: TFIBStringField
      FieldName = 'NAME_FULL'
      Size = 255
      EmptyStrToNull = True
    end
    object GetDefaultsQueryCHECK_SR_VACANT_ST: TFIBStringField
      FieldName = 'CHECK_SR_VACANT_ST'
      Size = 1
      EmptyStrToNull = True
    end
  end
  object SelectWorkType: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_INI_SOVMEST_SELECT')
    Left = 328
    Top = 112
    poSQLINT64ToBCD = True
    object SelectWorkTypeID_SOVMEST: TFIBIntegerField
      FieldName = 'ID_SOVMEST'
      Visible = False
    end
    object SelectWorkTypeNAME_SOVMEST: TFIBStringField
      DisplayLabel = #1058#1080#1087' '#1088#1086#1073#1086#1090#1080
      FieldName = 'NAME_SOVMEST'
      Size = 255
      EmptyStrToNull = True
    end
    object SelectWorkTypeNO_ADD: TFIBStringField
      FieldName = 'NO_ADD'
      Visible = False
      Size = 1
      EmptyStrToNull = True
    end
    object SelectWorkTypeSHORT_NAME: TFIBStringField
      FieldName = 'SHORT_NAME'
      Visible = False
      Size = 80
      EmptyStrToNull = True
    end
    object SelectWorkTypeSHTAT: TFIBStringField
      FieldName = 'SHTAT'
      Visible = False
      Size = 1
      EmptyStrToNull = True
    end
    object SelectWorkTypeTEMPFREE: TFIBStringField
      FieldName = 'TEMPFREE'
      Visible = False
      Size = 1
      EmptyStrToNull = True
    end
    object SelectWorkTypeTEMPFOR: TFIBStringField
      FieldName = 'TEMPFOR'
      Visible = False
      Size = 1
      EmptyStrToNull = True
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 392
    Top = 192
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
  object ShtatrasQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM ASUP_ORDERS_SHTAT_SELECT(:ID_POST_SALARY, :ID_DEPARTMENT, :' +
        'CUR_DATE)')
    AfterOpen = ShtatrasQueryAfterOpen
    Left = 360
    Top = 152
    poSQLINT64ToBCD = True
    object ShtatrasQueryID_SR: TFIBIntegerField
      FieldName = 'ID_SR'
      Visible = False
    end
    object ShtatrasQueryKOD_SM: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1082#1086#1096#1090'.'
      FieldName = 'KOD_SM'
      Visible = False
    end
    object ShtatrasQuerySM_NUMBER: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1082#1086#1096#1090'.'
      DisplayWidth = 30
      FieldName = 'SM_NUMBER'
    end
    object ShtatrasQuerySM_TITLE: TFIBStringField
      DisplayLabel = #1050#1086#1096#1090#1086#1088#1080#1089
      DisplayWidth = 100
      FieldName = 'SM_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
    object ShtatrasQueryKOL_STAVOK: TFIBFloatField
      DisplayLabel = #1057#1090#1072#1074#1086#1082
      DisplayWidth = 30
      FieldName = 'KOL_STAVOK'
    end
    object ShtatrasQueryKOL_VACANT_STAVOK: TFIBFloatField
      DisplayLabel = #1042#1072#1082#1072#1085#1090#1085#1086
      DisplayWidth = 40
      FieldName = 'KOL_VACANT_STAVOK'
    end
    object ShtatrasQueryOKLAD: TFIBFloatField
      DisplayLabel = #1054#1082#1083#1072#1076
      DisplayWidth = 30
      FieldName = 'OKLAD'
    end
    object ShtatrasQuerySM_NUMBER_PPS: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1082#1086#1096#1090'. '#1087#1110#1076#1074'.'
      DisplayWidth = 30
      FieldName = 'SM_NUMBER_PPS'
    end
    object ShtatrasQueryKOD_SM_PPS: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1082#1086#1096#1090'. '#1087#1110#1076#1074'.'
      DisplayWidth = 30
      FieldName = 'KOD_SM_PPS'
      Visible = False
    end
    object ShtatrasQuerySM_TITLE_PPS: TFIBStringField
      DisplayLabel = #1050#1086#1096#1090#1086#1088#1080#1089' '#1087#1110#1076#1074'.'
      DisplayWidth = 100
      FieldName = 'SM_TITLE_PPS'
      Size = 255
      EmptyStrToNull = True
    end
    object ShtatrasQueryKOEFF_PPS: TFIBFloatField
      DisplayLabel = #1050#1086#1077#1092'. '#1087#1110#1076#1074#1080#1097#1077#1085#1085#1103
      DisplayWidth = 30
      FieldName = 'KOEFF_PPS'
    end
    object ShtatrasQueryWITHKOEF: TFIBStringField
      FieldName = 'WITHKOEF'
      Visible = False
      Size = 1
      EmptyStrToNull = True
    end
    object ShtatrasQuerySR_NAME: TFIBStringField
      DisplayLabel = #1064#1056
      DisplayWidth = 100
      FieldName = 'SR_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object ShtatrasQueryID_WORK_COND: TFIBIntegerField
      FieldName = 'ID_WORK_COND'
      Visible = False
    end
    object ShtatrasQueryNAME_WORK_COND: TFIBStringField
      FieldName = 'NAME_WORK_COND'
      Visible = False
      Size = 255
      EmptyStrToNull = True
    end
    object ShtatrasQueryID_WORK_MODE: TFIBIntegerField
      FieldName = 'ID_WORK_MODE'
      Visible = False
    end
    object ShtatrasQueryNAME_WORK_MODE: TFIBStringField
      FieldName = 'NAME_WORK_MODE'
      Visible = False
      Size = 255
      EmptyStrToNull = True
    end
  end
  object AcceptCondQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ASUP_ORDERS_ACCEPT_COND')
    AfterOpen = GetDefaultsQueryAfterOpen
    Left = 392
    Top = 152
    poSQLINT64ToBCD = True
    object AcceptCondQueryID_ACCEPT_COND: TFIBIntegerField
      FieldName = 'ID_ACCEPT_COND'
      Visible = False
    end
    object AcceptCondQueryNAME_ACCEPT_COND: TFIBStringField
      DisplayLabel = #1059#1084#1086#1074#1072' '#1074#1089#1090#1091#1087#1091' '#1085#1072' '#1087#1086#1089#1072#1076#1091
      FieldName = 'NAME_ACCEPT_COND'
      Size = 255
      EmptyStrToNull = True
    end
    object AcceptCondQueryNAME_ACCEPT_COND_PRINT: TFIBStringField
      DisplayLabel = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
      FieldName = 'NAME_ACCEPT_COND_PRINT'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object WorkReasonQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from ASUP_INI_WORK_REASON')
    Left = 428
    Top = 152
    poSQLINT64ToBCD = True
    object WorkReasonQueryID_WORK_REASON: TFIBIntegerField
      FieldName = 'ID_WORK_REASON'
      Visible = False
    end
    object WorkReasonQueryNAME_FULL: TFIBStringField
      DisplayLabel = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
      DisplayWidth = 100
      FieldName = 'NAME_FULL'
      Size = 255
      EmptyStrToNull = True
    end
    object WorkReasonQueryNAME_SHORT: TFIBStringField
      DisplayLabel = #1057#1082#1086#1088#1086#1095#1077#1085#1072' '#1085#1072#1079#1074#1072
      DisplayWidth = 100
      FieldName = 'NAME_SHORT'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object BonusQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    UpdateTransaction = LocalWriteTransaction
    DeleteSQL.Strings = (
      'execute procedure ASUP_DT_MAN_BONUS_DELETE(:id_man_bonus)')
    SelectSQL.Strings = (
      'select * from ASUP_DT_MAN_BONUS_SELECT(:id_order)')
    OnCalcFields = BonusQueryCalcFields
    Left = 396
    Top = 296
    poSQLINT64ToBCD = True
    object BonusQueryID_MAN_MOVING: TFIBIntegerField
      FieldName = 'ID_MAN_MOVING'
    end
    object BonusQueryID_MAN_BONUS: TFIBIntegerField
      FieldName = 'ID_MAN_BONUS'
    end
    object BonusQueryIS_PERCENT: TFIBStringField
      FieldName = 'IS_PERCENT'
      Size = 1
      EmptyStrToNull = True
    end
    object BonusQuerySUMMA: TFIBFloatField
      FieldName = 'SUMMA'
    end
    object BonusQueryDATE_BEG: TFIBDateField
      FieldName = 'DATE_BEG'
    end
    object BonusQueryDATE_END: TFIBDateField
      FieldName = 'DATE_END'
    end
    object BonusQueryID_RAISE: TFIBIntegerField
      FieldName = 'ID_RAISE'
    end
    object BonusQueryNOTE: TFIBStringField
      FieldName = 'NOTE'
      Size = 255
      EmptyStrToNull = True
    end
    object BonusQueryREASON: TFIBStringField
      FieldName = 'REASON'
      Size = 255
      EmptyStrToNull = True
    end
    object BonusQueryRAISE_NAME: TFIBStringField
      FieldName = 'RAISE_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object BonusQueryFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 255
      EmptyStrToNull = True
    end
    object BonusQueryWORK_PLACE: TFIBStringField
      FieldName = 'WORK_PLACE'
      Size = 512
      EmptyStrToNull = True
    end
    object BonusQueryID_PCARD: TFIBIntegerField
      FieldName = 'ID_PCARD'
    end
    object BonusQueryThe_Bonus: TStringField
      FieldKind = fkCalculated
      FieldName = 'THE_BONUS'
      Size = 255
      Calculated = True
    end
    object BonusQueryPERCENT: TFIBFloatField
      FieldName = 'PERCENT'
    end
    object BonusQueryORDER_BONUS_STR: TFIBStringField
      FieldName = 'ORDER_BONUS_STR'
      Size = 1024
      EmptyStrToNull = True
    end
    object BonusQueryRAISE_FULL_NAME: TFIBStringField
      FieldName = 'RAISE_FULL_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object BonusQuerySOVM_ID_DEPARTMENT: TFIBIntegerField
      FieldName = 'SOVM_ID_DEPARTMENT'
    end
    object BonusQuerySOVM_ID_POST_SALARY: TFIBIntegerField
      FieldName = 'SOVM_ID_POST_SALARY'
    end
    object BonusQuerySOVM_NAME_DEPARTMENT: TFIBStringField
      FieldName = 'SOVM_NAME_DEPARTMENT'
      Size = 512
      EmptyStrToNull = True
    end
    object BonusQuerySOVM_NAME_POST_SALARY: TFIBStringField
      FieldName = 'SOVM_NAME_POST_SALARY'
      Size = 4096
      EmptyStrToNull = True
    end
    object BonusQuerySMETA_NAME: TFIBStringField
      FieldName = 'SMETA_NAME'
      Size = 25
      EmptyStrToNull = True
    end
  end
  object BonusSource: TDataSource
    DataSet = BonusQuery
    Left = 420
    Top = 292
  end
  object ReformBonusQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalWriteTransaction
    InsertSQL.Strings = (
      'execute procedure ASUP_ORDERS_COPY_BONUSES(:Id_Man_Moving);')
    Left = 324
    Top = 236
    poSQLINT64ToBCD = True
  end
  object pFIBDS_CheckPermission: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      'select * from ASUP_ORDERS_CHECK_PERMISSION(:id_pcard,:id_order);')
    Left = 284
    Top = 444
    poSQLINT64ToBCD = True
    object pFIBDS_CheckPermissionNUM_PROJECT: TFIBStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087#1088#1086#1077#1082#1090#1091
      FieldName = 'NUM_PROJECT'
      Size = 255
      EmptyStrToNull = True
    end
    object pFIBDS_CheckPermissionDATE_ORDER: TFIBDateField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1077#1082#1090#1091
      FieldName = 'DATE_ORDER'
    end
    object pFIBDS_CheckPermissionOWNER_NAME: TFIBStringField
      DisplayLabel = #1042#1083#1072#1089#1085#1080#1082' '#1085#1072#1082#1072#1079#1091
      FieldName = 'OWNER_NAME'
      Size = 255
      EmptyStrToNull = True
    end
  end
end
