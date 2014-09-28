object addholidaylongForm: TaddholidaylongForm
  Left = 463
  Top = 228
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1076#1086#1074#1078#1077#1085#1085#1103' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
  ClientHeight = 483
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 544
    Height = 297
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 148
      Width = 84
      Height = 13
      Caption = #1058#1080#1087' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 177
      Width = 149
      Height = 13
      Caption = #1055#1088#1086#1076#1086#1074#1078#1080#1090#1080' '#1074#1110#1076#1087#1091#1089#1090#1082#1091' '#1079':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 264
      Top = 177
      Width = 19
      Height = 13
      Caption = #1087#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 205
      Width = 46
      Height = 13
      Caption = #1058#1077#1088#1084#1110#1085':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DatesReCalc: TSpeedButton
      Left = 392
      Top = 173
      Width = 145
      Height = 20
      Caption = '<-- '#1055#1077#1088#1077#1088#1072#1093#1091#1074#1072#1090#1080' '#1076#1072#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = DatesReCalcClick
    end
    object TermReCalc: TSpeedButton
      Left = 232
      Top = 203
      Width = 153
      Height = 19
      Caption = '<-- '#1055#1077#1088#1077#1088#1072#1093#1091#1074#1072#1090#1080' '#1090#1077#1088#1084#1110#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = TermReCalcClick
    end
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 26
      Height = 13
      Caption = #1055#1030#1041':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 57
      Width = 70
      Height = 13
      Caption = #1044#1077' '#1087#1088#1072#1094#1102#1108':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 81
      Width = 134
      Height = 13
      Caption = #1042#1110#1076#1087#1091#1089#1090#1082#1072' '#1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 224
      Top = 81
      Width = 19
      Height = 13
      Caption = #1087#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 233
      Width = 99
      Height = 13
      Caption = #1059' '#1079#1074#39#1103#1079#1082#1091' '#1079' '#1095#1080#1084':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 8
      Top = 257
      Width = 58
      Height = 13
      Caption = #1055#1110#1076#1089#1090#1072#1074#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DepartmentPostLabel: TLabel
      Left = 88
      Top = 56
      Width = 433
      Height = 13
      AutoSize = False
      Caption = '---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object FioLabel: TLabel
      Left = 88
      Top = 32
      Width = 433
      Height = 13
      AutoSize = False
      Caption = '---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object PeriodBegLabel: TLabel
      Left = 152
      Top = 80
      Width = 65
      Height = 13
      AutoSize = False
      Caption = '---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object PeriodEndLabel: TLabel
      Left = 256
      Top = 80
      Width = 65
      Height = 13
      AutoSize = False
      Caption = '---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label11: TLabel
      Left = 328
      Top = 101
      Width = 71
      Height = 13
      Caption = #1074#1110#1076#1082#1083#1080#1082#1072#1085#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RemoveDateLabel: TLabel
      Left = 408
      Top = 101
      Width = 65
      Height = 13
      AutoSize = False
      Caption = '---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label14: TLabel
      Left = 8
      Top = 121
      Width = 106
      Height = 13
      Caption = #1063#1086#1084#1091' '#1074#1110#1076#1082#1083#1080#1082#1072#1085#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ForWhatLabel: TLabel
      Left = 152
      Top = 120
      Width = 369
      Height = 13
      AutoSize = False
      Caption = '---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object RemoveHolidaySelectButton: TSpeedButton
      Left = 14
      Top = 5
      Width = 515
      Height = 20
      Caption = '<-- '#1042#1080#1073#1088#1072#1090#1080' '#1074#1110#1076#1087#1091#1089#1090#1082#1091', '#1103#1082#1091' '#1090#1088#1077#1073#1072' '#1087#1088#1086#1076#1086#1074#1078#1080#1090#1080' -->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = RemoveHolidaySelectButtonClick
    end
    object Label15: TLabel
      Left = 8
      Top = 101
      Width = 74
      Height = 13
      Caption = #1042#1110#1076#1087#1091#1089#1090#1082#1072' '#1079':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DateBegLabel: TLabel
      Left = 152
      Top = 101
      Width = 65
      Height = 13
      AutoSize = False
      Caption = '---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label17: TLabel
      Left = 224
      Top = 101
      Width = 19
      Height = 13
      Caption = #1087#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DateEndLabel: TLabel
      Left = 256
      Top = 101
      Width = 65
      Height = 13
      AutoSize = False
      Caption = '---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object DateBeg: TDateTimePicker
      Left = 160
      Top = 173
      Width = 97
      Height = 21
      Date = 37806.553628020810000000
      Time = 37806.553628020810000000
      TabOrder = 0
      OnChange = DateBegChange
    end
    object DateEnd: TDateTimePicker
      Left = 288
      Top = 173
      Width = 97
      Height = 21
      Date = 37806.553628020810000000
      Time = 37806.553628020810000000
      TabOrder = 1
      OnChange = DateBegChange
    end
    object SelectHolidayButton: TButton
      Left = 504
      Top = 143
      Width = 33
      Height = 21
      Caption = '...'
      TabOrder = 2
      OnClick = SelectHolidayButtonClick
    end
    object TermEdit: TCheckEdit
      Left = 120
      Top = 201
      Width = 97
      Height = 21
      TabOrder = 3
      OnChange = TermEditChange
      InputSet = isDigits
    end
    object LongReasonBox: TSpComboBox
      Left = 120
      Top = 229
      Width = 417
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnChange = LongReasonBoxChange
      ItemCount = 5
      SpOpenItem = '...'#1030#1085#1096#1077
      AutoDrop = True
      SpParams.Table = 'INI_HOLIDAY_LONG_REASON'
      SpParams.IdField = 'ID_HOLIDAY_LONG_REASON'
      SpParams.SpFields = 'NAME_REASON'
      SpParams.Title = #1059' '#1079#1074'`'#1103#1079#1082#1091' '#1079' '#1095#1080#1084' '#1087#1088#1086#1076#1086#1074#1078#1091#1108#1090#1100#1089#1103' '#1074#1110#1076#1087#1091#1089#1090#1082#1072
      SpParams.ComboField = 'NAME_REASON'
      SpParams.ColumnNames = #1059' '#1079#1074'`'#1103#1079#1082#1091' '#1079' '#1095#1080#1084' '#1085#1072#1076#1072#1108#1090#1100#1089#1103
      SpParams.SelectProcName = 'INI_HOLIDAY_LONG_REASON_SELECT'
      SpParams.InsertProcName = 'INI_HOLIDAY_LONG_REASON_INSERT'
      SpParams.UpdateProcName = 'INI_HOLIDAY_LONG_REASON_UPDATE'
      SpParams.DeleteProcName = 'INI_HOLIDAY_LONG_REASON_DELETE'
      SpParams.DontHideFirstColumn = False
      SpParams.SpMode = [spfAdd, spfModify, spfDelete, spfFind, spfSelect, spfExt]
    end
    object ReasonMemo: TMemo
      Left = 120
      Top = 256
      Width = 417
      Height = 37
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 4096
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 5
      OnChange = ReasonMemoChange
    end
    object HolidayEdit: TEdit
      Left = 120
      Top = 144
      Width = 377
      Height = 21
      ReadOnly = True
      TabOrder = 6
    end
  end
  object OrderPanel: TGroupBox
    Left = 0
    Top = 293
    Width = 544
    Height = 155
    Align = alBottom
    Caption = #1053#1072#1082#1072#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label12: TLabel
      Left = 282
      Top = 67
      Width = 101
      Height = 13
      Caption = #8470' '#1085#1086#1074#1086#1075#1086' '#1087#1091#1085#1082#1090#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 10
      Top = 70
      Width = 36
      Height = 13
      Caption = #1058#1077#1082#1089#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SelectNumItemButton: TButton
      Left = 232
      Top = 20
      Width = 33
      Height = 25
      Hint = #1042#1080#1073#1088#1072#1090#1080' '#1087#1091#1085#1082#1090' '#1085#1072#1082#1072#1079#1091', '#1076#1086' '#1103#1082#1086#1075#1086' '#1073#1091#1076#1077' '#1087#1088#1080#1074#39#1103#1079#1072#1085#1086' '#1085#1072#1076#1073#1072#1074#1082#1080
      Caption = '...'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object NumItemEdit: TEdit
      Left = 176
      Top = 22
      Width = 41
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object RadioButton1: TRadioButton
      Left = 8
      Top = 24
      Width = 161
      Height = 17
      Caption = #1030#1089#1085#1091#1102#1095#1080#1081' '#1087#1091#1085#1082#1090' '#1085#1072#1082#1072#1079#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 48
      Width = 265
      Height = 17
      Caption = #1057#1075#1077#1085#1077#1088#1091#1074#1072#1090#1080' '#1087#1091#1085#1082#1090' '#1085#1072#1082#1072#1079#1091' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1085#1086
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      TabStop = True
    end
    object NumItemText: TMemo
      Left = 8
      Top = 88
      Width = 529
      Height = 61
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 4096
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 4
    end
    object NewNumItemEdit: TCheckEdit
      Left = 392
      Top = 62
      Width = 33
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      InputSet = isDigits
    end
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 448
    Width = 544
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object OkButton: TBitBtn
      Left = 158
      Top = 5
      Width = 97
      Height = 28
      Caption = #1043#1072#1088#1072#1079#1076
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
      Left = 304
      Top = 5
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
  object ResultQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM MAN_HOLIDAY_LONG_SELECT_ONE(:ID_MAN_HOLIDAY)')
    Left = 408
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_MAN_HOLIDAY'
        ParamType = ptUnknown
      end>
    object ResultQueryID_ORDER: TIntegerField
      FieldName = 'ID_ORDER'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.ID_ORDER'
    end
    object ResultQueryID_HOLIDAY: TIntegerField
      FieldName = 'ID_HOLIDAY'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.ID_HOLIDAY'
    end
    object ResultQueryPERIOD_BEG: TDateField
      FieldName = 'PERIOD_BEG'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.PERIOD_BEG'
    end
    object ResultQueryPERIOD_END: TDateField
      FieldName = 'PERIOD_END'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.PERIOD_END'
    end
    object ResultQueryDATE_BEG: TDateField
      FieldName = 'DATE_BEG'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.DATE_BEG'
    end
    object ResultQueryDATE_END: TDateField
      FieldName = 'DATE_END'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.DATE_END'
    end
    object ResultQueryH_TERM: TIntegerField
      FieldName = 'H_TERM'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.H_TERM'
    end
    object ResultQueryID_MAN_MOVING: TIntegerField
      FieldName = 'ID_MAN_MOVING'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.ID_MAN_MOVING'
    end
    object ResultQueryDAY_USED: TIntegerField
      FieldName = 'DAY_USED'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.DAY_USED'
    end
    object ResultQueryDAY_UNUSED: TIntegerField
      FieldName = 'DAY_UNUSED'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.DAY_UNUSED'
    end
    object ResultQueryRMOVING: TIntegerField
      FieldName = 'RMOVING'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.RMOVING'
    end
    object ResultQueryID_STATUS: TIntegerField
      FieldName = 'ID_STATUS'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.ID_STATUS'
    end
    object ResultQueryREASON: TIBStringField
      FieldName = 'REASON'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.REASON'
      Size = 255
    end
    object ResultQueryNUM_ITEM: TIntegerField
      FieldName = 'NUM_ITEM'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.NUM_ITEM'
    end
    object ResultQueryID_HOLIDAY_REMOVE_PROLONG: TIntegerField
      FieldName = 'ID_HOLIDAY_REMOVE_PROLONG'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.ID_HOLIDAY_REMOVE_PROLONG'
    end
    object ResultQueryID_HOLIDAY_LONG_REASON: TIntegerField
      FieldName = 'ID_HOLIDAY_LONG_REASON'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.ID_HOLIDAY_LONG_REASON'
    end
    object ResultQueryDEPARTMENT_NAME: TIBStringField
      FieldName = 'DEPARTMENT_NAME'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.DEPARTMENT_NAME'
      Size = 255
    end
    object ResultQueryPOST_NAME: TIBStringField
      FieldName = 'POST_NAME'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.POST_NAME'
      Size = 255
    end
    object ResultQueryFIO_SMALL: TIBStringField
      FieldName = 'FIO_SMALL'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.FIO_SMALL'
      Size = 255
    end
    object ResultQueryTN: TIntegerField
      FieldName = 'TN'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.TN'
    end
    object ResultQueryNAME_REASON: TIBStringField
      FieldName = 'NAME_REASON'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.NAME_REASON'
      Size = 255
    end
    object ResultQueryNAME_HOLDIAY: TIBStringField
      FieldName = 'NAME_HOLDIAY'
      Origin = 'MAN_HOLIDAY_LONG_SELECT_ONE.NAME_HOLDIAY'
      Size = 255
    end
  end
  object WriteQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'EXECUTE PROCEDURE MAN_HOLIDAY_LONG_INSERTUPDATE('
      ':ID_MAN_HOLIDAY,'
      ':ID_HOLIDAY,'
      ':PERIOD_BEG,'
      ':PERIOD_END,'
      ':DATE_BEG,'
      ':DATE_END,'
      ':H_TERM,'
      ':ID_MAN_MOVING,'
      ':ID_ORDER,'
      ':REASON,'
      ':NUM_ITEM,'
      ':ID_HOLIDAY_REMOVE_PROLONG,'
      ':ID_HOLIDAY_LONG_REASON)')
    Left = 440
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_MAN_HOLIDAY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_HOLIDAY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PERIOD_BEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PERIOD_END'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_BEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_END'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'H_TERM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_MAN_MOVING'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_ORDER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REASON'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUM_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_HOLIDAY_REMOVE_PROLONG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_HOLIDAY_LONG_REASON'
        ParamType = ptUnknown
      end>
  end
  object CheckQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.ReadTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM HOLIDAYS_BETWEEN_2_DATES(:DATE1, :DATE2);')
    Left = 472
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATE1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE2'
        ParamType = ptUnknown
      end>
    object CheckQueryHCOUNT: TIntegerField
      FieldName = 'HCOUNT'
      Origin = 'HOLIDAYS_BETWEEN_2_DATES.HCOUNT'
    end
  end
  object RemoveQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM MAN_HOLIDAY_REMOVE_SEL_BY_IHR(:Id_Holiday_Remove_P' +
        'rolong)')
    Left = 376
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_Holiday_Remove_Prolong'
        ParamType = ptUnknown
      end>
    object RemoveQueryNUM_ITEM: TIntegerField
      FieldName = 'NUM_ITEM'
      Origin = 'MAN_HOLIDAY_REMOVE_SEL_BY_IHR.NUM_ITEM'
    end
    object RemoveQueryID_HOLIDAY_ORDER: TIntegerField
      FieldName = 'ID_HOLIDAY_ORDER'
      Origin = 'MAN_HOLIDAY_REMOVE_SEL_BY_IHR.ID_HOLIDAY_ORDER'
    end
    object RemoveQueryDATE_REMOVE: TDateField
      FieldName = 'DATE_REMOVE'
      Origin = 'MAN_HOLIDAY_REMOVE_SEL_BY_IHR.DATE_REMOVE'
    end
    object RemoveQueryFOR_WHAT: TIBStringField
      FieldName = 'FOR_WHAT'
      Origin = 'MAN_HOLIDAY_REMOVE_SEL_BY_IHR.FOR_WHAT'
      Size = 255
    end
    object RemoveQueryFIO_SMALL: TIBStringField
      FieldName = 'FIO_SMALL'
      Origin = 'MAN_HOLIDAY_REMOVE_SEL_BY_IHR.FIO_SMALL'
      Size = 62
    end
    object RemoveQueryTN: TIntegerField
      FieldName = 'TN'
      Origin = 'MAN_HOLIDAY_REMOVE_SEL_BY_IHR.TN'
    end
    object RemoveQueryPOST_NAME: TIBStringField
      FieldName = 'POST_NAME'
      Origin = 'MAN_HOLIDAY_REMOVE_SEL_BY_IHR.POST_NAME'
      Size = 255
    end
    object RemoveQueryDEP_NAME: TIBStringField
      FieldName = 'DEP_NAME'
      Origin = 'MAN_HOLIDAY_REMOVE_SEL_BY_IHR.DEP_NAME'
      Size = 255
    end
    object RemoveQueryHOLIDAY_BEG: TDateField
      FieldName = 'HOLIDAY_BEG'
      Origin = 'MAN_HOLIDAY_REMOVE_SEL_BY_IHR.HOLIDAY_BEG'
    end
    object RemoveQueryHOLIDAY_END: TDateField
      FieldName = 'HOLIDAY_END'
      Origin = 'MAN_HOLIDAY_REMOVE_SEL_BY_IHR.HOLIDAY_END'
    end
    object RemoveQueryORDER_NUM: TIBStringField
      FieldName = 'ORDER_NUM'
      Origin = 'MAN_HOLIDAY_REMOVE_SEL_BY_IHR.ORDER_NUM'
      Size = 255
    end
    object RemoveQueryID_MAN_MOVING: TIntegerField
      FieldName = 'ID_MAN_MOVING'
      Origin = 'MAN_HOLIDAY_REMOVE_SEL_BY_IHR.ID_MAN_MOVING'
    end
    object RemoveQueryPERIOD_BEG: TDateField
      FieldName = 'PERIOD_BEG'
      Origin = 'MAN_HOLIDAY_REMOVE_SEL_BY_IHR.PERIOD_BEG'
    end
    object RemoveQueryPERIOD_END: TDateField
      FieldName = 'PERIOD_END'
      Origin = 'MAN_HOLIDAY_REMOVE_SEL_BY_IHR.PERIOD_END'
    end
  end
  object WorkQuery2: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'EXECUTE PROCEDURE MAN_ADD_HOLIDAY_INSERT_NUM_ITEM('
      ':id_order,'
      ':num_item,'
      ':text);')
    Left = 472
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_ORDER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUM_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'text'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'ID_POST'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_BONUS'
      Required = True
    end
    object DateField1: TDateField
      FieldName = 'DATE_BEG'
      Required = True
    end
    object DateField2: TDateField
      FieldName = 'DATE_END'
      Required = True
    end
    object IBStringField1: TIBStringField
      FieldName = 'IS_PERCENT'
      Required = True
      Size = 1
    end
    object IntegerField3: TIntegerField
      FieldName = 'PERCENT'
    end
    object IBBCDField1: TIBBCDField
      FieldName = 'SUMMA'
      Precision = 9
      Size = 2
    end
  end
end
