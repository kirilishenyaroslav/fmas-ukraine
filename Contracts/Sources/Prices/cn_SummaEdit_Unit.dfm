object frmSummaEdit: TfrmSummaEdit
  Left = 518
  Top = 293
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1091#1084#1072
  ClientHeight = 122
  ClientWidth = 210
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TcxButton
    Left = 8
    Top = 88
    Width = 91
    Height = 25
    Action = ButtonYes
    TabOrder = 1
  end
  object btnClose: TcxButton
    Left = 112
    Top = 88
    Width = 91
    Height = 25
    Action = ButtonNo
    TabOrder = 2
  end
  object curEdit: TcxCurrencyEdit
    Left = 40
    Top = 32
    Width = 121
    Height = 21
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '0'
    Style.Color = clInfoBk
    TabOrder = 0
    OnKeyPress = curEditKeyPress
  end
  object ActionList1: TActionList
    Left = 168
    Top = 56
    object ButtonYes: TAction
      Caption = 'Yes'
      OnExecute = ButtonYesExecute
    end
    object ButtonNo: TAction
      Caption = 'No'
      ShortCut = 27
      OnExecute = ButtonNoExecute
    end
  end
end
