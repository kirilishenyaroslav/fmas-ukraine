object Fsp_region_form_add: TFsp_region_form_add
  Left = 371
  Top = 208
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1080
  ClientHeight = 105
  ClientWidth = 298
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
    Left = 112
    Top = 16
    Width = 38
    Height = 13
    Caption = #1053#1072#1079#1074#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
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
  object TypeEdit: TcxButtonEdit
    Left = 8
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
    TabOrder = 0
  end
  object OKButton: TcxButton
    Left = 104
    Top = 70
    Width = 91
    Height = 25
    Caption = #1044#1086#1076#1072#1090#1080
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 200
    Top = 70
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object FullNameEdit: TcxTextEdit
    Left = 112
    Top = 32
    Width = 177
    Height = 21
    BeepOnEnter = False
    Properties.MaxLength = 25
    TabOrder = 3
    OnKeyPress = FullNameEditKeyPress
  end
end
