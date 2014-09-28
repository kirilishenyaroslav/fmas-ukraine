object frmPropiska: TfrmPropiska
  Left = 690
  Top = 233
  Width = 610
  Height = 530
  VertScrollBar.Style = ssHotTrack
  BorderIcons = [biSystemMenu]
  Caption = #1055#1088#1086#1087#1080#1089#1082#1072' - '#1074#1099#1087#1080#1089#1082#1072
  Color = clBtnFace
  Constraints.MinHeight = 31
  Constraints.MinWidth = 160
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object prp_PageControl: TcxPageControl
    Left = 8
    Top = 85
    Width = 578
    Height = 387
    Cursor = crHandPoint
    Hint = 'Ctrl+Tab -  '#1055#1077#1088#1077#1082#1083#1102#1095'. '#1074#1082#1083#1072#1076#1086#1082
    ActivePage = prp_Propiska_Sheet
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HotTrack = True
    Images = prp_ImageList
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    ParentFont = False
    ParentShowHint = False
    Rotate = True
    ShowFrame = True
    ShowHint = False
    Style = 3
    TabHeight = 20
    TabOrder = 5
    TabPosition = tpLeft
    OnChange = prp_PageControlChange
    object prp_Vipiska_Sheet: TcxTabSheet
      Caption = #1042#1099#1087#1080#1089#1082#1072'        '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 14
      ParentFont = False
      TabVisible = False
      object prp_vip_GroupBox: TcxGroupBox
        Left = 0
        Top = 0
        Width = 449
        Height = 383
        Align = alClient
        Alignment = alTopLeft
        Caption = #1042#1099#1087#1080#1089#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LookAndFeel.NativeStyle = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TabStop = False
        object vip_Strana_Label: TLabel
          Left = 16
          Top = 20
          Width = 36
          Height = 13
          Caption = #1057#1090#1088#1072#1085#1072
        end
        object vip_Index_Label: TLabel
          Left = 296
          Top = 116
          Width = 38
          Height = 13
          Caption = #1048#1085#1076#1077#1082#1089
        end
        object vip_Rayon_Label: TLabel
          Left = 16
          Top = 84
          Width = 31
          Height = 13
          Caption = #1056#1072#1081#1086#1085
        end
        object vip_Selo_Label: TLabel
          Left = 16
          Top = 148
          Width = 25
          Height = 13
          Caption = #1057#1077#1083#1086
        end
        object vip_DateVip_Label: TLabel
          Left = 16
          Top = 220
          Width = 73
          Height = 13
          Caption = #1044#1072#1090#1072' '#1074#1099#1087#1080#1089#1082#1080
        end
        object prp_vipiska_street_label: TLabel
          Left = 16
          Top = 175
          Width = 36
          Height = 13
          Caption = #1042#1091#1083#1080#1094#1103
        end
        object prp_vipiska_house_label: TLabel
          Left = 254
          Top = 175
          Width = 42
          Height = 13
          Caption = #1041#1091#1076#1080#1085#1086#1082
        end
        object Label4prp_vipiska_kvartira_label: TLabel
          Left = 342
          Top = 175
          Width = 48
          Height = 13
          Caption = #1050#1074#1072#1088#1090#1080#1088#1072
        end
        object prp_vip_Country_TextEdit: TcxTextEdit
          Left = 56
          Top = 16
          Width = 193
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 35
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 0
          OnKeyPress = prp_vip_Country_TextEditKeyPress
        end
        object prp_vip_Oblast_ComboBox: TcxComboBox
          Left = 16
          Top = 47
          Width = 81
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 1
          OnKeyPress = prp_vip_Oblast_ComboBoxKeyPress
        end
        object prp_vip_Oblast_TextEdit: TcxTextEdit
          Left = 104
          Top = 47
          Width = 145
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 35
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 2
          OnKeyPress = prp_vip_Oblast_TextEditKeyPress
        end
        object prp_vip_Index_TextEdit: TcxCurrencyEdit
          Left = 336
          Top = 112
          Width = 97
          Height = 21
          BeepOnEnter = False
          EditValue = 0c
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = '0;'
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 6
          OnKeyPress = prp_vip_Index_TextEditKeyPress
        end
        object prp_vip_Rayon_TextEdit: TcxTextEdit
          Left = 104
          Top = 80
          Width = 145
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 35
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 3
          OnKeyPress = prp_vip_Rayon_TextEditKeyPress
        end
        object prp_vip_Gorod_TextEdit: TcxTextEdit
          Left = 104
          Top = 112
          Width = 145
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 35
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 5
          OnKeyPress = prp_vip_Gorod_TextEditKeyPress
        end
        object prp_vip_Selo_TextEdit: TcxTextEdit
          Left = 104
          Top = 144
          Width = 145
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 35
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 7
          OnKeyPress = prp_vip_Selo_TextEditKeyPress
        end
        object prp_vip_DateIncome: TcxDateEdit
          Left = 104
          Top = 216
          Width = 89
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 11
          OnKeyPress = prp_vip_DateIncomeKeyPress
        end
        object prp_vip_ToDonezk_CheckBox: TcxCheckBox
          Left = 252
          Top = 217
          Width = 189
          Height = 21
          ParentColor = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1042#1080#1073#1091#1074' '#1091' '#1044#1086#1085#1077#1094#1100#1082
          Style.BorderStyle = ebsUltraFlat
          Style.Color = clBtnFace
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          TabOrder = 12
          OnClick = prp_vip_ToDonezk_CheckBoxClick
          OnKeyPress = prp_vip_ToDonezk_CheckBoxKeyPress
        end
        object cxGroupBox4: TcxGroupBox
          Left = 2
          Top = 336
          Width = 445
          Height = 45
          Align = alBottom
          Alignment = alTopLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LookAndFeel.NativeStyle = False
          ParentFont = False
          TabOrder = 14
          TabStop = False
          Visible = False
          DesignSize = (
            445
            45)
          object prp_vip_OkButton: TcxButton
            Left = 369
            Top = 15
            Width = 86
            Height = 26
            Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1090#1077#1082#1091#1097#1077#1081' '#1074#1082#1083#1072#1076#1082#1080
            Anchors = [akRight, akBottom]
            Caption = #1055#1088#1080#1085#1103#1090#1100
            TabOrder = 0
            OnClick = prp_vip_OkButtonClick
            LookAndFeel.NativeStyle = True
          end
        end
        object prp_vip_GorodSeloPGT_ComboBox: TcxComboBox
          Left = 16
          Top = 111
          Width = 81
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 4
          OnKeyPress = prp_vip_GorodSeloPGT_ComboBoxKeyPress
        end
        object vip_Donezk_GroupBox: TcxGroupBox
          Left = 2
          Top = 245
          Width = 445
          Height = 91
          Align = alBottom
          Alignment = alTopCenter
          Caption = #1044#1086#1085#1077#1094#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LookAndFeel.NativeStyle = True
          ParentFont = False
          TabOrder = 13
          TabStop = False
          Visible = False
          object vip_don_Rayon_Label: TLabel
            Left = 8
            Top = 26
            Width = 31
            Height = 13
            Caption = #1056#1072#1081#1086#1085
          end
          object vip_don_Street_Label: TLabel
            Left = 8
            Top = 58
            Width = 32
            Height = 13
            Caption = #1059#1083#1080#1094#1072
          end
          object vip_don_Home_Label: TLabel
            Left = 252
            Top = 26
            Width = 23
            Height = 13
            Caption = #1044#1086#1084
          end
          object vip_don_Room_Label: TLabel
            Left = 324
            Top = 26
            Width = 48
            Height = 13
            Caption = #1050#1074#1072#1088#1090#1080#1088#1072
          end
          object prp_vip_RAJ_D_TextEdit: TcxTextEdit
            Left = 48
            Top = 22
            Width = 145
            Height = 21
            AutoSize = False
            BeepOnEnter = False
            Properties.CharCase = ecUpperCase
            Properties.MaxLength = 35
            Style.Color = clInfoBk
            Style.LookAndFeel.NativeStyle = True
            TabOrder = 0
            OnKeyPress = prp_vip_RAJ_D_TextEditKeyPress
          end
          object prp_vip_STREET_D_TextEdit: TcxTextEdit
            Left = 48
            Top = 55
            Width = 145
            Height = 21
            AutoSize = False
            BeepOnEnter = False
            Properties.CharCase = ecUpperCase
            Properties.MaxLength = 35
            Style.Color = clInfoBk
            Style.LookAndFeel.NativeStyle = True
            TabOrder = 3
            OnKeyPress = prp_vip_STREET_D_TextEditKeyPress
          end
          object prp_vip_HOUSE_D_TextEdit: TcxTextEdit
            Left = 279
            Top = 22
            Width = 41
            Height = 21
            AutoSize = False
            BeepOnEnter = False
            Properties.MaxLength = 35
            Style.Color = clInfoBk
            Style.LookAndFeel.NativeStyle = True
            TabOrder = 1
            OnKeyPress = prp_vip_HOUSE_D_TextEditKeyPress
          end
          object prp_vip_KVART_D_TextEdit: TcxTextEdit
            Left = 375
            Top = 22
            Width = 57
            Height = 21
            AutoSize = False
            BeepOnEnter = False
            Properties.MaxLength = 35
            Style.Color = clInfoBk
            Style.LookAndFeel.NativeStyle = True
            TabOrder = 2
            OnKeyPress = prp_vip_KVART_D_TextEditKeyPress
          end
        end
        object prp_vip_street_TextEdit: TcxTextEdit
          Left = 104
          Top = 171
          Width = 145
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 35
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 8
          OnKeyPress = prp_vip_street_TextEditKeyPress
        end
        object prp_vip_house_TextEdit: TcxTextEdit
          Left = 297
          Top = 171
          Width = 41
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.MaxLength = 5
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 9
          OnKeyPress = prp_vip_house_TextEditKeyPress
        end
        object prp_vip_kvartira_TextEdit: TcxTextEdit
          Left = 392
          Top = 171
          Width = 49
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.MaxLength = 6
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 10
          OnKeyPress = prp_vip_kvartira_TextEditKeyPress
        end
      end
    end
    object prp_Vip_Dopolnenie_Sheet: TcxTabSheet
      Caption = #1044#1086#1087#1086#1083#1085#1077#1085#1080#1077'   '
      ImageIndex = 15
      ParentShowHint = False
      ShowHint = False
      TabVisible = False
      object prp_vip_dp_GroupBox: TcxGroupBox
        Left = 0
        Top = 0
        Width = 449
        Height = 383
        Align = alClient
        Alignment = alTopLeft
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1074#1099#1087#1080#1089#1082#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LookAndFeel.NativeStyle = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TabStop = False
        object vip_add_BasePereezdReson_Label: TLabel
          Left = 8
          Top = 28
          Width = 145
          Height = 13
          Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1087#1088#1080#1095#1080#1085#1072' '#1087#1077#1088#1077#1077#1079#1076#1072
        end
        object vip_add_GdeRabotal_Label: TLabel
          Left = 8
          Top = 52
          Width = 62
          Height = 13
          Caption = #1043#1076#1077' '#1088#1072#1073#1086#1090#1072#1083
        end
        object vip_add_Dolgnost_Label: TLabel
          Left = 8
          Top = 76
          Width = 58
          Height = 13
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        end
        object vip_add_Obrazovanie_Label: TLabel
          Left = 8
          Top = 100
          Width = 68
          Height = 13
          Caption = #1054#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077
        end
        object vip_add_U4Stepen_Label: TLabel
          Left = 8
          Top = 124
          Width = 81
          Height = 13
          Caption = #1059#1095#1077#1085#1072#1103' '#1089#1090#1077#1087#1077#1085#1100
        end
        object prp_vip_ResonPereezd_ComboBox: TcxComboBox
          Left = 160
          Top = 23
          Width = 273
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 0
          OnKeyPress = prp_vip_ResonPereezd_ComboBoxKeyPress
        end
        object prp_vip_Osvita_ComboBox: TcxComboBox
          Left = 160
          Top = 95
          Width = 273
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 3
          OnKeyPress = prp_vip_Osvita_ComboBoxKeyPress
        end
        object prp_vip_UchStepen_ComboBox: TcxComboBox
          Left = 160
          Top = 119
          Width = 273
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 4
          OnKeyPress = prp_vip_UchStepen_ComboBoxKeyPress
        end
        object prp_vip_GdeRabotal_TextEdit: TcxTextEdit
          Left = 160
          Top = 48
          Width = 273
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.MaxLength = 40
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 1
          OnKeyPress = prp_vip_GdeRabotal_TextEditKeyPress
        end
        object prp_vip_KemRabotal_TextEdit: TcxTextEdit
          Left = 160
          Top = 72
          Width = 273
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.MaxLength = 35
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 2
          OnKeyPress = prp_vip_KemRabotal_TextEditKeyPress
        end
        object cxGroupBox6: TcxGroupBox
          Left = 2
          Top = 336
          Width = 445
          Height = 45
          Align = alBottom
          Alignment = alTopLeft
          LookAndFeel.NativeStyle = False
          TabOrder = 5
          TabStop = False
          Visible = False
          DesignSize = (
            445
            45)
          object prp_vip_dp_OkButton: TcxButton
            Left = 353
            Top = 15
            Width = 86
            Height = 26
            Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1090#1077#1082#1091#1097#1077#1081' '#1074#1082#1083#1072#1076#1082#1080
            Anchors = [akRight, akBottom]
            Caption = #1055#1088#1080#1085#1103#1090#1100
            TabOrder = 0
            OnClick = prp_vip_dp_OkButtonClick
            LookAndFeel.NativeStyle = True
          end
        end
      end
    end
    object prp_BornPlace_Sheet: TcxTabSheet
      Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076'.  '
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = False
      OnExit = prp_BornPlace_SheetExit
      object prp_BornPlace_GroupBox: TcxGroupBox
        Left = 0
        Top = 0
        Width = 449
        Height = 383
        Align = alClient
        Alignment = alTopLeft
        Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LookAndFeel.NativeStyle = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TabStop = False
        object prp_Country_Label: TLabel
          Left = 16
          Top = 28
          Width = 36
          Height = 13
          Caption = #1057#1090#1088#1072#1085#1072
        end
        object prp_Rayon_Label: TLabel
          Left = 16
          Top = 92
          Width = 31
          Height = 13
          Caption = #1056#1072#1081#1086#1085
        end
        object prp_Selo_Label: TLabel
          Left = 16
          Top = 156
          Width = 25
          Height = 13
          Caption = #1057#1077#1083#1086
        end
        object prp_Index_Label: TLabel
          Left = 264
          Top = 124
          Width = 38
          Height = 13
          Caption = #1048#1085#1076#1077#1082#1089
        end
        object prp_mg_Country_TextEdit: TcxTextEdit
          Left = 56
          Top = 24
          Width = 169
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Properties.ReadOnly = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 0
          OnKeyPress = prp_mg_Country_TextEditKeyPress
        end
        object prp_mg_Oblast_ComboBox: TcxComboBox
          Left = 16
          Top = 55
          Width = 81
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 1
          OnKeyPress = prp_mg_Oblast_ComboBoxKeyPress
        end
        object prp_mg_Oblast_TextEdit: TcxTextEdit
          Left = 104
          Top = 55
          Width = 169
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Properties.ReadOnly = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 2
          OnKeyPress = prp_mg_Oblast_TextEditKeyPress
        end
        object prp_mg_Rayon_TextEdit: TcxTextEdit
          Left = 104
          Top = 88
          Width = 169
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 30
          Properties.ReadOnly = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 3
          OnKeyPress = prp_mg_Rayon_TextEditKeyPress
        end
        object prp_mg_Selo_TextEdit: TcxTextEdit
          Left = 104
          Top = 152
          Width = 145
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Properties.ReadOnly = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 7
          OnKeyPress = prp_mg_Selo_TextEditKeyPress
        end
        object prp_mg_Index_TextEdit: TcxCurrencyEdit
          Left = 312
          Top = 120
          Width = 97
          Height = 21
          BeepOnEnter = False
          EditValue = 0c
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = '0;'
          Properties.ReadOnly = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 6
          OnKeyPress = prp_mg_Index_TextEditKeyPress
        end
        object prp_mg_GroupBox: TcxGroupBox
          Left = 2
          Top = 336
          Width = 445
          Height = 45
          Align = alBottom
          Alignment = alTopLeft
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          TabOrder = 8
          TabStop = False
          Visible = False
          DesignSize = (
            445
            45)
          object prp_mg_OkButton: TcxButton
            Left = 353
            Top = 15
            Width = 86
            Height = 26
            Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1090#1077#1082#1091#1097#1077#1081' '#1074#1082#1083#1072#1076#1082#1080
            Anchors = [akRight, akBottom]
            Caption = #1055#1088#1080#1085#1103#1090#1100
            TabOrder = 0
            OnClick = prp_mg_OkButtonClick
            LookAndFeel.NativeStyle = True
          end
        end
        object prp_mg_Gorod_TextEdit: TcxTextEdit
          Left = 104
          Top = 120
          Width = 145
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Properties.ReadOnly = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 5
          OnKeyPress = prp_mg_Gorod_TextEditKeyPress
        end
        object prp_mg_GorodSeloPGT_ComboBox: TcxComboBox
          Left = 16
          Top = 119
          Width = 81
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 4
          OnKeyPress = prp_mg_GorodSeloPGT_ComboBoxKeyPress
        end
      end
    end
    object prp_Propiska_Sheet: TcxTabSheet
      Caption = #1055#1088#1086#1087#1080#1089#1082#1072'      '
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = False
      OnExit = prp_Propiska_SheetExit
      object prp_Propiska_GroupBox: TcxGroupBox
        Left = 0
        Top = 0
        Width = 449
        Height = 383
        Align = alClient
        Alignment = alTopLeft
        Caption = #1041#1099#1083' '#1087#1088#1086#1087#1080#1089#1072#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LookAndFeel.NativeStyle = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TabStop = False
        object prp_Strana_Label: TLabel
          Left = 16
          Top = 20
          Width = 36
          Height = 13
          Caption = #1057#1090#1088#1072#1085#1072
        end
        object IndexLabel: TLabel
          Left = 296
          Top = 98
          Width = 38
          Height = 13
          Caption = #1048#1085#1076#1077#1082#1089
        end
        object RayonLabel: TLabel
          Left = 16
          Top = 72
          Width = 31
          Height = 13
          Caption = #1056#1072#1081#1086#1085
        end
        object prp_Selo_Label2: TLabel
          Left = 16
          Top = 124
          Width = 25
          Height = 13
          Caption = #1057#1077#1083#1086
        end
        object Label10: TLabel
          Left = 16
          Top = 151
          Width = 32
          Height = 13
          Caption = #1059#1083#1080#1094#1072
        end
        object Home_Label2: TLabel
          Left = 254
          Top = 151
          Width = 23
          Height = 13
          Caption = #1044#1086#1084
        end
        object RoomLabel2: TLabel
          Left = 326
          Top = 151
          Width = 48
          Height = 13
          Caption = #1050#1074#1072#1088#1090#1080#1088#1072
        end
        object Date_Income_Label: TLabel
          Left = 256
          Top = 178
          Width = 78
          Height = 13
          Caption = #1044#1072#1090#1072' '#1087#1088#1080#1073#1099#1090#1080#1103
        end
        object prp_prp_Country_TextEdit: TcxTextEdit
          Left = 56
          Top = 16
          Width = 169
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 0
          OnKeyPress = prp_prp_Country_TextEditKeyPress
        end
        object prp_prp_Oblast_ComboBox: TcxComboBox
          Left = 16
          Top = 42
          Width = 81
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 1
          OnKeyPress = prp_prp_Oblast_ComboBoxKeyPress
        end
        object prp_prp_Oblast_TextEdit: TcxTextEdit
          Left = 104
          Top = 42
          Width = 169
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 2
          OnKeyPress = prp_prp_Oblast_TextEditKeyPress
        end
        object prp_prp_Index_TextEdit: TcxCurrencyEdit
          Left = 344
          Top = 94
          Width = 89
          Height = 21
          BeepOnEnter = False
          EditValue = 0c
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = '0;'
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 6
          OnKeyPress = prp_prp_Index_TextEditKeyPress
        end
        object prp_prp_Rayon_TextEdit: TcxTextEdit
          Left = 104
          Top = 68
          Width = 169
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 30
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 3
          OnKeyPress = prp_prp_Rayon_TextEditKeyPress
        end
        object prp_prp_Gorod_TextEdit: TcxTextEdit
          Left = 104
          Top = 94
          Width = 145
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 5
          OnKeyPress = prp_prp_Gorod_TextEditKeyPress
        end
        object prp_prp_Selo_TextEdit: TcxTextEdit
          Left = 104
          Top = 120
          Width = 145
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 7
          OnKeyPress = prp_prp_Selo_TextEditKeyPress
        end
        object prp_prp_Street_TextEdit: TcxTextEdit
          Left = 104
          Top = 147
          Width = 145
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 35
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 8
          OnKeyPress = prp_prp_Street_TextEditKeyPress
        end
        object prp_prp_HouseNumber_TextEdit: TcxTextEdit
          Left = 281
          Top = 147
          Width = 41
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.MaxLength = 5
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 9
          OnKeyPress = prp_prp_HouseNumber_TextEditKeyPress
        end
        object prp_prp_KvartNumber_TextEdit: TcxTextEdit
          Left = 376
          Top = 147
          Width = 57
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.MaxLength = 6
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 10
          OnKeyPress = prp_prp_KvartNumber_TextEditKeyPress
        end
        object prp_prp_DateIncome: TcxDateEdit
          Left = 344
          Top = 174
          Width = 89
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 12
          OnKeyPress = prp_prp_DateIncomeKeyPress
        end
        object prp_prp_FromDonezk_CheckBox: TcxCheckBox
          Left = 10
          Top = 178
          Width = 134
          Height = 21
          ParentColor = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1055#1088#1080#1073#1099#1083' '#1080#1079' '#1044#1086#1085#1077#1094#1082#1072
          Style.BorderStyle = ebsUltraFlat
          Style.Color = clBtnFace
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          TabOrder = 13
          OnClick = prp_prp_FromDonezk_CheckBoxClick
          OnKeyPress = prp_prp_FromDonezk_CheckBoxKeyPress
        end
        object prp_CurrentPropiska_GroupBox: TcxGroupBox
          Left = 2
          Top = 219
          Width = 445
          Height = 117
          Align = alBottom
          Alignment = alTopCenter
          Caption = #1058#1077#1082#1091#1097#1072#1103' '#1087#1088#1086#1087#1080#1089#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LookAndFeel.NativeStyle = True
          ParentFont = False
          TabOrder = 14
          object BegPropiLabel: TLabel
            Left = 8
            Top = 24
            Width = 88
            Height = 13
            Caption = #1053#1072#1095#1072#1083#1086' '#1087#1088#1086#1087#1080#1089#1082#1080
          end
          object EndPropiLabel: TLabel
            Left = 8
            Top = 48
            Width = 106
            Height = 13
            Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1087#1088#1086#1087#1080#1089#1082#1080
          end
          object AdresPropiLabel: TLabel
            Left = 8
            Top = 71
            Width = 82
            Height = 13
            Caption = #1040#1076#1088#1077#1089' '#1087#1088#1086#1087#1080#1089#1082#1080
          end
          object prp_prp_DateBegPropi: TcxDateEdit
            Left = 120
            Top = 20
            Width = 89
            Height = 21
            BeepOnEnter = False
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.Color = clInfoBk
            Style.LookAndFeel.NativeStyle = True
            TabOrder = 0
            OnKeyPress = prp_prp_DateBegPropiKeyPress
          end
          object prp_prp_DateEndPropi: TcxDateEdit
            Left = 120
            Top = 48
            Width = 89
            Height = 21
            BeepOnEnter = False
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.Color = clInfoBk
            Style.LookAndFeel.NativeStyle = True
            TabOrder = 1
            OnKeyPress = prp_prp_DateEndPropiKeyPress
          end
          object prp_AdresPropi_Edit: TcxButtonEdit
            Left = 4
            Top = 86
            Width = 428
            Height = 21
            AutoSize = False
            BeepOnEnter = False
            ParentFont = False
            Properties.Buttons = <
              item
                Default = True
              end>
            Properties.ReadOnly = True
            Properties.OnButtonClick = prp_AdresPropi_EditPropertiesButtonClick
            Style.Color = clInfoBk
            Style.LookAndFeel.NativeStyle = True
            Style.ButtonTransparency = ebtNone
            TabOrder = 3
            OnKeyPress = prp_AdresPropi_EditKeyPress
          end
          object ckbxProdlitPropi: TcxCheckBox
            Left = 256
            Top = 48
            Width = 177
            Height = 21
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1055#1088#1080#1084#1091#1089#1086#1074#1077' '#1087#1088#1086#1076#1086#1074#1078#1077#1085#1085#1103
            TabOrder = 2
            OnClick = ckbxProdlitPropiClick
          end
        end
        object prp_prp_GroupBox: TcxGroupBox
          Left = 2
          Top = 336
          Width = 445
          Height = 45
          Align = alBottom
          Alignment = alTopLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LookAndFeel.NativeStyle = False
          ParentFont = False
          TabOrder = 15
          TabStop = False
          Visible = False
          DesignSize = (
            445
            45)
          object prp_prp_OkButton: TcxButton
            Left = 344
            Top = 15
            Width = 86
            Height = 26
            Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1090#1077#1082#1091#1097#1077#1081' '#1074#1082#1083#1072#1076#1082#1080
            Anchors = [akRight, akBottom]
            Caption = #1055#1088#1080#1085#1103#1090#1100
            TabOrder = 0
            OnClick = prp_prp_OkButtonClick
            LookAndFeel.NativeStyle = True
          end
        end
        object prp_prp_GorodSeloPGT_ComboBox: TcxComboBox
          Left = 16
          Top = 93
          Width = 81
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 4
          OnKeyPress = prp_prp_GorodSeloPGT_ComboBoxKeyPress
        end
        object Donezk_GroupBox: TcxGroupBox
          Left = 2
          Top = 153
          Width = 445
          Height = 66
          Align = alBottom
          Alignment = alTopCenter
          Caption = #1044#1086#1085#1077#1094#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LookAndFeel.NativeStyle = True
          ParentFont = False
          TabOrder = 11
          TabStop = False
          Visible = False
          object RayonDonLabel: TLabel
            Left = 8
            Top = 18
            Width = 31
            Height = 13
            Caption = #1056#1072#1081#1086#1085
          end
          object StrretDonLabel: TLabel
            Left = 8
            Top = 42
            Width = 32
            Height = 13
            Caption = #1059#1083#1080#1094#1072
          end
          object HomeDonLabel: TLabel
            Left = 252
            Top = 18
            Width = 23
            Height = 13
            Caption = #1044#1086#1084
          end
          object RoomDonLabel: TLabel
            Left = 324
            Top = 18
            Width = 48
            Height = 13
            Caption = #1050#1074#1072#1088#1090#1080#1088#1072
          end
          object DateIncomeDonLabel: TLabel
            Left = 254
            Top = 42
            Width = 78
            Height = 13
            Caption = #1044#1072#1090#1072' '#1087#1088#1080#1073#1099#1090#1080#1103
          end
          object prp_prp_RAJ_D_TextEdit: TcxTextEdit
            Left = 48
            Top = 14
            Width = 145
            Height = 21
            AutoSize = False
            BeepOnEnter = False
            Properties.CharCase = ecUpperCase
            Properties.MaxLength = 35
            Style.Color = clInfoBk
            Style.LookAndFeel.NativeStyle = True
            TabOrder = 0
            OnKeyPress = prp_prp_RAJ_D_TextEditKeyPress
          end
          object prp_prp_STREET_D_TextEdit: TcxTextEdit
            Left = 48
            Top = 39
            Width = 145
            Height = 21
            AutoSize = False
            BeepOnEnter = False
            Properties.CharCase = ecUpperCase
            Properties.MaxLength = 20
            Style.Color = clInfoBk
            Style.LookAndFeel.NativeStyle = True
            TabOrder = 3
            OnKeyPress = prp_prp_STREET_D_TextEditKeyPress
          end
          object prp_prp_HOUSE_D_TextEdit: TcxTextEdit
            Left = 279
            Top = 14
            Width = 41
            Height = 21
            AutoSize = False
            BeepOnEnter = False
            Properties.MaxLength = 5
            Style.Color = clInfoBk
            Style.LookAndFeel.NativeStyle = True
            TabOrder = 1
            OnKeyPress = prp_prp_HOUSE_D_TextEditKeyPress
          end
          object prp_prp_KVART_D_TextEdit: TcxTextEdit
            Left = 375
            Top = 14
            Width = 57
            Height = 21
            AutoSize = False
            BeepOnEnter = False
            Properties.MaxLength = 6
            Style.Color = clInfoBk
            Style.LookAndFeel.NativeStyle = True
            TabOrder = 2
            OnKeyPress = prp_prp_KVART_D_TextEditKeyPress
          end
          object prp_prp_DATE_PRIB_DateEdit: TcxDateEdit
            Left = 342
            Top = 39
            Width = 89
            Height = 21
            BeepOnEnter = False
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.Color = clInfoBk
            Style.LookAndFeel.NativeStyle = True
            TabOrder = 4
            OnKeyPress = prp_prp_DATE_PRIB_DateEditKeyPress
          end
        end
      end
    end
    object prp_Additional_Sheet: TcxTabSheet
      Caption = #1044#1086#1087#1086#1083#1085#1077#1085#1080#1077'   '
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = False
      object prp_Adittional_GroupBox: TcxGroupBox
        Left = 0
        Top = 0
        Width = 449
        Height = 383
        Align = alClient
        Alignment = alTopLeft
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LookAndFeel.NativeStyle = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TabStop = False
        object MestoYbitiya_Label: TLabel
          Left = 8
          Top = 28
          Width = 143
          Height = 13
          Caption = #1055#1088#1086#1078#1080#1074#1072#1083' '#1074' '#1084#1077#1089#1090#1077' '#1091#1073#1099#1090#1080#1103' '#1089
        end
        object Label2: TLabel
          Left = 230
          Top = 28
          Width = 23
          Height = 13
          Caption = #1075#1086#1076#1072
        end
        object BaseResonPriezd_Label: TLabel
          Left = 8
          Top = 52
          Width = 139
          Height = 13
          Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1087#1088#1080#1095#1080#1085#1072' '#1087#1088#1080#1077#1079#1076#1072
        end
        object Srok_Label: TLabel
          Left = 162
          Top = 52
          Width = 74
          Height = 13
          Caption = #1053#1072' '#1082#1072#1082#1086#1081' '#1089#1088#1086#1082
        end
        object BaseResonPereezd_Label: TLabel
          Left = 8
          Top = 108
          Width = 145
          Height = 13
          Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1087#1088#1080#1095#1080#1085#1072' '#1087#1077#1088#1077#1077#1079#1076#1072
        end
        object GdeRabotal_Label: TLabel
          Left = 8
          Top = 132
          Width = 62
          Height = 13
          Caption = #1043#1076#1077' '#1088#1072#1073#1086#1090#1072#1083
        end
        object prp_dp_Dolgnost_Label: TLabel
          Left = 8
          Top = 156
          Width = 58
          Height = 13
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        end
        object Obrazovanie_Label: TLabel
          Left = 8
          Top = 204
          Width = 68
          Height = 13
          Caption = #1054#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077
        end
        object U4Stepen_Label: TLabel
          Left = 8
          Top = 228
          Width = 81
          Height = 13
          Caption = #1059#1095#1077#1085#1072#1103' '#1089#1090#1077#1087#1077#1085#1100
        end
        object Label20: TLabel
          Left = 0
          Top = 324
          Width = 78
          Height = 13
          Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
          Visible = False
        end
        object Gragdanstvo_Label: TLabel
          Left = 8
          Top = 252
          Width = 67
          Height = 13
          Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
        end
        object Nazionalnost_Label: TLabel
          Left = 8
          Top = 276
          Width = 85
          Height = 13
          Caption = #1053#1072#1094#1080#1086#1085#1072#1083#1100#1085#1086#1089#1090#1100
        end
        object DomPhone_Label: TLabel
          Left = 8
          Top = 300
          Width = 69
          Height = 13
          Caption = #1044#1086#1084'.'#1090#1077#1083#1077#1092#1086#1085
        end
        object IfNotWork_Label: TLabel
          Left = 8
          Top = 180
          Width = 83
          Height = 13
          Caption = #1077#1089#1083#1080' '#1085#1077' '#1088#1072#1073#1086#1090#1072#1083
        end
        object prp_dp_Srok_ComboBox: TcxComboBox
          Left = 160
          Top = 72
          Width = 97
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.Items.Strings = (
            '1 '#1075#1086#1076' '#1080' '#1084#1077#1085#1077#1077
            #1073#1086#1083#1077#1077' 1 '#1075#1086#1076#1072)
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 2
          OnKeyPress = prp_dp_Srok_ComboBoxKeyPress
        end
        object prp_dp_ResonPereezd_ComboBox: TcxComboBox
          Left = 160
          Top = 103
          Width = 273
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 3
          OnKeyPress = prp_dp_ResonPereezd_ComboBoxKeyPress
        end
        object prp_dp_Osvita_ComboBox: TcxComboBox
          Left = 160
          Top = 199
          Width = 273
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 7
          OnKeyPress = prp_dp_Osvita_ComboBoxKeyPress
        end
        object prp_dp_UchStepen_ComboBox: TcxComboBox
          Left = 160
          Top = 223
          Width = 273
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 8
          OnKeyPress = prp_dp_UchStepen_ComboBoxKeyPress
        end
        object prp_dp_GdeRabotal_TextEdit: TcxTextEdit
          Left = 160
          Top = 128
          Width = 161
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.MaxLength = 20
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 4
          OnExit = prp_dp_GdeRabotal_TextEditExit
          OnKeyPress = prp_dp_GdeRabotal_TextEditKeyPress
        end
        object prp_dp_Nazionalnost_TextEdit: TcxTextEdit
          Left = 160
          Top = 272
          Width = 113
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.MaxLength = 20
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 10
          OnKeyPress = prp_dp_Nazionalnost_TextEditKeyPress
        end
        object prp_dp_KemRabotal_TextEdit: TcxTextEdit
          Left = 160
          Top = 152
          Width = 273
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.MaxLength = 40
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 5
          OnKeyPress = prp_dp_KemRabotal_TextEditKeyPress
        end
        object prp_dp_Specialnost_TextEdit: TcxTextEdit
          Left = 152
          Top = 320
          Width = 273
          Height = 21
          TabStop = False
          AutoSize = False
          BeepOnEnter = False
          Properties.MaxLength = 35
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 12
          Visible = False
          OnKeyPress = prp_dp_Specialnost_TextEditKeyPress
        end
        object prp_dp_Gragdanstvo_TextEdit: TcxTextEdit
          Left = 160
          Top = 248
          Width = 113
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 30
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 9
          OnKeyPress = prp_dp_Gragdanstvo_TextEditKeyPress
        end
        object prp_dp_GroupBox: TcxGroupBox
          Left = 2
          Top = 336
          Width = 445
          Height = 45
          Align = alBottom
          Alignment = alTopLeft
          LookAndFeel.NativeStyle = False
          TabOrder = 13
          TabStop = False
          Visible = False
          DesignSize = (
            445
            45)
          object prp_dp_OkButton: TcxButton
            Left = 344
            Top = 15
            Width = 86
            Height = 26
            Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1090#1077#1082#1091#1097#1077#1081' '#1074#1082#1083#1072#1076#1082#1080
            Anchors = [akRight, akBottom]
            Caption = #1055#1088#1080#1085#1103#1090#1100
            TabOrder = 0
            OnClick = prp_dp_OkButtonClick
            LookAndFeel.NativeStyle = True
          end
        end
        object prp_dp_DateMestoUbitiya: TcxTextEdit
          Left = 160
          Top = 26
          Width = 63
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.MaxLength = 35
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 0
          OnKeyPress = prp_dp_DateMestoUbitiyaKeyPress
        end
        object prp_dp_ResonPriezd_ComboBox: TcxComboBox
          Left = 8
          Top = 71
          Width = 145
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.Items.Strings = (
            #1055#1086#1089#1090#1086#1103#1085#1085#1086#1077' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1077
            #1042#1088#1077#1084#1077#1085#1085#1086#1077' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1077)
          Properties.ReadOnly = False
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 1
          OnKeyPress = prp_dp_ResonPriezd_ComboBoxKeyPress
        end
        object prp_dp_DomTelefon_MaskEdit: TcxTextEdit
          Left = 160
          Top = 296
          Width = 113
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.MaxLength = 16
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 11
          OnKeyPress = prp_dp_DomTelefon_MaskEditKeyPress
        end
        object prp_dp_Dolgnost_ComboBox: TcxComboBox
          Left = 160
          Top = 175
          Width = 273
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.ReadOnly = False
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 6
          OnKeyDown = prp_dp_Dolgnost_ComboBoxKeyDown
          OnKeyPress = prp_dp_Dolgnost_ComboBoxKeyPress
        end
      end
    end
    object prp_Warrior_Sheet: TcxTabSheet
      Caption = #1042#1086#1080#1085#1089#1082#1080#1081' '#1091#1095#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 4
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      object prp_Warrior_GroupBox: TcxGroupBox
        Left = 0
        Top = 0
        Width = 449
        Height = 383
        Align = alClient
        Alignment = alTopLeft
        Caption = #1042#1086#1080#1085#1089#1082#1080#1081' '#1091#1095#1077#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LookAndFeel.NativeStyle = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TabStop = False
        object FromRVK_Label: TLabel
          Left = 10
          Top = 28
          Width = 156
          Height = 13
          Caption = #1048#1079' '#1082#1072#1082#1086#1075#1086' '#1056#1042#1050' '#1087#1088#1080#1073#1099#1083' '#1085#1072' '#1091#1095#1077#1090
        end
        object Postavlen_Label: TLabel
          Left = 10
          Top = 82
          Width = 145
          Height = 13
          Caption = #1055#1086#1089#1090#1072#1074#1083#1077#1085' '#1085#1072' '#1074#1086#1080#1085#1089#1082#1080#1081' '#1091#1095#1077#1090
        end
        object Snyat_Label: TLabel
          Left = 10
          Top = 113
          Width = 119
          Height = 13
          Caption = #1057#1085#1103#1090' '#1089' '#1074#1086#1080#1085#1089#1082#1086#1075#1086' '#1091#1095#1077#1090#1072
        end
        object Notes_Label: TLabel
          Left = 10
          Top = 140
          Width = 63
          Height = 13
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        end
        object prp_vu_FromRVK_TextEdit: TcxTextEdit
          Left = 8
          Top = 48
          Width = 305
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 50
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 0
          OnKeyPress = prp_vu_FromRVK_TextEditKeyPress
        end
        object prp_vu_PostavlenDate: TcxDateEdit
          Left = 216
          Top = 79
          Width = 97
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.ShowTime = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 1
          OnKeyPress = prp_vu_PostavlenDateKeyPress
        end
        object prp_vu_SnyatDate: TcxDateEdit
          Left = 216
          Top = 109
          Width = 97
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.ShowTime = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 2
          OnKeyPress = prp_vu_SnyatDateKeyPress
        end
        object prp_vu_Notes: TcxTextEdit
          Left = 8
          Top = 160
          Width = 249
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.MaxLength = 40
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 3
          OnKeyPress = prp_vu_NotesKeyPress
        end
        object prp_vu_GroupBox: TcxGroupBox
          Left = 2
          Top = 336
          Width = 445
          Height = 45
          Align = alBottom
          Alignment = alTopLeft
          LookAndFeel.NativeStyle = False
          TabOrder = 4
          TabStop = False
          Visible = False
          DesignSize = (
            445
            45)
          object prp_vu_OkButton: TcxButton
            Left = 353
            Top = 15
            Width = 86
            Height = 26
            Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1090#1077#1082#1091#1097#1077#1081' '#1074#1082#1083#1072#1076#1082#1080
            Anchors = [akRight, akBottom]
            Caption = #1055#1088#1080#1085#1103#1090#1100
            TabOrder = 0
            OnClick = prp_vu_OkButtonClick
            LookAndFeel.NativeStyle = True
          end
        end
      end
    end
    object prp_MultiPass_Sheet: TcxTabSheet
      Caption = #1055#1072#1089#1087#1086#1088#1090'       '
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = False
      object prp_MultiPass_GroupBox: TcxGroupBox
        Left = 0
        Top = 0
        Width = 449
        Height = 383
        Align = alClient
        Alignment = alTopLeft
        Caption = #1055#1072#1089#1087#1086#1088#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LookAndFeel.NativeStyle = True
        ParentFont = False
        TabOrder = 0
        TabStop = False
        object prp_PassGroupBox: TcxGroupBox
          Left = 2
          Top = 15
          Width = 445
          Height = 226
          Align = alTop
          Alignment = alTopCenter
          Caption = #1048#1089#1090#1086#1088#1080#1103' '#1087#1072#1089#1087#1086#1088#1090#1086#1074
          LookAndFeel.NativeStyle = True
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          TabStop = False
          object prp_pass_AddButton: TSpeedButton
            Left = 422
            Top = 32
            Width = 20
            Height = 22
            Cursor = crHandPoint
            Hint = #1044#1086#1076#1072#1090#1080
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
              A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
              69A46769A46769FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
              9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FF
              B79184FEE9C7F4DAB5F3D5AAF2D0A0EFCB96EFC68BEDC182EBC17FEBC180EBC1
              80F2C782A46769FF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
              CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
              B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
              7FEFC481A46769FF00FFFF00FFFF00FF9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2
              D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
              B7938AFEEFDAF6E0C6F2DABCECD0AEDDC19CD7B78FDBB88BE5BD89E9BD82E9BD
              7FEFC481A46769FF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0D7D7D7C7
              C7C7BDBDBDBFBFBFC4C4C4C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
              BA978FFFF4E5F7E5CFF4E0C5E1CAADBCA589A89275B99E7BDBB88AEBC28AEABF
              81EFC480A46769FF00FFFF00FFFF00FF959595F5F5F5E9E9E9E4E4E4CFCFCFAA
              AAAA969696A3A3A3BEBEBEC8C8C8C4C4C4C5C5C59C9C9CFF00FFFF00FFFF00FF
              C09E95FFFBF0F2E4D7E4D2C0004B00004B00004B00A28C72C4A883DBB78AE5BD
              87EFC583A46769FF00FFFF00FFFF00FF9F9F9FF9F9F9E9E9E9D8D8D881818181
              8181818181919191ADADADBEBEBEC3C3C3C7C7C79C9C9CFF00FFFF00FFFF00FF
              C6A49AFFFFFCE7DED5C1B6A9004B000D9A1A004B0097856EA28C71B99E7AD9B8
              88F2C98CA46769FF00FFFF00FFFF00FF9F9F9FFEFEFEE1E1E1B9B9B9818181A9
              A9A9818181898989919191A2A2A2BDBDBDCCCCCC9C9C9CFF00FFFF00FFFF00FF
              CBA99EFFFFFF004B00004B00004B0016AC2D004B00004B00004B00A89275D7B8
              8FF3CE97A46769FF00FFFF00FFFF00FFA6A6A6FFFFFF818181818181818181B4
              B4B4818181818181818181979797BDBDBDD1D1D19C9C9CFF00FFFF00FFFF00FF
              CFAC9FFFFFFF004B0031DA602BD05423C2441AB43413A525004B00BDA589DEC1
              9AF6D3A0A46769FF00FFFF00FFFF00FFA6A6A6FFFFFF818181D0D0D0CBCBCBC2
              C2C2B9B9B9B0B0B0818181AAAAAAC6C6C6D6D6D69C9C9CFF00FFFF00FFFF00FF
              D4B0A1FFFFFF004B00004B00004B002ED55A004B00004B00004B00E1C9AAEED3
              ADEBCFA4A46769FF00FFFF00FFFF00FFB1B1B1FFFFFF818181818181818181CE
              CECE818181818181818181CECECED7D7D7D3D3D39C9C9CFF00FFFF00FFFF00FF
              D9B5A1FFFFFFFFFFFFFFFFFF004B0034DE65004B00C1B5A8E6D6C1FBEACEDECE
              B4B6AA93A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFF818181D3
              D3D3818181B9B9B9D9D9D9EAEAEAD5D5D5B7B7B79C9C9CFF00FFFF00FFFF00FF
              DDB7A4FFFFFFFFFFFFFFFFFF004B00004B00004B00E9E1D5E7D3C4B68A7BA17B
              6F9C7667A46769FF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFF81818181
              8181818181E2E2E2DEDEDE9999999999999999999C9C9CFF00FFFF00FFFF00FF
              E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
              55E68F31B56D4DFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFDFDFDFCFCFCD6D6D6999999ACACAC9B9B9B969696FF00FFFF00FFFF00FF
              E6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5B88265F8B5
              5CBF7A5CFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
              E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
              6CFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6
              F6F6F6F6F6F6F6F6D7D7D7999999AAAAAAFF00FFFF00FFFF00FFFF00FFFF00FF
              E8C4ADEBCBB7EBCBB7EACBB7EACAB6EACAB6EACAB6EACAB6E3C2B1A56B5FFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
              B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = prp_pass_AddButtonClick
          end
          object prp_pass_DeleteButton: TSpeedButton
            Left = 419
            Top = 80
            Width = 23
            Height = 22
            Cursor = crHandPoint
            Hint = #1042#1080#1076#1072#1083#1080#1090#1080
            Enabled = False
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
              6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
              00006E001DE80010DC00006EFF00FFFF00FFFF00FFFF00FF00006E0004E20008
              E700006EFF00FFFF00FFFF00FFFF00FF6B6B6BA8A8A8A0A0A06B6B6BFF00FFFF
              00FFFF00FFFF00FF6B6B6B9A9A9A9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FF
              00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
              DB00006EFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7AAAAAA9F9F9F6B6B6BFF
              00FFFF00FF6B6B6B9999999E9E9E9797976B6B6BFF00FFFF00FFFF00FFFF00FF
              FF00FF00006E001ADF0020EB0013DC00006E00006E0005E2000BEB0004DA0000
              6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ABABABA2A2A26B
              6B6B6B6B6B9A9A9A9E9E9E9898986B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ACACACA3
              A3A39F9F9F9E9E9E9999996B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00006E001BE30016EB0011EB000ADF00006EFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7A7
              A7A7A3A3A39C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BACACACAC
              ACACA9A9A9A4A4A46B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF00006E062DE30430EB0020E2001EE20027EB0019DF00006EFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB1B1B1B3B3B3AB
              ABABAAAAAAAFAFAFA6A6A66B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
              6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB6B6B6B9B9B9AEAEAE6B
              6B6B6B6B6BA9A9A9B0B0B0A7A7A76B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
              00006E1442E41645EB092ED900006EFF00FFFF00FF00006E0020D9012CEB001F
              E200006EFF00FFFF00FFFF00FFFF00FF6B6B6BBBBBBBBEBEBEAFAFAF6B6B6BFF
              00FFFF00FF6B6B6BA7A7A7B1B1B1AAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FF
              00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
              E400006EFF00FFFF00FFFF00FFFF00FF6B6B6BC0C0C0B5B5B56B6B6BFF00FFFF
              00FFFF00FFFF00FF6B6B6BAAAAAAAEAEAE6B6B6BFF00FFFF00FFFF00FFFF00FF
              FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
              6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = prp_pass_DeleteButtonClick
          end
          object prp_pass_EditButton: TSpeedButton
            Left = 419
            Top = 56
            Width = 23
            Height = 22
            Cursor = crHandPoint
            Hint = #1047#1084#1110#1085#1080#1090#1080
            Enabled = False
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA46769A46769
              A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
              69FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
              9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FFA46769FCEACE
              F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
              69FF00FFFF00FFFF00FF9C9C9CEBEBEBDEDEDECCCCCCB8B8B8B2B2B2BABABABE
              BEBEBFBFBFC1C1C1C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FFA0675BFEEFDA
              F6E0C6302D2D212527374546998468AD926FC2A074DCB27AE7BC7EEFC481A467
              69FF00FFFF00FFFF00FF959595F0F0F0E5E5E5656565585858777777989898A4
              A4A4AEAEAEBBBBBBC1C1C1C6C6C69C9C9CFF00FFFF00FFFF00FFA0675BFFF4E5
              F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
              69FF00FFFF00FFFF00FF959595F5F5F5E9E9E9A4A4A46A6A6A7676766161617E
              7E7E909090A5A5A5B4B4B4C1C1C19C9C9CFF00FFFF00FFFF00FFA7756BFFFBF0
              F8EADCEEDDCA22576C165E82745D657D52545E3F39867258A78C66CEAA73A065
              67FF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE4E4E47D7D7D7F7F7F82828281
              81816666668888889D9D9DB2B2B2999999FF00FFFF00FFFF00FFA7756BFFFFFC
              FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
              5EFF00FFFF00FFFF00FF9F9F9FFEFEFEF3F3F3EEEEEEACACAC949494C4C4C4AD
              ADAD8B8B8B6363638080809393938F8F8FFF00FFFF00FFFF00FFBC8268FFFFFF
              FEF7F2FAEFE6F0E5D56B5D62E9A4A1CF9090B27575875353583C357A69508153
              54FF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3E9E9E97E7E7ED1D1D1C0
              C0C0A8A8A88686866161617F7F7F838383FF00FFFF00FFFF00FFBC8268FFFFFF
              FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
              4EFF00FFFF00FFFF00FFA6A6A6FFFFFFFEFEFEF8F8F8F3F3F3E4E4E48D8D8DCF
              CFCFBFBFBFA9A9A98585856464647B7B7BFF00FFFF00FFFF00FFD1926DFFFFFF
              FFFFFFFFFEFCFEF7F0FAEFE5E1CEC0875958E1A1A1CC8E8EB07474865151633B
              3CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3F3F3DBDBDB88
              8888CECECEBEBEBEA7A7A7848484696969FF00FFFF00FFFF00FFD1926DFFFFFF
              FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
              423E4145FF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3D2
              D2D28B8B8BD2D2D2BCBCBCAAAAAA7979795C5C5CFF00FFFF00FFDA9D75FFFFFF
              FFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFCF3E6CFB5AA976666EFAAA98C6D731E79
              9F0C98BD0C98BDFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F4
              F4F4CBCBCB969696D7D7D7959595919191909090909090FF00FFDA9D75FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
              F0008EDE000F95000081B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFC
              FCFCD6D6D68D8D8D9292929E9E9E9F9F9F9191917474746A6A6AE7AB79FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5A56B5FD1914F068FC10393
              DE0320BA0318B2010B99BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFDBDBDB999999A3A3A38D8D8D928F92878787848484767676E7AB79FBF4F0
              FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
              BF2F45ED1031D3010A95BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6
              F6F6D7D7D7999999AAAAAAFF00FF888888BABABA9C9C9C757575E7AB79D1926D
              D1926DD1926DD1926DD1926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00
              FF2732D00C19B4FF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1
              B1B1B1B1B1999999FF00FFFF00FFFF00FFAAAAAA8C8C8CFF00FF}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = prp_pass_EditButtonClick
          end
          object prp_PasVidan_Label: TLabel
            Left = 72
            Top = 156
            Width = 345
            Height = 23
            AutoSize = False
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
            WordWrap = True
          end
          object prp_DateVidan_Label: TLabel
            Left = 121
            Top = 178
            Width = 3
            Height = 13
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object PassVidan_Label: TLabel
            Left = 6
            Top = 156
            Width = 39
            Height = 13
            Caption = #1042#1099#1076#1072#1085': '
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object DatePass_Label: TLabel
            Left = 6
            Top = 178
            Width = 72
            Height = 13
            Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080': '
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object prp_PaspGrid: TcxGrid
            Left = 6
            Top = 32
            Width = 409
            Height = 117
            TabOrder = 0
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = True
            object prp_PaspGridTableView: TcxGridTableView
              OnDblClick = prp_PaspGridTableViewDblClick
              OnKeyPress = prp_PaspGridTableViewKeyPress
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OnFocusedRecordChanged = prp_PaspGridTableViewFocusedRecordChanged
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnGrouping = False
              OptionsCustomize.ColumnMoving = False
              OptionsCustomize.ColumnSorting = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              Styles.Background = prp_Style_Yellow
              Styles.Content = prp_Style_Yellow
              Styles.Inactive = prp_Style_Silver
              Styles.Selection = prp_Style_Blue
              Styles.Header = prp_Style_Yellow1
              object prp_pass_Type_GridColumn: TcxGridColumn
                Caption = #1058#1080#1087
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 92
              end
              object prp_pass_Fio_GridColumn: TcxGridColumn
                Caption = #1060#1048#1054
                HeaderAlignmentHorz = taCenter
                Width = 208
              end
              object prp_pass_id_Type_GridColumn: TcxGridColumn
                Visible = False
                HeaderAlignmentHorz = taCenter
              end
              object prp_pass_Familiya_GridColumn: TcxGridColumn
                Visible = False
                HeaderAlignmentHorz = taCenter
              end
              object prp_pass_Name_GridColumn: TcxGridColumn
                Visible = False
                HeaderAlignmentHorz = taCenter
              end
              object prp_pass_Otch_GridColumn: TcxGridColumn
                Visible = False
                HeaderAlignmentHorz = taCenter
              end
              object prp_pass_PasVidan_GridColumn: TcxGridColumn
                Visible = False
                HeaderAlignmentHorz = taCenter
              end
              object prp_pass_DateVidan_GridColumn: TcxGridColumn
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.SaveTime = False
                Properties.ShowTime = False
                Visible = False
                HeaderAlignmentHorz = taCenter
              end
              object prp_pass_Seriya_GridColumn: TcxGridColumn
                Caption = #1057#1077#1088#1080#1103
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                HeaderAlignmentHorz = taCenter
                Width = 53
              end
              object prp_pass_Nomer_GridColumn: TcxGridColumn
                Caption = #1053#1086#1084#1077#1088
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taRightJustify
                HeaderAlignmentHorz = taCenter
                Width = 54
              end
              object prp_pass_Osnovanie_GridColumn: TcxGridColumn
                PropertiesClassName = 'TcxTextEditProperties'
                Visible = False
              end
            end
            object cxGridLevel1: TcxGridLevel
              GridView = prp_PaspGridTableView
            end
          end
        end
        object prp_pass_GroupBox: TcxGroupBox
          Left = 2
          Top = 341
          Width = 445
          Height = 40
          Align = alBottom
          Alignment = alLeftTop
          LookAndFeel.NativeStyle = False
          TabOrder = 1
          TabStop = False
          Visible = False
          DesignSize = (
            445
            40)
          object prp_pass_OkButton: TcxButton
            Left = 355
            Top = 10
            Width = 86
            Height = 26
            Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1090#1077#1082#1091#1097#1077#1081' '#1074#1082#1083#1072#1076#1082#1080
            Anchors = [akRight, akBottom]
            Caption = #1055#1088#1080#1085#1103#1090#1100
            TabOrder = 0
            OnClick = prp_pass_OkButtonClick
            LookAndFeel.NativeStyle = True
          end
        end
      end
    end
    object prp_Daddy_Sheet: TcxTabSheet
      Caption = #1054#1090#1077#1094'            '
      ImageIndex = 13
      ParentShowHint = False
      ShowHint = False
      object prp_Daddy_GroupBox: TcxGroupBox
        Left = 0
        Top = 0
        Width = 449
        Height = 383
        Align = alClient
        Alignment = alTopLeft
        Caption = #1054#1090#1077#1094
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LookAndFeel.NativeStyle = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TabStop = False
        object f_Fam_Label: TLabel
          Left = 8
          Top = 19
          Width = 49
          Height = 13
          Caption = #1060#1072#1084#1080#1083#1080#1103
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object f_Name_Label: TLabel
          Left = 8
          Top = 47
          Width = 22
          Height = 13
          Caption = #1048#1084#1103
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object f_Otch_Label: TLabel
          Left = 8
          Top = 76
          Width = 47
          Height = 13
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object f_Work_Label: TLabel
          Left = 8
          Top = 105
          Width = 72
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object f_Posada_Label: TLabel
          Left = 8
          Top = 135
          Width = 58
          Height = 13
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object f_Phone_Label: TLabel
          Left = 8
          Top = 165
          Width = 65
          Height = 13
          Caption = #1056#1072#1073'.'#1090#1077#1083#1077#1092#1086#1085
        end
        object f_Oblast_Label: TLabel
          Left = 8
          Top = 194
          Width = 43
          Height = 13
          Caption = #1054#1073#1083#1072#1089#1090#1100
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object f_Street_Label: TLabel
          Left = 8
          Top = 280
          Width = 32
          Height = 13
          Caption = #1059#1083#1080#1094#1072
        end
        object f_Home_Label: TLabel
          Left = 236
          Top = 280
          Width = 23
          Height = 13
          Caption = #1044#1086#1084
        end
        object f_Room_Label: TLabel
          Left = 316
          Top = 280
          Width = 48
          Height = 13
          Caption = #1050#1074#1072#1088#1090#1080#1088#1072
        end
        object f_Rayon_Label: TLabel
          Left = 8
          Top = 224
          Width = 31
          Height = 13
          Caption = #1056#1072#1081#1086#1085
        end
        object prp_f_Familia_Edit: TcxTextEdit
          Left = 64
          Top = 16
          Width = 153
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 35
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 0
          OnKeyPress = prp_f_Familia_EditKeyPress
        end
        object prp_f_Name_Edit: TcxTextEdit
          Left = 64
          Top = 43
          Width = 97
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 30
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 1
          OnKeyPress = prp_f_Name_EditKeyPress
        end
        object prp_f_Otch_Edit: TcxTextEdit
          Left = 64
          Top = 72
          Width = 129
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 2
          OnKeyPress = prp_f_Otch_EditKeyPress
        end
        object prp_f_MestoRaboti_TextEdit: TcxTextEdit
          Left = 88
          Top = 101
          Width = 249
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          ParentFont = False
          Properties.MaxLength = 40
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 3
          OnKeyPress = prp_f_MestoRaboti_TextEditKeyPress
        end
        object prp_f_Dolgnost_TextEdit: TcxTextEdit
          Left = 88
          Top = 131
          Width = 249
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          ParentFont = False
          Properties.MaxLength = 40
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 4
          OnKeyPress = prp_f_Dolgnost_TextEditKeyPress
        end
        object prp_f_Oblast_TextEdit: TcxTextEdit
          Left = 88
          Top = 190
          Width = 177
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 6
          OnKeyPress = prp_f_Oblast_TextEditKeyPress
        end
        object prp_f_GorodSeloPGT_ComboBox: TcxComboBox
          Left = 8
          Top = 248
          Width = 78
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 8
          OnKeyPress = prp_f_GorodSeloPGT_ComboBoxKeyPress
        end
        object prp_f_GorodSeloPGT_TextEdit: TcxTextEdit
          Left = 88
          Top = 248
          Width = 177
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 9
          OnKeyPress = prp_f_GorodSeloPGT_TextEditKeyPress
        end
        object prp_f_Street_TextEdit: TcxTextEdit
          Left = 48
          Top = 276
          Width = 177
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 10
          OnKeyPress = prp_f_Street_TextEditKeyPress
        end
        object prp_f_HouseNumber_TextEdit: TcxTextEdit
          Left = 265
          Top = 276
          Width = 41
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.MaxLength = 5
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 11
          OnKeyPress = prp_f_HouseNumber_TextEditKeyPress
        end
        object prp_f_KvartNumber_TextEdit: TcxTextEdit
          Left = 368
          Top = 276
          Width = 57
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.MaxLength = 6
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 12
          OnKeyPress = prp_f_KvartNumber_TextEditKeyPress
        end
        object prp_f_GroupBox: TcxGroupBox
          Left = 2
          Top = 336
          Width = 445
          Height = 45
          Align = alBottom
          Alignment = alTopLeft
          LookAndFeel.NativeStyle = False
          TabOrder = 13
          TabStop = False
          Visible = False
          DesignSize = (
            445
            45)
          object prp_f_OkButton: TcxButton
            Left = 353
            Top = 15
            Width = 86
            Height = 26
            Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1090#1077#1082#1091#1097#1077#1081' '#1074#1082#1083#1072#1076#1082#1080
            Anchors = [akRight, akBottom]
            Caption = #1055#1088#1080#1085#1103#1090#1100
            TabOrder = 0
            OnClick = prp_f_OkButtonClick
            LookAndFeel.NativeStyle = True
          end
        end
        object prp_f_Rayon_TextEdit: TcxTextEdit
          Left = 88
          Top = 220
          Width = 145
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 7
          OnKeyPress = prp_f_Rayon_TextEditKeyPress
        end
        object prp_f_WorkTelefon_MaskEdit: TcxTextEdit
          Left = 88
          Top = 160
          Width = 97
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 16
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 5
          OnKeyPress = prp_f_WorkTelefon_MaskEditKeyPress
        end
      end
    end
    object prp_Mummi_Sheet: TcxTabSheet
      Caption = #1052#1072#1090#1100'            '
      ImageIndex = 12
      ParentShowHint = False
      ShowHint = False
      object prp_Mummi_GroupBox: TcxGroupBox
        Left = 0
        Top = 0
        Width = 449
        Height = 383
        Align = alClient
        Alignment = alTopLeft
        Caption = #1052#1072#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LookAndFeel.NativeStyle = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TabStop = False
        object m_Fam_Label: TLabel
          Left = 8
          Top = 19
          Width = 49
          Height = 13
          Caption = #1060#1072#1084#1080#1083#1080#1103
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object m_Name_Label: TLabel
          Left = 8
          Top = 47
          Width = 22
          Height = 13
          Caption = #1048#1084#1103
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object m_Otch_Label: TLabel
          Left = 8
          Top = 76
          Width = 47
          Height = 13
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object m_Work_Label: TLabel
          Left = 8
          Top = 105
          Width = 72
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object m_Posada_Label: TLabel
          Left = 8
          Top = 135
          Width = 58
          Height = 13
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object m_Phone_Label: TLabel
          Left = 8
          Top = 165
          Width = 65
          Height = 13
          Caption = #1056#1072#1073'.'#1090#1077#1083#1077#1092#1086#1085
        end
        object m_Oblast_Label: TLabel
          Left = 8
          Top = 194
          Width = 43
          Height = 13
          Caption = #1054#1073#1083#1072#1089#1090#1100
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object m_Street_Label: TLabel
          Left = 8
          Top = 280
          Width = 32
          Height = 13
          Caption = #1059#1083#1080#1094#1072
        end
        object m_Home_Label: TLabel
          Left = 236
          Top = 280
          Width = 23
          Height = 13
          Caption = #1044#1086#1084
        end
        object m_Room_Label: TLabel
          Left = 316
          Top = 280
          Width = 48
          Height = 13
          Caption = #1050#1074#1072#1088#1090#1080#1088#1072
        end
        object m_Rayon_Label: TLabel
          Left = 8
          Top = 224
          Width = 31
          Height = 13
          Caption = #1056#1072#1081#1086#1085
        end
        object prp_m_Familia_Edit: TcxTextEdit
          Left = 64
          Top = 16
          Width = 153
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 35
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 0
          OnKeyPress = prp_m_Familia_EditKeyPress
        end
        object prp_m_Name_Edit: TcxTextEdit
          Left = 64
          Top = 43
          Width = 97
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 30
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 1
          OnKeyPress = prp_m_Name_EditKeyPress
        end
        object prp_m_Otch_Edit: TcxTextEdit
          Left = 64
          Top = 72
          Width = 129
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 2
          OnKeyPress = prp_m_Otch_EditKeyPress
        end
        object prp_m_MestoRaboti_TextEdit: TcxTextEdit
          Left = 88
          Top = 101
          Width = 249
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          ParentFont = False
          Properties.MaxLength = 40
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 3
          OnKeyPress = prp_m_MestoRaboti_TextEditKeyPress
        end
        object prp_m_Dolgnost_TextEdit: TcxTextEdit
          Left = 88
          Top = 131
          Width = 249
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          ParentFont = False
          Properties.MaxLength = 40
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 4
          OnKeyPress = prp_m_Dolgnost_TextEditKeyPress
        end
        object prp_m_Oblast_TextEdit: TcxTextEdit
          Left = 88
          Top = 190
          Width = 177
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 6
          OnKeyPress = prp_m_Oblast_TextEditKeyPress
        end
        object prp_m_GorodSeloPGT_ComboBox: TcxComboBox
          Left = 8
          Top = 248
          Width = 78
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 8
          OnKeyPress = prp_m_GorodSeloPGT_ComboBoxKeyPress
        end
        object prp_m_GorodSeloPGT_TextEdit: TcxTextEdit
          Left = 88
          Top = 248
          Width = 177
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 9
          OnKeyPress = prp_m_GorodSeloPGT_TextEditKeyPress
        end
        object prp_m_Street_TextEdit: TcxTextEdit
          Left = 48
          Top = 276
          Width = 177
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 10
          OnKeyPress = prp_m_Street_TextEditKeyPress
        end
        object prp_m_HouseNumber_TextEdit: TcxTextEdit
          Left = 265
          Top = 276
          Width = 41
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.MaxLength = 5
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 11
          OnKeyPress = prp_m_HouseNumber_TextEditKeyPress
        end
        object prp_m_KvartNumber_TextEdit: TcxTextEdit
          Left = 368
          Top = 276
          Width = 57
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.MaxLength = 6
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 12
          OnKeyPress = prp_m_KvartNumber_TextEditKeyPress
        end
        object prp_m_GroupBox: TcxGroupBox
          Left = 2
          Top = 336
          Width = 445
          Height = 45
          Align = alBottom
          Alignment = alTopLeft
          LookAndFeel.NativeStyle = False
          TabOrder = 13
          TabStop = False
          Visible = False
          DesignSize = (
            445
            45)
          object prp_m_OkButton: TcxButton
            Left = 353
            Top = 15
            Width = 86
            Height = 26
            Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1090#1077#1082#1091#1097#1077#1081' '#1074#1082#1083#1072#1076#1082#1080
            Anchors = [akRight, akBottom]
            Caption = #1055#1088#1080#1085#1103#1090#1100
            TabOrder = 0
            OnClick = prp_m_OkButtonClick
            LookAndFeel.NativeStyle = True
          end
        end
        object prp_m_Rayon_TextEdit: TcxTextEdit
          Left = 88
          Top = 220
          Width = 145
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 7
          OnKeyPress = prp_m_Rayon_TextEditKeyPress
        end
        object prp_m_WorkTelefon_MaskEdit: TcxTextEdit
          Left = 88
          Top = 160
          Width = 97
          Height = 21
          AutoSize = False
          BeepOnEnter = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 16
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 5
          OnKeyPress = prp_m_WorkTelefon_MaskEditKeyPress
        end
      end
    end
    object prp_FamilyStatus_Sheet: TcxTabSheet
      Caption = #1057#1077#1084'. '#1087#1086#1083#1086#1078'. '
      ImageIndex = 11
      ParentShowHint = False
      ShowHint = False
      object prp_FamilyStatus_GroupBox: TcxGroupBox
        Left = 0
        Top = 0
        Width = 449
        Height = 383
        Align = alClient
        Alignment = alTopLeft
        Caption = #1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LookAndFeel.NativeStyle = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        TabStop = False
        object Stan_Label: TLabel
          Left = 8
          Top = 21
          Width = 110
          Height = 13
          Caption = #1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
        end
        object prp_fs_SimStan_ComboBox: TcxComboBox
          Left = 128
          Top = 16
          Width = 273
          Height = 21
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 6
          Properties.ReadOnly = False
          Properties.Sorted = True
          Properties.ValidateOnEnter = False
          Style.Color = clInfoBk
          Style.LookAndFeel.NativeStyle = True
          TabOrder = 0
          OnKeyPress = prp_fs_SimStan_ComboBoxKeyPress
        end
        object prp_fs_GroupBox: TcxGroupBox
          Left = 2
          Top = 65
          Width = 437
          Height = 115
          Alignment = alTopLeft
          Caption = #1044#1077#1090#1080
          LookAndFeel.NativeStyle = True
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TabStop = False
          object prp_fs_AddButton: TSpeedButton
            Left = 408
            Top = 20
            Width = 20
            Height = 22
            Cursor = crHandPoint
            Hint = #1044#1086#1076#1072#1090#1080
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
              A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
              69A46769A46769FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
              9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FF
              B79184FEE9C7F4DAB5F3D5AAF2D0A0EFCB96EFC68BEDC182EBC17FEBC180EBC1
              80F2C782A46769FF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
              CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
              B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
              7FEFC481A46769FF00FFFF00FFFF00FF9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2
              D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
              B7938AFEEFDAF6E0C6F2DABCECD0AEDDC19CD7B78FDBB88BE5BD89E9BD82E9BD
              7FEFC481A46769FF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0D7D7D7C7
              C7C7BDBDBDBFBFBFC4C4C4C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
              BA978FFFF4E5F7E5CFF4E0C5E1CAADBCA589A89275B99E7BDBB88AEBC28AEABF
              81EFC480A46769FF00FFFF00FFFF00FF959595F5F5F5E9E9E9E4E4E4CFCFCFAA
              AAAA969696A3A3A3BEBEBEC8C8C8C4C4C4C5C5C59C9C9CFF00FFFF00FFFF00FF
              C09E95FFFBF0F2E4D7E4D2C0004B00004B00004B00A28C72C4A883DBB78AE5BD
              87EFC583A46769FF00FFFF00FFFF00FF9F9F9FF9F9F9E9E9E9D8D8D881818181
              8181818181919191ADADADBEBEBEC3C3C3C7C7C79C9C9CFF00FFFF00FFFF00FF
              C6A49AFFFFFCE7DED5C1B6A9004B000D9A1A004B0097856EA28C71B99E7AD9B8
              88F2C98CA46769FF00FFFF00FFFF00FF9F9F9FFEFEFEE1E1E1B9B9B9818181A9
              A9A9818181898989919191A2A2A2BDBDBDCCCCCC9C9C9CFF00FFFF00FFFF00FF
              CBA99EFFFFFF004B00004B00004B0016AC2D004B00004B00004B00A89275D7B8
              8FF3CE97A46769FF00FFFF00FFFF00FFA6A6A6FFFFFF818181818181818181B4
              B4B4818181818181818181979797BDBDBDD1D1D19C9C9CFF00FFFF00FFFF00FF
              CFAC9FFFFFFF004B0031DA602BD05423C2441AB43413A525004B00BDA589DEC1
              9AF6D3A0A46769FF00FFFF00FFFF00FFA6A6A6FFFFFF818181D0D0D0CBCBCBC2
              C2C2B9B9B9B0B0B0818181AAAAAAC6C6C6D6D6D69C9C9CFF00FFFF00FFFF00FF
              D4B0A1FFFFFF004B00004B00004B002ED55A004B00004B00004B00E1C9AAEED3
              ADEBCFA4A46769FF00FFFF00FFFF00FFB1B1B1FFFFFF818181818181818181CE
              CECE818181818181818181CECECED7D7D7D3D3D39C9C9CFF00FFFF00FFFF00FF
              D9B5A1FFFFFFFFFFFFFFFFFF004B0034DE65004B00C1B5A8E6D6C1FBEACEDECE
              B4B6AA93A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFF818181D3
              D3D3818181B9B9B9D9D9D9EAEAEAD5D5D5B7B7B79C9C9CFF00FFFF00FFFF00FF
              DDB7A4FFFFFFFFFFFFFFFFFF004B00004B00004B00E9E1D5E7D3C4B68A7BA17B
              6F9C7667A46769FF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFF81818181
              8181818181E2E2E2DEDEDE9999999999999999999C9C9CFF00FFFF00FFFF00FF
              E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
              55E68F31B56D4DFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFDFDFDFCFCFCD6D6D6999999ACACAC9B9B9B969696FF00FFFF00FFFF00FF
              E6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5B88265F8B5
              5CBF7A5CFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
              E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
              6CFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6
              F6F6F6F6F6F6F6F6D7D7D7999999AAAAAAFF00FFFF00FFFF00FFFF00FFFF00FF
              E8C4ADEBCBB7EBCBB7EACBB7EACAB6EACAB6EACAB6EACAB6E3C2B1A56B5FFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
              B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = prp_fs_AddButtonClick
          end
          object prp_fs_DeleteButton: TSpeedButton
            Left = 405
            Top = 68
            Width = 23
            Height = 22
            Cursor = crHandPoint
            Hint = #1042#1080#1076#1072#1083#1080#1090#1080
            Enabled = False
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
              6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
              00006E001DE80010DC00006EFF00FFFF00FFFF00FFFF00FF00006E0004E20008
              E700006EFF00FFFF00FFFF00FFFF00FF6B6B6BA8A8A8A0A0A06B6B6BFF00FFFF
              00FFFF00FFFF00FF6B6B6B9A9A9A9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FF
              00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
              DB00006EFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7AAAAAA9F9F9F6B6B6BFF
              00FFFF00FF6B6B6B9999999E9E9E9797976B6B6BFF00FFFF00FFFF00FFFF00FF
              FF00FF00006E001ADF0020EB0013DC00006E00006E0005E2000BEB0004DA0000
              6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ABABABA2A2A26B
              6B6B6B6B6B9A9A9A9E9E9E9898986B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ACACACA3
              A3A39F9F9F9E9E9E9999996B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00006E001BE30016EB0011EB000ADF00006EFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7A7
              A7A7A3A3A39C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BACACACAC
              ACACA9A9A9A4A4A46B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF00006E062DE30430EB0020E2001EE20027EB0019DF00006EFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB1B1B1B3B3B3AB
              ABABAAAAAAAFAFAFA6A6A66B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
              6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB6B6B6B9B9B9AEAEAE6B
              6B6B6B6B6BA9A9A9B0B0B0A7A7A76B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
              00006E1442E41645EB092ED900006EFF00FFFF00FF00006E0020D9012CEB001F
              E200006EFF00FFFF00FFFF00FFFF00FF6B6B6BBBBBBBBEBEBEAFAFAF6B6B6BFF
              00FFFF00FF6B6B6BA7A7A7B1B1B1AAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FF
              00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
              E400006EFF00FFFF00FFFF00FFFF00FF6B6B6BC0C0C0B5B5B56B6B6BFF00FFFF
              00FFFF00FFFF00FF6B6B6BAAAAAAAEAEAE6B6B6BFF00FFFF00FFFF00FFFF00FF
              FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
              6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = prp_fs_DeleteButtonClick
          end
          object prp_fs_EditButton: TSpeedButton
            Left = 405
            Top = 44
            Width = 23
            Height = 22
            Cursor = crHandPoint
            Hint = #1047#1084#1110#1085#1080#1090#1080
            Enabled = False
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA46769A46769
              A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
              69FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
              9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FFA46769FCEACE
              F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
              69FF00FFFF00FFFF00FF9C9C9CEBEBEBDEDEDECCCCCCB8B8B8B2B2B2BABABABE
              BEBEBFBFBFC1C1C1C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FFA0675BFEEFDA
              F6E0C6302D2D212527374546998468AD926FC2A074DCB27AE7BC7EEFC481A467
              69FF00FFFF00FFFF00FF959595F0F0F0E5E5E5656565585858777777989898A4
              A4A4AEAEAEBBBBBBC1C1C1C6C6C69C9C9CFF00FFFF00FFFF00FFA0675BFFF4E5
              F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
              69FF00FFFF00FFFF00FF959595F5F5F5E9E9E9A4A4A46A6A6A7676766161617E
              7E7E909090A5A5A5B4B4B4C1C1C19C9C9CFF00FFFF00FFFF00FFA7756BFFFBF0
              F8EADCEEDDCA22576C165E82745D657D52545E3F39867258A78C66CEAA73A065
              67FF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE4E4E47D7D7D7F7F7F82828281
              81816666668888889D9D9DB2B2B2999999FF00FFFF00FFFF00FFA7756BFFFFFC
              FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
              5EFF00FFFF00FFFF00FF9F9F9FFEFEFEF3F3F3EEEEEEACACAC949494C4C4C4AD
              ADAD8B8B8B6363638080809393938F8F8FFF00FFFF00FFFF00FFBC8268FFFFFF
              FEF7F2FAEFE6F0E5D56B5D62E9A4A1CF9090B27575875353583C357A69508153
              54FF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3E9E9E97E7E7ED1D1D1C0
              C0C0A8A8A88686866161617F7F7F838383FF00FFFF00FFFF00FFBC8268FFFFFF
              FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
              4EFF00FFFF00FFFF00FFA6A6A6FFFFFFFEFEFEF8F8F8F3F3F3E4E4E48D8D8DCF
              CFCFBFBFBFA9A9A98585856464647B7B7BFF00FFFF00FFFF00FFD1926DFFFFFF
              FFFFFFFFFEFCFEF7F0FAEFE5E1CEC0875958E1A1A1CC8E8EB07474865151633B
              3CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3F3F3DBDBDB88
              8888CECECEBEBEBEA7A7A7848484696969FF00FFFF00FFFF00FFD1926DFFFFFF
              FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
              423E4145FF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3D2
              D2D28B8B8BD2D2D2BCBCBCAAAAAA7979795C5C5CFF00FFFF00FFDA9D75FFFFFF
              FFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFCF3E6CFB5AA976666EFAAA98C6D731E79
              9F0C98BD0C98BDFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F4
              F4F4CBCBCB969696D7D7D7959595919191909090909090FF00FFDA9D75FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
              F0008EDE000F95000081B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFC
              FCFCD6D6D68D8D8D9292929E9E9E9F9F9F9191917474746A6A6AE7AB79FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5A56B5FD1914F068FC10393
              DE0320BA0318B2010B99BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFDBDBDB999999A3A3A38D8D8D928F92878787848484767676E7AB79FBF4F0
              FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
              BF2F45ED1031D3010A95BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6
              F6F6D7D7D7999999AAAAAAFF00FF888888BABABA9C9C9C757575E7AB79D1926D
              D1926DD1926DD1926DD1926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00
              FF2732D00C19B4FF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1
              B1B1B1B1B1999999FF00FFFF00FFFF00FFAAAAAA8C8C8CFF00FF}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = prp_fs_EditButtonClick
          end
          object prp_Grid: TcxGrid
            Left = 7
            Top = 20
            Width = 394
            Height = 90
            TabOrder = 0
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = True
            object prp_GridTableView: TcxGridTableView
              OnKeyPress = prp_GridTableViewKeyPress
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnGrouping = False
              OptionsCustomize.ColumnMoving = False
              OptionsCustomize.ColumnSorting = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              Styles.Background = prp_Style_Yellow
              Styles.Content = prp_Style_Yellow
              Styles.Inactive = prp_Style_Silver
              Styles.Selection = prp_Style_Blue
              Styles.Header = prp_Style_Yellow1
              object prp_Children_Column: TcxGridColumn
                Caption = #1060#1048#1054' '#1088#1077#1073#1077#1085#1082#1072
                PropertiesClassName = 'TcxTextEditProperties'
                HeaderAlignmentHorz = taCenter
                Width = 244
              end
              object prp_Sex_Column: TcxGridColumn
                Caption = #1055#1086#1083
                PropertiesClassName = 'TcxTextEditProperties'
                HeaderAlignmentHorz = taCenter
                Width = 43
              end
              object prp_DateChildBorn_Column: TcxGridColumn
                Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.DateButtons = []
                Properties.SaveTime = False
                Properties.ShowTime = False
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                Width = 105
              end
              object prp_NameChild_Column: TcxGridColumn
                Visible = False
              end
              object prp_OtchChild_Column: TcxGridColumn
                Visible = False
              end
              object prp_FamiliyaChild_Column: TcxGridColumn
                Visible = False
              end
            end
            object prp_GridLevel: TcxGridLevel
              GridView = prp_GridTableView
            end
          end
        end
        object prp_fs_Vmeste_CheckBox: TcxCheckBox
          Left = 125
          Top = 40
          Width = 252
          Height = 21
          ParentColor = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1042#1084#1077#1089#1090#1077' '#1089' '#1089#1091#1087#1088#1091#1075#1086#1081' ('#1086#1084')'
          Style.BorderStyle = ebsUltraFlat
          Style.Color = clBtnFace
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.LookAndFeel.NativeStyle = True
          Style.Shadow = False
          TabOrder = 1
          OnKeyPress = prp_fs_Vmeste_CheckBoxKeyPress
        end
        object prp_fs_GroupBox2: TcxGroupBox
          Left = 2
          Top = 332
          Width = 445
          Height = 49
          Align = alBottom
          Alignment = alTopLeft
          LookAndFeel.NativeStyle = False
          TabOrder = 4
          TabStop = False
          Visible = False
          DesignSize = (
            445
            49)
          object prp_fs_OkButton: TcxButton
            Left = 368
            Top = 18
            Width = 86
            Height = 26
            Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1090#1077#1082#1091#1097#1077#1081' '#1074#1082#1083#1072#1076#1082#1080
            Anchors = [akRight, akBottom]
            Caption = #1055#1088#1080#1085#1103#1090#1100
            TabOrder = 0
            OnClick = prp_fs_OkButtonClick
            LookAndFeel.NativeStyle = True
          end
        end
        object cxGroupBox1: TcxGroupBox
          Left = 4
          Top = 182
          Width = 437
          Height = 104
          Alignment = alTopLeft
          Caption = #1056#1086#1076#1089#1090#1074#1077#1085#1085#1099#1077' '#1089#1074#1103#1079#1080
          LookAndFeel.NativeStyle = True
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          TabStop = False
          object prp_Rodstv_Add_Button: TSpeedButton
            Left = 408
            Top = 20
            Width = 20
            Height = 22
            Cursor = crHandPoint
            Hint = #1044#1086#1076#1072#1090#1080
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
              A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
              69A46769A46769FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
              9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FF
              B79184FEE9C7F4DAB5F3D5AAF2D0A0EFCB96EFC68BEDC182EBC17FEBC180EBC1
              80F2C782A46769FF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
              CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
              B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
              7FEFC481A46769FF00FFFF00FFFF00FF9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2
              D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
              B7938AFEEFDAF6E0C6F2DABCECD0AEDDC19CD7B78FDBB88BE5BD89E9BD82E9BD
              7FEFC481A46769FF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0D7D7D7C7
              C7C7BDBDBDBFBFBFC4C4C4C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
              BA978FFFF4E5F7E5CFF4E0C5E1CAADBCA589A89275B99E7BDBB88AEBC28AEABF
              81EFC480A46769FF00FFFF00FFFF00FF959595F5F5F5E9E9E9E4E4E4CFCFCFAA
              AAAA969696A3A3A3BEBEBEC8C8C8C4C4C4C5C5C59C9C9CFF00FFFF00FFFF00FF
              C09E95FFFBF0F2E4D7E4D2C0004B00004B00004B00A28C72C4A883DBB78AE5BD
              87EFC583A46769FF00FFFF00FFFF00FF9F9F9FF9F9F9E9E9E9D8D8D881818181
              8181818181919191ADADADBEBEBEC3C3C3C7C7C79C9C9CFF00FFFF00FFFF00FF
              C6A49AFFFFFCE7DED5C1B6A9004B000D9A1A004B0097856EA28C71B99E7AD9B8
              88F2C98CA46769FF00FFFF00FFFF00FF9F9F9FFEFEFEE1E1E1B9B9B9818181A9
              A9A9818181898989919191A2A2A2BDBDBDCCCCCC9C9C9CFF00FFFF00FFFF00FF
              CBA99EFFFFFF004B00004B00004B0016AC2D004B00004B00004B00A89275D7B8
              8FF3CE97A46769FF00FFFF00FFFF00FFA6A6A6FFFFFF818181818181818181B4
              B4B4818181818181818181979797BDBDBDD1D1D19C9C9CFF00FFFF00FFFF00FF
              CFAC9FFFFFFF004B0031DA602BD05423C2441AB43413A525004B00BDA589DEC1
              9AF6D3A0A46769FF00FFFF00FFFF00FFA6A6A6FFFFFF818181D0D0D0CBCBCBC2
              C2C2B9B9B9B0B0B0818181AAAAAAC6C6C6D6D6D69C9C9CFF00FFFF00FFFF00FF
              D4B0A1FFFFFF004B00004B00004B002ED55A004B00004B00004B00E1C9AAEED3
              ADEBCFA4A46769FF00FFFF00FFFF00FFB1B1B1FFFFFF818181818181818181CE
              CECE818181818181818181CECECED7D7D7D3D3D39C9C9CFF00FFFF00FFFF00FF
              D9B5A1FFFFFFFFFFFFFFFFFF004B0034DE65004B00C1B5A8E6D6C1FBEACEDECE
              B4B6AA93A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFF818181D3
              D3D3818181B9B9B9D9D9D9EAEAEAD5D5D5B7B7B79C9C9CFF00FFFF00FFFF00FF
              DDB7A4FFFFFFFFFFFFFFFFFF004B00004B00004B00E9E1D5E7D3C4B68A7BA17B
              6F9C7667A46769FF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFF81818181
              8181818181E2E2E2DEDEDE9999999999999999999C9C9CFF00FFFF00FFFF00FF
              E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
              55E68F31B56D4DFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFDFDFDFCFCFCD6D6D6999999ACACAC9B9B9B969696FF00FFFF00FFFF00FF
              E6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5B88265F8B5
              5CBF7A5CFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
              E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
              6CFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6
              F6F6F6F6F6F6F6F6D7D7D7999999AAAAAAFF00FFFF00FFFF00FFFF00FFFF00FF
              E8C4ADEBCBB7EBCBB7EACBB7EACAB6EACAB6EACAB6EACAB6E3C2B1A56B5FFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
              B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = prp_Rodstv_Add_ButtonClick
          end
          object prp_Rodstv_Delete_Button: TSpeedButton
            Left = 405
            Top = 68
            Width = 23
            Height = 22
            Cursor = crHandPoint
            Hint = #1042#1080#1076#1072#1083#1080#1090#1080
            Enabled = False
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
              6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
              00006E001DE80010DC00006EFF00FFFF00FFFF00FFFF00FF00006E0004E20008
              E700006EFF00FFFF00FFFF00FFFF00FF6B6B6BA8A8A8A0A0A06B6B6BFF00FFFF
              00FFFF00FFFF00FF6B6B6B9A9A9A9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FF
              00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
              DB00006EFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7AAAAAA9F9F9F6B6B6BFF
              00FFFF00FF6B6B6B9999999E9E9E9797976B6B6BFF00FFFF00FFFF00FFFF00FF
              FF00FF00006E001ADF0020EB0013DC00006E00006E0005E2000BEB0004DA0000
              6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ABABABA2A2A26B
              6B6B6B6B6B9A9A9A9E9E9E9898986B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ACACACA3
              A3A39F9F9F9E9E9E9999996B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00006E001BE30016EB0011EB000ADF00006EFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7A7
              A7A7A3A3A39C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BACACACAC
              ACACA9A9A9A4A4A46B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF00006E062DE30430EB0020E2001EE20027EB0019DF00006EFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB1B1B1B3B3B3AB
              ABABAAAAAAAFAFAFA6A6A66B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
              6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB6B6B6B9B9B9AEAEAE6B
              6B6B6B6B6BA9A9A9B0B0B0A7A7A76B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
              00006E1442E41645EB092ED900006EFF00FFFF00FF00006E0020D9012CEB001F
              E200006EFF00FFFF00FFFF00FFFF00FF6B6B6BBBBBBBBEBEBEAFAFAF6B6B6BFF
              00FFFF00FF6B6B6BA7A7A7B1B1B1AAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FF
              00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
              E400006EFF00FFFF00FFFF00FFFF00FF6B6B6BC0C0C0B5B5B56B6B6BFF00FFFF
              00FFFF00FFFF00FF6B6B6BAAAAAAAEAEAE6B6B6BFF00FFFF00FFFF00FFFF00FF
              FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
              6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = prp_Rodstv_Delete_ButtonClick
          end
          object prp_Rodstv_Edit_Button: TSpeedButton
            Left = 405
            Top = 44
            Width = 23
            Height = 22
            Cursor = crHandPoint
            Hint = #1047#1084#1110#1085#1080#1090#1080
            Enabled = False
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA46769A46769
              A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
              69FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
              9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FFA46769FCEACE
              F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
              69FF00FFFF00FFFF00FF9C9C9CEBEBEBDEDEDECCCCCCB8B8B8B2B2B2BABABABE
              BEBEBFBFBFC1C1C1C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FFA0675BFEEFDA
              F6E0C6302D2D212527374546998468AD926FC2A074DCB27AE7BC7EEFC481A467
              69FF00FFFF00FFFF00FF959595F0F0F0E5E5E5656565585858777777989898A4
              A4A4AEAEAEBBBBBBC1C1C1C6C6C69C9C9CFF00FFFF00FFFF00FFA0675BFFF4E5
              F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
              69FF00FFFF00FFFF00FF959595F5F5F5E9E9E9A4A4A46A6A6A7676766161617E
              7E7E909090A5A5A5B4B4B4C1C1C19C9C9CFF00FFFF00FFFF00FFA7756BFFFBF0
              F8EADCEEDDCA22576C165E82745D657D52545E3F39867258A78C66CEAA73A065
              67FF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE4E4E47D7D7D7F7F7F82828281
              81816666668888889D9D9DB2B2B2999999FF00FFFF00FFFF00FFA7756BFFFFFC
              FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
              5EFF00FFFF00FFFF00FF9F9F9FFEFEFEF3F3F3EEEEEEACACAC949494C4C4C4AD
              ADAD8B8B8B6363638080809393938F8F8FFF00FFFF00FFFF00FFBC8268FFFFFF
              FEF7F2FAEFE6F0E5D56B5D62E9A4A1CF9090B27575875353583C357A69508153
              54FF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3E9E9E97E7E7ED1D1D1C0
              C0C0A8A8A88686866161617F7F7F838383FF00FFFF00FFFF00FFBC8268FFFFFF
              FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
              4EFF00FFFF00FFFF00FFA6A6A6FFFFFFFEFEFEF8F8F8F3F3F3E4E4E48D8D8DCF
              CFCFBFBFBFA9A9A98585856464647B7B7BFF00FFFF00FFFF00FFD1926DFFFFFF
              FFFFFFFFFEFCFEF7F0FAEFE5E1CEC0875958E1A1A1CC8E8EB07474865151633B
              3CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3F3F3DBDBDB88
              8888CECECEBEBEBEA7A7A7848484696969FF00FFFF00FFFF00FFD1926DFFFFFF
              FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
              423E4145FF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3D2
              D2D28B8B8BD2D2D2BCBCBCAAAAAA7979795C5C5CFF00FFFF00FFDA9D75FFFFFF
              FFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFCF3E6CFB5AA976666EFAAA98C6D731E79
              9F0C98BD0C98BDFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F4
              F4F4CBCBCB969696D7D7D7959595919191909090909090FF00FFDA9D75FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
              F0008EDE000F95000081B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFC
              FCFCD6D6D68D8D8D9292929E9E9E9F9F9F9191917474746A6A6AE7AB79FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5A56B5FD1914F068FC10393
              DE0320BA0318B2010B99BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFDBDBDB999999A3A3A38D8D8D928F92878787848484767676E7AB79FBF4F0
              FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
              BF2F45ED1031D3010A95BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6
              F6F6D7D7D7999999AAAAAAFF00FF888888BABABA9C9C9C757575E7AB79D1926D
              D1926DD1926DD1926DD1926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00
              FF2732D00C19B4FF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1
              B1B1B1B1B1999999FF00FFFF00FFFF00FFAAAAAA8C8C8CFF00FF}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = prp_Rodstv_Edit_ButtonClick
          end
          object prp_Rodstv_Grid: TcxGrid
            Left = 7
            Top = 21
            Width = 394
            Height = 76
            TabOrder = 0
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = True
            object prp_Rodstv_GridTableView: TcxGridTableView
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnGrouping = False
              OptionsCustomize.ColumnMoving = False
              OptionsCustomize.ColumnSorting = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              Styles.Background = prp_Style_Yellow
              Styles.Content = prp_Style_Yellow
              Styles.Inactive = prp_Style_Silver
              Styles.Selection = prp_Style_Blue
              Styles.Header = prp_Style_Yellow1
              object fio: TcxGridColumn
                Caption = #1060#1048#1054
                PropertiesClassName = 'TcxTextEditProperties'
                HeaderAlignmentHorz = taCenter
                Width = 243
              end
              object name_rel: TcxGridColumn
                Caption = #1058#1080#1087' '#1088#1086#1076#1089#1090#1074'.'#1089#1074#1103#1079#1080
                HeaderAlignmentHorz = taCenter
                Width = 149
              end
              object id_type_pel: TcxGridColumn
                PropertiesClassName = 'TcxTextEditProperties'
                Visible = False
              end
              object id_rodstvennika: TcxGridColumn
                Visible = False
              end
            end
            object cxGridLevel2: TcxGridLevel
              GridView = prp_Rodstv_GridTableView
            end
          end
        end
      end
    end
  end
  object dxStatusBar2: TdxStatusBar
    Left = 0
    Top = 472
    Width = 594
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.AutoHint = True
        Fixed = False
      end>
    PaintStyle = stpsOffice11
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ShowHint = True
    ParentShowHint = False
  end
  object prp_SubMainFIO_GroupBox: TcxGroupBox
    Left = 0
    Top = 54
    Width = 594
    Height = 31
    Align = alTop
    Alignment = alTopLeft
    LookAndFeel.NativeStyle = False
    TabOrder = 0
    object prp_FIO_Label: TLabel
      Left = 12
      Top = 12
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object prp_DateOfBorn_Label: TLabel
      Left = 513
      Top = 15
      Width = 79
      Height = 14
      Align = alRight
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
    end
  end
  object prp_Splitter1: TcxSplitter
    Left = 0
    Top = 46
    Width = 594
    Height = 8
    AlignSplitter = salTop
    AllowHotZoneDrag = False
    AutoPosition = False
    DragThreshold = 1
    Control = prp_SubMainFIO_GroupBox
    Visible = False
  end
  object prp_Splitter2: TcxSplitter
    Left = 0
    Top = 85
    Width = 8
    Height = 387
  end
  object prp_Splitter3: TcxSplitter
    Left = 586
    Top = 85
    Width = 8
    Height = 387
    AlignSplitter = salRight
    Control = prp_Splitter2
  end
  object prp_ImageList: TImageList
    Height = 32
    ShareImages = True
    Width = 32
    Left = 432
    Top = 98
    Bitmap = {
      494C010110001300040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000080000000A000000001002000000000000040
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F4F4F400CFCFCE00E1E1E000E1E1E000E1E0E000E1E0E000E1E0DF00E1E0
      DD00E1E0DC00E1E0DA00E1DFDA00DFDDD800AFAAA500D7D2CC00E1DBD400E1DA
      D300E1DAD200E1DAD100E1D9D000E1D8CF00E1D7CD00E1D7CC00E1D6CB00E1D6
      CB00E1D7CB00CAC5C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FFFEFC00FFFEFC00FFFDFB00FFFCFA00FFFCF800FFFB
      F700FFFAF500FFF9F400FFF9F200D1CEC900707270000000FF000000FF00FFF4
      EA00FFF3E800FFF2E700FFF1E500FFF0E400FFEFE2000000FF000000FF00FFEC
      DD00FFEEDE00D7CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFDFC00E0DEDD00BBBAB800D0CECC00DAD7D400E2DE
      DB00DCD7D300E3DED900CBC8C300717777000000FF000000FF000000FF000000
      FF00E4D9D000DDD2C900CCC2BA000000FF000000FF000000FF000000FF000000
      FF00FFEDDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F112F100A282A200969696009696960096969600969696009696
      9600C27C2500C57A1D00C57A1D00C57A1D00C57A1D00C57A1D00C57A1D00C27C
      25009696960096969600969696009696960096969600A282A200F112F1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FFFEFD00D2D0CF00A2A1A000A09E9C00CAC8C6009F9C
      9A00AFACA900C2BDB9005B626300818384000000FF000000FF000000FF000000
      FF000000FF00ABA29A000000FF000000FF000000FF000000FF000000FF000000
      FF00FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BF5FBF00AB7BAB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C97F2300EEB76400EDAC5100EDAC5100EDAC5100EDAC5100EEB76400C97F
      2300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AB7BAB00BF5FBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFDFB00DFDDDC00DFDDDB00E5E2E000C9C6C300D1CD
      CA00D1CDC900A4B1B20065ABB700A9B9BC005A5D5B000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00E7DA
      CC00FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B373B300FFFFFF00E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600CF882F00F3C57800EFB45D000000FF000000FF000000FF00F3C57800CF88
      2F00E6E6E6000000FF000000FF000000FF00E6E6E600FFFFFF00B373B3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FFFEFD00D9D8D600BCBBBA00D0CDCB00B2B0AE00A8A5
      A2009CA2A10097D2DC005EBDCC008CCDD6005A6565000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00BEB1A600F2E1
      D300FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000005B
      0000005A0000005A0000005A0000005A0000005A0000005A0000005A0000005A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006E2D13006E2D
      13006E2D13006E2D13006E2D13006E2D13006E2D13006E2D13006E2D13006E2D
      1300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B676B600FFFFFF00E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600D38D3400F4CA80000000FF000000FF000000FF000000FF000000FF00D38D
      34000000FF000000FF000000FF000000FF00E6E6E600FFFFFF00B676B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFDFC00DCDAD900C4C2C000CCC9C700BFBCBA00B9B8
      B600B5D7DD007CCAD7005FBDCC009AD6DF00696F6D00BEB8B2000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00CBBEB300F7E7
      D900FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000005A00000073
      0000007F00000081000000830100048F0A000C9E1E00038B0700007E00000086
      0000005F0000005A000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E2D1300B0350A00D741
      2200EB472F00F2483400F44F3800F4553D00F7604300F64E3500F3453000F24A
      35006E2D13006E2D130000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B979B900FFFFFF00E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600D9964000F7D491000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF00E6E6E600FFFFFF00B979B9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFDFC00D5D3D200C1BFBE00ACAAA900BEBCBA00B4C9
      CC00ADE0E90062BECD0074C6D400BBE3E90060615F00C3BDB7009A948E000000
      FF000000FF000000FF000000FF000000FF000000FF00C6B9AF00C1B4AA00F7E8
      D900FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000005A00000072
      0000007A0000038B0A0010A62A0020BD500011AF3A0033B23F000D890D00007E
      00000081000000760000005A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E2D1300B8380F00DC42
      2400EE493100F6583F00F8684700FA734D00F8644100F8826E00F6655300EF46
      3100E5472F00C94124006E2D1300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B979B900FFFFFF00E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600DD9A4600F8D99900F6CF87000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00E6E6E600E6E6E600FFFFFF00B979B9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FFFEFD00FDFDFB00FDFDFA00FDFBF900EAF6F700BDED
      F60087CEDA005CBCCB0095D5E000D2ECEE007D7D7B00F8F2EA00FDF4EB000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00FEEEE000FDEC
      DD00FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000005A00000070
      0000058E0D001AB6410023C55A001EBF5200038E0F006ECF6D008BE78E000984
      0A00007F010000720000005A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E2D1300C03B1300E144
      2800F45D4000FB704D00FA704C00FA6C4700B8411700FEDAD700FBBBB200B841
      1700E1442C00C13F20006E2D1300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BC7CBC00FFFFFF00E9E9E900E8E8E800E7E7E700E7E7E700E6E6
      E600E4A35200FAE2A700F8DA9900F8DA99000000FF000000FF000000FF000000
      FF000000FF000000FF00E6E6E600E6E6E600E6E6E600FFFFFF00BC7CBC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFCFB00F2F1EF00F2F0EE00F3F0ED00A7E1ED002AD0
      ED005EC2D0006CC3D100BAE6EE00D9EEF000A2A29E00F2EAE3000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00F7E6
      D800FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000005700000277
      050016AF370023C2550020C1540006981B0023A42800B1F3B100C9FFC7000D88
      0C00079614000072010000590000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E2D1300C73B1600EA53
      3500FC724D00FA6F4C00FA6F4B00B8411700F88C7A00FFFBFC00FCE0DD00B841
      1700E24D3100B83C1D006E2D1300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BF7FBF00FFFFFF00EAEAEA00E9E9E900E8E8E800E8E8E800E7E7
      E700E7A75800FBE6AE00FAE0A100FAE0A1000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00E6E6E600E6E6E600FFFFFF00BF7FBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FFFEFD00FEFDFB00FEFCFA00FDFCF9005ED7F20004D5
      EC00086A6C002984860061E2F60061D3EA00E4E0DA000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00FEEC
      DD00FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000046C
      090018B4400023CB5B0010AC2F000F98140083E08000DDFFD500C1FFBD000A81
      06001CBB480004820D0000590000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE411D00F25F
      3F00FB724E00FA6E4B00FA694500B8411700FCD5D100FEFEFE00FBE0DC00B841
      1700F3664200B7411F006E2D1300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BF7FBF00FFFFFF00ECECEC00ECECEC00EBEBEB00EAEAEA00E9E9
      E900EEB06300FCEDBA00FCE9AF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF00E6E6E600FFFFFF00BF7FBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FDFDFB00D5D3D200C4C3C000B7BBBB0020CAEC0004D0
      DD00001919000E71770030D9FB005C9FAD000000FF000000FF000000FF000000
      FF000000FF000000FF00F2E5DA000000FF000000FF000000FF000000FF000000
      FF00FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000A82190021C756000E962100439C57009CCBB800BBDDC90095E596000E9C
      0E0016AB37000783160000540000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5321500B532
      1500FB6F4B00FC6C4500B8411700F3AB9D00E7E7E700EDEDED00F4D3CE00B841
      1700FC6E4B00CE5430006D2D1300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009F00
      D4007F01C500A777AF00FFFFFF00EDEDED00EDEDED00ECECEC00EBEBEB00EAEA
      EA00F1B56900FDF0BF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF00E6E6E600FFFFFF00AF7FB8007F01
      C5009F00D4000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFEFC00DAD9D800AAA8A600A4C1C80009CFED0002A1
      A5000113130020C0D00038D0F000AAB0AD000000FF000000FF000000FF000000
      FF000000FF00FBEFE400FBEEE2000000FF000000FF000000FF000000FF000000
      FF00FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000009450D000F4D1B001440370020388A001C3892002A4B930028646700158B
      4D0001690100035C020000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5321500E66A4F00CB818000919DAB00777D870093969600C4817000B841
      1700B6331500B633150000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007004C4001233
      DA00163DEA000513A5000F139A00E8E8E800EFEFEF00EFEFEF00EEEEEE00EDED
      ED00F8BE7500FEF5C9000000FF000000FF000000FF000000FF00FEF5C900F8BE
      75000000FF000000FF000000FF000000FF00E6AAE6000F139A000513A500163D
      EA001233DA007004C40000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFEFC00C3C2C1008B8886007BD0E20004D7EC00014B
      4B00074546002CDAF60067C1D400F5EEE700FCF3EC000000FF000000FF000000
      FF00FAEEE400FAEEE300FAEDE100FAECE0000000FF000000FF000000FF00FCEA
      DB00FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000901
      0900050303000401020009114D00031A8B000017870000168600051C81000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000486493000B6C97000A668F000A648B000A6288000A6289000A658E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000020F9A00204D
      EF00173FEB00153CE6000618A900B4AED100DCDCDC00F0F0F000EFEFEF00EEEE
      EE00FBC27A00FFFAED00FFFAED000000FF000000FF00FFFAED00FFFAED00FBC2
      7A00E6E6E6000000FF000000FF00D6D6D600B795D3000618A900153CE600173F
      EB00204DEF00020F9A0000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFDFC00E5E3E200D0D1CF0037CEE90003CFDA00001A
      1A001498A10032D4F50097A9AB00E7E0DA00D4CDC700D8D1C900DCD4CC00D2C9
      C000DBD2C800E7DCD200D6CBC000DACEC300D0C3B800D5C7BC00D3C5BA00F2E2
      D400FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000040304000100
      010001000000091330000C2F93000B349F000C339A000B339A00092D9D000017
      8700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000B6E
      9A000E69E6000F65E7001164E2001164E100105FDE000C54D4000F5BDA000B6E
      9A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002213AF004A87
      F9004B8AFE001944EE001944EE000721B1001125A700DDDDDD00EAEAEA00F0F0
      F000F0F0F000F0F0F000EFEFEF00EEEEEE00EDEDED00ECECEC00EBEBEB00E9E9
      E900E8E8E800E6E6E600D6D6D6001024A7000721B1001944EE001944EE004B8A
      FE004A87F9002213AF0000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FFFEFD00C9C8C700A8B7B9000ECEE900029C9E000220
      1F0024D0E4004CBFD900B1AEAB00D3CDC700B6B1AC00C9C2BB00C1BBB400BBB5
      AD00B7AFA700B7AEA600C2B9AF00B7AEA500AEA39A00BCB2A800BCB1A600EEDE
      D000FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000009090A00010101000000
      0000050C15000D3484000D3FB5000C3BAA000C3BAA000D3BAA000D3CAA000C35
      A900001787000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000013A63000F60
      C5001C75EF001E7DF4001F7FF6001F7FF6001D7BF4001C76EF00186BE500145D
      D9000B6E9A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A87
      F9004E8AFA002555F2001A47EF001944EB000825B600B5BAD400DDDDDD00F2F2
      F200F1F1F100F0F0F000EFEFEF00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEA
      EA00E9E9E900D8D8D800ADB2CC000825B6001944EB001A47EF002555F2004E8A
      FA004A87F9000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFDFC00F4F2F000B1E6F00005D9EB00014343000B6A
      6C002EDAF7009CBFC500F4EDE800F4EDE700F3ECE600F3ECE400F3ECE300F3EB
      E100F4E9DF00F4E8DE00F3E8DD00F4E8DC00F4E6DA00F3E6D900F3E5D800F8E7
      D900FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000005050600000000000100
      0000091735000F47BF000F48C1000F45BA000F45BA000F45BA000F45BA000F45
      BA000E40BC0011578B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000013963001878
      E6002387FC002489FA00258BFA00258BFA00238AFA002186F8001E7EF6001A70
      EB001665D9000B6E9A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001424B6005492FA005594FE001D4CF2001D4CF2000A2EBE001333B500DEDE
      DE00EBEBEB00F2F2F200F2F2F200F0F0F000F0F0F000EEEEEE00EEEEEE00EBEB
      EB00DBDBDB001232B5000A2EBE001D4CF2001D4CF2005594FE005492FA001424
      B600000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FFFDFC00FCFBFA0065DEF20002CDD50001201F0019BB
      C50043CCE800E6E4E000FCF7F000FCF5EE00FCF4ED00FCF4EB00FCF2E900FCF2
      E800FCF1E600FCF0E500FCEFE300FCEEE100FCEDE000FCEDDF00FCEBDD00FDEC
      DC00FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000004030400000000000100
      00000D203E001458D3001052CF001252CB001252CB001252CB001252CB001252
      CB001251CE0011578B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000487D0001355B000E58
      9D00288FFB002992FA002A93FA002A93FA002991FA00278EFA002389FA001F80
      F7001A72EA000B6E9A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005492FA005796FB00295DF5001E4EF3001C4CEF000A33C200B6BE
      D800DFDFDF00F3F3F300F3F3F300F2F2F200F1F1F100F0F0F000EFEFEF00DDDD
      DD00B1B8D2000A33C2001C4CEF001E4EF300295DF5005796FB005492FA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFCFB00E9F1F00025D8ED0002969700043E3D0026DA
      F00084BECA00F3EDE800F4EEE800F4EDE700F5EDE600F5EDE500F5ECE400F5EA
      E100F5EAE000F5E9DF00F5E8DD00F4E6DB00F4E6D900F5E6D900EEDED200F8E7
      D900FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000004040500000000000000
      00000B1C34001860D0001666E6001663DC001663DC001663DC001663DC001663
      DC001663E20011578B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000477B0001345800207B
      CF002D97FC00309CFF002F9AFC002E99FA002D98FB002C96FA002890FA002389
      FB001E7DF6000B6E9A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000389DCE000E40C30063A4FF005F9FFE002053F6002053F6000C3C
      CA001541C300E0E0E000EDEDED00F4F4F400F3F3F300F1F1F100E0E0E0001441
      C2000C3CCA002053F6002053F6005F9FFE0063A4FF001632C200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FFFDFC00D6F4F7000DDAEA00014847000E8F920037D3
      EF00D6DAD800FCF7F200FCF6F000F6F3EC008F8B860086827D00928D8800B7AF
      A800968E880099918A008D857D00988F8800ACA29800A2978F008D837B00F4E8
      D900FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000007070800000000000504
      03000E141E001C5BB1001D82FF001B77F4001B75EF001B74EF001B74EF001B75
      EF001D7FFF0011578B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000487E0001355A002186
      E1002181D40002375C002A95EE00319EFC00309CFB002E99FB002B95FA00278E
      FA002184F8000B6E9A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003DA2D20073C0EC0063A4FF0067A7FF002E65F9002156F7001F54
      F4000C40CE00B8C2DC00E1E1E100F5F5F500F5F5F500E1E1E100B5BFD9000C40
      CE001F54F4002156F7002E65F90067A7FF0063A4FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FFFDFC0091E7F10002CDD300012A2A001CCEDA006DC2
      D300F4EFEA00F9F2EE00F9F2EC00F9F1EB00EAE6DF00E8E4DC00EBE5DC00E0D7
      CE00E6DFD500E6DED500D5CEC400E3DACE00DBD0C400D6CDC100D6CBBF00F6E5
      D700FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000090909002323
      2300282523001B324D001E70D500218CFF002190FF002193FF002192FF002195
      FF001A66D50011578B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000352880003538A00023B
      60000135590001355A00238ADE0033A0FC00329FFB00309CFB002D98FA002992
      FB002388F7000B6E9A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000043A7D50084CDEF0042AFE4000D4CD0006DAFFF0069A9FF00235B
      FA00235BFA000E49D700164FD000E2E2E200E4E4E400164FD0000E49D700235B
      FA00235BFA0069A9FF006DAFFF001740D1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FCFDFC0045E1F00001929200075B5A002CD9F000C1CF
      D100FAF5F100F9F3EE00FAF3ED00FAF2EC00FAF1EA00FAF0E800FAEFE700F9EF
      E500FBEEE500EEE6DC009F979000C8BEB400A0968E00978D8500A99E9500EDDE
      D100FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000161616004040
      40005C5C5C0032312F00111C28001031590015478200164D8E001958A100164B
      8A00141723000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001167990013699A000858
      8B00034F8400023B60002F9DF40035A4FF0034A0FE00319DFC002E99FC002B95
      FE000B6E9A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000048ACD9008ED3F20054B9E80042AFE4006DAFFF0071B2FF00336D
      FC00255DFB00235CF8000E4DDB00D5D9E200D5D9E1000E4DDB00235CF800255D
      FB00336DFC0071B2FF006DAFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800E8FAFB0019DEE9000147450012AFB3003DAFC2009391
      8E009F9B9800CCC6C200A6A19D00A19C9800BFB8B200A29C97009F989300B0A8
      A100A39B9400B6ACA500A0989000A79D9400BEB2A800A59A9100A99D9400F8EA
      DB00FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002120
      230060626000646363003B3B3B0018191B00090A0C0004040500020203000804
      0400050303000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001D74A4005298
      BC0013689A000A486E002489D4002D98EE00319EF70034A0FF00309CFF00268E
      EF000B6E9A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000053B7DF00A1E2F60077CEEF0077CEEF004BA8E1000D59DD0078B9
      FF0069A9FF002762FE002762FE001057E3001057E3002762FE002762FE0069A9
      FF0078B9FF00184EDE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E900C1F4F80005C8CC000243410021D9E8009BBABF00E0DC
      D800D9D5D100E1DDD800CCC7C300DAD4CE00D5CEC800E2DAD300C2BBB500BCB6
      AF00DED5CD00D5CBC100E1D5CB00D3C8BF00E4D8CC00E1D4C900DFD1C600F5E5
      D700FAE9D900CAC1B90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002120230021202300575757004F4F4F003636360013131300090808000403
      0300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000013699C005298
      BC00559ABD001A6FA00015587E000A486F00043E6700033E6800033E67000B6E
      9A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000059BCE300ABE8F80088D8F30088D8F30059BCE3000000000078B9
      FF007BBDFF002D6AFF002865FF002865FF002865FF002865FF002D6AFF007BBD
      FF0078B9FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E90070EBF300018D8C000A86850040D0E300EAEAE700FEF9
      F500FEF8F400FEF8F200FEF8F200FEF6EF00FEF6EE00FEF4EC00FEF4EB00FEF3
      E900FEF1E700FEF1E600FDF0E400F6EAE100F8EBE100F7EADF00F3E6DC00ECDC
      D100E3CDBC00D3D1CF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000111112000404040005060600110E1100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000013699C00186E9F00166B9D000D5E9100024B800000457900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000052BCE600BAF4FD00B6F3FC00B8F4FC0052BCE600000000000000
      00001A5CEB007EC0FF006EAFFF002865FF002865FF006EAFFF007EC0FF001A5C
      EB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200DFE7E8002CE2E9000156530016C9CF008AC2CA00F2EFEB00F3EF
      EB00F3EEEA00F3EEE800F3EDE700F3ECE600F3EBE400F3EAE300F3EAE200F3E9
      E000F3E8DF00F3E7DE00F3E6DB00F2EDE800FDFDFD00FBF8F700F4E9E100EAD5
      C700C2B1A600F9F8F80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042B3E3006BCAEC00C1F8FE00C1F8FE0042B3E300000000000000
      0000000000007EC0FF006EAFFF005E9EFF005E9EFF007EC0FF007EC0FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200CBE4E6000FC9CB00046460002ED8E400DDE1E000FCFAF700FCF9
      F500FCF8F300FCF7F200FCF6F000FCF6EF00FCF4ED00FCF4EB00FCF3EA00FCF2
      E800FCF1E600FCF0E500FCEEE200F6F0EB00FEFCFB00F7EEE800ECDACD00DCC2
      B000DAD9D8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001C69F90062ADFE0062ADFE001C69F900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F3F200C2BEE100088E8C000AABA90090E5F000F7F3F100F8F5F100F8F4
      F000F8F3EE00F8F2ED00F8F1EB00F8F1EA00F8F0E900F8EFE700F8EEE600F8EE
      E400F8EDE200F8ECE100F7EADE00F4EFEB00F9F3EE00EFDFD300E4C9B800C6BF
      B900FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000F76FE000F76FE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F3F200E299DC00876EB300809FDD00E9E1EE00F5F2EF00F5F2EE00F5F1
      ED00F5F0EB00F5EFEA00F5EEE900F5EEE800F5EDE600F5ECE400F5ECE300F5EB
      E100F5EAE000F5E9DE00F3E7DC00F5EEEA00F1E4DB00E7CFC000CBC0B800FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E1E700FFC9F500FFD2F400FDFAF900FDFAF800FDFAF600FDF9
      F500FDF8F300FDF7F200FDF6F100FDF6EF00FDF5ED00FDF4EB00FDF3EA00FDF2
      E900FDF1E700FDF0E500F5E9DF00F4E9E200E2D0C300C6BEBA00FCFCFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3F3F300D4D4D400E8E8E800E8E8E700E8E7E700E8E7E600E8E7E500E8E7
      E400E8E6E200E8E6E100E8E5E000E8E4DF00E8E4DE00E8E2DC00E8E2DA00E8E1
      D800E8E0D700E6DED500DAD2CC00C5BEB900E7E5E400FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F1F1F100EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEE00EFEFEE00EFEF
      EE00EFEFEE00EFEEEE00F0EFEF00FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E700F4008200C4001A039C0006099E003300A300AD00D900FA00
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B000DA0028009D000715B0000F2CD6001133E2000D26CC00060A9E006400
      B500F200F9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F700FB007900
      BF0003089A000D27CE001337E9001337EA001236E8001338EB001133E2000716
      B1003600A000E000F00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FB00FD009400CF001A05A2000510A7005000B100DF00F0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EB00F5005100AC000510
      A8001030DD001337EA001235E6001235E6001235E6001235E6001236E8001336
      E8000A1DBC0028009C00CD00E800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000992F0000B7380E00DD432600EF483200F34A3500F6563D00F8644400F75D
      4300F3493500F3493500E5473000C44022000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000FEF3E700FEF0E200FEEEDD00FEEAD700FEE7D100FEE5CA00FEE2
      C400FEE0BD00FEDCB700BC4B0000FED8AD00FED5A900FED1A400FED09F00FECF
      9C00FECC9800FECB9600FECB9600FECB9600FECB9600FECB9600BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DF00F1003902AA000A1DBF001234E4001235E600102BD6001309A300B400
      DD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E400F2003400A0000818B6001235
      E6001337E9001235E6001235E6001235E6001235E6001235E6001235E6001236
      E7001338EA000A1EBF001C009900CB00E7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C300100BF3B1300E1432800F2503700FA674700FA704D00FA664100FA9F
      8F00FAA39700EF432E00E1452D00BC3E1F009835110000630000006700000067
      0000006500000065000000650000005E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000FEF7EE00FEF4EA00FEF2E500FEEFDE00FEEDD900FEE9D300FEE7
      CC00FEE3C600FEE1C000BC4B0000FEDCB500FED8B000FED5AB00FED3A500FED1
      A100FECF9D00FECE9900FECC9700FECB9600FECB9600FECB9600BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BF00
      E1001707A3000F2CD7001235E6001235E6001235E6001235E6001232E2000911
      A9009800D1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CF00E9003300A1000A1DBE001337EA001236
      E7001235E6001235E6001235E6001235E6001235E6001235E6001235E6001235
      E6001235E6001338EB000B21C50020009900CC00E70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A0310300C73C1700E74D3100FA6C4A00FA704D00FB6D4900F86A4D00FBE9
      E600FFF5F200F25A4100DC432900B23B1B009635100001790100008200000082
      0000039008000A9F1900048E060000820000007B000000630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000FEFAF600FEF8F200FEF6ED00FEF3E700FEF0E100FEEEDA00FEEB
      D500FEE9CF00FEE5C900BC4B0000FEE0BD00FEDCB700FED9B200FED7AC00FED4
      A700FED3A400FED09E00FECE9C00FECC9800FECB9600FECB9600BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AB00D800090F
      A6001133E2001235E6001235E6001235E6001235E6001235E6001235E6001234
      E5000713AC009000CD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E400F3003002A3000B1FC0001338EA001236E7001235
      E6001235E6001235E6001235E6001235E6001235E6001235E6001235E6001235
      E6001235E6001236E7001338EB000A1FC0003002A300E600F400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A7330600D03F1C00F3604100FB724E00FB6F4C00FB634000FCA19200FFFF
      FF00FFFAF800FA785B00E5553500A93717009635100000750000018202000FA4
      28001EBD4E0017B0380074D7740015971400007B000000750000005900000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000FEFCFB00B85B2D006E2D13006E2D13006E2D13006E2D13006E2D
      1300D49C8200FEE9D100BC4B0000FEE3C600D5812700D5812700D5812700D581
      2700D5812700D5812700D5812700D5812700D5812700FECB9700BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009F01D4000A12AB001234
      E4001235E6001235E6001235E6001235E6001235E6001235E6001235E6001235
      E6001235E6000613AC00A000D500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F300FA004007AE00102AC400153BEC001438E8001438E8001438
      E8001438E8001438E8001438E8001438E8001438E8001438E8001438E8001438
      E8001438E8001438E8001438E800143AEC000A20BE004B05B100FE00FE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E9492500FF724D00FF724D00FE694400F3745A00FBE9E600FFFF
      FF00FFF5F200FB705400FB6D4900B1411E0093330F000179010014AB330022C2
      550016B7440038BA4500D4FFD3004FC25200007F020000700000005900000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000FEFEFE00AD350900E94B2F00F7634400F86B4D00F4685500E146
      2D006E2D1300FEEDDA00BC4B0000FEE7CF00FEE5C900FEE1C200FEDEBD00FEDC
      B600FED9B100FED7AB00FED4A600FED1A100FECF9E00FECE9A00BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B703E1000E1CB1001337E6001437
      E8001437E8001437E8001437E8001437E8001437E8001437E8001437E8001437
      E8001437E8001436E7000A15AD00C402E7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006808C100122FBF001942EE00153CEB00153CEA00153CEA00153C
      EA00153CEA00153CEA00153CEA00153CEA00153CEA00153CEA00153CEA00153C
      EA00153CEA00153CEA00153CEA00163DEB00153CEA00091FB5008307CD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000082352200E15E3F00A14635006F656800737E84008F96
      9700BD9F9700F0634100FF744E00D0552F0000590000078C110021C454001DC1
      4E0018AF2F0098ED9600DEFFDD005ECF64000AA3250001770300005900000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000FEFEFE00BA390F00F7694600F8654500FCD9D400FBC6BC00E559
      3A006E2D1300FEF0E300BC4B0000FEEBD800FEE9D100FEE6CB00FEE3C500FEE0
      BF00FEDDB800FED9B200FED7AD00FED5A900FED3A400FED0A000BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E302F4001A20B1001840E800163DEA00163D
      EA00163DEA00163DEA00163DEA00163DEA00163DEA00163DEA00163DEA00163D
      EA00163DEA00163DEA00153AE5002015B100EF01F80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B206E2001028B2001F4BEC00163EED00173FEC00173FEC00173FEC00173F
      EC00173FEC00173FEC00173FEC00173FEC00173FEC00173FEC00173FEC00173F
      EC00173FEC00173FEC00173FEC00173FEC001740EE00173EE500131CAD00CB04
      EB00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001A31570014468C000E4EA4000E4A9E000F44
      87002641670059404700000000000000000000000000056E0D001CBF4700119A
      2C0033793500729874008AB5860039A33A0018BA45000C931D00005300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000FEFEFE00E1896E00F86C4900FBA99800FFFFFF00FBBDB000FA6E
      4B00C9927700FEF4EB00BC4B0000FEEFE000D5812700D5812700D5812700D581
      2700D5812700D5812700D5812700D5812700D5812700FED3A600BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005513C400224EE5001841EC001841EC001841
      EC001841EC001841EC001841EC001841EC001841EC001841EC001841EC001841
      EC001841EC001841EC001841EC00173DDB006D0FCB0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FB00
      FD003817BA002756E2001C49F3001842ED001843ED001843ED001843ED001843
      ED001843ED001843ED001843ED001843ED001843ED001843ED001843ED001843
      ED001843ED001843ED001843ED001843ED001843ED001A46F200173ED4005013
      C100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000007407F00136BD5001B7EF7001D7EF8001C7EF7001A77
      EE000F62C7000749970000000000000000000000000000000000012703000117
      050006145400041359000618440005351E000972170003680500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000FEFEFE00FEFEFE00558AD8001B77B0001B7AB4002379AA00B4B5
      C700F3EBE200FEF8F200BC4B0000FEF3E700FEF0E200FEEEDD00FEEAD500FEE9
      D000FEE5CA00FEE2C400FEE0BD00FEDCB800FEDAB200FED7AC00BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D007F0001D46CB001E4CF1001A46EF001A46EF001A46
      EF001A46EF001A46EF001A46EF001A46EF001A46EF001A46EF001A46EF001A46
      EF001A46EF001A46EF001A46EF001C48EF00183AC500E303F500000000000000
      0000000000000000000000000000000000000000000000000000F301FB00A60A
      E1001A42C5002D60F7001845F0001A46EF001A47EF001A47EF001A47EF001A47
      EF001A47EF001A47EF001A47EF001A47EF001A47EF001A47EF001A47EF001A47
      EF001A47EF001A47EF001A47EF001A47EF001A47EF001945F0002454F1001535
      BF00C606EC000000000000000000000000000000000000000000000000000000
      0000000000002373A4001C73CE00258CFB00268EFB00268EFB00258BFA002384
      F4002384F400196DC900135CAB0000000000000000000000000000000000030C
      3500092998000928920007218C00041674000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000FEFEFE006EB8FC002890FA002890FA002890FA002890FA003296
      F800E6E7E700FEFBF800BC4B0000FEF7EF00FEF4EA00FEF2E500FEEFDE00FEED
      D900FEE9D400FEE7CC00FEE3C700FEE1C100FEDEBB00FEDAB500BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006518D200376FF1001C4BF2001C4BF2001C4BF2001C4B
      F2001C4BF2001C4BF2001C4BF2001C4BF2001C4BF2001C4BF2001C4BF2001C4B
      F2001C4BF2001C4BF2001C4BF2001C4BF2002859E5008215DB00000000000000
      0000000000000000000000000000000000000000000000000000BB09EA00491E
      C8003369E800285BF7001A47F1001C4AF1001C4AF1001C4AF1001C4AF1001C4A
      F1001C4AF1001C4AF1001C4AF1001C4AF1001C4AF1001C4AF1001C4AF1001C4A
      F1001C4AF1001C4AF1001C4AF1001C4AF1001C4AF1001B49F1002455F7002352
      DA006518CF00D506F20000000000000000000000000000000000000000000000
      000000000000267DB400288FF2002C97FC002C96FA002C96FA002C96FA002C97
      FB002D98FC002B95FA001660AA00000000000000000000000000020716000C35
      9F000C37A6000C35A0000B329A000A309A00071E870000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000FEFEFE00187DB400309CFB00309CFB00309CFB00309CFB00157B
      B600BDDAEE00FEFCFC00BC4B0000FEFBF600D5812700D5812700D5812700D581
      2700D5812700D5812700D5812700D5812700D5812700FEDEBD00BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003439CF00417DFC001E4FF4001E4FF4001E4FF4001E4F
      F4001E4FF4001E4FF4001E4FF4001E4FF4001E4FF4001E4FF4001E4FF4001E4F
      F4001E4FF4001E4FF4001E4FF4001E4FF400356CF9003D2DCE00000000000000
      00000000000000000000000000000000000000000000000000007617D7002835
      C8004380FB002457F5001C4CF2001E4EF3001E4EF3001E4EF3001E4EF3001E4E
      F3001E4EF3001E4EF3001E4EF3001E4EF3001E4EF3001E4EF3001E4EF3001E4E
      F3001E4EF3001E4EF3001E4EF3001E4EF3001E4EF3001E4DF3001D4DF400346C
      F200362BC7009511DF0000000000000000000000000000000000000000000000
      00002A7EA6002984C4002E9AFC002F9CFC002F9CFB002F9CFB00309DFC00309D
      FC002F9CFB00319FFF00227BCC00000000000000000000000000082463000F48
      C5000E43B7000E43B7000E43B7000F45BA000C39A900071F8100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000FEFEFE00055A970033A0FB0033A0FB0033A0FB0033A0FB001278
      B000BAD8E900FEFEFE00BC4B0000FEFCFB00FEFBF700FEFAF300FEF7EE00FEF3
      E900FEF2E300FEEFDE00FEEBD800FEE9D300FEE6CC00FEE3C600BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002057D7004582FC002055F6002055F6002055F6002055
      F6002055F6002055F6002055F6002055F6002055F6002055F6002055F6002055
      F6002055F6002055F6002055F6002055F6003973FB002051D500000000000000
      0000000000000000000000000000000000000000000000000000472AD1002155
      D5004986FE002559F7001E50F5001F51F5001F51F5001F51F5001F51F5001F51
      F5001F51F5001F51F5001F51F5001F51F5001F51F5001F51F5001F51F5001F51
      F5001F51F5001F51F5001F51F5001F51F5001F51F5001F52F5001C4DF5003F79
      FB001C4CCE005025D10000000000000000000000000000000000000000000000
      00002A7EA6002C89C700329FFF00329FFF00319EFA002F99F7002B8EEF002C91
      F200319EFA00319EFC002581D4000000000000000000000000000C3581001357
      D8001151C900114DC500114EC6001253CC001253CC0008228300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000FEFEFE004588AF00055A9700085F9F00085F9F00116EB5001363
      9700FEFEFE00FEFEFE00BC4B0000FEFEFE00FEFCFB00FEFBF800FEFAF400FEF7
      F000FEF4EB00FEF2E600FEEFE100FEEEDA00FEEAD400FEE7CF00BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002561DF005291FE00245BF9002259F9002259F9002259
      F9002259F9002259F9002259F9002259F9002259F9002259F9002259F9002259
      F9002259F9002259F9002259F9002259F9004784FD002460DF00000000000000
      00000000000000000000000000000000000000000000000000003837D2002D66
      E1004E8CFF00285EF8001F53F6002155F7002155F7002155F7002155F7002155
      F7002155F7002155F7002155F7002155F7002155F7002155F7002155F7002155
      F7002155F7002155F7002155F7002155F7002155F7002155F7001E52F6004380
      FD002963DE003635D10000000000000000000000000000000000000000000000
      00002A7FA9002B80AF002D8BC6002D89C2002E8CCC00329DFA00309AF800309A
      F700319DF8002E97F6002279CB000000000000000000000000000C316A001970
      F4001663D9001457CB00155AD0001660D8001355C90008218200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000FEFEFE00EAF2F700669FBF0006558900004B820028739F00C0D8
      E300FEFEFE00FEFEFE00BC4B0000FEFEFE00D5812700D5812700D5812700D581
      2700D5812700D5812700D5812700D5812700D5812700FEEBD800BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002758DF005898FF003D79FD00245EFC00245EFC00245E
      FC00245EFC00245EFC00245EFC00245EFC00245EFC00245EFC00245EFC00245E
      FC00245EFC00245EFC00245EFC002F6AFD005897FF00235EE000000000000000
      0000000000000000000000000000000000000000000000000000393DD700316D
      E7005898FF003069FA002055F8002259F9002259F9002259F9002259F9002259
      F9002259F9002259F9002259F9002259F9002259F9002259F9002259F9002259
      F9002259F9002259F9002259F9002259F9002259F9002157F800265DF9004E8C
      FF00316EE700393CD70000000000000000000000000000000000000000000000
      00002A7FAA002A7FA9002A7EA600297BA1002F91D50035A5FF0033A1FC0034A1
      FC0033A1FC0035A5FF0018609E00000000000101010006040300051121001B78
      F0001F86FF001F82FF001E81FF001E81FF00165FD50010439A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00BC4B0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFC
      FC00FEFBF800FEFAF300FEF7EF00FEF4EB00FEF3E500FEEFE000BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000533AE6005495FC005B9BFF003773FE002863FE002863
      FE002863FE002863FE002863FE003976FE004481FE002864FE002863FE002863
      FE002863FE002863FE002F6AFE005493FF005696FD004741E600000000000000
      0000000000000000000000000000000000000000000000000000383FDB002B6A
      E5005B9BFF004582FD00225AFB00235CFB00245CFB00245CFB00245CFB00245C
      FB00245CFB00245CFB00245CFB00235BFB00225BFB00245CFB00245CFB00245C
      FB00245CFB00245CFB00245CFB00245CFB00245CFB002058FB003570FC005A9A
      FF002F6EE8003941DC0000000000000000000000000000000000000000000000
      0000000000002A7FAA002A7FAA002A7EA6002D8BC600329DF30033A1FC0033A1
      FC00329EFB002682CF000000000000000000010101001918180017151300091F
      3B000F4A9100155FB8001A6FD700196BD30009234D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00BC4B0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFCFC00FEFCFA00FEFBF700FEF8F200FEF6ED00FEF3E700BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C216F7002D76EF005F9FFF005E9EFF004B8AFF003574
      FF002F6DFF003876FF004D8CFF005B9BFE005B9CFE005392FF003B79FF00306E
      FF003371FF004583FF005C9CFF005F9FFF00317AF100B61AF500000000000000
      00000000000000000000000000000000000000000000000000005832E3001F5A
      DF005A9AFE005B9BFF003773FD00235DFC002560FC002660FC002660FC002660
      FC002660FC002660FC00255FFC002661FC002A64FC00245EFC002660FC002660
      FC002660FC002660FC002660FC002660FC00245EFC002964FC00518FFF005B9B
      FF002062E200473ADF0000000000000000000000000000000000000000000000
      000000000000000000002A7FAA002A7FAA002A7EA6002B80AF002D88C0002C89
      C7002B87C100185D9C0000000000000000000000000011111100515050004641
      3E0028262500090A0B00010204000001030000010E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000D9640100D9640100D9640100D9640100D9640100D9640100D964
      0100D9640100D9640100D9640100D9640100D9640100D9640100D9640100D964
      0100D9640100D9640100D9640100D9640100D9640100D9640100BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007835F2003B86F70063A3FF0063A3FF0063A3
      FF0062A3FF0062A3FF005C9EFE002B6DF0002B6DF1005B9EFE0062A3FF0062A3
      FF0062A3FF0062A3FF0062A3FF003B86F600623DF20000000000000000000000
      00000000000000000000000000000000000000000000000000009F1DF0003C42
      E3004C8DF80060A0FF005898FF003674FE002561FE002561FE002762FE002763
      FE002662FE002460FE002965FE004786FF005291FF002F6CFE002460FE002661
      FE002763FE002763FE002661FE002460FE002D69FE004D8CFF0060A0FF005091
      FA003348E2008C24ED0000000000000000000000000000000000000000000000
      00000000000000000000000000002A7FAA002A7FAA002A7FA9002A7EA6002A7D
      A500000000000000000000000000000000000000000000000000202020006C6C
      6C00898888003535330000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008A33F8002C75F5004993FC005A9E
      FE00559BFE003C8BFB003B5EF500CD15FC00CE15FB003A5FF5003D8BFA00569C
      FD00599EFE004994FC002676F5008136F700FB01FE0000000000000000000000
      0000000000000000000000000000000000000000000000000000EB06FC009424
      F1002670EC0061A1FF0061A1FF005D9EFF004786FF003371FF002B68FF002966
      FF002F6CFF003978FF005392FF0061A1FF0061A1FF005A99FF00407EFF00316E
      FF002A67FF002A67FF00306EFF003F7DFF005797FF0062A2FF0062A1FF002C75
      EE00832AEF00E608FB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000505
      05000B0B0B000505050000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E90BFE009D2DFB008639
      FC008639FC00B721FC00FB01FF000000000000000000FB02FF00B721FD008639
      FC008639FC009D2DFC00E80AFE00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F503
      FD004646EB003A84F50066A5FF0065A4FF0064A4FF005F9FFF005696FF005494
      FF005A9AFF0067A6FF0064A4FF00307CF200307CF20063A3FF0068A7FF005D9D
      FF005594FF005594FF005C9CFF0063A4FF0065A5FF0065A5FF003B84F500364D
      EB00F005FD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E40AFC003D50F0003885F7005FA1FE006AA8FF0068A8FF0069A8FF006AAA
      FF006BAAFF005B9EFD002B7CF5005642F1005642F1002B7CF5005A9EFD006AA9
      FF006AAAFF0068A9FF0068A8FF0069A8FF005EA1FE003785F7002C57EF00CF13
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E30BFD006541F6001F73F5003A8AFA004F98FD00569DFE004B96
      FC003486FA00206DF4008234F700F703FE00F703FE008234F700206DF4003486
      FA004B96FC00569DFE004F98FD003A8AFA001C76F6005946F600DF0DFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F802FE00AC24FB00594AF9003C60F9003D63FA003A5F
      F8006644F900BE1CFC00FB01FE000000000000000000FB01FE00BE1CFC006644
      F9003A5FF8003D63FA003C60F900594AF900AB24FB00F404FE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002030100020301000203
      0100020301000203010002030100020301000203010002030100020301000203
      0100020301000203010002030100020301000203010002030100020301000203
      0100020301000203010002030100020301000203010002030100020301000203
      0100020301000203010002030100000000000000000002030100020301000203
      0100020301000203010002030100020301000203010002030100020301000203
      0100020301000203010002030100020301000203010002030100020301000203
      0100020301000203010002030100020301000203010002030100020301000203
      0100020301000203010002030100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000050C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000050C00000000000000000000050C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000050C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010A1700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00010A17000000000000000000010A1700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00010A1700000000000000000000000000000000000000
      00000000000000000000E5E5E500CCCCCC00E5E5E500FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFCFC00E5E5E500CFCFCF00E5E5E500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F112F100A282A200969696009696960096969600969696009696
      9600C27C2500C57A1D00C57A1D00C57A1D00C57A1D00C57A1D00C57A1D00C27C
      25009696960096969600969696009696960096969600A282A200F112F1000000
      00000000000000000000000000000000000000000000010A1700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00010A17000000000000000000010A1700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00010A1700000000000000000000000000000000000000
      0000000000007FB6F200006EE400669CD700BFC5CD00CFCFCF00ECECEC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DDE1E900698BCC000D4AC5006686C700E9E9E900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BF5FBF00AB7BAB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C97F2300EEB76400EDAC5100EDAC5100EDAC5100EDAC5100EEB76400C97F
      2300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AB7BAB00BF5FBF000000
      00000000000000000000000000000000000000000000020E2200FFFFFF00FFFF
      FF00FFFFFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FB
      FF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FB
      FF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00FFFF
      FF00FFFFFF00FFFFFF00020E22000000000000000000020E2200FFFFFF00FFFF
      FF00FFFFFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FB
      FF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FB
      FF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00F6FBFF00FFFF
      FF00FFFFFF00FFFFFF00020E2200000000000000000000000000000000000000
      000000000000AFD2F700006FE500006EE5000D70E0007FA5D300CCCCCC00D6D6
      D600F2F2F200000000000000000000000000000000000000000000000000F2F2
      F20087A3D3001A5ACA00004ACB000044C600728FC800F5F5F500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B373B300FFFFFF00E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600CF882F00F3C57800EFB45D00EFB45D00EFB45D00EFB45D00F3C57800CF88
      2F00E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600FFFFFF00B373B3000000
      0000000000000000000000000000000000000000000002132C00FFFFFF00FFFF
      FF00FFFFFF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5
      FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5
      FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00FBFD
      FE00FFFFFF00FFFFFF0002132C00000000000000000002132C00FFFFFF00FFFF
      FF00FFFFFF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5
      FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5
      FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00E8F5FF00FBFD
      FE00FFFFFF00FFFFFF0002132C00000000000000000000000000000000000000
      000000000000DFEDFB000071E600007BFC000075F2000068E1002678DB0099B2
      D100CCCCCC00DCDCDC00F9F9F9000000000000000000F9F9F900A7BBDB00336F
      CD00004ECC00005FE0000073F9000047C700A6B2CB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B676B600FFFFFF00E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600D38D3400F4CA8000F1BB6900F1BB6900F1BB6900F1BB6900F4CA8000D38D
      3400E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600FFFFFF00B676B6000000
      0000000000000000000000000000000000000000000022324B00FFFFFF00FFFF
      FF00FFFFFF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0
      FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0
      FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00FDFE
      FF00FFFFFF00FFFFFF0002132C00000000000000000022324B00FFFFFF00FFFF
      FF00FFFFFF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0
      FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0
      FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00DBF0FF00FDFE
      FF00FFFFFF00FFFFFF0002132C00000000000000000000000000000000000000
      000000000000000000002083EA000089F800008FFF000083FF000070E9000065
      DF004084D800B2BECD00CCCCCC00E5E5E500C8D3E2004E84D1000055D200005F
      DE00007DF800008FFF00006EEE000048C800D9D9D90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B979B900FFFFFF00E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600D9964000F7D49100F4C97E00F4C97E00F4C97E00F4C97E00F7D49100D996
      4000E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600FFFFFF00B979B9000000
      00000000000000000000000000000000000000000000031A3D00FFFFFF00FFFF
      FF00FFFFFF00D7EEFF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00CDEA
      FF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00CDEA
      FF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00D7EEFF00FFFF
      FF00FFFFFF00FFFFFF00031A3D000000000000000000031A3D00FFFFFF00FFFF
      FF00FFFFFF00D7EEFF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00CDEA
      FF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00CDEA
      FF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00CDEAFF00D7EEFF00FFFF
      FF00FFFFFF00FFFFFF00031A3D00000000000000000000000000000000000000
      0000000000000000000050A0EF000083F10000A8FF00009DFF00008EFF000083
      F900006AE4000062DB006696D3006695D2000D62D500005FDA00007BF200009E
      FF0000A8FF000098FF000067E400336ACA00E5E5E50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B979B900FFFFFF00E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600DD9A4600F8D99900F6CF8700F6CF8700F6CF8700F6CF8700F8D99900DD9A
      4600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600FFFFFF00B979B9000000
      00000000000000000000000000000000000000000000031A3D00B0B8C300FFFF
      FF00FFFFFF00FFFFFF00F4FAFF00E4F4FF00D2ECFF00BFE4FF00BFE4FF00BFE4
      FF00BFE4FF00BFE4FF00BFE4FF00BFE4FF00BFE4FF00BFE4FF00BFE4FF00BFE4
      FF00BFE4FF00BFE4FF00CDEAFF00E4F4FF00F7FCFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B0B8C300031A3D000000000000000000031A3D00042659000426
      590004265900FFFFFF00F4FAFF00E4F4FF00D2ECFF00BFE4FF00BFE4FF00BFE4
      FF00BFE4FF00BFE4FF00BFE4FF00BFE4FF00BFE4FF00BFE4FF00BFE4FF00BFE4
      FF00BFE4FF00BFE4FF00CDEAFF00E4F4FF00F7FCFF00FFFFFF00FFFFFF00FFFF
      FF000426590004265900031A3D00000000000000000000000000000000000000
      000000000000000000007FBAF400007CED0000B0FF0000B0FF0000AAFF000099
      FF000096FF00007DF1000065DF000062DE00007AEE00009FFF0000ADFF0000B0
      FF0000B0FF00009AFF00005AD600668BCC00EFEFEF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BC7CBC00FFFFFF00E9E9E900E8E8E800E7E7E700E7E7E700E6E6
      E600E4A35200FAE2A700F8DA9900F8DA9900F8DA9900F8DA9900FAE2A700E4A3
      5200E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600FFFFFF00BC7CBC000000
      0000000000000000000000000000000000000000000000000000233D6400EFF1
      F500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFDFE00E8F5FF00D2EC
      FF00B6E0FF00B1DFFF00B1DFFF00B1DFFF00B1DFFF00B1DFFF00B1DFFF00C1E5
      FF00DFF2FF00F6FBFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFF1F500233D640000000000000000000000000000000000233D64000426
      5900042659000426590004265900FFFFFF0004265900FBFDFE00E8F5FF00D2EC
      FF00B6E0FF00B1DFFF00B1DFFF00B1DFFF00B1DFFF00B1DFFF00B1DFFF00C1E5
      FF00DFF2FF00F6FBFF00FFFFFF0004265900FFFFFF0004265900042659000426
      590004265900233D640000000000000000000000000000000000000000000000
      00000000000000000000BFDDFA000076EB0000B2FF0000B6FF0000B6FF0001B5
      FF0004A5FF00059EFF00059EFF0003A6FF0001B3FF0000B6FF0000B6FF0000B6
      FF0000B6FF00059EFF00004FCE008CA4CC00FCFCFC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BF7FBF00FFFFFF00EAEAEA00E9E9E900E8E8E800E8E8E800E7E7
      E700E7A75800FBE6AE00FAE0A100FAE0A100FAE0A100FAE0A100FBE6AE00E7A7
      5800E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600FFFFFF00BF7FBF000000
      000000000000000000000000000000000000000000000000000000000000233D
      6400233D6400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EEF8FF00CDEAFF00B6E0FF00B6E0FF00D7EEFF00F4FAFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00233D
      6400233D6400000000000000000000000000000000000000000006357C000426
      5900233D64000426590004265900042659000426590004265900FFFFFF00FFFF
      FF00FFFFFF00EEF8FF00CDEAFF00B6E0FF00B6E0FF00D7EEFF00F4FAFF00FFFF
      FF00FFFFFF00042659000426590004265900042659000426590004265900233D
      6400042659000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000078EC0000A7FD0005BEFF0005BEFF0005BE
      FF0005BEFF0007B3FF0007B7FF0005BEFF0005BEFF0005BEFF0005BEFF0005BE
      FF0007B7FF000390F8000052D000C5CAD1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BF7FBF00FFFFFF00ECECEC00ECECEC00EBEBEB00EAEAEA00E9E9
      E900EEB06300FCEDBA00FCE9AF00FCE9AF00FCE9AF00FCE9AF00FCEDBA00EEB0
      6300E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600FFFFFF00BF7FBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000042659000426590091A0B600DFE4EA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFF1F500A1AEC2000426590004265900042659000000
      0000000000000000000000000000000000000000000000000000000000000635
      7C00042659000426590004265900042659000426590004265900042659000426
      5900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000426
      5900042659000426590004265900042659000426590004265900042659000426
      5900042659000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003093F000009EF9000AC6FF000AC6FF000AC6
      FF000AC6FF000AC6FF000AC6FF000AC6FF000AC6FF000AC6FF000AC6FF000AC6
      FF000FB9FF000081EC001A63D100DCDCDC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009F00
      D4007F01C500A777AF00FFFFFF00EDEDED00EDEDED00ECECEC00EBEBEB00EAEA
      EA00F1B56900FDF0BF00FDEDB500FDEDB500FDEDB500FDEDB500FDF0BF00F1B5
      6900E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600FFFFFF00AF7FB8007F01
      C5009F00D4000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000426590004265900042659007286A500D0D7
      E100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF1
      F500A1AEC2000426590004265900042659000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000426
      5900042659000426590004265900042659000426590004265900042659000426
      590004265900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000426
      5900042659000426590004265900042659000426590004265900042659000426
      5900000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006FB3F400008EF20011CDFF0011CDFF0011CD
      FF0011CDFF0011CDFF0011CDFF0011CDFF0011CDFF0011CDFF0011CDFF0011CD
      FF0016BEFF000073E400407AD100D6D6D600FCFCFC0000000000000000000000
      00000000000000000000000000000000000000000000000000007004C4001233
      DA00163DEA000513A5000F139A00E8E8E800EFEFEF00EFEFEF00EEEEEE00EDED
      ED00F8BE7500FEF5C900FEF3BF00FEF3BF00FEF3BF00FEF3BF00FEF5C900F8BE
      7500E6E6E600E6E6E600E6E6E600E5E5E500E6AAE6000F139A000513A500163D
      EA001233DA007004C40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000052C6700052C
      670014396F00B0BBCA00FFFFFF00FFFFFF00FFFFFF00FFFFFF008295B200052C
      6700052C67000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000426590006357C00042659000426590006357C0004265900052C6700052C
      670014396F00B0BBCA00FFFFFF00FFFFFF00FFFFFF00FFFFFF008295B200052C
      6700052C67000426590004265900042659000426590006357C00042659000426
      5900000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E6EEF500288EEB000085F10017D4FF0017D4FF0017D4
      FF0017D4FF0017D4FF0017D4FF0017D4FF0017D4FF0017D4FF0017D4FF0017D4
      FF0020C0FF000071E100266CD100BFC4CC00CFCFCF00F5F5F500000000000000
      0000000000000000000000000000000000000000000000000000020F9A00204D
      EF00173FEB00153CE6000618A900B4AED100DCDCDC00F0F0F000EFEFEF00EEEE
      EE00FBC27A00FFFAED00FFFAED00FFFAED00FFFAED00FFFAED00FFFAED00FBC2
      7A00E6E6E600E6E6E600E6E6E600D6D6D600B795D3000618A900153CE600173F
      EB00204DEF00020F9A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000052C
      670034558800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF1F5003455
      8800052C67000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000042659000426590006357C0004265900042659000426590006357C00052C
      670034558800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF1F5003455
      8800052C67000426590004265900042659000426590004265900042659000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C7DFF5002790EC000085F20013CAFF001DDBFF001DDBFF001DDB
      FF001DDBFF001DDBFF001DDBFF001DDBFF001DDBFF001DDBFF001DDBFF001FD9
      FF0029C8FF001CB3FC00006DDE000D5DD300A6B6CD00CFCFCF00F5F5F5000000
      00000000000000000000000000000000000000000000000000002213AF004A87
      F9004B8AFE001944EE001944EE000721B1001125A700DDDDDD00EAEAEA00F0F0
      F000F0F0F000F0F0F000EFEFEF00EEEEEE00EDEDED00ECECEC00EBEBEB00E9E9
      E900E8E8E800E6E6E600D6D6D6001024A7000721B1001944EE001944EE004B8A
      FE004A87F9002213AF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000254B
      8500EFF1F500FFFFFF00FFFFFF00DFF2FF00F4FAFF00FFFFFF00FFFFFF00EFF1
      F500254B85000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000042659000426590006357C000426590006357C0006357C00254B
      8500EFF1F500FFFFFF00FFFFFF00DFF2FF00F4FAFF00FFFFFF00FFFFFF00EFF1
      F500254B850006357C0004265900042659000426590004265900042659000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C2DBF0000D8BF4000399F80032E1FF0024E4FF0024E4FF0024E4FF0024E4
      FF0024E4FF0024E4FF0024E4FF0024E4FF0024E4FF0024E4FF0024E4FF0024E4
      FF002ADAFF0030D0FF002BC8FF00006DDE000D5DD300A6B5CD00CCCCCC00ECEC
      EC00000000000000000000000000000000000000000000000000000000004A87
      F9004E8AFA002555F2001A47EF001944EB000825B600B5BAD400DDDDDD00F2F2
      F200F1F1F100F0F0F000EFEFEF00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEA
      EA00E9E9E900D8D8D800ADB2CC000825B6001944EB001A47EF002555F2004E8A
      FA004A87F9000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000006357C00C0CC
      DD00FFFFFF00FFFFFF00F4FAFF005DBAFE0072C3FE00F4FAFF00FFFFFF00FFFF
      FF00C0CCDD0006357C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000426590004265900042659000426590006357C00C0CC
      DD00FFFFFF00FFFFFF00F4FAFF005DBAFE0072C3FE00F4FAFF00FFFFFF00FFFF
      FF00C0CCDD0006357C0006357C0006357C000426590004265900000000000000
      000000000000000000000000000000000000000000000000000000000000A2CE
      F0000D8FF8000EA6FC0038E7FF002BECFF002BECFF002BECFF002BECFF002BEC
      FF002BECFF002BECFF002BECFF002BECFF002BECFF002BECFF002BECFF002BEC
      FF002BECFF002DE7FF0033D9FF002ECDFF000484E6000055D2007F9ECD00CCCC
      CC00E9E9E9000000000000000000000000000000000000000000000000000000
      00001424B6005492FA005594FE001D4CF2001D4CF2000A2EBE001333B500DEDE
      DE00EBEBEB00F2F2F200F2F2F200F0F0F000F0F0F000EEEEEE00EEEEEE00EBEB
      EB00DBDBDB001232B5000A2EBE001D4CF2001D4CF2005594FE005492FA001424
      B600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004469A100FFFF
      FF00FFFFFF00FFFFFF006DBEFD004CAFFD004CAFFD006DBEFD00FFFFFF00FFFF
      FF00FFFFFF004469A10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000042659000426590006357C00042659004469A100FFFF
      FF00FFFFFF00FFFFFF006DBEFD004CAFFD004CAFFD006DBEFD00FFFFFF00FFFF
      FF00FFFFFF004469A10006357C00042659000426590004265900000000000000
      00000000000000000000000000000000000000000000000000008DC4EC000090
      FD002EB8FF0055F8FF0032F2FF0032F2FF0032F2FF0032F2FF0032F2FF0032F2
      FF0032F2FF0032F2FF0032F2FF0032F2FF0032F2FF0032F2FF0032F2FF0032F2
      FF0032F2FF0032F2FF0032F2FF0035E6FF0039D9FF000584E5000054D2007295
      CD00CCCCCC00DFDFDF0000000000000000000000000000000000000000000000
      0000000000005492FA005796FB00295DF5001E4EF3001C4CEF000A33C200B6BE
      D800DFDFDF00F3F3F300F3F3F300F2F2F200F1F1F100F0F0F000EFEFEF00DDDD
      DD00B1B8D2000A33C2001C4CEF001E4EF300295DF5005796FB005492FA000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000073B8B00C1CDE100FFFF
      FF00FFFFFF00B9DEFD0046A8FC0046A8FC0046A8FC0046A8FC00B9DEFD00FFFF
      FF00FFFFFF00C1CDE100073B8B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000426590004265900073B8B00C1CDE100FFFF
      FF00FFFFFF00B9DEFD0046A8FC0046A8FC0046A8FC0046A8FC00B9DEFD00FFFF
      FF00FFFFFF00C1CDE100073B8B00042659000426590000000000000000000000
      0000000000000000000000000000000000000000000062B6F0000095FF003DC3
      FF0075FFFF0039FBFF0039FBFF0039FBFF0039FBFF0039FBFF0039FBFF0039FB
      FF0039FBFF0039FBFF0039FBFF0039FBFF0039FBFF0039FBFF0039FBFF0039FB
      FF0039FBFF0039FBFF0039FBFF0039FBFF003BF6FF003DE4FF00149FEE000054
      D2004D7FCD00CCCCCC00DFDFDF00000000000000000000000000000000000000
      000000000000389DCE000E40C30063A4FF005F9FFE002053F6002053F6000C3C
      CA001541C300E0E0E000EDEDED00F4F4F400F3F3F300F1F1F100E0E0E0001441
      C2000C3CCA002053F6002053F6005F9FFE0063A4FF001632C200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000026569F00FFFFFF00FFFF
      FF00FFFFFF0058ADFB0040A1FA0040A1FA0040A1FA0040A1FA0058ADFB00FFFF
      FF00FFFFFF00FFFFFF0026569F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000042659000426590026569F00FFFFFF00FFFF
      FF00FFFFFF0058ADFB0040A1FA0040A1FA0040A1FA0040A1FA0058ADFB00FFFF
      FF00FFFFFF00FFFFFF0026569F00042659000426590000000000000000000000
      00000000000000000000000000000000000060C1FF00009AFF002EBFFF0098F0
      FF00CAFFFF00CAFFFF00A5FFFF00A5FFFF0092FFFF0081FFFF0081FFFF0058FF
      FF0041FFFF0041FFFF0041FFFF0041FFFF0041FFFF0041FFFF0060FFFF0078FF
      FF0081FFFF0081FFFF0089FFFF00A5FFFF00A5FFFF00A5FFFF0071D3FC001E88
      E5000053D0004D7FCD00D9D9D900000000000000000000000000000000000000
      0000000000003DA2D20073C0EC0063A4FF0067A7FF002E65F9002156F7001F54
      F4000C40CE00B8C2DC00E1E1E100F5F5F500F5F5F500E1E1E100B5BFD9000C40
      CE001F54F4002156F7002E65F90067A7FF0063A4FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007494C600FFFFFF00FFFF
      FF00C1DFFD003A9BF9003A9BF9003A9BF9003A9BF9003A9BF9003A9BF900C1DF
      FD00FFFFFF00FFFFFF007494C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000426590006357C007494C600FFFFFF00FFFF
      FF00C1DFFD003A9BF9003A9BF9003A9BF9003A9BF9003A9BF9003A9BF900C1DF
      FD00FFFFFF00FFFFFF007494C600042659000426590000000000000000000000
      00000000000000000000000000000000000050BBFF00009CFF000099FF000096
      FF000094FF000090FD0009A2FD0015A8FD0022AFFC004BC4FD004BC3FD00A8F3
      FF0053FFFF0043FFFF0043FFFF0043FFFF0043FFFF0053FFFF00B8FCFF004BB6
      F3004BB5F3002295EB001589E700097DE200005ED900005BD8000059D5000057
      D4000055D200407DDB0000000000000000000000000000000000000000000000
      00000000000043A7D50084CDEF0042AFE4000D4CD0006DAFFF0069A9FF00235B
      FA00235BFA000E49D700164FD000E2E2E200E4E4E400164FD0000E49D700235B
      FA00235BFA0069A9FF006DAFFF001740D1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000847A500B1C4E100FFFFFF00FFFF
      FF007FBBFA003394F8003394F8003394F8003394F8003394F8003394F8007FBB
      FA00FFFFFF00FFFFFF00B1C4E1000847A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000426590004265900B1C4E100FFFFFF00FFFF
      FF007FBBFA003394F8003394F8003394F8003394F8003394F8003394F8007FBB
      FA00FFFFFF00FFFFFF00B1C4E100042659000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DFF1
      FF00BFE4FF00BFE3FE007FC6FD007FC5FC0060B6FB0040A5F9002093F70015A1
      F80094FFFF0043FFFF0043FFFF0043FFFF0043FFFF0094FFFF002EA6F1000D73
      E2003B8AE4005096E9007FB1EE007FB0EC00AFCDF300BFD6F500DFEAF9000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000048ACD9008ED3F20054B9E80042AFE4006DAFFF0071B2FF00336D
      FC00255DFB00235CF8000E4DDB00D5D9E200D5D9E1000E4DDB00235CF800255D
      FB00336DFC0071B2FF006DAFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000847A500EFF3F900FFFFFF00FFFF
      FF00479BF8002D8DF7002D8DF7002D8DF7002D8DF7002D8DF7002D8DF700479B
      F800FFFFFF00FFFFFF00EFF3F9000847A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000426590004265900EFF3F900FFFFFF00FFFF
      FF00479BF8002D8DF7002D8DF7002D8DF7002D8DF7002D8DF7002D8DF700479B
      F800FFFFFF00FFFFFF00EFF3F900042659000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AFD8FC000084
      F6009FF3FF004BFFFF0043FFFF0043FFFF0053FFFF00A8F2FF000071E70083AD
      D900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000053B7DF00A1E2F60077CEEF0077CEEF004BA8E1000D59DD0078B9
      FF0069A9FF002762FE002762FE001057E3001057E3002762FE002762FE0069A9
      FF0078B9FF00184EDE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000094CB300FFFFFF00FFFFFF00FFFF
      FF002786F5002786F5002786F5002786F5002786F5002786F5002786F5002786
      F500FFFFFF00FFFFFF00FFFFFF00094CB3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004265900FFFFFF00FFFFFF00FFFF
      FF002786F5002786F5002786F5002786F5002786F5002786F5002786F5002786
      F500FFFFFF00FFFFFF00FFFFFF00042659000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002094
      F8002EB2FB0083FFFF0043FFFF0043FFFF0083FFFF004BBCF8001A7EE500E5E5
      E500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000059BCE300ABE8F80088D8F30088D8F30059BCE3000000000078B9
      FF007BBDFF002D6AFF002865FF002865FF002865FF002865FF002D6AFF007BBD
      FF0078B9FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001859BC00FFFFFF00FFFFFF00F1F6
      FE00217FF400217FF400217FF400217FF400217FF400217FF400217FF400217F
      F400FFFFFF00FFFFFF00FFFFFF00094CB3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004265900FFFFFF00FFFFFF00F1F6
      FE00217FF400217FF400217FF400217FF400217FF400217FF400217FF400217F
      F400FFFFFF00FFFFFF00FFFFFF00042659000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009FD1
      FB000085F700B0FDFF0043FFFF004BFFFF00B0FCFF000081ED0067A2DD00FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000052BCE600BAF4FD00B6F3FC00B8F4FC0052BCE600000000000000
      00001A5CEB007EC0FF006EAFFF002865FF002865FF006EAFFF007EC0FF001A5C
      EB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000195CC300FFFFFF00FFFFFF00F1F6
      FE001B78F3001B78F3001B78F3001B78F3001B78F3001B78F3001B78F3001B78
      F300FFFFFF00FFFFFF00FFFFFF000952BF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004265900FFFFFF00FFFFFF00F1F6
      FE001B78F3001B78F3001B78F3001B78F3001B78F3001B78F3001B78F3001B78
      F300FFFFFF00FFFFFF00FFFFFF00042659000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFF7
      FE00108EF7004BC3FD0072FFFF0072FFFF0059C7FC000D7FEB00D1D8DF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042B3E3006BCAEC00C1F8FE00C1F8FE0042B3E300000000000000
      0000000000007EC0FF006EAFFF005E9EFF005E9EFF007EC0FF007EC0FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A57CA00FFFFFF00FFFFFF00FFFF
      FF001471F1001471F1001471F1001471F1001471F1001471F1001471F1001471
      F100FFFFFF00FFFFFF00FFFFFF000A57CA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004265900FFFFFF00FFFFFF00FFFF
      FF001471F1001471F1001471F1001471F1001471F1001471F1001471F1001471
      F100FFFFFF00FFFFFF00FFFFFF00042659000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007FC3FB00008EF800B7FFFF00B7FFFF00008EF3004D9AE300F9F9F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001C69F90062ADFE0062ADFE001C69F900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A57CA00D1DFF600FFFFFF00FFFF
      FF00A5C7F9002C7DF2000E6AF0000E6AF0000E6AF0000E6AF0002C7DF200A5C7
      F900FFFFFF00FFFFFF00D1DFF6000A57CA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004265900D1DFF600FFFFFF00FFFF
      FF00A5C7F9002C7DF2000E6AF0000E6AF0000E6AF0000E6AF0002C7DF200A5C7
      F900FFFFFF00FFFFFF00D1DFF600042659000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFF7FE000089F80067D4FF0067D3FE000081F200C0CFDE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000F76FE000F76FE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006699E500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006699E500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000004265900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0004265900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000060B6FB000096F90015A2F9004099E700F2F2F200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B5EDC00A3C3F200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A3C3F2000B5EDC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B5EDC0004265900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00042659000B5EDC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFF0FE00008AF9000087F700A0C1DD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000B62E4004889
      EC00B3CEF700EFF5FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF5FD00B3CE
      F7004889EC000B62E40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000B62E4000426
      5900B3CEF700EFF5FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFF5FD00B3CE
      F700042659000B62E40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000040A8FA00309FF9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000C65EC000C65EC000C65EC000C65EC000C65EC000C65EC000C65EC000C65
      EC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000042659000426590004265900042659000426590004265900042659000426
      5900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00F9F9F900FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00000000000000
      00000000000000000000000000000000000000000000FEFEFE00FCFCFC00F1F1
      F100E0E0DF00CCCCCA00B8B7B400A5A5A00090877300A8884700D6AC4A00EDC4
      5C00F6CE6600F5CD5F00E9BE4C00D0A239009D7F40008C857600A4A4A100B7B7
      B400CCCCCA00E0E0DF00F1F1F000FCFCFC00FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F4F4F400CFCFCE00E1E1E000E1E1E000E1E0E000E1E0E000E1E0DF00E1E0
      DD00E1E0DC00E1E0DA00E1DFDA00DFDDD800AFAAA500D7D2CC00E1DBD400E1DA
      D300E1DAD200E1DAD100E1D9D000E1D8CF00E1D7CD00E1D7CC00E1D6CB00E1D6
      CB00E1D7CB00CAC5C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F1F1F100ADADBF008484A100C8C8CB00F6F6F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FDFDFC00FAFAFA00F7F7F600F4F3F300F0EFEE00EBEB
      EA00E8E7E500E4E4E100E2E1DE00E0DFDC00DFDFDC00DFDFDC00E2E1DF00E5E5
      E300E8E8E600ECECEA00F0F0EF00F4F4F300F8F7F700FBFBFB00FDFDFD000000
      000000000000000000000000000000000000FFFFFF00FEFEFE00FEFEFE00FDFD
      FD00FBFAFA00F7F7F600DBD6CA00D7AB4E00FBCE5200FFE17C00FFE89700FFEC
      A800F0EAB600CACFCA00F2DE9800FFE48500FFDB6900FAC84000D1A95300E2DE
      D600F7F7F600FBFBFA00FDFDFD00FEFEFE00FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FFFEFC00FFFEFC00FFFDFB00FFFCFA00FFFCF800FFFB
      F700FFFAF500FFF9F400FFF9F200D1CEC90070727000F0E9E000FFF5EB00FFF4
      EA00FFF3E800FFF2E700FFF1E500FFF0E400FFEFE200FFEFE100FFEDDF00FFEC
      DD00FFEEDE00D7CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00D3D3DA005F5FA8001818C1001515BC003A3A93009494A600E4E4
      E400FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FAFAFA00EFEFEE00DFDFDE00CECDCC00BBBBB900AAA9A6009998
      94008B8A85007F7E780075746C00726F63006E6B5E006E6B610073726B007D7D
      78008C8B87009C9C9900AEADAB00C0BFBE00D2D2D100E4E4E300F3F3F200FBFB
      FB0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00EDD0A200F6C03600FFDA6100FFE38000FFE89C00FFEEB600FBF0
      C600CDE8D500C4CFDB00FCECB800FFE8A200FFE48900FFDF7100FFD75500F8C0
      3100F4E0BD00FEFEFE00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFDFC00E0DEDD00BBBAB800D0CECC00DAD7D400E2DE
      DB00DCD7D300E3DED900CBC8C30071777700696C6B00E0D9D300D7CFC700E1D8
      D000E4D9D000DDD2C900CCC2BA00D7CBC200E2D5CB00C3B9AF00F2E3D600F5E5
      D700FFEDDE00D6CEC60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F6F6
      F600A5A5C1002D2DBB001414D8003333DF003C3CE0001B1BD8002020B1006161
      9300C6C6C900F8F8F80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00F9F9F900ECECEC00DBDBDA00C8C8C600B5B4B100A2A29D008E89
      7C00987F4D00C79D4300E3B95300F2C85E00F4CA5D00EEC15100DBAA3E00B188
      350089785700928F8900A5A5A200B9B8B600CDCDCB00E0E0DF00F1F1F000FBFB
      FB00FEFEFE00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00E6BB7500FBC83200FFDA5B00FFDF7900FFE49700FFE9B000FFEEC500F2EA
      D400BBCEE500C7D9E400F7EBC700FFE9B400FFE5A100FFE18B00FFDD6F00FFD8
      5400FCC62D00F3D8A700FEFEFE00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FFFEFD00D2D0CF00A2A1A000A09E9C00CAC8C6009F9C
      9A00AFACA900C2BDB9005B6263008183840060626000DEDBD500A69F9A009D95
      8F00CBC2B900ABA29A00B0A8A000A79D9400D5C7BC00ADA29800F9EBDD00FEEC
      DD00FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EBEBED007A7A
      B6001919D3002222E4005555EB006E6EEE006C6CEE005454EA002A2AE5001818
      D0003F3F9800A4A4B000EEEEEE00FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FEFEFE00FEFEFE00FCFCFB00F8F8F700F3F3F200DFDCD500C9A55C00F4C3
      4600FEDC7000FFE58D00FFEAA100FCEBAA00E0DEC000D7CEAB00FEE48B00FFDE
      7400FED25100E8B33400C4B18900ECECE900F5F5F400F9F9F900FCFCFC00FEFE
      FE00FEFEFE00000000000000000000000000FFFFFF00FFFFFF00FEFEFE00E3BD
      8300FBC42800FFD75100FFDC7200FFE09000FFE4A600FFE7B400FFEBC000E8E8
      C700B5C9DE00B4D9CF00ACC5DB00D2CEBD00FCE4A900FFE29E00FFDF8A00FFDB
      6B00FFD64E00FCC42900F4DFBA00FFFEFE00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFDFB00DFDDDC00DFDDDB00E5E2E000C9C6C300D1CD
      CA00D1CDC900A4B1B20065ABB700A9B9BC005A5D5B00C5BEB900CDC5BE00DFD5
      CD00D6CCC400CEC4BC00CEC3BA00D0C6BC00BCB1A800D2C8BD00BCB1A700E7DA
      CC00FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00DDDDE3005757B9001515
      E3003131EB005A5AF0005959F1002F2FEE003535EF005757F1005050F0003434
      EC001919E3002828AB007F7F9D00DFDFDF00FDFDFD0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00F0DCBD00F0B83400FFD65900FFE1
      7900FFE79300FFECAC00FFF0BF00E0ECCB00C5D7E000ECE3C000FFEAA800FFE6
      9200FFE17C00FFDC6500FECE4100EEB94800FCF8F100FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00F1E3D100F2B2
      1600FFD24100FFD96500FFDC8400FFDE9700FFE1A000FFE3A700FFE4AD00E7DA
      B1008CA0C000849EC10088A1CA008398BD009A9D9D00FDDE9B00FFDE9400FFDB
      8100FFD85F00FFD24000F7B92000FBF5ED00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FFFEFD00D9D8D600BCBBBA00D0CDCB00B2B0AE00A8A5
      A2009CA2A10097D2DC005EBDCC008CCDD6005A656500B0ABA400B7B0A900CAC1
      B900A79F9800B9B0A800BAAFA700C5B9B000BFB3A900C8BBB000BEB1A600F2E1
      D300FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00CECEDB003E3EC4001616EB003737
      F0004B4BF3003334F3001314F2001010F2001010F2001A1AF3003C3CF4004141
      F4003333F1001C1CED001E1EC50061619700CECED000FBFBFB00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00E8C58C00F9C12C00FFD85600FFDF7200FFE4
      8F00FFE8A900FFEDBF00FDF0CD00C2D2E000C1D2E600E8E4D300FFEBBB00FFE7
      A800FFE49500FFE07D00FFDB6200FFD34800F5B92B00FAF2E500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FEFDFD00DA982C00FFC9
      2A00FFD24E00FFD57000FFD78400FFD88900FFD98C00FFDB9100FFDD9500E2CD
      9A007D8A9F0076839C006D80A100707C8E005B687D00A5957800E4BC6F00FFD7
      8300FFD56D00FFD14A00FFCA2D00E9B35100FEFEFE00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFDFC00DCDAD900C4C2C000CCC9C700BFBCBA00B9B8
      B600B5D7DD007CCAD7005FBDCC009AD6DF00696F6D00BEB8B200C5BDB700D0C7
      C000C7BDB500D4C9C100C6BBB300C9BEB400D3C6BC00C7BBB000CBBEB300F7E7
      D900FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00C6C6D7003131CD001818F0003434F4003434
      F5001818F5001111F4001111F5001111F4001111F5001111F5001212F5002223
      F6002F2FF7002B2BF5001C1CF2001818D7004D4D9900BDBDC200F8F8F8000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00E6C38F00F9C02400FFD64E00FFDC6C00FFE08900FFE4
      A100FFE7B300FFEBC100FBEDCA00C3D6E200B9D5DA00C1DEDB00CFCFCC00FEE5
      B000FFE4A400FFE19400FFDD7B00FFD95D00FFD34400F5B82500FCF6EE00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00E7D0B900F2AB0B00FFC9
      3300FFCE5500FFCF6A00FFCF7200FFD07400FFD17800FFD27C00FFD48000E6C8
      84006E7D92006B7C910067747B00605E5D005C5E5D005952570073532F00EFC2
      6800FFCF6A00FFCE5200FFC93200F6B01300F9F2E800FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFDFC00D5D3D200C1BFBE00ACAAA900BEBCBA00B4C9
      CC00ADE0E90062BECD0074C6D400BBE3E90060615F00C3BDB7009A948E009992
      8D00C0B9B200B4ABA300C2B8AF00B8ADA500D6CABF00C6B9AF00C1B4AA00F7E8
      D900FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      000000000000FEFEFE00C5C5D8002B2BD4001818F3002B2BF5002222F4001212
      F3001111F2001212F2001212F2001212F2001212F2001212F2001212F3001111
      F4001515F5002020F7002121F7001919F5001515E5003F3F9F00B1B1B900F6F6
      F600000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00F2E2CE00F2B21700FFD34100FFD96100FFDD8100FFE09700FFE2
      A400FFE4AC00FFE6B400F9E6B700A0B6C60094AECB0093B4CA008FA6CF00939F
      B200F4DBA200FFE09D00FFDE8F00FFDB7500FFD65400FFD03900F0B43300FEFD
      FC00FFFFFF00FFFFFF000000000000000000FEFEFE00CB8F4800FCB71100FFC3
      3400FFC64C00FFC75800FFC95D00FFCA6100FFCB6300FFCD6600FBCD6B00B19F
      7200597191004F7A72006DA52D0063665C0058606A0055555E005E3F3800A281
      4B00FCC65700FFC64D00FFC33200FEBA1700E5BB8300FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FFFEFD00FDFDFB00FDFDFA00FDFBF900EAF6F700BDED
      F60087CEDA005CBCCB0095D5E000D2ECEE007D7D7B00F8F2EA00FDF4EB00FCF3
      E900FDF2E800FEF2E700FEF1E500FCEFE300FDEFE100FDEFE000FEEEE000FDEC
      DD00FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000FEFEFE00CFCFDE002D2DD7001717F4002121F5001818F3001212F1001212
      F0001212EF001212EF001212EF001212EF001212EF001212F0001212F1001212
      F2001212F3001212F4001616F5001919F7001717F7001313EC003838A400ADAD
      B700F8F8F8000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FEFDFC00DC991F00FFCB2C00FFD44E00FFD77000FFDA8700FFDB9100FFDC
      9500FFDE9A00FFDF9E00FBDFA2008B97A9008090AC00768CB2007C8FB2006E7D
      9600878A8B00F9D78F00FFDA8D00FFD98100FFD66500FFD24300FEC62600EDC9
      8C00FFFEFE00FFFFFF000000000000000000F9F5F200CB7B1200FEB21000FFB7
      2D00FFBA3D00FEC04800FEC34D00FFC44F00FEC55100FEC6530095998A004A66
      970050697C0051913900579A2D0051963900618576004C5B7000484E62007352
      2600E9B44400FFBB3E00FFB82D00FFB41500DF993600FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFCFB00F2F1EF00F2F0EE00F3F0ED00A7E1ED002AD0
      ED005EC2D0006CC3D100BAE6EE00D9EEF000A2A29E00F2EAE300F2E9E100F2E8
      E000F2E7DE00F2E7DD00F2E6DB00F2E5DA00F2E5D900F2E4D700F2E3D700F7E6
      D800FFEEDE00D6CEC60000000000000000000000000000000000000000000000
      0000DFDFE9003737D3001515F4001A1AF3001414F1001212F0001212EE001213
      ED001213EC001212EB001212EB001212EB001212EC001313EC001313ED001313
      EF001213F0001212F2001212F3001313F5001415F6001515F8001212EF003A3A
      A100B5B5BC00FAFAFA0000000000000000000000000000000000FFFFFF00FFFF
      FF00E1C29C00F6B41100FFCC3700FFD15800FFD37100FFD37C00FFD47E00FFD5
      8100FFD68500FFD78900FED98D00848C9600778394006C7B9100637080006469
      6C00565E6A006F574F00B98C4500FFD47B00FFD26B00FFD04D00FFCA3100F1AC
      1700FCFAF600FFFFFF000000000000000000E7D6C900CF750200FEA50900FEA9
      2000FBB13000F8B93D00F8BC4200F9BC4300F9BC4400E0B75200416AA500375F
      A0003D5F9500416E7500418444007A9D2D00528161004D4C4D009F7A3400E2AC
      3C00F9B83D00FBB13100FEA92000F2A616008F806F00F8F8F900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FFFEFD00FEFDFB00FEFCFA00FDFCF9005ED7F20004D5
      EC00086A6C002984860061E2F60061D3EA00E4E0DA00FEF5ED00FEF4EB00FEF3
      E900FEF2E700FEF0E600FEEFE400FEEFE300FEEEE100FEEDE000FEECDE00FEEC
      DD00FFEEDE00D6CEC6000000000000000000000000000000000000000000F2F2
      F5005353CC001313F4001717F2001313F0001212EE001313EC001212EB001212
      EA001212E8001212E8001212E7001212E7001212E8001212E9001212EA001313
      EC001313ED001313EF001313F1001212F3001212F5001212F7001313F8001313
      EC0043439C00CACACD00FDFDFD00000000000000000000000000FFFFFF00FEFE
      FE00CF871F00FEBF1B00FFC83C00FFCB5600FFCC6300FFCD6800FFCD6B00FFCD
      6F00FFCF7200FFD17500FED278006B7B8B005A709000678E6100687061005F53
      490053555D0059474A0072532E00F5C46200FFCC6100FFCB5000FFC73300FDBA
      1700EBCB9D00FFFFFF000000000000000000E0CBBB00CB690000F88E0400F79E
      1C00F5AD3200F4B73F00F3B84200F3B74000F3B53A00B1AC4E003B618E003950
      7C003260A2003B64A8002E526600417C52005A6A6C00E6AC3800F3B33700F2B3
      3600F2B13200F4A72900DE942700406CA8003D71AF00E5E9F000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FDFDFB00D5D3D200C4C3C000B7BBBB0020CAEC0004D0
      DD00001919000E71770030D9FB005C9FAD00BCB6B100CCC5BF00BEB8B200C3BB
      B400EFE6DC00F2E6DC00F2E5DA00F2E5DA00F2E4D800F2E4D700F2E3D600F6E6
      D800FFEEDE00D6CEC60000000000000000000000000000000000FDFDFD008989
      CD001212F2001414F2001212F0001313EE001313EC001212E9001212E8001313
      E6001313E5001313E4001313E4001313E4001313E4001313E5001313E7001313
      E8001213EA001313ED001313EF001313F1001213F3001212F5001112F7001212
      F8001515E20061619800E7E7E700000000000000000000000000FFFFFF00F5ED
      E500DF8C0200FFBB1B00FFC03800FFC14900FFC55200FFC65700FFC85A00FFC9
      5C00FFCA5E00F5C7650084878900536782006483890071A41D0055824A006878
      69005B6B7E0055565E005040470089683600FBC24F00FFC24600FFBF3100FFBA
      1900E19D3700FEFEFE000000000000000000DAC2B000C9610400F1861300F09D
      2C00EFAE3E00EEB64600EEB64400EDB23D00ECAE3300E5A931007F5A34003E51
      75002E467C00264B8D00374F6C0073794500C3953800EBAA2B00EBAA2B00EBA9
      2B00ECA82900ED9E20008F816100488A9A0027519600E4E6EB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFEFC00DAD9D800AAA8A600A4C1C80009CFED0002A1
      A5000113130020C0D00038D0F000AAB0AD00C1BAB400E3DAD300CBC2BB00C7BE
      B600F9EFE500FBEFE400FBEEE200FBEDE000FBEDDF00FBECDE00FBEBDC00FDEB
      DC00FFEEDE00D6CEC60000000000000000000000000000000000D5D5E7001C1C
      EA001313F3001212F0001313EE001212EB001212E9001313E6001313E4001313
      E2001212E1001213E0001313DF001313E0001313E0001313E2001314E3001313
      E5001313E7001313EA001313EC001313EF001313F1001313F4001212F6001212
      F8001212F7001F20C400A0A0AF00FBFBFB000000000000000000FFFFFF00DCBF
      A400EA940100FFB11600FFB32D00FEB83A00FDBE4400FCC04800FDC14A00FDC2
      4C00FDC34E0096977F004268A700496185004C8444004183370060A3330067AA
      3400536D7700424E62005A4D42009A762C00F8BA4200FEB73800FFB32900FFB1
      1400E38E0A00FCFBF9000000000000000000E1CCBD00C3661900EB882900EC9F
      3E00EBAF4A00EAB64E00EAB54800E8B03E00E7A92F00D89E2A00946D1C004846
      4F0039435D005E5853009D804400E4A22300E4A32300E4A22100E4A22000E3A2
      2100E49F1E00E194190051A665003773770031416500F2F0F100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFEFC00C3C2C1008B8886007BD0E20004D7EC00014B
      4B00074546002CDAF60067C1D400F5EEE700FCF3EC00FBF2EA00FBF1E800FBF1
      E700FAEEE400FAEEE300FAEDE100FAECE000FAECDF00FAEBDE00FAEADC00FCEA
      DB00FFEEDE00D6CEC600000000000000000000000000FCFCFD005D5DD5001112
      F3001212F1001313EF001212EC001313E9001313E6001313E3001213E1001313
      DF001313DD001313DC001313DC001313DC001313DC001313DE001313E0001313
      E2001414E5001313E7001313EA001313ED001314F0001313F2001313F5001212
      F7001212F9001111EF004B4B9900E4E4E400000000000000000000000000C38F
      6300E98B0000FEA10D00FBA72100F8B13100F7B83C00F7BB4100F7BB4200F7BA
      4000DFB64D004C7AA0002F549200456CB100426A9C003E657A00508B2D005597
      38004B59600087693C00E0A93A00F6B83D00F7B63900FAAE2D00FDA51D00DC9E
      2800677D9C00E6EAF1000000000000000000F1E7E100BE753900D6893F00E9A4
      5000EAB35900E8B85A00E6B65100E6B04200D49F37006D7A6100AD863700D295
      2000C18C2200DE9C1800DE9C1900DE9C1A00DE9C1B00DE9C1A00DD9A1600DC9B
      1600DD961400D58B14003C747F004E41360074512700FAF9F900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFDFC00E5E3E200D0D1CF0037CEE90003CFDA00001A
      1A001498A10032D4F50097A9AB00E7E0DA00D4CDC700D8D1C900DCD4CC00D2C9
      C000DBD2C800E7DCD200D6CBC000DACEC300D0C3B800D5C7BC00D3C5BA00F2E2
      D400FFEEDE00D6CEC600000000000000000000000000E0E0F1001818ED001212
      F2001313F0001313ED001313EA001313E6001313E3001515E0001818DE001C1C
      DD001F1FDB002424DB002525DA002525DB002424DC002121DD001F1FDE001A1A
      E0001717E2001515E5001314E8001313EB001414EE001314F1001313F4001213
      F6001212F8001212F7001F1FC200B0B0BA00000000000000000000000000B87D
      4E00E1780000F78F0B00F4A02400F3AF3800F2B74100F2B74200F2B63F00F1B3
      3900D6AE3F003D6787003B4666002D589F003465A5002F487900375F5E004D77
      630099845400F1B23500F1B03400F1B13300F1AE2F00F2A52600D08D31003768
      B300326BAB00CCD4E4000000000000000000FDFCFB00C18F6400DB965700EBAB
      6200EAB86B00E8BD6A00E7BB610092825900666D7300807A6500B88A2E007D7E
      5700C1922500D8941200D9951300D9971500D9991900DA991900D7941100D691
      0D00D78C0B00D57D0700445267003E4347009081600000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FFFEFD00C9C8C700A8B7B9000ECEE900029C9E000220
      1F0024D0E4004CBFD900B1AEAB00D3CDC700B6B1AC00C9C2BB00C1BBB400BBB5
      AD00B7AFA700B7AEA600C2B9AF00B7AEA500AEA39A00BCB2A800BCB1A600EEDE
      D000FFEEDE00D6CEC6000000000000000000000000009797DE001111F3001212
      F1001313EE001C1CEC002E2EEA004040EA004A4AE8005050E6005252E4005252
      E2005252E1005252E0005151DF005151DF005050E0004F4FE1004E4EE2004C4C
      E4004A4AE6004646E9003F3FEB003232EC002323EE001818F0001313F2001313
      F5001212F7001212F9001212E60074749C00000000000000000000000000BA7A
      4C00DE720A00F08D1D00EFA13300EEB04200EEB64700EEB64400ECB23D00EBAD
      3300EAAB2E00B47F2D004F4A4C002C4274002D5294002D446E0057695E00B18D
      3800E7A82C00EAA82900EAA82A00EAA82A00EBA62700EB9C1E00878769004C94
      900028519400CACED800000000000000000000000000D8BFAB00D7A16E00EAB3
      7700EBBF7E00EAC57F00CAAD6D00706F610071726A00DBA83F00BB933F00AF8D
      3A00D69A2000D6991E00D69A2000D79B2400D89D2600D79C2400D5961800D18B
      0900D07E0200CD6E00003D3D50002F4C7C0068666D00B3B3B300EAEAEA00FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E9E800FEFDFC00F4F2F000B1E6F00005D9EB00014343000B6A
      6C002EDAF7009CBFC500F4EDE800F4EDE700F3ECE600F3ECE400F3ECE300F3EB
      E100F4E9DF00F4E8DE00F3E8DD00F4E8DC00F4E6DA00F3E6D900F3E5D800F8E7
      D900FFEEDE00D6CEC6000000000000000000FEFEFE005252DE001B1BF4004343
      F3006060F3006868F1006767EF006666ED006566EA006666E8006565E6006565
      E4006666E2006565E2006565E1006464E1006363E2006262E3006161E4005F5F
      E6005D5DE8005B5BEA00595AEC005858EE005656F1005454F3004848F4002C2C
      F6001515F7001212F8001111F00047479B00000000000000000000000000BF8A
      6400D7762000ED903100ECA34300EBB04D00EAB64E00E9B54800E8B03E00E6A9
      3100DEA12A008B6A26006C5736003D3D4E00505863008E744700D69B2600E3A2
      2300E3A22200E4A12000E4A21F00E3A12000E39D1D00DD931A004CA66500346D
      76002B3D6400E6E4E500000000000000000000000000F7F3F000D0AA8600E7BA
      8B00EDC59400EECE9800A59C84007F838500697B92008E90870080848500A2A5
      8600DBAF5200DDAF4E00DDAF4D00DEAF4F00DEB05000DEAE4C00D9A13500D18B
      1300C9720100C05D0000523D370048485500DBD2D3009E83830067525200847F
      7F00C9C9C900F3F3F300FEFEFE00000000000000000000000000000000000000
      0000F2F2F200E9E9E800FFFDFC00FCFBFA0065DEF20002CDD50001201F0019BB
      C50043CCE800E6E4E000FCF7F000FCF5EE00FCF4ED00FCF4EB00FCF2E900FCF2
      E800FCF1E600FCF0E500FCEFE300FCEEE100FCEDE000FCEDDF00FCEBDD00FDEC
      DC00FFEEDE00D6CEC6000000000000000000F8F8FA003636E0007D7DF8008080
      F7007D7DF5007C7DF3007C7CF1007B7BEE007B7BEC007A7AEA007A7AE8007A7A
      E7007A7AE5007A7AE4007A79E4007979E4007878E4007676E5007575E6007474
      E8007272EA007070EC006D6DEE006C6CF0006A6AF2006969F4006767F6006767
      F8006162F9003838F9001313F3003030AA00000000000000000000000000D9BE
      AA00CD7D3700D78E4300EAA95300E9B45A00E8B85900E6B65100E5B04300D6A1
      37007D7E570081745200D6992000C68F2300D6971A00DD9C1800DD9C1900DE9D
      1A00DD9C1C00DD9B1800DC9A1600DC9A1600DD951300D08B17003B7280004A43
      3C006D440E00F3F1EF0000000000000000000000000000000000E3D4C500E1BF
      9D00EECBA600EED2AC00BCC1C9008F99A600818EA3008A97AA0088949E006A91
      A800A1A19A00E3C47F00E6C57C00E5C47B00E4C37800E3BE7000E1B46100D897
      3700CB6C0400B44E00007B380B00C6B7A200FFFFFF00FFFFFF00F7F4F400CAB9
      B900856767006E5C5C009A979700DBDBDB000000000000000000000000000000
      0000F2F2F200E9E9E800FEFCFB00E9F1F00025D8ED0002969700043E3D0026DA
      F00084BECA00F3EDE800F4EEE800F4EDE700F5EDE600F5EDE500F5ECE400F5EA
      E100F5EAE000F5E9DF00F5E8DD00F4E6DB00F4E6D900F5E6D900EEDED200F8E7
      D900FFEEDE00D6CEC6000000000000000000F5F5F8003333E2009292F9009494
      F8009292F6009191F4009090F2009090F0008F8FEE008F8FED008F8FEB008F8F
      EA008F8FE9008E8EE8008E8EE8008E8EE7008D8DE8008C8CE8008B8BE9008989
      EB008787EC008585EE008383F0008282F2008080F4007E7EF5007D7EF7007D7D
      F9007C7CFA007D7DFB005A5AF6002828B500000000000000000000000000F3EB
      E500C5854F00E39C5800EBAF6400E9B96B00E8BC6900E6BA5F009A8657005F69
      7400867F6800B086300081795900A5943B00D6931200D9951200D9961300D998
      1700D9991A00D9981600D7931000D6910D00D78B0B00D27B080043546A003D43
      47007B694200FEFDFD0000000000000000000000000000000000FDFCFB00E1CE
      BB00EBD0B500F2DCC300B4BFD500ADB3B9009DA6B300B0BACE00A7ACAF008391
      A7007E8FAB008B98B000B5B3AB00C4B89C00ECD29B00EACB9100E7C08200E3AF
      6D00CC670E00AB4801009F6A5000FCFBFA00FEFCFC00FDFBFB00FCFAFA00FBF8
      F800FBF7F700EEE5E500B3989800694949000000000000000000000000000000
      0000F2F2F200E9E9E800FFFDFC00D6F4F7000DDAEA00014847000E8F920037D3
      EF00D6DAD800FCF7F200FCF6F000F6F3EC008F8B860086827D00928D8800B7AF
      A800968E880099918A008D857D00988F8800ACA29800A2978F008D837B00F4E8
      D900FFEEDE00D6CEC6000000000000000000F5F5F8003434E100A5A5FA00A7A7
      F900A6A6F700A5A5F600A4A4F500A4A4F300A3A3F100A3A3F000A3A3EE00A2A2
      ED00A3A3EC00A3A3EC00A3A3EB00A2A2EB00A1A1EB00A0A0EC009F9FED009D9D
      EE009C9CEF009A9AF1009999F2009797F4009595F5009393F7009393F8009292
      F9009292FB009292FC007273F7002B2BB400000000000000000000000000FEFD
      FD00C6997200E0A66E00EBB57700EBC07D00E9C47C00CFAF6B00726F5E00676B
      6800DBA63D00CA993600877D4E00D7991D00D6981B00D6981B00D6991E00D79B
      2100D79C2300D6991E00D4931400D1890700D17E0200CD6E00003C3C4F002E4C
      7B009FA8B400000000000000000000000000000000000000000000000000FBFA
      F800E8D9C900F1E0CF00E3E0DD00BBBDBB00BAC5CD00C3CDC000C2C5C500A2AC
      B900A2AAB5009DA7B4009FA5A800B1AEA400F3DDB800F0D5AD00EDCCA100E8BB
      8C00BE671E00A8653800F3EDEB00FCF9F900FBF8F800FBF8F800FAF7F700FAF6
      F600F9F6F600F8F2F200F1E8E800816464000000000000000000000000000000
      0000F2F2F200E9E9E800FFFDFC0091E7F10002CDD300012A2A001CCEDA006DC2
      D300F4EFEA00F9F2EE00F9F2EC00F9F1EB00EAE6DF00E8E4DC00EBE5DC00E0D7
      CE00E6DFD500E6DED500D5CEC400E3DACE00DBD0C400D6CDC100D6CBBF00F6E5
      D700FFEEDE00D6CEC6000000000000000000FAFAFD003A3AE600ADACFB00B8B9
      FA00B7B7F900B6B6F800B7B7F700B6B6F500B6B6F400B5B6F300B6B5F200B5B5
      F100B5B5F000B5B5EF00B5B5EF00B5B5EF00B4B5F000B4B4F000B2B2F000B1B1
      F100AFAFF300AEAEF400ACACF500ABABF600A9A9F700A8A8F800A7A7F900A7A7
      FB00A6A6FC00A7A7FC006C6CF5003737AD000000000000000000000000000000
      0000E1CFBF00D9AC8200EABC8A00ECC59100ECCC94009C9379007B7F7F006778
      8D0092917E00938C77008E958900D9AB4C00DCAB4600DCAB4500DCAB4700DCAD
      4800DDAD4900DBA84000D5982400D0870D00C8710000C15E00004D3F3F003640
      5700ECEDEF000000000000000000000000000000000000000000000000000000
      0000FBF9F800EEE4D900E6E4DF00D1D2CD00D2E2D200DADED100CFD2D100B5BF
      CA00D1D4D600C7D4B700BCBFB100E3DAC600F5E4CE00E1CEBA00F1D8BC00D09F
      7200B5825B00DCD0CD00E6DDDD00F8F4F400FAF8F800F9F7F700F8F6F600F8F4
      F400F8F3F300F3ECEC00CAB4B400A8A2A2000000000000000000000000000000
      0000F2F2F200E9E9E800FCFDFC0045E1F00001929200075B5A002CD9F000C1CF
      D100FAF5F100F9F3EE00FAF3ED00FAF2EC00FAF1EA00FAF0E800FAEFE700F9EF
      E500FBEEE500EEE6DC009F979000C8BEB400A0968E00978D8500A99E9500EDDE
      D100FFEEDE00D6CEC6000000000000000000000000006666ED009494F900C8C8
      FC00C7C7FA00C6C6F900C6C6F900C6C6F800C6C6F700C6C6F600C6C6F500C6C6
      F400C5C6F400C5C5F300C5C5F300C5C5F300C5C5F300C4C4F400C4C4F400C2C2
      F500C0C0F500BFBFF600BEBEF700BDBDF800BCBCF900BABAFA00B9B9FB00BABA
      FC00B9B9FC00B9B9FD004545EE006363A5000000000000000000000000000000
      0000FBF9F800D4B89B00E7C19B00EECBA200EDD1A900B8BCC0008C96A1007C89
      9E008793A30089919D0071A599008B96A300E2C17500E3C07300E3C07200E3C0
      7100E3BE6D00E1B86400DEAE5400D2891D00C8680200B55000006C371600A994
      7400000000000000000000000000000000000000000000000000000000000000
      000000000000FEFDFD00E5F3DF00CDD0CF00DDF0D400E8F1E600CFD0CE00CAD0
      D500E5E8DF00E0EAC600D2DEC900E4E8D200F4E9DE00C7C8C9009A8C8000BA9D
      8700D1C3C200CEC1C100BBAEAE00EFE6E600F8F5F500F8F6F600F8F5F500F6F4
      F400F6F2F200EBDFDF0074585800EDEDED000000000000000000000000000000
      0000F2F2F200E9E9E800E8FAFB0019DEE9000147450012AFB3003DAFC2009391
      8E009F9B9800CCC6C200A6A19D00A19C9800BFB8B200A29C97009F989300B0A8
      A100A39B9400B6ACA500A0989000A79D9400BEB2A800A59A9100A99D9400F8EA
      DB00FFEEDE00D6CEC600000000000000000000000000B8B8F5004949F500D5D5
      FC00D5D5FC00D4D4FB00D3D3FA00D3D3FA00D3D3F900D3D3F800D4D4F800D4D4
      F800D4D4F700D4D4F700D3D3F700D2D2F600D2D2F600D2D2F700D1D1F700CFCF
      F700CFCFF800CFCFF900CDCDF900CDCDFA00CBCBFB00CACAFB00CACAFC00CACA
      FD00C9C9FD00B3B3FD001C1CE000B5B5C5000000000000000000000000000000
      000000000000F0E8E100DFC5AB00EDD1B200EED9C100AFBACF00A7AFB800939D
      AA00A9B4C900A3ABB300808EA3007588AB008996AA00B8B4A800DFCA9800E4CB
      9400E9CB8E00E7C48300E4B97500DD9F5200CB630600AB4800008B492400F8F5
      F300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00E7EBEE00B8D5C600C3D6D600DBDEE600D7DA
      DE00D8E2D200D5E1D300DDE6C600E0E4CC00E4D4C500A19F9F00DFD8D800F2EC
      EC00F4ECEC00F1E8E800D6CACA00D4C7C700F2EBEB00F8F4F400F8F3F300F8F3
      F300F3ECEC00CFBABA007D737300FEFEFE000000000000000000000000000000
      0000F2F2F200E9E9E900C1F4F80005C8CC000243410021D9E8009BBABF00E0DC
      D800D9D5D100E1DDD800CCC7C300DAD4CE00D5CEC800E2DAD300C2BBB500BCB6
      AF00DED5CD00D5CBC100E1D5CB00D3C8BF00E4D8CC00E1D4C900DFD1C600F5E5
      D700FAE9D900CAC1B900000000000000000000000000F4F4FD002C2CEF00B7B7
      FB00E0E0FD00DFDFFC00DFDFFC00DFDFFB00DFDFFB00DFDFFA00DFDFFA00DFDF
      FA00DFDFF900DEDEF900DEDFF900DEDEF900DEDEF900DDDDF900DDDDF900DCDC
      FA00DCDCFA00DADAFA00DADAFB00D8D8FB00D8D8FC00D7D7FC00D7D7FD00D7D7
      FD00D4D4FE004D4DF7004242BC00F4F4F5000000000000000000000000000000
      000000000000FEFEFE00EDE3D900E8D4BF00F4E2CE00D0D3DA00B5B9B900B1B8
      BF00BBC8CE00B8BBBB00A2ABB700959FAD00919DAD00949FAD00A5A8A600D8CA
      AC00EFD7AB00EDCFA000EBC49300E4AE7600C26314009D4A1000E4D6CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC00E1E2E500958F
      8800C2B79F00C2C8BD00BECDB100F5F3EF00FCF9F900FAF8F800F9F5F500F8F4
      F400F8F5F500F8F5F500F1E9E900C6B9B900E7D9D900F5EFEF00F8F3F300F7F2
      F200EDE1E10096777700D5D5D500000000000000000000000000000000000000
      0000F2F2F200E9E9E90070EBF300018D8C000A86850040D0E300EAEAE700FEF9
      F500FEF8F400FEF8F200FEF8F200FEF6EF00FEF6EE00FEF4EC00FEF4EB00FEF3
      E900FEF1E700FEF1E600FDF0E400F6EAE100F8EBE100F7EADF00F3E6DC00ECDC
      D100E3CDBC00D3D1CF0000000000000000000000000000000000A2A2F6003131
      F400DCDCFC00E7E7FD00E7E7FD00E7E7FC00E7E7FC00E7E7FC00E7E7FB00E7E7
      FB00E8E8FB00E8E8FB00E7E7FB00E7E7FB00E6E6FB00E6E6FB00E6E6FB00E6E6
      FB00E5E5FC00E5E5FC00E4E4FC00E4E4FD00E3E3FD00E2E2FD00E2E2FD00E0E0
      FE007777FB001E1EE500CDCDDB00000000000000000000000000000000000000
      00000000000000000000FEFEFE00EFE8DF00EFE1D300E6E2DC00C8C9C300C8D2
      D600CCD8BF00CCCCC700B7C0CC00AFB7C200B7BFC200AEB4B200B0ACA400EBDC
      C500F4DFC200F0D7B800EFD0AF00D6A16F00AA663000E2D1C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAFAFA00B4B2
      B200918C8C00BEB9B900F2F0F000FEFDFD00FCF9F900FBF8F800FBF8F800FBF8
      F800FAF7F700F9F9F900F7F2F200E8DEDE00CFC1C100EDE3E300F7F2F200F6EF
      EF00E0CDCD0079656500FCFCFC00000000000000000000000000000000000000
      0000F2F2F200DFE7E8002CE2E9000156530016C9CF008AC2CA00F2EFEB00F3EF
      EB00F3EEEA00F3EEE800F3EDE700F3ECE600F3EBE400F3EAE300F3EAE200F3E9
      E000F3E8DF00F3E7DE00F3E6DB00F2EDE800FDFDFD00FBF8F700F4E9E100EAD5
      C700C2B1A600F9F8F80000000000000000000000000000000000FBFBFE005757
      F4004647F400E1E1FD00EEEEFE00EEEEFD00EEEEFD00EEEEFD00EFEFFD00EFEF
      FD00EFEFFD00EFEFFD00EFEFFD00E5E5FB00AAAAF300E5E5FB00EEEEFD00EDED
      FD00EDEDFD00ECECFD00ECECFD00EBEBFD00EBEBFE00EAEAFE00E2E2FE006767
      FA001A1AF100B0B0D10000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00F6F2ED00E3E3DE00DADBD700D7EA
      CD00E6EBDB00D5D6D400C1C7CB00E5E5E200F5F1E000C6DBB000D9E0C200F8EB
      DB00E4D9CD00D2C9BE00D9BFA400BA8D6600EFE6DF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00D6D5D5008E87870082787800CEC4C400F1EAEA00F5EEEE00F7F2
      F200F8F6F600F9F9F900F9F7F700F3ECEC00DBD0D000E6DADA00F4ECEC00F2E9
      E900BCA1A100B7B4B40000000000000000000000000000000000000000000000
      0000F2F2F200CBE4E6000FC9CB00046460002ED8E400DDE1E000FCFAF700FCF9
      F500FCF8F300FCF7F200FCF6F000FCF6EF00FCF4ED00FCF4EB00FCF3EA00FCF2
      E800FCF1E600FCF0E500FCEEE200F6F0EB00FEFCFB00F7EEE800ECDACD00DCC2
      B000DAD9D800000000000000000000000000000000000000000000000000F2F2
      FE004A4AF5002D2DF200B5B5FA00F1F1FE00F3F3FE00F4F4FE00F3F3FE00F4F4
      FE00F4F4FD00E8E8FC009C9CF1003232E0005657D7003333E4007272EE00C2C2
      F800E6E6FC00EFEFFE00F1F1FE00EEEEFE00DEDEFD009C9CFA002E2EF6002526
      F000BDBDDE000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F5FDF200B6C0C300C8DF
      CB00E9F7EC00DADAD600D2D6DC00D4DCD700D3E4C600DEE8D300D7E7CB00E8E9
      E000DED7CD007E858F00B3ACA000FBFAF9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F6F6F600C7C2C2008578780098888800D8CA
      CA00EFE5E500F4EEEE00F8F4F400F8F3F300F1E8E800E2D6D600EBDFDF00E6D8
      D8008A6D6D00F4F4F40000000000000000000000000000000000000000000000
      0000F2F3F200C2BEE100088E8C000AABA90090E5F000F7F3F100F8F5F100F8F4
      F000F8F3EE00F8F2ED00F8F1EB00F8F1EA00F8F0E900F8EFE700F8EEE600F8EE
      E400F8EDE200F8ECE100F7EADE00F4EFEB00F9F3EE00EFDFD300E4C9B800C6BF
      B900FEFEFE000000000000000000000000000000000000000000000000000000
      0000F7F7FE007F7FF7001D1DEF003939F0007D7DF4009292F5009292F4008989
      F2005C5CEC002828E4005353DA00D2D2EC00FEFEFE00EAEAFC009797F3004141
      EB002727EA003232EE00393AF1003030F2001C1CF3002424F1007373E500E9E9
      F500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00E9F2
      EF00C0D0D600C6CEDC00C1C4C700BEBAA700BCBFAF0099BC8D00B4BD9400E6D9
      CB00EAE3DB00F5F5F40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEECEC00B3AB
      AB008A787800B1A0A000E1D3D300F1E6E600F0E7E700E9DFDF00E4D7D700C7B0
      B000989090000000000000000000000000000000000000000000000000000000
      0000F2F3F200E299DC00876EB300809FDD00E9E1EE00F5F2EF00F5F2EE00F5F1
      ED00F5F0EB00F5EFEA00F5EEE900F5EEE800F5EDE600F5ECE400F5ECE300F5EB
      E100F5EAE000F5E9DE00F3E7DC00F5EEEA00F1E4DB00E7CFC000CBC0B800FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E1E1FD008080F6003A3AEF002C2CEC002E2EEC004848
      EB008A8AEB00DBDBF300FEFEFE0000000000000000000000000000000000FDFD
      FE00E9E9FD00C9C9FA00B2B2F900B4B4F900CFCFFA00F3F3FD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FAFAFA00F2F0EC00F7F5F200F1F4F000FCFCFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFCFC00E4E0E000A89A9A0098838300CBB7B700DECECE00D8C8C800866E
      6E00E2E1E1000000000000000000000000000000000000000000000000000000
      0000F2F2F200E9E1E700FFC9F500FFD2F400FDFAF900FDFAF800FDFAF600FDF9
      F500FDF8F300FDF7F200FDF6F100FDF6EF00FDF5ED00FDF4EB00FDF3EA00FDF2
      E900FDF1E700FDF0E500F5E9DF00F4E9E200E2D0C300C6BEBA00FCFCFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FAF9F900DCD3D300A18D8D00937979008174
      7400FEFEFE000000000000000000000000000000000000000000000000000000
      0000F3F3F300D4D4D400E8E8E800E8E8E700E8E7E700E8E7E600E8E7E500E8E7
      E400E8E6E200E8E6E100E8E5E000E8E4DF00E8E4DE00E8E2DC00E8E2DA00E8E1
      D800E8E0D700E6DED500DAD2CC00C5BEB900E7E5E400FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEBEB00EAE8
      E800000000000000000000000000000000000000000000000000000000000000
      000000000000F1F1F100EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEE00EFEFEE00EFEF
      EE00EFEFEE00EFEEEE00F0EFEF00FDFDFD000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000A00000000100010000000000000A00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFF0000003
      FFFFFFFFFFFFFFFFFFFFFFFFF0000003FFFFFFFFFFFFFFFFFFFFFFFFF0000003
      FFFFFFFFFFFFFFFFF800001FF0000003FFFFFFFFFFFFFFFFF800001FF0000003
      FFFFFFFFFFFFFFFFF800001FF0000003FFE00FFFFFC00FFFF800001FF0000003
      FFC003FFFF8003FFF800001FF0000003FFC001FFFF8001FFF800001FF0000003
      FFC001FFFF8001FFF800001FF0000003FFC001FFFF8001FFF800001FF0000003
      FFE001FFFFC001FFF800001FF0000003FFF001FFFFC001FFE0000007F0000003
      FFF003FFFFF003FFC0000003F0000003FFE01FFFFFF01FFFC0000003F0000003
      FFC00FFFFFE00FFFC0000003F0000003FF8007FFFFC007FFE0000007F0000003
      FF8003FFFFC003FFF000000FF0000003FF8003FFFF8003FFF800001FF0000003
      FF8003FFFF8003FFF800003FF0000003FF8003FFFF8003FFF800007FF0000003
      FFC003FFFF8003FFF80000FFF0000003FFC007FFFF8007FFF80001FFF0000003
      FFE007FFFFC007FFF80003FFF0000003FFF00FFFFFC00FFFF82007FFF0000003
      FFFC3FFFFFF03FFFF8300FFFF0000003FFFFFFFFFFFFFFFFF8381FFFF0000007
      FFFFFFFFFFFFFFFFFFFC3FFFF0000007FFFFFFFFFFFFFFFFFFFE7FFFF000000F
      FFFFFFFFFFFFFFFFFFFFFFFFF000001FFFFFFFFFFFFFFFFFFFFFFFFFF000003F
      FFFFFFFFFFFFFFFFFFFFFFFFF80000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80FFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF007FFFFFFFFFFFFFFFFFFFFFFFFFFFFC003FFFFFFFFFF
      F000001FFFF81FFFFF8001FFF000FFFFF000001FFFF00FFFFF0000FFF00000FF
      F000001FFFE007FFFE00007FF000003FF000001FFFC003FFFC00003FF000001F
      F000001FFF8001FFF800001FF800001FF000001FFF0000FFF800001FFC00001F
      F000001FFE00007FF000000FFE03801FF000001FFE00007FE000000FFC03C03F
      F000001FFC00003FC0000007F80180FFF000001FFC00003FC0000003F801007F
      F000001FFC00003FC0000003F000003FF000001FFC00003FC0000003F000003F
      F000001FFC00003FC0000003F000003FF000001FFC00003FC0000003F000003F
      F000001FFC00003FC0000003F802007FF000001FFC00003FC0000003FC03007F
      F000001FFE00007FC0000003FE0F80FFF000001FFF00007FC0000003FFFFE1FF
      F800003FFF8181FFE0000007FFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFF
      FFFFFFFFFFFFFFFFF800001FFFFFFFFFFFFFFFFFFFFFFFFFFC01803FFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8000000180000001
      FFFFFFFFFFFFFFFF8000000180000001FFFFFFFFFFFFFFFF8000000180000001
      FC3FFC3FF800001F8000000180000001F81FF83FF800001F8000000180000001
      F807E03FF800001F8000000180000001F801807FF800001F8000000180000001
      FC00007FF800001F8000000180000001FC00007FF800001F8000000180000001
      FC00007FF800001FC0000003C0000003FC00007FF800001FE0000007C0000007
      FE0000FFF800001FF800001FE0000007FE0000FFE0000007FE0000FFE000000F
      FE00007FC0000003FFC007FFF000000FFC00003FC0000003FFE007FFF000001F
      F800001FC0000003FFE007FFF800001FF000000FE0000007FFC003FFFC00003F
      E0000007F000000FFFC003FFFC00003FC0000003F800001FFF8001FFFE00007F
      80000001F800003FFF8001FFFE00007F00000001F800007FFF8001FFFE00007F
      00000003F80000FFFF0000FFFE0000FFE000001FF80001FFFF0000FFFE0000FF
      FFC00FFFF80003FFFF0000FFFF0000FFFFE00FFFF82007FFFF0000FFFF0000FF
      FFE00FFFF8300FFFFF0000FFFF0000FFFFE01FFFF8381FFFFF0000FFFF0000FF
      FFF01FFFFFFC3FFFFF0000FFFF0000FFFFF03FFFFFFE7FFFFF8001FFFF8001FF
      FFF83FFFFFFFFFFFFF8001FFFF8001FFFFF87FFFFFFFFFFFFFC003FFFFC003FF
      FFFCFFFFFFFFFFFFFFF00FFFFFF00FFFFFFE3FFFFC00003F8000007FF0000003
      FFFC1FFFF800001F0000007FF0000003FFF007FFF000000F0000007FF0000003
      FFE003FFF00000070000003FF0000003FFC000FFE00000070000003FF0000003
      FF00007FE00000030000003FF0000003FE00003FC00000030000003FF0000003
      FC00001FC00000030000003FF0000003F800000FC00000030000003FF0000003
      F0000007C00000030000003FF0000003F0000003C00000030000003FF0000003
      E0000001C00000030000003FF0000003C0000001C00000030000003FF0000003
      C0000000C00000030000003FF000000380000000E00000030000003FF0000003
      80000000E00000030000007FF000000380000000E00000038000000FF0000003
      00000000E000000380000001F000000300000000E0000003C0000000F0000003
      00000000E0000003C0000000F000000300000000E0000007E0000000F0000003
      00000000F0000007F0000000F000000380000000F000000FF8000000F0000003
      80000000F800000FFC000000F000000380000000F800001FFF800001F0000003
      C0000001FC00003FFFC00001F0000003C0000003FE00007FFFF00003F0000007
      E0000007FF8000FFFFFE0003F0000007F000000FFFC003FFFFFFC007F000000F
      FC01E03FFFFC1FFFFFFFF007F000001FFFFFFFFFFFFFFFFFFFFFFE07F000003F
      FFFFFFFFFFFFFFFFFFFFFFCFF80000FF00000000000000000000000000000000
      000000000000}
  end
  object prp_StyleRepository: TcxStyleRepository
    Left = 222
    Top = 182
    object prp_Style_Yellow1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object prp_Style_Yellow: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
    object prp_Style_Blue: TcxStyle
      AssignedValues = [svColor]
      Color = 12937777
    end
    object prp_Style_Silver: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
  end
  object dxBarManager1: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = #1055#1072#1085#1077#1083#1100#1082#1072' '#1074#1077#1088#1093#1085#1103#1103
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 330
        FloatTop = 112
        FloatClientWidth = 91
        FloatClientHeight = 132
        ItemLinks = <
          item
            Item = prp_SaveAll_LargeButton
            Visible = True
          end
          item
            BeginGroup = True
            Item = prp_History_LargeButton
            Visible = True
          end
          item
            Item = prp_Prodlenie_LargeButton
            Visible = True
          end
          item
            Item = prp_Vipiska_LargeButton
            Visible = True
          end
          item
            Item = Mode_BarStatic
            Visible = True
          end
          item
            BeginGroup = True
            Item = prp_CancelAll_LargeButton
            Visible = True
          end>
        Name = #1055#1072#1085#1077#1083#1100#1082#1072' '#1074#1077#1088#1093#1085#1103#1103
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clBtnFace
    LargeImages = ImageList1
    LookAndFeel.NativeStyle = True
    PopupMenuLinks = <>
    Style = bmsXP
    UseSystemFont = True
    Left = 511
    Top = 99
    DockControlHeights = (
      0
      0
      46
      0)
    object prp_SaveAll_LargeButton: TdxBarLargeButton
      Align = iaRight
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1074#1099#1081#1090#1080
      Category = 0
      Hint = #1055#1088#1080#1085#1103#1090#1100' '#1074#1089#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Visible = ivAlways
      ImageIndex = 3
      ShortCut = 121
      OnClick = prp_SaveAll_LargeButtonClick
      AutoGrayScale = False
    end
    object prp_CancelAll_LargeButton: TdxBarLargeButton
      Caption = '  '#1054#1090#1084#1077#1085#1072'  '
      Category = 0
      Hint = #1042#1099#1093#1086#1076
      Visible = ivAlways
      ImageIndex = 5
      ShortCut = 27
      OnClick = prp_CancelAll_LargeButtonClick
      AutoGrayScale = False
    end
    object prp_Vipiska_LargeButton: TdxBarLargeButton
      Caption = #1042#1099#1087#1080#1089#1072#1090#1100
      Category = 0
      Enabled = False
      Hint = #1042#1099#1087#1080#1089#1072#1090#1100
      Visible = ivAlways
      ImageIndex = 6
      OnClick = prp_Vipiska_LargeButtonClick
      AutoGrayScale = False
    end
    object prp_History_LargeButton: TdxBarLargeButton
      Caption = #1048#1089#1090#1086#1088#1080#1103
      Category = 0
      Hint = #1048#1089#1090#1086#1088#1080#1103' '#1087#1088#1086#1087#1080#1089#1082#1080
      Visible = ivAlways
      ImageIndex = 11
      OnClick = prp_History_LargeButtonClick
      AutoGrayScale = False
    end
    object prp_Prodlenie_LargeButton: TdxBarLargeButton
      Caption = #1055#1088#1086#1076#1083#1080#1090#1100
      Category = 0
      Enabled = False
      Hint = #1055#1088#1086#1076#1083#1080#1090#1100' '#1087#1088#1086#1087#1080#1089#1082#1091
      Visible = ivAlways
      ImageIndex = 9
      OnClick = prp_Prodlenie_LargeButtonClick
      AutoGrayScale = False
    end
    object Mode_BarStatic: TdxBarStatic
      Caption = '-'#1088#1077#1078#1080#1084
      Category = 0
      Hint = '-'#1088#1077#1078#1080#1084
      Visible = ivNever
    end
  end
  object ImageList1: TImageList
    Height = 24
    Width = 24
    Left = 194
    Top = 318
    Bitmap = {
      494C010111001300040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000006000000078000000010020000000000000B4
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008E5D590090605A00905F
      5A00905F5B00905F5B00905F5B00905F5B00905F5B00905F5B00905F5B00905F
      5B00905F5A00905F5A0090605B008E5D59000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C531310000000000000000000000000090605C00FFF0D900FFED
      D300FFEBCC00FFE9C600FFE6C000FFE5BA00FFE2B500FFE0B000FFDEAC00FFDD
      AA00FFDDAA00FFDDAA00FFDDAA0090605A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C5313100C5313100000000000000000090605C00FFF6E500FFF2
      DE00FFF0D800FFEDD100FFEBCA00FFE9C500FFE5BD00FFE2B800FFE1B400FFE0
      B000FFDEAB00FFDDAA00FFDDAA0090605B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C5313100C5313100D45F5E00C53131000000000090605C00FFFAEE00FFF6
      E900FFF3E300FFF2DC00FFEFD500FFEBCF00FFE9C900FFE7C200FFE5BD00FFE2
      B700FFE1B200FFE0AF00FFDEAB0090605C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C5313100C531
      3100DE828200DA737000D5656400D35B5A00C531310090605C00FFFCF800FFFA
      F200FFF8EE00D8893200DA914000DA914000DA914000DA914000DA914000D889
      3200FFE5BB00FFE2B600FFE0B10090605C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5313100E59A9A00E396
      9600E1898900DC7A7900D86A6A00D45E5E00D35B5A00C5313100FFFFFE00FFFE
      FB00FFFCF700FFFAF200FFF7EB00FFF4E600FFF3E000FFEFD900FFEED100FFEB
      CB00FFE9C600FFE6C000FFE3BB0090605C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5313100E59A9A00E59A
      9A00E1909000DD828100D9727200D5656400C531310090605C00FFFFFF00FFFF
      FF00FFFEFE00DC934200DE9D5100DE9D5100DE9D5100DE9D5100DE9E5300DE9C
      4D00FFEDD100FFEBCB00FFE7C40090605C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C5313100E59A9A00E59A9A00C531
      3100C5313100C5313100DC797900C53131000000000090605C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFC00FFFCFA00FFFBF400FFF8EF00FBFBFF00EDC9
      B000EABF9A00E6B08300FFEBCF0090605D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C5313100E59A9A00C53131000000
      000000000000C5313100C5313100000000000000000090605C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FFFBF800F7E9DC00D07B
      3900CE732E00C45A1100FFF0DA0090605D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C5313100C5313100000000000000
      000000000000C531310000000000000000000000000090605C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00E3EBF3005988
      B8004F82B200346CAA00FFF4E60090605C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C5313100C5313100000000000000
      0000000000000000000000000000000000000000000090605C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFFFF00A6E3
      FF00A0E1FF008BD5FF00FFFAF00090605C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C5313100C5313100000000000000
      0000000000000000000000000000000000000000000090605C0090605C009060
      5C0090605C0090605C0090605C0090605C0090605C0090605C0090605C009060
      5C0090605C0090605C0090605C0090605C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000824B4B00824B4B008C4B4B00914B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000824B4B00824B4B00894B4B009C4B4C00B64B4C00BD4B4C009F4B
      4C004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006E2D
      13006E2D13006E2D13006E2D13006E2D13006E2D13006E2D13006E2D13006E2D
      13006E2D13000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008845
      2400884524008845240088452400884524008845240088452400884524008845
      240088452400000000000000000000000000000000000000000000000000824B
      4B00824B4B009A4D4E00AF4E4F00C14E4F00C04D4E00BF4C4D00BF4C4D009F4B
      4C004E1E1F00994B4B00824B4B00824B4B00824B4B00824B4B00824B4B00824B
      4B00824B4B00824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006E2D1300B035
      0A00D7412200EB472F00F2483400F44F3800F4553D00F7604300F64E3500F345
      3000F24A35006E2D13006E2D1300000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000088452400C14F
      1700E05C3800F0624800F5634D00F76A5200F7705700F97B5E00F8694F00F660
      4900F5654E00884524008845240000000000000000000000000000000000824B
      4B00C5545500C9545500C7535400C6525300C5515200C4505100C24F5000A04C
      4D004E1E1F00FE8B8C00FC929300FB9A9C00FAA3A400F8AAAB00F7B1B100F7B5
      B600F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006E2D1300B838
      0F00DC422400EE493100F6583F00F8684700FA734D00F8644100F8826E00F665
      5300EF463100E5472F00C94124006E2D13000000000000000000000000000000
      000000000000000000000000000000000000000000000000000088452400C852
      1E00E45D3B00F2644A00F8735900FA826200FB8C6800FA7E5C00FA9A8800F87F
      6E00F3614A00EB624800D55B3B0088452400000000000000000000000000824B
      4B00CE585900CC575800CB565700CA555600C9545500C7535400C6525300A34E
      4F004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006E2D1300C03B
      1300E1442800F45D4000FB704D00FA704C00FA6C4700B8411700FEDAD700FBBB
      B200B8411700E1442C00C13F20006E2D13000000000000000000000000000000
      000000000000000000000000000000000000000000000000000088452400CE55
      2500E85F4000F7785A00FC8A6800FB8A6700FB866200C85B2A00FEE3E000FCCA
      C300C85B2A00E85F4400CF59360088452400000000000000000000000000824B
      4B00D15B5C00D05A5B00CF595A00CE585900CC575800CB565700CA555600A550
      50004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008E5D590090605A00905F
      5A00905F5B00905F5B00905F5B00905F5B00905F5B00905F5B00905F5B00905F
      5B00905F5A00905F5A0090605B008E5D59000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006E2D1300C73B
      1600EA533500FC724D00FA6F4C00FA6F4B00B8411700F88C7A00FFFBFC00FCE0
      DD00B8411700E24D3100B83C1D006E2D13000000000000000000000000000000
      000000000000000000000000000000000000000000000000000088452400D455
      2900EF6E4E00FD8B6800FB896700FB896600C85B2A00FAA39300FFFCFD00FDE7
      E500C85B2A00E9684A00C856320088452400000000000000000000000000824B
      4B00D55E5F00D55E5F00D45D5E00D35C5D00D15B5C00D05A5B00CF595A00A651
      52004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      000000000000035A050000000000000000000000000090605C00FFF0D900FFED
      D300FFEBCC00FFE9C600FFE6C000FFE5BA00FFE2B500FFE0B000FFDEAC00FFDD
      AA00FFDDAA00FFDDAA00FFDDAA0090605A000000000000000000000000000000
      000000000000C53131000000000000000000000000000000000000000000CE41
      1D00F25F3F00FB724E00FA6E4B00FA694500B8411700FCD5D100FEFEFE00FBE0
      DC00B8411700F3664200B7411F006E2D13000000000000000000000000000000
      00000000000008750D000000000000000000000000000000000000000000D95B
      3200F57A5900FC8B6900FB886600FB836000C85B2A00FDDFDC00FEFEFE00FCE7
      E400C85B2A00F6805D00C75C350088452400000000000000000000000000824B
      4B00DA636400D9626300D8606200D75F6000D55E5F00D45D5E00D35C5D00A953
      54004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      000000000000035A0500035A0500000000000000000090605C00FFF6E500FFF2
      DE00FFF0D800FFEDD100FFEBCA00FFE9C500FFE5BD00FFE2B800FFE1B400FFE0
      B000FFDEAB00FFDDAA00FFDDAA0090605B000000000000000000000000000000
      000000000000C5313100C531310000000000000000000000000000000000B532
      1500B5321500FB6F4B00FC6C4500B8411700F3AB9D00E7E7E700EDEDED00F4D3
      CE00B8411700FC6E4B00CE5430006D2D13000000000000000000000000000000
      00000000000008750D0008750D0000000000000000000000000000000000C54B
      2700C54B2700FC896600FD866000C85B2A00F6BDB100EDEDED00F1F1F100F7DD
      D900C85B2A00FD886600D96F490087452400000000000000000000000000824B
      4B00DE666700DD656600DC646500DA636400D9626300D8606200D75F6000AB55
      55004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000035A0500035A050008971600035A05000000000090605C00FFFAEE00FFF6
      E900FFF3E300FFF2DC00FFEFD500FFEBCF00FFE9C900FFE7C200FFE5BD00FFE2
      B700FFE1B200FFE0AF00FFDEAB0090605C000000000000000000000000000000
      0000C5313100C5313100D45F5E00C53131000000000000000000000000000000
      000000000000B5321500E66A4F00CB818000919DAB00777D870093969600C481
      7000B8411700B6331500B6331500000000000000000000000000000000000000
      000008750D0008750D0013AC290008750D000000000000000000000000000000
      000000000000C54B2700EC846A00D7999800A7B1BD0090959E00A9ABAB00D199
      8A00C85B2A00C64C2700C64C270000000000000000000000000000000000824B
      4B00E2696A00E1686900E0676800DE666700E06D6E00E6909100DC646500AC56
      57004E1E1F0058A55B001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000035A0500035A
      05001EBB4A0015AF38000DA0230005910F00035A050090605C00FFFCF800FFFA
      F200FFF8EE00D8893200DA914000DA914000DA914000DA914000DA914000D889
      3200FFE5BB00FFE2B600FFE0B10090605C000000000000000000C5313100C531
      3100DE828200DA737000D5656400D35B5A00C531310000000000000000000000
      000000000000486493000B6C97000A668F000A648B000A6288000A6289000A65
      8E0000000000000000000000000000000000000000000000000008750D000875
      0D0033CA650027C052001BB439000EA71E0008750D0000000000000000000000
      000000000000637EA9001886AC001780A500167EA200167C9F00167CA000167F
      A40000000000000000000000000000000000000000000000000000000000824B
      4B00E76D6E00E66C6D00E56B6C00E36A6B00EEA6A700FFFFFF00EB9C9C00AF58
      59004E1E1F00EECEAF00B7EBAA005ED377005ED3770045CA670045CA670045CA
      6700F7B5B600824B4B00000000000000000000000000035A050031CE64002AC9
      5C0022C053001AB7440011A92F00099A1900038C0900035A0500FFFFFE00FFFE
      FB00FFFCF700FFFAF200FFF7EB00FFF4E600FFF3E000FFEFD900FFEED100FFEB
      CB00FFE9C600FFE6C000FFE3BB0090605C0000000000C5313100E59A9A00E396
      9600E1898900DC7A7900D86A6A00D45E5E00D35B5A00C5313100000000000000
      00000B6E9A000E69E6000F65E7001164E2001164E100105FDE000C54D4000F5B
      DA000B6E9A000000000000000000000000000000000008750D004AD97E0042D5
      770038CE6E002EC75F0022BB480015AF2D000AA3140008750D00000000000000
      00001888AF001D83EC001E7FED00217EE900227EE800207AE600196FDE001F76
      E3001888AF00000000000000000000000000000000000000000000000000824B
      4B00EB707200EA6F7000E96E6F00E76D6E00F2A9AA00FFFFFF00EB959600B15A
      5A004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300D9F6BD00D9F6
      BD00F7B5B600824B4B00000000000000000000000000035A050035D167002DCC
      620026C558001FBD4D0016B13B000DA32500035A050090605C00FFFFFF00FFFF
      FF00FFFEFE00DC934200DE9D5100DE9D5100DE9D5100DE9D5100DE9E5300DE9C
      4D00FFEDD100FFEBCB00FFE7C40090605C0000000000C5313100E59A9A00E59A
      9A00E1909000DD828100D9727200D5656400C53131000000000000000000013A
      63000F60C5001C75EF001E7DF4001F7FF6001F7FF6001D7BF4001C76EF00186B
      E500145DD9000B6E9A0000000000000000000000000008750D004EDC810046D8
      7C003DD2730034CC680029C255001CB63C0008750D0000000000000000000454
      7D001E7BD200308EF3003395F7003497F8003497F8003294F700308FF3002B85
      EB002678E2001888AF000000000000000000000000000000000000000000824B
      4B00EF747500EE737400ED727300EB707200EA6F7000EF909100E76D6E00B25B
      5C004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000035A05003ED76D0039D36900035A
      0500035A0500035A05001BB84600035A05000000000090605C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFC00FFFCFA00FFFBF400FFF8EF00FBFBFF00EDC9
      B000EABF9A00E6B08300FFEBCF0090605D00C5313100E59A9A00E59A9A00C531
      3100C5313100C5313100DC797900C53131000000000000000000000000000139
      63001878E6002387FC002489FA00258BFA00258BFA00238AFA002186F8001E7E
      F6001A70EB001665D9000B6E9A000000000008750D0058E0870053DD83000875
      0D0008750D0008750D002FC8610008750D000000000000000000000000000553
      7D002C91EC00399EFD003BA0FB003CA2FB003CA2FB003AA1FB00379DFA003396
      F8002E8AF000297FE2001888AF0000000000000000000000000000000000824B
      4B00F3777800F3777800F2767700F0757600EF747500EE737400ED727300B55D
      5D004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000035A05003ED76D00035A05000000
      000000000000035A0500035A0500000000000000000090605C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FFFBF800F7E9DC00D07B
      3900CE732E00C45A1100FFF0DA0090605D00C5313100E59A9A00C53131000000
      000000000000C5313100C531310000000000000000000000000000487D000135
      5B000E589D00288FFB002992FA002A93FA002A93FA002991FA00278EFA002389
      FA001F80F7001A72EA000B6E9A000000000008750D0058E0870008750D000000
      00000000000008750D0008750D0000000000000000000000000000639500044F
      76001D73B1003FA5FC0041A8FB0042A9FB0042A9FB0041A7FB003EA4FB003AA0
      FB003498F9002E8BEF001888AF0000000000000000000000000000000000824B
      4B00F87B7D00F77A7B00F6797A00F4787900F3777800F2767700F0757600B75F
      5F004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000035A050001560300000000000000
      000000000000035A050000000000000000000000000090605C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00E3EBF3005988
      B8004F82B200346CAA00FFF4E60090605C00C5313100C5313100000000000000
      000000000000C53131000000000000000000000000000000000000477B000134
      5800207BCF002D97FC00309CFF002F9AFC002E99FA002D98FB002C96FA002890
      FA002389FB001E7DF6000B6E9A000000000008750D0005710A00000000000000
      00000000000008750D000000000000000000000000000000000000629400044D
      73003694DA0045ACFD0049B0FF0048AFFD0047AEFB0046ADFC0044ABFB003FA6
      FB0039A0FC003395F8001888AF0000000000000000000000000000000000824B
      4B00FC7F8000FB7E7F00FA7D7E00F87B7D00F77A7B00F6797A00F4787900B860
      62004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000035A050001560300000000000000
      0000000000000000000000000000000000000000000090605C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFFFF00A6E3
      FF00A0E1FF008BD5FF00FFFAF00090605C00C5313100C5313100000000000000
      000000000000000000000000000000000000000000000000000000487E000135
      5A002186E1002181D40002375C002A95EE00319EFC00309CFB002E99FB002B95
      FA00278EFA002184F8000B6E9A000000000008750D0005710A00000000000000
      000000000000000000000000000000000000000000000000000000639600044F
      7500379DE8003799DE000751770042AAF2004AB2FD0049B0FC0047AEFC0043AA
      FB003EA4FB00379CFA001888AF0000000000000000000000000000000000824B
      4B00FF818200FF818200FE808100FC7F8000FC7F8000FB7E7F00FA7D7E00BB63
      63004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000035A050001560300000000000000
      0000000000000000000000000000000000000000000090605C0090605C009060
      5C0090605C0090605C0090605C0090605C0090605C0090605C0090605C009060
      5C0090605C0090605C0090605C0090605C00C5313100C5313100000000000000
      0000000000000000000000000000000000000000000000000000035288000353
      8A00023B60000135590001355A00238ADE0033A0FC00329FFB00309CFB002D98
      FA002992FB002388F7000B6E9A000000000008750D0005710A00000000000000
      0000000000000000000000000000000000000000000000000000096D9F000A6E
      A10007557B00034E7400034F75003AA1E6004CB4FD004BB3FC0049B0FC0046AD
      FB0041A8FC00399FF9001888AF0000000000000000000000000000000000824B
      4B00FF818200FF818200FF818200FF818200FF818200FE808100FE808100BD65
      65004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B00000000000000000000000000035A0500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5313100000000000000
      0000000000000000000000000000000000000000000000000000116799001369
      9A0008588B00034F8400023B60002F9DF40035A4FF0034A0FE00319DFC002E99
      FC002B95FE000B6E9A0000000000000000000000000008750D00000000000000
      00000000000000000000000000000000000000000000000000002281AE002583
      AF001373A200096A9C0007557B0048B1F7004FB7FF004DB4FE004AB1FD0047AE
      FD0043AAFE001888AF000000000000000000000000000000000000000000824B
      4B00F77E7F00FF818200FF818200FF818200FF818200FF818200FF818200BF66
      66004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B00000000000000000000000000035A0500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5313100000000000000
      0000000000000000000000000000000000000000000000000000000000001D74
      A4005298BC0013689A000A486E002489D4002D98EE00319EF70034A0FF00309C
      FF00268EEF000B6E9A0000000000000000000000000008750D00000000000000
      000000000000000000000000000000000000000000000000000000000000328D
      B7006DADCB002582AF00166388003BA0DE0046ADF2004AB2F9004DB4FF0049B0
      FF003DA4F3001888AF000000000000000000000000000000000000000000824B
      4B00824B4B00AF5E5F00D56F7000FF818200FF818200FF818200FF818200BF66
      66004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001369
      9C005298BC00559ABD001A6FA00015587E000A486F00043E6700033E6800033E
      67000B6E9A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002583
      B0006DADCB0070AFCC002E89B40027739600166389000B5881000A5882000958
      81001888AF000000000000000000000000000000000000000000000000000000
      000000000000824B4B00824B4B0091515200B6626300EE7A7B00FF818200BF66
      66004E1E1F00914B4B00824B4B00824B4B00824B4B00824B4B00824B4B00824B
      4B00824B4B00824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000013699C00186E9F00166B9D000D5E9100024B8000004579000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002583B0002C88B3002985B1001B79A70007669800006092000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000824B4B00824B4B00985555009F58
      58004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000820000008200000000000000000000000000000000000000
      0000000000000000820000008200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000035A0500035A0500035A0500035A05000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007775750077757500777575007775
      7500777575007775750077757500777575000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007775750077757500777575007775
      7500777575007775750077757500777575000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000082000A31FC000624F000000082000000000000000000000000000000
      0000000082000018F600001CFB00000082000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000035A050016A62A0013A12400035A05000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007675740077757500A9A6A600CBCACA00C6C6C600BFBF
      C100BBBBBB00C6BCBC00C6BCBC00A59F9F007775750077757500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007675740077757500A9A6A600CBCACA00046B0B0090A9
      9300BBBBBB00C6BCBC00C6BCBC00A59F9F007775750077757500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000082000C2EF6000C33FF000724ED000000820000000000000000000000
      82000019F300001DFF000017EF00000082000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000035A05001BAC320016A62A00035A05000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007775750077757500A6A4A400DEDDDD00BFBFC10095939500787674006F6B
      6300736D6000756E6B008B828100B6A6A700D4BDBD00A3959500777575007775
      7500000000000000000000000000000000000000000000000000000000000000
      00007775750077757500A6A4A400DEDDDD00BFBFC10095939500046B0B00046B
      0B0056684900756E6B008B828100B6A6A700D4BDBD00A3959500777575007775
      750000000000000000000000000000000000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000000082000D2EF3000D34FF000927F00000008200000082000019
      F600001FFF000118EE0000008200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000035A05001FB138001BAC3200035A05000000
      0000000000000000000000000000000000000000000000000000000000007775
      750077757500E5E3E500CFCFD0007E7E7E00736F630099937A00BBB49800A7A5
      AB009093AB00BFB69C009F957B007269590072625E00C1AAAB00DDBDBC007775
      7500777575000000000000000000000000000000000000000000000000007775
      750077757500E5E3E500CFCFD0007E7E7E00736F6300898E6E00046B0B0026A9
      4300046B0B008C9F74009F957B007269590072625E00C1AAAB00DDBDBC007775
      750077757500000000000000000000000000BC4B0000FEF3E700FEF0E200FEEE
      DD00FEEAD700FEE7D100FEE5CA00FEE2C400FEE0BD00FEDCB700BC4B0000FED8
      AD00FED5A900FED1A400000082000E2FF3000E36FF000626FA00011CFE00001D
      FF000018F30000008200BC4B000000000000000000006D2D13006D2D13006D2D
      13006D2D13006D2D13006D2D13006D2D13006D2D13006D2D13006D2D13000000
      0000000000000000000000000000035A050023B740001FB13800035A05000000
      0000000000000000000000000000000000000000000000000000777575007775
      7500EFEEEF00C9C7C9006A68640099937A00F3EDCF00FFFFF000FFFFEE0095A1
      ED003D59F200FFFFF600FFFFFF00FBF8E500A7A18A00534C4400A98F8F00EBC2
      C200777575007775750000000000000000000000000000000000777575007775
      7500EFEEEF00C9C7C9006A6864005C7E4B00046B0B00046B0B00046B0B003CD4
      6B0038CC6400046B0B00B0D0B100FBF8E500A7A18A00534C4400A98F8F00EBC2
      C20077757500777575000000000000000000BC4B0000FEF7EE00FEF4EA00FEF2
      E500FEEFDE00FEEDD900FEE9D300FEE7CC00FEE3C600FEE1C000BC4B0000FEDC
      B500FED8B000FED5AB00FED3A500000082000C2FF700082AFF000425FF00021E
      F30000008200FECB9600BC4B0000000000006D2D1300B0350A00D7412200EB47
      2F00F2483400F44F3800F4553D00F7604300F2483400F7776600035A0500035A
      0500035A0500035A0500035A0500035A050028BD490024B94200035A0500035A
      0500035A0500035A0500035A0500035A0500000000000000000077757500F2F0
      F000C7C6C7003460310036792F00FFFFEB00F6E3CA00F3CBA000EFBA8300E3AB
      7B00E3AB7B00F0BD8B00F7DCB800FFFCF300FFFFFF00D4D0BC005F564900A98F
      8F00E9BDBC00777575000000000000000000000000000000000077757500F2F0
      F000C7C6C7005E685700046B0B00046B0B0021B03C002FC955003AD567003DD7
      6C0041DD74003AD06800046B0B009DC49700FFFFFF00D4D0BC005F564900A98F
      8F00E9BDBC00777575000000000000000000BC4B0000FEFAF600FEF8F200FEF6
      ED00FEF3E700FEF0E100FEEEDA00FEEBD500FEE9CF00FEE5C900BC4B0000FEE0
      BD00FEDCB700FED9B200FED7AC00000082001135FB000E32FF000B2EFF000A2B
      F30000008200FECB9600BC4B0000000000006D2D1300B8380F00DC422400EE49
      3100F6583F00F9684600FA714D00F8644100F8826E00F8908200035A05003DD6
      6C003DD66C0039D0650035CC5E0030C756002DC2500028BD490024B9420021B5
      3D001EB036001BAC320016A62A00035A05000000000077757500B1AFAF00EEED
      EE004E6B4C00046B0B00046B0B00739E5800F4D09700F0C48A00EFBB8000EFB2
      7500EEA96900EAA76900EFBD8100FAE5B400FFFBE700FFFFFF00D4D0BC005046
      3E00CCA7A700AC96960077757500000000000000000077757500B1AFAF00EEED
      EE006C7369001A701B000F951E001DB5360023BB410029C14B0032CB580038D1
      64003ED76D0044E37A0024A64100046B0B00FFFBE700FFFFFF00D4D0BC005046
      3E00CCA7A700AC9696007775750000000000BC4B0000FEFCFB00B85B2D006E2D
      13006E2D13006E2D13006E2D13006E2D1300D49C8200FEE9D100BC4B0000FEE3
      C600D5812700D5812700000082001A41F7001844FF001134F6001032F600123B
      FF000D2DF30000008200BC4B0000000000006D2D1300C03B1300E1442800F45D
      4000FA714D00FA714D00F9684600B8411700FEDAD700FCCFC900035A05003DD6
      6C003DD66C003DD66C0039D0650035CC5E0035CC5E002DC2500028BD490024B9
      420021B53D0021B53D001BAC3200035A05000000000077757500FEFCFC007791
      7800046B0B0035C55C003FD96F00046B0B0084AD6400FCEBB600F8E2AC00F6D3
      9C00F0C48A00EDB47800EEBA7F00F3CE9600F8DEA900FAF0D900FFFFFF009F95
      7B006E5B5800F2C0C00077757500000000000000000077757500FEFCFC00A6A5
      A70035743000078711000F9E1E00046B0B00046B0B00046B0B00046B0B002DBF
      51003FDC6E0022A33E00046B0B00E0C58A00F8DEA900FAF0D900FFFFFF009F95
      7B006E5B5800F2C0C0007775750000000000BC4B0000FEFEFE00AD350900E94B
      2F00F7634400F86B4D00F4685500E1462D006E2D1300FEEDDA00BC4B0000FEE7
      CF00FEE5C900000082002049F8002250FF00193FF00000008200000082001133
      F000133EFF000E30F30000008200000000006D2D1300C03B1300EA533500FA71
      4D00FA6F4C00FA714D00B8411700F88C7A00FEFEFE00FDE9E600035A05000156
      03000156030001560300035A0500035A050035CC5E0035CC5E00035A05000156
      03000156030001560300035A05000156030077757500C1C0C000B4CCB500046B
      0B0026B144003DD86B0041DC730036CA6000046B0B00A3C98300FFFCCB00FCF3
      C000F8E2AC00F2C79200EEBA8000EEBA7F00EFBD8100F0C48A00FCF3E500FAF0
      D9005F564900D0A6A600C0A1A0007775750077757500C1C0C000EFEEEF00807E
      79000F72110006890D001576160075AC6000C2DC9F00D0E3A700046B0B0023AC
      3F001B983100046B0B00EAB87E00EEBA7F00EFBD8100F0C48A00FCF3E500FAF0
      D9005F564900D0A6A600C0A1A00077757500BC4B0000FEFEFE00BA390F00F769
      4600F8654500FCD9D400FBC6BC00E5593A006E2D1300FEF0E300BC4B0000FEEB
      D800000082002856F8002A59FF001D42ED0000008200FED9B200FED7AD000000
      82001134ED001540FF001033F6000000820000000000CE411D00F6583F00FA71
      4D00FA714D00F9684600B8411700FCD5D100FEFEFE00FDE9E600CE744F00F790
      7500CC7457006D2D130000000000035A05003DD66C0035CC5E00035A05000000
      00000000000000000000000000000000000077757500F7F6F600046B0B002BC5
      4E002BC54E0030C7560039D1650042DE750031C05800046B0B00CBE1A600FFFF
      D100FFFFCF00FCEBB600F3CE9600EEB77B00EAAC6F00EAA76900F3CBA000FFFF
      FF00907D7200907D7200F4C1C0007775750077757500F7F6F600C5C4C5009995
      8400037007001B781C00D4E6B100FFFFCC00FFFFCC00FFFFCC00046B0B000A73
      1300046B0B00FCEBB600F3CE9600EEB77B00EAAC6F00EAA76900F3CBA000FFFF
      FF00907D7200907D7200F4C1C00077757500BC4B0000FEFEFE00E1896E00F86C
      4900FBA99800FFFFFF00FBBDB000FA6E4B00C9927700FEF4EB00BC4B0000FEEF
      E00000008200305FFB00244BEF0000008200D5812700D5812700D5812700D581
      2700000082001336F000143BF8000000820000000000B5321500B5321500FA71
      4D00F9684600B8411700F3AB9D00E7E7E700EDEDED00F4D3CE00B8411700FA6F
      4C00CE5430006D2D130000000000035A05003DD66C003DD66C00035A05000000
      00000000000000000000000000000000000077757500046B0B001BB132001BB1
      32001FB23A0027BC46002EC6540038D0640042DE740028AD4700046B0B00C5CF
      A000BFBB9C00FFFCCB00FFFBC200FFD79900FBBB7A00EEA96900EDB47F00FFFF
      F400B1A6910072625E00F4C0BF007775750077757500FFFFFF00ACABAB00BBB4
      98000260050096C19600FFFFE900FFFFCC00FFFFCC00FFFFCC00046B0B00046B
      0B00BFBB9C00FFFCCB00FFFBC200FFD79900FBBB7A00EEA96900EDB47F00FFFF
      F400B1A6910072625E00F4C0BF0077757500BC4B0000FEFEFE00FEFEFE00558A
      D8001B77B0001B7AB4002379AA00B4B5C700F3EBE200FEF8F200BC4B0000FEF3
      E700FEF0E2000000820000008200FEE9D000FEE5CA00FEE2C400FEE0BD00FEDC
      B800FEDAB200000082000000820000000000000000000000000000000000B532
      1500E66A4F00CB818000919DAB00777D870093969600C4817000B8411700B532
      1500B53215000000000000000000035A05003DD66C003DD66C00035A05000000
      000000000000000000000000000000000000046B0B00046B0B00046B0B00046B
      0B0016A62A001DB1370028BF47001C9D3300046B0B00046B0B00046B0B00046B
      0B00464D48005B5C51008B8B7600877A6000866D5200BF8E5E00EFB2750095A1
      ED009093AB00705D5400EDBAB8007775750077757500FFFFFF00ABA7A400BBB8
      A7004BBDFF00DCEBDE00FFFFFC00FFFFDC00FFFFCC00FFFFD100CED4A7005555
      51004C4C4E005B5C51008B8B7600877A6000866D5200BF8E5E00EFB2750095A1
      ED009093AB00705D5400EDBAB80077757500BC4B0000FEFEFE006EB8FC002890
      FA002890FA002890FA002890FA003296F800E6E7E700FEFBF800BC4B0000FEF7
      EF00FEF4EA00FEF2E500FEEFDE00FEEDD900FEE9D400FEE7CC00FEE3C700FEE1
      C100FEDEBB00FEDAB500BC4B0000000000000000000000000000000000004864
      93000B6C97000A658E000A658E000A658E000A658E000A658E00000000000000
      0000000000000000000000000000035A05003DD66C003DD66C00035A05000000
      00000000000000000000000000000000000077757500FFFFFF00568353000B62
      0F000D971B0016A629001FB438000C79160082B26D00D4E6AF00ADC08E00485A
      49006568680016161600202020001F2020001F1F2000BF8E5E00F2B479003D59
      F2005E6DA90079675800EDBAB8007775750077757500FFFFFF00B2ACA900A6AF
      A9001F81FF00E3F0E900FFFFFF00FFFFF600FFFFD500FFFFD100D3D3AB005B5B
      5B0069696C0016161600202020001F2020001F1F2000BF8E5E00F2B479003D59
      F2005E6DA90079675800EDBAB80077757500BC4B0000FEFEFE00187DB400309C
      FB00309CFB00309CFB00309CFB00157BB600BDDAEE00FEFCFC00BC4B0000FEFB
      F600D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700D5812700FEDEBD00BC4B00000000000000000000000000000B6E9A000E69
      E6000E69E6001164E1001164E100105FDE000C54D4000F5BDA000B6E9A000000
      0000000000000000000000000000035A0500035A0500035A0500035A05000000
      00000000000000000000000000000000000077757500FFFEFE00B6B6B6002F73
      2900046B0B000E9E1D0016A72A0009721000BDD8B400FFFFD100FFFFCF00ADAD
      910068685B001C1C1D005B5C5100E5E3BB00E7CC9900E7B17700EEB77B00FCF3
      E500ABA78F007D6B6900F3BFBD007775750077757500FFFEFE00B6B6B600C4B5
      9D00FFFFFA00FFFFFF00FFFFFF00FFFFFF00FFFFF000FFFFD100FFFFCF00ADAD
      910068685B001C1C1D005B5C5100E5E3BB00E7CC9900E7B17700EEB77B00FCF3
      E500ABA78F007D6B6900F3BFBD0077757500BC4B0000FEFEFE00055A970033A0
      FB0033A0FB0033A0FB0033A0FB001278B000BAD8E900FEFEFE00BC4B0000FEFC
      FB00FEFBF700FEFAF300FEF7EE00FEF3E900FEF2E300FEEFDE00FEEBD800FEE9
      D300FEE6CC00FEE3C600BC4B00000000000000000000013A61000F60C5001C75
      EF001D7BF4001D7BF4001F80F7001D7BF4001C75EF00186BE500105FDE000B6E
      9A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000077757500F7F4F600CFCFD0005882
      4A00046B0B00089511000E9D1C0007740F0099C29C00FFFFF400FFFFD500FFFF
      D500FFFFDC00A6A68C001C1C1D005F5D5000F8E2AC00F8C48400F2C79200FFFF
      E900938E7700997E7F00F4C0BF007775750077757500F7F4F600CFCFD000B1A6
      9100FFFBEE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF400FFFFD500FFFF
      D500FFFFDC00A6A68C001C1C1D005F5D5000F8E2AC00F8C48400F2C79200FFFF
      E900938E7700997E7F00F4C0BF0077757500BC4B0000FEFEFE004588AF00055A
      9700085F9F00085F9F00116EB50013639700FEFEFE00FEFEFE00BC4B0000FEFE
      FE00FEFCFB00FEFBF800FEFAF400FEF7F000FEF4EB00FEF2E600FEEFE100FEEE
      DA00FEEAD400FEE7CF00BC4B00000000000000000000013A61001878E6002387
      FC00248AFA00248AFA00248AFA002388F700248AFA001D7BF4001C75EF001164
      E1000B6C97000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000077757500C1BFC000F7F4F600878F
      7800046B0B00058A0C0007931100067D0E00428A4500FFFFFF00FFFFF600FFFF
      DE00FFFFCF00FFFFD900AFAF93001A1C1D00504A3F00E6BD8700FBE5BD00F6F0
      CE00706B6000CFA6A700C0A0A0007775750077757500C1BFC000F7F4F600A399
      9000F6E3CA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF600FFFF
      DE00FFFFCF00FFFFD900AFAF93001A1C1D00504A3F00E6BD8700FBE5BD00F6F0
      CE00706B6000CFA6A700C0A0A00077757500BC4B0000FEFEFE00EAF2F700669F
      BF0006558900004B820028739F00C0D8E300FEFEFE00FEFEFE00BC4B0000FEFE
      FE00D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700D5812700FEEBD800BC4B00000000000000487D0002375C000E589D00288F
      FB002991FA002991FA002991FA002991FA00248AFA00248AFA001D7BF4001C75
      EF000B6C97000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077757500FCFBFB00BABA
      BA00317228000478090005910D00068B0D00046B0B00BAD7BB00FFFFFF00FFFF
      FF00FFFFF000FFFFDC00FFFFDE00C2C1A1001F1F1F0056514B00FFFFE100ABA7
      8F007D6B6900F4C1C00077757500000000000000000077757500FCFBFB00BABA
      BA00C4B09700FFFCF000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF000FFFFDC00FFFFDE00C2C1A1001F1F1F0056514B00FFFFE100ABA7
      8F007D6B6900F4C1C0007775750000000000BC4B0000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00BC4B0000FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFCFC00FEFBF800FEFAF300FEF7EF00FEF4
      EB00FEF3E500FEEFE000BC4B00000000000000467A0002375C00207BCF002991
      FA0034A0FE0034A0FE002D98FA002D98FA002991FA002991FA00248AFA001D7B
      F4000B6E9A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077757500B4B1B100EAEB
      EB0088937D0007630A0005890C0006920D00057F0B00046B0B00A1C7A400FFFF
      FF00FFFFFF00FFFFFF00FFFFF600FFFFE300BFBB9C00BBB8A700E5E3BB006D6B
      6500CCA7A700AD96960077757500000000000000000077757500B4B1B100EAEB
      EB00A59E9700E2CBAD00FFFFFA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF600FFFFE300BFBB9C00BBB8A700E5E3BB006D6B
      6500CCA7A700AD9696007775750000000000BC4B0000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00BC4B0000FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFCFC00FEFCFA00FEFBF700FEF8
      F200FEF6ED00FEF3E700BC4B00000000000000467A0002375C002186E1002181
      D40002375C002A95EE0034A0FE002D98FA0034A0FE002991FA00248AFA00248A
      FA000B6E9A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000077757500F2F0
      F000D0D1D300597F51000360050005860C0006930E0005860C00046B0B002E80
      32006EA97300A3C9A500C6DEC700CFE3C900DEEDC700EEEFC5007E7B7000B699
      9A00E9BDBC00777575000000000000000000000000000000000077757500F2F0
      F000D0D1D300A3999000E7D1B200FFFFF400FFFFFF00FFFFFF00FFFFFF00FCFE
      FF00F7FCFC00FFFFFF00FFFFFF00FFFFF600FFFFE300EEEFC5007E7B7000B699
      9A00E9BDBC00777575000000000000000000BC4B0000D9640100D9640100D964
      0100D9640100D9640100D9640100D9640100D9640100D9640100D9640100D964
      0100D9640100D9640100D9640100D9640100D9640100D9640100D9640100D964
      0100D9640100D9640100BC4B0000000000000352890003528900013A61000237
      5C0002375C00238ADE0034A0FE0034A0FE002D98FA002D98FA002991FA002388
      F7000B6E9A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000777575007775
      7500EAEBEB00CACBCE0068875D00046B0B00046B0B0004820B0005890D000683
      0E0006750D00046B0B00046B0B00046B0B0045843D0086817900AA959600E7C0
      BF00777575007775750000000000000000000000000000000000777575007775
      7500EAEBEB00CACBCE00A99F9600CFBBA100FAF0D900FFFFFA00FFFFFF004BBD
      FF001F81FF00FFFFFF00FFFFFF00FCFCE500CBC9AA0086817900AA959600E7C0
      BF0077757500777575000000000000000000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000000000001167990013689A0008588B00034F
      8400013A61002F9DF40034A0FE0034A0FE0034A0FE002D98FA002991FA000B6E
      9A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007775
      750077757500E5E3E500D4D4D50099A19700577F4C00046B0B00046B0B00046B
      0B00046B0B00046B0B00588E5100738A67008C898200C9AFB000DDBDBC007775
      7500777575000000000000000000000000000000000000000000000000007775
      750077757500E5E3E500D4D4D500ACAAA900ACA09200CFBBA100E6D7BC00E1DE
      CC00D3D9D100E9E5C700CBC6B4009E998C00968B8A00C9AFB000DDBDBC007775
      75007775750000000000000000000000000000000000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B00000000000000000000000000001D74A4005298BC001167
      99000A486E002489D4002D98EE002F9DF40034A0FE0034A0FE00268EEF000B6E
      9A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007775750077757500A6A5A600D8D8D800C2C5C600ACAAA900A5A09C00A9A1
      9800ABA19700A09A9500A49C9900BBABAC00D4BDBD00A3959500777575007775
      7500000000000000000000000000000000000000000000000000000000000000
      00007775750077757500A6A5A600D8D8D800C2C5C600ACAAA900A5A09C00A9A1
      9800ABA19700A09A9500A49C9900BBABAC00D4BDBD00A3959500777575007775
      7500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000013689A005298BC005298
      BC001A6FA00015587E000A486E00013A6100033E6800013A61000B6E9A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007676760077757500A4A3A300C4C4C400C0C0C100B8BA
      BB00B6B6B600C0B6B600C0B6B600A19C9C007775750077757500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007676760077757500A4A3A300C4C4C400C0C0C100B8BA
      BB00B6B6B600C0B6B600C0B6B600A19C9C007775750077757500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001368
      9A001A6FA00013689A000D5E9100034F840000467A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007775750077757500777575007775
      7500777575007775750077757500777575000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007775750077757500777575007775
      7500777575007775750077757500777575000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000082000000820000000000000000000000000000000000000000000000
      0000000082000000820000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      82000A31FC000624F00000008200000000000000000000000000000000000000
      82000018F600001CFB0000008200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500089511000690
      0E00035A05000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      82000C2EF6000A31FC000724ED00000082000000000000000000000082000018
      F600001CFB000017EF0000008200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A05000C9D19000A98
      1400035A05000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000006E0000006E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000006E0000006E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000082000C2EF6000A31FC000C2EF60000008200000082000018F600001C
      FB000018F600000082000000000000000000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BB4B0000B5480000035A0500035A0500035A0500035A050011A624000EA1
      1D00035A0500035A0500035A0500035A05000000000000000000000000000000
      000000000000000000000000000000000000004B000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000006E000019EB000008C90000006E000000000000000000000000000000
      00000000000000000000000000000000000000006E000001D9000004E1000000
      6E0000000000000000000000000000000000000000006E2D13006E2D13006E2D
      13006E2D13006E2D13006E2D13006E2D13006E2D13006E2D13006E2D13000000
      000000000000000082000E30F3000A31FC000626FA00001CFB00001CFB000018
      F60000008200000000000000000000000000BC4B0000FEF3E700FEF0E200FEEE
      DD00FEEAD700FEE7D100FEE5CA00FEE2C400FEE0BD00FEDCB700BC4B0000FED8
      AD00FCD4A700F4CA9E00035A050025C7470020C140001CBA380018B2300014AC
      290011A522000DA01C000A9A1700035A05000000000000000000000000000000
      0000000000000000000000000000004B0000118C1F00004B0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      6E000019EB000019EB000019EB000007C90000006E0000000000000000000000
      000000000000000000000000000000006E000001D6000008EA000008EA000006
      EA0000006E000000000000000000000000006E2D1300B0350A00D7412200EB47
      2F00F2493400F44F3800F4553D00F7604300F2493400F3453000F24934006E2D
      13006E2D130000000000000082001032F600082AFF000626FA00001CFB000000
      820000000000000000000000000000000000BC4B0000FEF7EE00FEF4EA00FEF2
      E500FEEFDE00FEEDD900FEE9D300FEE7CC00FEE3C600FEE1C000BC4B0000FEDC
      B500FED8B000F6CFA600035A05002CD3550028CC4D0023C545001FBF3E001BB7
      350017B02E0013AB270010A52000035A05000000000000000000000000000000
      00000000000000000000004B0000138F230007931000169C2800004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      6E000014D9000021EB000019EB000019EB000008C90000006E00000000000000
      0000000000000000000000006E000001D6000008EA000006EA000008EA000007
      C90000006E000000000000000000000000006E2D1300B8380F00DC422400EE49
      3100F6583F00F9684600FA714D00F8644100F8826E00F6655300EE493100E547
      2F00C94124006E2D1300000082001135FB000A31FC00082AFF001032F6000000
      820000000000000000000000000000000000BC4B0000FEFAF600FEF8F200FEF6
      ED00FEF3E700FEF0E100FEEEDA00FEEBD500FEE9CF00FEE5C900BC4B0000FEE0
      BD00FEDCB700FBD7B000035A0500035A0500035A0500035A050027CB4B0022C4
      4300035A0500035A0500035A0500035A05000000000000000000000000000000
      000000000000004B0000159127000FA01E000A99150008961200159A2700004B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000006E000014D6000019EB000019EB000019EB000008C90000006E000000
      00000000000000006E000004E1000008EA000008EA000008EA000007C9000000
      6E00000000000000000000000000000000006E2D1300C03B1300E5472F00F658
      3F00FA714D00FA714D00F9684600B8411700FEDAD700FBBBB200B8411700E547
      2F00D3725800000082001A41F7001844FF001032F6001032F600123BFF000C2E
      F60000008200000000000000000000000000BC4B0000FEFCFB00B85B2D006E2D
      13006E2D13006E2D13006E2D13006E2D1300D49C8200FEE9D100BC4B0000FEE3
      C600D5812700D4802700D5812700D5812700D5812700035A05002DD4580029CF
      5200035A0500A98865009A3E0000000000000000000000000000000000000000
      0000004B00000F811C001AAF310014A727000FA01E000C9A180008961200159A
      2700004B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000006E000014D6000021EB000019EB000019EB000014D6000000
      6E0000006E000004E1000006EA000006EA000008EA000007C90000006E000000
      0000000000000000000000000000000000006E2D1300C03B1300EA533500FA71
      4D00FA714D00FA714D00B8411700F88C7A00FFFBFC00FCE0DD00B8411700EB7E
      6700000082002049F8002250FF00193FF00000008200000082001032F600123B
      FF001032F600000082000000000000000000BC4B0000FEFEFE00AD350900E94B
      2F00F7634400F86B4D00F4685500E1462D006E2D1300FEEDDA00BC4B0000FEE7
      CF00FEE5C900FEE1C200FEDEBD00FEDCB600FED9B100035A050034DE650030D9
      5E00035A0500C09C7500A642000000000000000000000000000000000000004B
      00000E7D1A0028C0480021B83D001BB0330015912700004B0000169C28000896
      1200159A2700004B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000006E000014D6000021EB000019EB000019EB000014
      D9000006EA000008EA000006EA000008EA000001D90000006E00000000000000
      00000000000000000000000000000000000000000000CE411D00F6583F00FA71
      4D00FA714D00F9684600B8411700FCD5D100FFFBFC00FCE0DD00CE744F000000
      82002856F8002A59FF001D42ED00000082000000000000000000000082001134
      ED001540FF001032F6000000820000000000BC4B0000FEFEFE00BA390F00F769
      4600F8654500FCD9D400FBC6BC00E5593A006E2D1300FEF0E300BC4B0000FEEB
      D800FEE9D100FEE6CB00FEE3C500FEE0BF00FEDDB800035A0500035A0500035A
      0500035A0500FED0A000BC4B0000000000000000000000000000004B00000C77
      170035CF5E002FC9540028C048001B9F3100004B000000000000004B00000C9A
      18000A99150015912700004B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000006E00001AD6000021EB000019EB000012
      EB000008EA000008EA000008EA000001D90000006E0000000000000000000000
      00000000000000000000000000000000000000000000B5321500B5321500FA71
      4D00F9684600B8411700F3AB9D00E7E7E700EDEDED00F4D3CE00CE744F000000
      8200305FFB00244BEF0000008200000000000000000000000000000000000000
      82001032F600143BF8000000820000000000BC4B0000FEFEFE00E1896E00F86C
      4900FBA99800FFFFFF00FBBDB000FA6E4B00C9927700FEF4EB00BC4B0000FEEF
      E000D5812700D5812700D5812700D5812700D4802700D3802700CF7D2600CE7D
      2500CE7D2500F6CCA100BA4A0000000000000000000000000000004B00003FD9
      6F003BD7680036D0600020AA3B00004B0000000000000000000000000000004B
      000007740E000A991500159A2700004B00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000006E000019DE000019EB000012
      EB000019EB000012EB00000ED60000006E000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B532
      1500E66A4F00CB818000919DAB00777D870093969600C4817000B8411700B532
      1500000082000000820000000000000000000000000000000000000000000000
      000000008200000082000000000000000000BC4B0000FEFEFE00FEFEFE00558A
      D8001B77B0001B7AB4002379AA00B4B5C700F3EBE200FEF8F200BC4B0000FEF3
      E700FEF0E200FEEEDD00FEEAD500FEE9D000FEE5CA00FEE2C400FEE0BD00FCDA
      B700FCD9B100FED7AC00BC4B0000000000000000000000000000004B00001B9F
      310041DC700023AD4100004B0000000000000000000000000000000000000000
      000000000000004B00000A99150010951F00004B000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000006E000020E7000021EB000019
      EB000019EB000019EB000014D90000006E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004864
      93000B6C97000A658E000A658E000A658E000A658E000A658E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEFEFE006EB8FC002890
      FA002890FA002890FA002890FA003296F800E6E7E700FEFBF800BC4B0000FEF7
      EF00FEF4EA00FEF2E500FEEFDE00FEEDD900FEE9D400FEE7CC00FEE3C700FEE1
      C100FEDEBB00FEDAB500BC4B000000000000000000000000000000000000004B
      00002EC15200004B000000000000000000000000000000000000000000000000
      00000000000000000000004B00000C9A180008961200004B0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000006E00032AE7000129EB000021EB000021
      EB000021EB000019EB000021EB000014D60000006E0000000000000000000000
      00000000000000000000000000000000000000000000000000000B6E9A000E69
      E6000E69E6001164E1001164E100105FDE000C54D4000F5BDA000B6E9A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEFEFE00187DB400309C
      FB00309CFB00309CFB00309CFB00157BB600BDDAEE00FEFCFC00BC4B0000FEFB
      F600D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700D5812700FEDEBD00BC4B0000000000000000000000000000000000000000
      0000004B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004B00000464080008961200004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000006E000428DC000931EB000129EB000129EB000019
      DE00001AD6000129EB000021EB000021EB000014D60000006E00000000000000
      00000000000000000000000000000000000000000000013A61000F60C5001C75
      EF001D7BF4001D7BF4001F80F7001D7BF4001C75EF00186BE500145DD9000B6E
      9A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEFEFE00055A970033A0
      FB0033A0FB0033A0FB0033A0FB001278B000BAD8E900FEFEFE00BC4B0000FEFC
      FB00FEFBF700FEFAF300FEF7EE00FEF3E900FEF2E300FEEFDE00FEEBD800FEE9
      D300FEE6CC00FEE3C600BC4B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B000007740E00004B
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000006E00092FE0000931EB000931EB000E39EB000121D7000000
      6E0000006E00001AD6000129EB000021EB000021EB000014D60000006E000000
      00000000000000000000000000000000000000000000013A61001878E6002387
      FC00248AFA00248AFA00248AFA00248AFA002387FC001D7BF4001C75EF001665
      D9000B6E9A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEFEFE004588AF00055A
      9700085F9F00085F9F00116EB50013639700FEFEFE00FEFEFE00BC4B0000FEFE
      FE00FEFCFB00FEFBF800FEFAF400FEF7F000FEF4EB00FEF2E600FEEFE100FEEE
      DA00FEEAD400FEE7CF00BC4B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B0000035E
      0600004B00000000000000000000000000000000000000000000000000000000
      000000006E000E36E000123EEB00123EEB000E39EB000220CC0000006E000000
      00000000000000006E000015CC000129EB000021EB000021EB00001AD6000000
      6E000000000000000000000000000000000000487D0002375C000E589D00288F
      FB002991FA002991FA002991FA002991FA00248AFA00248AFA001D7BF4001C75
      EF000B6E9A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEFEFE00EAF2F700669F
      BF0006558900004B820028739F00C0D8E300FEFEFE00FEFEFE00BC4B0000FEFE
      FE00D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700D5812700FEEBD800BC4B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004B0000004B000000000000000000000000000000000000000000000000
      6E00143FE6001543EB00123EEB00123EEB000220CC0000006E00000000000000
      0000000000000000000000006E000015CC000129EB000129EB000021EB000019
      DE0000006E0000000000000000000000000000467A0002375C00207BCF002991
      FA0034A0FE0034A0FE002D98FA002D98FA002991FA002991FA00248AFA001D7B
      F4000B6E9A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00BC4B0000FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFCFC00FEFBF800FEFAF300FEF7EF00FEF4
      EB00FEF3E500FEEFE000BC4B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B0000000000000000000000000000000000000000
      6E001846EA001846EA001846EA000220CC0000006E0000000000000000000000
      000000000000000000000000000000006E000015CC000129EB000129EB000019
      DE0000006E0000000000000000000000000000467A0002375C002186E1002181
      D40002375C002A95EE0034A0FE002D98FA0034A0FE002991FA00248AFA00248A
      FA000B6E9A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00BC4B0000FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFCFC00FEFCFA00FEFBF700FEF8
      F200FEF6ED00FEF3E700BC4B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000006E001842E2000A28C90000006E000000000000000000000000000000
      00000000000000000000000000000000000000006E000018CD000121D7000000
      6E00000000000000000000000000000000000352890003528900013A61000237
      5C0002375C00238ADE0034A0FE0034A0FE002D98FA002D98FA002991FA00248A
      FA000B6E9A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000D9640100D9640100D964
      0100D9640100D9640100D9640100D9640100D9640100D9640100D9640100D964
      0100D9640100D9640100D9640100D9640100D9640100D9640100D9640100D964
      0100D9640100D9640100BC4B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000006E0000006E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000006E0000006E000000
      0000000000000000000000000000000000001167990013689A0008588B00034F
      8400013A61002F9DF40034A0FE0034A0FE0034A0FE002D98FA002991FA000B6E
      9A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001D74A4005298BC001167
      99000A486E002489D4002D98EE002F9DF40034A0FE0034A0FE00268EEF000B6E
      9A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000013689A005298BC005298
      BC001A6FA00015587E000A486E00013A6100033E6800013A61000B6E9A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001368
      9A001A6FA00013689A000D5E9100034F840000467A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B8200004B
      8200004B8200004B820000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009F675A009F675A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004B8200004B8200004B8200015D97000164
      9C0000639D00005E9900004B8200004B8200004B820000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009F675A009F675A00FFD8AA009F675A009F675A009F67
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B8200168BBA001EB4DD001CC2EB0013C9F4000AC5
      F60003BFF70000B8F40000B2EE0000A5E1000089C900004B8200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006C6A6A006C6A6A006C6A6A0000000000000000000000
      0000000000006C6A6A006C6A6A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009F675A00FFE7C4009F675A00FFE7C400FFE7C400FFD8
      AA009F675A00905E590000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004B82004BD3E60056FAFF0043EEFF0032E3FF0026DEFF0018D5
      FF000CCEFF0004C7FF0000C5FF0000C4FF0000C7FF0000BCF400004B82000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006C6A6A00B0ADAD00969293008E8A8B006C6A6A006C6A6A00817E
      7F006C6A6A00DDDCDC00D0CFCF006C6A6A006C6A6A006C6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008B5B580093655E009F675A009F675A009F675A009F675A009F67
      5A009F675A009F675A009F675A009F675A009F675A009F675A009F675A009F67
      5A009F675A009F675A009F675A00000000000000000000000000000000000000
      000000000000000000000000000000000000004B0000118C1F00004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000253890032A5C50062F0F6005CFBFF004AEFFF0038E7FF002BDC
      FE001ED4FC0015D5FF0009CEFF0002CAFF0000BFFA000098D500004B82000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006C6A6A00D5D4D400C6C4C400A19F9F00A19F9F00A19F9F00838182005C5B
      5B00BCBCBC00CECECE00CFCFCF00D1D1D100D3D3D300CAC9C9006C6A6A006C6A
      6A006C6A6A000000000000000000000000000000000000000000000000000000
      0000000000008E5D590093655E00FFE7C400FFE2BB00FFE0B500FFD8AA00FFD1
      A000FFCF9800FFCA9100FFC58A00FFC28400FFC28400FFC28400FFC28400FFC2
      8400FFC28400FFC284009F675A00000000000000000000000000000000000000
      0000000000000000000000000000004B0000138F230007931000169C2800004B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B8200004B820035B2CF0040C9E00039CEE700169F
      CF000D98CC0016BAE5000EB2E1000393CC00004B8200004B8200000000000000
      0000000000000000000000000000000000000000000000000000000000006C6A
      6A00D8D7D700E0DEDE00C0BFBF00A19F9F00A19F9F00A19F9F00626060000000
      000000000000161616005D5D5D00A9A9A900CACACA00CACACA00CACACA00CACA
      CA00C1C0C0006C6A6A006C6A6A006C6A6A000000000000000000000000000000
      0000000000008B5B580095665E00FFE7C400FBDCBD00B0909900FCD0A700FCD0
      A700FFD1A000FFD19C00FFCF9800FFC98C00FFC58600FFC58600FFC58600FFC5
      8600FFC58600FFC586009F675A00000000000000000000000000000000000000
      00000000000000000000004B0000159127000FA01E000A99150008961200159A
      2700004B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004B8200004B82001880AC000083
      C000008CCA000877AC00004B8200004B82000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006C6A6A00D3D3
      D300D4D3D300CFCFCF008C8A8A00817F7F00817F7F00817F7F006C6A6A001414
      140008080800000000000000000000000000161616005D5D5D00A9A9A900CACA
      CA00CACACA00B7B6B600B7B6B6006C6A6A000000000000000000000000000000
      000098685F00AA807A0098685F00FFF7D800FCDCBD0000008200FED9B800FFE0
      B5009F675A009F675A009F675A009F675A009F675A009F675A009F675A009F67
      5A009F675A00FFC284009F675A00000000000000000000000000000000000000
      000000000000004B00000F811C001AAF310014A727000FA01E000C9A18000896
      1200159A2700004B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000094F82000095
      D300009FDE00094F820000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006C6A6A00CACACA00CACA
      CA00C6C6C6008E8C8C00B8B5B500B6B4B400A19F9F00A19F9F009F9D9D009997
      97009390910082808000525050002B2A2A000808080000000000000000001616
      160064646400817E7F006C6A6A00000000000000000000000000000000000000
      000098685F00B5918B009A6A6000FFF7E000FCE1C500BBA6B500FEDDC000FFE2
      BB00FFD3A300FFD09F00FFCF9C00FFCC9800FFCA9500FFC99100FFC78E00FFC6
      8B00FFC58900FFC487009F675A00000000000000000000000000000000000000
      0000004B00000E7D1A0028C0480021B83D001BB0330015912700004B0000169C
      280008961200159A2700004B0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000004B
      8200004B8200004B8200004B8200000000000000000000000000094F82000095
      D300009EDD00094F8200000000000000000000000000004B8200004B8200004B
      8200004B8200000000000000000000000000000000006C6A6A00CACACA00C5C5
      C5008E8C8C00D7D4D400F7F6F600F6F4F400F2F0F000E0DEDE00CAC7C700B6B5
      B500A5A3A300A19F9F00A19F9F009E9A9C009390910068656600232223000303
      030019191900999797006C6A6A00000000000000000000000000000000000000
      000098685F00CA9F8C009E6C6300FFF7E000FEE5CE0000008200FEE2C900FFE7
      C4009F675A009F675A009F675A009F675A009F675A009F675A009F675A009F67
      5A009F675A00FFC68C009F675A0000000000000000000000000000000000004B
      00000C77170035CF5E002FC9540028C048001B9F3100004B000000000000004B
      00000C9A18000A99150015912700004B00000000000000000000000000000000
      00000000000000000000000000000000000000000000004B8200004B82000DA0
      D500049CD5000097D5000097D500004B8200004B820000000000094F82000095
      D300009EDD00094F820000000000004B8200004B82000CAAF20003A9E900007A
      6300005F3000004B8200004B820000000000000000006C6A6A00C5C5C5008E8C
      8C00E7E6E600F7F6F600F7F6F600F6F4F400F2F0F000EEEDED00EAEAEA00E7E6
      E600E3E2E200D4D3D300C2C1C100AFADAD00A19F9F00A19F9F00999797008280
      80006C6A6A009F9D9D006C6A6A0000000000000000000000000000000000AB79
      6B00E5D0C900CA9F8C00A06F6400FFFFF000FEEAD800BCACC200FEE6D100FFEF
      D500FFDCB700FFDAB200FFD8AF00FFD7AA00FFD4A700FFD1A300FFD09E00FFCF
      9C00FFCC9700FFCB93009F675A0000000000000000000000000000000000004B
      00003FD96F003BD7680036D0600020AA3B00004B0000A4262600000000000000
      0000004B000007740E000A991500159A2700004B000000000000000000000000
      000000000000000000000000000000000000004B82001D92BC0021B0D80014A4
      D4000B9DD3000399D4000093D3000097D7000097D700004B8200094F82000398
      D400019EDC00094F8200004B820024A9D7001FAFDE0006736C00004E18000151
      020003570000005E1000006E6400004B8200000000006C6A6A008E8C8C00EFEE
      EE00F7F6F600F7F6F600F7F6F600F6F4F400D5D3D400867B7E00958B8E00C1BF
      BF00DDDCDC00E0E0E000DCDCDC00D8D8D800D1D1D100C2C1C100B2B0B000A19F
      9F009C9999006C6A6A006C6A6A0000000000000000000000000000000000AB79
      6B00E5D0C900CA9F8C00A5726500FFFFFB00FEEEE10000008200FEEBD900FFEF
      D5009F675A009F675A009F675A009F675A009F675A009F675A009F675A009F67
      5A009F675A00FFCF9D009F675A0000000000000000000000000000000000004B
      00001B9F310041DC700023AD4100004B0000BC484800C1555500A42626000000
      00000000000000000000004B00000A99150010951F00004B0000000000000000
      000000000000000000000000000000000000004B82004CD7EA0049E7F60035E1
      F70023D8FA0013D0FA0006C7F80000C1F70000BFF400004B8200094F8200099C
      D300059FD800094F820035AFD30047D7D700117D4000004100000255010018A5
      3900159A32000359000003682900004B8200000000006C6A6A00CECBCC00F7F6
      F600F7F6F600F7F6F600F7F6F600CFCBCC00AFACAD00ADABAB009E9898008379
      7B0075696B0089808100ABA5A600C7C6C600D5D5D500D1D1D100CECECE00C9C7
      C700BBBABA00A6A4A4006C6A6A0000000000000000000000000000000000AB79
      6B00C9A19600EDE0DA00A9766600FFFFFE00FFF3E900BDB2D000FEF0E200FFF3
      DE00FFE7CE00FFE5C900FFE3C400FFE1C000FFDEBC00FFDCB700FFDAB200FFD8
      AD00FFD5AA00FFD4A6009F675A0000000000000000000000000000000000A426
      2600004B00002EC15200004B0000C1555500BC484800BC484800C1555500A426
      2600000000000000000000000000004B00000C9A180008961200004B00000000
      00000000000000000000000000000000000000000000004B8200177DAA00138A
      B7000C84B6000682B700017DB7000177B200066EA50000000000094F82000D9F
      D3000CA7DD00094F820000000000025031000352040002660200007600000992
      160015A13000076E130000504E00004B890000000000000000006C6A6A006C6A
      6A00CECBCC00EDEBEB00AFA4A5006B5D5F00766A6C0083787A009C969700ACAA
      AA00B2B0B000ABA7A9009891920081777800847A7D00938C8E00BFBFBF00CBCB
      CB00CACACA00C0C0C0006C6A6A00000000000000000000000000BA7E6500FFFF
      FE00CA9F8C00F6EFED00AC786700FFFFFF00FEF7EF0000008200FEF4EA00FFFE
      ED009F675A009F675A009F675A009F675A009F675A009F675A009F675A009F67
      5A009F675A00FFD9B0009F675A00000000000000000000000000A4262600BA42
      4200CC6F6F00004B0000C6616100BC484800A4262600C1555500BA424200C155
      5500A4262600000000000000000000000000004B00000464080008961200004B
      0000000000000000000000000000000000000000000000000000004B82000000
      000000000000000000000000000000000000094F820000000000094F820015A4
      D30015ADDE00094F820000000000004244000778500018B84300099613000064
      000008760C0001514E0000000000000000000000000000000000000000000000
      00006C6A6A006C6A6A00BD828100AF8A73007D5E510066545600655457006D5E
      62006D5E620089808100A09A9C00AFACAD00B2B0B000A49FA000CAC9CA00CBCB
      CB00B7B6B6006C6A6A0000000000000000000000000000000000BA7E6500FFFF
      FE00CA9F8C00FFFFFE00B17B6900FFFFFF00FFFBF700BCBADC00FEF8F200FFFF
      F400FFF2E200FFEFDE00FFEDDA00FFEBD700FFEAD000FFE7CC00FFE3C900FFE2
      C400FFE0BF00FFDDBA009F675A000000000000000000A4262600B83F3F00D17E
      7E00CE757500CE757500C4595900A426260000000000A4262600C1555500BA42
      4200C1555500A426260000000000000000000000000000000000004B00000774
      0E00004B0000000000000000000000000000000000000000000000000000034D
      8300000000000000000000000000094F82000000000000000000094F82001CA7
      D3001CB4DD00094F82000000000000000000004F45000C815D000D821F000000
      000001504A000000000000000000000000000000000000000000000000000000
      00000000000000000000BD828100FFD4AB00FFD0A100FFCB9800D5A57B00A178
      5C007B665F0060505300665659006F6265008E868700CECCCC00CFCFCF00A5A4
      A4006C6A6A000000000000000000000000000000000000000000BA7E6500F0E5
      E000CA9F8C00FFFFFF00B5806A00FFFFFF00FFFEFC0000008200FFFBF800FFFF
      FA009F675A009F675A009F675A009F675A009F675A009F675A009F675A009F67
      5A009F675A00FFE3C5009F675A000000000000000000A4262600D6898900D484
      8400D4848400C6616100A4262600000000000000000000000000A4262600B639
      3900BC484800BC484800A426260000000000000000000000000000000000004B
      0000035E0600004B000000000000000000000000000000000000000000000000
      000000437B000000000001457D0000000000000000000000000000477F0023A9
      CE0026B6DC00004A810000000000000000000000000000000000014E69000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD828100FFD9B200FFD4A900FFCFA000FFCA9700FFC6
      8E00FFC18600FFBF8100FFC08400BD8281006C6A6A006C6A6A006C6A6A006C6A
      6A000000000000000000000000000000000000000000C9876400F3E2D800E2C5
      B600D5B1A100FFFFFF00BA826C00FFFFFF00FFFFFF00BDBDE500FFFEFE00FFFF
      FF00FFFAF400FFF8F000FFF6EE00FFF4EA00FFF2E500FFF2E100FFEFDD00FFEE
      D900FFEBD500FFFFDE009F675A000000000000000000A4262600C4595900D689
      8900C9666600A426260000000000000000000000000000000000000000000000
      0000A4262600BC484800C1555500A42626000000000000000000000000000000
      000000000000004B0000004B0000000000000000000000000000000000001172
      A000167EAB001179A700117BAA000F7BAA000D79AB000C7AAD0004679D002FB2
      D40031BDDD0001629A000173AC00006FB000006FB200006EAF00006FB1000070
      AF000069A4000000000000000000000000000000000000000000000000000000
      00000000000000000000BD828100FFDDBA00FFD8B100FFD3A700FFCE9E00FFCA
      9600FFC58C00FFC08400FFC08400BD8281000000000000000000000000000000
      00000000000000000000000000000000000000000000CE8E6900F8F0EB00DCA7
      8A00E9CEBB00FFFFFF00BD866D00FFFFFF00FFFFFF0000008200FFFFFF00FFFF
      FF009F675A009F675A009F675A009F675A009F675A009F675A009F675A009F67
      5A009F675A00FFFFDE009F675A00000000000000000000000000A4262600CE75
      7500A42626000000000000000000000000000000000000000000000000000000
      000000000000A4262600BC484800BC484800A426260000000000000000000000
      0000000000000000000000000000004B00000000000000000000000000001374
      A100208EB6001887B1001888B2001486B4001182B1000E84B600066CA30036B2
      D0003DBBD70001669F00017AB5000076B1000076B2000076B4000076B2000078
      B400006AA5000000000000000000000000000000000000000000000000000000
      000000000000BD828100FFE5CB00FFE1C200FFDCB800FFD7AF00FFD3A600FFCE
      9D00FFC99500FFC48B00BD828100000000000000000000000000000000000000
      000000000000000000000000000000000000CE8E6900E0B69C00FFFFFF00DCA7
      8A00F3E2D800FFFFFF00C1896E00FFFFFF00FFFFFF00BDBDE500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFEED00FFFFF400FFFF
      F000FFFFE300FFFFDE009F675A0000000000000000000000000000000000A426
      2600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A4262600B02E2E00BC484800A4262600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000457E000973
      A6000979AD000049810000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD828100FFEAD400FFE5CA00FFE0C000FFDAB700FFD7AD00FFD1
      A500FFCC9C00FFC79200BD828100000000000000000000000000000000000000
      000000000000000000000000000000000000CE8E6900EFD4C400FFFFFF00DCA7
      8A00FAF2EF00FFFFFF00C58C6F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFCFA00FFFAF200FFF6E900FFF6E900FFFFDE00FFFF
      DE00FFFFDE00FFFFDE009F675A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4262600B6393900A42626000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B820005C1
      FB0000BDFB00004B820000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD828100FFEEDC00FFE9D100FFE3C900FFE0BF00FFDAB600FFD5
      AC00FFD0A300F7C29700BD828100000000000000000000000000000000000000
      000000000000000000000000000000000000D1906B00CF8B6400EFD4C400DCA7
      8A00FFFFFF00FFFFFF00CA8F7200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFCFA00FFFAF200FFFFF7009F675A009F67
      5A009F675A009F675A009F675A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4262600B02E2E00A426
      2600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B820033D0E70027E2
      FF0009CBFF0001C1FA00004B8200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD828100FFF7EE00FFF2E300FFEDDA00FFE7D000FFE3C700FFDEBD00FFD9
      B400FFD4AB00BD82810000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D0936F00E3BF
      A700FFFFFF00FFFFFF00CC917300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFB00FFFFFF009F675A00FAC6
      8000FAC68000FAC68000FA962100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A426
      2600A42626000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B82002BA0C00053F7
      FF0031EAFF000BA3D800004B8200000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD82
      8100FFFAF300FFFAF300FFF6ED00FFF0E200FFEBD900FFE7CF00FFE2C500FFDD
      BC00F2C7A900BD82810000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CF8B6400CF8E
      6800E9CEBB00F8E5D300CF957400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009F675A00FAC6
      8000F8CB9000FA96210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A426260000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B8200004B
      8200004B8200004B820000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD82
      8100BD828100BD828100BD828100FFF4EB00FFF0E100FFEBD700FFE6CE00FBDC
      C000BD8281000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CF8E6800F8E5D300D1967400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009F675A00FAC6
      8000FA9621000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD828100BD828100BD828100BD828100BD82
      8100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CF8B6400D4987500CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E68009F675A00FA96
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000780000000100010000000000A00500000000000000000000
      000000000000000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00
      0000000000000000FFFFFF000000000000000000FFFFFF000000000000000000
      FFFFFF000000000000000000FFFFFF000000000000000000FF80000000000000
      00000000FB8000000000000000000000F98000000000000000000000F0800000
      0000000000000000C00000000000000000000000800000000000000000000000
      8000000000000000000000000080000000000000000000001980000000000000
      000000003B80000000000000000000003F80000000000000000000003F800000
      0000000000000000BFFFFF000000000000000000BFFFFF000000000000000000
      FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF0000000000
      00000000FFFFFF000000000000000000FFE7FFFFFFFFFFFFFFFFFFFFFF07FFFF
      FFFFFFFFFFFFFFFFF807FFFFFFFFFFE007FFE007E00003FFFFFFFFC001FFC001
      E00003FFFFFFFFC000FFC000E00003FFFFFFFFC000FFC000E00003FF8000FFC0
      00FFC000E00003FB8000FBE000FBE000E00003F98000F9E000F9E000E00003F0
      8000F0F801F0F801E00003C00000C0780FC0780FE00003800000803007803007
      E00003800000806003806003E0000300800000E00100E001E0000319800019C0
      0119C001E000033B80003BC0013BC001E000033F80003FC0013FC001E000033F
      80003FC0013FC001E00003BFFFFFBFC003BFC003E00003BFFFFFBFE003BFE003
      E00003FFFFFFFFE007FFE007F80003FFFFFFFFF81FFFF81FFF07FFFFFFFFFFFF
      FFFFFFFFFFE7FFFFFFFFFFFFFFFFFFFFFFF9F9FFFE1FFF00FFFF00FFFFF0F0FF
      FE1FFC003FFC003FFFF060FFFE1FF0000FF0000F000001FFFE1FE00007E00007
      000001801E1FC00003C00003000001000000C00003C000030000010000008000
      0180000100000100000080000180000100000100000000000000000000000080
      021F00000000000000000080021F000000000000000001E0061F000000000000
      000001E03E1F000000000000000001C01E1F000000000000000001800FFF0000
      000000000000018007FF0000000000000000010007FF80000180000100000100
      07FF8000018000010000010007FFC00003C000030000010007FFC00003C00003
      000001000FFFE00007E00007800003800FFFF0000FF0000FFFFFFF801FFFFC00
      3FFC003FFFFFFFE07FFFFF00FFFF00FFFFFFFFFFFFFFFFF3F3FFFF87FFFFFFFF
      FFFFFFE1E1FFFF87FFFFFFFFFFFFFFE0C1FFFF87FFFFFFF9FF9FFFF003000000
      FF7FFFF0FF0F801807000000FE3FFFE07E0700040F000000FC1FFFE03C070000
      0F000000F80FFFF0180F000007000001F007FFF8001F000003000001E003FFFC
      003F8000C1000001C041FFFE007F8001E1000001C0E0FFFF00FFE003F3000001
      C1F87FFF00FFE03FFF000001E3FC3FFE007FC01FFF000001F7FE1FFC003F800F
      FF000001FFFF8FF8001F8007FF000001FFFFC7F0180F0007FF000001FFFFF3E0
      3C070007FF000001FFFFFDE07E070007FF000001FFFFFFF0FF0F0007FF000001
      FFFFFFF9FF9F000FFF000001FFFFFFFFFFFF800FFF800003FFFFFFFFFFFF801F
      FFFFFFFFFFFFFFFFFFFFE07FFFFFFFFFFFC3FFFFFFFFFE7FFFFFFFFFFE007FFF
      FFFFFC0FFFFFFFFFFC003FFC79FFFC03FFFFBFFFF8001FF8003FF80001FF1FFF
      F8001FF00007F80001FE0FFFFC003FE00000F80001FC07FFFF00FFC00000F000
      01F803FFFFC3FF800001F00001F001FFE1C387800001F00001E020FF80420180
      0001E00001E0307F000000800001E00001E01C3F000000800001E00001E00E1F
      804200C00001C00001C0070FDF4203F00003C000018083C7EEC317FC0007C000
      0181C1E3F5C3DFFC000F80000183F0F9E00007FC00FF800001C7F87EE00007F8
      01FF000001EFFC3FFFC3FFF801FF000001FFFF1FFFC3FFF801FF000001FFFF8F
      FF81FFF003FFC00001FFFFE7FF81FFE003FFC00003FFFFFBFFC3FFE007FFF000
      07FFFFFFFFFFFFFE0FFFF8000FFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object WriteProc: TpFIBStoredProc
    Database = DataModule1.DB
    Transaction = DataModule1.WriteTransaction
    Left = 470
    Top = 92
  end
  object ReadDataSet: TpFIBDataSet
    Database = DataModule1.DB
    Transaction = DataModule1.ReadTransaction
    UpdateTransaction = DataModule1.WriteTransaction
    SQLScreenCursor = crSQLWait
    BufferChunks = 500
    Left = 360
    Top = 194
    poSQLINT64ToBCD = True
  end
end
