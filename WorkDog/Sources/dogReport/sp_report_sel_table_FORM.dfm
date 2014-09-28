object SelTableFrom: TSelTableFrom
  Left = 232
  Top = 136
  BorderStyle = bsDialog
  Caption = #1042#1080#1073#1110#1088
  ClientHeight = 122
  ClientWidth = 265
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
    Left = 8
    Top = 24
    Width = 72
    Height = 13
    Caption = #1030#1084#39#1103' '#1090#1072#1073#1083#1080#1094#1110
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxButton1: TcxButton
    Left = 32
    Top = 88
    Width = 91
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 144
    Top = 88
    Width = 91
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object cxComboBox1: TcxComboBox
    Left = 8
    Top = 40
    Width = 249
    Height = 21
    Properties.DropDownRows = 10
    Style.StyleController = dm.EditStyleController1
    TabOrder = 2
  end
end
