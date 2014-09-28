object AddProductForm: TAddProductForm
  Left = 520
  Top = 406
  BorderStyle = bsDialog
  Caption = 'AddProductForm'
  ClientHeight = 198
  ClientWidth = 294
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
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 281
    Height = 153
    ParentShowHint = False
    Shape = bsFrame
    ShowHint = False
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 84
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1087#1088#1086#1076#1091#1082#1094#1110#1111':'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 143
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1082#1072#1090#1077#1075#1086#1088#1110#1111' '#1089#1087#1086#1078#1080#1074#1072#1095#1110#1074':'
  end
  object Label3: TLabel
    Left = 16
    Top = 112
    Width = 112
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1086#1076#1080#1085#1080#1094#1110' '#1074#1080#1084#1110#1088#1091':'
  end
  object NameProduct: TcxButtonEdit
    Left = 16
    Top = 32
    Width = 265
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = NameProductButtonClick
    Style.StyleController = dm.EditStyleController1
    TabOrder = 0
  end
  object NameUnitMeas: TcxButtonEdit
    Left = 16
    Top = 128
    Width = 265
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = NameUnitMeasButtonClick
    Style.StyleController = dm.EditStyleController1
    TabOrder = 1
  end
  object NameCatCust: TcxTextEdit
    Left = 16
    Top = 80
    Width = 265
    Height = 21
    Properties.ReadOnly = True
    Style.StyleController = dm.EditStyleController1
    TabOrder = 2
  end
  object Button1: TcxButton
    Left = 134
    Top = 168
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TcxButton
    Left = 214
    Top = 168
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 4
    OnClick = Button2Click
  end
  object Query: TpFIBQuery
    Database = dm.DataBase
    Transaction = dm.ReadTransaction
    Left = 56
    Top = 168
  end
end
