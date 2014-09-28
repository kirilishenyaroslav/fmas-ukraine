object ZF1dfFirmControl: TZF1dfFirmControl
  Left = 376
  Top = 138
  BorderStyle = bsDialog
  Caption = 'ZF1dfFirmControl'
  ClientHeight = 385
  ClientWidth = 498
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
  object DirectorBox: TcxGroupBox
    Left = 0
    Top = 72
    Width = 497
    Height = 89
    Alignment = alTopLeft
    Caption = 'DirectorBox'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    LookAndFeel.NativeStyle = False
    ParentFont = False
    TabOrder = 0
    TabStop = False
    object LabelDirectorTin: TcxLabel
      Left = 8
      Top = 24
      Width = 121
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
    end
    object ButtonEditDirectorTin: TcxButtonEdit
      Left = 136
      Top = 24
      Width = 129
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = ButtonEditDirectorTinPropertiesButtonClick
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object LabelDirector: TcxLabel
      Left = 8
      Top = 56
      Width = 109
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
    end
    object EditDirector: TcxLabel
      Left = 119
      Top = 56
      Width = 370
      Height = 21
      AutoSize = False
      ParentColor = False
      ParentFont = False
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Caption = ''
    end
    object LabelDirectorTel: TcxLabel
      Left = 268
      Top = 24
      Width = 89
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 4
    end
    object MaskEditDirectorTel: TcxMaskEdit
      Left = 360
      Top = 24
      Width = 129
      Height = 21
      ParentFont = False
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
  end
  object YesBtn: TcxButton
    Left = 128
    Top = 352
    Width = 81
    Height = 25
    Action = Action1
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 280
    Top = 352
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object GlavBuhgBox: TcxGroupBox
    Left = 0
    Top = 160
    Width = 497
    Height = 89
    Alignment = alTopLeft
    Caption = 'GlavBuhgBox'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    TabStop = False
    object ButtonEditGlBuhgTin: TcxButtonEdit
      Left = 135
      Top = 24
      Width = 129
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = ButtonEditGlBuhgTinPropertiesButtonClick
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object LabelGlBuhgTin: TcxLabel
      Left = 8
      Top = 24
      Width = 121
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
    end
    object LabelGlBuhgTel: TcxLabel
      Left = 267
      Top = 24
      Width = 89
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
    end
    object MaskEditGlBuhgTel: TcxMaskEdit
      Left = 359
      Top = 24
      Width = 129
      Height = 21
      ParentFont = False
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object LabelglBuhg: TcxLabel
      Left = 8
      Top = 56
      Width = 108
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 4
    end
    object EditGlBuhg: TcxLabel
      Left = 118
      Top = 56
      Width = 371
      Height = 21
      AutoSize = False
      ParentColor = False
      ParentFont = False
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Caption = ''
    end
  end
  object NameBox: TcxGroupBox
    Left = 0
    Top = 0
    Width = 497
    Height = 73
    Alignment = alTopLeft
    Caption = 'DirectorBox'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    LookAndFeel.NativeStyle = False
    ParentFont = False
    TabOrder = 4
    TabStop = False
    object LabelShortName: TcxLabel
      Left = 8
      Top = 25
      Width = 105
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
    end
    object MaskEditShortName: TcxMaskEdit
      Left = 120
      Top = 23
      Width = 369
      Height = 21
      ParentFont = False
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object LabelFullName: TcxLabel
      Left = 8
      Top = 49
      Width = 105
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
    end
    object MaskEditFullName: TcxMaskEdit
      Left = 120
      Top = 47
      Width = 369
      Height = 21
      ParentFont = False
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
  end
  object PeriodBox: TcxGroupBox
    Left = 0
    Top = 248
    Width = 497
    Height = 81
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    TabStop = False
    object MaskEditDPI: TcxMaskEdit
      Left = 120
      Top = 16
      Width = 121
      Height = 21
      ParentFont = False
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object LabelDPI: TcxLabel
      Left = 24
      Top = 16
      Width = 89
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
    end
    object LabelKodDPI: TcxLabel
      Left = 270
      Top = 16
      Width = 89
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
    end
    object MaskEditKodDPI: TcxMaskEdit
      Left = 366
      Top = 16
      Width = 121
      Height = 21
      ParentFont = False
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object LabelFileDa: TcxLabel
      Left = 270
      Top = 48
      Width = 89
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 4
    end
    object MaskEditFileDa: TcxMaskEdit
      Left = 366
      Top = 48
      Width = 121
      Height = 21
      ParentFont = False
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
    object LabelOkpo: TcxLabel
      Left = 8
      Top = 49
      Width = 105
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 6
    end
    object MaskEditOkpo: TcxMaskEdit
      Left = 119
      Top = 47
      Width = 121
      Height = 21
      ParentFont = False
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
    end
  end
  object DSourceFund: TDataSource
    DataSet = DSetFund
    Left = 48
    Top = 344
  end
  object DSourceNachisl: TDataSource
    DataSet = DSetNachisl
    Left = 392
    Top = 336
  end
  object DataBase: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 232
    Top = 336
  end
  object DSetNachisl: TpFIBDataSet
    Database = DataBase
    Transaction = DefaultTransaction
    Left = 296
    Top = 336
    poSQLINT64ToBCD = True
  end
  object DSetFund: TpFIBDataSet
    Database = DataBase
    Transaction = DefaultTransaction
    Left = 328
    Top = 336
    poSQLINT64ToBCD = True
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 360
    Top = 336
  end
  object ActionList1: TActionList
    Left = 264
    Top = 336
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
  end
end
