object frmEmailDates: TfrmEmailDates
  Left = 360
  Top = 306
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1110#1086#1076' '#1088#1086#1079#1089#1080#1083#1082#1080
  ClientHeight = 170
  ClientWidth = 374
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
  object Panel1: TPanel
    Left = 0
    Top = 129
    Width = 374
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 210
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 290
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 374
    Height = 129
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 21
      Top = 11
      Width = 158
      Height = 13
      Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091' '#1088#1086#1079#1089#1080#1083#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 21
      Top = 40
      Width = 175
      Height = 13
      Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091' '#1088#1086#1079#1089#1080#1083#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 21
      Top = 72
      Width = 95
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100' '#1076#1086#1089#1090#1091#1087#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxDateEdit1: TcxDateEdit
      Left = 208
      Top = 11
      Width = 153
      Height = 21
      Properties.ShowTime = False
      TabOrder = 0
    end
    object cxDateEdit2: TcxDateEdit
      Left = 208
      Top = 40
      Width = 153
      Height = 21
      Properties.ShowTime = False
      TabOrder = 1
    end
    object cxButton3: TcxButton
      Left = 208
      Top = 96
      Width = 153
      Height = 25
      Caption = #1055#1077#1088#1077#1075#1077#1085#1077#1088#1091#1074#1072#1090#1080' '#1087#1072#1088#1086#1083#1100
      TabOrder = 2
      OnClick = cxButton3Click
    end
    object cxTextEdit1: TcxMaskEdit
      Left = 208
      Top = 72
      Width = 153
      Height = 21
      Properties.EchoMode = eemPassword
      Properties.MaxLength = 99
      TabOrder = 3
    end
  end
end
