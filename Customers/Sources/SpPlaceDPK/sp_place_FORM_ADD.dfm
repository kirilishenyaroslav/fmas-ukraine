object Fsp_place_form_add: TFsp_place_form_add
  Left = 429
  Top = 202
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100
  ClientHeight = 119
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
  object Label1: TLabel
    Left = 120
    Top = 16
    Width = 89
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 16
    Width = 23
    Height = 13
    Caption = #1058#1080#1087
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 297
    Height = 73
    Shape = bsFrame
  end
  object TypeEdit: TcxButtonEdit
    Left = 16
    Top = 32
    Width = 97
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = TypeEditButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 0
  end
  object OKButton: TcxButton
    Left = 120
    Top = 86
    Width = 91
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 214
    Top = 86
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object FullNameEdit: TcxTextEdit
    Left = 120
    Top = 32
    Width = 177
    Height = 21
    BeepOnEnter = False
    Properties.MaxLength = 25
    Style.Color = clMoneyGreen
    TabOrder = 3
    OnKeyPress = FullNameEditKeyPress
  end
  object CapitalCheck: TcxCheckBox
    Left = 16
    Top = 56
    Width = 73
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1057#1090#1086#1083#1080#1094#1072
    TabOrder = 4
  end
  object RegionCheck: TcxCheckBox
    Left = 96
    Top = 56
    Width = 105
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1062#1077#1085#1090#1088' '#1088#1077#1075#1080#1086#1085#1072
    TabOrder = 5
  end
  object DistrictCheck: TcxCheckBox
    Left = 208
    Top = 56
    Width = 97
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1062#1077#1085#1090#1088' '#1088#1072#1081#1086#1085#1072
    TabOrder = 6
  end
end
