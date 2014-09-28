object frmReportFilter: TfrmReportFilter
  Left = 516
  Top = 348
  BorderStyle = bsDialog
  Caption = 'frmReportFilter'
  ClientHeight = 112
  ClientWidth = 250
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
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 250
    Height = 71
    Align = alClient
    TabOrder = 0
    object lblFrom: TcxLabel
      Left = 9
      Top = 24
      Width = 35
      Height = 17
      AutoSize = False
      TabOrder = 0
    end
    object lblTo: TcxLabel
      Left = 141
      Top = 25
      Width = 31
      Height = 17
      AutoSize = False
      TabOrder = 1
    end
  end
  object btnPanel: TPanel
    Left = 0
    Top = 71
    Width = 250
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnOk: TcxButton
      Left = 13
      Top = 8
      Width = 100
      Height = 25
      Caption = #1043#1072#1088#1072#1079#1076
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TcxButton
      Left = 136
      Top = 8
      Width = 100
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
end
