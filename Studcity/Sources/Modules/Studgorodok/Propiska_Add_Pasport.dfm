object prp_frm_Pass_Add: Tprp_frm_Pass_Add
  Left = 398
  Top = 256
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1059#1076#1086#1089#1090#1086#1074#1077#1088#1077#1085#1080#1077' '#1083#1080#1095#1085#1086#1089#1090#1080
  ClientHeight = 280
  ClientWidth = 503
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 503
    Height = 233
    Align = alTop
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object Fam_Label: TLabel
      Left = 37
      Top = 43
      Width = 49
      Height = 13
      Alignment = taRightJustify
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
    object Name_Label: TLabel
      Left = 64
      Top = 70
      Width = 22
      Height = 13
      Alignment = taRightJustify
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
    object Otch_Label: TLabel
      Left = 39
      Top = 96
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
    object Kogda_Label: TLabel
      Left = 21
      Top = 176
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #1050#1086#1075#1076#1072' '#1074#1099#1076#1072#1085
    end
    object Type_Label: TLabel
      Left = 10
      Top = 20
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
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
    object Kem_Label: TLabel
      Left = 30
      Top = 150
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085
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
    object Seriya_Label: TLabel
      Left = 54
      Top = 123
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = #1057#1077#1088#1080#1103
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
    object Nomer_Label: TLabel
      Left = 144
      Top = 123
      Width = 34
      Height = 13
      Caption = #1053#1086#1084#1077#1088
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
    object Osnovanie_Label: TLabel
      Left = 30
      Top = 204
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
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
    object prp_FamiliaPasp_Edit: TcxTextEdit
      Left = 90
      Top = 40
      Width = 127
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 35
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = prp_FamiliaPasp_EditKeyPress
    end
    object prp_NamePasp_Edit: TcxTextEdit
      Left = 90
      Top = 66
      Width = 97
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 30
      Style.Color = clInfoBk
      TabOrder = 2
      OnKeyPress = prp_NamePasp_EditKeyPress
    end
    object prp_OtchPasp_Edit: TcxTextEdit
      Left = 90
      Top = 92
      Width = 129
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 30
      Style.Color = clInfoBk
      TabOrder = 3
      OnKeyPress = prp_OtchPasp_EditKeyPress
    end
    object prp_DateVidan: TcxDateEdit
      Left = 90
      Top = 172
      Width = 89
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.ShowTime = False
      Style.Color = clInfoBk
      TabOrder = 7
      OnKeyPress = prp_DateVidanKeyPress
    end
    object prp_TypeUdost_ComboBox: TcxComboBox
      Left = 90
      Top = 16
      Width = 193
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 6
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = prp_TypeUdost_ComboBoxKeyPress
    end
    object prp_Vidan_Edit: TcxTextEdit
      Left = 90
      Top = 146
      Width = 407
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 75
      Style.Color = clInfoBk
      TabOrder = 6
      OnKeyPress = prp_Vidan_EditKeyPress
    end
    object prp_Seriya_Edit: TcxTextEdit
      Left = 90
      Top = 120
      Width = 49
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 8
      Style.Color = clInfoBk
      TabOrder = 4
      OnKeyPress = prp_Seriya_EditKeyPress
    end
    object prp_Nomer_Edit: TcxTextEdit
      Left = 186
      Top = 120
      Width = 61
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 10
      Style.Color = clInfoBk
      TabOrder = 5
      OnKeyPress = prp_Nomer_EditKeyPress
    end
    object prp_Osnovanie_Edit: TcxTextEdit
      Left = 90
      Top = 200
      Width = 241
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 50
      Style.Color = clInfoBk
      TabOrder = 8
      OnKeyPress = prp_Osnovanie_EditKeyPress
    end
  end
  object OkButton: TcxButton
    Left = 314
    Top = 244
    Width = 86
    Height = 26
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 406
    Top = 244
    Width = 86
    Height = 26
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
