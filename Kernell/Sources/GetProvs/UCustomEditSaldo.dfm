object frmCustomEditSaldo: TfrmCustomEditSaldo
  Left = 316
  Top = 241
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1089#1072#1083#1100#1076#1086' '#1088#1072#1093#1091#1085#1082#1110#1074
  ClientHeight = 202
  ClientWidth = 457
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
    Top = 161
    Width = 457
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 368
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
    Width = 457
    Height = 161
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 425
      Height = 20
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 37
      Top = 75
      Width = 105
      Height = 13
      Caption = #1044#1077#1073#1077#1090#1086#1074#1077' '#1089#1072#1083#1100#1076#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 38
      Top = 107
      Width = 110
      Height = 13
      Caption = #1050#1086#1077#1076#1080#1090#1086#1074#1077' '#1089#1072#1083#1100#1076#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EditDBSaldo: TcxCalcEdit
      Left = 160
      Top = 72
      Width = 273
      Height = 21
      EditValue = '0'
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object EditKrSaldo: TcxCalcEdit
      Left = 160
      Top = 104
      Width = 273
      Height = 21
      EditValue = '0'
      Style.Color = clInfoBk
      TabOrder = 1
    end
  end
end
