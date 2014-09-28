object frmSig_AE: TfrmSig_AE
  Left = 451
  Top = 287
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmSig_AE'
  ClientHeight = 197
  ClientWidth = 271
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
    Left = 86
    Top = 161
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 179
    Top = 161
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
    Width = 271
    Height = 153
    Align = alTop
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
    object NanesReportLabel: TLabel
      Left = 10
      Top = 85
      Width = 89
      Height = 13
      Caption = 'NanesReportLabel'
      Transparent = True
    end
    object Tag_OrderLabel: TLabel
      Left = 92
      Top = 130
      Width = 77
      Height = 13
      Caption = 'Tag_OrderLabel'
      Transparent = True
    end
    object Name_Edit: TcxTextEdit
      Left = 8
      Top = 22
      Width = 249
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 100
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = Name_EditKeyPress
    end
    object ShortName_Edit: TcxTextEdit
      Left = 8
      Top = 62
      Width = 249
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 30
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = ShortName_EditKeyPress
    end
    object NameRep_Edit: TcxButtonEdit
      Left = 9
      Top = 98
      Width = 248
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = False
      Properties.OnButtonClick = Fac_EditPropertiesButtonClick
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 2
      OnKeyPress = NameRep_EditKeyPress
    end
    object TagOrder_Edit: TcxCurrencyEdit
      Left = 176
      Top = 126
      Width = 81
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0'
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInfoBk
      TabOrder = 3
      OnKeyPress = TagOrder_EditKeyPress
    end
  end
end
