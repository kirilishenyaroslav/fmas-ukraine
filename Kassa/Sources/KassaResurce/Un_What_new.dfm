object fmUn_What_new: TfmUn_What_new
  Left = 212
  Top = 121
  Width = 696
  Height = 480
  Caption = 'fmUn_What_new'
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
  PixelsPerInch = 96
  TextHeight = 13
  object cxMemo1: TcxMemo
    Left = 0
    Top = 0
    Width = 688
    Height = 446
    Align = alClient
    ParentFont = False
    Properties.ReadOnly = True
    Properties.ScrollBars = ssVertical
    Style.Color = 10721844
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -16
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
  end
  object ActionList1: TActionList
    Left = 424
    Top = 80
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 27
      OnExecute = Action1Execute
    end
  end
end
