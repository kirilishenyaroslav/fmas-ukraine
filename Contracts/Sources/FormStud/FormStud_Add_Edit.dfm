object frmFormStud_Add_Edit: TfrmFormStud_Add_Edit
  Left = 420
  Top = 226
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmFormStud_Add_Edit'
  ClientHeight = 185
  ClientWidth = 310
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
    Left = 126
    Top = 153
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 219
    Top = 153
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
    Width = 305
    Height = 145
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
      Top = 80
      Width = 79
      Height = 13
      Caption = 'ShortNameLabel'
      Transparent = True
    end
    object Name_Edit: TcxTextEdit
      Left = 8
      Top = 22
      Width = 289
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 255
      Style.Color = clWindow
      TabOrder = 0
      OnKeyPress = Name_EditKeyPress
    end
    object ShortName_Edit: TcxTextEdit
      Left = 8
      Top = 94
      Width = 129
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 10
      Style.Color = clWindow
      TabOrder = 2
      OnKeyPress = ShortName_EditKeyPress
    end
    object FORM_Kat_Edit: TcxButtonEdit
      Left = 8
      Top = 54
      Width = 289
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = ID_SP_FORM_OBUCH_KATEGORY_editPropertiesButtonClick
      Style.Color = clWindow
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 1
    end
    object Kod_edit: TcxCurrencyEdit
      Left = 168
      Top = 93
      Width = 129
      Height = 21
      Properties.DisplayFormat = '00'
      TabOrder = 3
      OnKeyPress = Kod_editKeyPress
    end
    object kod_label: TcxLabel
      Left = 167
      Top = 78
      Width = 54
      Height = 17
      TabOrder = 4
    end
    object cxCheckBox1: TcxCheckBox
      Left = 8
      Top = 120
      Width = 241
      Height = 21
      Enabled = False
      Properties.DisplayUnchecked = 'False'
      TabOrder = 5
    end
  end
end
