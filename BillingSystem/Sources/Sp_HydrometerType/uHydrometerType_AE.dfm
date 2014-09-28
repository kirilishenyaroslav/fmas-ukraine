object frmHydrometerType_AE: TfrmHydrometerType_AE
  Left = 493
  Top = 361
  Width = 424
  Height = 325
  Caption = 'frmHydrometerType_AE'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Width = 401
    Height = 241
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object CalibrLabel: TLabel
      Left = 8
      Top = 48
      Width = 52
      Height = 13
      Caption = 'CalibrLabel'
      Transparent = True
    end
    object MeasCalibrLabel: TLabel
      Left = 184
      Top = 48
      Width = 78
      Height = 13
      Caption = 'MeasCalibrLabel'
      Transparent = True
    end
    object CapacityLabel: TLabel
      Left = 8
      Top = 88
      Width = 67
      Height = 13
      Caption = 'CapacityLabel'
      Transparent = True
    end
    object NameLabel: TLabel
      Left = 8
      Top = 8
      Width = 54
      Height = 13
      Caption = 'NameLabel'
      Transparent = True
    end
    object AccuracyLabel: TLabel
      Left = 184
      Top = 88
      Width = 71
      Height = 13
      Caption = 'AccuracyLabel'
      Transparent = True
    end
    object NoteLabel: TLabel
      Left = 8
      Top = 169
      Width = 49
      Height = 13
      Caption = 'NoteLabel'
      Transparent = True
    end
    object FactoryLabel: TLabel
      Left = 8
      Top = 128
      Width = 61
      Height = 13
      Caption = 'FactoryLabel'
      Transparent = True
    end
    object NameEdit: TcxTextEdit
      Left = 8
      Top = 22
      Width = 281
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 255
      Style.Color = clWindow
      TabOrder = 0
    end
    object CalibrEdit: TcxTextEdit
      Left = 8
      Top = 62
      Width = 105
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 255
      Style.Color = clWindow
      TabOrder = 1
      OnKeyPress = CalibrEditKeyPress
    end
    object MeasCalibrEdit: TcxTextEdit
      Left = 184
      Top = 62
      Width = 105
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 255
      Style.Color = clWindow
      TabOrder = 2
      OnKeyPress = MeasCalibrEditKeyPress
    end
    object CapacityEdit: TcxTextEdit
      Left = 8
      Top = 102
      Width = 105
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 255
      Style.Color = clWindow
      TabOrder = 3
      OnKeyPress = MeasCalibrEditKeyPress
    end
    object AccuracyEdit: TcxTextEdit
      Left = 184
      Top = 102
      Width = 105
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 255
      Style.Color = clWindow
      TabOrder = 4
      OnKeyPress = MeasCalibrEditKeyPress
    end
    object NoteMemo: TcxMemo
      Left = 8
      Top = 185
      Width = 361
      Height = 41
      Lines.Strings = (
        '')
      TabOrder = 5
    end
    object FactoryEdit: TcxTextEdit
      Left = 8
      Top = 142
      Width = 281
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 255
      Style.Color = clWindow
      TabOrder = 6
    end
  end
  object OkButton: TcxButton
    Left = 214
    Top = 257
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 307
    Top = 257
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
