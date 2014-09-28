object frmFac_AE: TfrmFac_AE
  Left = 572
  Top = 278
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmFac_AE'
  ClientHeight = 223
  ClientWidth = 390
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
    Left = 201
    Top = 190
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 293
    Top = 190
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object Frame_GroupBox: TcxGroupBox
    Left = 0
    Top = 0
    Width = 390
    Height = 177
    Align = alTop
    Alignment = alTopCenter
    TabOrder = 2
    TabStop = False
    object Fac_Label: TLabel
      Left = 6
      Top = 8
      Width = 50
      Height = 13
      Caption = 'Fac_Label'
    end
    object NameExec_Label: TLabel
      Left = 6
      Top = 91
      Width = 141
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1075#1086
    end
    object Dekan_Label: TLabel
      Left = 6
      Top = 133
      Width = 110
      Height = 13
      Caption = #1060#1048#1054' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1075#1086
    end
    object Short_Label: TLabel
      Left = 6
      Top = 51
      Width = 119
      Height = 13
      Caption = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object Label2: TLabel
      Left = 254
      Top = 133
      Width = 19
      Height = 13
      Caption = #1050#1086#1076
    end
    object Fac_Edit: TcxButtonEdit
      Left = 6
      Top = 24
      Width = 371
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaxLength = 60
      Properties.ReadOnly = True
      Properties.OnButtonClick = Fac_EditPropertiesButtonClick
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 0
      OnKeyPress = Fac_EditKeyPress
    end
    object NameExec_Edit: TcxTextEdit
      Left = 6
      Top = 105
      Width = 371
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 80
      Style.Color = clInfoBk
      TabOrder = 2
      OnKeyPress = NameExec_EditKeyPress
    end
    object Dekan_Edit: TcxTextEdit
      Left = 6
      Top = 146
      Width = 203
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 40
      Style.Color = clInfoBk
      TabOrder = 3
      OnKeyPress = Dekan_EditKeyPress
    end
    object ShortName_Edit: TcxTextEdit
      Left = 6
      Top = 65
      Width = 371
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 60
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = ShortName_EditKeyPress
    end
  end
  object Kod_edit: TcxCurrencyEdit
    Left = 256
    Top = 146
    Width = 121
    Height = 21
    EditValue = 0
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = '0'
    Style.Color = clInfoBk
    TabOrder = 3
  end
end
