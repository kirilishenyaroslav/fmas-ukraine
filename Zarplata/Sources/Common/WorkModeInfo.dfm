object frmWorkModeInfo: TfrmWorkModeInfo
  Left = 287
  Top = 333
  BorderStyle = bsDialog
  Caption = #1056#1077#1078#1080#1084' '#1087#1088#1072#1094#1110
  ClientHeight = 294
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object WorkModeGrid: TStringGrid
    Left = 0
    Top = 41
    Width = 523
    Height = 212
    Align = alClient
    ColCount = 2
    DefaultColWidth = 40
    DefaultRowHeight = 20
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssHorizontal
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 253
    Width = 523
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 432
      Top = 8
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 0
      OnClick = cxButton1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 523
    Height = 41
    Align = alTop
    TabOrder = 2
    object WorkModeLabel: TcxLabel
      Left = 1
      Top = 1
      Width = 521
      Height = 39
      Align = alClient
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
  end
end
