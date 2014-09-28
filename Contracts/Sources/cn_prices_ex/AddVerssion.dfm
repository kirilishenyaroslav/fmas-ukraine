object frmAddVerssion: TfrmAddVerssion
  Left = 340
  Top = 185
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'frmAddVerssion'
  ClientHeight = 121
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel2: TPanel
    Left = 0
    Top = 80
    Width = 462
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Ok_Button: TcxButton
      Left = 256
      Top = 8
      Width = 91
      Height = 25
      Action = act_ok
      TabOrder = 0
    end
    object Cancel_Button: TcxButton
      Left = 360
      Top = 8
      Width = 91
      Height = 25
      Caption = 'Cancel_Button'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 462
    Height = 80
    Align = alClient
    TabOrder = 1
    object EditNameVerssion: TcxTextEdit
      Left = 16
      Top = 24
      Width = 433
      Height = 24
      Properties.MaxLength = 100
      TabOrder = 0
    end
    object LPriceVerssionName: TcxLabel
      Left = 16
      Top = 4
      Width = 305
      Height = 20
      TabStop = False
      AutoSize = False
      TabOrder = 2
      Caption = 'LPriceVerssionName'
    end
    object chbActual: TcxCheckBox
      Left = 16
      Top = 54
      Width = 121
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.ValueChecked = 'T'
      Properties.ValueUnchecked = 'F'
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 1
    end
  end
  object ActionList1: TActionList
    Left = 24
    Top = 88
    object act_ok: TAction
      Caption = 'act_ok'
      ShortCut = 13
      OnExecute = act_okExecute
    end
    object cancel: TAction
      Caption = 'cancel'
      ShortCut = 27
      OnExecute = cancelExecute
    end
  end
end
