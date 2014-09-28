object frm_effective_area_AE: Tfrm_effective_area_AE
  Left = 582
  Top = 157
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1082#1086#1108#1092#1092#1080#1094#1080#1077#1085#1090' '#1087#1086#1083#1077#1079#1085#1086#1081' '#1087#1083#1086#1097#1072#1076#1080
  ClientHeight = 193
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    341
    193)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Width = 325
    Height = 145
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object NameLabel: TcxLabel
      Left = 8
      Top = 16
      Width = 67
      Height = 17
      TabOrder = 4
      Caption = #1043#1091#1088#1090#1086#1078#1080#1090#1086#1082
    end
    object Label_koef: TcxLabel
      Left = 8
      Top = 96
      Width = 78
      Height = 17
      TabOrder = 5
      Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090
    end
    object CurrencyEdit_koef: TcxCurrencyEdit
      Left = 8
      Top = 112
      Width = 97
      Height = 21
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '0.00'
      Style.Color = clInfoBk
      TabOrder = 3
    end
    object cxButtonEdit_Builds: TcxButtonEdit
      Left = 8
      Top = 31
      Width = 305
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit_BuildsPropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object DateEdit_beg: TcxDateEdit
      Left = 8
      Top = 72
      Width = 121
      Height = 21
      Properties.ShowTime = False
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object DateEdit_end: TcxDateEdit
      Left = 176
      Top = 72
      Width = 121
      Height = 21
      Properties.ShowTime = False
      Style.Color = clInfoBk
      TabOrder = 2
      EditValue = 0d
    end
    object cxLabel1: TcxLabel
      Left = 176
      Top = 56
      Width = 92
      Height = 17
      TabOrder = 6
      Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103
    end
    object cxLabel2: TcxLabel
      Left = 8
      Top = 56
      Width = 78
      Height = 17
      TabOrder = 7
      Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
    end
  end
  object OKButton: TcxButton
    Left = 172
    Top = 160
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
  end
  object CancelButton: TcxButton
    Left = 252
    Top = 160
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
    LookAndFeel.Kind = lfUltraFlat
  end
end
