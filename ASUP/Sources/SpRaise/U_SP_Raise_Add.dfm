object SP_Raise_Add: TSP_Raise_Add
  Left = 297
  Top = 233
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1080' '#1085#1086#1074#1091' '#1085#1072#1076#1073#1072#1074#1082#1091
  ClientHeight = 457
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel4: TBevel
    Left = 8
    Top = 24
    Width = 617
    Height = 137
  end
  object Bevel1: TBevel
    Left = 290
    Top = 288
    Width = 335
    Height = 97
  end
  object Bevel3: TBevel
    Left = 8
    Top = 164
    Width = 617
    Height = 117
  end
  object Bevel2: TBevel
    Left = 8
    Top = 288
    Width = 279
    Height = 97
  end
  object FC_Name: TFieldControl
    Left = 24
    Top = 127
    Width = 18
    Height = 18
    Control = CE_Name
    Title = '"'#1053#1072#1079#1074#1072'"'
    MaxLength = 0
    ExactLength = 0
    CapitalizeStyle = csNone
  end
  object FC_Def: TFieldControl
    Left = 408
    Top = 208
    Width = 18
    Height = 18
    Control = CE_Def
    Title = '"'#1047#1074#1080#1095#1072#1081#1085#1086'"'
    MaxLength = 0
    ExactLength = 0
    CapitalizeStyle = csNone
  end
  object FC_Max: TFieldControl
    Left = 376
    Top = 208
    Width = 18
    Height = 18
    Control = CE_Max
    Title = '"'#1052#1072#1082#1089#1080#1084#1091#1084'"'
    MaxLength = 0
    ExactLength = 0
    CapitalizeStyle = csNone
  end
  object FC_Min: TFieldControl
    Left = 344
    Top = 208
    Width = 18
    Height = 18
    Control = CE_Min
    Title = '"'#1052#1110#1085#1110#1084#1091#1084'"'
    MaxLength = 0
    ExactLength = 0
    CapitalizeStyle = csNone
  end
  object FC_One: TFieldControl
    Left = 299
    Top = 204
    Width = 18
    Height = 18
    Control = CE_One
    Required = False
    Title = '"'#1057#1090#1072#1094#1110#1086#1085#1072#1088#1085#1077'"'
    MaxLength = 0
    ExactLength = 0
    CapitalizeStyle = csNone
  end
  object Label1: TLabel
    Left = 128
    Top = 315
    Width = 19
    Height = 16
    Caption = #1074#1110#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 216
    Top = 315
    Width = 16
    Height = 16
    Caption = #1076#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 36
    Top = 341
    Width = 64
    Height = 16
    Caption = #1079#1074#1080#1095#1072#1081#1085#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 13
    Top = 71
    Width = 88
    Height = 16
    Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 56
    Top = 43
    Width = 45
    Height = 16
    Caption = #1053#1072#1079#1074#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 73
    Top = 106
    Width = 28
    Height = 16
    Caption = #1058#1080#1087':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 23
    Top = 132
    Width = 78
    Height = 16
    Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object FC_Vid: TFieldControl
    Left = 120
    Top = 81
    Width = 18
    Height = 18
    Control = BonusBox
    Required = False
    Title = '"'#1042#1080#1076' '#1086#1087#1083#1072#1090#1080'"'
    MaxLength = 0
    ExactLength = 0
    CapitalizeStyle = csNone
  end
  object FC_Type: TFieldControl
    Left = 120
    Top = 56
    Width = 18
    Height = 18
    Control = TypeBox
    Title = '"'#1058#1080#1087' '#1085#1072#1076#1073#1072#1074#1082#1080'"'
    MaxLength = 0
    ExactLength = 0
    CapitalizeStyle = csNone
  end
  object Label11: TLabel
    Left = 295
    Top = 106
    Width = 25
    Height = 16
    Caption = #1042#1080#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 302
    Top = 310
    Width = 136
    Height = 16
    Caption = #1043#1088#1091#1087#1072' '#1076#1083#1103' '#1079#1072#1084#1110#1097#1077#1085#1085#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 303
    Top = 359
    Width = 127
    Height = 16
    Caption = #1055#1086#1088#1103#1076#1086#1082' '#1079#1072#1084#1110#1097#1077#1085#1085#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label14: TLabel
    Left = 13
    Top = 28
    Width = 228
    Height = 16
    Caption = #1054#1057#1053#1054#1042#1053#1030' '#1044#1040#1053#1030' '#1055#1056#1054' '#1053#1040#1044#1041#1040#1042#1050#1059
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label16: TLabel
    Left = 13
    Top = 290
    Width = 183
    Height = 16
    Caption = #1055#1056#1054#1062#1045#1053#1058#1053#1030' '#1044#1030#1040#1055#1040#1047#1054#1053#1048
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label17: TLabel
    Left = 294
    Top = 290
    Width = 179
    Height = 16
    Caption = #1047#1040#1052#1030#1065#1045#1053#1053#1071' '#1053#1040#1044#1041#1040#1042#1054#1050
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label15: TLabel
    Left = 12
    Top = 168
    Width = 192
    Height = 16
    Caption = #1042#1051#1040#1057#1058#1048#1042#1054#1057#1058#1030' '#1053#1040#1044#1041#1040#1042#1054#1050
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label18: TLabel
    Left = 352
    Top = 43
    Width = 166
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1076#1083#1103' '#1074#1110#1076#1086#1073#1088#1072#1078#1077#1085#1085#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object CB_Spec: TCheckBox
    Left = 372
    Top = 167
    Width = 217
    Height = 25
    Caption = #1057#1087#1077#1094#1110#1072#1083#1100#1085#1080#1081' '#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object CE_Name: TCheckEdit
    Left = 104
    Top = 43
    Width = 236
    Height = 24
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 20
    ParentFont = False
    TabOrder = 0
    InputSet = isAll
  end
  object CE_Min: TCheckEdit
    Left = 160
    Top = 311
    Width = 41
    Height = 24
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnKeyPress = CE_MinKeyPress
    InputSet = isDigitsDot
  end
  object CE_Max: TCheckEdit
    Left = 240
    Top = 311
    Width = 41
    Height = 24
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnKeyPress = CE_MinKeyPress
    InputSet = isDigitsDot
  end
  object CE_Def: TCheckEdit
    Left = 160
    Top = 338
    Width = 41
    Height = 24
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnKeyPress = CE_MinKeyPress
    InputSet = isDigitsDot
  end
  object CE_One: TCheckEdit
    Left = 240
    Top = 356
    Width = 41
    Height = 24
    Color = clInfoBk
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    OnKeyPress = CE_MinKeyPress
    InputSet = isDigitsDot
  end
  object M_full: TMemo
    Left = 104
    Top = 71
    Width = 513
    Height = 34
    Color = clInfoBk
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 200
    ParentFont = False
    TabOrder = 1
  end
  object RangeRadio: TRadioButton
    Left = 16
    Top = 315
    Width = 97
    Height = 17
    Caption = #1044#1110#1072#1087#1072#1079#1086#1085
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    TabStop = True
    OnClick = RangeRadioClick
  end
  object FixRadio: TRadioButton
    Left = 16
    Top = 360
    Width = 201
    Height = 17
    Caption = #1060#1110#1082#1089#1086#1074#1072#1085#1077' '#1079#1085#1072#1095#1077#1085#1085#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    OnClick = RangeRadioClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 630
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
    object Label6: TLabel
      Left = 434
      Top = 4
      Width = 16
      Height = 16
      Caption = #1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 298
      Top = 4
      Width = 11
      Height = 16
      Caption = #1079':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 234
      Top = 4
      Width = 52
      Height = 16
      Caption = #1044#1072#1090#1072' '#1076#1110#1111':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object RB_Cor: TRadioButton
      Left = 14
      Top = 4
      Width = 113
      Height = 17
      Hint = #1042#1110#1076#1082#1086#1088#1077#1075#1091#1074#1072#1090#1080' '#1085#1072#1079#1074#1091', '#1079#1085#1072#1095#1077#1085#1085#1103' '#1085#1072#1076#1073#1072#1074#1082#1080', '#1090#1086#1097#1086'.'
      Caption = #1050#1086#1088#1077#1075#1091#1074#1072#1090#1080
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = True
      OnClick = RB_CorClick
    end
    object RB_New: TRadioButton
      Left = 134
      Top = 4
      Width = 97
      Height = 17
      Hint = 
        #1047#1072#1082#1088#1080#1090#1080' '#1087#1086#1090#1086#1095#1085#1091' '#1085#1072#1076#1073#1072#1074#1082#1091' '#1110' '#1085#1072' '#1111#1111' '#1086#1089#1085#1086#1074#1110' '#13#10#1089#1090#1074#1086#1088#1080#1090#1080' '#1085#1086#1074#1091' '#1079' '#1085#1086#1074#1080#1084' ' +
        #1090#1077#1088#1084#1110#1085#1086#1084' '#1076#1110#1111
      Caption = #1047#1084#1110#1085#1080#1090#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = RB_CorClick
    end
    object DT_DateBeg: TDateTimePicker
      Left = 322
      Top = 0
      Width = 105
      Height = 24
      Date = 38406.013136574070000000
      Format = 'dd.MM.yyyy'
      Time = 38406.013136574070000000
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object DT_DateEnd: TDateTimePicker
      Left = 458
      Top = 0
      Width = 105
      Height = 24
      Date = 38406.009665428240000000
      Format = 'dd.MM.yyyy'
      Time = 38406.009665428240000000
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  object BonusBox: TSpComboBox
    Left = 104
    Top = 132
    Width = 513
    Height = 24
    Style = csDropDownList
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 4
    ItemCount = 5
    SpOpenItem = '...'#1030#1085#1096#1077
    AutoDrop = True
    SpParams.Table = 'Sp_VidOpl'
    SpParams.IdField = 'Id_VidOpl'
    SpParams.SpFields = 'Name_VidOpl'
    SpParams.Title = #1042#1080#1076#1080' '#1086#1087#1083#1072#1090#1080' '#1085#1072#1076#1073#1072#1074#1086#1082
    SpParams.ComboField = 'Name_VidOpl'
    SpParams.ColumnNames = #1042#1080#1076' '#1086#1087#1083#1072#1090#1080
    SpParams.ReadOnly = True
    SpParams.SelectProcName = 'Sp_VidOpl_Select(201)'
    SpParams.InsertProcName = 'Sp_VidOpl_Insert'
    SpParams.UpdateProcName = 'Sp_VidOpl_Update'
    SpParams.DeleteProcName = 'Sp_VidOpl_Delete'
    SpParams.DontHideFirstColumn = False
    SpParams.SpMode = [spfAdd, spfModify, spfDelete, spfFind, spfSelect, spfExt]
    SpParams.AddFormName = 'AddVidoplForm'
    AlternativeForm = 'SpVidoplForm'
  end
  object TypeBox: TSpComboBox
    Left = 104
    Top = 106
    Width = 185
    Height = 24
    Style = csDropDownList
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 2
    ItemCount = 5
    SpOpenItem = '...'#1030#1085#1096#1077
    AutoDrop = True
    SpParams.Table = 'ini_type_Raise'
    SpParams.IdField = 'ID_type_raise'
    SpParams.SpFields = 'Name_Type_raise'
    SpParams.Title = #1058#1080#1087#1080' '#1085#1072#1076#1073#1072#1074#1086#1082
    SpParams.ComboField = 'Name_Type_Raise'
    SpParams.ColumnNames = #1058#1080#1087' '#1085#1072#1076#1073#1072#1074#1082#1080
    SpParams.ReadOnly = True
    SpParams.DontHideFirstColumn = False
    SpParams.SpMode = [spfAdd, spfModify, spfDelete, spfFind, spfSelect, spfExt]
  end
  object CB_Percental: TCheckBox
    Left = 372
    Top = 187
    Width = 193
    Height = 25
    Caption = #1042#1110#1076#1089#1086#1090#1082#1086#1074#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object CB_Use_SHT: TCheckBox
    Left = 20
    Top = 188
    Width = 295
    Height = 33
    Caption = #1042#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1108#1090#1100#1089#1103' '#1091' '#1096#1090#1072#1090#1085#1086#1084#1091' '#1088#1086#1079#1082#1083#1072#1076#1110
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object CB_USE_SM_Okl: TCheckBox
    Left = 20
    Top = 215
    Width = 306
    Height = 25
    Caption = #1042#1074#1086#1076#1080#1090#1100#1089#1103' '#1087#1088#1086#1087#1086#1088#1094#1110#1081#1085#1086' '#1087#1110#1076#1074#1080#1097#1077#1085#1085#1102' '#1086#1082#1083#1072#1076#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object CB_USE_Stavka: TCheckBox
    Left = 372
    Top = 209
    Width = 193
    Height = 25
    Caption = #1047#1072#1081#1084#1072#1108' '#1089#1090#1072#1074#1082#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object CB_Calc_type: TComboBox
    Left = 324
    Top = 106
    Width = 293
    Height = 24
    Style = csDropDownList
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
  end
  object AbsorbeGroup: TSpComboBox
    Left = 303
    Top = 328
    Width = 314
    Height = 24
    Style = csDropDownList
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 17
    ItemCount = 5
    SpOpenItem = '...'#1030#1085#1096#1077
    AutoDrop = True
    SpParams.Table = 'UP_DT_ABSORBE_GROUP'
    SpParams.IdField = 'ID_ABSORBE_GROUP'
    SpParams.SpFields = 'GROUP_TITLE'
    SpParams.Title = #1043#1088#1091#1087#1072' '#1076#1083#1103' '#1079#1072#1084#1110#1097#1077#1085#1085#1103
    SpParams.ComboField = 'GROUP_TITLE'
    SpParams.ColumnNames = #1043#1088#1091#1087#1072' '#1076#1083#1103' '#1079#1072#1084#1110#1097#1077#1085#1085#1103
    SpParams.ReadOnly = True
    SpParams.DontHideFirstColumn = False
    SpParams.SpMode = [spfAdd, spfModify, spfDelete, spfFind, spfSelect, spfExt]
  end
  object AbsorbePriority: TEdit
    Left = 456
    Top = 355
    Width = 67
    Height = 24
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 18
    Text = '0'
    Visible = False
  end
  object SbOk: TBitBtn
    Left = 212
    Top = 419
    Width = 97
    Height = 26
    Action = AcceptAction
    Caption = #1043#1072#1088#1072#1079#1076
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 19
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
  object SbCancel: TBitBtn
    Left = 316
    Top = 419
    Width = 97
    Height = 26
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 20
    OnClick = SBCancelClick
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
  object MayBeeMoreThanOnce: TCheckBox
    Left = 371
    Top = 231
    Width = 238
    Height = 23
    Caption = #1052#1086#1078#1077' '#1085#1072#1079#1085#1072#1095#1072#1090#1080#1089#1103' '#1073#1110#1083#1100#1096#1077' 1 '#1088#1072#1079#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object DisplayOrder: TqFIntControl
    Left = 522
    Top = 43
    Width = 98
    Height = 23
    DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
    Interval = 0
    Value = 65535
    LabelColor = clGreen
    Required = True
    Semicolon = True
    Asterisk = False
    Enabled = True
    Blocked = False
    TabOrder = 22
    AutoSaveToRegistry = False
    MaxLength = 10
    NegativeAllowed = False
    ZeroAllowed = False
  end
  object ReasonText: TcxTextEdit
    Left = 84
    Top = 390
    Width = 533
    Height = 21
    Properties.MaxLength = 255
    Style.Color = clInfoBk
    Style.LookAndFeel.NativeStyle = True
    TabOrder = 23
  end
  object lblReason: TcxLabel
    Left = 16
    Top = 389
    Width = 67
    Height = 20
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 24
    Caption = #1055#1110#1076#1089#1090#1072#1074#1072
  end
  object chStimulBonus: TCheckBox
    Left = 20
    Top = 235
    Width = 181
    Height = 25
    Caption = #1057#1090#1080#1084#1091#1083#1102#1102#1095#1072' '#1085#1072#1076#1073#1072#1074#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 25
  end
  object chIsProlong: TCheckBox
    Left = 20
    Top = 255
    Width = 325
    Height = 25
    Caption = #1055#1086#1076#1086#1074#1078#1091#1074#1072#1090#1080' '#1087#1088#1080' '#1087#1086#1076#1086#1074#1078#1077#1085#1085#1110' '#1089#1090#1088#1086#1082#1110#1074' '#1088#1086#1073#1086#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 26
  end
  object ActionList1: TActionList
    Left = 64
    Top = 408
    object AcceptAction: TAction
      Caption = #1043#1072#1088#1072#1079#1076
      ShortCut = 13
      SecondaryShortCuts.Strings = (
        'F10')
      OnExecute = AcceptActionExecute
    end
  end
end
