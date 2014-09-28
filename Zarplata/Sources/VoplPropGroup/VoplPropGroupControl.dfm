object FVoplPropGroupControl: TFVoplPropGroupControl
  Left = 293
  Top = 213
  BorderStyle = bsDialog
  Caption = 'FVoplPropGroupControl'
  ClientHeight = 146
  ClientWidth = 551
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
    Left = 8
    Top = 80
    Width = 537
    Height = 3
    Style = bsRaised
  end
  object Bevel2: TBevel
    Left = 8
    Top = 32
    Width = 537
    Height = 3
    Style = bsRaised
  end
  object Bevel3: TBevel
    Left = 8
    Top = 110
    Width = 537
    Height = 3
    Style = bsRaised
  end
  object MaskEditFullName: TcxMaskEdit
    Left = 8
    Top = 57
    Width = 537
    Height = 21
    ParentFont = False
    Properties.MaskKind = emkRegExpr
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 1
  end
  object LabelFullName: TcxLabel
    Left = 8
    Top = 33
    Width = 537
    Height = 24
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
  end
  object YesBtn: TcxButton
    Left = 178
    Top = 119
    Width = 81
    Height = 25
    Action = Action1
    TabOrder = 3
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 282
    Top = 119
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object LabelKod: TcxLabel
    Left = 6
    Top = 9
    Width = 459
    Height = 24
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
  end
  object MaskEditKod: TcxMaskEdit
    Left = 472
    Top = 10
    Width = 71
    Height = 21
    ParentFont = False
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '\d?\d?\d?\d?\d?\d?\d?\d?'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 0
  end
  object LabelType: TcxLabel
    Left = 6
    Top = 86
    Width = 275
    Height = 24
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
  end
  object ComboBoxFilter: TcxLookupComboBox
    Left = 288
    Top = 87
    Width = 257
    Height = 21
    ParentFont = False
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        FieldName = 'NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DSource
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 2
  end
  object ActionList1: TActionList
    Left = 512
    Top = 112
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
  end
  object DB: TpFIBDatabase
    DefaultTransaction = RTransaction
    DefaultUpdateTransaction = RTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 384
    Top = 112
  end
  object RTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 416
    Top = 112
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = RTransaction
    Left = 448
    Top = 112
    poSQLINT64ToBCD = True
  end
  object DSource: TDataSource
    DataSet = DSet
    Left = 480
    Top = 112
  end
end
