object fHolCount: TfHolCount
  Left = 359
  Top = 183
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'fHolCount'
  ClientHeight = 446
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ScreenSnap = True
  OnCanResize = FormCanResize
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 516
    Height = 121
    Align = alTop
    Shape = bsFrame
  end
  object LabelTn: TcxLabel
    Left = 8
    Top = 20
    Width = 145
    Height = 23
    AutoSize = False
    ParentFont = False
    Properties.LabelStyle = cxlsRaised
    Style.BorderStyle = ebsNone
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
  end
  object LabelFio: TcxLabel
    Left = 8
    Top = 43
    Width = 145
    Height = 24
    AutoSize = False
    ParentFont = False
    Properties.LabelStyle = cxlsRaised
    Style.BorderStyle = ebsNone
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
  end
  object LabelTnData: TcxLabel
    Left = 152
    Top = 20
    Width = 361
    Height = 23
    AutoSize = False
    ParentFont = False
    Properties.LabelStyle = cxlsRaised
    Style.BorderStyle = ebsNone
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Caption = ''
  end
  object LabelFioData: TcxLabel
    Left = 152
    Top = 43
    Width = 361
    Height = 24
    AutoSize = False
    ParentFont = False
    Properties.LabelStyle = cxlsRaised
    Style.BorderStyle = ebsNone
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
    Caption = ''
  end
  object cxProgressBar1: TcxProgressBar
    Left = 4
    Top = 96
    Width = 509
    Height = 21
    Properties.ShowPeak = True
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 516
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    object OkBtn: TcxButton
      Left = 320
      Top = 4
      Width = 75
      Height = 25
      Caption = 'OkBtn'
      TabOrder = 0
      OnClick = OkBtnClick
      LookAndFeel.Kind = lfFlat
    end
    object CancelBtn: TcxButton
      Left = 416
      Top = 4
      Width = 75
      Height = 25
      Caption = 'CancelBtn'
      TabOrder = 1
      OnClick = CancelBtnClick
      LookAndFeel.Kind = lfFlat
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 516
    Height = 291
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 6
    object cxMemo1: TcxMemo
      Left = 2
      Top = 2
      Width = 512
      Height = 287
      Align = alClient
      Lines.Strings = (
        'cxMemo1')
      TabOrder = 0
    end
  end
  object LabelDopInfo: TcxLabel
    Left = 155
    Top = 0
    Width = 361
    Height = 23
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.LabelStyle = cxlsRaised
    Style.BorderStyle = ebsNone
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
    Caption = ''
  end
  object CheckBoxFormSheet: TcxCheckBox
    Left = 280
    Top = 72
    Width = 233
    Height = 21
    Properties.DisplayUnchecked = 'False'
    State = cbsChecked
    TabOrder = 8
  end
  object DateBegEdit: TcxDateEdit
    Left = 8
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object cxLabel1: TcxLabel
    Left = 128
    Top = 72
    Width = 24
    Height = 20
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 10
    Caption = '---'
  end
  object DateEndEdit: TcxDateEdit
    Left = 152
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 11
  end
end
