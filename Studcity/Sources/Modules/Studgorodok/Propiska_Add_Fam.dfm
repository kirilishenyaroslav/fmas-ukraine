object frm_FIO_Add: Tfrm_FIO_Add
  Left = 474
  Top = 158
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1086#1076#1089#1090#1074#1077#1085#1085#1080#1082#1080
  ClientHeight = 147
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    280
    147)
  PixelsPerInch = 96
  TextHeight = 13
  object prp_fs_GroupBox2: TcxGroupBox
    Left = 0
    Top = 0
    Width = 280
    Height = 105
    Align = alTop
    Alignment = alTopLeft
    LookAndFeel.NativeStyle = False
    TabOrder = 0
    TabStop = False
    object FIO_Label: TLabel
      Left = 8
      Top = 8
      Width = 27
      Height = 13
      Caption = #1060#1048#1054
    end
    object Type_Label: TLabel
      Left = 72
      Top = 58
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #1058#1080#1087' '#1089#1074#1103#1079#1080
    end
    object Fio_Edit: TcxButtonEdit
      Left = 8
      Top = 22
      Width = 261
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = Fio_EditPropertiesButtonClick
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = True
      Style.ButtonTransparency = ebtNone
      TabOrder = 0
    end
    object Svyaz_Combo: TcxComboBox
      Left = 136
      Top = 55
      Width = 131
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
    end
  end
  object OkButton: TcxButton
    Left = 101
    Top = 114
    Width = 86
    Height = 26
    Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1087#1077#1088#1080#1086#1076
    Anchors = [akRight, akBottom]
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OkButtonClick
    LookAndFeel.NativeStyle = False
  end
  object CancelButton: TcxButton
    Left = 191
    Top = 114
    Width = 86
    Height = 26
    Hint = #1054#1090#1084#1077#1085#1072
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
    LookAndFeel.NativeStyle = False
  end
end
