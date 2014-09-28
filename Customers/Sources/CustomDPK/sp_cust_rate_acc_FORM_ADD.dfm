object Fsp_cust_rate_acc_ADD: TFsp_cust_rate_acc_ADD
  Left = 355
  Top = 205
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1080'/'#1047#1084#1110#1085#1080#1090#1080
  ClientHeight = 277
  ClientWidth = 425
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
  DesignSize = (
    425
    277)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 409
    Height = 233
    Shape = bsFrame
    Style = bsRaised
  end
  object Label2: TLabel
    Left = 243
    Top = 64
    Width = 49
    Height = 13
    Caption = #1056#1072#1093#1091#1085#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelBANK: TLabel
    Left = 112
    Top = 16
    Width = 30
    Height = 13
    Caption = #1041#1072#1085#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 112
    Top = 64
    Width = 73
    Height = 13
    Caption = #1058#1080#1087' '#1088#1072#1093#1091#1085#1082#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 32
    Height = 13
    Caption = #1052#1060#1054
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 64
    Width = 34
    Height = 13
    Caption = #1052#1110#1089#1090#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BankEdit: TcxButtonEdit
    Left = 112
    Top = 32
    Width = 297
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.MaxLength = 80
    Properties.ReadOnly = False
    Properties.OnButtonClick = BankEditButtonClick
    Properties.OnChange = BankEditPropertiesChange
    Style.Color = clMoneyGreen
    TabOrder = 1
  end
  object TypeAccountEdit: TcxButtonEdit
    Left = 112
    Top = 80
    Width = 121
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = TypeAccountEditButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 3
  end
  object AccountEdit: TcxTextEdit
    Left = 240
    Top = 80
    Width = 169
    Height = 21
    Properties.Alignment.Horz = taLeftJustify
    Properties.MaxLength = 16
    Properties.ReadOnly = False
    Style.Color = clMoneyGreen
    TabOrder = 4
  end
  object OKButton1: TcxButton
    Left = 8
    Top = 247
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1044#1086#1076#1072#1090#1080
    TabOrder = 5
    OnClick = OKButton1Click
  end
  object OKButton2: TcxButton
    Left = 88
    Top = 247
    Width = 185
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1044#1086#1076#1072#1090#1080' '#1103#1082' '#1087#1110#1076#1083#1077#1075#1083#1080#1081
    TabOrder = 6
    OnClick = OKButton2Click
  end
  object CancelButton: TcxButton
    Left = 336
    Top = 247
    Width = 83
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 7
    OnClick = CancelButtonClick
  end
  object MFOEdit: TcxTextEdit
    Left = 16
    Top = 32
    Width = 89
    Height = 21
    Properties.MaxLength = 6
    Properties.OnChange = MFOEditPropertiesChange
    Style.Color = clMoneyGreen
    TabOrder = 0
    OnExit = MFOEditExit
    OnKeyPress = MFOEditKeyPress
  end
  object CityEdit: TcxTextEdit
    Left = 16
    Top = 80
    Width = 89
    Height = 21
    Properties.OnChange = CityEditPropertiesChange
    Style.Color = clMoneyGreen
    TabOrder = 2
    Text = #1044#1086#1085#1077#1094#1100#1082
  end
  object cxGroupBox1: TcxGroupBox
    Left = 16
    Top = 112
    Width = 393
    Height = 57
    Alignment = alTopLeft
    Caption = #1058#1077#1088#1084#1110#1085' '#1076#1110#1111
    TabOrder = 8
    object DateBegEdit: TcxDateEdit
      Left = 24
      Top = 20
      Width = 121
      Height = 21
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clMoneyGreen
      TabOrder = 0
    end
    object cxLabel1: TcxLabel
      Left = 8
      Top = 22
      Width = 15
      Height = 17
      TabOrder = 1
      Caption = #1047
    end
    object cxLabel2: TcxLabel
      Left = 152
      Top = 22
      Width = 22
      Height = 17
      TabOrder = 2
      Caption = #1055#1086
    end
    object DateEndEdit: TcxDateEdit
      Left = 176
      Top = 20
      Width = 121
      Height = 21
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clMoneyGreen
      TabOrder = 3
    end
  end
  object NoteMemo: TcxMemo
    Left = 16
    Top = 184
    Width = 393
    Height = 49
    Style.Color = clMoneyGreen
    TabOrder = 9
  end
  object cxLabel3: TcxLabel
    Left = 16
    Top = 168
    Width = 55
    Height = 17
    TabOrder = 10
    Caption = #1055#1088#1080#1084#1110#1090#1082#1072
  end
end
