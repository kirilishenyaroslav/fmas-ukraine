object frmReportExpSer: TfrmReportExpSer
  Left = 651
  Top = 322
  Width = 333
  Height = 126
  Caption = #1047#1074#1110#1090' '#1087#1088#1086' '#1077#1082#1089#1087#1086#1088#1090' '#1087#1086#1089#1083#1091#1075
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxButtonRun: TcxButton
    Left = 152
    Top = 56
    Width = 75
    Height = 25
    Caption = 'cxButtonRun'
    TabOrder = 0
    OnClick = cxButtonRunClick
  end
  object cxButtonQuit: TcxButton
    Left = 232
    Top = 56
    Width = 75
    Height = 25
    Caption = 'cxButtonQuit'
    TabOrder = 1
    OnClick = cxButtonQuitClick
  end
  object cxGroupBoxPeriodStud: TcxGroupBox
    Left = 3
    Top = 5
    Width = 310
    Height = 45
    Alignment = alTopLeft
    Caption = 'cxGroupBoxPeriodStud'
    TabOrder = 2
    object cxLabelPriodBegin: TcxLabel
      Left = 8
      Top = 17
      Width = 114
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object cxLabelPeriodEnd: TcxLabel
      Left = 157
      Top = 17
      Width = 111
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object cxDateEditPeriodBegin: TcxDateEdit
      Left = 29
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
      EditValue = 0d
    end
    object cxDateEditPeriodEnd: TcxDateEdit
      Left = 181
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 1
      EditValue = 0d
    end
  end
  object ActionList1: TActionList
    Left = 16
    Top = 56
    object debug_act: TAction
      Caption = 'debug_act'
      ShortCut = 57412
      OnExecute = debug_actExecute
    end
  end
end
