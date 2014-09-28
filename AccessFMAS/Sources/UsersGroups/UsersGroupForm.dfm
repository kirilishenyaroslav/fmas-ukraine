object FormUsersGroup: TFormUsersGroup
  Left = 478
  Top = 242
  Width = 723
  Height = 450
  Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110' '#1090#1072' '#1075#1088#1091#1087#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object ToolBarGroupUser: TToolBar
    Left = 0
    Top = 0
    Width = 707
    Height = 40
    AutoSize = True
    ButtonHeight = 36
    ButtonWidth = 63
    EdgeBorders = [ebTop, ebBottom]
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Images = DMMain.RowImageList
    ParentFont = False
    ShowCaptions = True
    TabOrder = 0
    Wrapable = False
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = Add
      ImageIndex = 3
    end
    object ToolButton2: TToolButton
      Left = 63
      Top = 0
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Action = Edit
      ImageIndex = 4
    end
    object DeleteButton: TToolButton
      Left = 126
      Top = 0
      Action = Del
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ImageIndex = 7
    end
    object ToolButton3: TToolButton
      Left = 189
      Top = 0
      Action = AddTo
      ImageIndex = 5
    end
    object ToolButton5: TToolButton
      Left = 252
      Top = 0
      Action = DelFrom
      ImageIndex = 6
    end
    object Print: TToolButton
      Left = 315
      Top = 0
      Caption = #1044#1088#1091#1082
      ImageIndex = 8
      OnClick = PrintClick
    end
  end
  object TabControlGroupUser: TTabControl
    Left = 0
    Top = 40
    Width = 707
    Height = 353
    Align = alClient
    TabOrder = 1
    Tabs.Strings = (
      #1043#1088#1091#1087#1080
      #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110)
    TabIndex = 0
    OnChange = TabControlGroupUserChange
    object Splitter1: TSplitter
      Left = 353
      Top = 27
      Height = 322
    end
    object cxGrid1: TcxGrid
      Left = 356
      Top = 27
      Width = 347
      Height = 322
      Align = alClient
      TabOrder = 0
      object DBGridDetail: TcxGridDBTableView
        DataController.DataSource = DataSourceDetail
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
        Styles.ContentOdd = cxStyle1
        object detail_ID: TcxGridDBColumn
          Visible = False
        end
        object detail_NAME: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          SortOrder = soAscending
          Width = 194
          DataBinding.FieldName = 'NAME'
        end
        object detail_FULL_NAME: TcxGridDBColumn
          Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 289
          DataBinding.FieldName = 'FULL_NAME'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = DBGridDetail
      end
    end
    object cxGrid2: TcxGrid
      Left = 4
      Top = 27
      Width = 349
      Height = 322
      Align = alLeft
      TabOrder = 1
      object DBGridMain: TcxGridDBTableView
        DataController.DataSource = DataSourceMain
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
        Styles.ContentOdd = cxStyle1
        object ID: TcxGridDBColumn
          Visible = False
          Width = 62
        end
        object NAME: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          SortOrder = soAscending
          Width = 110
          DataBinding.FieldName = 'NAME'
        end
        object FULL_NAME: TcxGridDBColumn
          Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 163
          DataBinding.FieldName = 'FULL_NAME'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = DBGridMain
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 393
    Width = 707
    Height = 19
    Panels = <>
  end
  object DataSourceMain: TDataSource
    DataSet = DSetMain
    Left = 136
    Top = 149
  end
  object DataSourceDetail: TDataSource
    DataSet = DSetDetail
    Left = 432
    Top = 149
  end
  object ActionListUsersGroup: TActionList
    Images = DMMain.KruAccImageList
    Left = 600
    Top = 149
    object Add: TAction
      Category = 'UserGroups'
      Caption = #1044#1086#1076#1072#1090#1080
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 45
      OnExecute = AddExecute
    end
    object Edit: TAction
      Category = 'UserGroups'
      Caption = #1047#1084#1110#1085#1080#1090#1080
      ShortCut = 113
      OnExecute = EditExecute
    end
    object Del: TAction
      Category = 'UserGroups'
      Caption = 'Del'
      ShortCut = 46
      OnExecute = DeleteExecute
    end
    object AddTo: TAction
      Category = 'UserGroups'
      Caption = '+ '#1074' '#1075#1088#1091#1087#1091
      OnExecute = AddToExecute
    end
    object DelFrom: TAction
      Category = 'UserGroups'
      Caption = '- '#1079' '#1075#1088#1091#1087#1080
      OnExecute = DelFromExecute
    end
    object Esc: TAction
      Caption = 'Esc'
      OnExecute = EscExecute
    end
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 16
    Top = 120
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 16
    Top = 160
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clScrollBar
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'DSetMain'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_ROLE=ID_ROLE'
      'NAME=NAME'
      'FULL_NAME=FULL_NAME')
    DataSet = DSetMain
    Left = 264
    Top = 104
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40009.613214155100000000
    ReportOptions.LastChange = 40129.651295567130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 296
    Top = 104
    Datasets = <
      item
        DataSet = frxDBDataset2
        DataSetName = 'DSetDetail'
      end
      item
        DataSet = frxDBDataset1
        DataSetName = 'DSetMain'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 5.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 34.015770000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          HAlign = haCenter
          Memo.Strings = (
            '[REP_TITLE]')
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'DSetMain'
        PrintIfDetailEmpty = True
        RowCount = 0
        Stretched = True
        object Memo10: TfrxMemoView
          Top = 0.000000000000028422
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = clSilver
        end
        object Memo3: TfrxMemoView
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [DSetMain."NAME"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 207.874150000000000000
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [DSetMain."FULL_NAME"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baRight
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
      end
      object DetailData1: TfrxDetailData
        Height = 18.897650000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'DSetDetail'
        RowCount = 0
        Stretched = True
        object Memo4: TfrxMemoView
          Left = 94.488250000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset2
          DataSetName = 'DSetDetail'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [DSetDetail."NAME"]')
        end
        object Memo5: TfrxMemoView
          Left = 302.362400000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset2
          DataSetName = 'DSetDetail'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [DSetDetail."FULL_NAME"]')
        end
        object Line1: TfrxLineView
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 37.795300000000000000
        Top = 75.590600000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [Name1]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 94.488250000000000000
          Top = 18.897650000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [Name2]')
        end
        object Memo8: TfrxMemoView
          Left = 207.874150000000000000
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [Full_Name1]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 302.362400000000000000
          Top = 18.897650000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            ' [Full_Name2]')
        end
        object Line3: TfrxLineView
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line4: TfrxLineView
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line6: TfrxLineView
          Left = 718.110236220471900000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line7: TfrxLineView
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object Footer1: TfrxFooter
        Height = 0.755905511811024000
        Top = 257.008040000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Width = 94.488250000000000000
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'DSetDetail'
    CloseDataSource = False
    FieldAliases.Strings = (
      '-ID_USER=ID_USER'
      'NAME=NAME'
      '-PASSWD=PASSWD'
      'FULL_NAME=FULL_NAME'
      '-ID_USER_EXT=ID_USER_EXT'
      '-PASSWD_MD5_HASH=PASSWD_MD5_HASH'
      '-IS_ENABLED=IS_ENABLED'
      'ID_ROLE=ID_ROLE')
    DataSet = DSetDetail
    Left = 232
    Top = 104
  end
  object DSetMain: TpFIBDataSet
    Database = DMMain.WorkDatabase
    Transaction = DMMain.FReadTransaction
    SelectSQL.Strings = (
      'select * from roles')
    AfterScroll = DSetMainAfterScroll
    Left = 136
    Top = 176
    poSQLINT64ToBCD = True
  end
  object DSetDetail: TpFIBDataSet
    Database = DMMain.WorkDatabase
    Transaction = DMMain.FReadTransaction
    SelectSQL.Strings = (
      'select u.*,  ur.id_role'
      '  from ACCESS_USER_SELECT u, users_roles ur'
      ' where ur.id_user = u.id_user'
      '   and ur.id_role = ?ID_ROLE')
    DataSource = DataSourceMain
    Left = 432
    Top = 176
    poSQLINT64ToBCD = True
  end
end
