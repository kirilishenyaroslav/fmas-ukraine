object frmEditMainParams: TfrmEditMainParams
  Left = 437
  Top = 272
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1079#1074#1110#1090#1091
  ClientHeight = 244
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxButtonEdit1: TcxButtonEdit
    Left = 23
    Top = 85
    Width = 417
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    TabOrder = 0
  end
  object cxLabel1: TcxLabel
    Left = 23
    Top = 16
    Width = 68
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Caption = #1055#1088#1086#1075#1088#1072#1084#1072
  end
  object cxLabel2: TcxLabel
    Left = 23
    Top = 64
    Width = 74
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Caption = #1058#1080#1087' '#1082#1086#1096#1090#1110#1074
  end
  object cxButtonEdit2: TcxButtonEdit
    Left = 23
    Top = 37
    Width = 417
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
    TabOrder = 3
  end
  object cxButton1: TcxButton
    Left = 145
    Top = 200
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 4
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 225
    Top = 200
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 5
    OnClick = cxButton2Click
  end
  object cxMemo1: TcxMemo
    Left = 23
    Top = 136
    Width = 417
    Height = 41
    TabOrder = 6
  end
  object cxLabel3: TcxLabel
    Left = 23
    Top = 116
    Width = 121
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
    Caption = #1054#1087#1080#1089#1072#1085#1085#1103' '#1096#1072#1073#1083#1086#1085#1091
  end
end
