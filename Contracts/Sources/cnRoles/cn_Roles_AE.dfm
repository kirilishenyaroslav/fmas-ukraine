object frmAddEdit: TfrmAddEdit
  Left = 363
  Top = 209
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmAddEdit'
  ClientHeight = 152
  ClientWidth = 327
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox: TcxGroupBox
    Left = 1
    Top = 0
    Width = 323
    Height = 113
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object Group_Label: TLabel
      Left = 7
      Top = 9
      Width = 306
      Height = 12
      Alignment = taCenter
      AutoSize = False
      Caption = 'Group_Label'
    end
    object Smeta_Edit: TcxButtonEdit
      Left = 8
      Top = 64
      Width = 89
      Height = 21
      BeepOnEnter = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = Smeta_EditPropertiesButtonClick
      Properties.OnEditValueChanged = Smeta_EditPropertiesEditValueChanged
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 0
      OnKeyPress = Smeta_EditKeyPress
    end
    object Smeta_Label: TcxLabel
      Left = 8
      Top = 48
      Width = 89
      Height = 17
      TabStop = False
      AutoSize = False
      ParentFont = False
      TabOrder = 1
      Caption = #1057#1084#1077#1090#1072
    end
    object Smeta_description_Label: TcxLabel
      Left = 104
      Top = 64
      Width = 209
      Height = 35
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object TextEdit: TcxTextEdit
      Left = 8
      Top = 24
      Width = 305
      Height = 21
      Properties.ReadOnly = True
      Style.Color = 16311512
      TabOrder = 3
    end
  end
  object OKButton: TcxButton
    Left = 150
    Top = 120
    Width = 83
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 241
    Top = 120
    Width = 83
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
