object frmTypeDiss_AE: TfrmTypeDiss_AE
  Left = 671
  Top = 269
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmTypeDiss_AE'
  ClientHeight = 135
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TcxButton
    Left = 118
    Top = 105
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 211
    Top = 105
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
    Height = 97
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object NameLabel: TLabel
      Left = 8
      Top = 11
      Width = 54
      Height = 13
      Caption = 'NameLabel'
      Transparent = True
    end
    object Nakaz_Label: TLabel
      Left = 9
      Top = 51
      Width = 63
      Height = 13
      Caption = 'Nakaz_Label'
      Transparent = True
    end
    object Name_Edit: TcxTextEdit
      Left = 8
      Top = 25
      Width = 281
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 100
      Style.Color = clWindow
      TabOrder = 0
      OnKeyPress = Name_EditKeyPress
    end
    object cn_ordertype_Edit: TcxButtonEdit
      Left = 9
      Top = 63
      Width = 280
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      ParentShowHint = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cn_ordertype_otchislenie_EditPropertiesButtonClick
      ShowHint = True
      Style.Color = clWindow
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 1
    end
  end
end
