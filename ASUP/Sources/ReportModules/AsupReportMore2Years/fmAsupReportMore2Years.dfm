object FormOptions: TFormOptions
  Left = 223
  Top = 207
  BorderStyle = bsDialog
  Caption = 'FormOptions'
  ClientHeight = 130
  ClientWidth = 477
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
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 477
    Height = 89
    Align = alTop
    Shape = bsFrame
  end
  object YesBtn: TcxButton
    Left = 280
    Top = 104
    Width = 91
    Height = 22
    Action = YesAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 376
    Top = 104
    Width = 89
    Height = 22
    Action = CancelAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object EditDepartment: TcxButtonEdit
    Left = 6
    Top = 27
    Width = 467
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = EditDepartmentPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object LabelDepartment: TcxLabel
    Left = 8
    Top = 7
    Width = 465
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
  end
  object CheckBoxWithChild: TcxCheckBox
    Left = 6
    Top = 48
    Width = 467
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    State = cbsChecked
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
  end
  object LabelDateForm: TcxLabel
    Left = 8
    Top = 66
    Width = 336
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
  end
  object DateEdit: TcxDateEdit
    Left = 352
    Top = 64
    Width = 122
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DateButtons = [btnToday]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
  end
  object ActionList: TActionList
    Left = 16
    Top = 96
    object YesAction: TAction
      Caption = 'YesAction'
      ShortCut = 16464
      OnExecute = YesActionExecute
    end
    object CancelAction: TAction
      Caption = 'CancelAction'
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
    object DesRep: TAction
      Caption = 'DesRep'
      OnExecute = DesRepExecute
    end
  end
  object DB: TpFIBDatabase
    DefaultTransaction = Tran
    DefaultUpdateTransaction = Tran
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 56
    Top = 96
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = Tran
    Left = 88
    Top = 96
    poSQLINT64ToBCD = True
  end
  object Tran: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 120
    Top = 96
  end
end
