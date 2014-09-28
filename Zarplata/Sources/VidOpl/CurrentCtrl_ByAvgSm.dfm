object FAvgDaysSm: TFAvgDaysSm
  Left = 414
  Top = 317
  BorderStyle = bsNone
  Caption = 'FAvgDaysSm'
  ClientHeight = 285
  ClientWidth = 428
  Color = clGradientActiveCaption
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
    Width = 428
    Height = 55
    Align = alTop
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 0
    Top = 256
    Width = 428
    Height = 29
    Align = alBottom
    Shape = bsFrame
  end
  object LabelData: TcxLabel
    Left = 8
    Top = 8
    Width = 73
    Height = 17
    AutoSize = False
    TabOrder = 0
  end
  object EditData: TcxMaskEdit
    Left = 81
    Top = 6
    Width = 121
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '[-]?\d\d\d'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    OnExit = EditDataExit
  end
  object YesBtn: TcxButton
    Left = 264
    Top = 260
    Width = 75
    Height = 21
    Action = ActionYes
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 344
    Top = 260
    Width = 75
    Height = 21
    Action = ActionCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    LookAndFeel.Kind = lfFlat
  end
  object AvgSumEdit: TcxMaskEdit
    Left = 81
    Top = 30
    Width = 121
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    OnExit = AvgSumEditExit
  end
  object LabelAvg: TcxLabel
    Left = 8
    Top = 31
    Width = 73
    Height = 17
    AutoSize = False
    TabOrder = 5
    OnClick = LabelAvgClick
  end
  object Grid: TcxGrid
    Left = 0
    Top = 56
    Width = 428
    Height = 201
    TabOrder = 6
    object GridDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0.00;-0.00'
          Kind = skSum
          FieldName = 'SUMMA_COUNT'
          Column = GridClSummaCount
        end
        item
          Format = '0.00;-0.00'
          Kind = skSum
          FieldName = 'SUMMA'
          Column = GridClSumma
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.CellHints = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object GridClKodSm: TcxGridDBColumn
        Width = 43
        DataBinding.FieldName = 'SMETA_KOD'
      end
      object GridClNameSm: TcxGridDBColumn
        Width = 139
        DataBinding.FieldName = 'SMETA_TITLE'
      end
      object GridClSumma: TcxGridDBColumn
        Width = 85
        DataBinding.FieldName = 'SUMMA'
      end
      object GridClSummaCount: TcxGridDBColumn
        Width = 84
        DataBinding.FieldName = 'SUMMA_COUNT'
      end
    end
    object GridLevel1: TcxGridLevel
      GridView = GridDBTableView1
    end
  end
  object LabelAllSum: TcxLabel
    Left = 216
    Top = 8
    Width = 209
    Height = 41
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -24
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 7
    Caption = ''
  end
  object ActionList: TActionList
    Left = 8
    Top = 248
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      OnExecute = ActionYesExecute
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
    object ActionAvg: TAction
      Caption = 'ActionAvg'
      ShortCut = 32
    end
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 96
  end
  object StProcTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 40
    Top = 128
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StProcTransaction
    Left = 8
    Top = 128
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 192
    Top = 104
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 160
    Top = 104
  end
  object DataSource: TDataSource
    DataSet = DSet
    Left = 224
    Top = 104
  end
end
