object BankNichAddSm: TBankNichAddSm
  Left = 677
  Top = 498
  BorderStyle = bsDialog
  Caption = #1042#1080#1073#1110#1088' '#1075#1088#1091#1087#1080' '#1073#1102#1076#1078#1077#1090#1110#1074
  ClientHeight = 430
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = -8
    Top = 0
    Width = 601
    Height = 361
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        SortOrder = soAscending
        Width = 179
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Width = 181
      end
      object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Width = 239
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        Caption = 'Custom 1'
        DockedDockingStyle = dsBottom
        DockedLeft = 448
        DockedTop = 0
        DockingStyle = dsBottom
        FloatLeft = 352
        FloatTop = 401
        FloatClientWidth = 0
        FloatClientHeight = 0
        ItemLinks = <
          item
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton2
            Visible = True
          end>
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 24
    Top = 296
    DockControlHeights = (
      0
      0
      0
      46)
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = #1042#1080#1073#1088#1072#1090#1080
      Category = 0
      Hint = #1042#1080#1073#1088#1072#1090#1080
      Visible = ivAlways
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = #1042#1110#1076#1084#1110#1085#1072
      Category = 0
      Hint = #1042#1110#1076#1084#1110#1085#1072
      Visible = ivAlways
    end
  end
  object WorkDatabase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 536
    Top = 104
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 504
    Top = 144
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 424
    Top = 192
    poSQLINT64ToBCD = True
  end
end
