object frmReportTMP: TfrmReportTMP
  Left = 649
  Top = 322
  Width = 269
  Height = 93
  Caption = #1047#1074#1110#1090' '#1087#1088#1086' ...'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxButtonRun: TcxButton
    Left = 64
    Top = 16
    Width = 75
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 0
    OnClick = cxButtonRunClick
  end
  object cxButtonQuit: TcxButton
    Left = 144
    Top = 16
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 1
    OnClick = cxButtonQuitClick
  end
  object ActionList1: TActionList
    Left = 16
    Top = 8
    object debug_act: TAction
      Caption = 'debug_act'
      ShortCut = 57412
      OnExecute = debug_actExecute
    end
  end
end
