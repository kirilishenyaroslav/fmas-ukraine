object fmPremiaOrder: TfmPremiaOrder
  Left = 289
  Top = 164
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1053#1072#1076#1072#1085#1085#1103' '#1087#1088#1077#1084#1110#1081' '#1072#1073#1086' '#1084#1072#1090'. '#1076#1086#1087#1086#1084#1086#1075
  ClientHeight = 450
  ClientWidth = 542
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
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 542
    Height = 409
    Align = alTop
    TabOrder = 0
    DesignSize = (
      542
      409)
    object Fio: TqFSpravControl
      Left = 8
      Top = 33
      Width = 520
      Height = 21
      FieldName = 'ID_MAN'
      DisplayName = #1055#1030#1041
      Interval = 180
      Value = Null
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = True
      Enabled = True
      OnChange = FioChange
      Blocked = False
      TabOrder = 1
      AutoSaveToRegistry = False
      OnOpenSprav = FioOpenSprav
      DisplayText = ''
      DisplayTextField = 'FIO'
    end
    object WorkPlace: TqFSpravControl
      Left = 8
      Top = 65
      Width = 520
      Height = 21
      FieldName = 'ID_MAN_MOVING'
      DisplayName = #1052#1110#1089#1094#1077' '#1088#1086#1073#1086#1090#1080
      Interval = 180
      Value = Null
      LabelColor = clGreen
      Required = False
      Semicolon = True
      Asterisk = False
      Enabled = True
      Blocked = False
      TabOrder = 2
      AutoSaveToRegistry = False
      OnOpenSprav = WorkPlaceOpenSprav
      DisplayText = ''
      DisplayTextField = 'WORK_PLACE'
    end
    object IsPercentBox: TGroupBox
      Left = 8
      Top = 286
      Width = 521
      Height = 57
      Caption = #1055#1088#1086#1094#1077#1085#1090' '#1072#1073#1086' '#1089#1091#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object PeriodCheck: TqFSimpleCheck
        Left = DateBeg
        Top = 24
        Width = 52
        Height = 21
        LightControl = DateEnd
        Right = DateEnd
        ErrorMessage = #1050#1110#1085#1077#1094#1100' '#1087#1077#1088#1110#1086#1076#1091' '#1087#1086#1074#1080#1085#1077#1085' '#1073#1091#1090#1080' '#1085#1077' '#1084#1110#1085#1100#1096#1080#1084' '#1085#1110#1078' '#1087#1086#1095#1072#1090#1086#1082
      end
      object RadioButton1: TRadioButton
        Left = 16
        Top = 24
        Width = 113
        Height = 17
        Caption = #1055#1088#1086#1094#1077#1085#1090
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 288
        Top = 24
        Width = 113
        Height = 17
        Caption = #1057#1091#1084#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = RadioButton1Click
      end
      object Percent: TqFFloatControl
        Left = 136
        Top = 22
        Width = 97
        Height = 21
        FieldName = 'PERCENT'
        DisplayName = #1055#1088#1086#1094#1077#1085#1090
        Interval = 0
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = False
        Asterisk = False
        Enabled = True
        OnChange = PercentChange
        Blocked = False
        TabOrder = 2
        AutoSaveToRegistry = False
        MaxLength = 0
        NegativeAllowed = False
        Precision = 2
        Format = '#########0.00'
      end
      object Summa: TqFFloatControl
        Left = 408
        Top = 22
        Width = 97
        Height = 21
        FieldName = 'SUMMA'
        DisplayName = #1057#1091#1084#1072
        Interval = 0
        Value = Null
        LabelColor = clGreen
        Required = False
        Semicolon = False
        Asterisk = False
        Enabled = True
        Blocked = True
        TabOrder = 3
        AutoSaveToRegistry = False
        MaxLength = 0
        NegativeAllowed = False
        Precision = 2
        Format = '#########0.00'
      end
    end
    object Reason: TqFCharControl
      Left = 8
      Top = 381
      Width = 520
      Height = 21
      FieldName = 'REASON'
      DisplayName = #1055#1110#1076#1089#1090#1072#1074#1072
      Interval = 160
      Value = ''
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = True
      Enabled = True
      Blocked = False
      TabOrder = 7
      AutoSaveToRegistry = False
      MaxLength = 255
    end
    object IdType: TqFEnumControl
      Left = 8
      Top = 1
      Width = 521
      Height = 21
      FieldName = 'ID_TYPE'
      DisplayName = #1058#1080#1087
      Interval = 180
      Value = Null
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = True
      Enabled = True
      OnChange = IdTypeChange
      Blocked = False
      TabOrder = 0
      AutoSaveToRegistry = True
      Items.Strings = (
        #1055#1088#1077#1084#1110#1103
        #1052#1072#1090#1077#1088#1110#1072#1083#1100#1085#1072' '#1076#1086#1087#1086#1084#1086#1075#1072)
      ValuesString = '1,2'
    end
    object Note: TqFCharControl
      Left = 8
      Top = 349
      Width = 520
      Height = 21
      FieldName = 'NOTE'
      DisplayName = #1055#1088#1080#1095#1080#1085#1072
      Interval = 160
      Value = 
        #1091' '#1079#1074#39#1103#1079#1082#1091' '#1079'  '#1074#1110#1076#1087#1086#1074#1110#1076#1085#1086' '#1076#1086' '#1087'.  '#1055#1086#1083#1086#1078#1077#1085#1085#1103' "'#1055#1088#1086' '#1087#1086#1088#1103#1076#1086#1082' '#1110' '#1091#1084#1086#1074#1080' '#1085#1072 +
        #1076#1072#1085#1085#1103' '#1084#1072#1090#1077#1088#1110#1072#1083#1100#1085#1086#1111' '#1076#1086#1087#1086#1084#1086#1075#1080'"'
      LabelColor = clGreen
      Required = False
      Semicolon = True
      Asterisk = False
      Enabled = True
      Default = 
        #1091' '#1079#1074#39#1103#1079#1082#1091' '#1079'  '#1074#1110#1076#1087#1086#1074#1110#1076#1085#1086' '#1076#1086' '#1087'.  '#1055#1086#1083#1086#1078#1077#1085#1085#1103' "'#1055#1088#1086' '#1087#1086#1088#1103#1076#1086#1082' '#1110' '#1091#1084#1086#1074#1080' '#1085#1072 +
        #1076#1072#1085#1085#1103' '#1084#1072#1090#1077#1088#1110#1072#1083#1100#1085#1086#1111' '#1076#1086#1087#1086#1084#1086#1075#1080'"'
      Blocked = False
      TabOrder = 6
      AutoSaveToRegistry = False
      MaxLength = 255
    end
    object MPanel: TPanel
      Left = 0
      Top = 92
      Width = 545
      Height = 65
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 3
      object IsDepartment: TqFBoolControl
        Left = 16
        Top = 36
        Width = 169
        Height = 21
        FieldName = 'Is_Department'
        DisplayName = #1055#1110#1076#1088#1086#1079#1076#1110#1083
        Interval = 120
        Value = False
        LabelColor = clGreen
        Required = False
        Semicolon = False
        Asterisk = False
        Enabled = True
        OnChange = IsDepartmentChange
        Default = 'False'
        Blocked = False
        TabOrder = 1
        AutoSaveToRegistry = False
        StoreAs = StoreAs01
      end
      object Department: TqFSpravControl
        Left = 188
        Top = 36
        Width = 340
        Height = 21
        FieldName = 'ID_DEPARTMENT'
        DisplayName = #1055#1110#1076#1088#1086#1079#1076#1110#1083
        Interval = 0
        Value = Null
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = False
        Enabled = True
        OnChange = DepartmentChange
        Blocked = True
        TabOrder = 2
        AutoSaveToRegistry = False
        OnOpenSprav = DepartmentOpenSprav
        DisplayText = ''
        DisplayTextField = 'NAME_DEPARTMENTS'
      end
      object qFCharControl_Notes: TqFCharControl
        Left = 8
        Top = 4
        Width = 520
        Height = 21
        FieldName = 'NOTES'
        DisplayName = #1055#1088#1080#1084#1110#1090#1082#1072
        Interval = 180
        Value = ''
        LabelColor = clGreen
        Required = False
        Semicolon = True
        Asterisk = False
        Enabled = True
        Blocked = False
        TabOrder = 0
        AutoSaveToRegistry = False
        MaxLength = 255
      end
    end
    object PanelOther: TPanel
      Left = 0
      Top = 154
      Width = 537
      Height = 129
      BevelOuter = bvNone
      TabOrder = 4
      object IdRaise: TqFSpravControl
        Left = 8
        Top = 6
        Width = 520
        Height = 21
        FieldName = 'Id_Raise'
        DisplayName = #1055#1088#1077#1084#1110#1103' '#1072#1073#1086' '#1084#1072#1090'. '#1076#1086#1087#1086#1084#1086#1075#1072
        Interval = 180
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 0
        AutoSaveToRegistry = True
        OnOpenSprav = IdRaiseOpenSprav
        DisplayText = ''
        DisplayTextField = 'Raise_Name'
      end
      object Smeta: TqFSpravControl
        Left = 8
        Top = 38
        Width = 520
        Height = 21
        FieldName = 'Kod_Sm'
        DisplayName = '&'#1050#1086#1096#1090#1086#1088#1080#1089
        Interval = 180
        Value = Null
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = True
        Enabled = True
        Blocked = False
        TabOrder = 1
        AutoSaveToRegistry = True
        OnOpenSprav = SmetaOpenSprav
        DisplayText = ''
        DisplayTextField = 'Sm_Title'
      end
      object DateBeg: TqFDateControl
        Left = 8
        Top = 70
        Width = 289
        Height = 21
        FieldName = 'DATE_BEG'
        DisplayName = #1055#1077#1088#1110#1086#1076' '#1079
        Interval = 180
        Value = 38526
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = False
        Enabled = True
        Blocked = False
        TabOrder = 2
        AutoSaveToRegistry = False
      end
      object DateEnd: TqFDateControl
        Left = 8
        Top = 102
        Width = 289
        Height = 21
        FieldName = 'DATE_END'
        DisplayName = #1055#1077#1088#1110#1086#1076' '#1087#1086
        Interval = 180
        Value = 38526
        LabelColor = clGreen
        Required = True
        Semicolon = True
        Asterisk = False
        Enabled = True
        Blocked = False
        TabOrder = 3
        AutoSaveToRegistry = False
      end
    end
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 409
    Width = 542
    Height = 41
    Align = alTop
    TabOrder = 1
    object FormControl: TqFFormControl
      Left = 440
      Top = 12
      Width = 60
      Height = 21
      ControlsOwner = Owner
      InsertSQL.Strings = (
        'select *'
        'from ASUP_DT_MAN_PREMIA_INSERT ('
        '    :ID_MAN,'
        '    :ID_MAN_MOVING ,'
        '    :ID_DEPARTMENT,'
        '    :ID_RAISE ,'
        '    :PERCENT ,'
        '    :SUMMA ,'
        '    :DATE_BEG ,'
        '    :DATE_END ,'
        '    :REASON ,'
        '    :ID_TYPE ,'
        '    :KOD_SM,'
        '    :ID_ORDER_TYPE ,'
        '    :NUM_ITEM ,'
        '    :SUB_ITEM ,'
        '    :ID_ORDER_GROUP ,'
        '    :INTRO,'
        '    :NOTE,'
        '    :NOTES)')
      UpdateSQL.Strings = (
        'EXECUTE PROCEDURE ASUP_DT_MAN_PREMIA_UPDATE ('
        '    :where,'
        '    :ID_MAN,'
        '    :ID_MAN_MOVING,'
        '    :ID_DEPARTMENT,'
        '    :ID_RAISE,'
        '    :PERCENT,'
        '    :SUMMA,'
        '    :DATE_BEG,'
        '    :DATE_END,'
        '    :REASON,'
        '    :ID_TYPE,'
        '    :KOD_SM,'
        '    :NOTE,'
        '    :NOTES)')
      SelectSQL.Strings = (
        'SELECT * FROM ASUP_DT_MAN_PREMIA_SELECT(:where)')
      AddCaption = #1057#1090#1074#1086#1088#1077#1085#1085#1085#1103' '#1087#1088#1077#1084#1110#1111' ('#1084#1072#1090#1077#1088#1110#1072#1083#1100#1085#1086#1111' '#1076#1086#1087#1086#1084#1086#1075#1080')'
      ModifyCaption = #1056#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103' '#1087#1088#1077#1084#1110#1111' ('#1084#1072#1090#1077#1088#1110#1072#1083#1100#1085#1086#1111' '#1076#1086#1087#1086#1084#1086#1075#1080')'
      InfoCaption = #1055#1077#1088#1077#1075#1083#1103#1076' '#1087#1088#1077#1084#1110#1111' ('#1084#1072#1090#1077#1088#1110#1072#1083#1100#1085#1086#1111' '#1076#1086#1087#1086#1084#1086#1075#1080')'
      AfterPrepare = FormControlAfterPrepare
      NewRecordAfterPrepare = FormControlNewRecordAfterPrepare
      ModifyRecordAfterPrepare = FormControlModifyRecordAfterPrepare
      InfoRecordAfterPrepare = FormControlInfoRecordAfterPrepare
      AfterRecordAdded = FormControlAfterRecordAdded
      Mode = fmAdd
      CheckWhere = True
      CloseForm = True
    end
    object OkButton: TBitBtn
      Left = 152
      Top = 7
      Width = 97
      Height = 26
      Action = OkAction
      Caption = #1043#1072#1088#1072#1079#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
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
      Left = 304
      Top = 7
      Width = 97
      Height = 26
      Action = CancelAction
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
  end
  object KeyList: TActionList
    Left = 364
    Top = 7
    object OkAction: TAction
      Caption = #1043#1072#1088#1072#1079#1076
      ShortCut = 13
      SecondaryShortCuts.Strings = (
        'F10')
      OnExecute = OkActionExecute
    end
    object CancelAction: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1072
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
  end
  object LocalDatabase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
    DefaultTransaction = LocalReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 267
    Top = 8
  end
  object LocalReadTransaction: TpFIBTransaction
    DefaultDatabase = LocalDatabase
    TimeoutAction = TARollback
    Left = 299
    Top = 8
  end
  object LocalWriteTransaction: TpFIBTransaction
    DefaultDatabase = LocalDatabase
    TimeoutAction = TARollback
    Left = 331
    Top = 8
  end
  object WorkQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalWriteTransaction
    DeleteSQL.Strings = (
      'execute procedure DT_MAN_BONUS_SMET_DELETE_ALL(:id_order)')
    InsertSQL.Strings = (
      'EXECUTE PROCEDURE DT_MAN_BONUS_SMET_INSERT ('
      '    :ID_ORDER ,'
      '    :KOD_SM ,'
      '    :KOD_SM_PPS ,'
      '    :PERCENT ,'
      '    :SUMMA,'
      '    :SUMMA_PPS)')
    SelectSQL.Strings = (
      'select * from DT_MAN_BONUS_SMET_SELECT(:id_order)')
    Left = 396
    Top = 8
    poSQLINT64ToBCD = True
    object WorkQueryID_MAN_BONUS_SMET: TFIBIntegerField
      FieldName = 'ID_MAN_BONUS_SMET'
    end
    object WorkQueryID_MAN_BONUS: TFIBIntegerField
      FieldName = 'ID_MAN_BONUS'
    end
    object WorkQueryKOD_SM: TFIBIntegerField
      FieldName = 'KOD_SM'
    end
    object WorkQueryKOD_SM_PPS: TFIBIntegerField
      FieldName = 'KOD_SM_PPS'
    end
    object WorkQueryPERCENT: TFIBIntegerField
      FieldName = 'PERCENT'
    end
    object WorkQuerySUMMA: TFIBFloatField
      FieldName = 'SUMMA'
    end
    object WorkQuerySUMMA_PPS: TFIBFloatField
      FieldName = 'SUMMA_PPS'
    end
    object WorkQueryIS_PERCENT: TFIBStringField
      FieldName = 'IS_PERCENT'
      Size = 1
      EmptyStrToNull = True
    end
    object WorkQueryDATE_BEG: TFIBDateField
      FieldName = 'DATE_BEG'
    end
    object WorkQueryDATE_END: TFIBDateField
      FieldName = 'DATE_END'
    end
    object WorkQueryREAL_DATE_END: TFIBDateField
      FieldName = 'REAL_DATE_END'
    end
    object WorkQuerySMETA_TITLE: TFIBStringField
      FieldName = 'SMETA_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
    object WorkQuerySMETA_TITLE_PPS: TFIBStringField
      FieldName = 'SMETA_TITLE_PPS'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object SelectCurWorkPlace: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_GET_CUR_WORK_PLACE_2(:Cur_Date, :Id_Man)')
    Left = 397
    Top = 36
    poSQLINT64ToBCD = True
    object SelectCurWorkPlaceID_DEPARTMENT: TFIBIntegerField
      FieldName = 'ID_DEPARTMENT'
      Visible = False
    end
    object SelectCurWorkPlaceNAME_POST_SALARY: TFIBStringField
      DisplayLabel = #1055#1086#1089#1072#1076#1086#1074#1080#1081' '#1086#1082#1083#1072#1076
      DisplayWidth = 80
      FieldName = 'NAME_POST_SALARY'
      Size = 255
      EmptyStrToNull = True
    end
    object SelectCurWorkPlaceID_POST_SALARY: TFIBIntegerField
      FieldName = 'ID_POST_SALARY'
      Visible = False
    end
    object SelectCurWorkPlaceNAME_DEPARTMENT: TFIBStringField
      DisplayLabel = #1055#1110#1076#1088#1086#1079#1076#1110#1083
      DisplayWidth = 80
      FieldName = 'NAME_DEPARTMENT'
      Size = 255
      EmptyStrToNull = True
    end
    object SelectCurWorkPlaceID_MAN_MOVING: TFIBIntegerField
      FieldName = 'ID_MAN_MOVING'
      Visible = False
    end
    object SelectCurWorkPlaceDATE_BEG: TFIBDateField
      DisplayLabel = #1055#1086#1095#1072#1090#1086#1082
      DisplayWidth = 30
      FieldName = 'DATE_BEG'
    end
    object SelectCurWorkPlaceDATE_END: TFIBDateField
      DisplayWidth = 50
      FieldName = 'DATE_END'
      Visible = False
    end
    object SelectCurWorkPlaceREAL_DATE_END: TFIBDateField
      DisplayLabel = #1050#1110#1085#1077#1094#1100
      DisplayWidth = 30
      FieldName = 'REAL_DATE_END'
    end
    object SelectCurWorkPlaceWORK_REASON: TFIBStringField
      DisplayLabel = #1064#1090#1072#1090#1085#1080#1081'/'#1057#1091#1084#1110#1089#1085#1080#1082
      DisplayWidth = 55
      FieldName = 'WORK_REASON'
      Size = 255
      EmptyStrToNull = True
    end
    object SelectCurWorkPlaceNAME_SOVMEST: TFIBStringField
      FieldName = 'NAME_SOVMEST'
      Visible = False
      Size = 255
      EmptyStrToNull = True
    end
    object SelectCurWorkPlaceID_SOVMEST: TFIBIntegerField
      FieldName = 'ID_SOVMEST'
      Visible = False
    end
    object SelectCurWorkPlaceNAME_POST: TFIBStringField
      FieldName = 'NAME_POST'
      Visible = False
      Size = 255
      EmptyStrToNull = True
    end
    object SelectCurWorkPlaceKOL_STAVOK: TFIBFloatField
      DisplayLabel = #1057#1090#1072#1074#1086#1082
      DisplayWidth = 15
      FieldName = 'KOL_STAVOK'
      Precision = 3
    end
    object SelectCurWorkPlaceRMOVING: TFIBIntegerField
      FieldName = 'RMOVING'
      Visible = False
    end
  end
  object GetRaiseCalcType: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_BONUS_GET_CALC_TYPE(:Id_Raise, :Cur_Date)')
    Left = 429
    Top = 36
    poSQLINT64ToBCD = True
    object GetRaiseCalcTypeID_CALC_TYPE: TFIBIntegerField
      FieldName = 'ID_CALC_TYPE'
    end
    object GetRaiseCalcTypeCALC_TYPE_NAME: TFIBStringField
      FieldName = 'CALC_TYPE_NAME'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object SelectMovSmet: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_GET_CUR_MOV_SMET(:Id_Man_Moving, :Cur_Date)')
    Left = 461
    Top = 36
    poSQLINT64ToBCD = True
    object SelectMovSmetKOD_SM: TFIBIntegerField
      FieldName = 'KOD_SM'
    end
    object SelectMovSmetKOD_SM_PPS: TFIBIntegerField
      FieldName = 'KOD_SM_PPS'
    end
    object SelectMovSmetOKLAD_BASE: TFIBBCDField
      FieldName = 'OKLAD_BASE'
      Size = 2
      RoundByScale = True
    end
    object SelectMovSmetOKLAD_PPS: TFIBBCDField
      FieldName = 'OKLAD_PPS'
      Size = 2
      RoundByScale = True
    end
    object SelectMovSmetTITLE_SM: TFIBStringField
      FieldName = 'TITLE_SM'
      Size = 255
      EmptyStrToNull = True
    end
    object SelectMovSmetTITLE_SM_PPS: TFIBStringField
      FieldName = 'TITLE_SM_PPS'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object ShtatrasQuery: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM ASUP_ORDERS_SHTAT_SELECT(:ID_POST_SALARY, :ID_DEPARTMENT, :' +
        'CUR_DATE)')
    Left = 400
    Top = 64
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
  object DSPercent: TpFIBDataSet
    Database = LocalDatabase
    Transaction = LocalReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM ASUP_DT_MAN_PREMIA_PERCENT(:ID_MAN_MOVING,:CUR_DAT' +
        'E,:PERCENT) ')
    Left = 432
    Top = 64
    poSQLINT64ToBCD = True
    object DSPercentOKLAD: TFIBFloatField
      FieldName = 'OKLAD'
    end
  end
end
