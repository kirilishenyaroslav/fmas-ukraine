object frmOAHistory: TfrmOAHistory
  Left = 374
  Top = 239
  BorderStyle = bsDialog
  Caption = #1030#1089#1090#1086#1088#1110#1103' '#1087#1088#1080#1074#39#1103#1079#1082#1080' '#1076#1110#1081' '#1076#1086' '#1086#1073#39#1108#1082#1090#1072
  ClientHeight = 238
  ClientWidth = 465
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
  object Panel1: TPanel
    Left = 0
    Top = 197
    Width = 465
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 368
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 0
      OnClick = cxButton1Click
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 465
    Height = 197
    Align = alClient
    TabOrder = 1
    object DBGridActions: TcxGridDBTableView
      DataController.DataSource = HDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object DBGridActionsDBColumn5: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072' '#1076#1110#1111
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 73
        DataBinding.FieldName = 'ACTION_NAME'
      end
      object DBGridActionsDBColumn1: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 108
        DataBinding.FieldName = 'NAME'
      end
      object DBGridActionsDBColumn3: TcxGridDBColumn
        Caption = #1044#1110#1103
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 86
        DataBinding.FieldName = 'ACTION_HST'
      end
      object DBGridActionsDBColumn4: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 80
        DataBinding.FieldName = 'DATE_TIME_HST'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = DBGridActions
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 32
  end
  object HDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 40
    Top = 32
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 72
    Top = 32
  end
  object HDataSource: TDataSource
    DataSet = HDataSet
    Left = 104
    Top = 32
  end
end