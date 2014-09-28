object fmSeriya: TfmSeriya
  Left = 384
  Top = 230
  Width = 282
  Height = 162
  Caption = #1044#1088#1091#1082' '#1072#1085' '#1073#1083#1072#1085#1082#1091' '#1089#1091#1074#1086#1088#1086#1111' '#1074#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1086#1089#1090#1110' ('#1090#1110#1083#1100#1082#1110' '#1076#1072#1085#1110')'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxTextEdit1: TcxTextEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object cxTextEdit2: TcxTextEdit
    Left = 144
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyPress = cxTextEdit2KeyPress
  end
  object cxButton1: TcxButton
    Left = 8
    Top = 88
    Width = 121
    Height = 25
    Caption = #1044#1088#1091#1082
    Default = True
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 144
    Top = 88
    Width = 121
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 5
    Width = 73
    Height = 17
    TabOrder = 4
    Caption = #1057#1077#1088#1110#1103' '#1073#1083#1072#1085#1082#1091
  end
  object cxLabel2: TcxLabel
    Left = 144
    Top = 5
    Width = 80
    Height = 17
    TabOrder = 5
    Caption = #1053#1086#1084#1077#1088' '#1073#1083#1072#1085#1082#1091
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 48
    Width = 257
    Height = 41
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Properties.WordWrap = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
    Visible = False
  end
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 104
    Top = 24
  end
  object TWr: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 136
    Top = 24
  end
  object Tr: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 168
    Top = 24
  end
  object Stored: TpFIBStoredProc
    Left = 40
    Top = 16
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 232
    Top = 8
  end
  object DS: TpFIBDataSet
    Left = 200
    Top = 64
    poSQLINT64ToBCD = True
  end
end
