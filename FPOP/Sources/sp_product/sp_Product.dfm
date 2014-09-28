object sp_Product_Form: Tsp_Product_Form
  Left = 174
  Top = 175
  BorderStyle = bsDialog
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
  ClientHeight = 421
  ClientWidth = 782
  Color = clBtnFace
  Constraints.MinHeight = 150
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object MainPanel: TPanel
    Left = 0
    Top = 34
    Width = 432
    Height = 387
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TreeList: TcxDBTreeList
      Left = 0
      Top = 0
      Width = 432
      Height = 306
      BorderStyle = cxcbsNone
      Styles.StyleSheet = cxTreeListStyleSheet1
      Align = alClient
      Bands = <
        item
          Caption.Text = 'Band1'
          Width = 900
        end>
      BufferedPaint = False
      DataController.DataSource = DataSource
      DataController.ParentField = 'LINK_TO'
      DataController.KeyField = 'ID_TYPE_PRODUCT'
      OptionsBehavior.Sorting = False
      OptionsCustomizing.BandVertSizing = False
      OptionsCustomizing.ColumnMoving = False
      OptionsCustomizing.ColumnVertSizing = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      PopupMenu = PopupMenu
      RootValue = -1
      TabOrder = 0
      OnCustomDrawCell = TreeListCustomDrawCell
      OnDblClick = TreeListDblClick
      OnFocusedNodeChanged = TreeListChangeNode
      OnKeyPress = TreeListKeyPress
      object ID_TYPE_PRODUCT_COLUMN: TcxDBTreeListColumn
        Caption.Text = 'ID_TYPE_PRODUCT_PARAM'
        DataBinding.FieldName = 'ID_TYPE_PRODUCT'
        Options.Editing = False
        Options.Focusing = False
        Options.Sorting = False
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
      end
      object ID_PRODUCT_COLUMN: TcxDBTreeListColumn
        Caption.Text = 'ID_PRODUCT'
        DataBinding.FieldName = 'ID_PRODUCT'
        Options.Editing = False
        Options.Focusing = False
        Options.Sorting = False
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
        Width = 81
      end
      object NAME_COLUMN: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1053#1072#1079#1074#1072' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
        DataBinding.FieldName = 'NAME'
        Options.Editing = False
        Options.Focusing = False
        Options.Sorting = False
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 244
      end
      object ID_UNIT_MEAS_COLUMN: TcxDBTreeListColumn
        Caption.Text = 'ID_UNIT_MEAS'
        DataBinding.FieldName = 'ID_UNIT_MEAS'
        Options.Editing = False
        Options.Focusing = False
        Options.Sorting = False
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
      end
      object MAIN_PRODUCT_COLUMN: TcxDBTreeListColumn
        Caption.Text = 'MAIN_PRODUCT'
        DataBinding.FieldName = 'MAIN_PRODUCT'
        Options.Editing = False
        Options.Focusing = False
        Options.Sorting = False
        Position.ColIndex = 6
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
      end
      object NEED_CAT_CUST_COLUMN: TcxDBTreeListColumn
        Caption.Text = 'NEED_CAT_CUST'
        DataBinding.FieldName = 'NEED_CAT_CUST'
        Options.Editing = False
        Options.Focusing = False
        Options.Sorting = False
        Position.ColIndex = 7
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
      end
      object COST_CAN_CHANGE_COLUMN: TcxDBTreeListColumn
        Caption.Text = 'COST_CAN_CHANGE'
        DataBinding.FieldName = 'COST_CAN_CHANGE'
        Options.Editing = False
        Options.Focusing = False
        Options.Sorting = False
        Position.ColIndex = 8
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
      end
      object NEED_OBJECTS_COLUMN: TcxDBTreeListColumn
        Caption.Text = 'NEED_OBJECTS'
        DataBinding.FieldName = 'NEED_OBJECTS'
        Options.Editing = False
        Options.Focusing = False
        Options.Sorting = False
        Position.ColIndex = 9
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
      end
      object LINK_TO_PARAM_COLUMN: TcxDBTreeListColumn
        Caption.Text = 'LINK_TO_PARAM'
        DataBinding.FieldName = 'LINK_TO_PARAM'
        Options.Editing = False
        Options.Focusing = False
        Options.Sorting = False
        Position.ColIndex = 10
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
      end
      object NAME_UNIT_MEAS_COLUMN: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1053#1072#1079#1074#1072' '#1086#1076'. '#1074#1080#1084#1110#1088#1091
        DataBinding.FieldName = 'NAME_UNIT_MEAS'
        Options.Editing = False
        Options.Focusing = False
        Options.Sorting = False
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 97
      end
      object ID_DEPARTMENT_COLUMN: TcxDBTreeListColumn
        DataBinding.FieldName = 'ID_DEPARTMENT'
        Position.ColIndex = 11
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
      end
      object NAME_DEPARTMENT_COLUMN: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1055#1110#1076#1088#1086#1079#1076#1110#1083
        DataBinding.FieldName = 'NAME_DEPARTMENT'
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 91
      end
    end
    object BottomPanel: TPanel
      Left = 0
      Top = 306
      Width = 432
      Height = 81
      Align = alBottom
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 1
      object Label3: TLabel
        Left = 22
        Top = 4
        Width = 36
        Height = 13
        Caption = #1055#1086#1096#1091#1082':'
      end
      object SearchEdit: TcxTextEdit
        Left = 20
        Top = 18
        Width = 249
        Height = 21
        Properties.OnChange = SearchEditPropertiesChange
        Style.Color = clMoneyGreen
        TabOrder = 0
        OnKeyPress = SearchEditKeyPress
      end
      object CheckBox1: TcxCheckBox
        Left = 4
        Top = 39
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = True
        Properties.Caption = #1043#1086#1083#1086#1074#1085#1072' '#1087#1088#1086#1076#1091#1082#1094#1110#1103
        TabOrder = 1
      end
      object CheckBox2: TcxCheckBox
        Left = 4
        Top = 58
        Width = 177
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = True
        Properties.Caption = #1055#1086#1090#1088#1077#1073#1091#1108' '#1082#1072#1090#1077#1075#1086#1088#1110#1102' '#1087#1086#1082#1091#1087#1094#1103
        TabOrder = 2
      end
      object CheckBox4: TcxCheckBox
        Left = 189
        Top = 58
        Width = 193
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = True
        Properties.Caption = #1055#1086#1090#1088#1077#1073#1091#1108' '#1086#1073#39#1108#1082#1090' '#1074#1086#1076#1086#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
        TabOrder = 3
      end
      object CheckBox3: TcxCheckBox
        Left = 189
        Top = 39
        Width = 153
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = True
        Properties.Caption = #1062#1110#1085#1072' '#1084#1086#1078#1077' '#1079#1084#1110#1085#1102#1074#1072#1090#1080#1089#1103
        TabOrder = 4
      end
    end
  end
  object RightPanel: TPanel
    Left = 440
    Top = 34
    Width = 342
    Height = 387
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 5
    object DockControl: TdxBarDockControl
      Left = 0
      Top = 0
      Width = 342
      Height = 26
      Align = dalTop
      BarManager = BarManager
    end
    object CTreeList: TcxDBTreeList
      Left = 0
      Top = 26
      Width = 342
      Height = 361
      Styles.StyleSheet = cxTreeListStyleSheet1
      Align = alClient
      Bands = <
        item
          Caption.Text = 'Band1'
          Width = 569
        end>
      BufferedPaint = False
      DataController.DataSource = CDataSource
      DataController.ParentField = 'LINK_TO'
      DataController.KeyField = 'ID_CAT_CUST'
      OptionsBehavior.Sorting = False
      OptionsCustomizing.BandCustomizing = False
      OptionsCustomizing.ColumnCustomizing = False
      OptionsCustomizing.ColumnVertSizing = False
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.HeaderSingleLine = True
      RootValue = -1
      TabOrder = 1
      object CTreeListPK_ID: TcxDBTreeListColumn
        Caption.Text = 'PK_ID'
        DataBinding.FieldName = 'PK_ID'
        Position.ColIndex = 6
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
      end
      object CTreeListID_CAT_CUST: TcxDBTreeListColumn
        Caption.Text = 'ID_CAT_CUST'
        DataBinding.FieldName = 'ID_CAT_CUST'
        Position.ColIndex = 7
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
      end
      object CTreeListNAME_FIELD: TcxDBTreeListColumn
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1050#1072#1090#1077#1075#1086#1088#1110#1103' '#1089#1087#1086#1078#1080#1074#1072#1095#1072
        DataBinding.FieldName = 'NAME_FIELD'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 104
      end
      object CTreeListDISPLAY_ORDER: TcxDBTreeListColumn
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = 'DISPLAY_ORDER'
        DataBinding.FieldName = 'DISPLAY_ORDER'
        Position.ColIndex = 8
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
      end
      object CTreeListQNT_UNIT_MEAS: TcxDBTreeListColumn
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1086#1076'. '#1074#1080#1084#1110#1088#1091
        DataBinding.FieldName = 'QNT_UNIT_MEAS'
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 61
      end
      object CTreeListCOST: TcxDBTreeListColumn
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1042#1072#1088#1090#1110#1089#1090#1100
        DataBinding.FieldName = 'COST'
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 45
      end
      object CTreeListCOST_NDS: TcxDBTreeListColumn
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1042#1072#1088#1090#1110#1089#1090#1100' '#1079' '#1055#1044#1042
        DataBinding.FieldName = 'COST_NDS'
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 50
      end
      object CTreeListDATE_BEG: TcxDBTreeListColumn
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.SaveTime = False
        Properties.ShowTime = False
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
        DataBinding.FieldName = 'DATE_BEG'
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 40
      end
      object CTreeListDATE_END: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103
        DataBinding.FieldName = 'DATE_END'
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 40
      end
      object CTreeListLINK_TO: TcxDBTreeListColumn
        Caption.Text = 'LINK_TO'
        DataBinding.FieldName = 'LINK_TO'
        Position.ColIndex = 9
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
      end
    end
  end
  object Splitter: TcxSplitter
    Left = 432
    Top = 34
    Width = 8
    Height = 387
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 54
    AlignSplitter = salRight
    AutoSnap = True
    ResizeUpdate = True
    Control = RightPanel
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    GoToFirstRecordOnExecute = False
    Transaction = WTransaction
    Left = 464
    Top = 8
  end
  object Query: TpFIBQuery
    Database = Database
    Transaction = ReadTransaction
    BeforeExecute = QueryBeforeExecute
    Left = 493
    Top = 8
  end
  object PopupMenu: TPopupMenu
    Left = 16
    Top = 240
    object AddPopup: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080
      OnClick = AddPopupClick
    end
    object EditPopup: TMenuItem
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnClick = EditPopupClick
    end
    object DelPopup: TMenuItem
      Caption = #1047#1085#1080#1097#1080#1090#1080
      OnClick = DelPopupClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object RefreshPopup: TMenuItem
      Caption = #1042#1110#1076#1085#1086#1074#1080#1090#1080
      OnClick = RefreshPopupClick
    end
    object SelectPopup: TMenuItem
      Caption = #1054#1073#1088#1072#1090#1080
      OnClick = SelectPopupClick
    end
  end
  object ActionList: TActionList
    Left = 536
    Top = 8
    object ActionMod: TAction
      Caption = 'ModRecord'
      ShortCut = 115
      OnExecute = ActionModExecute
    end
    object ActionDel: TAction
      Caption = 'DeleteRecord'
      ShortCut = 119
      OnExecute = ActionDelExecute
    end
    object ActionAdd: TAction
      Caption = 'AddRecord'
      ShortCut = 118
      OnExecute = ActionAddExecute
    end
    object ActionSel: TAction
      Caption = 'SelectRecord'
      ShortCut = 123
      OnExecute = ActionSelExecute
    end
    object ActionRefresh: TAction
      Caption = 'ActionRefresh'
      ShortCut = 116
      OnExecute = ActionRefreshExecute
    end
    object ActionExit: TAction
      Caption = 'ActionExit'
      ShortCut = 27
      OnExecute = ActionExitExecute
    end
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 44
    Top = 160
  end
  object DataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    UpdateTransaction = WTransaction
    SelectSQL.Strings = (
      'select * from PROC_SP_PRODUCT_SEL')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 16
    Top = 160
    poSQLINT64ToBCD = True
  end
  object Report: TfrReport
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit, pbPageSetup]
    RebuildPrinter = True
    OnGetValue = ReportGetValue
    Left = 232
    Top = 234
    ReportForm = {19000000}
  end
  object RowDataset: TfrUserDataset
    Left = 260
    Top = 234
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'MainPanel'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = AddButton
            Visible = True
          end
          item
            Item = EditButton
            Visible = True
          end
          item
            Item = DelButton
            Visible = True
          end
          item
            Item = MoveUpButton
            Visible = True
          end
          item
            Item = MoveDownButton
            Visible = True
          end
          item
            Item = PreviewButton
            Visible = True
          end
          item
            Item = PrintButton
            Visible = True
          end
          item
            Item = RefreshButton
            Visible = True
          end
          item
            Item = SelectButton
            Visible = True
          end
          item
            Item = CloseButton
            Visible = True
          end>
        Name = 'MainPanel'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'CostBar'
        DockControl = DockControl
        DockedDockControl = DockControl
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 404
        FloatTop = 341
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = AddCostButton
            Visible = True
          end
          item
            Item = EditCostButton
            Visible = True
          end
          item
            Item = DelCostButton
            Visible = True
          end
          item
            Item = RefreshCostButton
            Visible = True
          end>
        Name = 'CostBar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
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
    Style = bmsOffice11
    UseSystemFont = True
    Left = 424
    Top = 8
    DockControlHeights = (
      0
      0
      34
      0)
    object AddButton: TdxBarLargeButton
      Caption = #1044#1086#1076#1072#1090#1080' '#1087#1088#1086#1076#1091#1082#1094#1110#1102' (F7)'
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1087#1088#1086#1076#1091#1082#1094#1110#1102' (F7)'
      Visible = ivAlways
      OnClick = AddButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FF92635DA46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769A46769A46769A46769A46769A46769A46769A46769FF00FFFF
        00FFFF00FFFF00FFFF00FF93655EEFD3B4F6DAB6F3D5ADF2D1A5F0CE9EEFCB97
        EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080EDC180EABF
        7F9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED4B8F4DABBF2D5B1F0
        D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9BD7FE9BD7FE9BD7F
        E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED7
        C0F6E0C1F2D9B8F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC58FEBC189EABF82E9
        BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FF
        FF00FF93655FEFDAC5F7E2C7F3DCBFF2D8B7F2D4B0F0D1AAEFCEA3EECB9CEDC7
        95EDC58FEBC189E9BD81E9BD7FE9BD7FE9BD7FEABF7FE7BC7E9F6F60FF00FFFF
        00FFFF00FFFF00FFFF00FF936560F0DECCF8E6CFF6E0C6F3DCBDF2D8B7F2D5B1
        EACCA6DDBF97D7B78DD6B387DBB685E5BC86E9BF82E9BD7FE9BD7FEABF7FE7BC
        7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2D3FAEAD7F6E3CEF4
        DEC5F3DCBFF2D8B8DEC4A4BAA284A89172A78E6EB89B75DBB685EBC189E9BD81
        E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF986963F2E6
        DAFAEEDEF7E7D4F6E2CBF4E0C5F3DCBF004B00004B00004B00004B00A78E6ED6
        B387EDC58FEBC189E9BD81EABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FF
        FF00FF9E6E64F4EAE1FBF2E6F8EADCF1E1CEE4D1BDDCCAB3004B000895110690
        0E004B00A18B6FC4A881D6B387D9B684E5BC85EABF82E7BB7E9F6F60FF00FFFF
        00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3E5D9CAC0B3A4AD9F8F
        004B000C9D190A9814004B0096826AA18B6EA78E6EB89B74D9B583EBC288E7BC
        809F6F60FF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3F0FEFBF6FBF3EB00
        4B00004B00004B00004B0011A6240EA11D004B00004B00004B00004B00A68E6E
        D6B386EDC58FE9BF879F6F62FF00FFFF00FFFF00FFFF00FFFF00FFAC7969FAF6
        F4FFFFFEFEF8F3004B0025C74720C1401CBA3818B23014AC2911A5220DA01C0A
        9A17004B00A89172D7B78DEEC996EAC18EA07063FF00FFFF00FFFF00FFFF00FF
        FF00FFB17E6BFAF6F4FFFFFFFFFEFB004B002CD35528CC4D23C5451FBF3E1BB7
        3517B02E13AB2710A520004B00BAA283DDBF95EECB9CEBC592A07264FF00FFFF
        00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFF004B00004B00004B00
        004B0027CB4B22C443004B00004B00004B00004B00E0C4A2EACCA5F0CFA3EDC9
        999D7065FF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFFFFFFFFFFFF
        FFFFFFFEFBFEF7F2004B002DD45829CF52004B00AD9F8EDEC8B1F3DABCF2D8B6
        F0D4AFEFD0A7CEB491896A63FF00FFFF00FFFF00FFFF00FFFF00FFC0896FFBF7
        F4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFB004B0034DE6530D95E004B00C0B3A4E4
        D1BCF6DEC4F3DCBDE5CEAFC4B096A1927F806762FF00FFFF00FFFF00FFFF00FF
        FF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF004B00004B00004B
        00004B00E6D9C9F2E2CFFAE9D0E0D0BAB8AB9AA79C8BA49786846964FF00FFFF
        00FFFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C49E675B98665B95655B96655B9665
        5B986859FF00FFFF00FFFF00FFFF00FFFF00FFCF9674FBF7F6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B69F675BDAA16B
        DD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FFFF00FFD49875FCF8
        F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFFFEF7DD
        C4BC9F675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFDDC7C29F675BEAB273EFA751A5686BFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CE9F675BEDB572A5686BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD39570E6C2ACE7C6B0E7C6B0E6
        C4B0E3C2B0E1C0AFDEBDADDCBCACD8BAACD5B7ABD3B5ABC099909F675BA5686B
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ShowCaption = False
    end
    object DelButton: TdxBarLargeButton
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080' '#1087#1088#1086#1076#1091#1082#1094#1110#1102' (F8)'
      Category = 0
      Hint = #1042#1080#1083#1091#1095#1080#1090#1080' '#1087#1088#1086#1076#1091#1082#1094#1110#1102' (F8)'
      Visible = ivAlways
      OnClick = DelButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FF0005B70005B70005
        B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FFFF00FF
        0005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FFFF
        00FFFF00FFFF00FF0005B70005B70005B70005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B700
        05B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006
        F60005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FF0005B700
        05B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FF0005
        B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B70005B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF0005B70005B70006F60005B70006F60005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70006F60005B7FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F60005B70005
        B70006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F6
        0005B70006F60006F60006F60005B70006F6FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60005B70006F6FF00FFFF00FF0006F60006F60006F60006F6FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0006F60006F60005B70006F60006F6FF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0006F6FF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006
        F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F6
        0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ShowCaption = False
    end
    object EditButton: TdxBarLargeButton
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1087#1088#1086#1076#1091#1082#1094#1110#1102' (F4)'
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1087#1088#1086#1076#1091#1082#1094#1110#1102' (F4)'
      Visible = ivAlways
      OnClick = EditButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF93655EA46769A46769A46769A46769A46769A46769A46769A46769A46769
        A46769A46769A46769A46769A46769A46769A46769A46769A46769FF00FFFF00
        FFFF00FFFF00FFFF00FF93655FEED4B8F4DABBF2D5B1EDCEA7E6C79DE1C093DE
        BB8CE1BB88E5BC84E7BC81E7BC7EE9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E
        9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED7C0F4DEC0F0D8B7E9CC
        ABD9BD99C9AD89C1A57FC6A67ED1AF7FDAB47FE1B77DE3BA7DE7BC7EE9BD7FE9
        BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEFDAC5
        F6E1C6F0D9BCE6CEAF2221233E39358C79609D8767AA8F6BB89A6FC7A474D1AB
        75DEB579E5BB7DE7BC7EEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF
        00FF936560F0DECCF7E5CEF4DEC5EAD4B63C38351F1F21182A33344344836F56
        8E77599E835FB29268C7A36FD9B176E3BA7DE7BC7EE7BC7E9F6F60FF00FFFF00
        FFFF00FFFF00FFFF00FF956660F2E2D3FAEAD7F6E3CEF0DAC2AC9D8A113B4E04
        689A064F750C3C523A494877644C897253A4865FBC9969D1AB73E1B779E3BA7B
        9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF986963F2E6DAFAEEDEF7E7D4F4E1
        CAEBD8BD1A3E4D036A9D0567981B506E2A34404135386A55427E694C987D58B2
        9163CCA66EDAB1779D6D5FFF00FFFF00FFFF00FFFF00FFFF00FF9E6E64F4EAE1
        FBF2E6F8EADCF7E6D3F3E0CA748686045983315065956060AA6E6E965D5D643B
        3A6552407663478E7451A9895DC09C6996695AFF00FFFF00FFFF00FFFF00FFFF
        00FFA37266F6EEE9FCF6EDF8EFE3F7EADAF7E6D3F0DDC90B41598C5B5BCC8E8E
        BB7E7EAA6E6E965C5C643B3A64513E6F5D43826C4B9A7E55865D51FF00FFFF00
        FFFF00FFFF00FFFF00FFA77568F8F3F0FEFBF6FBF3EBF8EEE3F8EBDCF6E6D14E
        6C769C6969DD9D9DCB8C8CBA7D7DA96D6D9159595A353462503D6A58417B6648
        735046FF00FFFF00FFFF00FFFF00FFFF00FFAC7969FAF6F4FFFFFEFEF8F3FBF2
        EAF8EEE3F8EBDAF4E3D07B504FE2A4A4DC9D9DCA8C8CBA7D7DA96D6D8C57575A
        3534604F3D6C594162443CFF00FFFF00FFFF00FFFF00FFFF00FFB17E6BFAF6F4
        FFFFFFFFFEFBFEF7F0FBF3EAFAEFE3F8EADAE1CCBB7B504FE2A3A3DC9C9CCA8B
        8BB87B7BA76C6C8C56565A353566523F583F37FF00FFFF00FFFF00FFFF00FFFF
        00FFB6816CFAF6F4FFFFFFFFFFFFFFFCFBFEF7F2FBF3EBF8EEE3F8EBDCE1CCBB
        734847E1A3A3DA9C9CC98B8BB87B7BA76C6C8B56565D3836533C35FF00FFFF00
        FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFFFFFFFFFFFFFFFFFFFEFBFEF7F2FB
        F3EAFAEEE3F8EADABBA196734847E1A1A1DA9A9AC98A8AB77A7AA66B6B8B5555
        5A3535FF00FFFF00FFFF00FFFF00FFFF00FFC0896FFBF7F4FFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFBFEF7F2FBF2EAFAEEE2F8EBDABBA196734847E0A1A1D99A9AC7
        8A8AB77A7AA66B6B8A55555B3535FF00FFFF00FFFF00FFFF00FFC58C70FBF7F4
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFCF8F2FBF3EAF8EEE2F8EAD9BCA1
        96916060EBAAAAD99999C78989B67979804E4E414855354756FF00FFFF00FFFF
        00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFCF7F0
        FBF2E9FBF2E5E9D3C484544C916060EAAAAAD89999534E57028AC400AAEA00A6
        E60087C4FF00FFFF00FFCF9674FBF7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B69F675BAA7856906060C28989097BAB
        00BDFF00BDFF00A6E6001C9D000082FF00FFD49875FCF8F6FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFFFEF7DDC4BC9F675BEAB474B7
        7D46734747009FDE00BDFF008CD1001C9D010D9D010A97000082D49875FCF8F6
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDC7
        C29F675BEAB273EFA7517A494A0093D100B1F2012BA70725DC0420B8021DB101
        0A97D49875FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE2D0CE9F675BEDB572A5686BFF00FFFF00FF0084C10C21BF2D4F
        F60F2ECC031EB100058FCF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF
        8E68CF8E68CF8E68CF8E68CF8E68CF8E689F675BA5686BFF00FFFF00FFFF00FF
        FF00FF1624BF5270FC1839E3010997FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF1322BD050DA5FF00FFFF00FF}
      ShowCaption = False
    end
    object MoveDownButton: TdxBarLargeButton
      Caption = #1055#1077#1088#1077#1089#1091#1085#1091#1090#1080' '#1074#1085#1080#1079
      Category = 0
      Hint = #1055#1077#1088#1077#1089#1091#1085#1091#1090#1080' '#1074#1085#1080#1079
      Visible = ivAlways
      OnClick = MoveDownButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FF8C3816A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769A46769A46769A46769A46769A467698C3816FF00FFFF00FFFF
        00FFFF00FFFF00FF8C38168C3816EFE0CCEFE0CCEFE0CCEFE0CCEFE0CCEFE0CC
        EFE0CCEFE0CCEBD9C1EBD9C1EBD9C1EBD9C1EBD9C1EBD9C1EBD9C1EBD9C18C38
        168C3816FF00FFFF00FFFF00FF8C38168C38168C38168C3816EEDECBFCEAD7FC
        EAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7
        EBD9C18C38168C38168C38168C3816FF00FF8C38168C38168C38168C38168C38
        168C3816FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FE
        BD82FEBD82FEBD828C38168C38168C38168C38168C38168C3816FF00FFFF00FF
        8C38168C3816F0E3D4F0E2D1EFE1CFEFE0CEEEDECBEEDDC9EDDCC7EDDCC5EBDA
        C2EBD9C1EBD9C1EBD9C1EBD9C1EBD9C1EBD9C1EBD9C18C38168C3816FF00FFFF
        00FFFF00FFFF00FF8C38168C3816F0E5D7EFE2D4FCEAD7FCEAD7FCEAD7FCEAD7
        FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7EAD8C0EAD8C08C38
        168C3816FF00FFFF00FFFF00FFFF00FF8C38168C3816E7DDD0E7DCCFFEBD82FE
        BD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82
        E1CFB8E1CFB88C38168C3816FF00FFFF00FFFF00FFFF00FF8C38168C3816CEC6
        BCCEC5BACEC4B7CCC2B7CBC1B5CBC0B4CAC0B1CABFAFCABDADCABCACCABBAAC9
        BAA7C9B8A6C7B7A5C7B7A4C7B7A48C38168C3816FF00FFFF00FFFF00FFFF00FF
        FF00FF895F56A19A95A09993A09891A09790A0978E9F978C9E968B9E958A9D93
        899D93879C92869C92849C91829C90829C8F819A8E808E595BFF00FFFF00FFFF
        00FF8C38168C38168C38168C38168C38168C38168C38168C38168C38168C3816
        8C38168C38168C38168C38168C38168C38168C38168C38168C38168C38168C38
        168C38168C38168C38168C3816FF00FFFF00FFA77568E0D9D3E0D9D0DED7CFDE
        D7CEDDD4CBDDD4C9DDD3C7DDD0C5DCD0C4DACEC1DACEBFD9CEBDD9CCBCD8CABA
        D8CAB7D8C9B6A46769FF00FFFF00FF8C38168C3816FF00FFFF00FFA77568D1CC
        C7D1CAC5CC5A2ACC5A2ACC5A2ACC5A2ACC5A2ACC5A2ACC5A2ACC5A2ACC5A2ACC
        5A2ACC5A2ACC5A2AC9BCADC9BBABA46769FF00FFFF00FF8C38168C3816FF00FF
        FF00FF996D5CA4A19DA3A09CF3BB9FF3BB9FF3BB9FF3BB9FF3BB9FF3BB9FF3BB
        9FF3BB9FF3BB9FF3BB9FF3BB9FF3BB9F9D958A9D93888E595BFF00FFFF00FF8C
        38168C38168C38168C38168C38168C38168C38168C38168C38168C38168C3816
        8C38168C38168C38168C38168C38168C38168C38168C38168C38168C38168C38
        168C38168C38168C3816FF00FFFF00FFFF00FFB17E6BFFFEFCFFFEFCFFFEFCFF
        FEFCFFFEFCFAF4EFFAF4EFF8F2EAF8F2EAF6EDE5F6EDE5F4EDE2F4EDE2F3E6D9
        F3E6D9F3E6D9A46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBB846EFEFC
        FBFCFBF8FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FC
        EAD7FCEAD7FCEAD7F2E6DAF2E5D8A46769FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC0896FFFFFFFFFFFFFFEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD
        82FEBD82FEBD82FEBD82FEBD82FEBD82F3EADEF3E9DDA46769FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFC58C70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4EDE2F4EBE0A467
        69FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCB9173FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFCFEFBF8FEFAF6FBF7F3FAF6F0FAF4EFF8F3EDF8F0EAF7EFE9
        F7EEE6F4EDE3A46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF9674FFFF
        FFFFFFFFFCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FC
        EAD7FCEAD7FCEAD7F7F0EAF7EFE7A46769FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFD49875FFFFFFFFFFFFFEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD
        82FEBD82FEBD82FEBD82FEBD82FEBD82F8F3EDF8F2EAA46769FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFD49875FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFEFBF8FCFAF6FBF7F3FAF6F0F8F3EEA467
        69FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD49875FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFCFAFEFAF7
        FCF8F4FAF6F2A46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD49876CF8E
        68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF
        8E68CF8E68CF8E68CF8E68CF8E68956662FF00FFFF00FFFF00FF}
      ShowCaption = False
    end
    object MoveUpButton: TdxBarLargeButton
      Caption = #1055#1077#1088#1077#1089#1091#1085#1091#1090#1080' '#1074#1075#1086#1088#1091
      Category = 0
      Hint = #1055#1077#1088#1077#1089#1091#1085#1091#1090#1080' '#1074#1075#1086#1088#1091
      Visible = ivAlways
      OnClick = MoveUpButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FF92635DA46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769A46769A46769A46769A46769A46769A46769FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF92635DEFE0CCEFE0CCEFE0CCEFE0CCEFE0CCEFE0CC
        EFE0CCEFE0CCEBD9C1EBD9C1EBD9C1EBD9C1EBD9C1EBD9C1EBD9C1EBD9C1A467
        69FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF92635DEFE0CCEEDECBFCEAD7FC
        EAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7
        EBD9C1EBD9C1A46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF92635DEFE1
        D0EFE0CEFEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FE
        BD82FEBD82FEBD82EBD9C1EBD9C1A46769FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF92635DF0E3D4F0E2D1EFE1CFEFE0CEEEDECBEEDDC9EDDCC7EDDCC5EBDA
        C2EBD9C1EBD9C1EBD9C1EBD9C1EBD9C1EBD9C1EBD9C1A46769FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF92635DF0E5D7EFE2D4FCEAD7FCEAD7FCEAD7FCEAD7
        FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7EAD8C0EAD8C0A467
        69FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF92635DE7DDD0E7DCCFFEBD82FE
        BD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82
        E1CFB8E1CFB8A46769FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E6E64CEC6
        BCCEC5BACEC4B7CCC2B7CBC1B5CBC0B4CAC0B1CABFAFCABDADCABCACCABBAAC9
        BAA7C9B8A6C7B7A5C7B7A4C7B7A4A46769FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF895F56A19A95A09993A09891A09790A0978E9F978C9E968B9E958A9D93
        899D93879C92869C92849C91829C90829C8F819A8E808E595BFF00FFFF00FFFF
        00FF8C38168C38168C38168C38168C38168C38168C38168C38168C38168C3816
        8C38168C38168C38168C38168C38168C38168C38168C38168C38168C38168C38
        168C38168C38168C38168C3816FF00FFFF00FFA77568E0D9D3E0D9D0DED7CFDE
        D7CEDDD4CBDDD4C9DDD3C7DDD0C5DCD0C4DACEC1DACEBFD9CEBDD9CCBCD8CABA
        D8CAB7D8C9B6A46769FF00FFFF00FF8C38168C3816FF00FFFF00FFA77568D1CC
        C7D1CAC5CC5A2ACC5A2ACC5A2ACC5A2ACC5A2ACC5A2ACC5A2ACC5A2ACC5A2ACC
        5A2ACC5A2ACC5A2AC9BCADC9BBABA46769FF00FFFF00FF8C38168C3816FF00FF
        FF00FF996D5CA4A19DA3A09CF3BB9FF3BB9FF3BB9FF3BB9FF3BB9FF3BB9FF3BB
        9FF3BB9FF3BB9FF3BB9FF3BB9FF3BB9F9D958A9D93888E595BFF00FFFF00FF8C
        38168C38168C38168C38168C38168C38168C38168C38168C38168C38168C3816
        8C38168C38168C38168C38168C38168C38168C38168C38168C38168C38168C38
        168C38168C38168C3816FF00FFFF00FFFF00FFB17E6BFFFEFCFFFEFCFFFEFCFF
        FEFCFFFEFCFAF4EFFAF4EFF8F2EAF8F2EAF6EDE5F6EDE5F4EDE2F4EDE2F3E6D9
        F3E6D9F3E6D9A46769FF00FFFF00FFFF00FFFF00FFFF00FF8C38168C3816FEFC
        FBFCFBF8FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FC
        EAD7FCEAD7FCEAD7F2E6DAF2E5D88C38168C3816FF00FFFF00FFFF00FFFF00FF
        8C38168C3816FFFFFFFFFFFFFEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD
        82FEBD82FEBD82FEBD82FEBD82FEBD82F3EADEF3E9DD8C38168C3816FF00FFFF
        00FFFF00FFFF00FF8C38168C3816FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4EDE2F4EBE08C38
        168C3816FF00FFFF00FFFF00FFFF00FF8C38168C3816FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFCFEFBF8FEFAF6FBF7F3FAF6F0FAF4EFF8F3EDF8F0EAF7EFE9
        F7EEE6F4EDE38C38168C3816FF00FFFF00FF8C38168C38168C38168C38168C38
        168C3816FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FCEAD7FC
        EAD7FCEAD7FCEAD78C38168C38168C38168C38168C38168C3816FF00FF8C3816
        8C38168C38168C3816FFFFFFFEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD
        82FEBD82FEBD82FEBD82FEBD82FEBD82F8F3ED8C38168C38168C38168C3816FF
        00FFFF00FFFF00FF8C38168C3816FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFEFBF8FCFAF6FBF7F3FAF6F0F8F3EE8C38
        168C3816FF00FFFF00FFFF00FFFF00FFFF00FF8C3816FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFCFAFEFAF7
        FCF8F4FAF6F28C3816FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD49876CF8E
        68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF
        8E68CF8E68CF8E68CF8E68CF8E68956662FF00FFFF00FFFF00FF}
      ShowCaption = False
    end
    object PreviewButton: TdxBarLargeButton
      Caption = #1055#1077#1088#1077#1075#1083#1103#1085#1091#1090#1080
      Category = 0
      Hint = #1055#1077#1088#1077#1075#1083#1103#1085#1091#1090#1080
      Visible = ivAlways
      OnClick = PreviewButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FF73453F
        8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D
        598E5D598E5D598E5D598E5D598C5D597D4E49FF00FFFF00FF6968773F4A5179
        7570FF00FF6D413DF3DAB4F2D8AFF2D4A9F0D1A1EFCE99EECA91EDC68AEDC484
        EBC180EBC180EBC180EBC180EBC180EBC180EAC07FE5BC7D764A45FF00FF776D
        770D5FB4216EC182898CFF00FF73453FF3DAB4F3D8ADF2D5A6F0D1A1F0D09CEF
        CC97EECA91EEC98CEDC488EAC284E9C081E9BF7FE9BF7FE9BF7FE5BC7DDAB477
        82514D7A6D780C5BA91A7FFB3CAFFF3C8BCCFF00FF73453FF6E1C0D58127D581
        27D58127D58127D58127D48027D38027D07E26CE7D25CA7A25C97924CA7A25CB
        7B25C67824CB9D707D6A720D5AA9197FFA3FA9FF39A0F7FF00FFFF00FF754740
        F8E7CCF7E5C7F6E2C0F4DEBAF3DCB4F2D7ABEBD0A3E5C799DABC8ED1B483CAAB
        7AC9A777C9A774CCAC7BCA9E748C7675105BA4197DF73FA9FF39A0F8FF00FFFF
        00FFFF00FF784A41FAEED9D58127D58127D58127D48027D07E26C77824B86F22
        A665239A5E2C91572A915727975A1F9D5E1C8E72631159A1187DF73EA7FF37A1
        FBFF00FFFF00FFFF00FFFF00FF7D4D42FBF3E5FBF0E0FAEDD9F7E9D1F2E2C9E6
        D5BAC6AF979D746AA57870AD8379AD867AA67F7591635A7B66604F77913B81CA
        3AA9FF35A1FBFF00FFFF00FFFF00FFFF00FFFF00FF805144FCF8EFD58127D581
        27D38027CC7B25AD6A2C956356C6A695EDE5C2FAF7D0FAF7D0EDE5C5D3C0A5A3
        7E6D927777C6BDBD4F83B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF865545
        FEFCF8FEFBF4FCF8EFF8F2E6DCCEC2936A65DCC7C4FFFFF6FFFFCEFFFFCCFFFF
        CCFFFFCEFFF8C4EAD8A5B78E7BA77A705C3A36FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF8A5947FFFFFFBC4B00BB4B00B7490093491FAC897AFFFFFFFFFFF0
        FFFFCCFFFFCEFFFFCEFFFFD0FBF2BFF4CE93D9BA90A172695F3B37FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF905E49FFFFFFBC4B00FE8000F87E00975D40D5
        C2A9FFFFDAFFFFD0FFFFCEFFFFCEFFFFCEFFFFD0FBEFBBEEB77EEAC68FB88F7D
        6B4241FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF95644BFFFFFFBC4B0000BC
        FE00B8F8786766EAE1C1FFFFD0FFFFCCFFFFCEFFFFCEFFFFCFFFFFCFF7DCA5EA
        A96DF4CA8CB7917B744847FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A684D
        FFFFFFBC4B00008000007F00765F4BE7DDBDFFFFD1FFFFCEFFFFCEFFFFCFFFFF
        D0FAEBB7EEBA80E79F62F6D495B78F7A734746FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFA06D4FFFFFFFBC4B00008100007F005A5C37CCB69EFFFFD4FFFFCF
        FFFFD0FFFCCBFBEAB5F2CA8EEDBA7AF0C68AEDD9A1B184756C4241FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFA67251FFFFFFBC4B00FFD9A1FED8A0C4997AA0
        766BFFFCC9FEEFB8F7DEAAF3CE96EEB77AEFBF7EF8E3C1FFFFEFD3B696996B65
        6B433FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAA7652FFFFFFBC4B00BC4B
        00BC4B00B64B02934F2EBD9A83FFF0B1F8D495EFB77AEFB474F8DCA0FFFFFBE7
        DDDD9E736BAF9795744844FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB07954
        FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEEBE5E5AA8483B08377E1C49DF8E2A9FAE5
        AAE6D0A3BFA092976D6BAC9291E9E9E97B4D48FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFB27E56FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF3F0F0CAB4B4
        A67F7D9E726C9A6F68986D689E7A78CFC1C0F0F0F0F8F8F87F4F4AFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFB78157FFFFFFBC4B00BC4B00BC4B00BC4B00BC
        4B00BC4B00BB4B00BA4A00B84900B74900B74900B74900B84900BA4A00FEFEFE
        80504BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA8358FFFFFFBC4B00BC4B
        00BC4B00BC4B00BC4B00BC4B00BC4B00BC4B00BC4B00BB4B00BB4B00BB4B00BC
        4B00BC4B00FFFFFF80504BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA8358
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80504BFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFBA8358D1926DD1926DD1926DD1926DD1926DD1926DD1926DD1926D
        D1926DD1926DD1926DD1926DD1926DD1926DD1926DD1926DD1926DFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ShowCaption = False
    end
    object PrintButton: TdxBarLargeButton
      Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080
      Category = 0
      Hint = #1044#1088#1091#1082#1091#1074#1072#1090#1080
      Visible = ivAlways
      OnClick = PrintButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C
        6A6A6C6A6AFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF6C6A6AB0ADAD9692938E8A8B6C6A6A6C6A6A817E7F6C6A6ADDDCDCD0CFCF6C
        6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF6C6A6AD5D4D4C6C4C4A19F9FA19F9FA19F9F8381825C5B5BBCBC
        BCCECECECFCFCFD1D1D1D3D3D3CAC9C96C6A6A6C6A6A6C6A6AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6C6A6AD8D7D7E0DEDEC0BFBFA19F9FA19F9FA19F9F
        6260600000000000001616165D5D5DA9A9A9CACACACACACACACACACACACAC1C0
        C06C6A6A6C6A6A6C6A6AFF00FFFF00FF6C6A6AD3D3D3D4D3D3CFCFCF8C8A8A81
        7F7F817F7F817F7F6C6A6A1414140808080000000000000000001616165D5D5D
        A9A9A9CACACACACACAB7B6B6B7B6B66C6A6AFF00FF6C6A6ACACACACACACAC6C6
        C68E8C8CB8B5B5B6B4B4A19F9FA19F9F9F9D9D9997979390918280805250502B
        2A2A080808000000000000161616646464817E7F6C6A6AFF00FFFF00FF6C6A6A
        CACACAC5C5C58E8C8CD7D4D4F7F6F6F6F4F4F2F0F0E0DEDECAC7C7B6B5B5A5A3
        A3A19F9FA19F9F9E9A9C9390916865662322230303031919199997976C6A6AFF
        00FFFF00FF6C6A6AC5C5C58E8C8CE7E6E6F7F6F6F7F6F6F6F4F4F2F0F0EEEDED
        EAEAEAE7E6E6E3E2E2D4D3D3C2C1C1AFADADA19F9FA19F9F9997978280806C6A
        6A9F9D9D6C6A6AFF00FFFF00FF6C6A6A8E8C8CEFEEEEF7F6F6F7F6F6F7F6F6F6
        F4F4D5D3D4867B7E958B8EC1BFBFDDDCDCE0E0E0DCDCDCD8D8D8D1D1D1C2C1C1
        B2B0B0A19F9F9C99996C6A6A6C6A6AFF00FFFF00FF6C6A6ACECBCCF7F6F6F7F6
        F6F7F6F6F7F6F6CFCBCCAFACADADABAB9E989883797B75696B898081ABA5A6C7
        C6C6D5D5D5D1D1D1CECECEC9C7C7BBBABAA6A4A46C6A6AFF00FFFF00FFFF00FF
        6C6A6A6C6A6ACECBCCEDEBEBAFA4A56B5D5F766A6C83787A9C9697ACAAAAB2B0
        B0ABA7A9989192817778847A7D938C8EBFBFBFCBCBCBCACACAC0C0C06C6A6AFF
        00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6ABD8281AF8A737D5E51665456
        6554576D5E626D5E62898081A09A9CAFACADB2B0B0A49FA0CAC9CACBCBCBB7B6
        B66C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FF
        D4ABFFD0A1FFCB98D5A57BA1785C7B665F6050536656596F62658E8687CECCCC
        CFCFCFA5A4A46C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFBD8281FFD9B2FFD4A9FFCFA0FFCA97FFC68EFFC186FFBF81FFC084BD
        82816C6A6A6C6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFBD8281FFDDBAFFD8B1FFD3A7FFCE9EFFCA96FFC5
        8CFFC084FFC084BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFE5CBFFE1C2FFDCB8FFD7AF
        FFD3A6FFCE9DFFC995FFC48BBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFEAD4FF
        E5CAFFE0C0FFDAB7FFD7ADFFD1A5FFCC9CFFC792BD8281FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFBD8281FFEEDCFFE9D1FFE3C9FFE0BFFFDAB6FFD5ACFFD0A3F7C297BD8281FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFBD8281FFF7EEFFF2E3FFEDDAFFE7D0FFE3C7FFDEBDFFD9B4FFD4
        ABBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFBD8281FFFAF3FFFAF3FFF6EDFFF0E2FFEBD9FFE7CF
        FFE2C5FFDDBCF2C7A9BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281BD8281BD8281BD8281FF
        F4EBFFF0E1FFEBD7FFE6CEFBDCC0BD8281FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFBD8281BD8281BD8281BD8281BD8281FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ShowCaption = False
    end
    object RefreshButton: TdxBarLargeButton
      Caption = #1042#1110#1076#1085#1086#1074#1080#1090#1080' (F5)'
      Category = 0
      Hint = #1042#1110#1076#1085#1086#1074#1080#1090#1080' (F5)'
      Visible = ivAlways
      OnClick = RefreshButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000017000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        0000FF00FFFF00FF92635D8E5D598E5D598E5D598E5D598E5D598E5D598E5D59
        8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598050
        4BFF00FFFF00FF000000FF00FFFF00FF93655EEFD3B4F6DAB6F3D5ADF2D1A5F0
        CE9EEFCB97EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080
        EDC180EABF7F80504BFF00FFFF00FF000000FF00FFFF00FF93655FEED4B8F4DA
        BBF2D5B1F0D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9BD7FE9
        BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FF000000FF00FFFF00FF
        93655FEED7C0F6E0C1F2D9B8F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC58FEBC1
        89EABF82E9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FF00
        0000FF00FFFF00FF93655FEFDAC5F7E2C7F3DCBFF2D8B7007000F0D1AAEFCEA3
        B1B874007000007000007000ADAD60E9BD7FE9BD7FE9BD7FEABF7FE7BC7E8050
        4BFF00FFFF00FF000000FF00FFFF00FF936560F0DECCF8E6CFF6E0C6F3DCBD00
        7000047503B2BD7F007000B1B874EDC796B0B46B007000ADAF62E9BD7FE9BD7F
        EABF7FE7BC7E80504BFF00FFFF00FF000000FF00FFFF00FF956660F2E2D3FAEA
        D7F6E3CEF4DEC5007000007000007000B2BD7FEFCEA3EECB9DEDC797B0B46B00
        7000E9BD81E9BD7FEABF7FE7BC7E80504BFF00FFFF00FF000000FF00FFFF00FF
        986963F2E6DAFAEEDEF7E7D4F6E2CB007000007000007000007000F0D1A9EFCE
        A3EECB9DEDC796007000EBC189E9BD81EABF7FE7BC7E80504BFF00FFFF00FF00
        0000FF00FFFF00FF9E6E64F4EAE1FBF2E6F8EADCF7E6D3007000007000007000
        007000007000F0D1AAEFCEA4EDCB9CEDC796EBC58FEBC188EABF82E7BB7E8050
        4BFF00FFFF00FF000000FF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3F7EADAF7
        E6D3F6E2CCF4DEC5F3DCBDF2D8B6F0D5B0F0D1AAEFCEA3EECA9CEDC795EBC48E
        EBC288E7BC8080504BFF00FFFF00FF000000FF00FFFF00FFA77568F8F3F0FEFB
        F6FBF3EBF8EEE3F8EBDCF7E7D3F6E2CCF4E0C500700000700000700000700000
        7000EDCB9CEDC795EDC58FE9BF8780504BFF00FFFF00FF000000FF00FFFF00FF
        AC7969FAF6F4FFFFFEFEF8F3FBF2EA007000F8EBDAF7E6D3F7E2CCF6E0C50070
        00007000007000007000EFCEA3EECB9CEEC996EAC18E80504BFF00FFFF00FF00
        0000FF00FFFF00FFB17E6BFAF6F4FFFFFFFFFEFBFEF7F0007000BAD4AAF8EADA
        F7E7D3F6E2CBB7C792007000007000007000F0D1A9EFCEA1EECB9CEBC5928050
        4BFF00FFFF00FF000000FF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFFFFCFBBC
        DAB4007000B8D3AAF8EBDCB7CC9D007000B7C792047503007000F2D4AFF0D1A9
        F0CFA3EDC99980504BFF00FFFF00FF000000FF00FFFF00FFBB846EFAF6F4FFFF
        FFFFFFFFFFFFFFFFFEFBBCDAB4007000007000007000B7CC9DF6E2CBF6DEC400
        7000F2D8B6F0D4AFEFD0A7CEB49180504BFF00FFFF00FF000000FF00FFFF00FF
        C0896FFBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFEF7F2FBF2EAFAEEE2F8EB
        DAF7E6D3F6E2CBF6DEC4F3DCBDE5CEAFC4B096A1927F80504BFF00FFFF00FF00
        0000FF00FFFF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFB
        FCF8F2FBF3EAF8EEE2F8EAD9F8E7D4FAE9D0E0D0BAB8AB9AA79C8BA497868050
        4BFF00FFFF00FF000000FF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C4A0675BA0675BA0675B
        A0675BA0675BA0675BFF00FFFF00FF000000FF00FFFF00FFCF9674FBF7F6FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B6A0
        675BDAA16BDD984FE2903AEA8923A5686BFF00FFFF00FF000000FF00FFFF00FF
        D49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
        FBFFFEF7DDC4BCA0675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF00FF00
        0000FF00FFFF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFDDC7C2A0675BEAB273EFA751A5686BFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CEA0675BEDB572A5686B
        FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFCF8E68CF8E68CF8E
        68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68A0
        675BA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000}
      ShowCaption = False
    end
    object CloseButton: TdxBarLargeButton
      Caption = #1047#1072#1083#1080#1096#1080#1090#1080
      Category = 0
      Hint = #1047#1072#1083#1080#1096#1080#1090#1080
      Visible = ivAlways
      OnClick = CloseButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E
        1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B
        8C4B4B914B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B89
        4B4B9C4B4CB64B4CBD4B4C9F4B4C4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B
        4B9A4D4EAF4E4FC14E4FC04D4EBF4C4DBF4C4D9F4B4C4E1E1F994B4B824B4B82
        4B4B824B4B824B4B824B4B824B4B824B4B824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BC55455C95455C75354C65253C55152C45051C24F50A04C4D4E1E
        1FFE8B8CFC9293FB9A9CFAA3A4F8AAABF7B1B1F7B5B6F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BCE5859CC5758CB5657CA5556C95455C75354
        C65253A34E4F4E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BD15B5CD05A5BCF595ACE
        5859CC5758CB5657CA5556A550504E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C
        1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BD55E
        5FD55E5FD45D5ED35C5DD15B5CD05A5BCF595AA651524E1E1F3F9E4C1EBC4C1E
        BC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BDA6364D96263D86062D75F60D55E5FD45D5ED35C5DA953544E1E
        1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BDE6667DD6566DC6465DA6364D96263D86062
        D75F60AB55554E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BE2696AE16869E06768DE
        6667E06D6EE69091DC6465AC56574E1E1F58A55B1EBC4C1EBC4C1EBC4C1EBC4C
        1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BE76D
        6EE66C6DE56B6CE36A6BEEA6A7FFFFFFEB9C9CAF58594E1E1FEECEAFB7EBAA5E
        D3775ED37745CA6745CA6745CA67F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BEB7072EA6F70E96E6FE76D6EF2A9AAFFFFFFEB9596B15A5A4E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3D9F6BDD9F6BDF7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BEF7475EE7374ED7273EB7072EA6F70EF9091
        E76D6EB25B5C4E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF37778F37778F27677F0
        7576EF7475EE7374ED7273B55D5D4E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3
        FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF87B
        7DF77A7BF6797AF47879F37778F27677F07576B75F5F4E1E1FEECEAFFFFFD3FF
        FFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BFC7F80FB7E7FFA7D7EF87B7DF77A7BF6797AF47879B860624E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BFF8182FF8182FE8081FC7F80FC7F80FB7E7F
        FA7D7EBB63634E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BFF8182FF8182FF8182FF
        8182FF8182FE8081FE8081BD65654E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3
        FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF77E
        7FFF8182FF8182FF8182FF8182FF8182FF8182BF66664E1E1FEECEAFFFFFD3FF
        FFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4B824B4BAF5E5FD56F70FF8182FF8182FF8182FF8182BF66664E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B915152B66263EE7A7B
        FF8182BF66664E1E1F914B4B824B4B824B4B824B4B824B4B824B4B824B4B824B
        4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF824B4B824B4B9855559F58584E1E1FFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ShowCaption = False
    end
    object SelectButton: TdxBarLargeButton
      Caption = #1042#1080#1073#1088#1072#1090#1080' (F12)'
      Category = 0
      Hint = #1042#1080#1073#1088#1072#1090#1080' (F12)'
      Visible = ivAlways
      OnClick = SelectButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        56070000424D5607000000000000360000002800000019000000180000000100
        1800000000002007000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF004B00118C1F004B00FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00138F23079310169C28
        004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FF004B00
        1591270FA01D0B9916089611159A27004B00FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
        FF00FFFF00FF004B000F811C1AAF3114A7270FA11F0C9A18089612139925004B
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF00FF00FFFF00FFFF00FF004B000E7D1A28C04821B83D1BB0331390
        24004B00169D29099713139823004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF004B000C771735CF
        5E2FC95428C1491B9F31004B00FF00FF004B000D9E1B099714119722004B00FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00
        FFFF00FF004B003FD96F3BD76836D06020AA3B004B00FF00FFFF00FFFF00FF00
        4B000974110A9915119620004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00FF00FFFF00FF004B001C9C3441DC7023AD41004B00FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B000B991610951F004B00FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FF00
        4B002EC152004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        004B000C9A18099612004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF00FF00FFFF00FFFF00FFFF00FF004B00FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF004B00046408099613004B00FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF004B0007740E004B00FF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00035E06004B00FF00FFFF00FFFF
        00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF004B00004B00FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00FF00FFFF00FF00FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00}
      ShowCaption = False
    end
    object AddCostButton: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080' '#1074#1072#1088#1090#1110#1089#1090#1100' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1074#1072#1088#1090#1110#1089#1090#1100' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      Visible = ivAlways
      Glyph.Data = {
        36030000424D360300000000000036000000280000000F000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFA46769
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769FF00FF000000FF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EFCB96EF
        C68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FF000000FF00FFB79187
        FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD7FEFC4
        81A46769FF00FF000000FF00FFB7938AFEEFDAF6E0C6F2DABCECD0AEDDC19CD7
        B78FDBB88BE5BD89E9BD82E9BD7FEFC481A46769FF00FF000000FF00FFBA978F
        FFF4E5F7E5CFF4E0C5E1CAADBCA589A89275B99E7BDBB88AEBC28AEABF81EFC4
        80A46769FF00FF000000FF00FFC09E95FFFBF0F2E4D7E4D2C080000080000080
        0000A28C72C4A883DBB78AE5BD87EFC583A46769FF00FF000000FF00FFC6A49A
        FFFFFCE7DED5C1B6A9800000F7E5CF80000097856EA28C71B99E7AD9B888F2C9
        8CA46769FF00FF000000FF00FFCBA99EFFFFFF800000800000800000F7E5CF80
        0000800000800000A89275D7B88FF3CE97A46769FF00FF000000FF00FFCFAC9F
        FFFFFF800000F7E5CFF7E5CFF7E5CFF7E5CFF7E5CF800000BDA589DEC19AF6D3
        A0A46769FF00FF000000FF00FFD4B0A1FFFFFF800000800000800000F7E5CF80
        0000800000800000E1C9AAEED3ADEBCFA4A46769FF00FF000000FF00FFD9B5A1
        FFFFFFFFFFFFFFFFFF800000F7E5CF800000C1B5A8E6D6C1FBEACEDECEB4B6AA
        93A46769FF00FF000000FF00FFDDB7A4FFFFFFFFFFFFFFFFFF80000080000080
        0000E9E1D5E7D3C4B68A7BA17B6F9C7667A46769FF00FF000000FF00FFE2BCA5
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E55E68F
        31B56D4DFF00FF000000FF00FFE6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFDCC7C5B88265F8B55CBF7A5CFF00FFFF00FF000000FF00FFE4BCA4
        FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C1836CFF00
        FFFF00FFFF00FF000000FF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EACAB6EA
        CAB6EACAB6E3C2B1A56B5FFF00FFFF00FFFF00FFFF00FF000000}
      OnClick = AddCostButtonClick
    end
    object EditCostButton: TdxBarButton
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1074#1072#1088#1090#1110#1089#1090#1100' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1074#1072#1088#1090#1110#1089#1090#1100' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFA46769A46769A46769A46769A46769A46769A46769A4
        6769A46769A46769A46769A46769A46769FF00FFFF00FFFF00FFA46769FCEACE
        F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
        69FF00FFFF00FFFF00FFA0675BFEEFDAF6E0C6302D2D212527374546998468AD
        926FC2A074DCB27AE7BC7EEFC481A46769FF00FFFF00FFFF00FFA0675BFFF4E5
        F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
        69FF00FFFF00FFFF00FFA7756BFFFBF0F8EADCEEDDCA22576C165E82745D657D
        52545E3F39867258A78C66CEAA73A06567FF00FFFF00FFFF00FFA7756BFFFFFC
        FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
        5EFF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2FAEFE6F0E5D56B5D62E9A4A1CF
        9090B27575875353583C357A6950815354FF00FFFF00FFFF00FFBC8268FFFFFF
        FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
        4EFF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFFFFEFCFEF7F0FAEFE5E1CEC087
        5958E1A1A1CC8E8EB07474865151633B3CFF00FFFF00FFFF00FFD1926DFFFFFF
        FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
        423E4145FF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFC
        F3E6CFB5AA976666EFAAA98C6D731E799F0C98BD0C98BDFF00FFDA9D75FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
        F0008EDE000F95000081E7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDCC7C5A56B5FD1914F068FC10393DE0320BA0318B2010B99E7AB79FBF4F0
        FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
        BF2F45ED1031D3010A95E7AB79D1926DD1926DD1926DD1926DD1926DD1926DD1
        926DD1926DA56B5FFF00FFFF00FFFF00FF2732D00C19B4FF00FF}
      OnClick = EditCostButtonClick
    end
    object DelCostButton: TdxBarButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1074#1072#1088#1090#1110#1089#1090#1100' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1074#1072#1088#1090#1110#1089#1090#1100' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001DE80010DC00006EFF00FFFF
        00FFFF00FFFF00FF00006E0004E20008E700006EFF00FFFF00FFFF00FFFF00FF
        00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
        DB00006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001ADF0020EB0013DC00
        006E00006E0005E2000BEB0004DA00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E001BE300
        16EB0011EB000ADF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E062DE30430EB00
        20E2001EE20027EB0019DF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E1442E41645EB092ED900006EFF
        00FFFF00FF00006E0020D9012CEB001FE200006EFF00FFFF00FFFF00FFFF00FF
        00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
        E400006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = DelCostButtonClick
    end
    object RefreshCostButton: TdxBarButton
      Caption = #1042#1110#1076#1085#1086#1074#1080#1090#1080' '#1076#1072#1085#1110
      Category = 0
      Hint = #1042#1110#1076#1085#1086#1074#1080#1090#1080' '#1076#1072#1085#1110
      Visible = ivAlways
      Glyph.Data = {
        36030000424D360300000000000036000000280000000F000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFA467698E5D598E5D598E5D598E5D598E5D598E
        5D598E5D598E5D598E5D598E5D598E5D5980504BFF00FF000000FF00FFA46769
        FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD7FEFC4
        8180504BFF00FF000000FF00FFA0675BFEEFDAF6E0C6F2DABCF2D5B2C1C18800
        7000007000BDB672E9BD82E9BD7FEFC48180504BFF00FF000000FF00FFA0675B
        FFF4E5F7E5CF007000C4CA97007000C2C187C0BD80007000BDB66FEABF81EFC4
        8080504BFF00FF000000FF00FFA7756BFFFBF0F8EADC007000007000C4C998F2
        D5B1F0D0A9BFBD80007000EBC28AEFC58380504BFF00FF000000FF00FFA7756B
        FFFFFCFAF0E6007000007000007000F2DABAF2D5B1F0D0A7EECB9DEBC793F2C9
        8C80504BFF00FF000000FF00FFBC8268FFFFFFFEF7F2FAEFE6F8EAD9F7E3CFF6
        E0C5007000007000007000EECC9EF3CE9780504BFF00FF000000FF00FFBC8268
        FFFFFFFFFEFC007000CADABAF7EADAF6E3CFC5CE9F007000007000F0D0A6F6D3
        A080504BFF00FF000000FF00FFD1926DFFFFFFFFFFFFCEE7CC007000CADAB8C9
        D7B0007000C6CC9E007000F4D8B1EBCFA480504BFF00FF000000FF00FFD1926D
        FFFFFFFFFFFFFFFFFFCEE7CC007000007000C9D5B0F8E7D1FBEACEDECEB4B6AA
        9380504BFF00FF000000FF00FFDA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFC
        F6EFFCF3E6EDD8C9A0675BA0675BA0675BA0675BFF00FF000000FF00FFDA9D75
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAA0675BE19E55E68F
        31B56D4DFF00FF000000FF00FFE7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFDCC7C5A0675BF8B55CBF7A5CFF00FFFF00FF000000FF00FFE7AB79
        FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A0675BC1836CFF00
        FFFF00FFFF00FF000000FF00FFE7AB79CF8E68CF8E68CF8E68CF8E68CF8E68CF
        8E68CF8E68CF8E68A0675BFF00FFFF00FFFF00FFFF00FF000000}
      OnClick = RefreshCostButtonClick
    end
  end
  object CDataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    UpdateTransaction = WTransaction
    SelectSQL.Strings = (
      'select * from PL_DT_COST_PRODUCT_SEL(3326)'
      'order by link_to, display_order, NAME_FIELD')
    Left = 448
    Top = 122
    poSQLINT64ToBCD = True
  end
  object CDataSource: TDataSource
    DataSet = CDataSet
    Left = 448
    Top = 154
  end
  object Database: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 56
    Top = 90
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 88
    Top = 90
  end
  object WTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 120
    Top = 90
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 494
    Top = 134
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWindowText
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMaroon
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svBitmap, svColor, svTextColor]
      Color = 12937777
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00C6C6C600FFFFFF0084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00C6C6C60084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00840000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      TextColor = clWhite
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16777088
      TextColor = clBlue
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxTreeListStyleSheet1: TcxTreeListStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle5
      Styles.Inactive = cxStyle9
      Styles.Selection = cxStyle13
      Styles.BandBackground = cxStyle2
      Styles.BandHeader = cxStyle3
      Styles.ColumnHeader = cxStyle4
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Footer = cxStyle8
      Styles.IncSearch = cxStyle10
      Styles.Indicator = cxStyle11
      Styles.Preview = cxStyle12
      BuiltIn = True
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle14
      Styles.Content = cxStyle15
      Styles.ContentEven = cxStyle16
      Styles.ContentOdd = cxStyle17
      Styles.Inactive = cxStyle23
      Styles.IncSearch = cxStyle24
      Styles.Selection = cxStyle27
      Styles.FilterBox = cxStyle18
      Styles.Footer = cxStyle19
      Styles.Group = cxStyle20
      Styles.GroupByBox = cxStyle21
      Styles.Header = cxStyle22
      Styles.Indicator = cxStyle25
      Styles.Preview = cxStyle26
      BuiltIn = True
    end
  end
end
