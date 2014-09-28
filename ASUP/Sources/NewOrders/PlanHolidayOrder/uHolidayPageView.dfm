object fmHolidayPageView: TfmHolidayPageView
  Left = 272
  Top = 103
  Width = 696
  Height = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ActionList1: TActionList
    Left = 288
    Top = 176
    object CloseAction: TAction
      Caption = 'CloseAction'
      ShortCut = 27
      OnExecute = CloseActionExecute
    end
  end
end
