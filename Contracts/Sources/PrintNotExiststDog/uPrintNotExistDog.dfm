object frmPrintNotExistDog: TfrmPrintNotExistDog
  Left = 575
  Top = 342
  Width = 360
  Height = 138
  Caption = 'frmPrintNotExistDog'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Button_print: TcxButton
    Left = 97
    Top = 72
    Width = 120
    Height = 25
    Caption = #1044#1088#1091#1082
    TabOrder = 0
    OnClick = Button_printClick
  end
  object Button_cancel: TcxButton
    Left = 225
    Top = 72
    Width = 120
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 1
    OnClick = Button_cancelClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Width = 337
    Height = 57
    Alignment = alTopLeft
    Caption = #1055#1077#1088#1110#1086#1076' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103
    TabOrder = 2
    object Date_Beg_DateEdit: TcxDateEdit
      Left = 24
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 0
      EditValue = 0d
    end
    object Date_End_DateEdit: TcxDateEdit
      Left = 184
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 1
      EditValue = 0d
    end
    object cxLabel1: TcxLabel
      Left = 8
      Top = 24
      Width = 14
      Height = 17
      TabOrder = 2
      Caption = #1079
    end
    object cxLabel2: TcxLabel
      Left = 160
      Top = 24
      Width = 20
      Height = 17
      TabOrder = 3
      Caption = #1087#1086
    end
  end
  object ActionList1: TActionList
    Left = 8
    Top = 72
    object acDebug: TAction
      Caption = 'acDebug'
      ShortCut = 57412
      OnExecute = acDebugExecute
    end
    object close_act: TAction
      Caption = 'close_act'
      ShortCut = 27
      OnExecute = close_actExecute
    end
  end
end
