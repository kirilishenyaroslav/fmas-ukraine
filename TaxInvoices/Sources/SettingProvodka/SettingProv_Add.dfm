object SettingProvAddForm: TSettingProvAddForm
  Left = 568
  Top = 268
  BorderStyle = bsDialog
  Caption = 'SettingProvAddForm'
  ClientHeight = 163
  ClientWidth = 564
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
    Width = 564
    Height = 163
    Align = alClient
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 376
      Top = 128
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      Default = True
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 464
      Top = 128
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object dogLabel: TcxLabel
      Left = 24
      Top = 32
      Width = 119
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = #1076#1086#1075#1086#1074#1110#1088
    end
    object DogButtonEdit: TcxButtonEdit
      Left = 168
      Top = 32
      Width = 369
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = DogButtonEditPropertiesButtonClick
      TabOrder = 3
      Text = 'DogButtonEdit'
    end
    object SchetPDVButtonEdit: TcxButtonEdit
      Left = 168
      Top = 64
      Width = 369
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = SchetPDVButtonEditPropertiesButtonClick
      TabOrder = 4
      Text = 'SchetPDVButtonEdit'
    end
    object SchetButtonEdit: TcxButtonEdit
      Left = 168
      Top = 96
      Width = 369
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = SchetButtonEditPropertiesButtonClick
      TabOrder = 5
      Text = 'SchetButtonEdit'
    end
    object cxLabel1: TcxLabel
      Left = 24
      Top = 64
      Width = 119
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
      Caption = #1088#1072#1093#1091#1085#1086#1082' '#1055#1044#1042
    end
    object cxLabel2: TcxLabel
      Left = 24
      Top = 96
      Width = 144
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
      Caption = #1088#1072#1093#1091#1085#1086#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
    end
  end
end
