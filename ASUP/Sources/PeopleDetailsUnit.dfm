object PeopleDetailsForm: TPeopleDetailsForm
  Left = 338
  Top = 148
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1092#1110#1079#1080#1095#1085#1080#1093' '#1086#1089#1110#1073': '#1044#1086#1082#1083#1072#1076#1085#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
  ClientHeight = 417
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D111
    11111DDDDDDD1119119111DDDDDD1191119911DDDDDD1191B19911222222D111
    3311122222223113333102222222113333310282222D113BBB33037322DD11BB
    BBB313333DDD1133BBB313BB33DD311133313BBB33DDD39111113BBBB3DDD311
    111333BB33DDDD7337D3333333DDDDDDDDD33B3333DDDDDDDDDD33333DDD0000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label18: TLabel
    Left = 40
    Top = 112
    Width = 38
    Height = 13
    Caption = 'Label18'
  end
  object DetailsPageControl: TPageControl
    Left = 24
    Top = 8
    Width = 489
    Height = 369
    ActivePage = MainPage
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = DetailsPageControlChange
    object MainPage: TTabSheet
      Hint = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      Caption = #1054#1089#1085#1086#1074#1085#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object Label4: TLabel
        Left = 8
        Top = 152
        Width = 35
        Height = 13
        Caption = #1057#1090#1072#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BirthPlaceLabel: TLabel
        Left = 128
        Top = 232
        Width = 82
        Height = 13
        Caption = '<'#1085#1077' '#1074#1080#1073#1088#1072#1085#1086'>'
      end
      object Label5: TLabel
        Left = 160
        Top = 152
        Width = 107
        Height = 13
        Caption = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 232
        Width = 111
        Height = 13
        Caption = #1052#1110#1089#1094#1077' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 208
        Width = 48
        Height = 13
        Caption = #1040#1076#1088#1077#1089#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object AdressLabel: TLabel
        Left = 128
        Top = 208
        Width = 82
        Height = 13
        Caption = '<'#1085#1077' '#1074#1080#1073#1088#1072#1085#1072'>'
      end
      object Label9: TLabel
        Left = 304
        Top = 152
        Width = 113
        Height = 13
        Caption = #1055#1086#1076#1072#1090#1082#1086#1074#1080#1081' '#1085#1086#1084#1077#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 8
        Top = 40
        Width = 58
        Height = 13
        Caption = #1055#1088#1110#1079#1074#1080#1097#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 160
        Top = 40
        Width = 24
        Height = 13
        Caption = #1030#1084#39#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 304
        Top = 40
        Width = 72
        Height = 13
        Caption = #1055#1086' '#1073#1072#1090#1100#1082#1086#1074#1110
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 8
        Top = 88
        Width = 57
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 160
        Top = 88
        Width = 26
        Height = 13
        Caption = #1048#1084#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 304
        Top = 88
        Width = 56
        Height = 13
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object FC_Familia: TFieldControl
        Left = 128
        Top = 56
        Width = 18
        Height = 18
        Control = FamiliaEdit
        ReadFromField = DetailsQueryFAMILIA
        Required = False
        Title = '"'#1055#1088#1110#1079#1074#1080#1097#1077'"'
        MaxLength = 20
        ExactLength = 0
        CapitalizeStyle = csName
      end
      object FC_Imya: TFieldControl
        Left = 280
        Top = 56
        Width = 18
        Height = 18
        Control = ImyaEdit
        ReadFromField = DetailsQueryIMYA
        Required = False
        Title = '"'#1030#1084#39#1103'"'
        MaxLength = 20
        ExactLength = 0
        CapitalizeStyle = csName
      end
      object FC_Otchestvo: TFieldControl
        Left = 448
        Top = 56
        Width = 18
        Height = 18
        Control = OtchestvoEdit
        ReadFromField = DetailsQueryOTCHESTVO
        Required = False
        Title = '"'#1055#1086' '#1073#1072#1090#1100#1082#1086#1074#1110'"'
        MaxLength = 20
        ExactLength = 0
        CapitalizeStyle = csName
      end
      object FC_RusFamilia: TFieldControl
        Left = 128
        Top = 104
        Width = 18
        Height = 18
        Control = RusFamiliaEdit
        ReadFromField = DetailsQueryRUS_FAMILIA
        Title = '"'#1060#1072#1084#1080#1083#1080#1103'"'
        MaxLength = 20
        ExactLength = 0
        CapitalizeStyle = csName
      end
      object FC_RusImya: TFieldControl
        Left = 280
        Top = 104
        Width = 18
        Height = 18
        Control = RusImyaEdit
        ReadFromField = DetailsQueryRUS_IMYA
        Title = '"'#1048#1084#1103'"'
        MaxLength = 20
        ExactLength = 0
        CapitalizeStyle = csName
      end
      object FC_RusOtchestvo: TFieldControl
        Left = 448
        Top = 104
        Width = 18
        Height = 18
        Control = RusOtchestvoEdit
        ReadFromField = DetailsQueryRUS_OTCHESTVO
        Title = '"'#1054#1090#1095#1077#1089#1090#1074#1086'"'
        MaxLength = 20
        ExactLength = 0
        CapitalizeStyle = csName
      end
      object FC_Sex: TFieldControl
        Left = 128
        Top = 168
        Width = 18
        Height = 18
        Control = SexBox
        ReadFromField = DetailsQueryID_SEX
        Title = '"'#1057#1090#1072#1090#1100'"'
        MaxLength = 0
        ExactLength = 0
        CapitalizeStyle = csNone
      end
      object FC_BirthDate: TFieldControl
        Left = 280
        Top = 168
        Width = 18
        Height = 18
        Control = BirthDatePicker
        ReadFromField = DetailsQueryBIRTH_DATE
        Title = '"'#1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103'"'
        MaxLength = 0
        ExactLength = 0
        CapitalizeStyle = csNone
      end
      object FC_Tin: TFieldControl
        Left = 448
        Top = 168
        Width = 18
        Height = 18
        Control = TinEdit
        ReadFromField = DetailsQueryTIN
        Required = False
        Title = '"'#1055#1086#1076#1072#1090#1082#1086#1074#1080#1081' '#1085#1086#1084#1077#1088'"'
        MaxLength = 10
        ExactLength = 10
        CapitalizeStyle = csNone
      end
      object FC_Adress: TFieldControl
        Left = 400
        Top = 208
        Width = 18
        Height = 18
        ReadFromField = DetailsQueryID_ADRESS
        Required = False
        NotNull = True
        Title = '"'#1040#1076#1088#1077#1089#1072'"'
        MaxLength = 0
        ExactLength = 0
        CapitalizeStyle = csNone
        Value = Null
      end
      object FC_Birth_Place: TFieldControl
        Left = 400
        Top = 232
        Width = 18
        Height = 18
        ReadFromField = DetailsQueryID_BIRTH_PLACE
        Required = False
        NotNull = True
        Title = '"'#1052#1110#1089#1094#1077' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103'"'
        MaxLength = 0
        ExactLength = 0
        CapitalizeStyle = csNone
      end
      object BirthButton: TButton
        Left = 424
        Top = 208
        Width = 25
        Height = 17
        Caption = '...'
        TabOrder = 11
        OnClick = BirthButtonClick
      end
      object AdressButton: TButton
        Left = 424
        Top = 232
        Width = 25
        Height = 17
        Caption = '...'
        TabOrder = 12
        OnClick = AdressButtonClick
      end
      object FamiliaEdit: TCheckEdit
        Left = 8
        Top = 56
        Width = 121
        Height = 21
        MaxLength = 20
        TabOrder = 2
        OnMouseDown = EditMouseDown
        InputSet = isName
      end
      object ImyaEdit: TCheckEdit
        Left = 160
        Top = 56
        Width = 121
        Height = 21
        MaxLength = 20
        TabOrder = 3
        OnMouseDown = EditMouseDown
        InputSet = isName
      end
      object OtchestvoEdit: TCheckEdit
        Left = 304
        Top = 56
        Width = 145
        Height = 21
        MaxLength = 20
        TabOrder = 4
        OnMouseDown = EditMouseDown
        InputSet = isName
      end
      object TinEdit: TCheckEdit
        Left = 304
        Top = 168
        Width = 145
        Height = 21
        MaxLength = 10
        TabOrder = 10
        InputSet = isDigits
      end
      object RusImyaEdit: TCheckEdit
        Left = 160
        Top = 104
        Width = 121
        Height = 21
        MaxLength = 20
        TabOrder = 6
        OnMouseDown = EditMouseDown
        InputSet = isName
      end
      object RusOtchestvoEdit: TCheckEdit
        Left = 304
        Top = 104
        Width = 145
        Height = 21
        MaxLength = 20
        TabOrder = 7
        OnMouseDown = EditMouseDown
        InputSet = isName
      end
      object RusFamiliaEdit: TCheckEdit
        Left = 8
        Top = 104
        Width = 121
        Height = 21
        MaxLength = 20
        TabOrder = 5
        OnMouseDown = EditMouseDown
        InputSet = isName
      end
      object SexBox: TDBLookupComboBox
        Left = 8
        Top = 168
        Width = 121
        Height = 21
        KeyField = 'ID_SEX'
        ListField = 'FULL_NAME'
        ListSource = SexSource
        TabOrder = 8
        OnEnter = SexBoxEnter
      end
      object BirthDatePicker: TDateTimePicker
        Left = 160
        Top = 168
        Width = 121
        Height = 21
        Date = 37697.935604282400000000
        Time = 37697.935604282400000000
        TabOrder = 9
      end
      object Employee: TRadioButton
        Left = 8
        Top = 16
        Width = 113
        Height = 17
        Caption = #1057#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object Another: TRadioButton
        Left = 152
        Top = 16
        Width = 113
        Height = 17
        Caption = #1030#1085#1096#1072' '#1092#1110#1079'. '#1086#1089#1086#1073#1072
        TabOrder = 1
      end
    end
    object PassPage: TTabSheet
      Caption = #1055#1072#1089#1087#1086#1088#1090#1085#1110' '#1076#1072#1085#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ImageIndex = 1
      ParentFont = False
      OnEnter = PassPageEnter
      object Label11: TLabel
        Left = 8
        Top = 40
        Width = 58
        Height = 13
        Caption = #1055#1088#1110#1079#1074#1080#1097#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 160
        Top = 40
        Width = 24
        Height = 13
        Caption = #1030#1084#39#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 304
        Top = 40
        Width = 72
        Height = 13
        Caption = #1055#1086' '#1073#1072#1090#1100#1082#1086#1074#1110
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 8
        Top = 144
        Width = 33
        Height = 13
        Caption = #1057#1077#1088#1110#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 160
        Top = 144
        Width = 40
        Height = 13
        Caption = #1053#1086#1084#1077#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 8
        Top = 216
        Width = 72
        Height = 13
        Caption = #1044#1072#1090#1072' '#1074#1080#1076#1072#1095#1110
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 136
        Top = 216
        Width = 78
        Height = 13
        Caption = #1050#1080#1084' '#1074#1080#1076#1072#1085#1080#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object VoidLabel: TLabel
        Left = 296
        Top = 0
        Width = 105
        Height = 13
        Caption = #1055#1072#1089#1087#1086#1088#1090' '#1085#1077#1076#1110#1081#1089#1085#1080#1081' '#1079
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object DateEndLabel: TLabel
        Left = 408
        Top = 0
        Width = 65
        Height = 13
        AutoSize = False
      end
      object Label22: TLabel
        Left = 8
        Top = 88
        Width = 57
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label23: TLabel
        Left = 160
        Top = 88
        Width = 26
        Height = 13
        Caption = #1048#1084#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label24: TLabel
        Left = 304
        Top = 88
        Width = 56
        Height = 13
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object FC_PassFamilia: TFieldControl
        Left = 128
        Top = 56
        Width = 18
        Height = 18
        Control = PassFamiliaEdit
        ReadFromField = PassQueryFAMILIA
        Title = '"'#1055#1088#1110#1079#1074#1080#1097#1077'"'
        MaxLength = 20
        ExactLength = 0
        CapitalizeStyle = csName
      end
      object FC_PassRusFamilia: TFieldControl
        Left = 128
        Top = 104
        Width = 18
        Height = 18
        Control = PassRusFamiliaEdit
        ReadFromField = PassQueryRUS_FAMILIA
        Required = False
        Title = '"'#1060#1072#1084#1080#1083#1080#1103'"'
        MaxLength = 20
        ExactLength = 0
        CapitalizeStyle = csName
      end
      object FC_PassImya: TFieldControl
        Left = 280
        Top = 56
        Width = 18
        Height = 18
        Control = PassImyaEdit
        ReadFromField = PassQueryIMYA
        Required = False
        Title = '"'#1030#1084#39#1103'"'
        MaxLength = 20
        ExactLength = 0
        CapitalizeStyle = csName
      end
      object FC_PassRusImya: TFieldControl
        Left = 280
        Top = 104
        Width = 18
        Height = 18
        Control = PassRusImyaEdit
        ReadFromField = PassQueryRUS_IMYA
        Required = False
        Title = '"'#1048#1084#1103'"'
        MaxLength = 20
        ExactLength = 0
        CapitalizeStyle = csName
      end
      object FC_PassOtchestvo: TFieldControl
        Left = 448
        Top = 56
        Width = 18
        Height = 18
        Control = PassOtchestvoEdit
        ReadFromField = PassQueryOTCHESTVO
        Required = False
        Title = '"'#1055#1086' '#1073#1072#1090#1100#1082#1086#1074#1110'"'
        MaxLength = 20
        ExactLength = 0
        CapitalizeStyle = csName
      end
      object FC_PassRusOtchestvo: TFieldControl
        Left = 448
        Top = 104
        Width = 18
        Height = 18
        Control = PassRusOtchestvoEdit
        ReadFromField = PassQueryRUS_OTCHESTVO
        Required = False
        Title = '"'#1054#1090#1095#1077#1089#1090#1074#1086'"'
        MaxLength = 20
        ExactLength = 0
        CapitalizeStyle = csName
      end
      object FC_Seria: TFieldControl
        Left = 104
        Top = 160
        Width = 18
        Height = 18
        Control = SeriaEdit
        ReadFromField = PassQuerySERIA
        Title = '"'#1057#1077#1088#1110#1103'"'
        MaxLength = 8
        ExactLength = 0
        CapitalizeStyle = csNone
      end
      object FC_Number: TFieldControl
        Left = 240
        Top = 160
        Width = 18
        Height = 18
        Control = NumberEdit
        ReadFromField = PassQueryNUMBER
        Title = '"'#1053#1086#1084#1077#1088'"'
        MaxLength = 7
        ExactLength = 0
        CapitalizeStyle = csNone
      end
      object FC_DateBeg: TFieldControl
        Left = 120
        Top = 232
        Width = 18
        Height = 18
        Control = DateBegPicker
        ReadFromField = PassQueryDATE_BEG
        Title = '"'#1044#1072#1090#1072' '#1074#1080#1076#1072#1095#1110'"'
        MaxLength = 0
        ExactLength = 0
        CapitalizeStyle = csNone
      end
      object FC_Vidan: TFieldControl
        Left = 456
        Top = 232
        Width = 18
        Height = 18
        Control = VidanEdit
        ReadFromField = PassQueryVIDAN
        Title = '"'#1050#1080#1084' '#1074#1080#1076#1072#1085#1080#1081'"'
        MaxLength = 100
        ExactLength = 0
        CapitalizeStyle = csNone
      end
      object TotalPassLabel: TLabel
        Left = 296
        Top = 16
        Width = 92
        Height = 13
        Caption = #1059#1089#1100#1086#1075#1086' '#1087#1072#1089#1087#1086#1088#1090#1110#1074':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object NumPassLabel: TLabel
        Left = 408
        Top = 16
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SelectVidanButton: TSpeedButton
        Left = 456
        Top = 232
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SelectVidanButtonClick
      end
      object PrevPassButton: TBitBtn
        Left = 8
        Top = 280
        Width = 105
        Height = 28
        Caption = #1055#1086#1087#1077#1088#1077#1076#1085#1110#1081
        TabOrder = 10
        OnClick = PrevPassButtonClick
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
          31694731694731694731694731694731694731694731694731FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF808080808080808080808080808080808080808080
          8080808080808080808080808080808080808080808080808080808080808080
          80FF00FFFF00FFFF00FFFF00FFFF00FFD08000F8C898F7A17498300098300098
          3000983000983000983000983000983000983000983000983000983000983000
          983000983000983000694731FF00FFFF00FFFF00FFFF00FF9F9F9FDCDCDCC8C8
          C86A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A
          6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFF7A579F7A174F79C6DF69868F69463F6905EF58C58F58853F583
          4CF47E47F47A41F4763BF47236F46D30F46B2DF46B2D983000694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFC9C9C9C8C8C8C4C4C4C2C2C2BFBFBFBCBCBC
          B9B9B9B6B6B6B4B4B4B0B0B0ADADADAAAAAAA7A7A7A4A4A4A2A2A2A2A2A26A6A
          6A808080FF00FFFF00FFFF00FFFF00FFD08000FFFFFFF8A97EF7A579F7A073F7
          9C6DF69868F69464F6905EF68C59F58752E2723DB24714C55520F4773CF47236
          F46E30F46B2D983000694731FF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFCCCC
          CCC9C9C9C7C7C7C4C4C4C2C2C2BFBFBFBCBCBCBABABAB6B6B6A7A7A78282828F
          8F8FABABABA7A7A7A4A4A4A2A2A26A6A6A808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFF8AF85F8AB80F7A67AF7A174F79D6FF79969F69564F6915FE37A
          47FFFFFFFFFFFFB34715F47B43F4783DF47337F46E31983000694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFD0D0D0CDCDCDCACACAC8C8C8C5C5C5C2C2C2
          C0C0C0BCBCBCACACACFFFFFFFFFFFF828282ADADADABABABA8A8A8A4A4A46A6A
          6A808080FF00FFFF00FFFF00FFFF00FFD08000FFFFFFF9B38AF8AF85F8AA7FF7
          A67AF7A275F79D6FF6996AE38150FFFFFFFFFFFFFFFFFFB34816F58049F47C44
          F4773DF47337983000694731FF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFD2D2
          D2D0D0D0CCCCCCCACACAC8C8C8C5C5C5C2C2C2B1B1B1FFFFFFFFFFFFFFFFFF83
          8383B1B1B1AEAEAEABABABA8A8A86A6A6A808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFF9B890F9B48BF8AF85F8AA7FF7A67AF7A275E48758FFFFFFFFFF
          FFFFFFFFFFFFFFB34918F5854FF58149F47C43F4773D983000694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFD5D5D5D2D2D2D0D0D0CCCCCCCACACAC8C8C8
          B5B5B5FFFFFFFFFFFFFFFFFFFFFFFF848484B5B5B5B2B2B2AEAEAEABABAB6A6A
          6A808080FF00FFFF00FFFF00FFFF00FFD08000FFFFFFF9BD96F9B891F8B38BF8
          AF85F8AB80E48F62FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB34B1AF58955F5854F
          F48049F47C43983000694731FF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFD8D8
          D8D5D5D5D2D2D2D0D0D0CDCDCDBBBBBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86
          8686B8B8B8B5B5B5B1B1B1AEAEAE6A6A6A808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFFAC09BF9BD96F9B890F9B48BE4966BFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFB34C1CF58E5BF58A56F5854EF48049983000694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFDADADAD8D8D8D5D5D5D2D2D2C0C0C0FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF878787BBBBBBB8B8B8B4B4B4B1B1B16A6A
          6A808080FF00FFFF00FFFF00FFFF00FFD08000FFFFFFFAC29EFAC09BF9BC96E5
          9C73FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB34D1DF69261F68E5C
          F58955F5854F983000694731FF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFDBDB
          DBDADADAD7D7D7C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88
          8888BDBDBDBCBCBCB8B8B8B5B5B56A6A6A808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFFBC39FFBC29EFAC09CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFB34E1FF69766F69362F68F5CF58A56983000694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFDCDCDCDBDBDBDADADAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF898989C1C1C1BEBEBEBCBCBCB8B8B86A6A
          6A808080FF00FFFF00FFFF00FFFF00FFD08000FFFFFFFBC39FFBC39FFAC29EFA
          C09CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB35021F79B6CF69767
          F69361F68F5C983000694731FF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFDCDC
          DCDCDCDCDBDBDBDADADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A
          8A8AC3C3C3C1C1C1BEBEBEBCBCBC6A6A6A808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFFBC39FFBC39FFBC29EFAC29EFAC09CFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFB35122F79F72F79B6CF69767F69362983000694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFDCDCDCDCDCDCDBDBDBDBDBDBDADADAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B8B8BC6C6C6C3C3C3C1C1C1BEBEBE6A6A
          6A808080FF00FFFF00FFFF00FFFF00FFD08000FFFFFFFBC39FFBC39FFBC39FFB
          C29EFAC29EFAC19CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB35324F7A478F7A072
          F79B6CF69767983000694731FF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFDCDC
          DCDCDCDCDCDCDCDBDBDBDBDBDBDADADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C
          8C8CC9C9C9C6C6C6C3C3C3C1C1C16A6A6A808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFFBC39FFBC39FFBC39FFBC39FFBC39FFAC29EFAC19DFFFFFFFFFF
          FFFFFFFFFFFFFFB35426F8A97EF7A578F7A072F79C6D983000694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDBDBDB
          DADADAFFFFFFFFFFFFFFFFFFFFFFFF8D8D8DCCCCCCC9C9C9C6C6C6C4C4C46A6A
          6A808080FF00FFFF00FFFF00FFFF00FFD08000FFFFFFFBC39FFBC39FFBC39FFB
          C39FFBC39FFBC39FFAC29EFAC19DFFFFFFFFFFFFFFFFFFB35527F8AD83F8A97E
          F7A478F7A072983000694731FF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDBDBDBDADADAFFFFFFFFFFFFFFFFFF8E
          8E8ECFCFCFCCCCCCC9C9C9C6C6C66A6A6A808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFFBC39FFBC39FFBC39FFBC39FFBC39FFBC39FFBC39FFBC39FFAC1
          9DFFFFFFFFFFFFE59B72F9B28AF8AF84F8AA7EF7A579983000694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDADADAFFFFFFFFFFFFC3C3C3D2D2D2CFCFCFCCCCCCC9C9C96A6A
          6A808080FF00FFFF00FFFF00FFFF00FFD08000FFFFFFFBC39FFBC39FFBC39FFB
          C39FFBC39FFBC39FFBC39FFBC39FFBC29EFAC19DFABF99F9BB94F9B78FF9B38A
          F8AE84F8AA7FF8A77B694731FF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDBDBDBDADADADADADAD7
          D7D7D5D5D5D2D2D2CFCFCFCCCCCCCBCBCB808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C898694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDC
          DC808080FF00FFFF00FFFF00FFFF00FFFF00FFD08000D08000D08000D08000D0
          8000D08000D08000D08000D08000D08000D08000D08000D08000D08000D08000
          D08000D08000D08000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9F9F9F
          9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F
          9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        NumGlyphs = 2
      end
      object NextPassButton: TBitBtn
        Left = 352
        Top = 280
        Width = 105
        Height = 28
        Caption = #1053#1072#1089#1090#1091#1087#1085#1080#1081
        TabOrder = 13
        OnClick = NextPassButtonClick
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
          31694731694731694731694731694731694731694731694731FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF808080808080808080808080808080808080808080
          8080808080808080808080808080808080808080808080808080808080808080
          80FF00FFFF00FFFF00FFFF00FFFF00FFD08000F8C898F7A17498300098300098
          3000983000983000983000983000983000983000983000983000983000983000
          983000983000983000694731FF00FFFF00FFFF00FFFF00FF9F9F9FDCDCDCC8C8
          C86A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A
          6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFF7A579F7A174F79C6DF69868F69463F6905EF58C58F58853F583
          4CF47E47F47A41F4763BF47236F46D30F46B2DF46B2D983000694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFC9C9C9C8C8C8C4C4C4C2C2C2BFBFBFBCBCBC
          B9B9B9B6B6B6B4B4B4B0B0B0ADADADAAAAAAA7A7A7A4A4A4A2A2A2A2A2A26A6A
          6A808080FF00FFFF00FFFF00FFFF00FFD08000FFFFFFF8A97EF7A579F7A073F7
          9C6DE38353B34D1DC65F2EF68C59F58752F5834CF47F47F47B41F4773CF47236
          F46E30F46B2D983000694731FF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFCCCC
          CCC9C9C9C7C7C7C4C4C4B3B3B3888888989898BABABAB6B6B6B4B4B4B1B1B1AD
          ADADABABABA7A7A7A4A4A4A2A2A26A6A6A808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFF8AF85F8AB80F7A67AF7A174FFFFFFFFFFFFA03808C6602FF68D
          59F58853F5844DF58048F47B43F4783DF47337F46E31983000694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFD0D0D0CDCDCDCACACAC8C8C8FFFFFFFFFFFF
          737373999999BABABAB6B6B6B4B4B4B1B1B1ADADADABABABA8A8A8A4A4A46A6A
          6A808080FF00FFFF00FFFF00FFFF00FFD08000FFFFFFF9B38AF8AF85F8AA7FF7
          A67AFFFFFFFFFFFFFFFFFFA03808C6602FF58D5AF58954F5844EF58049F47C44
          F4773DF47337983000694731FF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFD2D2
          D2D0D0D0CCCCCCCACACAFFFFFFFFFFFFFFFFFF737373999999BABABAB7B7B7B4
          B4B4B1B1B1AEAEAEABABABA8A8A86A6A6A808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFF9B890F9B48BF8AF85F8AA7FFFFFFFFFFFFFFFFFFFFFFFFFA038
          08C6602FF58D5AF58954F5854FF58149F47C43F4773D983000694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFD5D5D5D2D2D2D0D0D0CCCCCCFFFFFFFFFFFF
          FFFFFFFFFFFF737373999999BABABAB7B7B7B5B5B5B2B2B2AEAEAEABABAB6A6A
          6A808080FF00FFFF00FFFF00FFFF00FFD08000FFFFFFF9BD96F9B891F8B38BF8
          AF85FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA03808C6602FF58D5AF58955F5854F
          F48049F47C43983000694731FF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFD8D8
          D8D5D5D5D2D2D2D0D0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF737373999999BA
          BABAB8B8B8B5B5B5B1B1B1AEAEAE6A6A6A808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFFAC09BF9BD96F9B890F9B48BFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFA03808C66030F58E5BF58A56F5854EF48049983000694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFDADADAD8D8D8D5D5D5D2D2D2FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF737373999999BBBBBBB8B8B8B4B4B4B1B1B16A6A
          6A808080FF00FFFF00FFFF00FFFF00FFD08000FFFFFFFAC29EFAC09BF9BC96F9
          B890FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA03808C66030F68E5C
          F58955F5854F983000694731FF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFDBDB
          DBDADADAD7D7D7D5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF73
          7373999999BCBCBCB8B8B8B5B5B56A6A6A808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFFBC39FFBC29EFAC09CFABE98FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE38251F69362F68F5CF58A56983000694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFDCDCDCDBDBDBDADADAD9D9D9FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2BEBEBEBCBCBCB8B8B86A6A
          6A808080FF00FFFF00FFFF00FFFF00FFD08000FFFFFFFBC39FFBC39FFAC29EFA
          C09CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4885BF79B6CF69767
          F69361F68F5C983000694731FF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFDCDC
          DCDCDCDCDBDBDBDADADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6
          B6B6C3C3C3C1C1C1BEBEBEBCBCBC6A6A6A808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFFBC39FFBC39FFBC29EFAC29EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFE49064F7A477F79F72F79B6CF69767F69362983000694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFDCDCDCDCDCDCDBDBDBDBDBDBFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFBCBCBCC9C9C9C6C6C6C3C3C3C1C1C1BEBEBE6A6A
          6A808080FF00FFFF00FFFF00FFFF00FFD08000FFFFFFFBC39FFBC39FFBC39FFB
          C29EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4976CF8AD82F8A97DF7A478F7A072
          F79B6CF69767983000694731FF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFDCDC
          DCDCDCDCDCDCDCDBDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0CFCFCFCC
          CCCCC9C9C9C6C6C6C3C3C3C1C1C16A6A6A808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFFBC39FFBC39FFBC39FFBC39FFFFFFFFFFFFFFFFFFFFFFFFFE59E
          75F9B68EF8B288F8AD83F8A97EF7A578F7A072F79C6D983000694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF
          FFFFFFFFFFFFC5C5C5D4D4D4D2D2D2CFCFCFCCCCCCC9C9C9C6C6C6C4C4C46A6A
          6A808080FF00FFFF00FFFF00FFFF00FFD08000FFFFFFFBC39FFBC39FFBC39FFB
          C39FFFFFFFFFFFFFFFFFFFE6A37DF9BE98F9BA93F9B68EF8B288F8AD83F8A97E
          F7A478F7A072983000694731FF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFDCDC
          DCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFFFFFFFFC8C8C8D9D9D9D6D6D6D4D4D4D2
          D2D2CFCFCFCCCCCCC9C9C9C6C6C66A6A6A808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFFBC39FFBC39FFBC39FFBC39FFFFFFFFFFFFFE7A57FFBC39FFAC1
          9DFABF9AF9BB94F9B78FF9B28AF8AF84F8AA7EF7A579983000694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFDCDCDCDCDCDCDCDCDCDCDCDCFFFFFFFFFFFF
          C9C9C9DCDCDCDADADADADADAD7D7D7D5D5D5D2D2D2CFCFCFCCCCCCC9C9C96A6A
          6A808080FF00FFFF00FFFF00FFFF00FFD08000FFFFFFFBC39FFBC39FFBC39FFB
          C39FFBC39FFBC39FFBC39FFBC39FFBC29EFAC19DFABF99F9BB94F9B78FF9B38A
          F8AE84F8AA7FF8A77B694731FF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDBDBDBDADADADADADAD7
          D7D7D5D5D5D2D2D2CFCFCFCCCCCCCBCBCB808080FF00FFFF00FFFF00FFFF00FF
          D08000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C898694731FF00FFFF
          00FFFF00FFFF00FF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDC
          DC808080FF00FFFF00FFFF00FFFF00FFFF00FFD08000D08000D08000D08000D0
          8000D08000D08000D08000D08000D08000D08000D08000D08000D08000D08000
          D08000D08000D08000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9F9F9F
          9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F
          9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Layout = blGlyphRight
        NumGlyphs = 2
      end
      object NewPassButton: TBitBtn
        Left = 128
        Top = 272
        Width = 57
        Height = 57
        Caption = #1053#1086#1074#1080#1081
        TabOrder = 12
        OnClick = NewPassButtonClick
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
          76808080FF00FFFF00FFFF00FFFF00FF009000FFFFFF45C46441C15E3BBE5737
          BB5032B84A2EB5432AB23D25AF361FAC2E1BA92716A62011A2190CA012089D0C
          029904009800006000694731FF00FFFF00FFFF00FFFF00FF929292FFFFFFC4C4
          C4C2C2C2BFBFBFBCBCBCB9B9B9B6B6B6B4B4B4B1B1B1ADADADAAAAAAA7A7A7A3
          A3A39F9F9F9D9D9D999999979797767676808080FF00FFFF00FFFF00FFFF00FF
          009000FFFFFF4CC86E46C56641C15E3CBE5838BB5233B84B2FB6442BB33E26B0
          3720AC2F1BA92817A62112A31A0DA013089D0C039905006000694731FF00FFFF
          00FFFF00FFFF00FF929292FFFFFFC8C8C8C5C5C5C2C2C2BFBFBFBCBCBCB9B9B9
          B7B7B7B4B4B4B1B1B1ADADADAAAAAAA7A7A7A4A4A49F9F9F9D9D9D9999997676
          76808080FF00FFFF00FFFF00FFFF00FF009000FFFFFF51CB754CC86E39B05213
          7C1C127B1A107B180F7A160E79140D78120B771009760E08750C07740A057308
          067F09089D0C006000694731FF00FFFF00FFFF00FFFF00FF929292FFFFFFCBCB
          CBC8C8C8B8B8B89090908F8F8F8E8E8E8D8D8D8B8B8B8A8A8A8A8A8A88888887
          87878686868585858B8B8B9D9D9D767676808080FF00FFFF00FFFF00FFFF00FF
          009000FFFFFF55CE7B51CB75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0673080EA115006000694731FF00FFFF
          00FFFF00FFFF00FF929292FFFFFFCDCDCDCBCBCBFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF858585A1A1A17676
          76808080FF00FFFF00FFFF00FFFF00FF009000FFFFFF57CF7F55CE7BFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          07740A14A41C006000694731FF00FFFF00FFFF00FFFF00FF929292FFFFFFCFCF
          CFCDCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF868686A4A4A4767676808080FF00FFFF00FFFF00FFFF00FF
          009000FFFFFF58D08057CF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF179B2118A723006000694731FF00FFFF
          00FFFF00FFFF00FF929292FFFFFFCFCFCFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1A1A1A8A8A87676
          76808080FF00FFFF00FFFF00FFFF00FF009000FFFFFF58D08058D08057CF7FFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1FA02D
          21AD311DAA2A006000694731FF00FFFF00FFFF00FFFF00FF929292FFFFFFCFCF
          CFCFCFCFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFA7A7A7AEAEAEABABAB767676808080FF00FFFF00FFFF00FFFF00FF
          009000FFFFFF58D08058D08058D08058D080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF27A5392DB44128B13A22AD32006000694731FF00FFFF
          00FFFF00FFFF00FF929292FFFFFFCFCFCFCFCFCFCFCFCFCFCFCFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACACACB5B5B5B2B2B2AEAEAE7676
          76808080FF00FFFF00FFFF00FFFF00FF009000FFFFFF58D08058D08058D08058
          D08058D080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FAB4537BB5032B84A
          2DB54229B13B006000694731FF00FFFF00FFFF00FFFF00FF929292FFFFFFCFCF
          CFCFCFCFCFCFCFCFCFCFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2
          B2B2BCBCBCB9B9B9B5B5B5B3B3B3767676808080FF00FFFF00FFFF00FFFF00FF
          009000FFFFFF58D08058D08058D08058D08058D08058D080FFFFFFFFFFFFFFFF
          FFFFFFFF37AF5040C05D3BBE5737BB5032B7492DB543006000694731FF00FFFF
          00FFFF00FFFF00FF929292FFFFFFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
          FFFFFFFFFFFFFFFFFFFFFFFFB6B6B6C1C1C1BFBFBFBCBCBCB9B9B9B6B6B67676
          76808080FF00FFFF00FFFF00FFFF00FF009000FFFFFF58D08058D08058D08058
          D08058D08058D08058D080FFFFFFFFFFFF3EB45949C66A45C36440C05D3BBE57
          36BA5032B749006000694731FF00FFFF00FFFF00FFFF00FF929292FFFFFFCFCF
          CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFFFFFFFFFFFFFBCBCBCC6C6C6C4
          C4C4C1C1C1BFBFBFBCBCBCB9B9B9767676808080FF00FFFF00FFFF00FFFF00FF
          009000FFFFFF58D08058D08058D08058D08058D08058D08058D08058D08056CF
          7D52CC774EC97049C66A45C36440C05D3BBD5636BA50006000694731FF00FFFF
          00FFFF00FFFF00FF929292FFFFFFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
          CFCFCFCFCFCFCECECECCCCCCC9C9C9C6C6C6C4C4C4C1C1C1BEBEBEBCBCBC7676
          76808080FF00FFFF00FFFF00FFFF00FF009000FFFFFF58D08058D08058D08058
          D08058D08058D08058D08058D08057CF7F56CF7D52CC774EC97049C66A45C364
          3FC05C3BBD56006000694731FF00FFFF00FFFF00FFFF00FF929292FFFFFFCFCF
          CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCECECECCCCCCC9
          C9C9C6C6C6C4C4C4C1C1C1BEBEBE767676808080FF00FFFF00FFFF00FFFF00FF
          009000FFFFFF58D08058D08058D08058D08058D08058D08058D08058D08058D0
          8058D08057CF7E54CE7A50CB744CC86D46C46640C15D006000694731FF00FFFF
          00FFFF00FFFF00FF929292FFFFFFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF
          CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCDCDCDCBCBCBC8C8C8C5C5C5C2C2C27676
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
      end
      object PassFamiliaEdit: TCheckEdit
        Left = 8
        Top = 56
        Width = 121
        Height = 21
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnMouseDown = PassEditMouseDown
        InputSet = isName
      end
      object PassImyaEdit: TCheckEdit
        Left = 160
        Top = 56
        Width = 121
        Height = 21
        MaxLength = 20
        TabOrder = 1
        OnMouseDown = PassEditMouseDown
        InputSet = isName
      end
      object PassOtchestvoEdit: TCheckEdit
        Left = 304
        Top = 56
        Width = 145
        Height = 21
        MaxLength = 20
        TabOrder = 2
        OnMouseDown = PassEditMouseDown
        InputSet = isName
      end
      object SeriaEdit: TCheckEdit
        Left = 8
        Top = 160
        Width = 97
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 8
        TabOrder = 6
        InputSet = isName
      end
      object NumberEdit: TCheckEdit
        Left = 160
        Top = 160
        Width = 65
        Height = 21
        MaxLength = 7
        TabOrder = 7
        InputSet = isDigits
      end
      object VidanEdit: TCheckEdit
        Left = 136
        Top = 232
        Width = 321
        Height = 21
        MaxLength = 100
        TabOrder = 9
        InputSet = isAll
      end
      object ModifyPassButton: TBitBtn
        Left = 204
        Top = 272
        Width = 57
        Height = 57
        Caption = #1047#1084#1110#1085#1080#1090#1080
        TabOrder = 11
        OnClick = ModifyPassButtonClick
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
      end
      object PassRusFamiliaEdit: TCheckEdit
        Left = 8
        Top = 104
        Width = 121
        Height = 21
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 20
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnMouseDown = PassEditMouseDown
        InputSet = isName
      end
      object PassRusImyaEdit: TCheckEdit
        Left = 160
        Top = 104
        Width = 121
        Height = 21
        MaxLength = 20
        TabOrder = 4
        OnMouseDown = PassEditMouseDown
        InputSet = isName
      end
      object PassRusOtchestvoEdit: TCheckEdit
        Left = 304
        Top = 104
        Width = 145
        Height = 21
        MaxLength = 20
        TabOrder = 5
        OnMouseDown = PassEditMouseDown
        InputSet = isName
      end
      object DateBegPicker: TDateTimePicker
        Left = 8
        Top = 232
        Width = 113
        Height = 21
        Date = 37697.937150231490000000
        Time = 37697.937150231490000000
        TabOrder = 8
      end
      object PassDeleteButton: TBitBtn
        Left = 278
        Top = 272
        Width = 63
        Height = 57
        Hint = #1042#1080#1083#1091#1095#1080#1090#1080' '#1074#1080#1073#1088#1072#1085#1077' '#1091#1085#1080#1079#1091' '#1089#1090#1103#1075#1085#1077#1085#1085#1103
        BiDiMode = bdLeftToRight
        Caption = #1042#1080#1083#1091#1095#1080#1090#1080
        Default = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        OnClick = PassDellButtonClick
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
      end
    end
    object FamilyPage: TTabSheet
      Caption = #1056#1086#1076#1080#1085#1072
      ImageIndex = 2
      OnEnter = FamilyPageEnter
      object FamilyGrid: TDBGrid
        Left = 0
        Top = 56
        Width = 481
        Height = 285
        Color = clInfoBk
        DataSource = FamilySourse
        FixedColor = 15326644
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnKeyDown = FamilyGridKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'FIO'
            Width = 234
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME_RELATION'
            Width = 143
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BIRTH_DATE'
            Title.Caption = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078'.'
            Width = 83
            Visible = True
          end>
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 481
        Height = 57
        ButtonHeight = 50
        Caption = 'ToolBar1'
        TabOrder = 1
        object AddButton: TSpeedButton
          Left = 0
          Top = 2
          Width = 60
          Height = 50
          Caption = #1044#1086#1076#1072#1090#1080
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
          OnClick = AddButtonClick
        end
        object ModifyButton: TSpeedButton
          Left = 60
          Top = 2
          Width = 60
          Height = 50
          Caption = #1047#1084#1110#1085#1080#1090#1080
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
          OnClick = ModifyButtonClick
        end
        object DeleteButton: TSpeedButton
          Left = 120
          Top = 2
          Width = 60
          Height = 50
          Caption = #1042#1080#1083#1091#1095#1080#1090#1080
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
          OnClick = DeleteButtonClick
        end
        object ToolButton1: TToolButton
          Left = 180
          Top = 2
          Width = 287
          Caption = 'ToolButton1'
          Style = tbsSeparator
        end
      end
    end
  end
  object OkButton: TBitBtn
    Left = 280
    Top = 384
    Width = 97
    Height = 27
    Caption = #1043#1072#1088#1072#1079#1076
    Default = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
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
    Left = 408
    Top = 384
    Width = 97
    Height = 27
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
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
  object SexTable: TIBTable
    AfterOpen = SexTableAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID_SEX'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'FULL_NAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SHORT_NAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY18'
        Fields = 'ID_SEX'
        Options = [ixPrimary, ixUnique]
      end>
    ReadOnly = True
    StoreDefs = True
    TableName = 'INI_SEX'
    Left = 24
    Top = 376
    object SexTableID_SEX: TIntegerField
      FieldName = 'ID_SEX'
      Required = True
    end
    object SexTableFULL_NAME: TIBStringField
      FieldName = 'FULL_NAME'
      Required = True
      Size = 15
    end
    object SexTableSHORT_NAME: TIBStringField
      FieldName = 'SHORT_NAME'
      Required = True
      Size = 1
    end
  end
  object SexSource: TDataSource
    DataSet = SexTable
    Left = 56
    Top = 376
  end
  object PassQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    AfterPost = PassQueryAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Number, Seria, Date_Beg, Date_End, Vidan, Familia, Imya,'
      'Otchestvo,Rus_Familia,Rus_Imya,Rus_Otchestvo, Id_Pas_Data'
      'FROM Pass_Data'
      'WHERE Id_Man = :Id_Man'
      'ORDER BY Date_Beg, Date_End')
    Left = 224
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_MAN'
        ParamType = ptUnknown
      end>
    object PassQueryNUMBER: TIBStringField
      FieldName = 'NUMBER'
      Origin = 'PASS_DATA.NUMBER'
      Required = True
      Size = 7
    end
    object PassQuerySERIA: TIBStringField
      DisplayWidth = 8
      FieldName = 'SERIA'
      Origin = 'PASS_DATA.SERIA'
      Required = True
      Size = 8
    end
    object PassQueryDATE_BEG: TDateField
      FieldName = 'DATE_BEG'
      Origin = 'PASS_DATA.DATE_BEG'
      Required = True
      DisplayFormat = 'dd.mm.yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object PassQueryDATE_END: TDateField
      FieldName = 'DATE_END'
      Origin = 'PASS_DATA.DATE_END'
      Required = True
    end
    object PassQueryVIDAN: TIBStringField
      FieldName = 'VIDAN'
      Origin = 'PASS_DATA.VIDAN'
      Required = True
      Size = 100
    end
    object PassQueryFAMILIA: TIBStringField
      FieldName = 'FAMILIA'
      Origin = 'PASS_DATA.FAMILIA'
      Required = True
    end
    object PassQueryIMYA: TIBStringField
      FieldName = 'IMYA'
      Origin = 'PASS_DATA.IMYA'
      Required = True
    end
    object PassQueryOTCHESTVO: TIBStringField
      FieldName = 'OTCHESTVO'
      Origin = 'PASS_DATA.OTCHESTVO'
      Required = True
    end
    object PassQueryRUS_FAMILIA: TIBStringField
      FieldName = 'RUS_FAMILIA'
      Required = True
    end
    object PassQueryRUS_IMYA: TIBStringField
      FieldName = 'RUS_IMYA'
      Required = True
    end
    object PassQueryRUS_OTCHESTVO: TIBStringField
      FieldName = 'RUS_OTCHESTVO'
      Required = True
    end
    object PassQueryID_PAS_DATA: TLargeintField
      FieldName = 'ID_PAS_DATA'
      Origin = 'PASS_DATA.ID_PAS_DATA'
      Required = True
    end
  end
  object DetailsQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT Familia, Imya, Otchestvo, Rus_Familia, Rus_Imya, Rus_Otch' +
        'estvo, Birth_Date, Id_Birth_Place, Id_Adress, Tin,Id_Sex,Foreign' +
        '_W'
      'FROM People'
      'WHERE Id_Man = :Id_Man')
    Left = 136
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_MAN'
        ParamType = ptUnknown
      end>
    object DetailsQueryBIRTH_DATE: TDateField
      FieldName = 'BIRTH_DATE'
      Origin = 'PEOPLE.BIRTH_DATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object DetailsQueryID_BIRTH_PLACE: TIntegerField
      FieldName = 'ID_BIRTH_PLACE'
      Origin = 'PEOPLE.ID_BIRTH_PLACE'
    end
    object DetailsQueryID_ADRESS: TIntegerField
      FieldName = 'ID_ADRESS'
      Origin = 'PEOPLE.ID_ADRESS'
    end
    object DetailsQueryTIN: TIBStringField
      FieldName = 'TIN'
      Origin = 'PEOPLE.TIN'
      Size = 10
    end
    object DetailsQueryID_SEX: TIntegerField
      FieldName = 'ID_SEX'
      Origin = 'PEOPLE.ID_SEX'
      Required = True
    end
    object DetailsQueryRUS_FAMILIA: TIBStringField
      FieldName = 'RUS_FAMILIA'
      Required = True
    end
    object DetailsQueryRUS_IMYA: TIBStringField
      FieldName = 'RUS_IMYA'
      Required = True
    end
    object DetailsQueryRUS_OTCHESTVO: TIBStringField
      FieldName = 'RUS_OTCHESTVO'
      Required = True
    end
    object DetailsQueryFAMILIA: TIBStringField
      FieldName = 'FAMILIA'
      Required = True
    end
    object DetailsQueryIMYA: TIBStringField
      FieldName = 'IMYA'
      Required = True
    end
    object DetailsQueryOTCHESTVO: TIBStringField
      FieldName = 'OTCHESTVO'
      Required = True
    end
    object DetailsQueryFOREIGN_W: TIBStringField
      FieldName = 'FOREIGN_W'
      Origin = 'PEOPLE.FOREIGN_W'
      Size = 10
    end
  end
  object FamilyQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT FIO, Name_Relation,Birth_Date'
      'FROM Man_Family F, Ini_Family_Relation R'
      'WHERE F.Id_Relation = R.Id_Relation'
      'AND F.Id_Man_Int = :Id_Man')
    Left = 228
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_Man'
        ParamType = ptUnknown
      end>
    object FamilyQueryFIO: TIBStringField
      DisplayLabel = #1055#1030#1041
      FieldName = 'FIO'
      Required = True
      Size = 63
    end
    object FamilyQueryNAME_RELATION: TIBStringField
      DisplayLabel = #1058#1080#1087' '#1074#1110#1076#1085#1086#1089#1080#1085
      FieldName = 'NAME_RELATION'
    end
    object FamilyQueryBIRTH_DATE: TDateField
      FieldName = 'BIRTH_DATE'
      Origin = 'MAN_FAMILY.BIRTH_DATE'
    end
  end
  object FamilySourse: TDataSource
    DataSet = FamilyQuery
    Left = 260
    Top = 40
  end
  object PassCountQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT COUNT(Id_Man) FROM PASS_DATA'
      'WHERE Id_Man=:Id_Man')
    Left = 192
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_Man'
        ParamType = ptUnknown
      end>
    object PassCountQueryCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
  end
  object DeleteFamilyQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'EXECUTE PROCEDURE Man_Family_Delete(:Id_Man, :FIO)')
    Left = 192
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_Man'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FIO'
        ParamType = ptUnknown
      end>
  end
  object GetIdManQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT IdMan FROM Get_Id_Man')
    Left = 460
    Top = 2
    object GetIdManQueryIDMAN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'IDMAN'
      ReadOnly = True
    end
  end
  object BufInfoQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM Buffer_Get_Id_PbKey')
    Top = 304
    object BufInfoQueryID_PBKEY: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'ID_PBKEY'
      ReadOnly = True
    end
    object BufInfoQueryCUR_DATE: TDateField
      FieldKind = fkInternalCalc
      FieldName = 'CUR_DATE'
      ReadOnly = True
    end
    object BufInfoQueryCUR_TIME: TTimeField
      FieldKind = fkInternalCalc
      FieldName = 'CUR_TIME'
      ReadOnly = True
    end
  end
  object BufCopyQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'INSERT INTO BUFF_PEP_DATA(Id_PbKey,DATEREC_CREATE,'
      'TIMEREC_CREATE,NATIVE_CREATE,DATE_IN,"ACTION",FIO,FIOU,'
      'SEX,BIRTHDAY,SERIA,NOMER,DATEV,MESTO,INK)'
      'VALUES(:Id_PbKey,'#39'NOW'#39','#39'NOW'#39','#39'T'#39','#39'NOW'#39',:Action,:FIO,:FIOU,'
      ':SEX,:BIRTHDAY,:SERIA,:NOMER,:DATEV,:MESTO,:INK)')
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_PbKey'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Action'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FIOU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEX'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'BIRTHDAY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOMER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATEV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MESTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INK'
        ParamType = ptUnknown
      end>
  end
  object WorkQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 380
    Top = 360
  end
  object AdrQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.WriteTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select full_name as Adr from ADR_ADRESS_SEL(:ID)')
    Left = 96
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object AdrQueryADR: TIBStringField
      FieldName = 'ADR'
      Origin = 'GET_ADR_STRING.ADR'
      Size = 255
    end
  end
  object BufferQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT First_PBKey, Last_PBKEy FROM ASUP_LTD_PEOPLE_CHANGE(:Id_M' +
        'an)')
    Left = 180
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_Man'
        ParamType = ptUnknown
      end>
  end
end
