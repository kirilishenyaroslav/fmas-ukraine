object Registration_Form_Add_Begin: TRegistration_Form_Add_Begin
  Left = 192
  Top = 114
  Width = 525
  Height = 623
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103': '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    517
    589)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 0
    Width = 502
    Height = 273
    Anchors = [akLeft, akTop, akRight]
    Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
    Style.TextColor = clBlue
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 49
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103
      Transparent = True
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 22
      Height = 13
      Caption = #1048#1084#1103
      Transparent = True
    end
    object Label3: TLabel
      Left = 8
      Top = 104
      Width = 47
      Height = 13
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      Transparent = True
    end
    object Label4: TLabel
      Left = 216
      Top = 24
      Width = 79
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      Transparent = True
    end
    object Label5: TLabel
      Left = 360
      Top = 24
      Width = 73
      Height = 13
      Caption = #1050#1091#1088#1089' '#1086#1073#1091#1095#1077#1085#1080#1103
      Transparent = True
    end
    object Label6: TLabel
      Left = 360
      Top = 104
      Width = 84
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072
      Transparent = True
    end
    object Label7: TLabel
      Left = 360
      Top = 64
      Width = 76
      Height = 13
      Caption = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
      Transparent = True
    end
    object Label8: TLabel
      Left = 360
      Top = 144
      Width = 92
      Height = 13
      Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
      Transparent = True
    end
    object Label9: TLabel
      Left = 360
      Top = 184
      Width = 110
      Height = 13
      Caption = #1048#1076'. '#1085#1072#1083#1086#1075#1086#1074#1099#1081' '#1085#1086#1084#1077#1088
      Transparent = True
    end
    object Label10: TLabel
      Left = 256
      Top = 192
      Width = 70
      Height = 13
      Caption = 'N '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1072
      Transparent = True
    end
    object Label11: TLabel
      Left = 256
      Top = 208
      Width = 77
      Height = 13
      Caption = #1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
      Transparent = True
    end
    object Label12: TLabel
      Left = 256
      Top = 224
      Width = 68
      Height = 13
      Caption = #1090#1080#1087' '#1087#1088#1086#1087#1080#1089#1082#1080
      Transparent = True
    end
    object Label13: TLabel
      Left = 8
      Top = 152
      Width = 75
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103' ('#1091#1082#1088')'
      Transparent = True
    end
    object Label14: TLabel
      Left = 8
      Top = 192
      Width = 48
      Height = 13
      Caption = #1048#1084#1103' ('#1091#1082#1088')'
      Transparent = True
    end
    object Label15: TLabel
      Left = 8
      Top = 232
      Width = 73
      Height = 13
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086' ('#1091#1082#1088')'
      Transparent = True
    end
    object Name_Edit: TcxTextEdit
      Left = 8
      Top = 80
      Width = 129
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 30
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object Familia_Edit: TcxTextEdit
      Left = 8
      Top = 40
      Width = 193
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 35
      Properties.OnChange = Familia_EditPropertiesChange
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object Otch_Edit: TcxTextEdit
      Left = 8
      Top = 120
      Width = 145
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 20
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object DateBorn_Edit: TcxDateEdit
      Left = 216
      Top = 40
      Width = 129
      Height = 21
      BeepOnEnter = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfOffice11
      TabOrder = 3
    end
    object GroupBox_Pol: TcxGroupBox
      Left = 216
      Top = 75
      Width = 129
      Height = 65
      Caption = #1055#1086#1083
      TabOrder = 4
      object Male_RadioButton: TcxRadioButton
        Left = 40
        Top = 16
        Width = 81
        Height = 17
        Caption = #1052#1091#1078#1089#1082#1086#1081
        TabOrder = 0
      end
      object Female_RadioButton: TcxRadioButton
        Left = 40
        Top = 40
        Width = 81
        Height = 17
        Caption = #1046#1077#1085#1089#1082#1080#1081
        TabOrder = 1
      end
    end
    object Inostranez_CheckBox: TcxCheckBox
      Left = 400
      Top = 232
      Width = 89
      Height = 21
      Caption = #1048#1085#1086#1089#1090#1088#1072#1085#1077#1094
      ParentColor = False
      Style.Color = clBtnFace
      TabOrder = 10
    end
    object Kurs_ComboBox: TcxComboBox
      Left = 360
      Top = 40
      Width = 129
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 6
      Properties.Items.Strings = (
        '1 '#1082#1091#1088#1089
        '2 '#1082#1091#1088#1089
        '3 '#1082#1091#1088#1089
        '4 '#1082#1091#1088#1089
        '5 '#1082#1091#1088#1089
        '6 '#1082#1091#1088#1089)
      Properties.ValidateOnEnter = False
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      TabOrder = 5
    end
    object Dogovor_DateEdit: TcxDateEdit
      Left = 360
      Top = 80
      Width = 129
      Height = 21
      BeepOnEnter = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfOffice11
      TabOrder = 6
    end
    object Nomer_Dogovora: TcxTextEdit
      Left = 360
      Top = 120
      Width = 129
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      Properties.AutoSelect = False
      Properties.MaxLength = 20
      Style.Color = clInfoBk
      TabOrder = 7
    end
    object Tabel_Edit: TcxTextEdit
      Left = 360
      Top = 160
      Width = 129
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      Properties.MaxLength = 10
      Style.Color = clInfoBk
      TabOrder = 8
    end
    object Nalog_Edit: TcxTextEdit
      Left = 360
      Top = 200
      Width = 129
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      Properties.MaxLength = 10
      Style.Color = clInfoBk
      TabOrder = 9
    end
    object Familia_Ukr: TcxTextEdit
      Left = 8
      Top = 168
      Width = 193
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 35
      Style.Color = clInfoBk
      TabOrder = 11
    end
    object Name_Ukr: TcxTextEdit
      Left = 8
      Top = 208
      Width = 129
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 30
      Style.Color = clInfoBk
      TabOrder = 12
    end
    object Otch_Ukr: TcxTextEdit
      Left = 8
      Top = 248
      Width = 145
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 20
      Style.Color = clInfoBk
      TabOrder = 13
    end
  end
  object OkButton: TcxButton
    Left = 144
    Top = 557
    Width = 121
    Height = 26
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 280
    Top = 557
    Width = 121
    Height = 26
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 272
    Width = 502
    Height = 137
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1088#1086#1078#1080#1074#1072#1085#1080#1077
    ParentFont = False
    Style.BorderStyle = ebsUltraFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfFlat
    Style.TextColor = clBlue
    Style.TextStyle = []
    StyleDisabled.TextStyle = []
    TabOrder = 3
    object Label16: TLabel
      Left = 16
      Top = 16
      Width = 58
      Height = 13
      Caption = #1058#1080#1087' '#1079#1076#1072#1085#1080#1103
      Transparent = True
    end
    object Label17: TLabel
      Left = 16
      Top = 72
      Width = 58
      Height = 13
      Caption = #1050#1086#1076' '#1079#1076#1072#1085#1080#1103
      Transparent = True
    end
    object Label18: TLabel
      Left = 200
      Top = 16
      Width = 82
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1082#1086#1084#1085#1072#1090#1099
      Transparent = True
    end
    object Label19: TLabel
      Left = 128
      Top = 72
      Width = 67
      Height = 13
      Caption = #1058#1080#1087' '#1082#1086#1084#1085#1072#1090#1099
      Transparent = True
    end
    object Label20: TLabel
      Left = 360
      Top = 16
      Width = 64
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      Transparent = True
    end
    object Label21: TLabel
      Left = 360
      Top = 72
      Width = 82
      Height = 13
      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      Transparent = True
    end
    object TypeEdit: TcxButtonEdit
      Left = 16
      Top = 40
      Width = 177
      Height = 21
      BeepOnEnter = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.ViewStyle = vsHideCursor
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = True
      TabOrder = 0
    end
    object Kod_Build_Edit: TcxTextEdit
      Left = 16
      Top = 96
      Width = 65
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      Properties.AutoSelect = False
      Properties.MaxLength = 20
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object Build_Beg_DateEdit: TcxDateEdit
      Left = 360
      Top = 40
      Width = 129
      Height = 21
      BeepOnEnter = False
      Properties.ShowTime = False
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfOffice11
      TabOrder = 3
    end
    object Build_End_DateEdit: TcxDateEdit
      Left = 360
      Top = 96
      Width = 129
      Height = 21
      BeepOnEnter = False
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfOffice11
      TabOrder = 4
    end
    object Nomer_Komnat_Edit: TcxTextEdit
      Left = 200
      Top = 40
      Width = 89
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      Properties.AutoSelect = False
      Properties.MaxLength = 20
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object Type_Room_Edit: TcxTextEdit
      Left = 128
      Top = 96
      Width = 161
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      Properties.AutoSelect = False
      Properties.MaxLength = 20
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 5
    end
  end
  object cxGroupBox4: TcxGroupBox
    Left = 8
    Top = 408
    Width = 501
    Height = 137
    Anchors = [akLeft, akTop, akRight]
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080
    Style.BorderStyle = ebsUltraFlat
    Style.LookAndFeel.Kind = lfFlat
    Style.TextColor = clBlue
    Style.TextStyle = []
    StyleDisabled.TextStyle = []
    TabOrder = 4
    object Label22: TLabel
      Left = 16
      Top = 16
      Width = 56
      Height = 13
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103':'
      Transparent = True
    end
    object Full_Cat_Label: TLabel
      Left = 16
      Top = 72
      Width = 265
      Height = 49
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object Label23: TLabel
      Left = 360
      Top = 16
      Width = 64
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      Transparent = True
    end
    object Label24: TLabel
      Left = 360
      Top = 72
      Width = 82
      Height = 13
      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      Transparent = True
    end
    object Category_ButtonEdit: TcxButtonEdit
      Left = 16
      Top = 40
      Width = 177
      Height = 21
      BeepOnEnter = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.ViewStyle = vsHideCursor
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = True
      TabOrder = 0
    end
    object Kat_Beg_DateEdit: TcxDateEdit
      Left = 360
      Top = 40
      Width = 129
      Height = 21
      BeepOnEnter = False
      Properties.ShowTime = False
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfOffice11
      TabOrder = 1
    end
    object Kat_End_DateEdit: TcxDateEdit
      Left = 360
      Top = 96
      Width = 129
      Height = 21
      BeepOnEnter = False
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfOffice11
      TabOrder = 2
    end
  end
  object TypeRoom_Selecter_DataSet: TpFIBDataSet
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 88
    Top = 280
    poSQLINT64ToBCD = True
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 24
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
  end
end
