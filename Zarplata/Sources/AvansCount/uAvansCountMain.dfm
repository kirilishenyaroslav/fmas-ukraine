object fAvansCount: TfAvansCount
  Left = 624
  Top = 87
  BorderStyle = bsDialog
  Caption = 'fAvansCount'
  ClientHeight = 497
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 517
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
  object Panel1: TPanel
    Left = 0
    Top = 463
    Width = 517
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
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
      Left = 398
      Top = 4
      Width = 75
      Height = 25
      Caption = 'CancelBtn'
      TabOrder = 1
      OnClick = CancelBtnClick
      LookAndFeel.Kind = lfFlat
    end
    object cxButton1: TcxButton
      Left = 242
      Top = 4
      Width = 75
      Height = 25
      Caption = #1055#1077#1088#1077#1088#1074#1072#1090#1080
      TabOrder = 2
      Visible = False
      OnClick = cxButton1Click
      LookAndFeel.Kind = lfFlat
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 517
    Height = 342
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 5
    object cxMemo1: TcxMemo
      Left = 2
      Top = 2
      Width = 513
      Height = 338
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
    TabOrder = 6
    Caption = ''
  end
  object NumDateBeg: TcxSpinEdit
    Left = 8
    Top = 72
    Width = 41
    Height = 21
    ParentFont = False
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.TransparentBorder = True
    Style.ButtonTransparency = ebtNone
    TabOrder = 7
  end
  object NumDateEnd: TcxSpinEdit
    Left = 72
    Top = 72
    Width = 41
    Height = 21
    ParentFont = False
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.TransparentBorder = True
    Style.ButtonTransparency = ebtNone
    TabOrder = 8
  end
  object cxLabel1: TcxLabel
    Left = 48
    Top = 74
    Width = 25
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 9
    Caption = '-'
  end
  object MonthComboBox: TcxComboBox
    Left = 120
    Top = 72
    Width = 121
    Height = 21
    ParentFont = False
    Properties.ReadOnly = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 10
  end
  object YearSpinEdit: TcxSpinEdit
    Left = 248
    Top = 72
    Width = 49
    Height = 21
    ParentFont = False
    Properties.CanEdit = False
    Properties.MaxValue = 2100.000000000000000000
    Properties.MinValue = 2000.000000000000000000
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 11
    Value = 2000
  end
  object ProgressBar1: TProgressBar
    Left = 7
    Top = 96
    Width = 502
    Height = 20
    TabOrder = 12
  end
end
