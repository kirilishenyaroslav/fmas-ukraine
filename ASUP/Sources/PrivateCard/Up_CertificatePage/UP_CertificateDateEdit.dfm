object frmDateChange: TfrmDateChange
  Left = 477
  Top = 251
  BorderStyle = bsDialog
  Caption = 'frmDateChange'
  ClientHeight = 153
  ClientWidth = 308
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
    Width = 308
    Height = 112
    Align = alClient
    TabOrder = 0
    object DateBeg: TcxDateEdit
      Left = 160
      Top = 24
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
      Visible = False
    end
    object DateEnd: TcxDateEdit
      Left = 160
      Top = 72
      Width = 121
      Height = 21
      Properties.ImmediatePost = True
      TabOrder = 1
      Visible = False
    end
    object Date_Beg: TcxLabel
      Left = 51
      Top = 25
      Width = 90
      Height = 17
      TabOrder = 2
      Visible = False
      Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1076#1110#1111
    end
    object Date_End: TcxLabel
      Left = 53
      Top = 71
      Width = 77
      Height = 17
      TabOrder = 3
      Visible = False
      Caption = #1044#1072#1090#1072' '#1082#1110#1085#1094#1103' '#1076#1110#1111
    end
    object DateVidachi: TcxDateEdit
      Left = 160
      Top = 48
      Width = 121
      Height = 21
      Properties.ImmediatePost = True
      TabOrder = 4
      Visible = False
    end
    object Date_Vidachi: TcxLabel
      Left = 24
      Top = 49
      Width = 132
      Height = 17
      TabOrder = 5
      Visible = False
      Caption = #1044#1072#1090#1072' '#1074#1080#1076#1072#1095#1110' '#1087#1086#1089#1074#1110#1076#1095#1077#1085#1085#1103
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 112
    Width = 308
    Height = 41
    Align = alBottom
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 24
      Top = 7
      Width = 89
      Height = 25
      Action = ok_date
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton2: TSpeedButton
      Left = 208
      Top = 7
      Width = 89
      Height = 24
      Action = cancel_date
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object ActionList1: TActionList
    Left = 8
    Top = 8
    object ok_date: TAction
      Caption = #1043#1072#1088#1072#1079#1076
      SecondaryShortCuts.Strings = (
        'Enter')
      OnExecute = ok_dateExecute
    end
    object cancel_date: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1072
      SecondaryShortCuts.Strings = (
        'Esc')
      OnExecute = cancel_dateExecute
    end
  end
end
