object fmFilterForm: TfmFilterForm
  Left = 607
  Top = 408
  BorderStyle = bsDialog
  Caption = #1060#1110#1083#1100#1090#1088
  ClientHeight = 274
  ClientWidth = 385
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 385
    Height = 57
    Align = alTop
    TabOrder = 0
    object ButtonType: TcxButton
      Left = 112
      Top = 24
      Width = 153
      Height = 25
      Caption = #1042#1110#1076#1073#1110#1088' '#1076#1072#1085#1080#1093
      Enabled = False
      TabOrder = 0
      OnClick = ButtonTypeClick
    end
    object CheckBoxType: TcxCheckBox
      Left = 16
      Top = 8
      Width = 97
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1058#1080#1087#1080' '#1085#1072#1082#1072#1079#1110#1074
      TabOrder = 1
      OnClick = CheckBoxTypeClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 385
    Height = 80
    Align = alTop
    TabOrder = 1
    object CheckBoxPeriodP: TcxCheckBox
      Left = 16
      Top = 8
      Width = 313
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1077#1088#1110#1086#1076' '#1089#1090#1074#1086#1088#1077#1085#1085#1103' '#1085#1072#1082#1072#1079#1110#1074' '
      State = cbsChecked
      TabOrder = 0
      OnClick = CheckBoxPeriodPClick
    end
    object DateEditBegP: TcxDateEdit
      Left = 40
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object DateEditEndP: TcxDateEdit
      Left = 208
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object cxLabel1: TcxLabel
      Left = 176
      Top = 24
      Width = 18
      Height = 33
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -24
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Caption = '-'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 137
    Width = 385
    Height = 80
    Align = alTop
    TabOrder = 2
    object CheckBoxPeriodN: TcxCheckBox
      Left = 16
      Top = 8
      Width = 273
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1077#1088#1110#1086#1076' '#1088#1077#1075#1110#1089#1090#1088#1072#1094#1110#1111' '#1085#1072#1082#1072#1079#1110#1074
      State = cbsChecked
      TabOrder = 0
      OnClick = CheckBoxPeriodNClick
    end
    object DateEditBegN: TcxDateEdit
      Left = 40
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object DateEditEndN: TcxDateEdit
      Left = 208
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object cxLabel2: TcxLabel
      Left = 176
      Top = 24
      Width = 18
      Height = 33
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -24
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Caption = '-'
    end
  end
  object cxButtonOk: TcxButton
    Left = 192
    Top = 232
    Width = 75
    Height = 25
    Caption = #1054#1050
    Default = True
    TabOrder = 3
    OnClick = cxButtonOkClick
  end
  object cxButtonCancel: TcxButton
    Left = 280
    Top = 232
    Width = 81
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 4
    OnClick = cxButtonCancelClick
  end
end
