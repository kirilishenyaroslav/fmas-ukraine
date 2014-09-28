object frmSumEdit: TfrmSumEdit
  Left = 320
  Top = 253
  ActiveControl = cxCalcEdit1
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1089#1091#1084#1086#1102
  ClientHeight = 117
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 76
    Width = 392
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 216
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 76
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 40
      Top = 24
      Width = 81
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1057#1091#1084#1072' '
    end
    object cxCalcEdit1: TcxCalcEdit
      Left = 128
      Top = 24
      Width = 249
      Height = 24
      EditValue = 0.000000000000000000
      Properties.ReadOnly = False
      Style.Color = clInfoBk
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Left = 16
    Top = 16
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = cxButton1Click
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 27
      OnExecute = cxButton2Click
    end
  end
end
