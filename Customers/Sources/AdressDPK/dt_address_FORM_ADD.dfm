object Fdt_address_form_add: TFdt_address_form_add
  Left = 292
  Top = 181
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1080
  ClientHeight = 199
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 36
    Height = 13
    Caption = #1057#1090#1088#1072#1085#1072
  end
  object Label2: TLabel
    Left = 16
    Top = 112
    Width = 112
    Height = 13
    Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 240
    Top = 16
    Width = 31
    Height = 13
    Caption = #1056#1072#1081#1086#1085
  end
  object Label4: TLabel
    Left = 240
    Top = 64
    Width = 38
    Height = 13
    Caption = #1059#1083#1080#1094#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 240
    Top = 112
    Width = 36
    Height = 13
    Caption = #1050#1086#1088#1087#1091#1089
  end
  object Label8: TLabel
    Left = 288
    Top = 112
    Width = 27
    Height = 13
    Caption = #1044#1086#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 344
    Top = 112
    Width = 48
    Height = 13
    Caption = #1050#1074#1072#1088#1090#1080#1088#1072
  end
  object Label10: TLabel
    Left = 16
    Top = 64
    Width = 36
    Height = 13
    Caption = #1056#1077#1075#1080#1086#1085
  end
  object LabelZip: TLabel
    Left = 400
    Top = 112
    Width = 38
    Height = 13
    Caption = #1048#1085#1076#1077#1082#1089
  end
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 449
    Height = 153
    Shape = bsFrame
  end
  object CountryEdit: TcxButtonEdit
    Left = 16
    Top = 32
    Width = 209
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = CountryEditButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 0
  end
  object RegionEdit: TcxButtonEdit
    Left = 16
    Top = 80
    Width = 209
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = RegionEditButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 1
  end
  object PlaceEdit: TcxButtonEdit
    Left = 16
    Top = 128
    Width = 209
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = PlaceEditButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 2
  end
  object DistrictEdit: TcxButtonEdit
    Left = 240
    Top = 32
    Width = 209
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = DistrictEditButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 3
  end
  object TypeStreetEdit: TcxButtonEdit
    Left = 240
    Top = 80
    Width = 73
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = TypeStreetEditButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 4
  end
  object StreetEdit: TcxTextEdit
    Left = 320
    Top = 80
    Width = 129
    Height = 21
    Style.Color = clMoneyGreen
    TabOrder = 5
  end
  object KorpusEdit: TcxTextEdit
    Left = 240
    Top = 128
    Width = 41
    Height = 21
    Style.Color = clMoneyGreen
    TabOrder = 6
  end
  object HouseEdit: TcxTextEdit
    Left = 288
    Top = 128
    Width = 49
    Height = 21
    Style.Color = clMoneyGreen
    TabOrder = 7
  end
  object FlatEdit: TcxTextEdit
    Left = 344
    Top = 128
    Width = 49
    Height = 21
    Style.Color = clMoneyGreen
    TabOrder = 8
  end
  object ZipEdit: TcxTextEdit
    Left = 400
    Top = 128
    Width = 49
    Height = 21
    Style.Color = clMoneyGreen
    TabOrder = 9
    Text = '0'
    OnKeyPress = ZipEditKeyPress
  end
  object OKButton: TcxButton
    Left = 269
    Top = 168
    Width = 89
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 11
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 365
    Top = 168
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 10
    OnClick = CancelButtonClick
  end
end
