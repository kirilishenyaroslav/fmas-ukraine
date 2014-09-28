object frmFind: TfrmFind
  Left = 323
  Top = 183
  BorderStyle = bsDialog
  Caption = #1055#1086#1080#1089#1082' '#1082#1083#1077#1090#1082#1080' '#1084#1072#1090#1088#1080#1094#1099
  ClientHeight = 131
  ClientWidth = 381
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
    Top = 90
    Width = 381
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 216
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 381
    Height = 90
    Align = alClient
    TabOrder = 1
    object ChKrCoord: TcxCheckBox
      Left = 40
      Top = 16
      Width = 137
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = ChKrCoordPropertiesChange
      Properties.Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1072' '#1082#1088#1077#1076#1080#1090#1072
      TabOrder = 0
    end
    object ChDbCoord: TcxCheckBox
      Left = 40
      Top = 48
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = ChDbCoordPropertiesChange
      Properties.Caption = #1050#1086#1086#1076#1080#1085#1072#1090#1072' '#1076#1077#1073#1077#1090#1072
      TabOrder = 1
    end
    object EdKrCoord: TcxTextEdit
      Left = 184
      Top = 16
      Width = 177
      Height = 21
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object EdDbCoord: TcxTextEdit
      Left = 184
      Top = 48
      Width = 177
      Height = 21
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 3
    end
  end
end
