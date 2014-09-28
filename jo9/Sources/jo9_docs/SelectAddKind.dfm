object SelectAddKind_Form: TSelectAddKind_Form
  Left = 420
  Top = 275
  BorderStyle = bsDialog
  Caption = #1042#1080#1073#1077#1088#1110#1090#1100' '#1074#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  ClientHeight = 100
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup: TcxRadioGroup
    Left = 5
    Top = 4
    Width = 308
    Height = 57
    ItemIndex = 0
    Properties.Columns = 3
    Properties.Items = <
      item
        Caption = #1044#1077#1073#1077#1090#1086#1074#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      end
      item
        Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      end>
    TabOrder = 0
    Caption = #1044#1086#1076#1072#1090#1080':'
  end
  object ApplyButton: TcxButton
    Left = 155
    Top = 68
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 1
    OnClick = ApplyButtonClick
  end
  object CancelButton: TcxButton
    Left = 237
    Top = 68
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
