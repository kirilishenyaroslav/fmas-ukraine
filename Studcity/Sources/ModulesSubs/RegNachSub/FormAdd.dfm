object FormRegNachSubAdd: TFormRegNachSubAdd
  Left = 436
  Top = 171
  Width = 438
  Height = 186
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' ...'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OKButton: TcxButton
    Left = 80
    Top = 120
    Width = 91
    Height = 25
    Caption = 'OK'
    TabOrder = 4
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 208
    Top = 120
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = CancelButtonClick
  end
  object cxCalcEdit1: TcxCalcEdit
    Left = 88
    Top = 80
    Width = 121
    Height = 21
    EditValue = 0
    TabOrder = 2
  end
  object cxDateEdit1: TcxDateEdit
    Left = 88
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    EditValue = '0:00:00'
  end
  object cxDateEdit2: TcxDateEdit
    Left = 88
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 1
    EditValue = '0:00:00'
  end
  object DataBeg: TcxLabel
    Left = 8
    Top = 16
    Width = 72
    Height = 17
    ParentColor = False
    ParentFont = False
    TabOrder = 6
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
  end
  object DataEnd: TcxLabel
    Left = 8
    Top = 48
    Width = 67
    Height = 17
    ParentColor = False
    ParentFont = False
    TabOrder = 7
    Caption = #1044#1072#1090#1072' '#1082#1086#1085#1094#1072
  end
  object Summa: TcxLabel
    Left = 8
    Top = 80
    Width = 42
    Height = 17
    ParentColor = False
    ParentFont = False
    TabOrder = 8
    Caption = #1057#1091#1084#1084#1072
  end
  object Formir: TcxGroupBox
    Left = 224
    Top = 16
    Width = 169
    Height = 81
    Alignment = alTopLeft
    Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    TabStop = False
    object Prop: TcxRadioButton
      Left = 16
      Top = 24
      Width = 113
      Height = 17
      Caption = #1055#1088#1086#1087#1086#1088#1094#1080#1086#1085#1072#1083#1100#1085#1086
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
    end
    object Pospis: TcxRadioButton
      Left = 16
      Top = 48
      Width = 113
      Height = 17
      Caption = #1087#1086' '#1089#1087#1080#1089#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
end
