object PDVTaxInvocesAddForm: TPDVTaxInvocesAddForm
  Left = 625
  Top = 271
  BorderStyle = bsDialog
  Caption = 'PDVTaxInvocesAddForm'
  ClientHeight = 157
  ClientWidth = 318
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
  object InsertPanel: TPanel
    Left = 0
    Top = 0
    Width = 318
    Height = 157
    Align = alClient
    TabOrder = 0
    object YesButton: TcxButton
      Left = 144
      Top = 120
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      Default = True
      TabOrder = 0
      OnClick = YesButtonClick
    end
    object cxButton2: TcxButton
      Left = 224
      Top = 120
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object KodRangeLabel: TcxLabel
      Left = 24
      Top = 16
      Width = 129
      Height = 20
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = #1076#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
    end
    object NameRangeLabel: TcxLabel
      Left = 24
      Top = 48
      Width = 137
      Height = 20
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Caption = #1076#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103
    end
    object PriceRangeLabel: TcxLabel
      Left = 24
      Top = 80
      Width = 129
      Height = 20
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      Caption = #1074#1110#1076#1089#1086#1090#1086#1082' '#1055#1044#1042
    end
    object DataBegDateEdit: TcxDateEdit
      Left = 152
      Top = 16
      Width = 121
      Height = 21
      Properties.ShowTime = False
      TabOrder = 5
      OnKeyPress = DataBegDateEditKeyPress
    end
    object DataEndDateEdit: TcxDateEdit
      Left = 152
      Top = 48
      Width = 121
      Height = 21
      Properties.ShowTime = False
      TabOrder = 6
      OnKeyPress = DataEndDateEditKeyPress
    end
    object PercentPDVCurrencyEdit: TcxCurrencyEdit
      Left = 152
      Top = 80
      Width = 121
      Height = 21
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
      Style.BorderStyle = ebsUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      TabOrder = 7
      OnKeyPress = PercentPDVCurrencyEditKeyPress
    end
  end
end
