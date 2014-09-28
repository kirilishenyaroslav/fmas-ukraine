object ZFVidOplControl: TZFVidOplControl
  Left = 371
  Top = 225
  BorderStyle = bsDialog
  Caption = 'ZFVidOplControl'
  ClientHeight = 491
  ClientWidth = 480
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
  object IdentificationBox: TcxGroupBox
    Left = 0
    Top = 0
    Width = 473
    Height = 105
    Alignment = alTopLeft
    Caption = 'IdentificationBox'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    LookAndFeel.NativeStyle = False
    ParentFont = False
    TabOrder = 0
    TabStop = False
    object Bevel1: TBevel
      Left = 8
      Top = 46
      Width = 457
      Height = 3
      Style = bsRaised
    end
    object KodLabel: TcxLabel
      Left = 8
      Top = 21
      Width = 81
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object NameLabel: TcxLabel
      Left = 8
      Top = 51
      Width = 409
      Height = 20
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object KodEdit: TcxMaskEdit
      Left = 88
      Top = 19
      Width = 65
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+ | NULL'
      Properties.MaxLength = 0
      TabOrder = 0
    end
    object NameEdit: TcxMaskEdit
      Left = 8
      Top = 72
      Width = 457
      Height = 24
      TabOrder = 1
    end
    object Kod1DFEdit: TcxMaskEdit
      Left = 239
      Top = 18
      Width = 65
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+ | NULL'
      Properties.MaxLength = 0
      TabOrder = 4
    end
    object cxLabel2: TcxLabel
      Left = 308
      Top = 20
      Width = 49
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Caption = #1064#1080#1092#1088
    end
    object shifr: TcxMaskEdit
      Left = 356
      Top = 18
      Width = 107
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.MaxLength = 10
      TabOrder = 6
    end
  end
  object OptionsBox: TcxGroupBox
    Left = 0
    Top = 104
    Width = 473
    Height = 201
    Alignment = alTopLeft
    Caption = 'OptionsBox'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TabStop = False
    object Bevel2: TBevel
      Left = 8
      Top = 70
      Width = 457
      Height = 3
      Style = bsRaised
    end
    object Bevel3: TBevel
      Left = 8
      Top = 134
      Width = 457
      Height = 3
      Style = bsRaised
    end
    object TypeNachislLabel: TcxLabel
      Left = 8
      Top = 82
      Width = 257
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Visible = False
      Caption = 'TypeNachislLabel'
    end
    object CheckNachisl: TcxCheckBox
      Left = 8
      Top = 16
      Width = 409
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.ValueChecked = 'T'
      Properties.ValueUnchecked = 'F'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object CheckCash: TcxCheckBox
      Left = 8
      Top = 41
      Width = 409
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.ValueChecked = 'T'
      Properties.ValueUnchecked = 'F'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object TypeFundLabel: TcxLabel
      Left = 8
      Top = 106
      Width = 257
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
      Caption = 'TypeFundLabel'
    end
    object GroupEdit: TcxButtonEdit
      Left = 8
      Top = 168
      Width = 457
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.ReadOnly = True
      Properties.OnButtonClick = GroupEditPropertiesButtonClick
      TabOrder = 4
    end
    object GroupLabel: TcxLabel
      Left = 8
      Top = 146
      Width = 409
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Caption = 'GroupLabel'
    end
    object TypeNachislEdit: TcxLookupComboBox
      Left = 264
      Top = 80
      Width = 202
      Height = 24
      Properties.ListColumns = <>
      Properties.ListOptions.ShowHeader = False
      Properties.ReadOnly = False
      EditValue = 0
      TabOrder = 6
      Visible = False
    end
    object TypeFundEdit: TcxLookupComboBox
      Left = 264
      Top = 104
      Width = 202
      Height = 24
      Properties.ListColumns = <>
      Properties.ListOptions.ShowHeader = False
      Properties.ReadOnly = False
      EditValue = 0
      TabOrder = 7
    end
  end
  object YesBtn: TcxButton
    Left = 152
    Top = 456
    Width = 81
    Height = 25
    Action = Action1
    TabOrder = 3
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 240
    Top = 456
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object PeriodBox: TcxGroupBox
    Left = 0
    Top = 304
    Width = 473
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
      EditValue = 73050d
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
  object Kod1DFLabel: TcxLabel
    Left = 157
    Top = 21
    Width = 83
    Height = 20
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clMaroon
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
    Caption = 'Kod1DFLabel'
  end
  object TypeBox: TcxGroupBox
    Left = -1
    Top = 384
    Width = 473
    Height = 73
    Alignment = alTopLeft
    Caption = 'TypeBox'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    TabStop = False
    object TypeEdit: TcxButtonEdit
      Left = 8
      Top = 40
      Width = 457
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.ReadOnly = True
      Properties.OnButtonClick = TypeEditPropertiesButtonClick
      TabOrder = 0
    end
    object TypeLabel: TcxLabel
      Left = 8
      Top = 18
      Width = 409
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = 'TypeLabel'
    end
  end
  object DSourceFund: TDataSource
    DataSet = DSetFund
    Left = 344
    Top = 112
  end
  object DSourceNachisl: TDataSource
    DataSet = DSetNachisl
    Left = 312
    Top = 112
  end
  object DataBase: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 184
    Top = 112
  end
  object DSetNachisl: TpFIBDataSet
    Database = DataBase
    Transaction = DefaultTransaction
    Left = 216
    Top = 112
    poSQLINT64ToBCD = True
  end
  object DSetFund: TpFIBDataSet
    Database = DataBase
    Transaction = DefaultTransaction
    Left = 248
    Top = 112
    poSQLINT64ToBCD = True
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 280
    Top = 112
  end
  object ActionList1: TActionList
    Left = 376
    Top = 384
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
  end
end
