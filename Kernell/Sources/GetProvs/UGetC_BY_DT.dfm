object frmGetRsch: TfrmGetRsch
  Left = 395
  Top = 234
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1095#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
  ClientHeight = 195
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 154
    Width = 334
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 144
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 154
    Align = alClient
    TabOrder = 1
    object cxRadioButton1: TcxRadioButton
      Left = 40
      Top = 32
      Width = 225
      Height = 17
      Caption = #1056#1086#1073#1086#1095#1080#1081' '#1088#1072#1093#1091#1085#1086#1082' '#1074' '#1076#1077#1073#1077#1090#1110
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object cxRadioButton2: TcxRadioButton
      Left = 40
      Top = 80
      Width = 249
      Height = 17
      Caption = #1056#1086#1073#1086#1095#1080#1081' '#1088#1072#1093#1091#1085#1086#1082' '#1074' '#1082#1088#1077#1076#1080#1090#1110
      TabOrder = 1
    end
  end
  object ActionList1: TActionList
    Left = 16
    Top = 162
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = cxButton1Click
    end
  end
end
