object frm_Propiska_AddChildren: Tfrm_Propiska_AddChildren
  Left = 448
  Top = 203
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1088#1077#1073#1077#1085#1082#1077
  ClientHeight = 207
  ClientWidth = 311
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
    Left = 8
    Top = 8
    Width = 297
    Height = 153
    Alignment = alTopLeft
    TabOrder = 0
    object fam_Label: TLabel
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
    object Name_Label: TLabel
      Left = 8
      Top = 52
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
    object Otch_Label: TLabel
      Left = 8
      Top = 84
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
    object DateBorn_Label: TLabel
      Left = 7
      Top = 116
      Width = 79
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
    end
    object Sex_Label: TLabel
      Left = 190
      Top = 116
      Width = 20
      Height = 13
      Caption = #1055#1086#1083
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
    object prp_FamiliaChild_Edit: TcxTextEdit
      Left = 96
      Top = 16
      Width = 153
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 35
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = prp_FamiliaChild_EditKeyPress
    end
    object prp_NameChild_Edit: TcxTextEdit
      Left = 96
      Top = 48
      Width = 97
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 30
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = prp_NameChild_EditKeyPress
    end
    object prp_OtchChild_Edit: TcxTextEdit
      Left = 96
      Top = 80
      Width = 129
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 20
      Style.Color = clInfoBk
      TabOrder = 2
      OnKeyPress = prp_OtchChild_EditKeyPress
    end
    object prp_ChildBorn_Date: TcxDateEdit
      Left = 96
      Top = 112
      Width = 89
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.ShowTime = False
      Style.Color = clInfoBk
      TabOrder = 3
      OnKeyPress = prp_ChildBorn_DateKeyPress
    end
    object prp_PolChild_ComboBox: TcxComboBox
      Left = 226
      Top = 112
      Width = 65
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 2
      Properties.Items.Strings = (
        #1052
        #1046)
      Style.Color = clInfoBk
      TabOrder = 4
      OnKeyPress = prp_PolChild_ComboBoxKeyPress
    end
  end
  object OkButton: TcxButton
    Left = 126
    Top = 172
    Width = 86
    Height = 26
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 218
    Top = 172
    Width = 86
    Height = 26
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
