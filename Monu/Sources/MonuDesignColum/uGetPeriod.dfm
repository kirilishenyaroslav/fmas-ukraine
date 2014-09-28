object frmGetPeriod: TfrmGetPeriod
  Left = 422
  Top = 276
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1088#1086' '#1087#1077#1088#1110#1086#1076#1080
  ClientHeight = 107
  ClientWidth = 311
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
    Top = 0
    Width = 311
    Height = 107
    Align = alClient
    TabOrder = 0
    object cxLabel3: TcxLabel
      Left = 24
      Top = 16
      Width = 49
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = #1055#1077#1088#1110#1086#1076
    end
    object cxLabel4: TcxLabel
      Left = 104
      Top = 64
      Width = 16
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = #1079
    end
    object cxLabel5: TcxLabel
      Left = 168
      Top = 16
      Width = 23
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = #1087#1086
    end
    object cxDateEditBeg: TcxDateEdit
      Left = 24
      Top = 32
      Width = 121
      Height = 21
      Style.Color = clSkyBlue
      TabOrder = 3
    end
    object cxDateEditEnd: TcxDateEdit
      Left = 168
      Top = 32
      Width = 121
      Height = 21
      Style.Color = clSkyBlue
      TabOrder = 4
    end
    object cxButtonClose: TcxButton
      Left = 160
      Top = 72
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 5
      OnClick = cxButtonCloseClick
    end
    object cxButtonPrint: TcxButton
      Left = 80
      Top = 72
      Width = 75
      Height = 25
      Caption = #1054#1050
      Default = True
      TabOrder = 6
      OnClick = cxButtonPrintClick
    end
  end
end
