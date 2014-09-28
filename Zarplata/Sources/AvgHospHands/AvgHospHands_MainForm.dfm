object FAvgHospHands: TFAvgHospHands
  Left = 302
  Top = 217
  BorderStyle = bsDialog
  Caption = 'FAvgHospHands'
  ClientHeight = 104
  ClientWidth = 306
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroupTypeCount: TcxRadioGroup
    Left = 0
    Top = -2
    Width = 305
    Height = 35
    ItemIndex = 0
    ParentFont = False
    Properties.Columns = 2
    Properties.Items = <
      item
      end
      item
      end>
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Caption = ''
  end
  object YesBtn: TcxButton
    Left = 128
    Top = 78
    Width = 75
    Height = 25
    Action = YesBtnAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 216
    Top = 78
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'CancelBtn'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 32
    Width = 305
    Height = 41
    Alignment = alTopLeft
    TabOrder = 3
    object LabelAvgSum: TcxLabel
      Left = 0
      Top = 16
      Width = 113
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object EditAvgSumma: TcxMaskEdit
      Left = 118
      Top = 14
      Width = 179
      Height = 21
      ParentFont = False
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
      Properties.MaxLength = 0
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
  end
  object DB: TpFIBDatabase
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 8
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 16
    Top = 40
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = Transaction
    Left = 16
    Top = 72
  end
  object ActionList1: TActionList
    Left = 56
    Top = 8
    object YesBtnAction: TAction
      Caption = 'YesBtnAction'
      ShortCut = 121
      OnExecute = YesBtnActionExecute
    end
  end
end
