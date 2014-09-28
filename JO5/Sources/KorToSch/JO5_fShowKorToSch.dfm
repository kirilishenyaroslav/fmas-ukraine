object fKorToSch: TfKorToSch
  Left = 337
  Top = 192
  BorderStyle = bsDialog
  Caption = 'fKorToSch'
  ClientHeight = 480
  ClientWidth = 642
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
  object ActionPnl: TPanel
    Left = 0
    Top = 0
    Width = 642
    Height = 44
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object DetailsBtn: TcxButton
      Left = 400
      Top = 7
      Width = 110
      Height = 32
      Action = DetailsAction
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Colors.Normal = 13160660
      Colors.Hot = 16247513
      Colors.Pressed = 16619863
    end
    object KorTypeRG: TRadioGroup
      Left = 0
      Top = 2
      Width = 209
      Height = 37
      Caption = ' '#1054#1073#1077#1088#1110#1090#1100' '#1090#1080#1087' '#1082#1086#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1110#1111' '
      Columns = 2
      Ctl3D = False
      ItemIndex = 1
      Items.Strings = (
        #1044#1077#1073#1077#1090#1086#1074#1072
        #1050#1088#1077#1076#1080#1090#1086#1074#1072)
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = KorTypeRGClick
    end
    object ExitBtn: TcxButton
      Left = 520
      Top = 7
      Width = 110
      Height = 32
      Action = ExitAction
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Colors.Normal = 13160660
      Colors.Hot = 16247513
      Colors.Pressed = 16619863
    end
    object ShowTypeRG: TRadioGroup
      Left = 216
      Top = 2
      Width = 177
      Height = 37
      Caption = ' '#1054#1073#1077#1088#1110#1090#1100' '#1090#1080#1087' '#1076#1072#1085#1080#1093' '
      Columns = 2
      Ctl3D = False
      ItemIndex = 0
      Items.Strings = (
        #1056#1072#1093#1091#1085#1082#1080
        #1044#1086#1082#1091#1084#1077#1085#1090#1080)
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ShowTypeRGClick
    end
  end
  object KorTreeList: TcxDBTreeList
    Left = 0
    Top = 44
    Width = 642
    Height = 436
    Align = alClient
    Bands = <
      item
        Caption.Text = 'Band1'
        Width = 150
      end>
    BufferedPaint = True
    DataController.DataSource = DSource1
    DataController.ParentField = 'OUT_ID_PARENT_SCH'
    DataController.KeyField = 'OUT_ID_SCH'
    OptionsBehavior.CellHints = True
    OptionsBehavior.ConfirmDelete = False
    OptionsBehavior.ExpandOnIncSearch = True
    OptionsBehavior.IncSearch = True
    OptionsCustomizing.BandVertSizing = False
    OptionsCustomizing.ColumnVertSizing = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsSelection.CellSelect = False
    OptionsView.CellEndEllipsis = True
    OptionsView.ColumnAutoWidth = True
    OptionsView.ExtPaintStyle = True
    OptionsView.Footer = True
    OptionsView.GridLines = tlglBoth
    OptionsView.Indicator = True
    OptionsView.IndicatorWidth = 10
    RootValue = 0
    TabOrder = 1
    object cmnOUT_ID_SCH: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      DataBinding.FieldName = 'OUT_ID_SCH'
      Options.Footer = True
      Options.Editing = False
      Position.ColIndex = 7
      Position.RowIndex = 0
      Position.BandIndex = 0
      SummaryFooter.Format = '#,##0.00'
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      Visible = False
    end
    object cmnOUT_ID_PARENT_SCH: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      DataBinding.FieldName = 'OUT_ID_PARENT_SCH'
      Options.Footer = True
      Options.Editing = False
      Position.ColIndex = 8
      Position.RowIndex = 0
      Position.BandIndex = 0
      SummaryFooter.Format = '#,##0.00'
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      Visible = False
    end
    object cmnOUT_SCH_NUMBER: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #8470
      DataBinding.FieldName = 'OUT_SCH_NUMBER'
      Options.Footer = True
      Options.Editing = False
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
      SummaryFooter.Kind = skCount
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      SummaryFooter.FieldName = 'OUT_SCH_NUMBER'
      Width = 111
    end
    object cmnOUT_SCH_TITLE: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1053#1072#1079#1074#1072
      DataBinding.FieldName = 'OUT_SCH_TITLE'
      Options.Editing = False
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      SummaryFooter.Format = '#,##0.00'
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      Width = 393
    end
    object cmnOUT_SUMMA: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1057#1091#1084#1072
      DataBinding.FieldName = 'OUT_SUMMA'
      Options.Footer = True
      Options.Editing = False
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      SummaryFooter.Format = '#,##0.00'
      SummaryFooter.Kind = skSum
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      SummaryFooter.FieldName = 'OUT_SUMMA'
      Width = 126
    end
    object cmnOUT_ID_DOC: TcxDBTreeListColumn
      PropertiesClassName = 'TcxTextEditProperties'
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = 'OUT_ID_DOC'
      DataBinding.FieldName = 'OUT_ID_DOC'
      Position.ColIndex = 6
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 62
    end
    object cmnOUT_DOC_NUMBER: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #8470
      DataBinding.FieldName = 'OUT_DOC_NUMBER'
      Options.Footer = True
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      SummaryFooter.Kind = skCount
      SummaryFooter.AlignHorz = taRightJustify
      SummaryFooter.AlignVert = vaBottom
      SummaryFooter.FieldName = 'OUT_DOC_NUMBER'
      Visible = False
      Width = 73
    end
    object cmnOUT_DOC_NOTE: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1055#1088#1080#1084#1110#1090#1082#1072
      DataBinding.FieldName = 'OUT_DOC_NOTE'
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 345
    end
    object cmnOUT_DOC_DATE: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1044#1072#1090#1072
      DataBinding.FieldName = 'OUT_DOC_DATE'
      Position.ColIndex = 5
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 86
    end
  end
  object DB: TpFIBDatabase
    DBName = 'E:\Alex\GOVERMENT\DB\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 368
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    SelectSQL.Strings = (
      'SELECT'
      '    OUT_ID_DOC,'
      '    OUT_SUMMA,'
      '    OUT_DOC_NOTE,'
      '    OUT_DOC_NUMBER,'
      '    OUT_DOC_DATE'
      'FROM'
      '    JO5_GET_ALL_GROUP_DOCS'
      '    ('
      '    5,'
      '    1101,'
      '    '#39'1.09.2005'#39','
      '    1,'
      '    0'
      '    ) ')
    Left = 56
    Top = 408
    poSQLINT64ToBCD = True
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 56
    Top = 368
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 96
    Top = 408
  end
  object ActionList1: TActionList
    Left = 336
    Top = 216
    object DetailsAction: TAction
      Caption = 'DetailsAction'
      ShortCut = 32
      OnExecute = DetailsActionExecute
    end
    object PrintAction: TAction
      Caption = 'PrintAction'
    end
    object ExitAction: TAction
      Caption = 'ExitAction'
      ShortCut = 27
      OnExecute = ExitActionExecute
    end
  end
end
