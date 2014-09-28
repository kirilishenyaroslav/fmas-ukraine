object frmDbKr: TfrmDbKr
  Left = 303
  Top = 160
  BorderStyle = bsNone
  ClientHeight = 61
  ClientWidth = 242
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
    Width = 242
    Height = 61
    Align = alClient
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 11206655
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object RadioButton_Db: TcxRadioButton
      Left = 8
      Top = 8
      Width = 149
      Height = 17
      Caption = #1056#1072#1093#1091#1085#1086#1082' '#1091' '#1076#1077#1073#1077#1090#1110
      TabOrder = 0
    end
    object RadioButton_Kr: TcxRadioButton
      Left = 8
      Top = 35
      Width = 149
      Height = 17
      Caption = #1056#1072#1093#1091#1085#1086#1082' '#1091' '#1082#1088#1077#1076#1080#1090#1110
      TabOrder = 1
    end
    object Button_Cancel: TcxButton
      Left = 160
      Top = 29
      Width = 75
      Height = 25
      Action = act_Cancel
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 3
    end
    object Button_OK: TcxButton
      Left = 160
      Top = 2
      Width = 75
      Height = 25
      Action = act_OK
      Caption = #1043#1072#1088#1072#1079#1076
      Default = True
      TabOrder = 2
    end
  end
  object ActionList1: TActionList
    Left = 128
    Top = 16
    object act_OK: TAction
      Caption = 'act_OK'
      ShortCut = 13
      OnExecute = act_OKExecute
    end
    object act_Cancel: TAction
      Caption = 'act_Cancel'
      ShortCut = 27
      OnExecute = act_CancelExecute
    end
  end
end
