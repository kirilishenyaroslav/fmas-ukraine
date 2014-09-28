object frmImportDBF: TfrmImportDBF
  Left = 502
  Top = 353
  Width = 485
  Height = 168
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 56
    Width = 32
    Height = 13
    Caption = 'Label1'
    Visible = False
  end
  object cxButtonEdit1: TcxButtonEdit
    Left = 48
    Top = 8
    Width = 409
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    TabOrder = 0
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Width = 37
    Height = 17
    TabOrder = 1
    Caption = #1060#1072#1081#1083
  end
  object cxButton1: TcxButton
    Left = 109
    Top = 88
    Width = 120
    Height = 25
    Caption = 'Import'
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 237
    Top = 88
    Width = 120
    Height = 25
    Caption = 'Exit'
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object cxProgressBar1: TcxProgressBar
    Left = 48
    Top = 32
    Width = 409
    Height = 21
    TabOrder = 4
    Visible = False
  end
  object OpenDialog1: TOpenDialog
    Left = 16
    Top = 32
  end
  object HalcyonDataSet1: THalcyonDataSet
    AutoFlush = False
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 424
    Top = 40
  end
  object StoredProc: TpFIBStoredProc
    Left = 376
    Top = 72
  end
end
