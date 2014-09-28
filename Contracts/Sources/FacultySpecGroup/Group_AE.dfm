object frmGroup_AE: TfrmGroup_AE
  Left = 576
  Top = 319
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmGroup_AE'
  ClientHeight = 180
  ClientWidth = 221
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
    Left = 36
    Top = 145
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 129
    Top = 145
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object Frame_GroupBox: TcxGroupBox
    Left = 0
    Top = 0
    Width = 221
    Height = 137
    Align = alTop
    Alignment = alTopCenter
    TabOrder = 0
    TabStop = False
    object Group_Label: TLabel
      Left = 6
      Top = 46
      Width = 61
      Height = 13
      Caption = 'Group_Label'
    end
    object Error_Label: TLabel
      Left = 7
      Top = 117
      Width = 54
      Height = 13
      Caption = 'Error_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DepGr_Label: TLabel
      Left = 6
      Top = 10
      Width = 61
      Height = 13
      Caption = 'Group_Label'
    end
    object DepGroup_Edit: TcxButtonEdit
      Left = 6
      Top = 24
      Width = 203
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = Fac_EditPropertiesButtonClick
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 0
      OnKeyPress = DepGroup_EditKeyPress
    end
    object Group_Edit: TcxTextEdit
      Left = 6
      Top = 59
      Width = 203
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 40
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = Group_EditKeyPress
    end
    object CheckBox_is_def: TcxCheckBox
      Left = 8
      Top = 88
      Width = 201
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 2
    end
  end
end
