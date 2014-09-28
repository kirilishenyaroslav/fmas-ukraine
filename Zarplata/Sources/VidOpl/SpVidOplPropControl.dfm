object ZFVidOplPropControl: TZFVidOplPropControl
  Left = 471
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'ZFVidOplPropControl'
  ClientHeight = 130
  ClientWidth = 425
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
  object YesBtn: TcxButton
    Left = 104
    Top = 95
    Width = 81
    Height = 25
    Caption = 'Yes'
    ModalResult = 6
    TabOrder = 0
    OnClick = YesBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 256
    Top = 95
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object PeriodBox: TcxGroupBox
    Left = 0
    Top = -1
    Width = 425
    Height = 81
    Alignment = alTopLeft
    Caption = 'PeriodBox'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    TabStop = False
    object DateEnd: TcxDateEdit
      Left = 256
      Top = 48
      Width = 97
      Height = 24
      Properties.DateOnError = deToday
      TabOrder = 1
      EditValue = 0d
    end
    object DateBeg: TcxDateEdit
      Left = 319
      Top = 15
      Width = 97
      Height = 24
      Properties.DateButtons = [btnToday]
      TabOrder = 0
      EditValue = 0d
    end
    object DateBegLabel: TcxLabel
      Left = 8
      Top = 19
      Width = 305
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object DateEndLabel: TcxLabel
      Left = 8
      Top = 52
      Width = 241
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
  end
end
