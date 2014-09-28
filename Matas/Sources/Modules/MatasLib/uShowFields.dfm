object fmShowFields: TfmShowFields
  Left = 446
  Top = 155
  Width = 400
  Height = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MemoValues: TMemo
    Left = 0
    Top = 0
    Width = 392
    Height = 468
    Align = alClient
    Color = 13817545
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Lines.Strings = (
      'MemoValues')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object ActionList1: TActionList
    Left = 16
    Top = 16
    object acExit: TAction
      Caption = 'acExit'
      ShortCut = 27
      OnExecute = acExitExecute
    end
  end
end
