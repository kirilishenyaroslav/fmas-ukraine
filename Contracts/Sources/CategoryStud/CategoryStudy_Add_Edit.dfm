object frmCatStud_Add_Edit: TfrmCatStud_Add_Edit
  Left = 815
  Top = 472
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmCatStud_Add_Edit'
  ClientHeight = 162
  ClientWidth = 303
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
  object OkButton: TcxButton
    Left = 118
    Top = 129
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 211
    Top = 129
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 297
    Height = 121
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object NameLabel: TLabel
      Left = 8
      Top = 8
      Width = 54
      Height = 13
      Caption = 'NameLabel'
      Transparent = True
    end
    object ShortNameLabel: TLabel
      Left = 8
      Top = 48
      Width = 79
      Height = 13
      Caption = 'ShortNameLabel'
      Transparent = True
    end
    object Name_Edit: TcxTextEdit
      Left = 8
      Top = 22
      Width = 281
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 255
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = Name_EditKeyPress
    end
    object ShortName_Edit: TcxTextEdit
      Left = 8
      Top = 62
      Width = 107
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 10
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = ShortName_EditKeyPress
    end
    object PRK_SP_TYPE_KAT_STUD_edit: TcxButtonEdit
      Left = 123
      Top = 62
      Width = 164
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = PRK_SP_TYPE_KAT_STUD_editPropertiesButtonClick
      Style.Color = 16311512
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 2
    end
    object Check_IS_SCIENCE: TcxCheckBox
      Left = 8
      Top = 88
      Width = 161
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1042#1088#1072#1093#1086#1074#1091#1074#1072#1090#1080' '#1089#1090#1072#1078
      TabOrder = 3
    end
  end
end
