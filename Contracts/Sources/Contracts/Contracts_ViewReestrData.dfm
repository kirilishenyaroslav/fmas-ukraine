object fmCnViewReestrData: TfmCnViewReestrData
  Left = 414
  Top = 355
  BorderStyle = bsDialog
  ClientHeight = 173
  ClientWidth = 342
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
  object cxButton1: TcxButton
    Left = 111
    Top = 139
    Width = 121
    Height = 25
    Caption = #1047#1072#1082#1088#1080#1090#1080
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxTextNum: TcxTextEdit
    Left = 72
    Top = 8
    Width = 121
    Height = 21
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
  end
  object cxTextData: TcxTextEdit
    Left = 72
    Top = 40
    Width = 121
    Height = 21
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Width = 63
    Height = 17
    TabOrder = 3
    Caption = #8470' '#1088#1077#1108#1089#1090#1088#1072
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 40
    Width = 63
    Height = 17
    TabOrder = 4
    Caption = #1044#1072#1090#1072
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 72
    Width = 55
    Height = 17
    TabOrder = 5
    Caption = #1055#1088#1080#1084#1110#1090#1082#1072
  end
  object cxTextNote: TcxMemo
    Left = 72
    Top = 72
    Width = 265
    Height = 57
    ParentFont = False
    Properties.MaxLength = 255
    Properties.WordWrap = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
  end
  object ActionList1: TActionList
    Left = 224
    Top = 24
    object acExit: TAction
      Caption = 'acExit'
      ShortCut = 27
      OnExecute = acExitExecute
    end
  end
end
