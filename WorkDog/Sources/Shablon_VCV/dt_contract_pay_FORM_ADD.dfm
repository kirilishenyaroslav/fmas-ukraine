object Fdt_contract_pay_ADD: TFdt_contract_pay_ADD
  Left = 230
  Top = 126
  BorderStyle = bsDialog
  ClientHeight = 233
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 192
    Top = 8
    Width = 185
    Height = 105
    Caption = #1058#1077#1088#1084#1110#1085#1080' '#1074#1085#1077#1089#1077#1085#1085#1103' '#1075#1088#1086#1096#1077#1081
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 16
      Width = 126
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1086#1087#1083#1072#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 56
      Width = 145
      Height = 13
      Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1086#1087#1083#1072#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DateBegPayEdit: TcxDateEdit
      Left = 16
      Top = 32
      Width = 153
      Height = 21
      BeepOnEnter = False
      Style.Color = clMoneyGreen
      TabOrder = 0
      OnKeyPress = DateBegPayEditKeyPress
    end
    object DateEndPayEdit: TcxDateEdit
      Left = 16
      Top = 72
      Width = 153
      Height = 21
      BeepOnEnter = False
      Style.Color = clMoneyGreen
      TabOrder = 1
      OnKeyPress = DateEndPayEditKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 120
    Width = 369
    Height = 65
    Caption = #1057#1091#1084#1080
    TabOrder = 1
    object Label5: TLabel
      Left = 16
      Top = 16
      Width = 31
      Height = 13
      Caption = #1057#1091#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 184
      Top = 16
      Width = 28
      Height = 13
      Caption = #1055#1044#1042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SummaEdit: TcxTextEdit
      Left = 16
      Top = 32
      Width = 161
      Height = 21
      BeepOnEnter = False
      Style.Color = clMoneyGreen
      TabOrder = 0
      Text = '0'
      OnKeyPress = SummaEditKeyPress
    end
    object SummaNDSEdit: TcxTextEdit
      Left = 184
      Top = 32
      Width = 169
      Height = 21
      BeepOnEnter = False
      Style.Color = clMoneyGreen
      TabOrder = 1
      Text = '0'
      OnKeyPress = SummaNDSEditKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 8
    Width = 177
    Height = 105
    Caption = #1058#1077#1088#1084#1110#1085' '#1086#1087#1083#1072#1090#1080
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 81
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 100
      Height = 13
      Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DateBegEdit: TcxDateEdit
      Left = 16
      Top = 32
      Width = 145
      Height = 21
      BeepOnEnter = False
      Style.Color = clMoneyGreen
      TabOrder = 0
      OnKeyPress = DateBegEditKeyPress
    end
    object DateEndEdit: TcxDateEdit
      Left = 16
      Top = 72
      Width = 145
      Height = 21
      BeepOnEnter = False
      Style.Color = clMoneyGreen
      TabOrder = 1
      OnKeyPress = cxDateEdit1KeyPress
    end
  end
  object OKButton: TcxButton
    Left = 192
    Top = 200
    Width = 89
    Height = 25
    Caption = #1044#1086#1076#1072#1090#1080
    TabOrder = 3
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 288
    Top = 200
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 4
    OnClick = CancelButtonClick
  end
end
