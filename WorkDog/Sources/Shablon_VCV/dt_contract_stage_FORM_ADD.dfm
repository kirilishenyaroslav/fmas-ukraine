object Fdt_contract_stage_ADD: TFdt_contract_stage_ADD
  Left = 266
  Top = 161
  BorderStyle = bsDialog
  ClientHeight = 138
  ClientWidth = 297
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 281
    Height = 81
    Caption = #1058#1077#1088#1084#1110#1085
    TabOrder = 0
    object Label2: TLabel
      Left = 144
      Top = 24
      Width = 17
      Height = 13
      Caption = #1055#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 9
      Height = 13
      Caption = #1047
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DateBegEdit: TcxDateEdit
      Left = 16
      Top = 40
      Width = 121
      Height = 21
      BeepOnEnter = False
      Style.Color = clMoneyGreen
      TabOrder = 0
      OnKeyPress = DateBegEditKeyPress
    end
    object DateEndEdit: TcxDateEdit
      Left = 144
      Top = 40
      Width = 121
      Height = 21
      BeepOnEnter = False
      Style.Color = clMoneyGreen
      TabOrder = 1
      OnKeyPress = DateEndEditKeyPress
    end
  end
  object OKButton: TcxButton
    Left = 104
    Top = 104
    Width = 89
    Height = 25
    Caption = #1044#1086#1076#1072#1090#1080
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 200
    Top = 104
    Width = 89
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
