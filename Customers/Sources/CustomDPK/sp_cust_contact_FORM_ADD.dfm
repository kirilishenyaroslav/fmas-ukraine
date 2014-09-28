object Fsp_cust_contact_form_add: TFsp_cust_contact_form_add
  Left = 296
  Top = 196
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1080' '#1082#1086#1085#1090#1072#1082#1090' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
  ClientHeight = 174
  ClientWidth = 370
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
    Left = 8
    Top = 8
    Width = 353
    Height = 129
    TabOrder = 0
    object Label2: TLabel
      Left = 184
      Top = 24
      Width = 80
      Height = 13
      Caption = #1043#1088#1091#1087#1072' '#1082#1086#1085#1090#1072#1082#1090#1091':'
    end
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 84
      Height = 13
      Caption = #1058#1080#1087' '#1082#1086#1085#1090#1072#1082#1090#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 72
      Width = 53
      Height = 13
      Caption = #1050#1086#1085#1090#1072#1082#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupContactEdit: TcxButtonEdit
      Left = 184
      Top = 40
      Width = 153
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.HideCursor = True
      Properties.ReadOnly = True
      Properties.OnButtonClick = GroupContactEditButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 0
    end
    object TypeContactEdit: TcxButtonEdit
      Left = 16
      Top = 40
      Width = 153
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.HideCursor = True
      Properties.ReadOnly = True
      Properties.OnButtonClick = TypeContactEditButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 1
    end
    object ContactEdit: TcxTextEdit
      Left = 16
      Top = 88
      Width = 321
      Height = 21
      Properties.MaxLength = 40
      Style.Color = clMoneyGreen
      TabOrder = 2
      OnKeyPress = ContactEditKeyPress
    end
  end
  object OKButton: TcxButton
    Left = 176
    Top = 144
    Width = 91
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 272
    Top = 144
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
