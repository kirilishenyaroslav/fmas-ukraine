object fmMainIvKartForm: TfmMainIvKartForm
  Left = 92
  Top = 228
  Width = 1044
  Height = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 201
    Top = 109
    Width = 827
    Height = 398
    Align = alClient
    TabOrder = 0
    object cxGridInvKart: TcxGrid
      Left = 2
      Top = 15
      Width = 823
      Height = 161
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = PopupMenuPrim
      TabOrder = 0
      OnDblClick = cxGridInvKartDblClick
      OnMouseUp = cxGridInvKartMouseUp
      object cxGridInvKartDBTableView1: TcxGridDBTableView
        OnDblClick = cxGridInvKartDBTableView1DblClick
        DataController.DataModeController.SmartRefresh = True
        DataController.DataSource = DataSourceInvKart
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Options = [dcoAnsiSort, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '##,#0.00'
            Kind = skSum
            FieldName = 'BAL_PRICE'
            Column = cxGridInvKartDBTableView1DBColumn4
          end
          item
            Kind = skCount
            Column = cxGridInvKartDBTableView1DBColumn5
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnCellClick = cxGridInvKartDBTableView1CellClick
        OnCustomDrawCell = cxGridInvKartDBTableView1CustomDrawCell
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = cxGridInvKartDBTableView1DBColumn8
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleYellow
        Styles.Content = cxStyleYellow
        Styles.ContentEven = cxStyleYellow
        Styles.ContentOdd = cxStyleYellow
        Styles.Inactive = AfterSelection
        Styles.Selection = cxStyleMalin
        Styles.FilterBox = cxStyleYellow
        Styles.Footer = cxStyleYellow
        Styles.Group = cxStyleYellow
        Styles.GroupByBox = cxStyleYellow
        Styles.Header = ForHaeder
        object cxGridInvKartDBTableView1DBColumn1: TcxGridDBColumn
          Options.Filtering = False
          Width = 67
          OnHeaderClick = cxGridInvKartDBTableView1DBColumn1HeaderClick
          DataBinding.FieldName = 'NUM_SCH'
          IsCaptionAssigned = True
        end
        object cxGridInvKartDBTableView1DBColumn8: TcxGridDBColumn
          HeaderAlignmentHorz = taRightJustify
          Options.Filtering = False
          Width = 87
          OnHeaderClick = cxGridInvKartDBTableView1DBColumn8HeaderClick
          DataBinding.FieldName = 'FULL_INV'
          IsCaptionAssigned = True
        end
        object cxGridInvKartDBTableView1DBColumn2: TcxGridDBColumn
          Options.Filtering = False
          Width = 140
          OnHeaderClick = cxGridInvKartDBTableView1DBColumn2HeaderClick
          DataBinding.FieldName = 'FIO_MOL'
          IsCaptionAssigned = True
        end
        object cxGridInvKartDBTableView1DBColumn6: TcxGridDBColumn
          Options.Editing = False
          Options.Filtering = False
          SortOrder = soAscending
          DataBinding.FieldName = 'NAME_DEPARTMENT'
        end
        object cxGridInvKartDBTableView1DBColumn3: TcxGridDBColumn
          Options.Filtering = False
          Width = 162
          OnHeaderClick = cxGridInvKartDBTableView1DBColumn3HeaderClick
          DataBinding.FieldName = 'NAME_KART'
          IsCaptionAssigned = True
        end
        object cxGridInvKartDBTableView1DBColumn4: TcxGridDBColumn
          HeaderAlignmentHorz = taRightJustify
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Width = 232
          DataBinding.FieldName = 'BAL_PRICE'
          IsCaptionAssigned = True
        end
        object cxGridInvKartDBTableView1DBColumn5: TcxGridDBColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayChecked = 'False'
          Properties.ReadOnly = False
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Options.Filtering = False
          Options.Sorting = False
          Width = 25
          DataBinding.FieldName = 'CHEKER'
          IsCaptionAssigned = True
        end
        object cxGridInvKartDBTableView1DBColumn7: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'DATE_OUT'
        end
      end
      object cxGridInvKartLevel1: TcxGridLevel
        GridView = cxGridInvKartDBTableView1
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 2
      Top = 176
      Width = 823
      Height = 8
      HotZoneClassName = 'TcxSimpleStyle'
      HotZone.SizePercent = 100
      AlignSplitter = salBottom
      MinSize = 100
      Control = Panel1
      OnAfterOpen = cxSplitter1AfterOpen
      OnAfterClose = cxSplitter1AfterClose
      Color = clBtnHighlight
      ParentColor = False
    end
    object Panel1: TPanel
      Left = 2
      Top = 184
      Width = 823
      Height = 212
      Align = alBottom
      TabOrder = 2
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 821
        Height = 210
        ActivePage = TabSheet1
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 813
            Height = 182
            Align = alClient
            TabOrder = 0
            DesignSize = (
              813
              182)
            object cxLabelTypKart: TLabel
              Left = 5
              Top = 11
              Width = 89
              Height = 13
              Caption = 'cxLabelTypKart'
            end
            object cxLabelKartNum: TLabel
              Left = 5
              Top = 36
              Width = 93
              Height = 13
              Caption = 'cxLabelKartNum'
            end
            object cxLabelStartPrice: TLabel
              Left = 5
              Top = 60
              Width = 101
              Height = 13
              Caption = 'cxLabelStartPrice'
            end
            object cxLabelStartIznos: TLabel
              Left = 5
              Top = 83
              Width = 102
              Height = 13
              Caption = 'cxLabelStartIznos'
            end
            object cxLabelOstPrice: TLabel
              Left = 5
              Top = 107
              Width = 93
              Height = 13
              Caption = 'cxLabelOstPrice'
            end
            object cxLabelOstIznos: TLabel
              Left = 5
              Top = 129
              Width = 94
              Height = 13
              Caption = 'cxLabelOstIznos'
            end
            object cxLabelDateOstPrice: TLabel
              Left = 256
              Top = 11
              Width = 120
              Height = 13
              Caption = 'cxLabelDateOstPrice'
            end
            object cxLabelDateOprih: TLabel
              Left = 256
              Top = 35
              Width = 102
              Height = 13
              Caption = 'cxLabelDateOprih'
            end
            object cxLabelDateStartExpl: TLabel
              Left = 256
              Top = 59
              Width = 123
              Height = 13
              Caption = 'cxLabelDateStartExpl'
            end
            object cxLabelDateUpdate: TLabel
              Left = 256
              Top = 83
              Width = 113
              Height = 13
              Caption = 'cxLabelDateUpdate'
            end
            object cxLabelDateOut: TLabel
              Left = 256
              Top = 106
              Width = 92
              Height = 13
              Caption = 'cxLabelDateOut'
            end
            object cxLabel_Inv_num_short: TLabel
              Left = 256
              Top = 131
              Width = 135
              Height = 13
              Caption = 'cxLabel_Inv_num_short'
            end
            object cxLabel_Grp_num: TLabel
              Left = 256
              Top = 155
              Width = 102
              Height = 13
              Caption = 'cxLabel_Grp_num'
            end
            object LabelBal: TLabel
              Left = 8
              Top = 153
              Width = 63
              Height = 13
              Caption = 'cxLabelBal'
            end
            object cxTextEditKartNum: TcxTextEdit
              Left = 118
              Top = 32
              Width = 121
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 0
            end
            object cxTextEditTypKart: TcxTextEdit
              Left = 118
              Top = 8
              Width = 121
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 1
            end
            object cxTextEditDateOstPrice: TcxTextEdit
              Left = 392
              Top = 8
              Width = 121
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 2
            end
            object cxTextEditDateOprih: TcxTextEdit
              Left = 392
              Top = 32
              Width = 121
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 3
            end
            object cxTextEditDateStartExpl: TcxTextEdit
              Left = 392
              Top = 56
              Width = 121
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 4
            end
            object cxTextEditDateUpdate: TcxTextEdit
              Left = 392
              Top = 80
              Width = 121
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 5
            end
            object cxTextEditDateOut: TcxTextEdit
              Left = 392
              Top = 104
              Width = 121
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 6
            end
            object cxTextEditStartPrice: TcxCurrencyEdit
              Left = 118
              Top = 56
              Width = 121
              Height = 21
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.AutoSelect = False
              Properties.DecimalPlaces = 4
              Properties.DisplayFormat = '#,##0.00'
              Properties.HideSelection = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 7
            end
            object cxTextEditStartIznos: TcxCurrencyEdit
              Left = 118
              Top = 80
              Width = 121
              Height = 21
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.AutoSelect = False
              Properties.DecimalPlaces = 4
              Properties.DisplayFormat = '#,##0.00'
              Properties.HideSelection = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 8
            end
            object cxTextEditOstPrice: TcxCurrencyEdit
              Left = 118
              Top = 104
              Width = 121
              Height = 21
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.AutoSelect = False
              Properties.DecimalPlaces = 4
              Properties.DisplayFormat = '#,##0.00'
              Properties.HideSelection = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 9
            end
            object cxTextEditOstIznos: TcxCurrencyEdit
              Left = 118
              Top = 127
              Width = 121
              Height = 21
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.AutoSelect = False
              Properties.DecimalPlaces = 4
              Properties.DisplayFormat = '#,##0.00'
              Properties.HideSelection = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 10
            end
            object cxTextEdit_grp_num: TcxTextEdit
              Left = 392
              Top = 152
              Width = 121
              Height = 21
              Properties.Alignment.Horz = taRightJustify
              Properties.ReadOnly = True
              TabOrder = 11
            end
            object cxTextEdit_Inv_num: TcxTextEdit
              Left = 392
              Top = 128
              Width = 121
              Height = 21
              Properties.Alignment.Horz = taRightJustify
              Properties.ReadOnly = True
              TabOrder = 12
            end
            object cxCurrencyEditBal: TcxCurrencyEdit
              Left = 118
              Top = 150
              Width = 121
              Height = 21
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.AutoSelect = False
              Properties.DecimalPlaces = 4
              Properties.DisplayFormat = '#,##0.00'
              Properties.HideSelection = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 13
            end
            object CheckBoxShowSumma: TCheckBox
              Left = 630
              Top = 8
              Width = 17
              Height = 17
              Alignment = taLeftJustify
              Anchors = [akTop, akRight]
              BiDiMode = bdLeftToRight
              ParentBiDiMode = False
              TabOrder = 14
              OnClick = CheckBoxShowSummaClick
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'TabSheet2'
          ImageIndex = 1
          object cxGroupBoxNal: TcxGroupBox
            Left = 564
            Top = 0
            Width = 232
            Height = 182
            Align = alRight
            Alignment = alTopLeft
            Color = clBtnFace
            ParentColor = False
            TabOrder = 0
            object Label_Nal_db_sch: TLabel
              Left = 6
              Top = 15
              Width = 108
              Height = 13
              Caption = 'Label_buh_db_sch'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label_Nal_kr_sch: TLabel
              Left = 6
              Top = 37
              Width = 105
              Height = 13
              Caption = 'Label_buh_kr_sch'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label_Nal_am_grp: TLabel
              Left = 6
              Top = 59
              Width = 80
              Height = 13
              Caption = 'Label_am_grp'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label_Nal_method_name: TLabel
              Left = 6
              Top = 81
              Width = 117
              Height = 13
              Caption = 'Label_method_name'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label_Nal_minprice: TLabel
              Left = 6
              Top = 101
              Width = 79
              Height = 13
              Caption = 'Labelminprice'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label_Nal_Percent: TLabel
              Left = 6
              Top = 122
              Width = 76
              Height = 13
              Caption = 'LabelPercent'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label_Nal_PerNach_Perc: TLabel
              Left = 6
              Top = 141
              Width = 114
              Height = 13
              Caption = 'LabelPerNach_Perc'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label_Nal_mes: TLabel
              Left = 226
              Top = 163
              Width = 5
              Height = 13
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label_Nal_God: TLabel
              Left = 168
              Top = 163
              Width = 5
              Height = 13
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label_Nal_MonthYear: TLabel
              Left = 8
              Top = 163
              Width = 93
              Height = 13
              Caption = 'LabelMonthYear'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Beg_Price_Nal: TLabel
              Left = 272
              Top = 16
              Width = 83
              Height = 13
              Caption = #1055#1086#1095'.'#1074#1072#1088#1090'. '#1085#1072#1083
            end
            object Beg_Iznos_Nal: TLabel
              Left = 272
              Top = 40
              Width = 84
              Height = 13
              Caption = #1055#1086#1095'.'#1079#1085#1086#1089' '#1085#1072#1083'.'
            end
            object Ost_Price_Nal: TLabel
              Left = 272
              Top = 64
              Width = 110
              Height = 13
              Caption = #1047#1072#1083#1080#1096#1082'.'#1074#1072#1088#1090'. '#1085#1072#1083'.'
            end
            object Ost_Iznos_Nal: TLabel
              Left = 272
              Top = 88
              Width = 107
              Height = 13
              Caption = #1047#1072#1083#1080#1096#1082'.'#1079#1085#1086#1089' '#1085#1072#1083'.'
            end
            object Date_Ost_Nal: TLabel
              Left = 272
              Top = 120
              Width = 84
              Height = 13
              Caption = #1044#1072#1090#1072' '#1086#1089#1090'. '#1085#1072#1083
            end
            object cxTextEdit_Nal_db_sch: TcxTextEdit
              Left = 141
              Top = 11
              Width = 114
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 0
            end
            object cxTextEdit_Nal_kr_sch: TcxTextEdit
              Left = 141
              Top = 32
              Width = 114
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 1
            end
            object cxTextEdit_Nal_am_grp: TcxTextEdit
              Left = 141
              Top = 53
              Width = 114
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 2
            end
            object cxTextEdit_Nal_method_name: TcxTextEdit
              Left = 141
              Top = 75
              Width = 114
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 3
            end
            object cxCurrencyEdit_Nal_minprice: TcxCurrencyEdit
              Left = 141
              Top = 96
              Width = 114
              Height = 21
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 4
              Properties.DisplayFormat = ',0.0000;'
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 4
            end
            object cxCurrencyEdit_Nal_Percent: TcxCurrencyEdit
              Left = 141
              Top = 117
              Width = 114
              Height = 21
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00'#39'%'#39';-,0.00'#39'%'#39
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 5
            end
            object cxTextEdit_Nal_PerNach_Perc: TcxTextEdit
              Left = 141
              Top = 138
              Width = 114
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 6
            end
            object cxTextEdit_Nal_Month: TcxTextEdit
              Left = 201
              Top = 159
              Width = 24
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 8
            end
            object cxTextEdit_Nal_Year: TcxTextEdit
              Left = 141
              Top = 159
              Width = 26
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 7
            end
            object DateOstNal: TcxTextEdit
              Left = 393
              Top = 118
              Width = 123
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 9
            end
            object BegIznosNal: TcxCurrencyEdit
              Left = 393
              Top = 34
              Width = 121
              Height = 21
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.AutoSelect = False
              Properties.DecimalPlaces = 4
              Properties.DisplayFormat = '#,##0.00'
              Properties.HideSelection = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 10
            end
            object BegPriceNal: TcxCurrencyEdit
              Left = 393
              Top = 11
              Width = 121
              Height = 21
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.AutoSelect = False
              Properties.DecimalPlaces = 4
              Properties.DisplayFormat = '#,##0.00'
              Properties.HideSelection = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 11
            end
            object OstIznosNal: TcxCurrencyEdit
              Left = 394
              Top = 85
              Width = 121
              Height = 21
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.AutoSelect = False
              Properties.DecimalPlaces = 4
              Properties.DisplayFormat = '#,##0.00'
              Properties.HideSelection = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 12
            end
            object OstPriceNal: TcxCurrencyEdit
              Left = 393
              Top = 61
              Width = 121
              Height = 21
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.AutoSelect = False
              Properties.DecimalPlaces = 4
              Properties.DisplayFormat = '#,##0.00'
              Properties.HideSelection = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 13
            end
          end
          object cxSplitter3: TcxSplitter
            Left = 556
            Top = 0
            Width = 8
            Height = 182
            HotZoneClassName = 'TcxSimpleStyle'
            HotZone.SizePercent = 100
            AlignSplitter = salRight
            Control = cxGroupBoxNal
            Color = clBtnHighlight
            ParentColor = False
          end
          object cxGroupBoxBuh: TcxGroupBox
            Left = 0
            Top = 0
            Width = 556
            Height = 182
            Align = alClient
            Alignment = alTopLeft
            Color = clBtnFace
            ParentColor = False
            TabOrder = 2
            object Label_buh_db_sch: TLabel
              Left = 6
              Top = 15
              Width = 108
              Height = 13
              Caption = 'Label_buh_db_sch'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label_buh_kr_sch: TLabel
              Left = 6
              Top = 37
              Width = 105
              Height = 13
              Caption = 'Label_buh_kr_sch'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label_am_grp: TLabel
              Left = 6
              Top = 59
              Width = 80
              Height = 13
              Caption = 'Label_am_grp'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label_method_name: TLabel
              Left = 6
              Top = 81
              Width = 117
              Height = 13
              Caption = 'Label_method_name'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Labelminprice: TLabel
              Left = 6
              Top = 101
              Width = 79
              Height = 13
              Caption = 'Labelminprice'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LabelPercent: TLabel
              Left = 6
              Top = 122
              Width = 76
              Height = 13
              Caption = 'LabelPercent'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LabelPerNach_Perc: TLabel
              Left = 6
              Top = 141
              Width = 114
              Height = 13
              Caption = 'LabelPerNach_Perc'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LabelMonthYear: TLabel
              Left = 8
              Top = 163
              Width = 93
              Height = 13
              Caption = 'LabelMonthYear'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LabelGod: TLabel
              Left = 168
              Top = 163
              Width = 5
              Height = 13
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LabelMonth: TLabel
              Left = 225
              Top = 163
              Width = 5
              Height = 13
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object cxTextEdit_buh_db_sch: TcxTextEdit
              Left = 141
              Top = 11
              Width = 112
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 0
            end
            object cxTextEdit_buh_kr_sch: TcxTextEdit
              Left = 141
              Top = 32
              Width = 112
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 1
            end
            object cxTextEdit_am_grp: TcxTextEdit
              Left = 141
              Top = 53
              Width = 112
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 2
            end
            object cxTextEdit_method_name: TcxTextEdit
              Left = 141
              Top = 75
              Width = 112
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 3
            end
            object cxCurrencyEditminprice: TcxCurrencyEdit
              Left = 141
              Top = 96
              Width = 112
              Height = 21
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 4
              Properties.DisplayFormat = ',0.0000;'
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 4
            end
            object cxCurrencyEditPercent: TcxCurrencyEdit
              Left = 141
              Top = 117
              Width = 112
              Height = 21
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00'#39'%'#39';-,0.00'#39'%'#39
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 5
            end
            object cxTextEditPerNach_Perc: TcxTextEdit
              Left = 141
              Top = 138
              Width = 112
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 6
            end
            object cxTextEditYear: TcxTextEdit
              Left = 141
              Top = 159
              Width = 26
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 7
            end
            object cxTextEditMonth: TcxTextEdit
              Left = 199
              Top = 159
              Width = 25
              Height = 21
              ParentFont = False
              Properties.ReadOnly = True
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlack
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsBold]
              TabOrder = 8
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'TabSheet3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ImageIndex = 2
          ParentFont = False
          object cxLabelZavNum: TLabel
            Left = 0
            Top = 19
            Width = 92
            Height = 13
            Caption = 'cxLabelZavNum'
          end
          object cxLabelPassNum: TLabel
            Left = 0
            Top = 43
            Width = 97
            Height = 13
            Caption = 'cxLabelPassNum'
          end
          object cxLabelModel: TLabel
            Left = 0
            Top = 67
            Width = 79
            Height = 13
            Caption = 'cxLabelModel'
          end
          object cxLabelMarka: TLabel
            Left = 0
            Top = 93
            Width = 80
            Height = 13
            Caption = 'cxLabelMarka'
          end
          object cxLabelNote: TLabel
            Left = 0
            Top = 115
            Width = 72
            Height = 13
            Caption = 'cxLabelNote'
          end
          object cxLabelDateCreate: TLabel
            Left = 359
            Top = 18
            Width = 109
            Height = 13
            Caption = 'cxLabelDateCreate'
          end
          object cxLabelDocReg: TLabel
            Left = 359
            Top = 43
            Width = 91
            Height = 13
            Caption = 'cxLabelDocReg'
          end
          object cxLabelDateReg: TLabel
            Left = 359
            Top = 68
            Width = 95
            Height = 13
            Caption = 'cxLabelDateReg'
          end
          object cxTextEditZavNum: TcxTextEdit
            Left = 119
            Top = 16
            Width = 197
            Height = 21
            ParentFont = False
            Properties.ReadOnly = True
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 0
          end
          object cxTextEditPassNum: TcxTextEdit
            Left = 119
            Top = 40
            Width = 197
            Height = 21
            ParentFont = False
            Properties.ReadOnly = True
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 1
          end
          object cxTextEditModel: TcxTextEdit
            Left = 119
            Top = 64
            Width = 197
            Height = 21
            ParentFont = False
            Properties.ReadOnly = True
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 2
          end
          object cxTextEditMarka: TcxTextEdit
            Left = 119
            Top = 88
            Width = 197
            Height = 21
            ParentFont = False
            Properties.ReadOnly = True
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 3
          end
          object cxMemoNote: TcxMemo
            Left = 119
            Top = 112
            Width = 576
            Height = 65
            ParentFont = False
            Properties.ReadOnly = True
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 4
          end
          object cxTextEditDateCreate: TcxTextEdit
            Left = 498
            Top = 16
            Width = 197
            Height = 21
            ParentFont = False
            Properties.ReadOnly = True
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 5
          end
          object cxTextEditDocReg: TcxTextEdit
            Left = 498
            Top = 40
            Width = 197
            Height = 21
            ParentFont = False
            Properties.ReadOnly = True
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 6
          end
          object cxTextEditDateReg: TcxTextEdit
            Left = 498
            Top = 64
            Width = 197
            Height = 21
            ParentFont = False
            Properties.ReadOnly = True
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 7
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'TabSheet4'
          ImageIndex = 3
          object cxGridDragMetal: TcxGrid
            Left = 0
            Top = 0
            Width = 796
            Height = 182
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            PopupMenu = PopupMenuDragAndNormi
            TabOrder = 0
            object cxGridDBTableViewDragMetal: TcxGridDBTableView
              OnDblClick = cxGridInvKartDBTableView1DblClick
              DataController.DataSource = DataSourceDragMet
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.KeyFieldNames = 'R_ID_METALL'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              DataController.Summary.Options = [soSelectedRecords]
              NavigatorButtons.ConfirmDelete = False
              OptionsBehavior.AlwaysShowEditor = True
              OptionsBehavior.IncSearch = True
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.HideFocusRect = False
              OptionsSelection.InvertSelect = False
              OptionsSelection.MultiSelect = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              Styles.Background = cxStyleYellow
              Styles.Content = cxStyleYellow
              Styles.ContentEven = cxStyleYellow
              Styles.ContentOdd = cxStyleYellow
              Styles.Inactive = AfterSelection
              Styles.Selection = cxStyleMalin
              Styles.FilterBox = cxStyleYellow
              Styles.Footer = cxStyleYellow
              Styles.Group = cxStyleYellow
              Styles.GroupByBox = cxStyleYellow
              Styles.Header = ForHaeder
              object cxGridDBTableViewDragMetalDBColumn1: TcxGridDBColumn
                Options.Filtering = False
                SortOrder = soAscending
                DataBinding.FieldName = 'DRAG_NAME'
                IsCaptionAssigned = True
              end
              object cxGridDBTableViewDragMetalDBColumn2: TcxGridDBColumn
                Options.Filtering = False
                DataBinding.FieldName = 'DRAG_SHORT'
                IsCaptionAssigned = True
              end
              object cxGridDBTableViewDragMetalDBColumn3: TcxGridDBColumn
                Options.Filtering = False
                DataBinding.FieldName = 'DRAG_KOL'
                IsCaptionAssigned = True
              end
            end
            object cxGridLevelDragMetal: TcxGridLevel
              GridView = cxGridDBTableViewDragMetal
            end
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'TabSheet5'
          ImageIndex = 4
          object cxGridObjects: TcxGrid
            Left = 0
            Top = 0
            Width = 595
            Height = 182
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            PopupMenu = PopupMenuDragAndNormi
            TabOrder = 0
            object cxGridDBTableView1: TcxGridDBTableView
              OnDblClick = cxGridInvKartDBTableView1DblClick
              DataController.DataSource = DataSourceObj
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.KeyFieldNames = 'OBJ_ID'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              DataController.Summary.Options = [soSelectedRecords]
              NavigatorButtons.ConfirmDelete = False
              OptionsBehavior.AlwaysShowEditor = True
              OptionsBehavior.IncSearch = True
              OptionsCustomize.ColumnFiltering = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.HideFocusRect = False
              OptionsSelection.InvertSelect = False
              OptionsSelection.MultiSelect = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              Styles.Background = cxStyleYellow
              Styles.Content = cxStyleYellow
              Styles.ContentEven = cxStyleYellow
              Styles.ContentOdd = cxStyleYellow
              Styles.Inactive = AfterSelection
              Styles.Selection = cxStyleMalin
              Styles.FilterBox = cxStyleYellow
              Styles.Footer = cxStyleYellow
              Styles.Group = cxStyleYellow
              Styles.GroupByBox = cxStyleYellow
              Styles.Header = ForHaeder
              object cxGridDBTableView1DBColumn7: TcxGridDBColumn
                Width = 127
                DataBinding.FieldName = 'OBJ_NAME_NOMN'
              end
              object cxGridDBTableView1DBColumn1: TcxGridDBColumn
                Width = 115
                DataBinding.FieldName = 'NAME_MATER'
              end
              object cxGridDBTableView1DBColumn2: TcxGridDBColumn
                Width = 49
                DataBinding.FieldName = 'KOL_OBJ'
              end
              object cxGridDBTableView1DBColumn3: TcxGridDBColumn
                Width = 64
                DataBinding.FieldName = 'SUMM_OBJ'
              end
              object cxGridDBTableView1DBColumn4: TcxGridDBColumn
                Width = 53
                DataBinding.FieldName = 'SIZE_OBJ'
              end
              object cxGridDBTableView1DBColumn5: TcxGridDBColumn
                Width = 41
                DataBinding.FieldName = 'COEFF_OBJ'
              end
            end
            object cxGridLevel1: TcxGridLevel
              GridView = cxGridDBTableView1
            end
          end
          object cxSplitterNote_obj_control: TcxSplitter
            Left = 595
            Top = 0
            Width = 8
            Height = 182
            HotZoneClassName = 'TcxSimpleStyle'
            HotZone.SizePercent = 100
            AlignSplitter = salRight
            Control = cxGroupBox1
          end
          object cxGroupBox1: TcxGroupBox
            Left = 603
            Top = 0
            Width = 185
            Height = 182
            Align = alRight
            Alignment = alTopLeft
            TabOrder = 2
            object LabelPrimechanie: TLabel
              Left = 2
              Top = 15
              Width = 101
              Height = 13
              Align = alTop
              Caption = 'LabelPrimechanie'
              Color = clMoneyGreen
              ParentColor = False
            end
            object cxMemo_primech: TcxMemo
              Left = 2
              Top = 28
              Width = 181
              Height = 152
              Align = alClient
              Style.Color = clInfoBk
              TabOrder = 0
            end
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'TabSheet6'
          ImageIndex = 5
          object cxGrid_history: TcxGrid
            Left = 0
            Top = 0
            Width = 813
            Height = 182
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            PopupMenu = PopupMenu_un_oper
            TabOrder = 0
            object cxGrid_historyDBTableView1: TcxGridDBTableView
              DataController.DataSource = DataSource_history
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.KeyFieldNames = 'ID_OP'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsCustomize.ColumnGrouping = False
              OptionsSelection.HideFocusRect = False
              OptionsSelection.InvertSelect = False
              OptionsSelection.MultiSelect = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              Styles.Background = cxStylemalinYellow
              Styles.Content = cxStylemalinYellow
              Styles.ContentEven = cxStylemalinYellow
              Styles.ContentOdd = cxStylemalinYellow
              Styles.Inactive = AfterSelection
              Styles.Selection = cxStyleMalin
              Styles.FilterBox = cxStylemalinYellow
              Styles.Footer = cxStylemalinYellow
              Styles.Group = cxStylemalinYellow
              Styles.GroupByBox = cxStylemalinYellow
              Styles.Header = ForHaeder
              object cxGrid_historyDBTableView1DBColumn1: TcxGridDBColumn
                Options.Editing = False
                Options.Filtering = False
                Options.Grouping = False
                Options.Sorting = False
                Width = 86
                DataBinding.FieldName = 'TIP_OP'
              end
              object cxGrid_historyDBTableView1DBColumn2: TcxGridDBColumn
                FooterAlignmentHorz = taRightJustify
                HeaderAlignmentHorz = taRightJustify
                Options.Editing = False
                Options.Filtering = False
                Width = 54
                DataBinding.FieldName = 'DATE_D'
              end
              object cxGrid_historyDBTableView1DBColumn3: TcxGridDBColumn
                FooterAlignmentHorz = taRightJustify
                HeaderAlignmentHorz = taRightJustify
                HeaderGlyphAlignmentHorz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Width = 42
                DataBinding.FieldName = 'NUM_D'
              end
              object cxGrid_historyDBTableView1DBColumn4: TcxGridDBColumn
                HeaderAlignmentHorz = taRightJustify
                Options.Editing = False
                Options.Filtering = False
                Width = 47
                DataBinding.FieldName = 'SUMMA'
              end
              object cxGrid_historyDBTableView1DBColumn5: TcxGridDBColumn
                Options.Editing = False
                Options.Filtering = False
                Width = 58
                DataBinding.FieldName = 'FIO_OLD'
              end
              object cxGrid_historyDBTableView1DBColumn6: TcxGridDBColumn
                Options.Editing = False
                Options.Filtering = False
                Width = 54
                DataBinding.FieldName = 'FIO_NEW'
              end
              object cxGrid_historyDBTableView1DBColumn7: TcxGridDBColumn
                Options.Editing = False
                Options.Filtering = False
                Width = 50
                DataBinding.FieldName = 'SCH_NUM_OLD'
              end
              object cxGrid_historyDBTableView1DBColumn8: TcxGridDBColumn
                Options.Editing = False
                Options.Filtering = False
                Width = 56
                DataBinding.FieldName = 'SCH_NUM_NEW'
              end
              object cxGrid_historyDBTableView1DBColumn9: TcxGridDBColumn
                Options.Editing = False
                Options.Filtering = False
                Width = 41
                DataBinding.FieldName = 'OST_PRICE'
              end
              object cxGrid_historyDBTableView1DBColumn10: TcxGridDBColumn
                Options.Editing = False
                Options.Filtering = False
                Width = 63
                DataBinding.FieldName = 'OST_IZNOS'
              end
            end
            object cxGrid_historyLevel1: TcxGridLevel
              GridView = cxGrid_historyDBTableView1
            end
          end
        end
        object ts1: TTabSheet
          Caption = #1050#1072#1087'.'#1088#1077#1084#1086#1085#1090
          ImageIndex = 6
          object pnl1: TPanel
            Left = 0
            Top = 0
            Width = 134
            Height = 182
            Align = alLeft
            TabOrder = 0
            object cxButton1: TcxButton
              Left = 3
              Top = 8
              Width = 120
              Height = 25
              Caption = #1044#1086#1076#1072#1090#1080
              TabOrder = 0
              OnClick = cxButton1Click
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                B78183B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
                83B78183B78183FF00FFFF00FFFF00FFC7A79CFEEED4F7E3C5F6DFBCF5DBB4F3
                D7ABF3D3A2F1CF9AF0CF97F0CF98F0CF98F5D49AB78183FF00FFFF00FFFF00FF
                C7A79EFDEFD9F6E3CBF5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC
                97F3D199B78183FF00FFFF00FFFF00FFC7A9A1FEF3E3F8E7D3F5E3CBF5DFC3F3
                DBBBF2D7B2F1D4ABF0D0A3EECC9AEECC97F3D199B78183FF00FFFF00FFFF00FF
                C9ACA5FFF7EBF9EBDAF7E7D2F6E3CAF5DFC2F4DBB9F2D7B2F1D4AAF0D0A1EFCD
                99F3D198B78183FF00FFFF00FFFF00FFCEB2AAFFFCF4FAEFE4F8EADAF7E7D3F5
                E2CBF5DFC2F4DBBBF1D7B2F1D3AAF0D0A1F3D29BB78183FF00FFFF00FFFF00FF
                D3B7AFFFFFFDFBF4ECFAEFE3F9EBDAF7E7D2F5E3C9F5DFC2F4DBBAF2D7B1F0D4
                A9F5D5A3B78183FF00FFFF00FFFF00FFD7BBB2FFFFFFFEF9F5FBF3ECFAEFE2F9
                EADAF8E7D2F5E3CAF5DEC2F4DBBAF2D8B2F6D9ACB78183FF00FFFF00FFFF00FF
                DABEB3FFFFFFFFFEFDFDF8F4FBF3ECF9EFE3F8EADAF7E7D2F6E2CAF6DEC1F4DB
                B9F8DDB4B78183FF00FFFF00FFFF00FFDEC1B5FFFFFFFFFFFFFFFEFDFEF9F4FB
                F3EBFAEFE2F9EBD9F8E6D1F6E2C8F7E1C2F0DAB7B78183FF00FFFF00FFFF00FF
                E2C5B5FFFFFFFFFFFFFFFFFFFFFEFDFDF9F4FBF3EBFAEEE2FAEDDCFCEFD9E6D9
                C4C6BCA9B78183FF00FFFF00FFFF00FFE5C7B7FFFFFFFFFFFFFFFFFFFFFFFFFF
                FEFDFDF8F3FDF6ECF1E1D5C6A194B59489B08F81B78183FF00FFFF00FFFF00FF
                E9CBB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9BF8C76E8B2
                70ECA54AC58768FF00FFFF00FFFF00FFECCDBAFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFE4D4D2C89A7FFAC577CD9377FF00FFFF00FFFF00FFFF00FF
                EACAB6FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEC7977CCF9B
                86FF00FFFF00FFFF00FFFF00FFFF00FFE9C6B1EBCCB8EBCCB8EBCCB8EBCBB8EA
                CBB8EACBB8EACCB9DABBB0B8857AFF00FFFF00FFFF00FFFF00FF}
              UseSystemPaint = False
            end
            object cxButton2: TcxButton
              Left = 3
              Top = 48
              Width = 120
              Height = 25
              Caption = #1047#1084#1110#1085#1080#1090#1080
              TabOrder = 1
              OnClick = cxButton2Click
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFB78183B78183B78183B78183B78183B78183B78183B7
                8183B78183B78183B78183B78183B78183FF00FFFF00FFFF00FFB78183FDEFD9
                F4E1C9E4CFB4D1BCA0CDB798DAC09AE4C599E9C896EDCB96EECC97F3D199B781
                83FF00FFFF00FFFF00FFB48176FEF3E3F8E7D3494645373C3E516061AE9C82BF
                A889D0B48DE4C393EDCB96F3D199B78183FF00FFFF00FFFF00FFB48176FFF7EB
                F9EBDAB0A5981B617D097CA818556F66625BA79479C5AC86DCBD8DEECD95B781
                83FF00FFFF00FFFF00FFBA8E85FFFCF4FAEFE4F2E5D638728629799A8D787F95
                6D6F7959539D8B73BAA380D9BC8CB47F81FF00FFFF00FFFF00FFBA8E85FFFFFD
                FBF4ECFAEFE3A5B3B17C7078E5A6A3C89292A4727276575195856CAF9978A877
                79FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5FBF3ECF4EBDF85787CEEB7B5DA
                A6A6C38E8E9E6E6E73564F93836B996E6FFF00FFFF00FFFF00FFCB9A82FFFFFF
                FFFEFDFDF8F4FBF3ECF0E4D9A37978E9B5B5D9A5A5C48F8F9D6D6D7759528F67
                69FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFFFFEFDFEF9F4FBF3EBE8D9CE9E
                7473E8B5B5D8A4A4C18D8D9D6C6C7D5556FF00FFFF00FFFF00FFDCA887FFFFFF
                FFFFFFFFFFFFFFFEFDFDF9F4FBF3EBE0CFC5A17676ECB9B9D6A2A2C68E8E965F
                5D585C60FF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDF8F3FD
                F6ECDAC5BCAC8080F3BCBBA3878C3392B319ADCC19ADCCFF00FFE3B18EFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9AA7A71B27873469CBA0FCA
                F400A4E6021EAA000099EDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFE4D4D2B8857ADCA76A10A5CF04A8E60936C9092CC30318AEEDBD92FCF7F4
                FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B86FF00FF077D
                CD4860F1204ADD0416AAEDBD92DCA887DCA887DCA887DCA887DCA887DCA887DC
                A887DCA887B8857AFF00FFFF00FFFF00FF3E4BDB192DC4FF00FF}
              UseSystemPaint = False
            end
            object cxButton3: TcxButton
              Left = 4
              Top = 88
              Width = 120
              Height = 25
              Caption = #1042#1080#1076#1072#1083#1080#1090#1080
              TabOrder = 2
              OnClick = cxButton3Click
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FF0732DE0732DEFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FF0732DE
                0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732
                DE0732DEFF00FFFF00FFFF00FF0732DE0732DD0732DE0732DEFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF
                0534ED0732DF0732DE0732DEFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DDFF
                00FF0732DD0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF0732DD0633E60633E60633E90732DCFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0633E307
                32E30534EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF0732DD0534ED0533E90434EF0434F5FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0434F40534EF0533EBFF
                00FFFF00FF0434F40335F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF0335FC0534EF0434F8FF00FFFF00FFFF00FFFF00FF0335FC0335FBFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FCFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB
                0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FF0335FBFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              UseSystemPaint = False
            end
          end
          object cxGrid1: TcxGrid
            Left = 134
            Top = 0
            Width = 662
            Height = 182
            Align = alClient
            TabOrder = 1
            object cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView
              DataController.DataSource = ds1
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '##,#0.00'
                  Kind = skSum
                  FieldName = 'SUMMA'
                  Column = cxgrdbclmnGrid1DBTableView1DBColumn10
                end>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsSelection.CellSelect = False
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              OptionsView.GroupFooters = gfAlwaysVisible
              Styles.Background = cxStyleYellow
              Styles.Content = cxStyleYellow
              Styles.Header = ForHaeder
              object cxgrdbclmnGrid1DBTableView1DBColumn7: TcxGridDBColumn
                Caption = #1044#1072#1090#1072
                Options.Editing = False
                Options.Filtering = False
                Width = 71
                DataBinding.FieldName = 'DATE_REM'
              end
              object cxgrdbclmnGrid1DBTableView1DBColumn8: TcxGridDBColumn
                Caption = #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100
                Options.Editing = False
                Options.Filtering = False
                Width = 171
                DataBinding.FieldName = 'ISPOLNITEL'
              end
              object cxgrdbclmnGrid1DBTableView1DBColumn9: TcxGridDBColumn
                Caption = #1047#1084#1110#1089#1090
                Options.Editing = False
                Options.Filtering = False
                Width = 211
                DataBinding.FieldName = 'SODERJANIE'
              end
              object cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn
                Caption = #1044#1073'. '#1088#1072#1093'.'
                Options.Editing = False
                Options.Filtering = False
                Width = 67
                DataBinding.FieldName = 'DB_SCH_NUMBER'
              end
              object cxgrdbclmnGrid1DBTableView1DBColumn2: TcxGridDBColumn
                Caption = #1050#1088'. '#1088#1072#1093'.'
                Options.Editing = False
                Options.Filtering = False
                Width = 72
                DataBinding.FieldName = 'KR_SCH_NUMBER'
              end
              object cxgrdbclmnGrid1DBTableView1DBColumn3: TcxGridDBColumn
                Caption = #1041#1102#1076#1078'.'
                Options.Editing = False
                Options.Filtering = False
                Width = 53
                DataBinding.FieldName = 'SM_KOD'
              end
              object cxgrdbclmnGrid1DBTableView1DBColumn4: TcxGridDBColumn
                Caption = #1056#1086#1079#1076#1110#1083
                Options.Editing = False
                Options.Filtering = False
                Width = 51
                DataBinding.FieldName = 'RZ_KOD'
              end
              object cxgrdbclmnGrid1DBTableView1DBColumn5: TcxGridDBColumn
                Caption = #1057#1090#1072#1090#1090#1103
                Options.Editing = False
                Options.Filtering = False
                Width = 50
                DataBinding.FieldName = 'ST_KOD'
              end
              object cxgrdbclmnGrid1DBTableView1DBColumn6: TcxGridDBColumn
                Caption = #1050#1045#1050#1042
                Options.Editing = False
                Options.Filtering = False
                Width = 39
                DataBinding.FieldName = 'KEKV_KOD'
              end
              object cxgrdbclmnGrid1DBTableView1DBColumn10: TcxGridDBColumn
                Caption = #1057#1091#1084#1072
                Options.Editing = False
                Options.Filtering = False
                DataBinding.FieldName = 'SUMMA'
              end
            end
            object cxgrdlvlGrid1Level1: TcxGridLevel
              GridView = cxgrdbtblvwGrid1DBTableView1
            end
          end
        end
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 109
    Width = 193
    Height = 398
    Align = alLeft
    TabOrder = 1
    object cxDBTreeListPapka: TcxDBTreeList
      Left = 2
      Top = 15
      Width = 189
      Height = 381
      Styles.Background = cxStyleYellow
      Styles.Content = cxStyleYellow
      Styles.Inactive = AfterSelection
      Styles.Selection = cxStyleMalin
      Styles.BandBackground = cxStyleYellow
      Styles.BandContent = cxStyleYellow
      Styles.BandHeader = cxStyleYellow
      Styles.ColumnFooter = cxStyleYellow
      Styles.ColumnHeader = ForHaeder
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Footer = cxStyleYellow
      Styles.HotTrack = cxStyleYellow
      Styles.IncSearch = cxStyleYellow
      Styles.Indicator = cxStyleYellow
      Styles.Preview = cxStyleYellow
      Align = alClient
      Bands = <
        item
          Caption.Text = 'Band1'
        end>
      BufferedPaint = False
      DataController.DataSource = DataSourcePapka
      DataController.ParentField = 'LINK_TO'
      DataController.KeyField = 'ID_INV_GRP'
      OptionsBehavior.FocusCellOnCycle = True
      OptionsBehavior.IncSearch = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLineColor = clNone
      OptionsView.GridLines = tlglBoth
      PopupMenu = PopupMenuPapka
      RootValue = -1
      TabOrder = 0
      OnClick = cxDBTreeListPapkaClick
      object cxDBTreeListPapkacxDBTreeListColumn1: TcxDBTreeListColumn
        DataBinding.FieldName = 'NAME_GRP'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soDescending
        Width = 187
      end
    end
  end
  object cxSplitter2: TcxSplitter
    Left = 193
    Top = 109
    Width = 8
    Height = 398
    HotZoneClassName = 'TcxSimpleStyle'
    HotZone.SizePercent = 100
    Control = GroupBox2
    OnAfterOpen = cxSplitter2AfterOpen
    OnAfterClose = cxSplitter2AfterClose
    Color = clBtnHighlight
    ParentColor = False
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 1028
    Height = 76
    AutoSize = True
    Bands = <
      item
        Break = False
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 72
        ParentColor = False
        Width = 1024
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 618
      Height = 72
      Align = alNone
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 98
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Images = ImageListButton
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      object ToolButton111: TToolButton
        Left = 0
        Top = 0
        Action = ActionAdd
        AutoSize = True
      end
      object ToolButton2: TToolButton
        Left = 70
        Top = 0
        Action = ActionChange
        AutoSize = True
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton3: TToolButton
        Left = 161
        Top = 0
        Action = ActionDelete
        AutoSize = True
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton8: TToolButton
        Left = 246
        Top = 0
        Action = ActionLook
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton4: TToolButton
        Left = 344
        Top = 0
        Action = ActionRefresh
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton5: TToolButton
        Left = 442
        Top = 0
        HelpType = htKeyword
        Action = Kartaprint
        DropdownMenu = PopupMenu_Print
        ParentShowHint = False
        PopupMenu = PopupMenuPapka
        Wrap = True
        ShowHint = True
        Style = tbsDropDown
      end
      object ToolButton6: TToolButton
        Left = 0
        Top = 36
        Action = ActionFind
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton7: TToolButton
        Left = 98
        Top = 36
        Caption = 'ToolButton7'
        DropdownMenu = PopupMenu_oper
        ImageIndex = 11
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
      end
      object ButAmort: TToolButton
        Left = 211
        Top = 36
        Caption = 'ButAmort'
        DropdownMenu = PopupMenuFor_Amort
        ImageIndex = 29
        Style = tbsDropDown
      end
      object btnNormIzn: TToolButton
        Left = 324
        Top = 36
        Action = actNormIzn
      end
      object btn1: TToolButton
        Left = 422
        Top = 36
        Caption = #1043#1088#1091#1087#1080' '#1090#1072' '#1072#1084#1086#1088#1090
        ImageIndex = 40
        OnClick = btn1Click
      end
      object ToolButton1: TToolButton
        Left = 520
        Top = 36
        Action = ActionClose
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 76
    Width = 1028
    Height = 33
    Align = alTop
    TabOrder = 4
    object cxButtonEditFiltring_Po_Sch: TcxButtonEdit
      Left = 63
      Top = 6
      Width = 90
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxButtonEditFiltring_Po_SchPropertiesButtonClick
      TabOrder = 0
      OnKeyPress = cxButtonEditFiltring_Po_SchKeyPress
    end
    object cxLabelSelPoRah: TcxLabel
      Left = 0
      Top = 8
      Width = 60
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
    object cxLabel_Sel_Mol: TcxLabel
      Left = 155
      Top = 8
      Width = 57
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
    end
    object cxButtonEdit_Filtring_Po_Mol: TcxButtonEdit
      Left = 187
      Top = 5
      Width = 270
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxButtonEdit_Filtring_Po_MolPropertiesButtonClick
      TabOrder = 1
      OnKeyPress = cxButtonEdit_Filtring_Po_MolKeyPress
    end
    object cxButtonSetSelection: TcxButton
      Left = 685
      Top = 3
      Width = 100
      Height = 25
      Action = ActionFiending_in_main_form
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A5636B00A563
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A5636B0084848400A563
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00A5636B00CECED60084848400A563
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00A5636B00EFEFEF0084848400A563
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00A5636B00EFEFEF0084848400A563
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00A5736B00EFEFEF0084848400A563
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD846B00EFEFEF0084848400A563
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00D6946B00EFEFEF0084848400A563
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD7B5A00EFEFEF00CECED600848484004242
        4200A5636B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BD7B5A00EFEFEF00CECED600BDBDBD008C8C8C005A5A
        5A0042424200A5636B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD7B5A00EFEFEF00EFEFEF00C6C6C600ADADAD008C8C8C007373
        73005A5A5A0042424200A5636B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00BD7B5A00EFEFEF00EFEFEF00CECED600BDBDBD009C9C9C00848484008484
        8400737373005A5A5A0042424200A5636B00FF00FF00FF00FF00FF00FF00BD7B
        5A00EFEFEF00EFEFEF00CECED600C6C6C600C6C6C60084848400848484008484
        840084848400737373005A5A5A0042424200A5636B00FF00FF00D6946B00D694
        6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D694
        6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      UseSystemPaint = False
    end
    object cxCheckBoxWorked1: TcxCheckBox
      Left = 483
      Top = 5
      Width = 158
      Height = 21
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Visible = False
    end
    object cxButton_Clearing: TcxButton
      Left = 578
      Top = 3
      Width = 100
      Height = 25
      Action = Action_Cleaning
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF002B90EA002A8FEC00278CE6002288
        DC001F85D700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00278DD5003095E900298EEA00268CE5002187
        DA001E84D500197FCB00167DC600FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0041A7E60051B6F00060C4FA0067CCFE0054B9
        F500379CE200177DC700157BC2000F76B8000D74B200086FA900FF00FF00FF00
        FF00FF00FF00FF00FF00268CD4004CB2ED0058BEF50044A4E6005BBEF50063C7
        FE0058BBF70041A6E900187EC4000E75B6000C73B000086FA900FF00FF00FF00
        FF00FF00FF001F867F00457FB1001666BC002D91E80057BCFD005EC2FA003C9A
        E0005DC1FF0049ACEE0052B6FD0051B4FF0051B4FF00FF00FF00FF00FF00FF00
        FF00026802002BA05A004CB2F0003B9AEC00046B16002472C5002F92E80051B3
        F5004DAFF80049ABF10052B5FF0051B4FF00FF00FF00FF00FF00FF00FF00107E
        190034B34E0061F8920053EB7D002FC847001BB0280028958C004CACE60048AA
        F7003F9DEA0044A5F200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0031AF
        4A0050DE790054ED7F0043DC65001EB72E000BA41100019A020005910A0037AA
        AE007BBADD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF002EB9450022BA3300019A02000199010012AA240025BD4B001EA2
        3D00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00006600004BE371001EB72E000079000001770200108F210005700A00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00249C
        360050E87900059A070000700000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0052EA
        7C002AC23F0000700000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000A77100009A2
        0D0000790100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF001EA22D00006C
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object cxComboBoxWorked: TcxComboBox
      Left = 464
      Top = 5
      Width = 113
      Height = 21
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        ''
        #1053#1077' '#1074#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1110
        #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1110)
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
    end
  end
  object ImageListButton: TImageList
    Left = 40
    Top = 240
    Bitmap = {
      494C01012B002C00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000B0000000010020000000000000B0
      0000000000000000000000000000000000000000000000000000CC6701000000
      000000000000000000009C3B0D009C3B0D009C3B0D009C3B0D009C3B0D000000
      0000000000000000000000000000000000000000000000000000AB817900B389
      7B00B3897B00B3897B00B3897B00B3897B00B3897B00B3897B00B3897B00B389
      7B00B3897B00B3897B00B3897B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001E78
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC670100CC67
      0100CC670100D06A00009C3B0D00FFCF9200EBA45A00DD882E009C3B0D000000
      0000000000000000000000000000000000000000000000000000AE837A00F8E7
      CD00F7E5C800F6E3C400F6E0BF00F5DFBA00F4DDB600F4DBB200F2D8AE00F2D6
      A900F1D5A600F1D3A300B3897B00000000000000000000000000000000000000
      000000000000000000000000000000000000000000001E78310026983E001E78
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      000000000000000000009B390B009C3B0D009C3A0D009B3A0C009C3B0D000000
      0000000000000000000000000000000000000000000000000000B1867B00F8EA
      D300F8E8CF00F7E5CA00F6E4C40000990000F5DFBC00F4DDB700F4DAB300F3D8
      AE00F3D7AA00F2D5A600B3897B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000026983E0021AD39001E78
      31001E7831001E7831001E7831001E7831000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5887B00F9EC
      D900F8EBD400F7E8CF00009900000099000000990000F6DFBD00F4DDB800F3DC
      B300F3D9AF00F3D7AB00B3897B0000000000000000005AD5F2005AD5F2005AD5
      F2005AD5F2005AD5F2005AD5F2001E7831004BCD6A0021AD390021AD390021AD
      390021AD390021AD390021AD39001E7831000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      000000000000000000009C3B0D009C3B0D009C3B0D009C3B0D009C3B0D000000
      0000000000000000000000000000000000000000000000000000B98B7C00FAEF
      DE00F9EDD90000990000499342007AA86600009900006B9F5600F5DFBD00F4DD
      B800F4DBB400F3DAB000B3897B000000000000000000178CB7005AD5F20069E2
      F90069E2F90065DFF70062DCF6004ECBEC001E78310021AD390021AD39004BCD
      6A004BCD6A004BCD6A004BCD6A001E7831000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC670100CC67
      0100CC670100CC6701009C3B0D00FFCF9200EBA45A00DD882E009C3B0D000000
      0000000000000000000000000000000000000000000000000000BD8F7D00FBF2
      E300FBF0DF0000990000F3E9D000F8E9D000BAC89B000099000000990000F1DE
      BB00F4DEB900F4DCB500B3897B0000000000000000006CE3F9005AD5F2005AD5
      F20069E2F90069E2F90069E2F90062DCF6005ED9F4001E7831004BCD6A002698
      3E0046C5E8005AD5F20069E2F900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      000000000000000000009B390B009C3B0D009C3A0D009B3A0C009C3B0D000000
      0000000000000000000000000000000000000000000000000000C1917E00FBF4
      E900FBF2E400FAF0DF00FAEEDB00F9ECD600F8EAD200ECE1C400009900000099
      0000F5E0BF00F5DEBA00B3897B00000000000000000073E5FA006CE3F9001C97
      CA005AD5F20069E2F90069E2F9001C97CA001C97CA005AD5F2001E7831002698
      3E00178CB70069E2F90069E2F900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C5957E00FDF6
      ED00FCF4EA00FBF3E500FBF1E100F9EEDC00FAECD700F8EAD200F8E8CE00F7E6
      C900F7E3C500F6E0BF00B3897B00000000000000000081E9FB007AE7FA006CE3
      F9005AD5F20084E0F70081DFF6007BDDF60078DCF50070DAF4006CD9F3005AD5
      F20081E9FB0073E5FA006CE3F900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      000000000000000000009C3B0D009C3B0D009C3B0D009C3B0D009C3B0D000000
      0000000000000000000000000000000000000000000000000000CA987F00FDF9
      F100DF993E00DF993E00DF993E00DF993E00DF993E00DF993E00DF993E00DF99
      3E00DF993E00F6E3C600B3897B00000000000000000088EBFC0081E9FB005AD5
      F2001E78310088E1F70084E0F7007EDEF6007BDDF60075DBF50070DAF4001DA3
      D60088EBFC007AE7FA0073E5FA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC670100CC67
      0100CC670100CC6701009C3B0D00FFCF9200EBA45A00DD882E009C3B0D000000
      0000000000000000000000000000000000000000000000000000CE9B8000FDFA
      F600FDF9F300FDF7EF00FCF5EB00FCF3E600FAF1E200FAF0DE00FAEDD900F9EA
      D400F8E8D000F7E6CA00B3897B0000000000000000009BF0FD008FECFC0081E9
      FB001E78310026983E001E78310084E0F70081DFF6007BDDF60078DCF50070DA
      F4006CD9F30088EBFC0081E9FB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      000000000000000000009B390B009C3B0D009C3A0D009B3A0C009C3B0D000000
      0000000000000000000000000000000000000000000000000000D19E8100FEFC
      FA00FEFBF600FEF9F300FDF7EF00FCF5EC00FBF3E700FAF1E300FAEFDE00F9EE
      DA00F9EBD500F8E9D100B3897B000000000026983E001E7831001E7831001E78
      31001E78310021AD390026983E0088E1F70084E0F7007EDEF6007BDDF60075DB
      F50070DAF40051BBE50088EBFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C3B0D009C3B0D009C3B0D009C3B
      0D009C3B0D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D5A08100FEFD
      FC00DF993E00DF993E00DF993E00DF993E00DF993E00DF993E00DF993E00DF99
      3E00DF993E00F9EBD600B3897B000000000021AD39003AB155003AB155003AB1
      55003AB155003AB155003AB1550026983E001E78310084E0F70081DFF6007BDD
      F60078DCF50070DAF4006CD9F300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C3B0D00FFCF9200EBA45A00DD88
      2E009C3B0D000000000000000000000000000000000000000000000000000000
      000000000000033DFF0000000000000000000000000000000000D8A28200FFFF
      FF00FFFEFD00FEFDFB00FEFCF700FEFAF400FDF8F100FDF7ED00FBF5E900FBF3
      E400FAF1E000FAEFDC00B3897B000000000021AD39004BCD6A004BCD6A004BCD
      6A004BCD6A003AB155003AB155001E7831002DACDB0028A9D90025A8D90020A5
      D7001EA3D6001DA3D6001DA3D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B390B009C3B0D009C3A0D009B3A
      0C009C3B0D000000000000000000000000000000000000000000000000000000
      0000033DFF0000000000033DFF00000000000000000000000000DAA48200FFFF
      FF00FFFFFF00FFFFFD00FFFDFB00FEFCF800FEFAF400FDF9F200FCF7EE00FCF5
      EA00FCF3E500FAF1E100B3897B00000000000000000000000000000000000000
      000021AD390026983E001E783100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000033DFF000000000000000000DAA48200DAA4
      8200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA4
      8200DAA48200DAA48200DAA48200000000000000000000000000000000000000
      000021AD39001E78310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000033DFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      000000000000000000009C3B0D009C3B0D009C3B0D009C3B0D009C3B0D000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      000000000000000000009C3B0D009C3B0D009C3B0D009C3B0D009C3B0D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC670100CC67
      0100CC670100D06A00009C3B0D00FFCF9200EBA45A00DD882E009C3B0D000000
      0000000000000000000000000000000000000000000000000000CC670100CC67
      0100CC670100D06A00009C3B0D00FFCF9200EBA45A00DD882E009C3B0D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000066000000660000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000660000006600000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      000000000000000000009B390B009C3B0D009C3A0D009B3A0C009C3B0D000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      000000000000000000009B390B009C3B0D009C3A0D009B3A0C009C3B0D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006600001EB231001FB13300006600000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006600001EB231001FB133000066000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      000031C24F0022B738001AB02D0021B437000066000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000066000031C24F0022B738001AB02D0021B4370000660000000000000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      000000000000000000009C3B0D009C3B0D009C3B0D009C3B0D009C3B0D000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      000000000000000000009C3B0D009C3B0D009C3B0D009C3B0D009C3B0D000000
      00000000000000000000000000000000000000000000000000000066000047D3
      6D003BCB5E0025A83B00006600001BA92E001DB1320000660000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      000047D36D003BCB5E0025A83B00006600001BA92E001DB13200006600000000
      0000000000000000000000000000000000000000000000000000CC670100CC67
      0100CC670100CC6701009C3B0D00FFCF9200EBA45A00DD882E009C3B0D000000
      0000000000000000000000000000000000000000000000000000CC670100CC67
      0100CC670100CC6701009C3B0D00FFCF9200EBA45A00DD882E009C3B0D000000
      00000000000000000000000000000000000000000000006600004FD6790053DE
      7F0031B54D00006600000000000000660000179D27001EAE3100006600000000
      0000000000000000000000000000000000000000000000000000006600004FD6
      790053DE7F0031B54D00006600000000000000660000179D27001EAE31000066
      0000000000000000000000000000000000000000000000000000CC6701000000
      000000000000000000009B390B009C3B0D009C3A0D009B3A0C009C3B0D000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      000000000000000000009B390B009C3B0D009C3A0D009B3A0C009C3B0D000000
      00000000000000000000000000000000000000000000000000000066000041C5
      630000660000000000000000000000000000000000000066000019AA2B000066
      0000000000000000000000000000000000000000000000000000000000000066
      000041C5630000660000CE6C6C00B73D3D0000000000000000000066000019AA
      2B00006600000000000000000000000000000000000000000000CC6701000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      000000000000000000000000000000000000000000000000000000660000149D
      210000660000000000000000000000000000000000000000000000000000B73D
      3D0000660000CF6F6F00CD696900CF6E6E00B73D3D0000000000000000000066
      0000149D21000066000000000000000000000000000000000000CC6701000000
      000000000000000000009C3B0D009C3B0D009C3B0D009C3B0D009C3B0D000000
      0000000000000000000000000000000000000000000000000000CC6701000000
      000000000000000000009C3B0D009C3B0D009C3B0D009C3B0D009C3B0D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006600000066000000000000000000000000000000000000B73D3D00DA90
      9000D7868600CD696900B73D3D00CC666600CE6B6B00B73D3D00000000000000
      0000000000000066000000660000000000000000000000000000CC670100CC67
      0100CC670100CC6701009C3B0D00FFCF9200EBA45A00DD882E009C3B0D000000
      0000000000000000000000000000000000000000000000000000CC670100CC67
      0100CC670100CC6701009C3B0D00FFCF9200EBA45A00DD882E009C3B0D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000660000006600000000000000000000B73D3D00DC959500DE9B
      9B00D2777700B73D3D0000000000B73D3D00CA5F5F00CD696900B73D3D000000
      0000000000000000000000660000006600000000000000000000CC6701000000
      000000000000000000009B390B009C3B0D009C3A0D009B3A0C009C3B0D000000
      00002C7E1A00307C1A0000000000000000000000000000000000CC6701000000
      000000000000000000009B390B009C3B0D009C3A0D009B3A0C009C3B0D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B73D3D00D786
      8600B73D3D0000000000000000000000000000000000B73D3D00CC656500B73D
      3D00000000000000000000000000000000009C3B0D009C3B0D009C3B0D009C3B
      0D009C3B0D000000000000000000000000000000000000000000000000000000
      0000307F1C0030801D0000000000000000009C3B0D009C3B0D009C3B0D009C3B
      0D009C3B0D000000000000000000000000000000000000000000000000000017
      DD000017DD00000000000017DD000017DD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B73D
      3D00000000000000000000000000000000000000000000000000B73D3D00C95C
      5C00B73D3D000000000000000000000000009C3B0D00FFCF9200EBA45A00DD88
      2E009C3B0D0000000000000000000000000000000000000000002F811E002C8D
      28002C912B002C8F2A002E872300307F1C009C3B0D00FFCF9200EBA45A00DD88
      2E009C3B0D000000000000000000000000000000000000000000000000000017
      DD000017DD000017DD000017DD000017DD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B73D3D00B73D3D0000000000000000009B390B009C3B0D009C3A0D009B3A
      0C009C3B0D0000000000000000000000000000000000000000002F811E002D8C
      28002B9630002C942F002E862200307F1C009B390B009C3B0D009C3A0D009B3A
      0C009C3B0D000000000000000000000000000000000000000000000000000000
      00000017DD000017DD000017DD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B73D3D00B73D3D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002C922D002C922D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000017
      DD000017DD000017DD000017DD000017DD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002F8320002F83200000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000017
      DD000017DD00000000000017DD000017DD00000000004F6B82003E5E84000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A467690000000000000000000000000000000000000000000000
      00000000000001079F000313A9000418AE000419AE000313A9000108A0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000489DDD001A7FEA004163
      8A000000000000000000000000000D8FC9000D8FC9000D8FC9000D8FC9000D8F
      C9000D8FC9000D8FC900000000000000000000000000A4676900FEE9C700F4DA
      B500F3D5AA00F2D0A000EFCB9600EFC68B00EDC18200AF4B47009C6A6500D4BF
      B500FAFAF200AA706F00921E3200000000000000000000000000000000000104
      9D00041CB1000730C0000734C4000735C5000735C5000734C3000731C100041F
      B30001069E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000037A9FF001C7B
      E3004C638700000000000D8FC9006DDAFC0076D3F7005DC7EF0042BAE7002FB1
      E30028ABE20026A9E0000D8FC9000000000000000000A4676900FCEACE0088BC
      C2002198C6002198C6002198C6002198C600B4575300B64C4E0086383800995B
      5A00F3F8F800BB7E7E00881C1C00B32A6C0000000000000000000109A100052B
      C3000735C7000733C2000732C2000732C2000732C2000732C2000733C3000735
      C400062DBE00020CA40000000000000000000000000000000000000000000000
      9A0000009A000000000000000000000000000000000000000000000000000000
      9A0000009A0000000000000000000000000000000000000000000000000038A7
      FF001F79D5004D627F003B8EB0009FB6BB00ABB7BD0086BAD00055C4EB003ABB
      EA0030B1E3002BADE2000D8FC9000000000000000000A0675B00FEEFDA002198
      C6007AD1F20057C4EB0031B4E60028ABE200A5575600B6424200A3494900954C
      4D00BD919000B86260009E2C2D00B62975000000000001049B00052BCA000636
      D8000431CD000027C400032EC1000732C2000732C2000430C1000027BF00042F
      C1000735C400072EBE0001069E0000000000000000000000000000009A00174A
      FD00103BF40000009A000000000000000000000000000000000000009A00002C
      F8000030FC0000009A0000000000000000000000000000000000000000000000
      000057B0F400A18C8100D9C7A100FFFACB00FFFBCB00EBD8C0008FAFBF0045C5
      F0003BBDEB0035B6E9000D8FC9000000000000000000A0675B00FFF4E5002198
      C600B0EAFE0080D3F30047C1ED0035B8E9009D535100BD656300D7959300D796
      9500CF898700D3919000C76D6D00B628740000000000031ABA000537E7000331
      DD00123DD8006480E0001840CB00002CC100022DC0000F38C4006580D9001B43
      C700052FC1000735C500051FB30000000000000000000000000000009A001A47
      F8001A4CFF00123BF10000009A00000000000000000000009A00012DF6000132
      FF00002AF30000009A0000000000000000000000000000000000000000000000
      00007491A600EFC99700FFF2B600FFFFD100FFFFE000FFFFFF00E1D4CE00779F
      AB0048C9F20042C2EE000D8FC9000000000000000000A7756B00FFFBF0002198
      C600CCF6FF00AAE5FC0062D3F60048C9F2009D565200D7959300DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00D7959300B425700001049E000430E4000436F100002A
      E4005070E900FFFFFF00B7C4F1000D36CA00042DC300A2B2E800FFFFFF006984
      DA000026BE000733C3000731C1000108A0000000000000000000000000000000
      9A001C47F6001B4DFF00143EF40000009A0000009A00002DF8000134FF00032B
      F20000009A000000000000000000000000000000000000000000000000000000
      0000C9978700F6CA8B00F6D09700FFFFD300FFFFEA00FFFFF400F8F6D100C5AF
      9C0058CFF20051CFF4000D8FC9000000000000000000A7756B00FFFFFC002198
      C600D3F7FF00BFF0FF0076E1FE005BD9FA00A0575500D7959300DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00D7959300B4266E00020FAF000336FA000335F8000232
      EE000A35E8008CA2F200FFFFFF00B4C2F100A9B8ED00FFFFFF00A7B7E900133A
      C400052FC1000732C2000734C4000313AA000000000000000000000000000000
      000000009A001D48F6001D50FF00103DFB000431FE000132FF00002CF6000000
      9A00000000000000000000000000000000000000000000000000000000000000
      0000CA9A8C00FACF8F00EDB47500FBEFBC00FFFFD900FFFFD800FBFACC00C7B2
      9F0063D7F6005ED9FA000D8FC9000000000000000000BC826800FFFFFF002198
      C600D0F7FF00BFEFFF007BE6FE006CE5FF00A1565300D7959300DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00D7959300B52571000619BC001747FE00093AFC000435
      F8000131F000002BE80091A5F400FFFFFF00FFFFFF00ABBAEF00062FC500022D
      C0000732C2000732C2000736C5000419AE000000000000000000000000000000
      00000000000000009A001A48F9001342FF000C3CFF000733F60000009A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007A889000EADAB400FBE3BD00EFC08600F4D49D00FFF6BD00F3E2B5008FB0
      B40067E1FE006CE2FE000D8FC9000000000000000000BC826800FFFFFF002198
      C600D1F7FF00C1F0FF007DE7FE0070EAFF002198C600D7959300DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00D7959300000000000B1DBE004168FE001C49FC000335
      FB000031F9000531F200A4B5F700FFFFFF00FFFFFF00B9C6F2000D36D000002C
      C6000732C2000732C2000736C5000418AD000000000000000000000000000000
      00000000000000009A00214EFC001D4BFF001847FF001743F60000009A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AC929200F0E1D100FBD99C00F7CA8900F2CE9A00AFB2B0006FE0
      FA0069E3FE0072E7FF000D8FC9000000000000000000D1926D00FFFFFF002198
      C600D8FAFF00C4F0FF007DE7FF0073EBFF002198C600F6DEC400F3D9B800F4D8
      B100EBCFA400A467690000000000000000000613B4005B7CFC00486CFD000133
      FB00113CFB00A1B4FE00FFFFFF00A4B6F80092A7F500FFFFFF00B6C4F2001A41
      D300042FC8000732C4000734C3000212A9000000000000000000000000000000
      000000009A002E5BF9002C5FFF00224DF800204BF8002355FF001B46F6000000
      9A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000004B88A000BCC1B500D1C7BB00C1C5CB00A3E7FE0074E5
      FF0069E2FE0072E7FF000D8FC9000000000000000000D1926D00FFFFFF002198
      C6002198C6002198C6002198C6002198C6002198C600F8E7D100FBEACE00DECE
      B400B6AA9300A467690000000000000000000003A0004A6AF3008FA6FF001F46
      FB004C6FFC00FFFFFF00A7B8FE000733F600002AED008CA2F600FFFFFF00627F
      E7000028D0000734CC000730C30000069F000000000000000000000000000000
      9A003664FA00386BFF002D59F40000009A0000009A00224CF4002558FF001D49
      F60000009A000000000000000000000000000000000000000000000000000000
      000000000000000000000D8FC9009FF6FF00D3F8FF00D0F7FF00ADEFFF0078E6
      FF006DE5FF0074E9FF000D8FC9000000000000000000DA9D7500FFFFFF002198
      C60080D8F0007BDCF70068D9F60056D0EF002198C600EDD8C900A56B5F00A56B
      5F00A56B5F00A46769000000000000000000000000001A2FCB0099AFFF008BA2
      FE00214DFB004D71FC000E3DFB000030FB000031F7000636F1004C6EF100103C
      E3000432DB000636D700041CB50000000000000000000000000000009A004071
      FA004274FF00325DF10000009A00000000000000000000009A00224DF100275A
      FF00204CF80000009A0000000000000000000000000000000000000000000000
      000000000000000000000D8FC9009DEFFF00ADE3F6009ADAF2007BD5F20058D0
      F20058D4F4006DE3FB000D8FC9000000000000000000DA9D7500FFFFFF0081CB
      E5002198C6002198C6002198C6002198C60083CBE100DAC1BA00A56B5F00E19E
      5500E68F3100B56D4D000000000000000000000000000004A000415EEC00B8C7
      FF009CAFFD003A5CFC000A3AFB000335FB000335FB000133F900052FF2000635
      EB000537E900052CCD0000049C0000000000000000000000000000009A00497A
      FC003B66F30000009A000000000000000000000000000000000000009A002550
      F4002655FA0000009A0000000000000000000000000000000000000000000000
      000000000000000000000D8FC90055C0E6005DBFE30062C4E6005EC4E70052C1
      E6003EBAE2003ABBE3000D8FC9000000000000000000E7AB7900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500A56B5F00F8B5
      5C00BF7A5C0000000000000000000000000000000000000000000309A5004260
      EC00A9BBFF00BDCAFF008EA5FE006483FD005073FC004A6EFD003961FD001444
      F900042CD7000109A20000000000000000000000000000000000000000000000
      9A0000009A000000000000000000000000000000000000000000000000000000
      9A0000009A000000000000000000000000000000000000000000000000000000
      000000000000000000000D8FC90078CEEA00A7EEFC0099EFFF0089EEFF007DEB
      FF0075E9FF0057D3EF000D8FC9000000000000000000E7AB7900FBF4F000FBF4
      EF00FAF3EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000A56B5F00C183
      6C00000000000000000000000000000000000000000000000000000000000004
      A0001E32CD005876F600859EFE008BA3FF007994FE005376FC00234AF000051E
      C50001049C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000D8FC9000D8FC9000D8FC9000D8FC9000D8F
      C9000D8FC9000D8FC900000000000000000000000000E7AB7900D1926D00D192
      6D00D1926D00D1926D00D1926D00D1926D00D1926D00D1926D00A56B5F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000004A0000917B6001022C3000D1FC2000311B40001059F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000005710A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A667C00BE9596000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000005710A0005710A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000097433F009743
      3F00B59A9B00B59A9B00B59A9B00B59A9B00B59A9B00B59A9B00B59A9B009330
      300097433F000000000000000000000000006B9CC3001E89E8004B7AA300C896
      9300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000005710A0005710A0005710A0005710A0005710A0005710A0020B335000571
      0A000000000000000000000000000000000005710A0005710A0005710A000571
      0A000000000000009A0000009A0000009A0000009A0000009A0000009A000000
      9A0000009A0000009A0000009A0000009A000000000097433F00D6686800C660
      6000E5DEDF0092292A0092292A00E4E7E700E0E3E600D9DFE000CCC9CC008F20
      1F00AF46460097433F0000000000000000004BB4FE0051B5FF002089E9004B7A
      A200C69592000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000005710A0076F9A70076F9A70076F9A7006BF0970051DA750033C24D0019AC
      2A0005710A0000000000000000000000000005710A0045D36C0032C350000571
      0A000000000000009A000333F6000D3EFC002551FC00496DFD007A95FE00B5C4
      FF00F5F8FF00FFFFFF00FFFFFF0000009A000000000097433F00D0656600C25F
      5F00E9E2E20092292A0092292A00E2E1E300E2E6E800DDE2E400CFCCCF008F22
      2200AD46460097433F0000000000000000000000000051B7FE0051B3FF001D87
      E6004E7AA000CA97920000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000005710A0005710A0005710A0005710A0005710A0005710A0047D368000571
      0A000000000000000000000000000000000005710A0059E2870049D571000571
      0A000000000000009A000336FC000D3FFD002652FD004A6FFE007B97FF00B8C7
      FF00F8FBFF00FFFFFF00FFFFFF0000009A000000000097433F00D0656500C15D
      5D00ECE4E40092292A0092292A00DFDDDF00E1E6E800E0E5E700D3D0D2008A1E
      1E00AB44440097433F000000000000000000000000000000000051B7FE004EB2
      FF001F89E6004E7BA200B9949700000000000000000000000000000000000000
      000000000000000000000000000000000000000000001C78D5001C78D5001C78
      D5001C78D5001C59960000000000000000000000000005710A0005710A00E4F0
      FC001C78D5001C78D5001C78D5001C78D50005710A0005710A0005710A000571
      0A000000000000009A0000009A0000009A0000009A0000009A0000009A000000
      9A0000009A0000009A0000009A0000009A000000000097433F00D0656500C15B
      5C00EFE6E600EDE5E500E5DEDF00E0DDDF00DFE0E200E0E1E300D6D0D200962A
      2A00B24A4A0097433F00000000000000000000000000000000000000000052B8
      FE004BB1FF002787D9005F6A760000000000B0857F00C09F9400C09F9600BC98
      8E00000000000000000000000000000000001C78D50082C6F90057BCFF004EB5
      FF004DB4FF001C59960000000000000000000000000005710A0000000000E4F0
      FC002A95FF00369BFF00379CFF001C78D5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000097433F00CD626300C860
      6000C9676700CC727200CA727100C6696900C4646400CC6D6C00CA666700C55D
      5D00CD65650097433F0000000000000000000000000000000000000000000000
      000055BDFF00B5D6ED00BF9D9200BB9B8C00E7DAC200FFFFE300FFFFE500FDFA
      DA00D8C3B300B58D850000000000000000001C78D5007DC3F70056BCFF004EB4
      FE004DB3FF001C5996000000000000000000000000000000000000000000E4F0
      FC002893FF003499FF00359AFF001C78D5000000000000000000000000000571
      0A0005710A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000097433F00B6555300C27B
      7800D39D9C00D7A7A500D8A7A600D8A6A500D7A09F00D5A09F00D7A9A700D8AB
      AB00CC66670097433F0000000000000000000000000000000000000000000000
      00000000000000000000CEA79500FDEEBE00FFFFD800FFFFDA00FFFFDB00FFFF
      E600FFFFFB00EADDDC00AE837F00000000001C78D50080C6F9005BC1FF0053BA
      FF0052B8FF001C5996000000000000000000000000000000000000000000E4F0
      FC001F8EFF002B95FF002C96FF001C78D500000000000000000005710A005CE7
      8D0040BE620005710A0005710A00000000000000000000000000000000000000
      00000000000008750E0005710A00000000000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F0000000000000000000000000000000000000000000000
      00000000000000000000C1A09100FBDCA800FEF7D000FFFFDB00FFFFE300FFFF
      F800FFFFFD00FFFFFD00C6A99C00000000001C78D50080C6F9005BC1FF0053BA
      FF0052B8FF001C5996000000000000000000000000000000000000000000E4F0
      FC00E4F0FC00E4F0FC00E4F0FC00E4F0FC00000000000000000005710A0045D1
      6B004ED978002BA5440005710A00000000000000000000000000000000000000
      00000C7A14002BA4430005710A00000000000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F0000000000000000000000000000000000000000000000
      000000000000C1A09100FEE3AC00F1C49100FCF2CA00FFFFDD00FFFFE400FFFF
      F700FFFFF700FFFFE900EEE5CB00B9948C001C78D500629DCF003589CF003589
      CF003589CF001C5996001C5996001C5996001C5996001C5996001C5996000000
      0000000000000000000000000000000000000000000005710A001DA530002DBD
      4A0038C558000A79110000000000000000000000000000000000000000000E7D
      170046C76B0005710A0000000000000000000000000097433F00CC666700F9F9
      F900CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00F9F9
      F900CC66670097433F0000000000000000000000000000000000000000000000
      000000000000C2A19100FFE6AE00EEB58100F7DCAE00FEFDD800FFFFDF00FFFF
      E300FFFFE400FFFFE000F3ECD200BB968E001C78D50086CCF90065CBFF005DC3
      FF005CC4FF003589CF0053BAFF0053BAFF004EB4FF004DB4FF001C78D5000000
      0000000000000000000000000000000000000000000005710A0005710A000A7F
      120022B6380028B741000B7B120006730B0005720B000B7A13001D912D0048CB
      700005710A000000000000000000000000000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F0000000000000000000000000000000000000000000000
      000000000000BC978C00FBE7B700F4C79100F2C99400F8E5B900FEFCD800FFFF
      DD00FFFFDC00FFFFE000E2D2BA00B68E86001C78D50084C9F70065CAFF005EC3
      FE005EC4FF003589CF0053BAFF0054BAFF004FB4FE004FB4FF001C78D5000000
      0000000000000000000000000000000000000000000000000000000000000571
      0A00077D0E0016AD27001EB434001BA02E0020A4340031B94D0042CC65000571
      0A00000000000000000000000000000000000000000097433F00CC666700F9F9
      F900CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00F9F9
      F900CC66670097433F0000000000000000000000000000000000000000000000
      00000000000000000000D9C3A900FFFEE500F7DCB800F2C99400F5D4A500FAE8
      BD00FDF4C900FDFBD600B6908900000000001C78D50085CBF80064CBFF005EC6
      FF005EC7FF003589CF0053BAFF0055BDFF0050B7FF0050B7FF001C78D5000000
      0000000000000000000000000000000000000000000000000000000000000000
      000005710A0005710A000D9C190013A422001BAC2E001BAC2E0005710A000000
      0000000000000000000000000000000000000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F0000000000000000000000000000000000000000000000
      00000000000000000000B58D8500E8DEDD00FFFEF200F9D8A300F4C48C00F9D4
      9F00FDEAB800D0B49F00B8908600000000001C78D5009ECFF50092D7FD0088D2
      FC008CD5FD00629DCF0085CEFD0085CEFD0080C9FC0084CBFD001C78D5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000005710A0005710A0005710A0005710A00000000000000
      000000000000000000000000000000000000000000000000000097433F00F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F90097433F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD827F00C9AA9E00EFE0B700EFDFB200E7CE
      AC00B8908600B89086000000000000000000000000001C78D5001C78D5001C78
      D5001C78D5001C78D5001C78D5001C78D5001C78D5001C78D500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA968A00BB988C00B791
      8800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008957530089575300895754008957
      5300895753008957530089575300895753008957530089575300000000000000
      00000000000000000000000000000000000000000000B7818300A4787400A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400986B66000000000000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      00000000000000000000000000000000000000000000B7818300A4787400A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400986B6600000000000000000089575300E7D5C400E2CFBC00E2CC
      B800E1CBB500E1CBB400E1CAB500E1CBB600E7D5BD0089575300000000000000
      00000000000000000000000000000000000000000000B7818300FDEFD900F6E3
      CB00F5DFC200F4DBBA00F2D7B200F1D4A900F1D0A200EECC9900EECC9700EECC
      9700F3D19900986B66000000000000000000A67A7500F1E1D600EEDBCD00ECD6
      C500EAD1BD00E7CCB500E5C8AD00E3C3A500E0BF9D00A67A7500000000000000
      0000000000000335FB00000000000000000000000000B7818300FDEFD900F6E3
      CB00F5DFC200F4DBBA00F2D7B200F1D4A900F1D0A200EECC9900EECC9700EECC
      9700F3D19900986B66000000000000000000AD706B00F8EEDD00F2E6D700EFE3
      D300EFE1CE00EDDECA00EDDDC700EDDEC700F6E7CE0089575300000000000000
      00000000000000000000000000000000000000000000B4817600FEF3E3009933
      000099330000993300009933000099330000993300009933000099330000EECC
      9700F3D19900986B66000000000000000000A67A7500FCF7F200FAF1E700F9EC
      DC00F7E7D200F5E2C800F4DDBE00F3D8B400F1D4A900A67A7500000000000000
      00000335FB000335FB00000000000000000000000000B4817600FEF3E300F8E7
      D300F5E3CB00F5DFC300CFCF9F00018A0200018A0200CCC68B00EECC9A00EECC
      9700F3D19900986B66000000000000000000B4766D00F7EFE300F7D5B200F8CB
      A100F7CBA300F6CBA000F6CA9D00F3CFAA00F3E6CE0089575300000000000000
      00000000000000000000000000000000000000000000B4817600FFF7EB009933
      0000FEFEFE00FEFEFE00FEFEFE008EA4FD00B8C6FD00FEFEFE0099330000EFCD
      9900F3D19800986B66000000000000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000330E2000000000000000000B4817600FFF7EB00F9EB
      DA00018A0200D1D6AC00018A0200D0CF9E00CECC9800018A0200CCC68900EFCD
      9900F3D19800986B66000000000000000000BB7D6E00F7F3EA00F6E2CC00F6DC
      C200F4DAC000F3D9BC00F3D7B800EED5BA00F0E3CB0089575300000000000000
      00000000000000000000000000000000000000000000BA8E8500FFFCF4009933
      0000FEFEFE00FAFBFE007E98FC000335FB00597AFC00FEFEFE0099330000F0D0
      A100F3D29B00986B660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000335FB0000000000BA8E8500FFFCF400FAEF
      E400018A0200018A0200D1D5AD00F5DFC200F4DBBB00CDCC9800018A0200F0D0
      A100F3D29B00986B66000000000000000000C4866F00FAF6EE00F6D5B500F3C9
      9F00F6CBA300F8CBA100EEC29800D4B79700D1C9B70089575300000000000000
      00000000000000000000000000000000000000000000BA8E8500FFFFFD009933
      0000D6DEFE004368FC000335FB004066FC000436FB00D9E0FE0099330000F0D4
      A900F5D5A300986B66000000000000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      00000000000000000000000000000000000000000000BA8E8500FFFFFD00FBF4
      EC00018A0200018A0200018A0200F5E3C900F5DFC200F4DBBA00F2D7B100F0D4
      A900F5D5A300986B66000000000000000000CA8C7200FBF7F200E1D4C600C6B6
      A700D4C2B100E1CEBB00C1AF9D0091847800918B80007E5F5800000000000000
      00000000000000000000000000000000000000000000CB9A8200FFFFFF009933
      00005274FC001442FB00BCC9FD00EFF2FE001A47FB004F72FC0097330400F2D8
      B200F6D9AC00986B66000000000000000000A67A7500F1E1D600EEDBCD00ECD6
      C500EAD1BD00E7CCB500E5C8AD00E3C3A500E0BF9D00A67A7500000000000000
      0000000000000335FB00000000000000000000000000CB9A8200FFFFFF00FEF9
      F500FBF3EC00FAEFE200F9EADA00F8E7D200018A0200018A0200018A0200F2D8
      B200F6D9AC00986B66000000000000000000D1937300FBFBFA008890A4009A7E
      65009C7F6600AC8C6F003B57810041628E0045465B005C474200000000000000
      000000000000413D3D002D2A2A002D2A2A0000000000CB9A8200FFFFFF009933
      0000E4EAFE00D9E0FE00FEFEFE00FEFEFE0098ACFD000335FB0064345900F4DB
      B900F8DDB400986B66000000000000000000A67A7500FCF7F200FAF1E700F9EC
      DC00F7E7D200F5E2C800F4DDBE00F3D8B400F1D4A900A67A7500000000000000
      00000335FB000335FB00000000000000000000000000CB9A8200FFFFFF00FFFE
      FD00018A0200D6E3C900F9EFE300F8EADA00D2D9B300018A0200018A0200F4DB
      B900F8DDB400986B66000000000000000000D7997400FEFEFE003B5781003B57
      810082807F003B57810062B4E0003B5781002A3B690037334700000000007676
      77003A3A3A00413D3D0024232500413B3B0000000000DCA88700FFFFFF009933
      0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE005677FC000335FB00F7E1
      C200F0DAB700986B66000000000000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000330E2000000000000000000DCA88700FFFFFF00FFFF
      FF00D9EDD800018A0200D6E3C800D5E0C100018A0200D3D8B200018A0200F7E1
      C200F0DAB700986B66000000000000000000DA9D7500FFFFFF003B578100BCEA
      F3003B57810062B4E0003B57810062B4E0003B578100273F730021346A007676
      7700787D8300413D3D0038343500413B3B0000000000DCA88700FFFFFF009933
      000099330000993300009933000099330000993300008F3311002235C8000335
      FB00C6BCA900986B660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000335FB0000000000DCA88700FFFFFF00FFFF
      FF00FFFFFF00D9EDD800018A0200018A0200D5DFC100FAEDDC00FCEFD900E6D9
      C400C6BCA900986B66000000000000000000E7AB7900FFFFFF00FBFBFC003B57
      8100BCEAF3003B57810062B4E0003B57810062B4E0004398E3003481DC007676
      7700EDEDED00413D3D004D4948004843430000000000E3B18E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFD00FDF8F300FDF6EC00F1E1D500B48176000335
      FB000335FB000335FB000000000000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      00000000000000000000000000000000000000000000E3B18E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFD00FDF8F300FDF6EC00F1E1D500B4817600B481
      7600B4817600B48176000000000000000000E7AB7900F8EEE700F8EEE700F6EB
      E6003B5781008FE2F0003B57810062B4E00053ACEA004397E2003481DC007676
      7700EDEDED00413D3D005A5757005B59590000000000E3B18E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FFFEF900E3CFC900B4817600E8B2
      7000ECA54A000335FB000000000000000000A67A7500F1E1D600EEDBCD00ECD6
      C500EAD1BD00E7CCB500E5C8AD00E3C3A500E0BF9D00A67A7500000000000000
      0000000000000335FB00000000000000000000000000E3B18E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FFFEF900E3CFC900B4817600E8B2
      7000ECA54A00C58768000000000000000000E7AB7900D79F8000D8A18100D8A1
      8100D19D80003B5781007FB1CE00B4E5F30053AFED004399E500244283007676
      7700EDEDED00413D3D00737373007373730000000000EDBD9200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4D4D200B4817600FAC5
      7700CD937700000000000000000000000000A67A7500FCF7F200FAF1E700F9EC
      DC00F7E7D200F5E2C800F4DDBE00F3D8B400F1D4A900A67A7500000000000000
      00000335FB000335FB00000000000000000000000000EDBD9200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4D4D200B4817600FAC5
      7700CD9377000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004F7EAF004074B7003B528E00000000007676
      770076767700413D3D00737373005F5E5E0000000000EDBD9200FCF7F400FCF7
      F300FBF6F300FBF6F300FAF5F300F9F5F300F9F5F300E1D0CE00B4817600CF9B
      860000000000000000000000000000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000330E2000000000000000000EDBD9200FCF7F400FCF7
      F300FBF6F300FBF6F300FAF5F300F9F5F300F9F5F300E1D0CE00B4817600CF9B
      8600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000413D3D00413D3D00413D3D0000000000EDBD9200DAA48200DAA4
      8200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200B48176000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000335FB0000000000EDBD9200DAA48200DAA4
      8200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200B48176000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000020A1C9002CAACF001082AC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000868484008684840000000000000000008684840086848400000000000000
      0000000000000000000000000000000000000000000000000000B7818300B781
      8300B7818300B7818300B7818300B7818300B7818300B7818300B7818300B781
      8300B7818300B7818300B7818300000000000000000000000000000000000000
      000000000000000000000000000008780E0008780E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002BA3
      C90024A5CC000F84AE00149AC30024AED60033B1D500188BB4001787AF0043AB
      CC003DA8CB000000000000000000000000000000000000000000000000008684
      8400BCBABA00B5B3B300868484008684840086848400EBEAEA00868484008684
      8400868484000000000000000000000000000000000000000000636E7B00FEEE
      D400F7E3C500F6DFBC00F5DBB400F3D7AB00F3D3A200F1CF9A00F0CF9700F0CF
      9800F0CF9800F5D49A00B7818300000000000000000000000000000000000000
      0000000000000000000008780E0076F9A7000DA31B0008780E00000000000000
      00000000000000000000000000000000000000000000000000000000000032A5
      C90037B8DC0014AED90011A1CB001DC7F00048D7F80034A6CA005CC1DD0067C4
      DE003FA4C600000000000000000000000000000000000000000086848400E3E2
      E200B5B3B300B5B3B300B5B3B300515050004F4F4F0086878700CDCDCD00E8E9
      E900C7C6C600868484008684840086848400000000005E98C7003489D0007F85
      9D00F6E3CB00F5DFC200F4DBBA00F2D7B200F1D4A900F1D0A200EECC9900EECC
      9700EECC9700F3D19900B7818300000000000000000000000000000000000000
      0000000000000000000008780E0076F9A7000EAA1D0008780E00000000000000
      00000000000000000000000000000000000000000000208CB4002C98BD004EB5
      D50085DBEF0051C0DE0039C8EC001ED7FF003ADBFF005FD4F10075C6DF00B0E1
      EC0090CEE1001B8BB50000000000000000000000000086848400DEDDDD00D6D6
      D600A4A3A300A4A3A300A4A3A300565555001615160012121200181818001212
      120093939300CACACA00868484000000000000000000000000004BB6FF00288B
      E00085849800F5E3CB00F5DFC300F3DBBB00F2D7B200F1D4AB00F0D0A300EECC
      9A00EECC9700F3D19900B7818300000000000000000000000000000000000000
      0000000000000000000008780E0076F9A7000EA81C0008780E00000000000000
      0000000000000000000000000000000000000000000060BAD70048B0D20053BE
      E00095EDFF008DEFFF005AE5FF0027DAFF001CD8FF0052E2FF0079E8FF007DEB
      FF003FCBEE0031B1D9002CA4CE000000000086848400D6D6D600D6D6D600A4A3
      A300E0DEDE00D9D7D700CDCBCB00C2C0C000B6B4B4009F9D9D00797677001212
      12001414140013131300868484008F8C8C000000000000000000B48176004DB5
      FF00278BDE0079819A00F6E3CA00F5DFC200F4DBB900F2D7B200F1D4AA00F0D0
      A100EFCD9900F3D19800B7818300000000000000000000000000000000000000
      0000000000000000000008780E0076F9A70010AA1F0008780E00000000000000
      000000000000000000000000000000000000000000001391C00022A6D7004EC3
      EA0081DFF70092EFFF0071D3E8005CB8CC0050B2C9002AC7EB0007D1FF0004CF
      FE0009D0FE0008C9F5000EB4E1000000000086848400D6D6D600A4A3A300F3F2
      F200FFFEFE00FCFBFB00EAE7E800E6E6E600E6E5E500DAD9D900CCCBCB00BFBD
      BD00A2A0A00073717100939191008E8C8C000000000000000000BA8E8500FFFC
      F4004CB9FF005A91BF00A4817900BE978E00AC7E7900BE958900D6B49B00F1D3
      AA00F0D0A100F3D29B00B781830000000000000000000000000008780E000878
      0E0008780E0008780E0008780E0076F9A70019B02C0008780E0008780E000878
      0E0008780E0008780E000000000000000000000000001C8EB80028ADDE003FBB
      E7006DD7F60091C7D3009796960097969600979696009796960045BCD80002D2
      FF0014D3FE001ED2FB000C9ECB000000000086848400A4A3A300FFFFFF00FEFD
      FD00FBFBFB00DFDEDF00ADA7A900B4ADAE00C3BDBE00D1CECF00E0E0E000E1E1
      E100D4D3D300C7C6C600A7A5A500868383000000000000000000BA8E8500FFFF
      FD00FBF4EC00BFA19F00C7A59C00E1C9B800F2DFC600E0C3AD00C59F9000D7B4
      9B00F0D4A900F5D5A300B7818300000000000000000008780E0076F9A70055E3
      830049DA720042D3680037C856002AB9430022B337001CB2300016AF27000FA8
      1D000EA91B000DA21B0008780E0000000000000000001E92BC0027ADDF0031B4
      E3005ACFF40097969600E9E3E200B2B3B300ACA2A200E1B7B5009796960059DC
      FA009CF0FF00B5EFFC003D9BBD0000000000000000008684840086848400F1F0
      F000C2B9BA0093898B00A19B9F00ABA8AA00ABA6A700B1ACAD00AFA9AA00B2AD
      AE00CAC9C900DCDCDC00D0D0D000868484000000000000000000CB9A8200FFFF
      FF00FEF9F500C09C9700E3CEC400F9EADA00F8E7D200FFFFF700E0C2AD00BE95
      8900F2D8B200F6D9AC00B7818300000000000000000008780E0076F9A70076F9
      A70076F9A70076F9A70076F9A70076F9A7002CBB480076F9A70076F9A70076F9
      A70076F9A70076F9A70008780E000000000000000000148CB8001F9DCD0027AC
      DD0047C5EF0097969600E9E2E000B1B2B200ACA2A200DCB5B400979696007CE4
      FB00ACECF9008ACBE00048A5C400000000000000000000000000000000008684
      8400CAA09700BA9E8700A2897E0095817B00897C7F00928C9200A5A2A400BBB6
      B700D7D6D600CFCFCF0086848400000000000000000000000000CB9A8200FFFF
      FF00FFFEFD00AC7F7B00F8EEE700F9EFE300F8EADA00FFFFF000F3DEC700AC7E
      7900F4DBB900F8DDB400B781830000000000000000000000000008780E000878
      0E0008780E0008780E0008780E0076F9A7003CCB5D0008780E0008780E000878
      0E0008780E0008780E00000000000000000000000000000000000E80AA0020A2
      D30036BCEB0097969600E9E2E000B1B2B200ACA2A200DDB6B4009796960065E1
      FD0068CAE6000579A40000000000000000000000000000000000000000000000
      0000CC9A9900FFEAC400FFDDB300EEC39900D5AE8C00C9A78600CC9A99009895
      9600868484008684840000000000000000000000000000000000DCA88700FFFF
      FF00FFFFFF00C19F9C00E6D6D100FBF3EB00FAEFE200FFFFDE00E2C8B800BE97
      8D00F7E1C200F0DAB700B7818300000000000000000000000000000000000000
      0000000000000000000008780E0076F9A70049D9720008780E00000000000000
      0000000000000000000000000000000000000000000000000000000000001389
      B4000D8FBE0097969600ECE5E200B1B2B200ACA2A200E0B8B600979696001E9A
      C1002293BA000000000000000000000000000000000000000000000000000000
      0000CC9A9900FFE7C800FFDDBA00FFDBB100FFD9A600FFD39F00CC9A99000000
      0000000000000000000000000000000000000000000000000000DCA88700FFFF
      FF00FFFFFF00DFCDCB00C9ACA900E6D6D100F8EEE600E3CEC400C7A59C00C3A3
      9400E6D9C400C6BCA900B7818300000000000000000000000000000000000000
      0000000000000000000008780E0076F9A70055E2820008780E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000097969600E5E3E200AEAFAF00ABA1A100D8B6B600979696000000
      000000000000000000000000000000000000000000000000000000000000CE9D
      9B00FFEDDA00FFE7CE00FFE2C300FFDDB800FFDBAE00CC9A9900000000000000
      0000000000000000000000000000000000000000000000000000E3B18E00FFFF
      FF00FFFFFF00FFFFFF00DFCDCB00C19F9C00AC7F7B00C09D9700D6BAB100B885
      7A00B8857A00B8857A00B7818300000000000000000000000000000000000000
      0000000000000000000008780E0076F9A70063F0970008780E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000097969600B2B2B200A0A0A00099969600ABA0A000979696000000
      000000000000000000000000000000000000000000000000000000000000CC9A
      9900FEF0E100FFECD800FFE6CC00FFE1C200FEDDB700CC9A9900000000000000
      0000000000000000000000000000000000000000000000000000E3B18E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FFFEF900E3CFC900B885
      7A00E8B27000ECA54A00C5876800000000000000000000000000000000000000
      0000000000000000000008780E0076F9A70076F9A70008780E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000097969600E1E0E000C6C7C700A5A3A300B3A5A500979696000000
      0000000000000000000000000000000000000000000000000000CC9A9900FFFF
      F500FFFFF500FFF0E100FFEBD600FFE8CC00F6D4BA00CC9A9900000000000000
      0000000000000000000000000000000000000000000000000000EDBD9200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4D4D200B885
      7A00FAC57700CD93770000000000000000000000000000000000000000000000
      000000000000000000000000000008780E0008780E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000097969600E5E4E400EAE9E900BCBCBC00A39E9E00979696000000
      0000000000000000000000000000000000000000000000000000CC9A9900CC9A
      9900CC9A9900FCF3E900FCEADA00FCE5D000CC9A990000000000000000000000
      0000000000000000000000000000000000000000000000000000EDBD9200FCF7
      F400FCF7F300FBF6F300FBF6F300FAF5F300F9F5F300F9F5F300E1D0CE00B885
      7A00CF9B86000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000097969600979696009796960097969600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC9A9900CC9A9900CC9A99000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EDBD9200DCA8
      8700DCA88700DCA88700DCA88700DCA88700DCA88700DCA88700DCA88700B885
      7A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000005710A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000078DBE00078DBE00078D
      BE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE000C851800078D
      BE00078DBE00078DBE0000000000000000000000000000000000B7818300B781
      8300B7818300B7818300B7818300B7818300B7818300B7818300B7818300B781
      8300B7818300B7818300B7818300000000000000000000000000000000000000
      000000000000000000000000000005710A0005710A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000078DBE0025A1D10072C7E70085D7
      FA0066CDF90065CDF90065CDF90065CDF90065CDF80065CDF9000C8518000C85
      180039ADD800078DBE0000000000000000000000000000000000C7A79C00FEEE
      D400F7E3C500F6DFBC00F5DBB400F3D7AB00F3D3A200F1CF9A00F0CF9700F0CF
      9800F0CF9800F5D49A00B7818300000000000000000000000000000000000000
      0000000000000000000005710A0076F9A70005710A0005710A0005710A000571
      0A0005710A0005710A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000078DBE004CBCE70039A8D100A0E2
      FB006FD4FA006FD4F9006ED4FA006FD4F9006FD4FA006FD4FA000C85180027B5
      3F000C85180084D7EB00078DBE00000000000000000000000000C7A79E00FDEF
      D900F6E3CB00F5DFC200F4DBBA00F2D7B200F1D4A900F1D0A200EECC9900EECC
      9700EECC9700F3D19900B7818300000000000000000000000000000000000000
      00000000000005710A0076F9A70076F9A7006FF39E005BE3830042CE610028B9
      3F0014A8240005710A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000078DBE0072D6FA00078DBE00AEEA
      FC0079DCFB000C8518000C8518000C8518000C8518000C8518000C8518002EBC
      4A0027B53F000C851800078DBE00000000000000000000000000C7A9A100FEF3
      E300F8E7D300F5E3CB00F5DFC300F3DBBB00F2D7B200F1D4AB00F0D0A300EECC
      9A00EECC9700F3D19900B7818300000000000000000000000000000000000000
      0000000000000000000005710A0076F9A70005710A0005710A0005710A000571
      0A0005710A0005710A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000078DBE0079DDFB001F8AB300A9BB
      C300ACAAAA000C85180061EB95005CE68D0054DF82004BD6750041CD660038C5
      58002EBC4B0026B53F000C851800000000000000000000000000C9ACA500FFF7
      EB00F9EBDA00F7E7D200F6E3CA00F5DFC200F4DBB900F2D7B200F1D4AA00F0D0
      A100EFCD9900F3D19800B781830000000000000000001C78D5001C78D5001C78
      D5001C78D5001C5996000000000005710A0005710A000000000000000000E4F0
      FC001C78D5001C78D5001C78D5001C78D5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000078DBE0082E3FC0054839A007FC1
      D100EAEEDC000C85180061EB950061EB95005CE68D0054DF82004BD7740041CE
      660037C558002EBC4A0026B43F000C8518000000000000000000CEB2AA00FFFC
      F400FAEFE400F8EADA00F7E7D300F5E2CB00F5DFC200F4DBBB00F1D7B200F1D3
      AA00F0D0A100F3D29B00B7818300000000001C78D50082C6F90057BCFF004EB5
      FF004DB4FF001C599600000000000000000005710A000000000000000000E4F0
      FC002A95FF00369BFF00379CFF001C78D5000000000000000000000000000104
      A2000104A2000104A2000104A2000104A2000104A2000104A2000104A2000104
      A2000104A200000000000000000000000000078DBE008AEAFC0092808200269B
      C600FFFFFE000C85180061EB950061EB950061EB95005CE68E0054DF82004BD7
      750041CE660037C457000C851800078DBE000000000000000000D3B7AF00FFFF
      FD00FBF4EC00FAEFE300F9EBDA00F7E7D200F5E3C900F5DFC200F4DBBA00F2D7
      B100F0D4A900F5D5A300B7818300000000001C78D5007DC3F70056BCFF004EB4
      FE004DB3FF001C5996000000000000000000000000000000000000000000E4F0
      FC002893FF003499FF00359AFF001C78D50000000000000000000104A2005983
      FF000026FF000030FF000030FB00002FF200002FE900002EE1000030D8000031
      D0000034CB000104A2000000000000000000078DBE0093F0FE00B1847B002096
      C000078DBE000C8518000C8518000C8518000C8518000C8518000C85180054DF
      81004BD674000C851800078DBE00078DBE000000000000000000D7BBB200FFFF
      FF00FEF9F500FBF3EC00FAEFE200F9EADA00F8E7D200F5E3CA00F5DEC200F4DB
      BA00F2D8B200F6D9AC00B7818300000000001C78D50080C6F9005BC1FF0053BA
      FF0052B8FF001C5996000000000000000000000000000000000000000000E4F0
      FC001F8EFF002B95FF002C96FF001C78D50000000000000000000104A200ABC2
      FF006480FF006688FF006688FF006687FA006787F5006787F0005779E9004D70
      E4004D74E2000104A2000000000000000000078DBE009BF5FE00BA8D7D00F7EC
      E000FFF4E500FEEDDA00FEE9D300FEE6CB00FFE4C600FBDBBA000C8518005CE6
      8D000C8518000000000000000000000000000000000000000000DABEB300FFFF
      FF00FFFEFD00FDF8F400FBF3EC00F9EFE300F8EADA00F7E7D200F6E2CA00F6DE
      C100F4DBB900F8DDB400B7818300000000001C78D50080C6F9005BC1FF0053BA
      FF0052B8FF001C5996000000000000000000000000000000000000000000E4F0
      FC00E4F0FC00E4F0FC00E4F0FC00E4F0FC000000000000000000000000000104
      A2000104A2000104A2000104A2000104A2000104A2000104A2000104A2000104
      A2000104A200000000000000000000000000078DBE00FEFEFE00C3968100F9F2
      EB00FFFAF100FEF3E600FFEFE000FEEBD900FFEBD400FEE2C8000C8518000C85
      18000989BA000000000000000000000000000000000000000000DEC1B500FFFF
      FF00FFFFFF00FFFEFD00FEF9F400FBF3EB00FAEFE200F9EBD900F8E6D100F6E2
      C800F7E1C200F0DAB700B7818300000000001C78D500629DCF003589CF003589
      CF003589CF001C5996001C5996001C5996001C5996001C5996001C5996000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000078DBE00CD9F8600FAF6
      F200FFFDFA00FFF8F100FEF5EC00FFF6EA00FFF5E800F6E8DA000C851800078D
      BE00000000000000000000000000000000000000000000000000E2C5B500FFFF
      FF00FFFFFF00FFFFFF00FFFEFD00FDF9F400FBF3EB00FAEEE200FAEDDC00FCEF
      D900E6D9C400C6BCA900B7818300000000001C78D50086CCF90065CBFF005DC3
      FF005CC4FF003589CF0053BAFF0053BAFF004EB4FF004DB4FF001C78D5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D5A88B00FBF6
      F300FFFFFF00FEFBFA00FEFCF900EBD8CF00DCC4BC00C9B8B1008C5D5C000000
      0000000000000000000000000000000000000000000000000000E5C7B700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFD00FDF8F300FDF6EC00F1E1D500C6A1
      9400B5948900B08F8100B7818300000000001C78D50084C9F70065CAFF005EC3
      FE005EC4FF003589CF0053BAFF0054BAFF004FB4FE004FB4FF001C78D5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEB08E00FDF8
      F500FFFFFF00FFFFFF00FFFFFF00B4817600B4817600B4817600B48176000000
      0000000000000000000000000000000000000000000000000000E9CBB800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FFFEF900E3CFC900BF8C
      7600E8B27000ECA54A00C5876800000000001C78D50085CBF80064CBFF005EC6
      FF005EC7FF003589CF0053BAFF0055BDFF0050B7FF0050B7FF001C78D5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E5B89100FCF6
      F100FEFCFC00FEFCFB00FFFFFF00B4817600E8B77A00F1B05500000000000000
      0000000000000000000000000000000000000000000000000000ECCDBA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4D4D200C89A
      7F00FAC57700CD93770000000000000000001C78D5009ECFF50092D7FD0088D2
      FC008CD5FD00629DCF0085CEFD0085CEFD0080C9FC0084CBFD001C78D5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EABC9300DCA8
      8700DCA88700DCA88700DCA88700B4817600DFAF7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000EACAB600FCF7
      F400FCF7F300FBF6F300FBF6F300FAF5F300F9F5F300F9F5F300E1D0CE00C797
      7C00CF9B8600000000000000000000000000000000001C78D5001C78D5001C78
      D5001C78D5001C78D5001C78D5001C78D5001C78D5001C78D500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E9C6B100EBCC
      B800EBCCB800EBCCB800EBCBB800EACBB800EACBB800EACCB900DABBB000B885
      7A00000000000000000000000000000000000000000061605F005F5E5D000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000004B
      000000000000000000000000000000000000000000000000000000000000004B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9838500B9838500B983
      8500B9838500B9838500B9838500B98385000000000061605F005F5E5D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B000011A4
      2300004B00000000000000000000000000000000000000000000004B000011A4
      2300004B0000000000000000000000000000893615007D3213007B3113007B31
      13007B3113007B3113007B3113007B3113007B3113007B3113007B3113007B31
      13007B3113007B3113007E3313008A3715000000000000000000000000000000
      00000000000000000000000000000000000000000000B9838500F6DDB700F4D7
      AC00F3D3A100F1CF9800F0CA8F00B98385000000000061605F005F5E5D000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B000027BF46001AAD
      310011A32100004B0000000000000000000000000000004B000027BF46001AAD
      310011A32100004B00000000000000000000692A1100FFF3E700FFEFE0006E6C
      6A00FBE7CF00FCE5C9006E6C6A00FFDEBB00FFDEBB006E6C6A00FED4A700FBCE
      9C006E6C6A00FCCB9700FCCB9700783012000000000000000000000000000000
      00000000000000000000000000000000000000000000BA8E8500F8E5C9008A94
      D9001E47F600888ECD00F2D19C00B98385000000000061605F005F5E5D000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004B000040DE70002DC5530023B6
      400018AB2E0011A12100004B000000000000004B000040DE70002DC5530023B6
      400018AB2E0011A12100004B00000000000065281000EFE7DD006E6C6A006E6C
      6A006E6C6A006E6C6A006E6C6A006E6C6A006E6C6A006E6C6A006E6C6A006E6C
      6A006E6C6A006E6C6A006E6C6A00762F12000000000000000000000000000000
      00000000000000000000000000000000000000000000CB9A8200FAEDD9001E49
      F9000033FF001E48F600F4D8AB00B98385000000000061605F005F5E5D000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B00003EDC6F002DC2
      500024BC4200004B0000000000000000000000000000004B00003EDC6F002DC2
      500024BC4200004B00000000000000000000662810006E6C6A006E6C6A00FFF2
      E2003A55DC0000139D00FFEAD3000A6B0B000D4B0C00FFE2C400AD5858007D2C
      2C00FFDCB700428EE30010478F00762F12000000000000000000000000000000
      00000000000000000000000000000000000000000000DCA88700FCF5E9008D9D
      ED001E49FA008B97E000F6E0BD00B98385000000000061605F005F5E5D000000
      00000000000000000000000000000000000000000000884D4F00723C3D00723C
      3D00723C3D00723C3D0000000000000000000000000000000000004B00003FDE
      7000004B00000000000000000000000000000000000000000000004B00003FDE
      7000004B000000000000000000000000000066281000FEF3E7006E6C6A00FEF3
      E7003754DD000115A000FFEAD300096C0A000D4B0C00FFE2C400AD5858007D2C
      2C00FFDCB700428EE30010478F00762F12000000000000000000000000000000
      00000000000000000000000000000000000000000000E3B18E00FEFBF600FCF7
      ED00FBF2E400FAEDDA00F8E8CE00B98385000000000061605F005F5B5A007441
      420000000000000000000000000000000000823F4000CF909000E5989900DF81
      8200CD747500B9636400723C3D00723C3D00000000000000000000000000004B
      000000000000000000000000000000000000000000000000000000000000004B
      00000000000000000000000000000000000065280F006E6C6A006E6C6A00FEF6
      EB003754DD000115A000FFEAD3000C6D0C000D4B0C00FFE2C400F8D8B600F8D8
      B600FFDCB700428EE30010478F00762F12000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD9200FFFFFF00FEFC
      FA00FDF9F200B9838400B9838400BE8675000000000061605F005B595800B36C
      6D00E3888900C16F7000AD5E5F00954446008D383800F2B0B000FEAFB000FE95
      9600F28A8B00E87F8000B45E5F00723C3D000000000000000000000000000046
      0000000000000000000000000000000000000000000000000000000000000046
      00000000000000000000000000000000000065280F00FFF7EE006E6C6A00FFF7
      EE003754DD000115A000FFEAD3000D6E0D000D4B0C00FFE2C400F8D8B600F8D8
      B600FFDCB700428EE30010478F00762F1200B7818300B7818300B7818300B781
      8300B7818300B7818300B7818300B781830000000000EDBD9200FFFFFF00FFFF
      FF00FEFDFC00B9838400D3976900000000000000000061605F005A585800BD73
      7400FFA1A200FF999A00F0878800BC4F51008E2D2D00ECACAC00FEACAD00FA93
      9400ED878800E37C7D00B45E5F00723C3D00000000000000000000000000004B
      0000004F00000053000000530000004D00000053000000530000004F0000004B
      000000000000000000000000000000000000662810006E6C6A006E6C6A00FFFA
      F3003753DD0000139F00FFEAD3000D6E0D000D4B0C00FEE5C700FFE1C000FADD
      BD00FFDCB700FED8B000FED8B000762F1200B7818300EED1B100E1B89400E1B6
      8C00DFB18000DCAB7500EFC68600B781830000000000EDBD9200DCA88700DCA8
      8700DCA88700B983840000000000007404000000000061605F005A585800BC72
      7300FF9FA000FB959600E9838400B84E50008E2E2E00ECACAC00FEACAD00FA93
      9400ED878800E37C7D00B45F6000723C3D000000000000000000000000000000
      000000000000000000000000000000350F000000000000000000000000000000
      00000000000000000000000000000000000065280F00FFFCFA006E6C6A00FFFB
      F700FFFCFA00FFF2E200FFEAD3000E6D0E000D4B0C00FEE7CE00FFE2C600FFE0
      BF00FFDCB700FED8B000FED8B000752E1100B7818300CA8F6B00952B00009A34
      01009934010099330000E4B57C00B7818300000000000000000045812C000000
      0000000000000000000000000000057E0E000000000061605F005A585800BC72
      7300FF9FA000FB959600E9838400B84E50008E2E2E00ECACAC00FEACAD00FA93
      9400ED878800E47C7D00B55F60006F3B3C000000000000000000000000000000
      0000000082000000820000008200000082000000820000008200000082000000
      0000000000000000000000000000000000006B2D12006E6C6A006E6C6A00FFFC
      FA00FFFCFA00FFF2E200FFEAD300FFEAD300FFEAD300FFEAD300FEE6CB00FEE3
      C400FEDEBC00FEDAB500FED8AD007B341600BA8E8500F8EEE500A1421300972E
      000094290000BD764900FDE5B300B78183000000000001780900109726000000
      0000000000000000000004901200087F10000000000061605F005A585800BC72
      7300FF9FA000FB959600E9838400B84E50008E2E2E00ECACAC00FEACAD00FA93
      9400ED878800E47C7D00B7616200723C3D000000000000000000000000000000
      0000000082000629F4000125FF000018F8000011D8000108AF00000082000000
      0000000000000000000000000000000000009E512300CB934600C68C4200C68C
      4100C68C4100C68C4100C68C4100C68C4100C68C4100C78E4200CC995200CB93
      4700CE995100C1914E00BB955C00A1522200CB9A8200FFFFFF00D5A992009226
      0000A0411200ECCCAE00FFEFC500B781830003750F0049CC72002EA848000370
      0800097B11000C9116000D9C190005730B000000000061605F005A585800C074
      7500FFA4A500FF989900EB848500B84E50008E2E2E00EEAEAE00FCABAC00F892
      9300EB868700E57D7E00C3676800713B3C000000000000000000000000000000
      0000000082001639EB000C36FF000224FF000019F800000ED000000082000000
      00000000000000000000000000000000000099411500CC641400D0651400CF65
      1400CF651400CF651400CF651400CF651400CF651400D1681800F3A96600E070
      1100F3A966009F6339003553C700A6420C00DCA88700FFFFFF00FCF7F500AE5B
      3300CD957400FBF1DE00DECBB400428A3E0044D273005CE78E003ECA600027B8
      400014AB25000EA31B0007800F00000000000000000061605F005C595900A664
      6500D8838400E1848500DD7C7D00BA4F50008D292A00A56A6B009B5B5C00B265
      6600B6656600B1606100A8585900733D3E000000000000000000000000000000
      0000000082002449EB00204EFF000E38FF000328FF000016E700000082000000
      0000000000000000000000000000000000000000000093401A0095401B009540
      1B0095401B0095401B0095401B0095401B0095401B0095411B0099441D00953E
      15009A451C008C3C1A00843D240000000000E3B18E00FFFFFF00FFFFFF00EDDB
      D100F9F2EA00B7818300B7818300B784750030AB4A0038C6580026AF3D000D8A
      180009861100077B0D0000000000000000000000000062605F00626261007758
      57007A3C3D00A25B5C00B3626300854142007E363700753C3D00000000000000
      000000000000000000006B383900723C3D000000000000000000000000000000
      0000000082002D55F300366AFF002758FF001546FF000528F400000082000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDBD9200FFFFFF00FFFFFF00FFFF
      FF00FDFFFF00B7818300DC9D64000000000000000000138E2100199F29000000
      0000000000000000000000000000000000000000000061605F0061605F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000082000000820000008200000082000000820000008200000082000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDBD9200DCA88700DCA88700DCA8
      8700DCA88700B7818300000000000000000000000000000000000A7D12000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000732DE000732DE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009A6666006933340000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9838500B9838500B983
      8500B9838500B9838500B9838500B9838500000000000732DE000732DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000732DE000732DE0000000000B7818300B7818300B7818300B781
      8300B7818300B7818300B7818300B7818300B7818300B7818300B7818300B781
      8300B78183000000000000000000000000000000000000000000000000000000
      00009A6666009A666600B9666600BB6868006933340000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9838500F6DDB700F4D7
      AC00F3D3A100F1CF9800F0CA8F00B9838500000000000732DE000732DE000732
      DE00000000000000000000000000000000000000000000000000000000000000
      00000732DE000732DE000000000000000000B7818300FDEFD900F4E1C900E4CF
      B400D1BCA000CDB79800DAC09A00E4C59900E9C89600EDCB9600EECC9700F3D1
      9900B781830000000000000000000000000000000000000000009A6666009A66
      6600C66A6B00D06A6B00D2686900C3686900693334009A6666009A6666009A66
      66009A6666009A6666009A666600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA8E8500F8E5C9008A94
      D9001E47F600888ECD00F2D19C00B9838500000000000732DE000732DD000732
      DE000732DE000000000000000000000000000000000000000000000000000732
      DE000732DE00000000000000000000000000B4817600FEF3E300F8E7D3004946
      4500373C3E0051606100AE9C8200BFA88900D0B48D00E4C39300EDCB9600F3D1
      9900B781830000000000000000000000000000000000000000009A666600DE73
      7400D7707100D56F7000D56D6E00C76A6D0069333400FEA2A300FCAFB000FABC
      BD00F9C5C600F9C5C6009A666600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CB9A8200FAEDD9001E49
      F9000033FF001E48F600F4D8AB00B983850000000000000000000534ED000732
      DF000732DE000732DE00000000000000000000000000000000000732DE000732
      DE0000000000000000000000000000000000B4817600FFF7EB00F9EBDA00B0A5
      98001B617D00097CA80018556F0066625B00A7947900C5AC8600DCBD8D00EECD
      9500B781830000000000000000000000000000000000000000009A666600E077
      7800DB757600DA747500DA727300CC6E71006933340039C5650025CF630029CC
      630019CB5B00F9C5C6009A666600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DCA88700FCF5E9008D9D
      ED001E49FA008B97E000F6E0BD00B98385000000000000000000000000000000
      00000732DE000732DE000732DD00000000000732DD000732DE000732DE000000
      000000000000000000000000000000000000BA8E8500FFFCF400FAEFE400F2E5
      D6003872860029799A008D787F00956D6F00795953009D8B7300BAA38000D9BC
      8C00B47F810000000000000000000000000000000000000000009A666600E57D
      7E00E07A7B00DF797A00DF777800D07275006933340042C4680030CD670033CB
      670024CB6000F9C5C6009A666600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E3B18E00FEFBF600FCF7
      ED00FBF2E400FAEDDA00F8E8CE00B98385000000000000000000000000000000
      0000000000000732DD000633E6000633E6000633E9000732DC00000000000000
      000000000000000000000000000000000000BA8E8500FFFFFD00FBF4EC00FAEF
      E300A5B3B1007C707800E5A6A300C8929200A47272007657510095856C00AF99
      7800A877790000000000000000000000000000000000000000009A666600EA82
      8300E57F8000E37D7E00E6808100D3747600693334003DC2640029CB63002FCA
      640020CA5E00F9C5C6009A666600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD9200FFFFFF00FEFC
      FA00FDF9F200B9838400B9838400BE8675000000000000000000000000000000
      000000000000000000000633E3000732E3000534EF0000000000000000000000
      000000000000000000000000000000000000CB9A8200FFFFFF00FEF9F500FBF3
      EC00F4EBDF0085787C00EEB7B500DAA6A600C38E8E009E6E6E0073564F009383
      6B00996E6F0000000000000000000000000000000000000000009A666600F087
      8800E9818200EC969700FBDDDE00D8888A0069333400B8E1AC006BDC89005DD5
      800046D47300F9C5C6009A66660000000000B7818300B7818300B7818300B781
      8300B7818300B7818300B7818300B781830000000000EDBD9200FFFFFF00FFFF
      FF00FEFDFC00B9838400D3976900000000000000000000000000000000000000
      0000000000000732DD000534ED000533E9000434EF000434F500000000000000
      000000000000000000000000000000000000CB9A8200FFFFFF00FFFEFD00FDF8
      F400FBF3EC00F0E4D900A3797800E9B5B500D9A5A500C48F8F009D6D6D007759
      52008F67690000000000000000000000000000000000000000009A666600F58C
      8D00EE868700F0999A00FDDCDD00DA888A0069333400FFF5D800FFFFE000FFFF
      DE00ECFDD400F9C5C6009A66660000000000B7818300EED1B100E1B89400E1B6
      8C00DFB18000DCAB7500EFC68600B781830000000000EDBD9200DCA88700DCA8
      8700428A3E00B983840000000000000000000000000000000000000000000000
      00000434F4000534EF000533EB0000000000000000000434F4000335F8000000
      000000000000000000000000000000000000DCA88700FFFFFF00FFFFFF00FFFE
      FD00FEF9F400FBF3EB00E8D9CE009E747300E8B5B500D8A4A400C18D8D009D6C
      6C007D55560000000000000000000000000000000000000000009A666600FA91
      9200F48E8F00F28B8C00F48C8D00DC7F800069333400FDF3D400FFFFDF00FFFF
      DD00FFFFE000F9C5C6009A66660000000000B7818300CA8F6B00952B00009A34
      01009934010099330000E4B57C00B78183000000000000000000000000000375
      0F0044D2730030AB4A0000000000000000000000000000000000000000000335
      FC000534EF000434F800000000000000000000000000000000000335FC000335
      FB0000000000000000000000000000000000DCA88700FFFFFF00FFFFFF00FFFF
      FF00FFFEFD00FDF9F400FBF3EB00E0CFC500A1767600ECB9B900D6A2A200C68E
      8E00965F5D00585C6000000000000000000000000000000000009A666600FE97
      9800F9939400F8929300F9909200E085850069333400FDF3D400FFFFDF00FFFF
      DD00FFFFDF00F9C5C6009A66660000000000BA8E8500F8EEE500A1421300972E
      000094290000BD764900FDE5B300B781830000000000000000000178090049CC
      72005CE78E0038C65800138E21000000000000000000000000000335FB000335
      FB000335FC000000000000000000000000000000000000000000000000000335
      FB000335FB00000000000000000000000000E3B18E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFD00FDF8F300FDF6EC00DAC5BC00AC808000F3BCBB00A387
      8C003392B30019ADCC0019ADCC000000000000000000000000009A666600FF9B
      9C00FD979800FC969700FE979800E388890069333400FDF3D400FFFFDF00FFFF
      DD00FFFFDF00F9C5C6009A66660000000000CB9A8200FFFFFF00D5A992009226
      0000A0411200ECCCAE00FFEFC500B78183000000000045812C00109726002EA8
      48003ECA600026AF3D00199F29000A7D1200000000000335FB000335FB000335
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000335FB000000000000000000E3B18E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFC00FFFEF900E3CFC900AA7A7100B2787300469C
      BA000FCAF40000A4E600021EAA000000990000000000000000009A666600FF9F
      A000FF9A9B00FF999A00FF9A9B00E78C8D0069333400FDF3D400FFFFDF00FFFF
      DD00FFFFDF00F9C5C6009A66660000000000DCA88700FFFFFF00FCF7F500AE5B
      3300CD957400FBF1DE00DECBB400B78183000000000000000000000000000370
      080027B840000D8A180000000000000000000335FB000335FB000335FB000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDBD9200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4D4D200B8857A00DCA76A0010A5
      CF0004A8E6000936C900092CC3000318AE0000000000000000009A6666009A66
      6600E98E8F00FE999A00FF9D9E00EB8F900069333400FBF0D200FDFCDC00FDFC
      DA00FDFCDC00F9C5C6009A66660000000000E3B18E00FFFFFF00FFFFFF00EDDB
      D100F9F2EA00B7818300B7818300B7847500000000000000000000000000097B
      110014AB25000986110000000000000000000335FB000335FB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDBD9200FCF7F400FCF7F300FBF6
      F300FBF6F300FAF5F300F9F5F300F9F5F300E1D0CE00B8857A00CF9B86000000
      0000077DCD004860F100204ADD000416AA000000000000000000000000000000
      00009A666600B0717200D7868700DA888800693334009A6666009A6666009A66
      66009A6666009A6666009A66660000000000EDBD9200FFFFFF00FFFFFF00FFFF
      FF00FDFFFF00B7818300DC9D64000000000000000000000000000A8812000C91
      16000EA31B00077B0D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDBD9200DCA88700DCA88700DCA8
      8700DCA88700DCA88700DCA88700DCA88700DCA88700B8857A00000000000000
      0000000000003E4BDB00192DC400000000000000000000000000000000000000
      000000000000000000009A6666009A6666006933340000000000000000000000
      000000000000000000000000000000000000EDBD9200DCA88700DCA88700DCA8
      8700DCA88700B7818300000000000000000007800F0007800F00049012000D9C
      190007800F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F0000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400A47874008C5D5C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000FFFFFF007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      000000000000A87C7500FEE5CB00FFE2C400FFDFBE00FFDCB800FFD9B100FED6
      AC00FFD4A600FFD1A2008C5D5C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F00FFFFFF000000
      00007F7F7F007F7F7F007F7F7F00FFFFFF00000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD807800FFEAD400E5A65700E5A65700E5A65700E5A65700E5A6
      5700E5A65700FFD4A8008C5D5C00000000000000000000000000000000000000
      9A0000009A000000000000000000000000000000000000000000000000000000
      9A0000009A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F00FFFFFF00FFFF
      FF00000000007F7F7F007F7F7F00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B4867A00FEEEDD00FFEBD600FFE8CF00FFE4C900FEE1C200FEDD
      BB00FFDBB500FFD8AF008C5D5C0000000000000000000000000000009A00174A
      FD00103BF40000009A000000000000000000000000000000000000009A00002C
      F8000030FC0000009A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F00FFFF
      FF00FFFFFF007F7F7F007F7F7F00000000007F7F7F007F7F7F00FFFFFF00FFFF
      FF0000000000000000000000000000000000A4787400A4787400A4787400A478
      7400A4787400BA8D7D00FEF2E500E5A65700E5A65700E5A65700E5A65700E5A6
      5700E5A65700FEDCB7008C5D5C0000000000000000000000000000009A001A47
      F8001A4CFF00123BF10000009A00000000000000000000009A00012DF6000132
      FF00002AF30000009A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F00FFFFFF007F7F7F00000000007F7F7F007F7F7F007F7F7F007F7F7F00FFFF
      FF00FFFFFF00000000000000000000000000A87C7500FEE5CB00FFE2C400FFDF
      BE00FFDCB800C2958100FEF6EC00FEF3E600FEEFE100FFEDDA00FEE9D400FEE6
      CC00FFE2C600FEDFBF008C5D5C00000000000000000000000000000000000000
      9A001C47F6001B4DFF00143EF40000009A0000009A00002DF8000134FF00032B
      F20000009A000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000080000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF007F7F7F00000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F00FFFFFF00FFFFFF000000000000000000AD807800FFEAD400E5A65700E5A6
      5700E5A65700CA9B8300FFF9F300E5A65700E5A65700E5A65700E5A65700E5A6
      5700E5A65700FEE3C8008C5D5C00000000000000000000000000000000000000
      000000009A001D48F6001D50FF00103DFB000431FE000132FF00002CF6000000
      9A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      800000000000000000000000000000000000000000007F7F7F007F7F7F00FFFF
      FF0000000000FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F0000000000FFFFFF0000000000B4867A00FEEEDD00FFEBD600FFE8
      CF00FFE4C900D1A28600FEFBF900FEF9F400FEF7EF00FEF5EA00FEF1E400FEEE
      DE00FEEBD700FEE8D0008C5D5C00000000000000000000000000000000000000
      00000000000000009A001A48F9001342FF000C3CFF000733F60000009A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      000000808000000000000000000000000000000000007F7F7F007F7F7F00FFFF
      FF007F7F7F0000000000FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F00000000007F7F7F0000000000FFFFFF00BA8D7D00FEF2E500E5A65700E5A6
      5700E5A65700D8A98A00FEFEFD00FEFCFA00FEFAF600FEF8F100FEF5EC00EBDF
      DB00D3C2C000BAA9AA008C5D5C00000000000000000000000000000000000000
      00000000000000009A00214EFC001D4BFF001847FF001743F60000009A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000000000FF
      FF000000000000808000000000000000000000000000000000007F7F7F007F7F
      7F00000000007F7F7F0000000000000000007F7F7F007F7F7F007F7F7F000000
      00007F7F7F00000000007F7F7F0000000000C2958100FEF6EC00FEF3E600FEEF
      E100FFEDDA00DFB08D00FEFEFE00FEFEFE00FEFCFB00FEFBF700FEF8F200B481
      7600B4817600B4817600B17F7400000000000000000000000000000000000000
      000000009A002E5BF9002C5FFF00224DF800204BF8002355FF001B46F6000000
      9A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF000000000000808000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000007F7F7F00000000007F7F
      7F00000000007F7F7F00000000007F7F7F00CA9B8300FFF9F300E5A65700E5A6
      5700E5A65700E4B58E00FEFEFE00FEFEFE00FEFEFE00FEFDFC00FEFBF800B481
      7600EBB56F00E49B420000000000000000000000000000000000000000000000
      9A003664FA00386BFF002D59F40000009A0000009A00224CF4002558FF001D49
      F60000009A000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF0000808000008080000000000000000000000000000000
      00007F7F7F0000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F00000000000000000000000000D1A28600FEFBF900FEF9F400FEF7
      EF00FEF5EA00E8B89000DCA88700DCA88700DCA88700DCA88700DCA88700B481
      7600F0B25E00000000000000000000000000000000000000000000009A004071
      FA004274FF00325DF10000009A00000000000000000000009A00224DF100275A
      FF00204CF80000009A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00008080000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000007F7F
      7F0000000000FFFFFF000000000000000000D8A98A00FEFEFD00FEFCFA00FEFA
      F600FEF8F100FEF5EC00EBDFDB00D3C2C000BAA9AA008C5D5C00000000000000
      000000000000000000000000000000000000000000000000000000009A00497A
      FC003B66F30000009A000000000000000000000000000000000000009A002550
      F4002655FA0000009A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000000000000000000000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      00007F7F7F0000000000FFFFFF0000000000DFB08D00FEFEFE00FEFEFE00FEFC
      FB00FEFBF700FEF8F200B4817600B4817600B4817600B17F7400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      9A0000009A000000000000000000000000000000000000000000000000000000
      9A0000009A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F0000000000FFFFFF00E4B58E00FEFEFE00FEFEFE00FEFE
      FE00FEFDFC00FEFBF800B4817600EBB56F00E49B420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000E8B89000DCA88700DCA88700DCA8
      8700DCA88700DCA88700B4817600F0B25E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000002B90EF00278DE70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5636B00A5636B00000000000000
      0000000000000000000000000000000000000000000000000000854200008240
      0000773A00006D35000069330000693400006934000069340000693400006A34
      00006A3400005A2B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002A8FEC00278CED002489E4002388DD001E84D5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5636B0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000AB540000CB650000C561
      0000BC5D0000B5590000AF570000AD560000AE560000AE560000AE560000AE56
      0000B3590000954A00005A2C0000000000000000000099451700994517009945
      1700994517009945170099451700994517009945170099451700994517009945
      1700994517009945170099451700000000000000000000000000000000000000
      000000000000298FD6003DA2EB003EA3F000379CEA002186DA001A81D100187E
      CA00157CC4001177BB0000000000000000000000000000000000000000000000
      00000000000000000000A5636B00CECED60084848400A5636B00000000000000
      00000000000000000000000000000000000000000000C7630000E9730000DD6D
      0000D66A0000D0670000C8630000C1600000BF5F0000BE5E0000BF5E0000BF5E
      0000C4610000B35900006A34000000000000CF892300FFC47D00E3A45C00DC99
      4C00FFAB4500ED993500D1842700FB951D00FF931100FA880900FA820100FA80
      0000FA800000FB810000FF880000994517000000000000000000000000000000
      0000000000003CA2E10058BDF20060C4F9003D9EE50057BCF7003398DF001E83
      CD001076BC000B73B4000B72AF00086FAA000000000000000000000000000000
      00000000000000000000A5636B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000D1680000ED760200E271
      0200DC6E0200D5690000D98C3F00DA9A5A00D6985B00CF8C4B00C2702000BA5C
      0000BF5E0000AE5600006A34000000000000E0970E00E9AF7A003E352C003931
      2900C68641006C4F2D002B272300A7692200C9771B00362B1C003A2D1B00382B
      1C003B2C180047311600F37F0000994517000000000000000000000000000000
      0000046B16004AB0F90053B7F7002F87D10063C7FB003D9EE5005BBFFB0055BA
      FA003499DE002D93D8000F76B300066DA7000000000000000000000000000000
      00000000000000000000A5636B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000D66A0000F6821100EE7B
      0B00E6750500DE6E0000EFC79F00FEFEFE00FEFEFE00FEFEFE00FEFEFE00D193
      5700BF5E0000AE5600006934000000000000E0970E00FFC28900BB8B5B00AF7F
      4D00FAAB5200CA883E00A66E2E00E78F2800E28A2A009A653C00B56B2200D774
      0700A35E2100A6602100FE86000099451700000000000000000000000000187D
      5F002B7A8300046B16002884DE003C99D900227BCE0040A0EA005ABEFE004FB2
      F50056B9FF0056B9FF0046AAF300000000000000000000000000000000000000
      00000000000000000000A5736B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000D66A0000F8933000F485
      1900F07C0B00E8740200E1730700DD771400D7771800D2761D00E5B98D00FEFE
      FE00BF5E0000AE5600006934000000000000E0970E00E7B18100453B33004137
      2E00C58B4D0072553500352D2500A16A28007F6379001A2AD40052498A00BB70
      2F001C2EC6002030BD00E57A0A009945170000000000000000000F7D15003CBE
      610031C6480031C6480031C64800046B1600046B16002D87B6003998E80044A5
      F00052B6FF0052B5FF0000000000000000000000000000000000000000000000
      00000000000000000000BD846B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000D66A0000F9A75600F48E
      2900F3811100F17C0700F7CA9E00E4710000DE6E0000D76A0000D2721400FEFE
      FE00C6620000B15700006A34000000000000E0970E00FEC48B00AA835D009F78
      5100FCB46500C68A4A008A603400EA953400E2903D006E587B00B7743B00FE8C
      0A0084594E008A594400FE86000099451700000000001587220031AF4A0062F9
      920050EB6F0031C648001DA746002398760031C6480031C64800046B1600046B
      1600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6946B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000D66A0000F9B36F00F494
      3500F3841700F9C99900FEFEFE00EE760000E6720000DE6E0000E69F5B00FEFE
      FE00CF660000B85B00007339000000000000E0970E00E2AD7F00483E34004037
      3000BF8F590070563B002E2925009F6C300086697F001427DA00534B8F00C077
      32001C2FC5001F2FBD00DA780F00994517000000000030AD48002BA641004FE7
      780037D053001AB42700029D0100009B000010A41E0032B9720046A7AC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD7B5A00EFEFEF00CECED6008484840042424200A5636B000000
      00000000000000000000000000000000000000000000D66A0000FABA7B00F599
      3F00FBDBBB00FEFEFE00FEFEFE00FCECDC00FBE1C700F9E0C700FEFEFE00EEBD
      8C00D96B0000C26000008240000000000000E0970E00FFC78F00FBB77B00F2B0
      7700FFC17900FEAF6300EA9C4F00FFAB4600FFA43500DA8E4100FB962500FF97
      1300E9831800EE800D00FF8800009945170000000000000000000A7510002AAE
      3F0022BC3200049A0600009400000CA118000278040002780400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD7B5A00EFEFEF00CECED600BDBDBD008C8C8C005A5A5A0042424200A563
      6B000000000000000000000000000000000000000000D66A0000FABF8500F69F
      4B00FBD8B700FEFEFE00FEFEFE00FBDEC300F9CA9C00F9C99A00F2A45800E571
      0000E3700000CD6500009047000000000000E0970E00F2BB8900D8D4AF00D9D7
      B000D4D0AA00D8D1A600DACF9D00D4C99200DEC68800FFAD4200FB962500EF8C
      1E00F3881000F6860800FF880100994517000000000000000000259E390042DC
      64000B9F110000770000027804000B8717000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD7B
      5A00EFEFEF00EFEFEF00C6C6C600ADADAD008C8C8C00737373005A5A5A004242
      4200A5636B0000000000000000000000000000000000D66A0000FBC79400F7AB
      6100F5973B00FACDA100FEFEFE00F3861B00F3841700F37E0B00F2790200EE76
      0000EB750000D76A00009E4E000000000000E0970E00C79A730050C6BB0051CB
      C00051CBC00051CBC10051CBC1004BCBC40074D7CE00FBB56000BB742600A167
      2300985F1C00B0681300FF8B040099451700000000001D912C0044DE68000FA3
      1500006F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD7B5A00EFEF
      EF00EFEFEF00CECED600BDBDBD009C9C9C008484840084848400737373005A5A
      5A0042424200A5636B00000000000000000000000000D66A0000FBC99800F9C4
      9000F8B77700F7AF6900FAD2AA00F59C4400F4933300F3841700F27C0800F379
      0200F5790000E2700000AB54000000000000EAA12700F6BA8B00C4976C00C498
      6C00C4986C00C4976B00C4956000C18E5300D1965000FFAB4F00F39A3800FB9A
      2D00E0862100EF891600FF910A009945170013831D0043D9640012AB1C000073
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD7B5A00EFEFEF00EFEF
      EF00CECED600C6C6C600C6C6C600848484008484840084848400848484007373
      73005A5A5A0042424200A5636B000000000000000000D76A0000FBB97800FBCA
      9A00FBCC9E00FBC79400FABE8300F9B16A00F89E4600F78D2400F6800B00F67B
      0200FB7C0000EA740000B55A00000000000000000000DC910300E79F2300EBA5
      3400E9A33400E29E3400EEA74700EEA34000E99C3500E3932D00E28E2300E088
      1C00E1831500DE7F0F00C56B0C00000000001C9A2A001AB12700007900000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B000000000000000000DA771700DE86
      3000DE883300DE883300DD842C00DC7F2400DA771700D8700B00D76C0400D66B
      0200D76B0000C963000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018A02400027F0400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000B00000000100010000000000800500000000000000000000
      000000000000000000000000FFFFFF00DC1FC001FFEF0000C01FC001FF8F0000
      DC1FC001FF800000DFFFC00180000000DC1FC00180000000C01FC00180010000
      DC1FC00180010000DFFFC00180010000DC1FC00180010000C01FC00180010000
      DC1FC0010001000007E1C0010001000007E9C0010001000007E5C001F1FF0000
      FFE0C001F3FF0000FFFEFFFFFFFF0000FFFFFFFFDC1FDC1FFFFFFFFFC01FC01F
      F9FFFCFFDC1FDC1FF0FFF87FDFFFDFFFE07FF03FDC1FDC1FC03FE01FC01FC01F
      821FC10FDC1FDC1FC78FE0C7DFFFDFFFEFC7E063DC1FDC1FFFF3C039C01FC01F
      FFF9821CDC13DC1FFFFFC78F07F307E4FFFFEFC707C007E0FFFFFFF307C007F1
      FFFFFFF9FFF3FFE0FFFFFFFFFFF3FFE49FFF8003F81FFFFF8E038001E007FFFF
      C4018000C003E7E7E00180008001C3C3F00180008001C183F00180000000E007
      F00180000000F00FF00180000000F81FF00180010000F81FF80180030000F00F
      FC0180030000E007FC0180038001C183FC0180038001C3C3FC018007C003E7E7
      FC01800FE007FFFFFE03801FF81FFFFFFFBFFFFFFFFF9FFFFF9FFFFFC0070FFF
      F00F0800800307FFF0070800800383FFF00F08008003C1FF838008008003E10F
      03A0FFFF8003F00303E0E7FF8003FC0103E0C1F98003FC0103E0C1F18003F800
      001F83E38003F800001F80078003F800001FE00F8003FC01001FF01F8003FC01
      001FFC3FC007FE03803FFFFFFFFFFF8FFFFFFFFFFFFFFFFF003F800300218003
      003F800300298003003F800300218003003F800300218003003F8003FFFE8003
      003F800300218003003F80030029800300388003002180030020800300218003
      00008003FFFE8003000080030021800300008003002980030000800700218007
      FE20800F0021800FFFF8801FFFFE801FFFFFFE3FF33FC001FE7FE007E007C001
      FC3FE007C0008001FC3F80038001C001FC3F80010000C001FC3F80010000C001
      C00380010000C001800180018000C00180018001E001C001C003C003F003C001
      FC3FE007F01FC001FC3FF81FE03FC001FC3FF81FE03FC001FC3FF81FC03FC003
      FE7FF81FC07FC007FFFFFC3FF8FFC00FFF7FFFFF8003C001FE7FFFFF0003C001
      FC03FFFF0001C001F803FFFF0001C001FC03FFFF0001C0018260FFFF0000C001
      0360E0070000C00103E0C0030000C00103E0C0030007C00103E0E0070007C001
      001FFFFF800FC001001FFFFFC01FC001001FFFFFC01FC001001FFFFFC03FC003
      001FFFFFC07FC007803FFFFFFFFFC00F9FFFEFEFFFFFFF809FFFC7C70000FF80
      9FFF83830000FF809FFF01010000FF809FFF83830000FF809F83C7C70000FF80
      8F00EFEF0000FF808000EFEF000000818000E00F000000828000FEFF000000DE
      8000F01F0000009C8000F01F000000008000F01F000000018000F01F80010003
      803CF01FFFFF019F9FFFF01FFFFF03DFFFFCFFFFFE7FFF809FF90007F07FFF80
      8FF30007C001FF8087E70007C001FF80C3CF0007C001FF80F11F0007C001FF80
      F83F0007C001FF80FC7F0007C0010081F83F0007C0010083F19F0007C00100E3
      E3CF0003C00100C1C7E70001C00100808FFB0000C00100E31FFF0000C00100E3
      3FFF0010F00101C3FFFF0039FC7F0307847F8077F801FFFF00EF00CFF801FFFF
      31BF10BFF801E7E739FF089FF801C3C3993F810F0001C183CA1FC2070001E007
      F40FC4030001F00F9C0788050001F81F9603840A0001F81FCB01CB150001F00F
      FF80FBAA0003E007F7C0F7D70007C183FFE0F7EB003FC3C3EFF0EFF5003FE7E7
      FFF8FFFA007FFFFFFFFCFFFD00FFFFFFFFFFFFFFFFFFFE7FFF3FC003FFFFFC1F
      FE3F80018001F803FC3F80010000F800FC3F80010000F000FC3F80010000E001
      FC3F80010000C003FC3F80010000800FFC3F80010000801FF81F80010000C03F
      F00F80010000C0FFE0078001000087FFC003800100000FFF8001800180011FFF
      0000C003FFFF3FFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Images = ImageListButton
    Left = 52
    Top = 166
    object ActionAdd: TAction
      Caption = 'ActionAdd'
      ImageIndex = 19
      ShortCut = 45
      OnExecute = ActionAddExecute
    end
    object ActionChange: TAction
      Caption = 'ActionChange'
      ImageIndex = 9
      ShortCut = 113
      OnExecute = ActionChangeExecute
    end
    object ActionDelete: TAction
      Caption = 'ActionDelete'
      ImageIndex = 8
      ShortCut = 46
      OnExecute = ActionDeleteExecute
    end
    object ActionClose: TAction
      Caption = 'ActionClose'
      ImageIndex = 10
      ShortCut = 32883
      OnExecute = ActionCloseExecute
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ImageIndex = 7
    end
    object ActionRefresh: TAction
      Caption = 'ActionRefresh'
      ImageIndex = 27
      ShortCut = 116
      OnExecute = ActionRefreshExecute
    end
    object ActionLast: TAction
      Caption = 'ActionLast'
      ImageIndex = 1
      ShortCut = 8
      OnExecute = ActionLastExecute
    end
    object ActionPrint: TAction
      Caption = 'ActionPrint'
      ImageIndex = 22
      ShortCut = 16464
      OnExecute = ActionPrintExecute
    end
    object ActionFind: TAction
      Caption = 'ActionFind'
      ImageIndex = 0
      ShortCut = 119
      OnExecute = ActionFindExecute
    end
    object Special_action: TAction
      Caption = 'Special_action'
      OnExecute = Special_actionExecute
    end
    object Select_line: TAction
      Caption = 'Select_line'
      ShortCut = 32
      OnExecute = Select_lineExecute
    end
    object Oprihod: TAction
      Caption = 'Oprihod'
      OnExecute = OprihodExecute
    end
    object perem: TAction
      Caption = 'perem'
      OnExecute = peremExecute
    end
    object vvod_v_exp: TAction
      Caption = 'vvod_v_exp'
      OnExecute = vvod_v_expExecute
    end
    object Spisanie: TAction
      Caption = 'Spisanie'
      OnExecute = SpisanieExecute
    end
    object na_moder: TAction
      Caption = 'na_moder'
      OnExecute = na_moderExecute
    end
    object Peremeshenie: TAction
      Caption = 'Peremeshenie'
      OnExecute = PeremeshenieExecute
    end
    object unOprihodovanie: TAction
      Caption = 'unOprihodovanie'
      OnExecute = unOprihodovanieExecute
    end
    object ActionLook: TAction
      Caption = 'ActionLook'
      ImageIndex = 23
      ShortCut = 114
      OnExecute = ActionLookExecute
    end
    object ActionUpdateMetall: TAction
      Caption = 'ActionUpdateMetall'
      OnExecute = ActionUpdateMetallExecute
    end
    object ActionUpdateHist: TAction
      Caption = 'ActionUpdateHist'
      OnExecute = ActionUpdateHistExecute
    end
    object ActionUpdateKart: TAction
      Caption = 'ActionUpdateKart'
      OnExecute = ActionUpdateKartExecute
    end
    object ActionFiending_in_main_form: TAction
      Caption = 'ActionFiending_in_main_form'
      OnExecute = ActionFiending_in_main_formExecute
    end
    object Action_Cleaning: TAction
      Caption = 'Action_Cleaning'
      OnExecute = Action_CleaningExecute
    end
    object Action_destroy_amort_ved: TAction
      Caption = 'Action_destroy_amort_ved'
      OnExecute = Action_destroy_amort_vedExecute
    end
    object ActionLookSroo_Ved: TAction
      Caption = 'ActionLookSroo'
      OnExecute = ActionLookSroo_VedExecute
    end
    object LookSrooInvKart: TAction
      Caption = 'LookSrooInvKart'
      OnExecute = LookSrooInvKartExecute
    end
    object CanSeeId: TAction
      Caption = 'CanSeeId'
      ShortCut = 49217
      OnExecute = CanSeeIdExecute
    end
    object Kartaprint: TAction
      Caption = 'Kartaprint'
      ImageIndex = 22
      OnExecute = KartaprintExecute
    end
    object LookingHistory: TAction
      Caption = 'LookingHistory'
      ShortCut = 123
      OnExecute = LookingHistoryExecute
    end
    object Actiontemp: TAction
      Caption = 'Actiontemp'
      ShortCut = 16468
      OnExecute = ActiontempExecute
    end
    object OpenMemOrd: TAction
      Caption = 'OpenMemOrd'
      ShortCut = 49231
    end
    object doocenivanie: TAction
      Caption = 'doocenivanie'
      OnExecute = doocenivanieExecute
    end
    object Komplectaciya: TAction
      Caption = 'Komplectaciya'
      OnExecute = KomplectaciyaExecute
    end
    object Razukomplect: TAction
      Caption = 'Razukomplect'
      OnExecute = RazukomplectExecute
    end
    object Chast_spis: TAction
      Caption = 'Chast_spis'
      OnExecute = Chast_spisExecute
    end
    object acExport: TAction
      Caption = 'acExport'
      ImageIndex = 28
      ShortCut = 16453
      OnExecute = acExportExecute
    end
    object actNormIzn: TAction
      Caption = #1053#1086#1088#1084#1080' '#1079#1085#1086#1089#1091
      ImageIndex = 13
      OnExecute = actNormIznExecute
    end
    object actUpdateKapRem: TAction
      Caption = 'actUpdateKapRem'
      OnExecute = actUpdateKapRemExecute
    end
  end
  object PopupMenuPapka: TPopupMenu
    Images = ImageListButton
    Left = 248
    Top = 121
    object ActionAdd1: TMenuItem
      Action = ActionAdd
    end
    object ActionChange1: TMenuItem
      Action = ActionChange
    end
    object ActionDelete1: TMenuItem
      Action = ActionDelete
    end
    object ActionRefresh2: TMenuItem
      Action = ActionRefresh
    end
    object ActionCancel1: TMenuItem
      Action = ActionCancel
      Visible = False
    end
  end
  object PopupMenuPrim: TPopupMenu
    Images = ImageListButton
    OnPopup = PopupMenuPrimPopup
    Left = 212
    Top = 121
    object ActionAdd2: TMenuItem
      Action = ActionAdd
    end
    object ActionChange2: TMenuItem
      Action = ActionChange
    end
    object ActionLook1: TMenuItem
      Action = ActionLook
    end
    object ActionDelete2: TMenuItem
      Action = ActionDelete
    end
    object ActionRefresh1: TMenuItem
      Action = ActionRefresh
    end
    object ActionCancel2: TMenuItem
      Action = ActionCancel
      Visible = False
    end
    object Operacii1: TMenuItem
      Bitmap.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF5A29FFC0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000FF5A29FFFF9C7BFFC0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000FF5A29FFFF9C7BFFC0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000FF5A29FFFF9C7BFFC0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000FF5A29FFFF9C7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C64A
        21FFFF5A29FFFF5A29FFFF5A29FFC0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000FF5A29FFFF9C7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF5A
        29FFFFA56BFFFFA56BFFFFA56BFFFF5A29FFFF5A29FFFF5A29FFFF5A29FFFF5A
        29FFFF9C7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF5A
        29FFFFA56BFFFFAD73FFFFAD73FFFFAD7BFFFFB57BFFFFB584FFFFB57BFFFF9C
        7BFFFF9C7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF5A
        29FFFFAD6BFFFFAD73FFFFB57BFFFFBD8CFFFFBD94FFFFBD94FFFFBD94FFFF9C
        7BFFFF9C7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF5A
        29FFFFAD73FFFFB57BFFFFBD8CFFFFC69CFFFFCEA5FFFFCEADFFFFCEADFFFF9C
        7BFFFF9C7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF5A
        29FFFFAD73FFFFB584FFFFBD94FFFFCEADFFFFD6BDFFFFDEC6FFFFDEC6FFFFDE
        BDFFFF9C7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF5A29FFFFAD
        6BFFFFAD7BFFFFBD8CFFFFC6A5FFFFD6BDFFFFE7CEFFFFE7DEFFFFE7DEFFFFE7
        D6FFFF9C7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF5A29FFFFA56BFFFFAD
        73FFFFB584FFFFBD94FFFFCEADFFFFDEC6FFFFE7DEFFFFEFE7FFFFF7EFFFFFEF
        E7FFFF9C7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000FF5A29FFFFA56BFFFFAD73FFFFAD
        7BFFFFBD8CFFFFC6A5FFFFD6BDFFFFE7D6FFFFEFE7FFFFF7EFFFFFF7F7FFFFF7
        EFFFFF9C7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF5A
        29FFFF5A29FFFF5A29FFFF5A29FFFF5A29FFFFA56BFFFFA56BFFFFAD73FFFFB5
        84FFFFC694FFFFCEADFFFFDEC6FFFF9C7BFFFF9C7BFFFF9C7BFFFF9C7BFFFF9C
        7BFFFF9C7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF5A29FFFFA5
        63FFFFA56BFFFFA56BFFFFAD73FFFFAD73FFFF5A29FFFFAD73FFFFB57BFFFFBD
        8CFFFFCEA5FFFFD6BDFFFF9C7BFFFF9C7BFFC0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF5A29FFFFA5
        6BFFFFA56BFFFFAD73FFFFAD7BFFFFB584FFFFB584FFFF5A29FFFFB584FFFFC6
        9CFFFFCEB5FFFF9C7BFFFF9C7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF5A29FFFFA5
        6BFFFFAD73FFFFB57BFFFFBD8CFFFFBD94FFFFC694FFFFC694FFFF9C7BFFFFC6
        A5FFFF9C7BFFFF9C7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF5A29FFFFAD
        73FFFFAD7BFFFFB58CFFFFC69CFFFFCEADFFFFCEB5FFFFD6B5FFFFCEADFFFF9C
        7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF9C7BFFFF5A
        29FFFFB57BFFFFBD94FFFFCEA5FFFFD6BDFFFFDEC6FFFFDECEFFFFDEC6FFFF9C
        7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FF9C
        7BFFFF5A29FFFFBD94FFFFCEADFFFFDEC6FFFFE7D6FFFFE7DEFFFFE7D6FFFF9C
        7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000FF9C7BFFFF9C7BFFFFCEADFFFFDEC6FFFFE7D6FFFFEFE7FFFFEFE7FFFF9C
        7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000FF9C7BFFFF9C7BFFFFD6B5FFFFDECEFFFFE7DEFFFFEFE7FFFF9C
        7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000FF9C7BFFFF9C7BFFFF9C7BFFFF9C7BFFFF9C7BFFFF9C
        7BFFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
      Caption = 'Operacii'
      ImageIndex = 11
      object Oprihod1: TMenuItem
        Action = Oprihod
        Bitmap.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000530B0000530B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          9397999A9D9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D
          9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D9E939799FF00FFFF
          00FFFF00FF939799EDEDEDFCFCFCFBFBFBFAFAFAF8F8F8F6F6F6F4F4F4F2F2F2
          F0F0F0EEEEEEECECECEAEAEAE8E8E8E7E7E7E3E3E3E0E0E0DCDCDCD9D9D9D5D5
          D5D2D2D2939799FF00FFFF00FFA6A8A9FCFCFCFCFCFCFCFCFCFBFBFBFAFAFAF8
          F8F8F6F6F6F4F4F4F2F2F2F0F0F0EEEEEEECECECEAEAEAE8E8E8E7E7E7E3E3E3
          E0E0E0DCDCDCD9D9D9D5D5D59A9D9EFF00FFFF00FFA6A8A9FCFCFCFCFCFCFCFC
          FCFCFCFCFBFBFBFAFAFAF8F8F8F6F6F6F4F4F4F2F2F2F0F0F0EEEEEEECECECEA
          EAEAE8E8E8E7E7E7E3E3E3E0E0E0DCDCDCD9D9D99A9D9EFF00FFFF00FFA6A8A9
          FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFBFBFBFAFAFAF8F8F8F6F6F6F4F4F4F2F2
          F2F0F0F0EEEEEEECECECEAEAEAE8E8E8E7E7E7E3E3E3E0E0E0DCDCDC9A9D9EFF
          00FFFF00FFA6A8A9FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFBFBFBFAFAFA
          F8F8F8F6F6F6F4F4F4F2F2F2F0F0F0EEEEEEECECECEAEAEAE8E8E8E7E7E7E3E3
          E3E0E0E09A9D9EFF00FFFF00FFA6A8A9FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
          FCFCFCFCFCFBFBFBFAFAFAF8F8F8F6F6F6F4F4F4F2F2F2F0F0F0EEEEEEECECEC
          EAEAEAE8E8E8E7E7E7E3E3E39A9D9EFF00FFFF00FFA6A8A9FCFCFCFCFCFCFCFC
          FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFAFAFAF9F9F9F7F7F7F5F5F5F3
          F3F3F1F1F1EFEFEFECECECEAEAEAE8E8E8E7E7E79A9D9EFF00FFFF00FFA6A8A9
          FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFAFA
          FAF9F9F9F7F7F7F5F5F5F3F3F3F1F1F1EFEFEFEDEDEDEBEBEBE9E9E99A9D9EFF
          00FFFF00FFA6A8A9FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
          FCFCFCFCFCFCFCFCFCFAFAFAF9F9F9F7F7F7F5F5F5F3F3F3F1F1F1EFEFEFEDED
          EDEBEBEB9A9D9EFF00FFFF00FFA6A8A9FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
          FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFAFAFAF9F9F9F7F7F7F5F5F5
          F3F3F3F1F1F1EFEFEFEDEDED9A9D9EFF00FFFF00FFA6A8A9FCFCFCFCFCFCFCFC
          FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFA
          FAFAF9F9F9F7F7F7F5F5F5F3F3F3F1F1F1EFEFEF9A9D9EFF00FFFF00FFA6A8A9
          FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
          FCFCFCFCFCFCFCFCFCFCFAFAFAF9F9F9486555087019087019F1F1F19A9D9EFF
          00FFFF00FFA6A8A9108C31108C31108C31108C31108C31108C31108C31108C31
          108C31108C31108C31108C31108C31108C31108C31108C311084210894100870
          19108C31939799FF00FFFF00FF21AD3973D69C10B53110B53110B53110B53110
          B53110B53110B53110B53110B53110B53110B53110B53110B53114A02E087019
          0870191FA943087019087019087019FF00FFFF00FFFF00FF21AD3983DBAA10B5
          3110B53110B53110B53110B53121A542088C18FF00FFFF00FFFF00FFFF00FFFF
          00FF14A02E29C6631FA9431FA9431FA943089410087019FF00FFFF00FFFF00FF
          FF00FF21AD3955CD8B39C17639C17639C17639C176088C18FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF14A02E12922714A02E1FA943087019108421108421FF
          00FFFF00FFFF00FFFF00FFFF00FF21AD3921AD3921AD3921AD3920A439FF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF14A02E29C6630870
          19FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          14A02E129227129227FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object Vnutrperem1: TMenuItem
        Action = perem
      end
      object Vvodvexpl1: TMenuItem
        Action = vvod_v_exp
      end
      object Spisanie1: TMenuItem
        Action = Spisanie
      end
      object Namoder1: TMenuItem
        Action = na_moder
        Bitmap.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000330B0000330B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF945A5A84525A945A
          5AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84525A
          C49AA1C49AA1C49AA184525AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF84525AC49AA1F2F2F2DAD4CAD0ACB2C49AA1945A5AFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FF84525AC49AA1F2ECE2C599A0B07C85A87079D0ACB2945A5AFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF84525AC49AA1F2ECE2C599A0B07C85A87079D0AC
          B284525AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF84525AC49AA1F2ECE2C1959CB07C85
          945C65D0ACB284525AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84525AC49AA1DAD4CAB8
          8890B07C8584525AD0ACB284525AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFCEA5A5B58473945A5A945A5A84525A84525A84525AC49A
          A1DAD4CAB88890B07C8584525AD0ACB284525AFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFCEA5A5B58473996C6B945C65945C65945C65
          945C65996C6BD0ACB2B88890B07C8584525AD0ACB284525AFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEA5A5B58473A17979A98282A9
          8282A982826F454C84525A84525A6F454C996C6B84525AD0ACB284525AFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEA5A5B58473A179
          79B08B8BB49090B08B8BAE888884525AF2ECE26F454C84525A84525AC49AA184
          525AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          B58473A17979B08B8BBA9696B79393C4A3A3B08B8BA87079D0ACB2F2ECE26F45
          4C84525AA9828284525AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFB58473B08B8BBF9C9CBC9999C4A3A3EFD6D6C4A3A3B08B8B
          A87079D0ACB2F2ECE2996C6BA9828284525AFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFB58473C7AEABC2A0A0CDB0AFB58473B5
          8473EFD6D6C4A3A3B08B8BA8707984525AA98282A9828284525AFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58473CDB5B3CDB0
          AFB58473FF00FFFF00FFB07B68EFD6D6C4A3A3B08B8BAE8888AB8585A98282AB
          8683FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          AA8584E7C0BFB58473FF00FFFF00FFFF00FFFF00FFAB735FEFD6D6C4A3A3B08B
          8BAE8888A98282B3918FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFAA8584FF00FFFF00FFFF00FFFF00FFFF00FFA36B57
          B58473C4A3A3B08B8BB08B8BA17979BC9C9AFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFA36B57CDB0AFBC9999A17979B08B8BA98282996C6BFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFA36B57CDB0AFC2A0A0BF9C9CB08B8BA98282996C6BFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFAA8584E7C0BFCDB5B3C7AEABBA9C9AAA8584A179
          79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAA8584AA8584AF8B87
          B3918FBC9C9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object Pereocenka: TMenuItem
        Action = Peremeshenie
        Bitmap.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000920B0000920B00000000000000000000FF00FFAAABAB
          999C9E999C9E999C9D999C9E9A9D9E9A9D9E9A9D9E9A9D9F9A9D9F9A9E9F9B9E
          A09B9EA09B9EA09B9FA09B9FA19C9FA19C9FA19CA0A29CA0A29CA0A29B9EA0FF
          00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6
          F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7E4E4E3DFDFDEDBDBDAD6D6
          D6D2D2D29B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFD
          FDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7
          E4E4E3DFDFDEDBDBDAD6D6D69B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFE
          FDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EE
          EEEDECECEBCCCCD0CACACECDCDD1DFDFDEDBDBDA9B9EA0FF00FFFF00FFAAABAB
          FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7
          F6F5F5F4F3F3F2F1F1F0C7C7CB6C717E75798183868EACAEB4DFDFDE9B9EA0FF
          00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
          FDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F4F5F38A8F969BA3A77378818B8F94A6AD
          AFDFDFDE9B9EA0FF00FFFF00FFAAABAB8A918984857F83857E82837D83847D83
          847D83857D83857E83857E84857F84877F84857F84857F84857F7B8187BBC3C4
          B2BFC1929AA19CA4A783847D9B9EA0FF00FFFF00FFAAABAB919993ACB3B2B0B9
          B7B9C4C4BCC7C7BAC5C4ADB8B1B3BEBBA8AEACA3A9A6ACB9B1ACB3B2AFB7B4BB
          C5C4ABAFB496979FACB4B6A4ABABB5BAB98686809B9EA0FF00FFFF00FFAAABAB
          8D948D949894B9C3C1DEEFEFDEEFEFD9EAEAC5D4D1B7C1BF8888837A7A75A3AE
          A690918BAAB3ACD3E2E1D0DDDDBAC4C8B0BDC1A8B1B09596927E7E779B9EA0FF
          00FFFF00FFAAABAB8B938B9FA7A1D4E4E4DEEFEFD0DCDCD0DCDCDEEFEFB5C1BD
          797674777A759DA69D7E7E77B3BCBAD6EBE79CC99FB9D8C0DEEFEFD8E8E8A5AA
          A47E7E769B9EA0FF00FFFF00FFAAABAB8D958DABB6B1DEEFEFD0DCDC9EA1A19E
          A1A1D0DCDCB5C1BD7B7D757F8078AAB0A9898B88B4C0BDAED2B572B06C84BB82
          DEEFEFDAEBEBAAB4AF7F80789B9EA0FF00FFFF00FFAAABAB8B9289959892C7D2
          D2CFDBDB9EA1A1A3B2B2D0DCDCDEEFEF9CA8A2A0A8A7B2C1B99AA29CC0CDCDD5
          EAE5A2CBA7BBD8C6DEEFEFCFDFDBA5AFA67F81789B9EA0FF00FFFF00FFAAABAB
          8D958E949B95AAAFACD5E3E3D0DCDCD0DCDCDEEFEFDEEFEFACB9B6ABB5B2B0BF
          BBA1A8A3D5E3E3DEEFEFDEEFEFDEEFEFDAEBEAB7C4BF979B947F7F779B9EA0FF
          00FFFF00FFAAABAB8D968F99A1A0A2AAA8B9C4C4C1CECEC8D4D4C1CECEC1CECE
          B6C3C3A6B6AFA2AEAAB2C0BCC1D2CEC5D3CFC2CECAC2CFCFBBC7C4969E969FA7
          A482837D9B9EA0FF00FFFF00FFAAABAB8D958E969E9EA3ABAA9FA7A799A1A1A9
          B1B1A5ADAD9FA7A79BA3A3A3ADABA5ADADA2ABAA99A4A1A3ACAAA5ADAA9AA2A2
          9DA4A39BA29FA0A8A781827C9B9EA0FF00FFFF00FFAAABAB8C948C8E968F9098
          928E96908D958E9098919098918E96908D958E8F97919098918F97908D958E8F
          97909098918D958E8E968F9098919098918A91899B9EA0FF00FFFF00FFAAABAB
          EEEFED9AA19CACB4B4C7CFCFD7E6E6DBEAEAD9E8E8D4E4E4C9D4D4A6AEAD9EA6
          A5969E9B9EA59E9EA59EEEEFEDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFC9B9EA0FF
          00FFFF00FFAAABABFEFEFDD8DAD7959D99A3ABABBBC3C3BFC7C7B0B8B79CA4A2
          959D9AACB2ADB1B7B1CBCECAF4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
          FDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDEBECEAAAB0AC98A09F99A19D97
          9F9BA1A8A4C4C8C4C4C8C4F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
          FEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDC5C9
          C48D958FCBCFCBD8DAD7E4E6E3F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
          FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABAB
          FEFEFDFEFEFDF4F5F3EBECEAFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
          FDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF
          00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
          FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
          FDFEFEFD9B9EA0FF00FFFF00FFAAABAB9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B
          9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9C9B9B9C9B9C9C9B9C9C9B9EA0
          9B9EA09B9EA09B9EA09B9EA09B9EA0FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object Doocenka1: TMenuItem
        Action = doocenivanie
        Bitmap.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000920B0000920B00000000000000000000FF00FFAAABAB
          999C9E999C9E999C9D999C9E9A9D9E9A9D9E9A9D9E9A9D9F9A9D9F9A9E9F9B9E
          A09B9EA09B9EA09B9FA09B9FA19C9FA19C9FA19CA0A29CA0A29CA0A29B9EA0FF
          00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6
          F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7E4E4E3DFDFDEDBDBDAD6D6
          D6D2D2D29B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFD
          FDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7
          E4E4E3DFDFDEDBDBDAD6D6D69B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFE
          FDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EE
          EEEDECECEBCCCCD0CACACECDCDD1DFDFDEDBDBDA9B9EA0FF00FFFF00FFAAABAB
          FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7
          F6F5F5F4F3F3F2F1F1F0C7C7CB6C717E75798183868EACAEB4DFDFDE9B9EA0FF
          00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
          FDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F4F5F38A8F969BA3A77378818B8F94A6AD
          AFDFDFDE9B9EA0FF00FFFF00FFAAABAB8A918984857F83857E82837D83847D83
          847D83857D83857E83857E84857F84877F84857F84857F84857F7B8187BBC3C4
          B2BFC1929AA19CA4A783847D9B9EA0FF00FFFF00FFAAABAB919993ACB3B2B0B9
          B7B9C4C4BCC7C7BAC5C4ADB8B1B3BEBBA8AEACA3A9A6ACB9B1ACB3B2AFB7B4BB
          C5C4ABAFB496979FACB4B6A4ABABB5BAB98686809B9EA0FF00FFFF00FFAAABAB
          8D948D949894B9C3C1DEEFEFDEEFEFD9EAEAC5D4D1B7C1BF8888837A7A75A3AE
          A690918BAAB3ACD3E2E1D0DDDDBAC4C8B0BDC1A8B1B09596927E7E779B9EA0FF
          00FFFF00FFAAABAB8B938B9FA7A1D4E4E4DEEFEFD0DCDCD0DCDCDEEFEFB5C1BD
          797674777A759DA69D7E7E77B3BCBAD6EBE79CC99FB9D8C0DEEFEFD8E8E8A5AA
          A47E7E769B9EA0FF00FFFF00FFAAABAB8D958DABB6B1DEEFEFD0DCDC9EA1A19E
          A1A1D0DCDCB5C1BD7B7D757F8078AAB0A9898B88B4C0BDAED2B572B06C84BB82
          DEEFEFDAEBEBAAB4AF7F80789B9EA0FF00FFFF00FFAAABAB8B9289959892C7D2
          D2CFDBDB9EA1A1A3B2B2D0DCDCDEEFEF9CA8A2A0A8A7B2C1B99AA29CC0CDCDD5
          EAE5A2CBA7BBD8C6DEEFEFCFDFDBA5AFA67F81789B9EA0FF00FFFF00FFAAABAB
          8D958E949B95AAAFACD5E3E3D0DCDCD0DCDCDEEFEFDEEFEFACB9B6ABB5B2B0BF
          BBA1A8A3D5E3E3DEEFEFDEEFEFDEEFEFDAEBEAB7C4BF979B947F7F779B9EA0FF
          00FFFF00FFAAABAB8D968F99A1A0A2AAA8B9C4C4C1CECEC8D4D4C1CECEC1CECE
          B6C3C3A6B6AFA2AEAAB2C0BCC1D2CEC5D3CFC2CECAC2CFCFBBC7C4969E969FA7
          A482837D9B9EA0FF00FFFF00FFAAABAB8D958E969E9EA3ABAA9FA7A799A1A1A9
          B1B1A5ADAD9FA7A79BA3A3A3ADABA5ADADA2ABAA99A4A1A3ACAAA5ADAA9AA2A2
          9DA4A39BA29FA0A8A781827C9B9EA0FF00FFFF00FFAAABAB8C948C8E968F9098
          928E96908D958E9098919098918E96908D958E8F97919098918F97908D958E8F
          97909098918D958E8E968F9098919098918A91899B9EA0FF00FFFF00FFAAABAB
          EEEFED9AA19CACB4B4C7CFCFD7E6E6DBEAEAD9E8E8D4E4E4C9D4D4A6AEAD9EA6
          A5969E9B9EA59E9EA59EEEEFEDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFC9B9EA0FF
          00FFFF00FFAAABABFEFEFDD8DAD7959D99A3ABABBBC3C3BFC7C7B0B8B79CA4A2
          959D9AACB2ADB1B7B1CBCECAF4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
          FDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDEBECEAAAB0AC98A09F99A19D97
          9F9BA1A8A4C4C8C4C4C8C4F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
          FEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDC5C9
          C48D958FCBCFCBD8DAD7E4E6E3F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
          FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABAB
          FEFEFDFEFEFDF4F5F3EBECEAFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
          FDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF
          00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
          FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
          FDFEFEFD9B9EA0FF00FFFF00FFAAABAB9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B
          9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9C9B9B9C9B9C9C9B9C9C9B9EA0
          9B9EA09B9EA09B9EA09B9EA09B9EA0FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object Komplectaciya1: TMenuItem
        Action = Komplectaciya
        Bitmap.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000920B0000920B00000000000000000000FF00FFAAABAB
          999C9E999C9E999C9D999C9E9A9D9E9A9D9E9A9D9E9A9D9F9A9D9F9A9E9F9B9E
          A09B9EA09B9EA09B9FA09B9FA19C9FA19C9FA19CA0A29CA0A29CA0A29B9EA0FF
          00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6
          F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7E4E4E3DFDFDEDBDBDAD6D6
          D6D2D2D29B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFD
          FDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7
          E4E4E3DFDFDEDBDBDAD6D6D69B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFE
          FDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EE
          EEEDECECEBCCCCD0CACACECDCDD1DFDFDEDBDBDA9B9EA0FF00FFFF00FFAAABAB
          FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7
          F6F5F5F4F3F3F2F1F1F0C7C7CB6C717E75798183868EACAEB4DFDFDE9B9EA0FF
          00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
          FDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F4F5F38A8F969BA3A77378818B8F94A6AD
          AFDFDFDE9B9EA0FF00FFFF00FFAAABAB8A918984857F83857E82837D83847D83
          847D83857D83857E83857E84857F84877F84857F84857F84857F7B8187BBC3C4
          B2BFC1929AA19CA4A783847D9B9EA0FF00FFFF00FFAAABAB919993ACB3B2B0B9
          B7B9C4C4BCC7C7BAC5C4ADB8B1B3BEBBA8AEACA3A9A6ACB9B1ACB3B2AFB7B4BB
          C5C4ABAFB496979FACB4B6A4ABABB5BAB98686809B9EA0FF00FFFF00FFAAABAB
          8D948D949894B9C3C1DEEFEFDEEFEFD9EAEAC5D4D1B7C1BF8888837A7A75A3AE
          A690918BAAB3ACD3E2E1D0DDDDBAC4C8B0BDC1A8B1B09596927E7E779B9EA0FF
          00FFFF00FFAAABAB8B938B9FA7A1D4E4E4DEEFEFD0DCDCD0DCDCDEEFEFB5C1BD
          797674777A759DA69D7E7E77B3BCBAD6EBE79CC99FB9D8C0DEEFEFD8E8E8A5AA
          A47E7E769B9EA0FF00FFFF00FFAAABAB8D958DABB6B1DEEFEFD0DCDC9EA1A19E
          A1A1D0DCDCB5C1BD7B7D757F8078AAB0A9898B88B4C0BDAED2B572B06C84BB82
          DEEFEFDAEBEBAAB4AF7F80789B9EA0FF00FFFF00FFAAABAB8B9289959892C7D2
          D2CFDBDB9EA1A1A3B2B2D0DCDCDEEFEF9CA8A2A0A8A7B2C1B99AA29CC0CDCDD5
          EAE5A2CBA7BBD8C6DEEFEFCFDFDBA5AFA67F81789B9EA0FF00FFFF00FFAAABAB
          8D958E949B95AAAFACD5E3E3D0DCDCD0DCDCDEEFEFDEEFEFACB9B6ABB5B2B0BF
          BBA1A8A3D5E3E3DEEFEFDEEFEFDEEFEFDAEBEAB7C4BF979B947F7F779B9EA0FF
          00FFFF00FFAAABAB8D968F99A1A0A2AAA8B9C4C4C1CECEC8D4D4C1CECEC1CECE
          B6C3C3A6B6AFA2AEAAB2C0BCC1D2CEC5D3CFC2CECAC2CFCFBBC7C4969E969FA7
          A482837D9B9EA0FF00FFFF00FFAAABAB8D958E969E9EA3ABAA9FA7A799A1A1A9
          B1B1A5ADAD9FA7A79BA3A3A3ADABA5ADADA2ABAA99A4A1A3ACAAA5ADAA9AA2A2
          9DA4A39BA29FA0A8A781827C9B9EA0FF00FFFF00FFAAABAB8C948C8E968F9098
          928E96908D958E9098919098918E96908D958E8F97919098918F97908D958E8F
          97909098918D958E8E968F9098919098918A91899B9EA0FF00FFFF00FFAAABAB
          EEEFED9AA19CACB4B4C7CFCFD7E6E6DBEAEAD9E8E8D4E4E4C9D4D4A6AEAD9EA6
          A5969E9B9EA59E9EA59EEEEFEDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFC9B9EA0FF
          00FFFF00FFAAABABFEFEFDD8DAD7959D99A3ABABBBC3C3BFC7C7B0B8B79CA4A2
          959D9AACB2ADB1B7B1CBCECAF4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
          FDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDEBECEAAAB0AC98A09F99A19D97
          9F9BA1A8A4C4C8C4C4C8C4F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
          FEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDC5C9
          C48D958FCBCFCBD8DAD7E4E6E3F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
          FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABAB
          FEFEFDFEFEFDF4F5F3EBECEAFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
          FDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF
          00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
          FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
          FDFEFEFD9B9EA0FF00FFFF00FFAAABAB9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B
          9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9C9B9B9C9B9C9C9B9C9C9B9EA0
          9B9EA09B9EA09B9EA09B9EA09B9EA0FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object Razukomplect2: TMenuItem
        Action = Razukomplect
        Bitmap.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000920B0000920B00000000000000000000FF00FFAAABAB
          999C9E999C9E999C9D999C9E9A9D9E9A9D9E9A9D9E9A9D9F9A9D9F9A9E9F9B9E
          A09B9EA09B9EA09B9FA09B9FA19C9FA19C9FA19CA0A29CA0A29CA0A29B9EA0FF
          00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6
          F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7E4E4E3DFDFDEDBDBDAD6D6
          D6D2D2D29B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFD
          FDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7
          E4E4E3DFDFDEDBDBDAD6D6D69B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFE
          FDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EE
          EEEDECECEBCCCCD0CACACECDCDD1DFDFDEDBDBDA9B9EA0FF00FFFF00FFAAABAB
          FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7
          F6F5F5F4F3F3F2F1F1F0C7C7CB6C717E75798183868EACAEB4DFDFDE9B9EA0FF
          00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
          FDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F4F5F38A8F969BA3A77378818B8F94A6AD
          AFDFDFDE9B9EA0FF00FFFF00FFAAABAB8A918984857F83857E82837D83847D83
          847D83857D83857E83857E84857F84877F84857F84857F84857F7B8187BBC3C4
          B2BFC1929AA19CA4A783847D9B9EA0FF00FFFF00FFAAABAB919993ACB3B2B0B9
          B7B9C4C4BCC7C7BAC5C4ADB8B1B3BEBBA8AEACA3A9A6ACB9B1ACB3B2AFB7B4BB
          C5C4ABAFB496979FACB4B6A4ABABB5BAB98686809B9EA0FF00FFFF00FFAAABAB
          8D948D949894B9C3C1DEEFEFDEEFEFD9EAEAC5D4D1B7C1BF8888837A7A75A3AE
          A690918BAAB3ACD3E2E1D0DDDDBAC4C8B0BDC1A8B1B09596927E7E779B9EA0FF
          00FFFF00FFAAABAB8B938B9FA7A1D4E4E4DEEFEFD0DCDCD0DCDCDEEFEFB5C1BD
          797674777A759DA69D7E7E77B3BCBAD6EBE79CC99FB9D8C0DEEFEFD8E8E8A5AA
          A47E7E769B9EA0FF00FFFF00FFAAABAB8D958DABB6B1DEEFEFD0DCDC9EA1A19E
          A1A1D0DCDCB5C1BD7B7D757F8078AAB0A9898B88B4C0BDAED2B572B06C84BB82
          DEEFEFDAEBEBAAB4AF7F80789B9EA0FF00FFFF00FFAAABAB8B9289959892C7D2
          D2CFDBDB9EA1A1A3B2B2D0DCDCDEEFEF9CA8A2A0A8A7B2C1B99AA29CC0CDCDD5
          EAE5A2CBA7BBD8C6DEEFEFCFDFDBA5AFA67F81789B9EA0FF00FFFF00FFAAABAB
          8D958E949B95AAAFACD5E3E3D0DCDCD0DCDCDEEFEFDEEFEFACB9B6ABB5B2B0BF
          BBA1A8A3D5E3E3DEEFEFDEEFEFDEEFEFDAEBEAB7C4BF979B947F7F779B9EA0FF
          00FFFF00FFAAABAB8D968F99A1A0A2AAA8B9C4C4C1CECEC8D4D4C1CECEC1CECE
          B6C3C3A6B6AFA2AEAAB2C0BCC1D2CEC5D3CFC2CECAC2CFCFBBC7C4969E969FA7
          A482837D9B9EA0FF00FFFF00FFAAABAB8D958E969E9EA3ABAA9FA7A799A1A1A9
          B1B1A5ADAD9FA7A79BA3A3A3ADABA5ADADA2ABAA99A4A1A3ACAAA5ADAA9AA2A2
          9DA4A39BA29FA0A8A781827C9B9EA0FF00FFFF00FFAAABAB8C948C8E968F9098
          928E96908D958E9098919098918E96908D958E8F97919098918F97908D958E8F
          97909098918D958E8E968F9098919098918A91899B9EA0FF00FFFF00FFAAABAB
          EEEFED9AA19CACB4B4C7CFCFD7E6E6DBEAEAD9E8E8D4E4E4C9D4D4A6AEAD9EA6
          A5969E9B9EA59E9EA59EEEEFEDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFC9B9EA0FF
          00FFFF00FFAAABABFEFEFDD8DAD7959D99A3ABABBBC3C3BFC7C7B0B8B79CA4A2
          959D9AACB2ADB1B7B1CBCECAF4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
          FDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDEBECEAAAB0AC98A09F99A19D97
          9F9BA1A8A4C4C8C4C4C8C4F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
          FEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDC5C9
          C48D958FCBCFCBD8DAD7E4E6E3F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
          FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABAB
          FEFEFDFEFEFDF4F5F3EBECEAFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
          FDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF
          00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
          FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
          FDFEFEFD9B9EA0FF00FFFF00FFAAABAB9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B
          9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9C9B9B9C9B9C9C9B9C9C9B9EA0
          9B9EA09B9EA09B9EA09B9EA09B9EA0FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object Chastspis2: TMenuItem
        Action = Chast_spis
        Bitmap.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000920B0000920B00000000000000000000FF00FFAAABAB
          999C9E999C9E999C9D999C9E9A9D9E9A9D9E9A9D9E9A9D9F9A9D9F9A9E9F9B9E
          A09B9EA09B9EA09B9FA09B9FA19C9FA19C9FA19CA0A29CA0A29CA0A29B9EA0FF
          00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6
          F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7E4E4E3DFDFDEDBDBDAD6D6
          D6D2D2D29B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFD
          FDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7
          E4E4E3DFDFDEDBDBDAD6D6D69B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFE
          FDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EE
          EEEDECECEBCCCCD0CACACECDCDD1DFDFDEDBDBDA9B9EA0FF00FFFF00FFAAABAB
          FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7
          F6F5F5F4F3F3F2F1F1F0C7C7CB6C717E75798183868EACAEB4DFDFDE9B9EA0FF
          00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
          FDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F4F5F38A8F969BA3A77378818B8F94A6AD
          AFDFDFDE9B9EA0FF00FFFF00FFAAABAB8A918984857F83857E82837D83847D83
          847D83857D83857E83857E84857F84877F84857F84857F84857F7B8187BBC3C4
          B2BFC1929AA19CA4A783847D9B9EA0FF00FFFF00FFAAABAB919993ACB3B2B0B9
          B7B9C4C4BCC7C7BAC5C4ADB8B1B3BEBBA8AEACA3A9A6ACB9B1ACB3B2AFB7B4BB
          C5C4ABAFB496979FACB4B6A4ABABB5BAB98686809B9EA0FF00FFFF00FFAAABAB
          8D948D949894B9C3C1DEEFEFDEEFEFD9EAEAC5D4D1B7C1BF8888837A7A75A3AE
          A690918BAAB3ACD3E2E1D0DDDDBAC4C8B0BDC1A8B1B09596927E7E779B9EA0FF
          00FFFF00FFAAABAB8B938B9FA7A1D4E4E4DEEFEFD0DCDCD0DCDCDEEFEFB5C1BD
          797674777A759DA69D7E7E77B3BCBAD6EBE79CC99FB9D8C0DEEFEFD8E8E8A5AA
          A47E7E769B9EA0FF00FFFF00FFAAABAB8D958DABB6B1DEEFEFD0DCDC9EA1A19E
          A1A1D0DCDCB5C1BD7B7D757F8078AAB0A9898B88B4C0BDAED2B572B06C84BB82
          DEEFEFDAEBEBAAB4AF7F80789B9EA0FF00FFFF00FFAAABAB8B9289959892C7D2
          D2CFDBDB9EA1A1A3B2B2D0DCDCDEEFEF9CA8A2A0A8A7B2C1B99AA29CC0CDCDD5
          EAE5A2CBA7BBD8C6DEEFEFCFDFDBA5AFA67F81789B9EA0FF00FFFF00FFAAABAB
          8D958E949B95AAAFACD5E3E3D0DCDCD0DCDCDEEFEFDEEFEFACB9B6ABB5B2B0BF
          BBA1A8A3D5E3E3DEEFEFDEEFEFDEEFEFDAEBEAB7C4BF979B947F7F779B9EA0FF
          00FFFF00FFAAABAB8D968F99A1A0A2AAA8B9C4C4C1CECEC8D4D4C1CECEC1CECE
          B6C3C3A6B6AFA2AEAAB2C0BCC1D2CEC5D3CFC2CECAC2CFCFBBC7C4969E969FA7
          A482837D9B9EA0FF00FFFF00FFAAABAB8D958E969E9EA3ABAA9FA7A799A1A1A9
          B1B1A5ADAD9FA7A79BA3A3A3ADABA5ADADA2ABAA99A4A1A3ACAAA5ADAA9AA2A2
          9DA4A39BA29FA0A8A781827C9B9EA0FF00FFFF00FFAAABAB8C948C8E968F9098
          928E96908D958E9098919098918E96908D958E8F97919098918F97908D958E8F
          97909098918D958E8E968F9098919098918A91899B9EA0FF00FFFF00FFAAABAB
          EEEFED9AA19CACB4B4C7CFCFD7E6E6DBEAEAD9E8E8D4E4E4C9D4D4A6AEAD9EA6
          A5969E9B9EA59E9EA59EEEEFEDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFC9B9EA0FF
          00FFFF00FFAAABABFEFEFDD8DAD7959D99A3ABABBBC3C3BFC7C7B0B8B79CA4A2
          959D9AACB2ADB1B7B1CBCECAF4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
          FDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDEBECEAAAB0AC98A09F99A19D97
          9F9BA1A8A4C4C8C4C4C8C4F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
          FEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDC5C9
          C48D958FCBCFCBD8DAD7E4E6E3F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
          FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABAB
          FEFEFDFEFEFDF4F5F3EBECEAFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
          FDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF
          00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
          FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
          FDFEFEFD9B9EA0FF00FFFF00FFAAABAB9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B
          9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9C9B9B9C9B9C9C9B9C9C9B9EA0
          9B9EA09B9EA09B9EA09B9EA09B9EA0FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
    end
    object ved_main_menu: TMenuItem
      Caption = 'ved_main_menu'
      ImageIndex = 29
      object create_ved: TMenuItem
        Caption = 'create_ved'
        ImageIndex = 6
        OnClick = create_vedClick
      end
      object looksrooved: TMenuItem
        Action = ActionLookSroo_Ved
        ImageIndex = 23
      end
      object destroyved: TMenuItem
        Action = Action_destroy_amort_ved
        ImageIndex = 8
      end
    end
    object UnChecked: TMenuItem
      Caption = 'UnChecked'
      ImageIndex = 25
      object UnCheckedone: TMenuItem
        Caption = 'UnCheckedone'
        ImageIndex = 25
        OnClick = UnCheckedoneClick
      end
      object UnCheckedall: TMenuItem
        Caption = 'UnCheckedall'
        ImageIndex = 25
        OnClick = UnCheckedallClick
      end
    end
    object checkedall: TMenuItem
      Caption = 'checkedall'
      ImageIndex = 41
      OnClick = checkedallClick
    end
    object name_grp_che: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF001E783100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF001E78
        310026983E001E783100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002698
        3E0021AD39001E7831001E7831001E7831001E7831001E783100FF00FF005AD5
        F2005AD5F2005AD5F2005AD5F2005AD5F2005AD5F2001E7831004BCD6A0021AD
        390021AD390021AD390021AD390021AD390021AD39001E783100FF00FF00178C
        B7005AD5F20069E2F90069E2F90065DFF70062DCF6004ECBEC001E78310021AD
        390021AD39004BCD6A004BCD6A004BCD6A004BCD6A001E783100FF00FF006CE3
        F9005AD5F2005AD5F20069E2F90069E2F90069E2F90062DCF6005ED9F4001E78
        31004BCD6A0026983E0046C5E8005AD5F20069E2F900FF00FF00FF00FF0073E5
        FA006CE3F9001C97CA005AD5F20069E2F90069E2F9001C97CA001C97CA005AD5
        F2001E78310026983E00178CB70069E2F90069E2F900FF00FF00FF00FF0081E9
        FB007AE7FA006CE3F9005AD5F20084E0F70081DFF6007BDDF60078DCF50070DA
        F4006CD9F3005AD5F20081E9FB0073E5FA006CE3F900FF00FF00FF00FF0088EB
        FC0081E9FB005AD5F2001E78310088E1F70084E0F7007EDEF6007BDDF60075DB
        F50070DAF4001DA3D60088EBFC007AE7FA0073E5FA00FF00FF00FF00FF009BF0
        FD008FECFC0081E9FB001E78310026983E001E78310084E0F70081DFF6007BDD
        F60078DCF50070DAF4006CD9F30088EBFC0081E9FB00FF00FF0026983E001E78
        31001E7831001E7831001E78310021AD390026983E0088E1F70084E0F7007EDE
        F6007BDDF60075DBF50070DAF40051BBE50088EBFC00FF00FF0021AD39003AB1
        55003AB155003AB155003AB155003AB155003AB1550026983E001E78310084E0
        F70081DFF6007BDDF60078DCF50070DAF4006CD9F300FF00FF0021AD39004BCD
        6A004BCD6A004BCD6A004BCD6A003AB155003AB155001E7831002DACDB0028A9
        D90025A8D90020A5D7001EA3D6001DA3D6001DA3D600FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0021AD390026983E001E783100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0021AD39001E783100FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Caption = #1047#1084'i'#1085#1080#1090#1080' '#1075#1088#1091#1087#1091' '#1082#1072#1088#1090#1082#1080
      ImageIndex = 42
      OnClick = name_grp_cheClick
    end
    object N4: TMenuItem
      Bitmap.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000979797005858
        58008D8DA10028281600535353005F5F4D0066664600474734003E3E3E003434
        3400676767007979970054544200BEBEDB00DDDDD400F8F8D900B1B19F00A8A8
        A800BBBBBB005151510060603C00CACAD500E9E9C700F1F1BF009E9E9E007B7B
        7B00858585006969690060606000767676005F5F730063637D004E4E4500B8B8
        DE00D7D7DA00D9D9CD00424242001E1E110026262E00333323001B1B15002525
        25007F7F7F00585896005A5A3F00C4C4D800E3E3CD00DDDDB80087875E00BABA
        EB00EDEDBE00F6F6C80089897600C6C6C6008A8A8A004B4B4B00D8D8D800E3E3
        E30068686800A7A7A70075756800B4B4EE00DBDBCC00EEEEDF009E9E97008383
        8300898989004E4E4E00DFDFAE0090905A00BDBDEA00F6F6B700FAFABC00FDFD
        BF00FFFFC000FEFEC00097977200DBDBC2007E7E6300B7B7ED00E4E4C500F2F2
        D300FBFBDC00FFFFDF00FDFDDE009494810067674E005C5C5C009191AB008A8A
        9E00FAFAEB00FFFFEF00FCFCED00929289005B5B330073738B0099996A005B5B
        3F00B0B0B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000007F7F7F7F7F2B
        3B3B3B3B3B3B3B3B627F7F7F7F7F7F1D24242424242424241D627F7F7F7F7F24
        5E5F606060606061243B7F58585859243C3D3E3F5A5B5C5D243B000101015724
        45464748494A4B4C243B0103040556244E4F505152535455243B010C0D0E4D24
        4E4F505152535455243B01141516442445464748494A4B4C243B012021222324
        3C3D3E3F40414243243B012C2D2E2F24303132333438393A243B012C2D2E2F24
        30313233343536371D2B012021222324252627272829292A2B7F011415161718
        191A1B1C1D1E1F7F7F7F010C0D0E0F10111213130B7F7F7F7F7F010304050607
        08090A0B7F7F7F7F7F7F0001010101010101027F7F7F7F7F7F7F}
      Caption = #1050#1083#1086#1085#1091#1074#1072#1090#1080' '#1082#1072#1088#1090#1082#1091
      ImageIndex = 6
      ShortCut = 16429
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object NExport: TMenuItem
      Action = acExport
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Caption = #1059#1079#1075#1086#1076#1080#1090#1080' '#1110#1079' '#1079#1072#1083#1080#1096#1082#1072#1084#1080
      OnClick = N9Click
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object N12: TMenuItem
      Caption = #1044#1088#1091#1082' '#1090#1072#1073#1083#1080#1095#1085#1080#1093' '#1076#1072#1085#1080#1093
      ImageIndex = 22
      OnClick = N12Click
    end
  end
  object DataSourcePapka: TDataSource
    DataSet = DataSetPapka
    Left = 112
    Top = 136
  end
  object DataSourceInvKart: TDataSource
    DataSet = DataSetKart
    Left = 212
    Top = 161
  end
  object DataSetKart: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_SEL_TO_GRID (:D_ID) order by fio_mol')
    DataSource = DataSourcePapka
    Left = 244
    Top = 161
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceOpen = True
    object DataSetKartID_MO: TFIBBCDField
      FieldName = 'ID_MO'
      Size = 0
      RoundByScale = True
    end
    object DataSetKartFIO_MOL: TFIBStringField
      FieldName = 'FIO_MOL'
      Size = 68
      EmptyStrToNull = True
    end
    object DataSetKartNAME_DEPARTMENT: TFIBStringField
      FieldName = 'NAME_DEPARTMENT'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetKartNAME_KART: TFIBStringField
      FieldName = 'NAME_KART'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetKartNAME_SCH: TFIBStringField
      FieldName = 'NAME_SCH'
      Size = 60
      EmptyStrToNull = True
    end
    object DataSetKartGRP_NUM: TFIBStringField
      FieldName = 'GRP_NUM'
      Size = 5
      EmptyStrToNull = True
    end
    object DataSetKartINV_NUM: TFIBStringField
      FieldName = 'INV_NUM'
      Size = 5
      EmptyStrToNull = True
    end
    object DataSetKartNUM_SCH: TFIBStringField
      FieldName = 'NUM_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetKartBAL_PRICE: TFIBBCDField
      FieldName = 'BAL_PRICE'
      DisplayFormat = '0.00'
      currency = True
      Size = 4
      RoundByScale = True
    end
    object DataSetKartOST_PRICE: TFIBBCDField
      FieldName = 'OST_PRICE'
      Size = 4
      RoundByScale = True
    end
    object DataSetKartIZNOS: TFIBBCDField
      FieldName = 'IZNOS'
      Size = 4
      RoundByScale = True
    end
    object DataSetKartR_ID_KART: TFIBBCDField
      FieldName = 'R_ID_KART'
      Size = 0
      RoundByScale = True
    end
    object DataSetKartID_INV_GRP: TFIBBCDField
      FieldName = 'ID_INV_GRP'
      Size = 0
      RoundByScale = True
    end
    object DataSetKartID_OST: TFIBBCDField
      FieldName = 'ID_OST'
      Size = 0
      RoundByScale = True
    end
    object DataSetKartID_MANS: TFIBBCDField
      FieldName = 'ID_MANS'
      Size = 0
      RoundByScale = True
    end
    object DataSetKartID_NOMNS: TFIBBCDField
      FieldName = 'ID_NOMNS'
      Size = 0
      RoundByScale = True
    end
    object DataSetKartID_SCHS: TFIBBCDField
      FieldName = 'ID_SCHS'
      Size = 0
      RoundByScale = True
    end
    object DataSetKartDOC_REC: TFIBDateField
      FieldName = 'DOC_REC'
    end
    object DataSetKartWORKED: TFIBSmallIntField
      FieldName = 'WORKED'
    end
    object DataSetKartTIP_KART: TFIBStringField
      FieldName = 'TIP_KART'
      Size = 5
      EmptyStrToNull = True
    end
    object DataSetKartUSE_IN_NALOG: TFIBSmallIntField
      FieldName = 'USE_IN_NALOG'
    end
    object DataSetKartKART_NUM: TFIBIntegerField
      FieldName = 'KART_NUM'
    end
    object DataSetKartID_DB: TFIBBCDField
      FieldName = 'ID_DB'
      Size = 0
      RoundByScale = True
    end
    object DataSetKartID_KR: TFIBBCDField
      FieldName = 'ID_KR'
      Size = 0
      RoundByScale = True
    end
    object DataSetKartDATE_EXPL: TFIBDateField
      FieldName = 'DATE_EXPL'
    end
    object DataSetKartDATE_OUT: TFIBDateField
      FieldName = 'DATE_OUT'
    end
    object DataSetKartDATE_OPR: TFIBDateField
      FieldName = 'DATE_OPR'
    end
    object DataSetKartDATE_UP: TFIBDateField
      FieldName = 'DATE_UP'
    end
    object DataSetKartFULL_INV: TFIBStringField
      FieldName = 'FULL_INV'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetKartIS_BUHG_ACC: TFIBSmallIntField
      FieldName = 'IS_BUHG_ACC'
    end
    object DataSetKartBAL_ID_SCH: TFIBBCDField
      FieldName = 'BAL_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSetKartBAL_SCH_NUMBER: TFIBStringField
      FieldName = 'BAL_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetKartBAL_SCH_TITLE: TFIBStringField
      FieldName = 'BAL_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DataSetKartCHEKER: TFIBIntegerField
      FieldName = 'CHEKER'
    end
    object DataSetKartIS_SKLAD: TFIBSmallIntField
      FieldName = 'IS_SKLAD'
    end
    object DataSetKartIS_INV_OBJ: TFIBIntegerField
      FieldName = 'IS_INV_OBJ'
    end
    object DataSetKartID_SPODR: TFIBBCDField
      FieldName = 'ID_SPODR'
      Size = 0
      RoundByScale = True
    end
    object DataSetKartNAME_FULL: TFIBStringField
      FieldName = 'NAME_FULL'
      Size = 500
      EmptyStrToNull = True
    end
    object DataSetKartBEG_PRICE_NAL: TFIBBCDField
      FieldName = 'BEG_PRICE_NAL'
      Size = 4
      RoundByScale = True
    end
    object DataSetKartBEG_IZNOS_NAL: TFIBBCDField
      FieldName = 'BEG_IZNOS_NAL'
      Size = 4
      RoundByScale = True
    end
    object DataSetKartOST_PRICE_NAL: TFIBBCDField
      FieldName = 'OST_PRICE_NAL'
      Size = 4
      RoundByScale = True
    end
    object DataSetKartOST_IZNOS_NAL: TFIBBCDField
      FieldName = 'OST_IZNOS_NAL'
      Size = 4
      RoundByScale = True
    end
  end
  object DatabaseMain: TpFIBDatabase
    DBParams.Strings = (
      'sql_role_name='
      'password=masterkey'
      'user_name=SYSDBA'
      'lc_ctype=WIN1251')
    DefaultTransaction = TransactionRead
    DefaultUpdateTransaction = TransactionRead
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    SaveDBParams = False
    WaitForRestoreConnect = 0
    Left = 8
    Top = 129
  end
  object TransactionRead: TpFIBTransaction
    DefaultDatabase = DatabaseMain
    TimeoutAction = TARollback
    Left = 48
    Top = 136
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 72
    Top = 240
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyleYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15204351
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleFontBlack: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleMalin: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clOlive
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleBorder: TcxStyle
      AssignedValues = [svColor]
      Color = clInactiveBorder
    end
    object cxStylemalinYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15204351
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleGrid: TcxStyle
      AssignedValues = [svColor]
      Color = 10485760
    end
    object ForHaeder: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object AfterSelection: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle16
      Styles.ContentEven = cxStyle17
      Styles.ContentOdd = cxStyle18
      Styles.Inactive = cxStyle24
      Styles.IncSearch = cxStyle25
      Styles.Selection = cxStyle28
      Styles.FilterBox = cxStyle19
      Styles.Footer = cxStyle20
      Styles.Group = cxStyle21
      Styles.GroupByBox = cxStyle22
      Styles.Header = cxStyle23
      Styles.Indicator = cxStyle26
      Styles.Preview = cxStyle27
      BuiltIn = True
    end
  end
  object DataSetPapka: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'SELECT * FROM MAT_DT_INV_GROUPS')
    Left = 144
    Top = 136
    poSQLINT64ToBCD = True
    object DataSetPapkaID_INV_GRP: TFIBBCDField
      FieldName = 'ID_INV_GRP'
      Size = 0
      RoundByScale = True
    end
    object DataSetPapkaLINK_TO: TFIBBCDField
      FieldName = 'LINK_TO'
      Size = 0
      RoundByScale = True
    end
    object DataSetPapkaNAME_GRP: TFIBStringField
      FieldName = 'NAME_GRP'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetPapkaHAS_CHILD: TFIBSmallIntField
      FieldName = 'HAS_CHILD'
    end
    object DataSetPapkaKOD_GRP: TFIBBCDField
      FieldName = 'KOD_GRP'
      Size = 0
      RoundByScale = True
    end
  end
  object DataSourceOsn: TDataSource
    DataSet = DataSetOsn
    Left = 210
    Top = 198
  end
  object DataSetOsn: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_SEL_TO_GRID_2(-1)')
    DataSource = DataSourceInvKart
    AfterScroll = DataSetOsnAfterScroll
    Left = 243
    Top = 200
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object DataSetDrag: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_SEL_DRAG_MET (1)')
    DataSource = DataSourceInvKart
    Left = 243
    Top = 232
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
    object DataSetDragR_ID_METALL: TFIBBCDField
      FieldName = 'R_ID_METALL'
      Size = 0
      RoundByScale = True
    end
    object DataSetDragDRAG_KOL: TFIBBCDField
      FieldName = 'DRAG_KOL'
      RoundByScale = True
    end
    object DataSetDragDRAG_NAME: TFIBStringField
      FieldName = 'DRAG_NAME'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetDragDRAG_SHORT: TFIBStringField
      FieldName = 'DRAG_SHORT'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetDragID_FOR_DEL: TFIBBCDField
      FieldName = 'ID_FOR_DEL'
      Size = 0
      RoundByScale = True
    end
  end
  object DataSourceDragMet: TDataSource
    DataSet = DataSetDrag
    Left = 210
    Top = 232
  end
  object pFIBDataSetFor_Printing: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'SELECT * FROM MAT_INV_SEL_TO_PRINT(0)')
    Left = 657
    Top = 112
    poSQLINT64ToBCD = True
    object pFIBDataSetFor_PrintingR_ID_KART: TFIBBCDField
      FieldName = 'R_ID_KART'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingTIP_KRT: TFIBStringField
      FieldName = 'TIP_KRT'
      Size = 6
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingGRP_NUM: TFIBStringField
      FieldName = 'GRP_NUM'
      Size = 5
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingINV_NUM: TFIBIntegerField
      FieldName = 'INV_NUM'
    end
    object pFIBDataSetFor_PrintingKART_NUM: TFIBIntegerField
      FieldName = 'KART_NUM'
    end
    object pFIBDataSetFor_PrintingBEG_PRICE: TFIBBCDField
      FieldName = 'BEG_PRICE'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingBEG_IZNOS: TFIBBCDField
      FieldName = 'BEG_IZNOS'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingOST_PRICE: TFIBBCDField
      FieldName = 'OST_PRICE'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingOST_IZNOS: TFIBBCDField
      FieldName = 'OST_IZNOS'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingDATE_OST: TFIBDateField
      FieldName = 'DATE_OST'
    end
    object pFIBDataSetFor_PrintingDATE_OPR: TFIBDateField
      FieldName = 'DATE_OPR'
    end
    object pFIBDataSetFor_PrintingID_OPER_OPR: TFIBBCDField
      FieldName = 'ID_OPER_OPR'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingDATE_EXPL: TFIBDateField
      FieldName = 'DATE_EXPL'
    end
    object pFIBDataSetFor_PrintingID_OPER_EXPL: TFIBBCDField
      FieldName = 'ID_OPER_EXPL'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingDATE_UPDATE: TFIBDateField
      FieldName = 'DATE_UPDATE'
    end
    object pFIBDataSetFor_PrintingID_OPER_UPDATE: TFIBBCDField
      FieldName = 'ID_OPER_UPDATE'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingDATE_OUT: TFIBDateField
      FieldName = 'DATE_OUT'
    end
    object pFIBDataSetFor_PrintingID_OPER_OUT: TFIBBCDField
      FieldName = 'ID_OPER_OUT'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingZAV_NUM: TFIBStringField
      FieldName = 'ZAV_NUM'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingPASS_NUM: TFIBStringField
      FieldName = 'PASS_NUM'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingMODEL: TFIBStringField
      FieldName = 'MODEL'
      Size = 255
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingMARK: TFIBStringField
      FieldName = 'MARK'
      Size = 255
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingDATE_CREATE: TFIBDateField
      FieldName = 'DATE_CREATE'
    end
    object pFIBDataSetFor_PrintingID_CUST: TFIBBCDField
      FieldName = 'ID_CUST'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingDOC_REG: TFIBStringField
      FieldName = 'DOC_REG'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingDATE_REG: TFIBDateField
      FieldName = 'DATE_REG'
    end
    object pFIBDataSetFor_PrintingNOTE: TFIBStringField
      FieldName = 'NOTE'
      Size = 255
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingNAME_NORM: TFIBStringField
      FieldName = 'NAME_NORM'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingAMORT_PERC: TFIBFloatField
      FieldName = 'AMORT_PERC'
    end
    object pFIBDataSetFor_PrintingMIN_PRICE: TFIBBCDField
      FieldName = 'MIN_PRICE'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingMETHOD_NAME: TFIBStringField
      FieldName = 'METHOD_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingNORM_TIP: TFIBSmallIntField
      FieldName = 'NORM_TIP'
    end
    object pFIBDataSetFor_PrintingNORM_FORMULA: TFIBStringField
      FieldName = 'NORM_FORMULA'
      Size = 255
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingBUH_DB_SCH: TFIBStringField
      FieldName = 'BUH_DB_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingBUH_KR_SCH: TFIBStringField
      FieldName = 'BUH_KR_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingNORM_YEAR: TFIBSmallIntField
      FieldName = 'NORM_YEAR'
    end
    object pFIBDataSetFor_PrintingNORM_MONTH: TFIBSmallIntField
      FieldName = 'NORM_MONTH'
    end
    object pFIBDataSetFor_PrintingNORM_ID: TFIBBCDField
      FieldName = 'NORM_ID'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingNORM_PER_PERIOD: TFIBSmallIntField
      FieldName = 'NORM_PER_PERIOD'
    end
    object pFIBDataSetFor_PrintingIS_NALOG_ACC: TFIBSmallIntField
      FieldName = 'IS_NALOG_ACC'
    end
    object pFIBDataSetFor_PrintingNAL_NAME_NORM: TFIBStringField
      FieldName = 'NAL_NAME_NORM'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingNAL_AMORT_PERC: TFIBFloatField
      FieldName = 'NAL_AMORT_PERC'
    end
    object pFIBDataSetFor_PrintingNAL_MIN_PRICE: TFIBBCDField
      FieldName = 'NAL_MIN_PRICE'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingNAL_METHOD_NAME: TFIBStringField
      FieldName = 'NAL_METHOD_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingNAL_NORM_TIP: TFIBSmallIntField
      FieldName = 'NAL_NORM_TIP'
    end
    object pFIBDataSetFor_PrintingNAL_NORM_FORMULA: TFIBStringField
      FieldName = 'NAL_NORM_FORMULA'
      Size = 255
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingNAL_DB_SCH: TFIBStringField
      FieldName = 'NAL_DB_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingNAL_KR_SCH: TFIBStringField
      FieldName = 'NAL_KR_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingNAL_NORM_YEAR: TFIBSmallIntField
      FieldName = 'NAL_NORM_YEAR'
    end
    object pFIBDataSetFor_PrintingNAL_NORM_MONTH: TFIBSmallIntField
      FieldName = 'NAL_NORM_MONTH'
    end
    object pFIBDataSetFor_PrintingNAL_NORM_ID: TFIBBCDField
      FieldName = 'NAL_NORM_ID'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingNAL_NORM_PER_PERIOD: TFIBSmallIntField
      FieldName = 'NAL_NORM_PER_PERIOD'
    end
    object pFIBDataSetFor_PrintingID_BUH_DB: TFIBBCDField
      FieldName = 'ID_BUH_DB'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingID_BUH_KR: TFIBBCDField
      FieldName = 'ID_BUH_KR'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingID_NAL_DB: TFIBBCDField
      FieldName = 'ID_NAL_DB'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingID_NAL_KR: TFIBBCDField
      FieldName = 'ID_NAL_KR'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingID_METHD: TFIBBCDField
      FieldName = 'ID_METHD'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingID_METHD_NAL: TFIBBCDField
      FieldName = 'ID_METHD_NAL'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetFor_PrintingFIO_MOL: TFIBStringField
      FieldName = 'FIO_MOL'
      Size = 68
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingMAIN_NOMN: TFIBStringField
      FieldName = 'MAIN_NOMN'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingDEPARTMENT: TFIBStringField
      FieldName = 'DEPARTMENT'
      Size = 50
      EmptyStrToNull = True
    end
    object pFIBDataSetFor_PrintingMAIN_SCH_NUM: TFIBStringField
      FieldName = 'MAIN_SCH_NUM'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object PopupMenuDragAndNormi: TPopupMenu
    Images = ImageListButton
    Left = 250
    Top = 87
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 46
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 45
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 47
      OnClick = N3Click
    end
  end
  object DataSetOperacii: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      
        'select * from MAT_INV_CANSEL_MODERN(:R_ID_KRT, :OST_PRICE, :TIP_' +
        'OP)')
    Left = 481
    Top = 136
    poSQLINT64ToBCD = True
    object DataSetOperaciiID_OPER: TFIBBCDField
      FieldName = 'ID_OPER'
      Size = 0
      RoundByScale = True
    end
    object DataSetOperaciiDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object DataSetOperaciiDATE_REG: TFIBDateField
      FieldName = 'DATE_REG'
    end
    object DataSetOperaciiID_MO_NEW: TFIBBCDField
      FieldName = 'ID_MO_NEW'
      Size = 0
      RoundByScale = True
    end
    object DataSetOperaciiID_MO_OLD: TFIBBCDField
      FieldName = 'ID_MO_OLD'
      Size = 0
      RoundByScale = True
    end
    object DataSetOperaciiID_SCH_NEW: TFIBBCDField
      FieldName = 'ID_SCH_NEW'
      Size = 0
      RoundByScale = True
    end
    object DataSetOperaciiID_SCH_OLD: TFIBBCDField
      FieldName = 'ID_SCH_OLD'
      Size = 0
      RoundByScale = True
    end
    object DataSetOperaciiNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object DataSetOperaciiOST_IZNOS_NEW: TFIBBCDField
      FieldName = 'OST_IZNOS_NEW'
      Size = 4
      RoundByScale = True
    end
    object DataSetOperaciiOST_IZNOS_OLD: TFIBBCDField
      FieldName = 'OST_IZNOS_OLD'
      Size = 4
      RoundByScale = True
    end
    object DataSetOperaciiOST_PRICE_NEW: TFIBBCDField
      FieldName = 'OST_PRICE_NEW'
      Size = 4
      RoundByScale = True
    end
    object DataSetOperaciiOST_PRICE_OLD: TFIBBCDField
      FieldName = 'OST_PRICE_OLD'
      Size = 4
      RoundByScale = True
    end
    object DataSetOperaciiPUB_ID_DOC: TFIBBCDField
      FieldName = 'PUB_ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object DataSetOperaciiSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 4
      RoundByScale = True
    end
    object DataSetOperaciiTIP_OPER: TFIBSmallIntField
      FieldName = 'TIP_OPER'
    end
  end
  object DataSet_INV_num: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_CREATE_INV_NUM(:ID_INV_KARTA)')
    Left = 481
    Top = 104
    poSQLINT64ToBCD = True
    object DataSet_INV_numGRP_NUM: TFIBStringField
      FieldName = 'GRP_NUM'
      Size = 5
      EmptyStrToNull = True
    end
    object DataSet_INV_numINV_NUM: TFIBIntegerField
      FieldName = 'INV_NUM'
    end
    object DataSet_INV_numSCH_NUM: TFIBStringField
      FieldName = 'SCH_NUM'
      Size = 10
      EmptyStrToNull = True
    end
  end
  object PopupMenu_Print: TPopupMenu
    Left = 212
    Top = 87
    object Print_inv_kart_main: TMenuItem
      Caption = 'Print_inv_kart_main'
      OnClick = Print_inv_kart_mainClick
    end
    object Print_akt_priema_peredachi: TMenuItem
      Caption = 'Print_akt_priema_peredachi'
      OnClick = Print_akt_priema_peredachiClick
    end
    object Inv_sp_osn_sredstv: TMenuItem
      Caption = 'Inv_sp_osn_sredstv'
      OnClick = Inv_sp_osn_sredstvClick
    end
    object Akt_na_spisanie: TMenuItem
      Caption = 'Akt_na_spisanie'
      OnClick = Akt_na_spisanieClick
    end
    object Invkniga1: TMenuItem
      Caption = 'Inv_kniga'
      OnClick = Invkniga1Click
    end
    object Print_dragMetall: TMenuItem
      Caption = 'Print_drag'
      OnClick = Print_dragMetallClick
    end
    object spr_ost_price: TMenuItem
      Caption = 'spr_ost_price'
      OnClick = spr_ost_priceClick
    end
    object ved_nal_os: TMenuItem
      Caption = 'ved_nal_os'
      OnClick = ved_nal_osClick
    end
    object vedcomeos: TMenuItem
      Caption = 'ved_come_os'
      OnClick = vedcomeosClick
    end
    object vedoutos: TMenuItem
      Caption = 'ved_out_os'
      OnClick = vedoutosClick
    end
    object ved_peremesheniya: TMenuItem
      Caption = 'ved_peremesheniya'
      OnClick = ved_peremesheniyaClick
    end
    object InvopisOS: TMenuItem
      Caption = 'Inv_opis_OS'
      Visible = False
      OnClick = InvopisOSClick
    end
    object matinvgrp: TMenuItem
      Caption = 'mat_inv_grp'
      OnClick = matinvgrpClick
    end
    object matnomngrp: TMenuItem
      Caption = 'mat_nomn_grp'
      OnClick = matnomngrpClick
    end
    object cross_tab_print: TMenuItem
      Caption = #1047#1072#1083#1080#1096#1082#1086#1074#1072' '#1074#1072#1088#1090'i'#1089#1090#1100' '#1054#1057
      OnClick = cross_tab_printClick
    end
    object ShowVedPereoc: TMenuItem
      Caption = #1047#1074'i'#1090' '#1087#1088#1086' '#1087#1077#1088#1077#1086#1094'i'#1085#1082#1091
      OnClick = ShowVedPereocClick
    end
    object Teh_charact_print: TMenuItem
      Caption = #1042#1110#1076#1086#1084#1110#1089#1090#1100' '#1090#1077#1093#1085#1110#1095#1085#1080#1093' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082' '#1054#1047
      OnClick = Teh_charact_printClick
    end
    object N6: TMenuItem
      Caption = #1030#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1110#1081#1085#1080#1081' '#1086#1087#1080#1089' '#1054#1047' ('#1054#1047'-10)'
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #1042#1110#1076#1086#1084#1110#1089#1090#1100' '#1088#1091#1093#1091' '#1086#1089#1085#1086#1074#1085#1080#1093' '#1079#1072#1089#1086#1073#1110#1074
      OnClick = N7Click
    end
    object InvBook2: TMenuItem
      Caption = #1030#1085#1074#1077#1085#1090#1072#1088#1085#1072' '#1082#1085#1080#1075#1072' 2'
      OnClick = InvBook2Click
    end
    object N10: TMenuItem
      Caption = #1040#1082#1090' '#1087#1088#1080#1081#1085#1103#1090#1090#1103'-'#1079#1076#1072#1085#1085#1103' '#1084#1086#1076#1077#1088#1085#1110#1079#1086#1074#1072#1085#1080#1093' '#1086#1073#39#1108#1082#1090#1110#1074' '#1054#1047'-2'
      OnClick = N10Click
    end
  end
  object DataSetPrinting_peredachu: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_SEL_TO_PRINT_PP(:id_inv_kart)')
    Left = 689
    Top = 112
    poSQLINT64ToBCD = True
    object DataSetPrinting_peredachuNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object DataSetPrinting_peredachuDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object DataSetPrinting_peredachuID_MOL: TFIBBCDField
      FieldName = 'ID_MOL'
      Size = 0
      RoundByScale = True
    end
    object DataSetPrinting_peredachuID_OPER: TFIBBCDField
      FieldName = 'ID_OPER'
      Size = 0
      RoundByScale = True
    end
    object DataSetPrinting_peredachuNOMN_NAME: TFIBStringField
      FieldName = 'NOMN_NAME'
      Size = 90
      EmptyStrToNull = True
    end
    object DataSetPrinting_peredachuNAME_SCH: TFIBStringField
      FieldName = 'NAME_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetPrinting_peredachuBEG_PR: TFIBBCDField
      FieldName = 'BEG_PR'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
      RoundByScale = True
    end
    object DataSetPrinting_peredachuPASS_NUM: TFIBStringField
      FieldName = 'PASS_NUM'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetPrinting_peredachuDATE_EXPL: TFIBDateField
      FieldName = 'DATE_EXPL'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object DataSetPrinting_peredachuDATE_CREATE: TFIBDateField
      FieldName = 'DATE_CREATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object DataSetPrinting_peredachuIZNOS: TFIBBCDField
      FieldName = 'IZNOS'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
      RoundByScale = True
    end
    object DataSetPrinting_peredachuDATE_PERIODA: TFIBDateField
      FieldName = 'DATE_PERIODA'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object DataSetPrinting_peredachuZAV_NUM: TFIBStringField
      FieldName = 'ZAV_NUM'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object DataSet_inv_sp_os: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_PRINT_INV_SP_OS')
    Left = 689
    Top = 144
    poSQLINT64ToBCD = True
    object DataSet_inv_sp_osKART_NUM: TFIBIntegerField
      FieldName = 'KART_NUM'
    end
    object DataSet_inv_sp_osDATE_REG: TFIBDateField
      FieldName = 'DATE_REG'
    end
    object DataSet_inv_sp_osID_INV_KART: TFIBBCDField
      FieldName = 'ID_INV_KART'
      Size = 0
      RoundByScale = True
    end
    object DataSet_inv_sp_osNOM_NAME: TFIBStringField
      FieldName = 'NOM_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object DataSet_inv_sp_osBEG_PR: TFIBBCDField
      FieldName = 'BEG_PR'
      Size = 4
      RoundByScale = True
    end
    object DataSet_inv_sp_osINV_FULL: TFIBIntegerField
      FieldName = 'INV_FULL'
    end
  end
  object DataSet_Auto_full_inv_num: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_CREATE_INV_NUM_1')
    Left = 689
    Top = 176
    poSQLINT64ToBCD = True
    object DataSet_Auto_full_inv_numGRP_NUM: TFIBStringField
      FieldName = 'GRP_NUM'
      Size = 5
      EmptyStrToNull = True
    end
    object DataSet_Auto_full_inv_numINV_NUM: TFIBIntegerField
      FieldName = 'INV_NUM'
    end
    object DataSet_Auto_full_inv_numSCH_NUM: TFIBStringField
      FieldName = 'SCH_NUM'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSet_Auto_full_inv_numID_KART: TFIBBCDField
      FieldName = 'ID_KART'
      Size = 0
      RoundByScale = True
    end
  end
  object DataSet_Akt_na_spisanie: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_SEL_TO_PRINT_SPISANIE(:ID_INV_KART)')
    Left = 657
    Top = 144
    poSQLINT64ToBCD = True
    object DataSet_Akt_na_spisanieNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object DataSet_Akt_na_spisanieDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object DataSet_Akt_na_spisanieID_MOL: TFIBBCDField
      FieldName = 'ID_MOL'
      Size = 0
      RoundByScale = True
    end
    object DataSet_Akt_na_spisanieID_OPER: TFIBBCDField
      FieldName = 'ID_OPER'
      Size = 0
      RoundByScale = True
    end
    object DataSet_Akt_na_spisanieNOMN_NAME: TFIBStringField
      FieldName = 'NOMN_NAME'
      Size = 90
      EmptyStrToNull = True
    end
    object DataSet_Akt_na_spisanieNAME_SCH: TFIBStringField
      FieldName = 'NAME_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSet_Akt_na_spisanieBEG_PR: TFIBBCDField
      FieldName = 'BEG_PR'
      Size = 4
      RoundByScale = True
    end
    object DataSet_Akt_na_spisaniePASS_NUM: TFIBStringField
      FieldName = 'PASS_NUM'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSet_Akt_na_spisanieDATE_EXPL: TFIBDateField
      FieldName = 'DATE_EXPL'
    end
    object DataSet_Akt_na_spisanieDATE_CREATE: TFIBDateField
      FieldName = 'DATE_CREATE'
    end
    object DataSet_Akt_na_spisanieIZNOS: TFIBBCDField
      FieldName = 'IZNOS'
      Size = 4
      RoundByScale = True
    end
    object DataSet_Akt_na_spisanieDATE_PERIODA: TFIBDateField
      FieldName = 'DATE_PERIODA'
    end
    object DataSet_Akt_na_spisanieZAV_NUM: TFIBStringField
      FieldName = 'ZAV_NUM'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSet_Akt_na_spisanieINV_NUM: TFIBIntegerField
      FieldName = 'INV_NUM'
    end
  end
  object DataSet_inv_book: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_SEL_TO_PR_INV_KNIGA')
    Left = 657
    Top = 176
    poSQLINT64ToBCD = True
    object DataSet_inv_bookNAME_NOM: TFIBStringField
      FieldName = 'NAME_NOM'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSet_inv_bookSCH_NUM: TFIBStringField
      FieldName = 'SCH_NUM'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSet_inv_bookDATE_EXPL: TFIBDateField
      FieldName = 'DATE_EXPL'
    end
    object DataSet_inv_bookAKT_EXPL_NUM: TFIBStringField
      FieldName = 'AKT_EXPL_NUM'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSet_inv_bookNACH_STOIM: TFIBBCDField
      FieldName = 'NACH_STOIM'
      Size = 4
      RoundByScale = True
    end
    object DataSet_inv_bookNACH_IZN: TFIBBCDField
      FieldName = 'NACH_IZN'
      Size = 4
      RoundByScale = True
    end
    object DataSet_inv_bookOST_STOIM: TFIBBCDField
      FieldName = 'OST_STOIM'
      Size = 4
      RoundByScale = True
    end
    object DataSet_inv_bookSUM_IZN: TFIBBCDField
      FieldName = 'SUM_IZN'
      Size = 4
      RoundByScale = True
    end
    object DataSet_inv_bookDATE_OUT: TFIBDateField
      FieldName = 'DATE_OUT'
    end
    object DataSet_inv_bookAKT_OUT_NUM: TFIBStringField
      FieldName = 'AKT_OUT_NUM'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSet_inv_bookMOL_NAME: TFIBStringField
      FieldName = 'MOL_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSet_inv_bookTIP_UCHETA: TFIBSmallIntField
      FieldName = 'TIP_UCHETA'
    end
    object DataSet_inv_bookID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSet_inv_bookID_MOL: TFIBBCDField
      FieldName = 'ID_MOL'
      Size = 0
      RoundByScale = True
    end
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    OnRestorePlacement = FormStorage1RestorePlacement
    StoredProps.Strings = (
      'cxDBTreeListPapkacxDBTreeListColumn1.Options'
      'cxDBTreeListPapkacxDBTreeListColumn1.Position'
      'cxDBTreeListPapkacxDBTreeListColumn1.Properties'
      'cxGridInvKartDBTableView1DBColumn1.Width'
      'cxGridInvKartDBTableView1DBColumn2.Width'
      'cxGridInvKartDBTableView1DBColumn3.Width'
      'cxGridInvKartDBTableView1DBColumn4.Width'
      'cxGridInvKartDBTableView1DBColumn8.Width'
      'cxGrid_historyDBTableView1DBColumn1.Width'
      'cxGrid_historyDBTableView1DBColumn2.Width'
      'cxGrid_historyDBTableView1DBColumn3.Width'
      'cxGrid_historyDBTableView1DBColumn4.Width'
      'cxGrid_historyDBTableView1DBColumn5.Width'
      'cxGrid_historyDBTableView1DBColumn6.Width'
      'cxGrid_historyDBTableView1DBColumn7.Width'
      'cxGrid_historyDBTableView1DBColumn8.Width'
      'cxGrid_historyDBTableView1DBColumn9.Width'
      'cxGrid_historyDBTableView1DBColumn10.Width'
      'cxGridInvKartDBTableView1DBColumn5.Width'
      'cxGridInvKartDBTableView1DBColumn6.Width'
      'CheckBoxShowSumma.Checked')
    StoredValues = <
      item
        Name = 'save_pos_in_the_tree'
        Value = 0
      end
      item
        Name = 'tree_spliter_pos'
        Value = False
      end
      item
        Name = 'panel_spliter_pos'
        Value = True
      end
      item
        Name = 'save_pos_in_grid'
        Value = 0
      end>
    Left = 17
    Top = 168
  end
  object PopupMenu_oper: TPopupMenu
    OnPopup = PopupMenu_operPopup
    Left = 281
    Top = 88
    object Oprihod2: TMenuItem
      Action = Oprihod
      Bitmap.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000530B0000530B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        9397999A9D9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D
        9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D9E9A9D9E939799FF00FFFF
        00FFFF00FF939799EDEDEDFCFCFCFBFBFBFAFAFAF8F8F8F6F6F6F4F4F4F2F2F2
        F0F0F0EEEEEEECECECEAEAEAE8E8E8E7E7E7E3E3E3E0E0E0DCDCDCD9D9D9D5D5
        D5D2D2D2939799FF00FFFF00FFA6A8A9FCFCFCFCFCFCFCFCFCFBFBFBFAFAFAF8
        F8F8F6F6F6F4F4F4F2F2F2F0F0F0EEEEEEECECECEAEAEAE8E8E8E7E7E7E3E3E3
        E0E0E0DCDCDCD9D9D9D5D5D59A9D9EFF00FFFF00FFA6A8A9FCFCFCFCFCFCFCFC
        FCFCFCFCFBFBFBFAFAFAF8F8F8F6F6F6F4F4F4F2F2F2F0F0F0EEEEEEECECECEA
        EAEAE8E8E8E7E7E7E3E3E3E0E0E0DCDCDCD9D9D99A9D9EFF00FFFF00FFA6A8A9
        FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFBFBFBFAFAFAF8F8F8F6F6F6F4F4F4F2F2
        F2F0F0F0EEEEEEECECECEAEAEAE8E8E8E7E7E7E3E3E3E0E0E0DCDCDC9A9D9EFF
        00FFFF00FFA6A8A9FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFBFBFBFAFAFA
        F8F8F8F6F6F6F4F4F4F2F2F2F0F0F0EEEEEEECECECEAEAEAE8E8E8E7E7E7E3E3
        E3E0E0E09A9D9EFF00FFFF00FFA6A8A9FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFCFBFBFBFAFAFAF8F8F8F6F6F6F4F4F4F2F2F2F0F0F0EEEEEEECECEC
        EAEAEAE8E8E8E7E7E7E3E3E39A9D9EFF00FFFF00FFA6A8A9FCFCFCFCFCFCFCFC
        FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFAFAFAF9F9F9F7F7F7F5F5F5F3
        F3F3F1F1F1EFEFEFECECECEAEAEAE8E8E8E7E7E79A9D9EFF00FFFF00FFA6A8A9
        FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFAFA
        FAF9F9F9F7F7F7F5F5F5F3F3F3F1F1F1EFEFEFEDEDEDEBEBEBE9E9E99A9D9EFF
        00FFFF00FFA6A8A9FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFCFCFCFCFCFAFAFAF9F9F9F7F7F7F5F5F5F3F3F3F1F1F1EFEFEFEDED
        EDEBEBEB9A9D9EFF00FFFF00FFA6A8A9FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFAFAFAF9F9F9F7F7F7F5F5F5
        F3F3F3F1F1F1EFEFEFEDEDED9A9D9EFF00FFFF00FFA6A8A9FCFCFCFCFCFCFCFC
        FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFA
        FAFAF9F9F9F7F7F7F5F5F5F3F3F3F1F1F1EFEFEF9A9D9EFF00FFFF00FFA6A8A9
        FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFCFCFCFCFCFCFAFAFAF9F9F9486555087019087019F1F1F19A9D9EFF
        00FFFF00FFA6A8A9108C31108C31108C31108C31108C31108C31108C31108C31
        108C31108C31108C31108C31108C31108C31108C31108C311084210894100870
        19108C31939799FF00FFFF00FF21AD3973D69C10B53110B53110B53110B53110
        B53110B53110B53110B53110B53110B53110B53110B53110B53114A02E087019
        0870191FA943087019087019087019FF00FFFF00FFFF00FF21AD3983DBAA10B5
        3110B53110B53110B53110B53121A542088C18FF00FFFF00FFFF00FFFF00FFFF
        00FF14A02E29C6631FA9431FA9431FA943089410087019FF00FFFF00FFFF00FF
        FF00FF21AD3955CD8B39C17639C17639C17639C176088C18FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF14A02E12922714A02E1FA943087019108421108421FF
        00FFFF00FFFF00FFFF00FFFF00FF21AD3921AD3921AD3921AD3920A439FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF14A02E29C6630870
        19FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        14A02E129227129227FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object Vnutrperem2: TMenuItem
      Action = perem
    end
    object Vvodvexpl2: TMenuItem
      Action = vvod_v_exp
    end
    object Spisanie2: TMenuItem
      Action = Spisanie
    end
    object Namoder2: TMenuItem
      Action = na_moder
      Bitmap.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000930F0000930F00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6B8B7D6B8B7D6B8B7FF00FFFF00
        FFFF00FFFF00FF1682C01682C00966A1063C5EFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6B8B7D6B8B7
        BEA2A1FF00FFFF00FFFF00FFFF00FF1E99D51682C00966A1063C5EFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFC9762BA24F22A24F22A24F22A24F229D
        4D21BEA2A1D6B8B7A87F7C703718964920A24F229D4D211E99D51682C00966A1
        063C5E703718964920A24F22FF00FFFF00FFFF00FFFF00FFC9762BF3F3F3F1F1
        F1F0F0F0EFEFEFE7E7E7BEA2A1D6B8B7A87F7CA1A1A1D7D7D7E7E7E7DDDDDD1E
        99D51682C00966A1063C5E959595C7C7C7A24F22FF00FFFF00FFFF00FFFF00FF
        C9762BF4F4F4F3F3F3F1F1F1F0F0F0E8E8E8BEA2A1D6B8B7A87F7CA2A2A2D8D8
        D8E9E9E9E0E0E01E99D51682C00966A1063C5E979797C8C8C8A24F22FF00FFFF
        00FFFF00FFFF00FFC9762BF5F5F5F4F4F4F3F3F3F1F1F1E9E9E9BEA2A1D6B8B7
        A87F7CA2A2A2D9D9D9EAEAEAE2E2E21E99D51682C00966A1063C5E989898CACA
        CAA24F22FF00FFFF00FFFF00FFFF00FFC9762BF6F6F6F5F5F5F4F4F4F3F3F3EA
        EAEABEA2A1D6B8B7A87F7CA3A3A3DADADAEBEBEBE3E3E31E99D51682C00966A1
        063C5E9A9A9ACCCCCCA24F22FF00FFFF00FFFF00FFFF00FFC9762BF7F7F7F6F6
        F6F5F5F5F4F4F4E6E6E6BEA2A1D6B8B7A87F7C9E9E9ED3D3D3EAEAEAE4E4E41E
        99D51682C00966A1063C5E9C9C9CCFCFCFA24F22FF00FFFF00FFFF00FFFF00FF
        C9762BF8F8F8F7F7F7F6F6F6F1F1F1D5D5D5BEA2A1D6B8B7A87F7C8D8D8DB9B9
        B9E1E1E1E5E5E51E99D51682C00966A1063C5E9D9D9DD1D1D1A24F22FF00FFFF
        00FFFF00FFFF00FFC9762BF9F9F9F8F8F8F7F7F7F1F1F1009694009694009694
        009694009694B1B1B1E0E0E0E6E6E61E99D51682C00966A1063C5E9F9F9FD3D3
        D3A24F22FF00FFFF00FFFF00FFFF00FFC9762BFAFAFAF9F9F9F8F8F8F4F4F400
        DEDB40FFFF00DEDB00C0C0009694C0C0C0E6E6E6E7E7E71E99D51682C00966A1
        063C5EA0A0A0D5D5D5A24F22FF00FFFF00FFFF00FFFF00FFC9762BFBFBFBFAFA
        FAF9F9F9F3F3F3D5D5D500C0C000C0C00096948C8C8CB2B2B2DBDBDBE5E5E51E
        99D51682C00966A1063C5EA1A1A1D6D6D69C4C21FF00FF666766FF00FFFF00FF
        C9762BFCFCFCFBFBFBFAFAFAF3F3F300DEDB00C0C000DEDB00C0C00096949292
        92B6B6B6D0D0D01E99D51682C00966A1063C5E9B9B9BC6C6C687421D66676696
        9696FF00FFFF00FFC9762BFCFCFCFCFCFCFBFBFBF3F3F300DEDB40FFFF00DEDB
        6D7070727475787A788E8E8E9E9E9E1682C00966A1063C5E063C5E8787879999
        99484A47828284969696FF00FFFF00FFC9762BFCFCFCFCFCFCFCFCFCF4F4F400
        DEDB40FFFF5D5E5CA5A5A57272726263615758575B5C5B575956454945444948
        3F43455355556F706E88898BA1A2A5A6A6A6FF00FFFF00FFC9762BFCFCFCFCFC
        FCFCFCFCF5F5F500DEDB40FFFF787878DDDDDDA5A5A59696967D7D7D696A6979
        7978898A889092938A8F928B9193A4A8A9B9BDC0C9CCD0A6A6A6FF00FFFF00FF
        C9762BFCFCFCFCFCFCFCFCFCF5F5F500DEDB40FFFF9E9E9EDDDDDDD9D9D99595
        95B2B2B29E9E9EA6A6A6C4C5C4CED0D2CFD6DACFD8DCD8DCDED8DBDD9E9E9EFF
        00FFFF00FFFF00FFC9762BA24F22A24F22A24F229E4D2200DEDB40FFFFA0A0A0
        EFEFEFECECECBABABA9E9E9EB9B9B9D1D3D4E0E2E3EAECEDE5EBEEE4E9ECDEDC
        DA9E9E9EFF00FFFF00FFFF00FFFF00FFC9762BD06F01D06F01D06F01CE6E0100
        DEDB00C0C000C0C09E9E9E9E9E9E9E9E9EB360019E9E9E9E9E9E9E9E9E9E9E9E
        9E9E9E9E9E9E9E9E9E8E451EFF00FFFF00FFFF00FFFF00FFCE6300ED9733ED97
        33ED9733ED9733EB9633E89432E69332E69332E69332E69332E89432EA9533F1
        C697ECA85EEFC496ECA85E2F6AF27C7184D6790DFF00FFFF00FFFF00FFFF00FF
        FF00FFDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B
        0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object Pereocenka2: TMenuItem
      Action = Peremeshenie
      Bitmap.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000920B0000920B00000000000000000000FF00FFAAABAB
        999C9E999C9E999C9D999C9E9A9D9E9A9D9E9A9D9E9A9D9F9A9D9F9A9E9F9B9E
        A09B9EA09B9EA09B9FA09B9FA19C9FA19C9FA19CA0A29CA0A29CA0A29B9EA0FF
        00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6
        F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7E4E4E3DFDFDEDBDBDAD6D6
        D6D2D2D29B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFD
        FDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7
        E4E4E3DFDFDEDBDBDAD6D6D69B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFE
        FDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EE
        EEEDECECEBCCCCD0CACACECDCDD1DFDFDEDBDBDA9B9EA0FF00FFFF00FFAAABAB
        FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7
        F6F5F5F4F3F3F2F1F1F0C7C7CB6C717E75798183868EACAEB4DFDFDE9B9EA0FF
        00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F4F5F38A8F969BA3A77378818B8F94A6AD
        AFDFDFDE9B9EA0FF00FFFF00FFAAABAB8A918984857F83857E82837D83847D83
        847D83857D83857E83857E84857F84877F84857F84857F84857F7B8187BBC3C4
        B2BFC1929AA19CA4A783847D9B9EA0FF00FFFF00FFAAABAB919993ACB3B2B0B9
        B7B9C4C4BCC7C7BAC5C4ADB8B1B3BEBBA8AEACA3A9A6ACB9B1ACB3B2AFB7B4BB
        C5C4ABAFB496979FACB4B6A4ABABB5BAB98686809B9EA0FF00FFFF00FFAAABAB
        8D948D949894B9C3C1DEEFEFDEEFEFD9EAEAC5D4D1B7C1BF8888837A7A75A3AE
        A690918BAAB3ACD3E2E1D0DDDDBAC4C8B0BDC1A8B1B09596927E7E779B9EA0FF
        00FFFF00FFAAABAB8B938B9FA7A1D4E4E4DEEFEFD0DCDCD0DCDCDEEFEFB5C1BD
        797674777A759DA69D7E7E77B3BCBAD6EBE79CC99FB9D8C0DEEFEFD8E8E8A5AA
        A47E7E769B9EA0FF00FFFF00FFAAABAB8D958DABB6B1DEEFEFD0DCDC9EA1A19E
        A1A1D0DCDCB5C1BD7B7D757F8078AAB0A9898B88B4C0BDAED2B572B06C84BB82
        DEEFEFDAEBEBAAB4AF7F80789B9EA0FF00FFFF00FFAAABAB8B9289959892C7D2
        D2CFDBDB9EA1A1A3B2B2D0DCDCDEEFEF9CA8A2A0A8A7B2C1B99AA29CC0CDCDD5
        EAE5A2CBA7BBD8C6DEEFEFCFDFDBA5AFA67F81789B9EA0FF00FFFF00FFAAABAB
        8D958E949B95AAAFACD5E3E3D0DCDCD0DCDCDEEFEFDEEFEFACB9B6ABB5B2B0BF
        BBA1A8A3D5E3E3DEEFEFDEEFEFDEEFEFDAEBEAB7C4BF979B947F7F779B9EA0FF
        00FFFF00FFAAABAB8D968F99A1A0A2AAA8B9C4C4C1CECEC8D4D4C1CECEC1CECE
        B6C3C3A6B6AFA2AEAAB2C0BCC1D2CEC5D3CFC2CECAC2CFCFBBC7C4969E969FA7
        A482837D9B9EA0FF00FFFF00FFAAABAB8D958E969E9EA3ABAA9FA7A799A1A1A9
        B1B1A5ADAD9FA7A79BA3A3A3ADABA5ADADA2ABAA99A4A1A3ACAAA5ADAA9AA2A2
        9DA4A39BA29FA0A8A781827C9B9EA0FF00FFFF00FFAAABAB8C948C8E968F9098
        928E96908D958E9098919098918E96908D958E8F97919098918F97908D958E8F
        97909098918D958E8E968F9098919098918A91899B9EA0FF00FFFF00FFAAABAB
        EEEFED9AA19CACB4B4C7CFCFD7E6E6DBEAEAD9E8E8D4E4E4C9D4D4A6AEAD9EA6
        A5969E9B9EA59E9EA59EEEEFEDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFC9B9EA0FF
        00FFFF00FFAAABABFEFEFDD8DAD7959D99A3ABABBBC3C3BFC7C7B0B8B79CA4A2
        959D9AACB2ADB1B7B1CBCECAF4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
        FDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDEBECEAAAB0AC98A09F99A19D97
        9F9BA1A8A4C4C8C4C4C8C4F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDC5C9
        C48D958FCBCFCBD8DAD7E4E6E3F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
        FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABAB
        FEFEFDFEFEFDF4F5F3EBECEAFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
        FDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF
        00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
        FDFEFEFD9B9EA0FF00FFFF00FFAAABAB9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B
        9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9C9B9B9C9B9C9C9B9C9C9B9EA0
        9B9EA09B9EA09B9EA09B9EA09B9EA0FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object doocenka2: TMenuItem
      Action = doocenivanie
      Bitmap.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000920B0000920B00000000000000000000FF00FFAAABAB
        999C9E999C9E999C9D999C9E9A9D9E9A9D9E9A9D9E9A9D9F9A9D9F9A9E9F9B9E
        A09B9EA09B9EA09B9FA09B9FA19C9FA19C9FA19CA0A29CA0A29CA0A29B9EA0FF
        00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6
        F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7E4E4E3DFDFDEDBDBDAD6D6
        D6D2D2D29B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFD
        FDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7
        E4E4E3DFDFDEDBDBDAD6D6D69B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFE
        FDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EE
        EEEDECECEBCCCCD0CACACECDCDD1DFDFDEDBDBDA9B9EA0FF00FFFF00FFAAABAB
        FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7
        F6F5F5F4F3F3F2F1F1F0C7C7CB6C717E75798183868EACAEB4DFDFDE9B9EA0FF
        00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F4F5F38A8F969BA3A77378818B8F94A6AD
        AFDFDFDE9B9EA0FF00FFFF00FFAAABAB8A918984857F83857E82837D83847D83
        847D83857D83857E83857E84857F84877F84857F84857F84857F7B8187BBC3C4
        B2BFC1929AA19CA4A783847D9B9EA0FF00FFFF00FFAAABAB919993ACB3B2B0B9
        B7B9C4C4BCC7C7BAC5C4ADB8B1B3BEBBA8AEACA3A9A6ACB9B1ACB3B2AFB7B4BB
        C5C4ABAFB496979FACB4B6A4ABABB5BAB98686809B9EA0FF00FFFF00FFAAABAB
        8D948D949894B9C3C1DEEFEFDEEFEFD9EAEAC5D4D1B7C1BF8888837A7A75A3AE
        A690918BAAB3ACD3E2E1D0DDDDBAC4C8B0BDC1A8B1B09596927E7E779B9EA0FF
        00FFFF00FFAAABAB8B938B9FA7A1D4E4E4DEEFEFD0DCDCD0DCDCDEEFEFB5C1BD
        797674777A759DA69D7E7E77B3BCBAD6EBE79CC99FB9D8C0DEEFEFD8E8E8A5AA
        A47E7E769B9EA0FF00FFFF00FFAAABAB8D958DABB6B1DEEFEFD0DCDC9EA1A19E
        A1A1D0DCDCB5C1BD7B7D757F8078AAB0A9898B88B4C0BDAED2B572B06C84BB82
        DEEFEFDAEBEBAAB4AF7F80789B9EA0FF00FFFF00FFAAABAB8B9289959892C7D2
        D2CFDBDB9EA1A1A3B2B2D0DCDCDEEFEF9CA8A2A0A8A7B2C1B99AA29CC0CDCDD5
        EAE5A2CBA7BBD8C6DEEFEFCFDFDBA5AFA67F81789B9EA0FF00FFFF00FFAAABAB
        8D958E949B95AAAFACD5E3E3D0DCDCD0DCDCDEEFEFDEEFEFACB9B6ABB5B2B0BF
        BBA1A8A3D5E3E3DEEFEFDEEFEFDEEFEFDAEBEAB7C4BF979B947F7F779B9EA0FF
        00FFFF00FFAAABAB8D968F99A1A0A2AAA8B9C4C4C1CECEC8D4D4C1CECEC1CECE
        B6C3C3A6B6AFA2AEAAB2C0BCC1D2CEC5D3CFC2CECAC2CFCFBBC7C4969E969FA7
        A482837D9B9EA0FF00FFFF00FFAAABAB8D958E969E9EA3ABAA9FA7A799A1A1A9
        B1B1A5ADAD9FA7A79BA3A3A3ADABA5ADADA2ABAA99A4A1A3ACAAA5ADAA9AA2A2
        9DA4A39BA29FA0A8A781827C9B9EA0FF00FFFF00FFAAABAB8C948C8E968F9098
        928E96908D958E9098919098918E96908D958E8F97919098918F97908D958E8F
        97909098918D958E8E968F9098919098918A91899B9EA0FF00FFFF00FFAAABAB
        EEEFED9AA19CACB4B4C7CFCFD7E6E6DBEAEAD9E8E8D4E4E4C9D4D4A6AEAD9EA6
        A5969E9B9EA59E9EA59EEEEFEDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFC9B9EA0FF
        00FFFF00FFAAABABFEFEFDD8DAD7959D99A3ABABBBC3C3BFC7C7B0B8B79CA4A2
        959D9AACB2ADB1B7B1CBCECAF4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
        FDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDEBECEAAAB0AC98A09F99A19D97
        9F9BA1A8A4C4C8C4C4C8C4F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDC5C9
        C48D958FCBCFCBD8DAD7E4E6E3F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
        FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABAB
        FEFEFDFEFEFDF4F5F3EBECEAFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
        FDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF
        00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
        FDFEFEFD9B9EA0FF00FFFF00FFAAABAB9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B
        9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9C9B9B9C9B9C9C9B9C9C9B9EA0
        9B9EA09B9EA09B9EA09B9EA09B9EA0FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object Komplectaciya2: TMenuItem
      Action = Komplectaciya
      Bitmap.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000920B0000920B00000000000000000000FF00FFAAABAB
        999C9E999C9E999C9D999C9E9A9D9E9A9D9E9A9D9E9A9D9F9A9D9F9A9E9F9B9E
        A09B9EA09B9EA09B9FA09B9FA19C9FA19C9FA19CA0A29CA0A29CA0A29B9EA0FF
        00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6
        F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7E4E4E3DFDFDEDBDBDAD6D6
        D6D2D2D29B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFD
        FDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7
        E4E4E3DFDFDEDBDBDAD6D6D69B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFE
        FDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EE
        EEEDECECEBCCCCD0CACACECDCDD1DFDFDEDBDBDA9B9EA0FF00FFFF00FFAAABAB
        FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7
        F6F5F5F4F3F3F2F1F1F0C7C7CB6C717E75798183868EACAEB4DFDFDE9B9EA0FF
        00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F4F5F38A8F969BA3A77378818B8F94A6AD
        AFDFDFDE9B9EA0FF00FFFF00FFAAABAB8A918984857F83857E82837D83847D83
        847D83857D83857E83857E84857F84877F84857F84857F84857F7B8187BBC3C4
        B2BFC1929AA19CA4A783847D9B9EA0FF00FFFF00FFAAABAB919993ACB3B2B0B9
        B7B9C4C4BCC7C7BAC5C4ADB8B1B3BEBBA8AEACA3A9A6ACB9B1ACB3B2AFB7B4BB
        C5C4ABAFB496979FACB4B6A4ABABB5BAB98686809B9EA0FF00FFFF00FFAAABAB
        8D948D949894B9C3C1DEEFEFDEEFEFD9EAEAC5D4D1B7C1BF8888837A7A75A3AE
        A690918BAAB3ACD3E2E1D0DDDDBAC4C8B0BDC1A8B1B09596927E7E779B9EA0FF
        00FFFF00FFAAABAB8B938B9FA7A1D4E4E4DEEFEFD0DCDCD0DCDCDEEFEFB5C1BD
        797674777A759DA69D7E7E77B3BCBAD6EBE79CC99FB9D8C0DEEFEFD8E8E8A5AA
        A47E7E769B9EA0FF00FFFF00FFAAABAB8D958DABB6B1DEEFEFD0DCDC9EA1A19E
        A1A1D0DCDCB5C1BD7B7D757F8078AAB0A9898B88B4C0BDAED2B572B06C84BB82
        DEEFEFDAEBEBAAB4AF7F80789B9EA0FF00FFFF00FFAAABAB8B9289959892C7D2
        D2CFDBDB9EA1A1A3B2B2D0DCDCDEEFEF9CA8A2A0A8A7B2C1B99AA29CC0CDCDD5
        EAE5A2CBA7BBD8C6DEEFEFCFDFDBA5AFA67F81789B9EA0FF00FFFF00FFAAABAB
        8D958E949B95AAAFACD5E3E3D0DCDCD0DCDCDEEFEFDEEFEFACB9B6ABB5B2B0BF
        BBA1A8A3D5E3E3DEEFEFDEEFEFDEEFEFDAEBEAB7C4BF979B947F7F779B9EA0FF
        00FFFF00FFAAABAB8D968F99A1A0A2AAA8B9C4C4C1CECEC8D4D4C1CECEC1CECE
        B6C3C3A6B6AFA2AEAAB2C0BCC1D2CEC5D3CFC2CECAC2CFCFBBC7C4969E969FA7
        A482837D9B9EA0FF00FFFF00FFAAABAB8D958E969E9EA3ABAA9FA7A799A1A1A9
        B1B1A5ADAD9FA7A79BA3A3A3ADABA5ADADA2ABAA99A4A1A3ACAAA5ADAA9AA2A2
        9DA4A39BA29FA0A8A781827C9B9EA0FF00FFFF00FFAAABAB8C948C8E968F9098
        928E96908D958E9098919098918E96908D958E8F97919098918F97908D958E8F
        97909098918D958E8E968F9098919098918A91899B9EA0FF00FFFF00FFAAABAB
        EEEFED9AA19CACB4B4C7CFCFD7E6E6DBEAEAD9E8E8D4E4E4C9D4D4A6AEAD9EA6
        A5969E9B9EA59E9EA59EEEEFEDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFC9B9EA0FF
        00FFFF00FFAAABABFEFEFDD8DAD7959D99A3ABABBBC3C3BFC7C7B0B8B79CA4A2
        959D9AACB2ADB1B7B1CBCECAF4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
        FDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDEBECEAAAB0AC98A09F99A19D97
        9F9BA1A8A4C4C8C4C4C8C4F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDC5C9
        C48D958FCBCFCBD8DAD7E4E6E3F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
        FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABAB
        FEFEFDFEFEFDF4F5F3EBECEAFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
        FDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF
        00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
        FDFEFEFD9B9EA0FF00FFFF00FFAAABAB9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B
        9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9C9B9B9C9B9C9C9B9C9C9B9EA0
        9B9EA09B9EA09B9EA09B9EA09B9EA0FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object Razukomplect1: TMenuItem
      Action = Razukomplect
      Bitmap.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000920B0000920B00000000000000000000FF00FFAAABAB
        999C9E999C9E999C9D999C9E9A9D9E9A9D9E9A9D9E9A9D9F9A9D9F9A9E9F9B9E
        A09B9EA09B9EA09B9FA09B9FA19C9FA19C9FA19CA0A29CA0A29CA0A29B9EA0FF
        00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6
        F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7E4E4E3DFDFDEDBDBDAD6D6
        D6D2D2D29B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFD
        FDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7
        E4E4E3DFDFDEDBDBDAD6D6D69B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFE
        FDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EE
        EEEDECECEBCCCCD0CACACECDCDD1DFDFDEDBDBDA9B9EA0FF00FFFF00FFAAABAB
        FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7
        F6F5F5F4F3F3F2F1F1F0C7C7CB6C717E75798183868EACAEB4DFDFDE9B9EA0FF
        00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F4F5F38A8F969BA3A77378818B8F94A6AD
        AFDFDFDE9B9EA0FF00FFFF00FFAAABAB8A918984857F83857E82837D83847D83
        847D83857D83857E83857E84857F84877F84857F84857F84857F7B8187BBC3C4
        B2BFC1929AA19CA4A783847D9B9EA0FF00FFFF00FFAAABAB919993ACB3B2B0B9
        B7B9C4C4BCC7C7BAC5C4ADB8B1B3BEBBA8AEACA3A9A6ACB9B1ACB3B2AFB7B4BB
        C5C4ABAFB496979FACB4B6A4ABABB5BAB98686809B9EA0FF00FFFF00FFAAABAB
        8D948D949894B9C3C1DEEFEFDEEFEFD9EAEAC5D4D1B7C1BF8888837A7A75A3AE
        A690918BAAB3ACD3E2E1D0DDDDBAC4C8B0BDC1A8B1B09596927E7E779B9EA0FF
        00FFFF00FFAAABAB8B938B9FA7A1D4E4E4DEEFEFD0DCDCD0DCDCDEEFEFB5C1BD
        797674777A759DA69D7E7E77B3BCBAD6EBE79CC99FB9D8C0DEEFEFD8E8E8A5AA
        A47E7E769B9EA0FF00FFFF00FFAAABAB8D958DABB6B1DEEFEFD0DCDC9EA1A19E
        A1A1D0DCDCB5C1BD7B7D757F8078AAB0A9898B88B4C0BDAED2B572B06C84BB82
        DEEFEFDAEBEBAAB4AF7F80789B9EA0FF00FFFF00FFAAABAB8B9289959892C7D2
        D2CFDBDB9EA1A1A3B2B2D0DCDCDEEFEF9CA8A2A0A8A7B2C1B99AA29CC0CDCDD5
        EAE5A2CBA7BBD8C6DEEFEFCFDFDBA5AFA67F81789B9EA0FF00FFFF00FFAAABAB
        8D958E949B95AAAFACD5E3E3D0DCDCD0DCDCDEEFEFDEEFEFACB9B6ABB5B2B0BF
        BBA1A8A3D5E3E3DEEFEFDEEFEFDEEFEFDAEBEAB7C4BF979B947F7F779B9EA0FF
        00FFFF00FFAAABAB8D968F99A1A0A2AAA8B9C4C4C1CECEC8D4D4C1CECEC1CECE
        B6C3C3A6B6AFA2AEAAB2C0BCC1D2CEC5D3CFC2CECAC2CFCFBBC7C4969E969FA7
        A482837D9B9EA0FF00FFFF00FFAAABAB8D958E969E9EA3ABAA9FA7A799A1A1A9
        B1B1A5ADAD9FA7A79BA3A3A3ADABA5ADADA2ABAA99A4A1A3ACAAA5ADAA9AA2A2
        9DA4A39BA29FA0A8A781827C9B9EA0FF00FFFF00FFAAABAB8C948C8E968F9098
        928E96908D958E9098919098918E96908D958E8F97919098918F97908D958E8F
        97909098918D958E8E968F9098919098918A91899B9EA0FF00FFFF00FFAAABAB
        EEEFED9AA19CACB4B4C7CFCFD7E6E6DBEAEAD9E8E8D4E4E4C9D4D4A6AEAD9EA6
        A5969E9B9EA59E9EA59EEEEFEDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFC9B9EA0FF
        00FFFF00FFAAABABFEFEFDD8DAD7959D99A3ABABBBC3C3BFC7C7B0B8B79CA4A2
        959D9AACB2ADB1B7B1CBCECAF4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
        FDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDEBECEAAAB0AC98A09F99A19D97
        9F9BA1A8A4C4C8C4C4C8C4F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDC5C9
        C48D958FCBCFCBD8DAD7E4E6E3F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
        FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABAB
        FEFEFDFEFEFDF4F5F3EBECEAFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
        FDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF
        00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
        FDFEFEFD9B9EA0FF00FFFF00FFAAABAB9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B
        9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9C9B9B9C9B9C9C9B9C9C9B9EA0
        9B9EA09B9EA09B9EA09B9EA09B9EA0FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object Chastspis1: TMenuItem
      Action = Chast_spis
      Bitmap.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000920B0000920B00000000000000000000FF00FFAAABAB
        999C9E999C9E999C9D999C9E9A9D9E9A9D9E9A9D9E9A9D9F9A9D9F9A9E9F9B9E
        A09B9EA09B9EA09B9FA09B9FA19C9FA19C9FA19CA0A29CA0A29CA0A29B9EA0FF
        00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6
        F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7E4E4E3DFDFDEDBDBDAD6D6
        D6D2D2D29B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFD
        FDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EEEEEDECECEBEAEAE9E8E8E7
        E4E4E3DFDFDEDBDBDAD6D6D69B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDFEFE
        FDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F3F3F2F1F1F0EE
        EEEDECECEBCCCCD0CACACECDCDD1DFDFDEDBDBDA9B9EA0FF00FFFF00FFAAABAB
        FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9F9F8F7F7
        F6F5F5F4F3F3F2F1F1F0C7C7CB6C717E75798183868EACAEB4DFDFDE9B9EA0FF
        00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FDFDFCFBFBFAF9F9F8F7F7F6F5F5F4F4F5F38A8F969BA3A77378818B8F94A6AD
        AFDFDFDE9B9EA0FF00FFFF00FFAAABAB8A918984857F83857E82837D83847D83
        847D83857D83857E83857E84857F84877F84857F84857F84857F7B8187BBC3C4
        B2BFC1929AA19CA4A783847D9B9EA0FF00FFFF00FFAAABAB919993ACB3B2B0B9
        B7B9C4C4BCC7C7BAC5C4ADB8B1B3BEBBA8AEACA3A9A6ACB9B1ACB3B2AFB7B4BB
        C5C4ABAFB496979FACB4B6A4ABABB5BAB98686809B9EA0FF00FFFF00FFAAABAB
        8D948D949894B9C3C1DEEFEFDEEFEFD9EAEAC5D4D1B7C1BF8888837A7A75A3AE
        A690918BAAB3ACD3E2E1D0DDDDBAC4C8B0BDC1A8B1B09596927E7E779B9EA0FF
        00FFFF00FFAAABAB8B938B9FA7A1D4E4E4DEEFEFD0DCDCD0DCDCDEEFEFB5C1BD
        797674777A759DA69D7E7E77B3BCBAD6EBE79CC99FB9D8C0DEEFEFD8E8E8A5AA
        A47E7E769B9EA0FF00FFFF00FFAAABAB8D958DABB6B1DEEFEFD0DCDC9EA1A19E
        A1A1D0DCDCB5C1BD7B7D757F8078AAB0A9898B88B4C0BDAED2B572B06C84BB82
        DEEFEFDAEBEBAAB4AF7F80789B9EA0FF00FFFF00FFAAABAB8B9289959892C7D2
        D2CFDBDB9EA1A1A3B2B2D0DCDCDEEFEF9CA8A2A0A8A7B2C1B99AA29CC0CDCDD5
        EAE5A2CBA7BBD8C6DEEFEFCFDFDBA5AFA67F81789B9EA0FF00FFFF00FFAAABAB
        8D958E949B95AAAFACD5E3E3D0DCDCD0DCDCDEEFEFDEEFEFACB9B6ABB5B2B0BF
        BBA1A8A3D5E3E3DEEFEFDEEFEFDEEFEFDAEBEAB7C4BF979B947F7F779B9EA0FF
        00FFFF00FFAAABAB8D968F99A1A0A2AAA8B9C4C4C1CECEC8D4D4C1CECEC1CECE
        B6C3C3A6B6AFA2AEAAB2C0BCC1D2CEC5D3CFC2CECAC2CFCFBBC7C4969E969FA7
        A482837D9B9EA0FF00FFFF00FFAAABAB8D958E969E9EA3ABAA9FA7A799A1A1A9
        B1B1A5ADAD9FA7A79BA3A3A3ADABA5ADADA2ABAA99A4A1A3ACAAA5ADAA9AA2A2
        9DA4A39BA29FA0A8A781827C9B9EA0FF00FFFF00FFAAABAB8C948C8E968F9098
        928E96908D958E9098919098918E96908D958E8F97919098918F97908D958E8F
        97909098918D958E8E968F9098919098918A91899B9EA0FF00FFFF00FFAAABAB
        EEEFED9AA19CACB4B4C7CFCFD7E6E6DBEAEAD9E8E8D4E4E4C9D4D4A6AEAD9EA6
        A5969E9B9EA59E9EA59EEEEFEDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFC9B9EA0FF
        00FFFF00FFAAABABFEFEFDD8DAD7959D99A3ABABBBC3C3BFC7C7B0B8B79CA4A2
        959D9AACB2ADB1B7B1CBCECAF4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
        FDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDEBECEAAAB0AC98A09F99A19D97
        9F9BA1A8A4C4C8C4C4C8C4F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABABFEFEFDFEFEFDC5C9
        C48D958FCBCFCBD8DAD7E4E6E3F4F5F3FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
        FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF00FFFF00FFAAABAB
        FEFEFDFEFEFDF4F5F3EBECEAFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
        FDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9EA0FF
        00FFFF00FFAAABABFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
        FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
        FDFEFEFD9B9EA0FF00FFFF00FFAAABAB9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B
        9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9C9B9B9C9B9C9C9B9C9C9B9EA0
        9B9EA09B9EA09B9EA09B9EA09B9EA0FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object DataSet_history: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_SEL_TO_HISTORY(3085599)')
    DataSource = DataSourceInvKart
    Left = 297
    Top = 160
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
    object DataSet_historyID_OP: TFIBBCDField
      FieldName = 'ID_OP'
      Size = 0
      RoundByScale = True
    end
    object DataSet_historyNUM_D: TFIBStringField
      FieldName = 'NUM_D'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSet_historyDATE_D: TFIBDateField
      FieldName = 'DATE_D'
    end
    object DataSet_historySUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      DisplayFormat = '##,#0.00'
      EditFormat = '0.00'
      Size = 4
      RoundByScale = True
    end
    object DataSet_historyINDEX_OPER: TFIBSmallIntField
      FieldName = 'INDEX_OPER'
    end
    object DataSet_historyFIO_NEW: TFIBStringField
      FieldName = 'FIO_NEW'
      Size = 72
      EmptyStrToNull = True
    end
    object DataSet_historyFIO_OLD: TFIBStringField
      FieldName = 'FIO_OLD'
      Size = 72
      EmptyStrToNull = True
    end
    object DataSet_historySCH_NUM_NEW: TFIBStringField
      FieldName = 'SCH_NUM_NEW'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSet_historySCH_NUM_OLD: TFIBStringField
      FieldName = 'SCH_NUM_OLD'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSet_historyOST_PRICE: TFIBBCDField
      FieldName = 'OST_PRICE'
      DisplayFormat = '##,#0.00'
      EditFormat = '0.00'
      Size = 4
      RoundByScale = True
    end
    object DataSet_historyOST_IZNOS: TFIBBCDField
      FieldName = 'OST_IZNOS'
      DisplayFormat = '##,#0.00'
      EditFormat = '0.00'
      Size = 4
      RoundByScale = True
    end
    object DataSet_historyID_USER: TFIBBCDField
      FieldName = 'ID_USER'
      Size = 0
      RoundByScale = True
    end
    object DataSet_historyPUB_DT_ID_DOC: TFIBBCDField
      FieldName = 'PUB_DT_ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object DataSet_historyUNDELOPER: TFIBIntegerField
      FieldName = 'UNDELOPER'
    end
    object DataSet_historyTIP_OP: TFIBStringField
      FieldName = 'TIP_OP'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object DataSource_history: TDataSource
    DataSet = DataSet_history
    Left = 329
    Top = 160
  end
  object PopupMenu_un_oper: TPopupMenu
    Images = ImageListButton
    OnPopup = PopupMenu_un_operPopup
    Left = 377
    Top = 112
    object un_operaciya: TMenuItem
      Action = unOprihodovanie
      ImageIndex = 58
      ShortCut = 16504
    end
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DatabaseMain
    TimeoutAction = TARollback
    Left = 80
    Top = 136
  end
  object DataSetSellect_info_about_drag: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_SEL_DRAG_FOR_PRINT')
    Left = 689
    Top = 80
    poSQLINT64ToBCD = True
    object DataSetSellect_info_about_dragID_INV_KART: TFIBBCDField
      FieldName = 'ID_INV_KART'
      Size = 0
      RoundByScale = True
    end
    object DataSetSellect_info_about_dragID_MET: TFIBBCDField
      FieldName = 'ID_MET'
      Size = 0
      RoundByScale = True
    end
    object DataSetSellect_info_about_dragKOL_MET: TFIBBCDField
      FieldName = 'KOL_MET'
      RoundByScale = True
    end
    object DataSetSellect_info_about_dragNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 62
      EmptyStrToNull = True
    end
    object DataSetSellect_info_about_dragINV_NUM_FULL: TFIBStringField
      FieldName = 'INV_NUM_FULL'
      Size = 8
      EmptyStrToNull = True
    end
    object DataSetSellect_info_about_dragSFIO: TFIBStringField
      FieldName = 'SFIO'
      Size = 62
      EmptyStrToNull = True
    end
    object DataSetSellect_info_about_dragNAMENOMN: TFIBStringField
      FieldName = 'NAMENOMN'
      Size = 50
      EmptyStrToNull = True
    end
    object DataSetSellect_info_about_dragID_MO: TFIBBCDField
      FieldName = 'ID_MO'
      Size = 0
      RoundByScale = True
    end
  end
  object PopupMenuFor_Amort: TPopupMenu
    Images = ImageListButton
    Left = 377
    Top = 153
    object create_ved_main: TMenuItem
      Caption = 'create_ved_main'
      ImageIndex = 6
      OnClick = create_ved_mainClick
    end
    object looksrooved_main: TMenuItem
      Action = ActionLookSroo_Ved
      ImageIndex = 23
    end
    object destroyved_main: TMenuItem
      Action = Action_destroy_amort_ved
      ImageIndex = 8
    end
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Left = 305
    Top = 225
  end
  object DataSet_NaTe_object: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_SEL_FOR_OBJECT(-1)')
    DataSource = DataSourceInvKart
    AfterScroll = DataSet_NaTe_objectAfterScroll
    Left = 417
    Top = 229
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object DataSourceObj: TDataSource
    DataSet = DataSet_NaTe_object
    Left = 449
    Top = 229
  end
  object WorkQuery: TpFIBQuery
    Database = DatabaseMain
    Transaction = WriteTransaction
    Left = 545
    Top = 185
  end
  object Proverka_is_do_exists: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'SELECT ID_DOC FROM PUB_DT_ALL_DOC WHERE ID_DOC=:id')
    Left = 152
    Top = 357
    poSQLINT64ToBCD = True
    object Proverka_is_do_existsID_DOC: TFIBBCDField
      FieldName = 'ID_DOC'
      Size = 0
      RoundByScale = True
    end
  end
  object StPr: TpFIBStoredProc
    Database = DatabaseMain
    Transaction = Tr
    Left = 18
    Top = 340
  end
  object Tr: TpFIBTransaction
    DefaultDatabase = DatabaseMain
    TimeoutAction = TARollback
    Left = 408
    Top = 258
  end
  object frDBDataSetPrint_karta: TfrDBDataSet
    Left = 618
    Top = 111
  end
  object frReportPrint_karta: TfrReport
    InitialZoom = pzDefault
    MDIPreview = True
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 612
    Top = 148
    ReportForm = {19000000}
  end
  object frxrprt1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.DoubleBuffered = False
    PreviewOptions.MDIChild = True
    PreviewOptions.Modal = False
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38819.431152881900000000
    ReportOptions.LastChange = 41347.384842662000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'begin'
      ''
      'end.')
    Left = 121
    Top = 461
    Datasets = <
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end>
    Variables = <
      item
        Name = 'godok'
        Value = #39#1079#1072'   '#1088#1086#1082#1091#39
      end
      item
        Name = 'ustanova'
        Value = #39#1044#1086#1085#1077#1094#1100#1082#1080#1081' '#1085#1072#1094#1110#1086#1085#1072#1083#1100#1085#1080#1081' '#1091#1085#1110#1074#1077#1088#1089#1080#1090#1077#1090#39
      end
      item
        Name = 'OKUD'
        Value = #39'02066769'#39
      end
      item
        Name = 'OKPO'
        Value = #39'02070803'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 461.102660000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 2.000000000000000000
          Width = 464.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ustanova]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 176.000000000000000000
          Top = 20.000000000000000000
          Width = 96.000000000000000000
          Height = 12.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1085#1072#1079#1074#1072' '#1091#1089#1090#1072#1085#1086#1074#1080')')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 530.015770000000000000
          Width = 187.000000000000000000
          Height = 61.102350000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1058#1080#1087#1086#1074#1072' '#1092#1086#1088#1084#1072' '#8470' '#1054#1047'-2 ('#1073#1102#1076#1078#1077#1090')'
            #1047#1072#1090#1074#1077#1088#1076#1078#1077#1085#1086
            #1053#1072#1082#1072#1079' '#1043#1086#1083#1086#1074#1085#1086#1075#1086' '#1091#1087#1088#1072#1074#1083'i'#1085#1085#1103' '#1044#1077#1088#1078#1072#1074#1085#1086#1075#1086
            #1082#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072' '#1059#1082#1088#1072#1111#1085#1080' '#1090#1072' '#1044#1077#1088#1078#1072#1074#1085#1086#1075#1086
            #1082#1086#1084#1110#1090#1077#1090#1091' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080' '#1059#1082#1088#1072#1111#1085#1080
            #1074#1110#1076' 02.12.97 '#1088'. '#8470' 125/70')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 2.000000000000000000
          Top = 88.000000000000000000
          Width = 96.000000000000000000
          Height = 28.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081
            #1082#1086#1076' '#1028#1044#1056#1055#1054#1059)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 137.000000000000000000
          Top = 96.000000000000000000
          Width = 96.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[OKUD]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 530.267780000000000000
          Top = 92.220470000000000000
          Width = 96.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1050#1086#1076' '#1079#1072' '#1044#1050#1059#1044)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 627.370130000000000000
          Top = 92.220470000000000000
          Width = 82.086580000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 0.220470000000000000
          Top = 252.944960000000000000
          Width = 717.795300000000000000
          Height = 46.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1040#1082#1090
            #1087#1088#1080#1081#1085#1103#1090#1090#1103'-'#1079#1076#1072#1085#1085#1103' '#1074#1110#1076#1088#1077#1084#1086#1085#1090#1086#1074#1072#1085#1080#1093', '#1088#1077#1082#1086#1085#1089#1090#1088#1091#1081#1086#1074#1072#1085#1080#1093' '#1090#1072
            #1084#1086#1076#1077#1088#1085#1110#1079#1086#1074#1072#1085#1080#1093' '#1086#1073#39#1108#1082#1090#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo129: TfrxMemoView
          Left = 529.134200000000000000
          Top = 128.504020000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1047#1072#1090#1074#1077#1088#1076#1078#1091#1102':')
          ParentFont = False
        end
        object Memo130: TfrxMemoView
          Left = 529.134200000000000000
          Top = 158.740260000000000000
          Width = 177.637910000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1086#1089#1072#1076#1072')')
          ParentFont = False
        end
        object Memo131: TfrxMemoView
          Left = 529.134200000000000000
          Top = 185.196970000000000000
          Width = 177.637910000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1055#1030#1041')')
          ParentFont = False
        end
        object Memo132: TfrxMemoView
          Left = 529.134200000000000000
          Top = 207.874150000000000000
          Width = 177.637910000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
        end
        object Memo133: TfrxMemoView
          Left = 529.134200000000000000
          Top = 226.771800000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '"__"______________20__'#1088'.')
          ParentFont = False
        end
        object Memo154: TfrxMemoView
          Left = 453.543600000000000000
          Top = 321.260050000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072)
        end
        object Memo155: TfrxMemoView
          Left = 574.488560000000000000
          Top = 321.260050000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1089#1082#1083#1072#1076#1072#1085#1085#1103)
        end
        object Memo156: TfrxMemoView
          Left = 453.543600000000000000
          Top = 340.157700000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Ds_Moderniz."NUM_DOC"]')
        end
        object Memo157: TfrxMemoView
          Left = 574.488560000000000000
          Top = 340.157700000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Ds_Moderniz."DATE_DOC"]')
        end
        object Memo11: TfrxMemoView
          Left = 294.803340000000000000
          Top = 374.173470000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 294.803340000000000000
          Top = 393.071120000000000000
          Width = 64.252010000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1088#1072#1093#1091#1085#1086#1082','
            #1089#1091#1073#1088#1072'-'
            #1093#1091#1085#1086#1082)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 359.055350000000000000
          Top = 393.071120000000000000
          Width = 60.472480000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1082#1086#1076' '#1072#1085#1072#1083#1110'-'
            #1090#1080#1095#1085#1086#1075#1086' '
            #1086#1073#1083#1110#1082#1091)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 419.527830000000000000
          Top = 374.173470000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 419.527830000000000000
          Top = 393.071120000000000000
          Width = 64.252010000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1088#1072#1093#1091#1085#1086#1082','
            #1089#1091#1073#1088#1072'-'
            #1093#1091#1085#1086#1082)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 483.779840000000000000
          Top = 393.071120000000000000
          Width = 60.472480000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1082#1086#1076' '#1072#1085#1072#1083#1110'-'
            #1090#1080#1095#1085#1086#1075#1086' '
            #1086#1073#1083#1110#1082#1091)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 544.252320000000000000
          Top = 374.173470000000000000
          Width = 68.031540000000000000
          Height = 68.031540000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 612.283860000000000000
          Top = 374.173470000000000000
          Width = 83.149660000000000000
          Height = 68.031540000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1085#1074#1077#1085#1090#1072#1088'-'
            #1085#1080#1081' '#1085#1086#1084#1077#1088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 3.779530000000000000
          Top = 374.173470000000000000
          Width = 291.023810000000000000
          Height = 68.031540000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1076#1110#1083)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 3.779530000000000000
          Top = 442.205010000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 294.803340000000000000
          Top = 442.205010000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '2')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 359.055350000000000000
          Top = 442.205010000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 419.527830000000000000
          Top = 442.205010000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '4')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 483.779840000000000000
          Top = 442.205010000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '5')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 544.252320000000000000
          Top = 442.205010000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '6')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 612.283860000000000000
          Top = 442.205010000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '7')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 540.472790000000000000
        Width = 718.110700000000000000
        RowCount = 0
        Stretched = True
        object Memo17: TfrxMemoView
          Left = 3.779530000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[Ds_Moderniz."NAME_DEP"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 294.803340000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 359.055350000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 419.527830000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 483.779840000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 544.252320000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[Ds_Moderniz."SUM_PO_OPER"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 612.283860000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Ds_Moderniz."INV_FULL"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 464.882190000000000000
        Top = 582.047620000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          Top = 7.559060000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1047#1072' '#1079#1072#1084#1086#1074#1083#1077#1085#1085#1103#1084' '#8470' ______________')
        end
        object Memo10: TfrxMemoView
          Left = -3.779530000000000000
          Top = 41.574830000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[Ds_Moderniz."NAME_NOMN"]')
        end
        object Memo12: TfrxMemoView
          Left = -3.779530000000000000
          Top = 60.472480000000000000
          Width = 721.890230000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1086#1073#39#1108#1082#1090#1072')')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = -3.779530000000000000
          Top = 83.149660000000000000
          Width = 718.110700000000000000
          Height = 86.929190000000000000
          Memo.Strings = (
            
              #1079#1085#1072#1093#1086#1076#1080#1090#1100#1089#1103' '#1074' '#1087#1083#1072#1085#1086#1074#1086#1084#1091'/'#1087#1086#1079#1072#1087#1083#1072#1085#1086#1074#1086#1084#1091'   '#1088#1077#1084#1086#1085#1090#1110'    ('#1088#1077#1082#1086#1085#1089#1090#1088#1091#1082#1094#1110 +
              #1111', '#1084#1086#1076#1077#1088#1085#1110#1079#1072#1094#1110#1111')'
            ''
            #1079' ____________ '#1087#1086' _____________, '#1072' '#1089#1072#1084#1077' ______________ '#1076#1085#1110#1074
            ''
            
              #1088#1086#1073#1086#1090#1080' '#1087#1086' '#1088#1077#1084#1086#1085#1090#1091',  '#1087#1077#1088#1077#1076#1073#1072#1095#1077#1085#1110' '#1074#1110#1076#1086#1084#1110#1089#1090#1102' '#1076#1077#1092#1077#1082#1090#1110#1074' ('#1088#1077#1082#1086#1085#1089#1090#1088#1091#1082#1094#1110 +
              #1111', '#1084#1086#1076#1077#1088#1085#1110#1079#1072#1094#1110#1111') '#1074#1080#1082#1086#1085#1072#1085#1110' '#1087#1086#1074#1085#1110#1089#1090#1102'/'#1085#1077' '#1087#1086#1074#1085#1110#1089#1090#1102)
        end
        object Memo36: TfrxMemoView
          Left = -3.779530000000000000
          Top = 192.756030000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1074#1082#1072#1079#1072#1090#1080', '#1097#1086' '#1089#1072#1084#1077' '#1085#1077' '#1074#1080#1082#1086#1085#1072#1085#1086')')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = -3.779530000000000000
          Top = 219.212740000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000000000
          Memo.Strings = (
            
              #1055#1110#1089#1083#1103' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103'   '#1088#1077#1084#1086#1085#1090#1091'  ('#1088#1077#1082#1086#1085#1089#1090#1088#1091#1082#1094#1110#1111',  '#1084#1086#1076#1077#1088#1085#1110#1079#1072#1094#1110#1111')  '#1086#1073#39#1108 +
              #1082#1090' '#1087#1088#1086#1081#1096#1086#1074' '#1074#1080#1087#1088#1086#1073#1091#1074#1072#1085#1085#1103' '#1090#1072' '#1081#1086#1075#1086' '#1079#1076#1072#1085#1086'/'#1087#1088#1080#1081#1085#1103#1090#1086' '#1074' '#1077#1082#1089#1087#1083#1091#1072#1090#1072#1094#1110#1102' __' +
              '________'
            '                                                          ')
        end
        object Memo38: TfrxMemoView
          Left = 86.929190000000000000
          Top = 249.448980000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1076#1072#1090#1072')')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = -3.779530000000000000
          Top = 279.685220000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            
              #1047#1084#1110#1085#1080' '#1074'  '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1094#1110'  '#1086#1073#39#1108#1082#1090#1072',  '#1097#1086'   '#1074#1080#1085#1080#1082#1083#1080'   '#1074#1085#1072#1089#1083#1110#1076#1086#1082'   '#1081#1086 +
              #1075#1086' '#1088#1077#1082#1086#1085#1089#1090#1088#1091#1082#1094#1110#1111', '#1084#1086#1076#1077#1088#1085#1110#1079#1072#1094#1110#1111':')
        end
        object Memo40: TfrxMemoView
          Left = -3.779530000000000000
          Top = 302.362400000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo41: TfrxMemoView
          Left = -3.779530000000000000
          Top = 321.260050000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo42: TfrxMemoView
          Left = 34.015770000000000000
          Top = 362.834880000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1047#1076#1072#1074':')
        end
        object Memo43: TfrxMemoView
          Left = 143.622140000000000000
          Top = 381.732530000000000000
          Width = 185.196970000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1086#1089#1072#1076#1072')')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 525.354670000000000000
          Top = 381.732530000000000000
          Width = 185.196970000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1088#1110#1079#1074#1080#1097#1077' '#1090#1072' '#1110#1085#1110#1094#1110#1072#1083#1080')')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 355.275820000000000000
          Top = 381.732530000000000000
          Width = 143.622140000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 34.015770000000000000
          Top = 430.866420000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1055#1088#1080#1081#1085#1103#1074':')
        end
        object Memo47: TfrxMemoView
          Left = 143.622140000000000000
          Top = 438.425480000000000000
          Width = 185.196970000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1086#1089#1072#1076#1072')')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 525.354670000000000000
          Top = 438.425480000000000000
          Width = 185.196970000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1088#1110#1079#1074#1080#1097#1077' '#1090#1072' '#1110#1085#1110#1094#1110#1072#1083#1080')')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 355.275820000000000000
          Top = 438.425480000000000000
          Width = 143.622140000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 347.716760000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo50: TfrxMemoView
          Width = 714.331170000000000000
          Height = 298.582870000000000000
          Memo.Strings = (
            ''
            
              '     1. '#1050#1086#1096#1090#1086#1088#1080#1089#1085#1072'  '#1074#1072#1088#1090#1110#1089#1090#1100'  '#1092#1072#1082#1090#1080#1095#1085#1086'  '#1074#1080#1082#1086#1085#1072#1085#1086#1075#1086'  '#1086#1073#1089#1103#1075#1091'  '#1088#1086#1073#1110 +
              #1090':'
            #1075#1088#1085'.'#1082#1086#1087'.'
            
              #1079' '#1088#1077#1084#1086#1085#1090#1091' '#1086#1073#39#1108#1082#1090#1072'...............................................' +
              '..............   ______________   '
            ''
            
              #1079' '#1088#1077#1082#1086#1085#1089#1090#1088#1091#1082#1094#1110#1111', '#1084#1086#1076#1077#1088#1085#1110#1079#1072#1094#1110#1111' '#1086#1073#39#1108#1082#1090#1072'...........................' +
              '......   ______________'
            '                                                '
            ' '
            
              #1050#1077#1088#1110#1074#1085#1080#1082' '#1074#1110#1076#1076#1110#1083#1091' _______________________________________________' +
              '___'
            '                  '
            ' '
            '     2. '#1060#1072#1082#1090#1080#1095#1085#1072' '#1074#1072#1088#1090#1110#1089#1090#1100' ('#1075#1088#1085'.'#1082#1086#1087'.):_________________'
            '                                     '
            
              #1088#1077#1084#1086#1085#1090#1091' '#1086#1073#39#1108#1082#1090#1072' ................................................' +
              '............... ______________'
            ''
            
              #1088#1077#1082#1086#1085#1089#1090#1088#1091#1082#1094#1110#1111', '#1084#1086#1076#1077#1088#1085#1110#1079#1072#1094#1110#1111' '#1086#1073#39#1108#1082#1090#1072'.............................' +
              '....... ______________'
            ' '
            '                                                '
            
              ' '#1043#1086#1083#1086#1074#1085#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088'  ___________________________________________' +
              '___'
            '                    ')
        end
        object Memo51: TfrxMemoView
          Left = 196.535560000000000000
          Top = 139.842610000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089', '#1087#1088#1110#1079#1074#1080#1097#1077' '#1090#1072' '#1110#1085#1110#1094#1110#1072#1083#1080')')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 204.094620000000000000
          Top = 291.023810000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089', '#1087#1088#1110#1079#1074#1080#1097#1077' '#1090#1072' '#1110#1085#1110#1094#1110#1072#1083#1080')')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 211.653680000000000000
          Top = 181.417440000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1088#1086#1087#1080#1089#1086#1084')')
          ParentFont = False
        end
      end
    end
  end
  object Ds_moderniz: TfrxDBDataset
    UserName = 'Ds_moderniz'
    CloseDataSource = False
    DataSet = ds_modern
    Left = 86
    Top = 465
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 52
    Top = 461
  end
  object ds1: TDataSource
    DataSet = DS_KapRem
    Left = 210
    Top = 265
  end
  object DS_KapRem: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_KAP_REM_SEL(:id_inv_kart)')
    DataSource = DataSourceInvKart
    Left = 244
    Top = 265
    poSQLINT64ToBCD = True
    object DS_KapRemID_INV_KAP_REM: TFIBBCDField
      FieldName = 'ID_INV_KAP_REM'
      Size = 0
      RoundByScale = True
    end
    object DS_KapRemDATE_REM: TFIBDateField
      FieldName = 'DATE_REM'
    end
    object DS_KapRemISPOLNITEL: TFIBStringField
      FieldName = 'ISPOLNITEL'
      Size = 200
      EmptyStrToNull = True
    end
    object DS_KapRemSODERJANIE: TFIBStringField
      FieldName = 'SODERJANIE'
      Size = 200
      EmptyStrToNull = True
    end
    object DS_KapRemDB_ID_SCH: TFIBBCDField
      FieldName = 'DB_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DS_KapRemKR_ID_SCH: TFIBBCDField
      FieldName = 'KR_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DS_KapRemID_SM: TFIBBCDField
      FieldName = 'ID_SM'
      Size = 0
      RoundByScale = True
    end
    object DS_KapRemID_RZ: TFIBBCDField
      FieldName = 'ID_RZ'
      Size = 0
      RoundByScale = True
    end
    object DS_KapRemID_ST: TFIBBCDField
      FieldName = 'ID_ST'
      Size = 0
      RoundByScale = True
    end
    object DS_KapRemID_KEKV: TFIBBCDField
      FieldName = 'ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object DS_KapRemSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DS_KapRemSM_TITLE: TFIBStringField
      FieldName = 'SM_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DS_KapRemSM_KOD: TFIBIntegerField
      FieldName = 'SM_KOD'
    end
    object DS_KapRemRZ_TITLE: TFIBStringField
      FieldName = 'RZ_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DS_KapRemRZ_KOD: TFIBIntegerField
      FieldName = 'RZ_KOD'
    end
    object DS_KapRemST_TITLE: TFIBStringField
      FieldName = 'ST_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DS_KapRemST_KOD: TFIBIntegerField
      FieldName = 'ST_KOD'
    end
    object DS_KapRemKEKV_TITLE: TFIBStringField
      FieldName = 'KEKV_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DS_KapRemKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object DS_KapRemDB_SCH_NUMBER: TFIBStringField
      FieldName = 'DB_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DS_KapRemDB_SCH_TITLE: TFIBStringField
      FieldName = 'DB_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DS_KapRemKR_SCH_NUMBER: TFIBStringField
      FieldName = 'KR_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DS_KapRemKR_SCH_TITLE: TFIBStringField
      FieldName = 'KR_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
  end
  object StPr_KapRem: TpFIBStoredProc
    Database = DatabaseMain
    Transaction = Tr_Kap_Rem
    Left = 353
    Top = 355
  end
  object Tr_Kap_Rem: TpFIBTransaction
    DefaultDatabase = DatabaseMain
    TimeoutAction = TARollback
    Left = 389
    Top = 355
  end
  object ds_modern: TpFIBDataSet
    Database = DatabaseMain
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_PRINT_AKT_MODERNIZ(:id_kart, :id_oper)')
    Left = 16
    Top = 461
    poSQLINT64ToBCD = True
    object ds_modernNAME_NOMN: TFIBStringField
      FieldName = 'NAME_NOMN'
      Size = 100
      EmptyStrToNull = True
    end
    object ds_modernNAME_DEP: TFIBStringField
      FieldName = 'NAME_DEP'
      Size = 255
      EmptyStrToNull = True
    end
    object ds_modernSFIO: TFIBStringField
      FieldName = 'SFIO'
      Size = 50
      EmptyStrToNull = True
    end
    object ds_modernINV_FULL: TFIBStringField
      FieldName = 'INV_FULL'
      Size = 10
      EmptyStrToNull = True
    end
    object ds_modernSCH_NUM: TFIBStringField
      FieldName = 'SCH_NUM'
      Size = 30
      EmptyStrToNull = True
    end
    object ds_modernSUM_PO_OPER: TFIBBCDField
      FieldName = 'SUM_PO_OPER'
      Size = 2
      RoundByScale = True
    end
    object ds_modernDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object ds_modernNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object ds_modernOST_PRICE: TFIBBCDField
      FieldName = 'OST_PRICE'
      Size = 2
      RoundByScale = True
    end
    object ds_modernOST_IZNOS: TFIBBCDField
      FieldName = 'OST_IZNOS'
      Size = 2
      RoundByScale = True
    end
    object ds_modernBAL_PRICE: TFIBBCDField
      FieldName = 'BAL_PRICE'
      Size = 2
      RoundByScale = True
    end
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'DataSetKart'
    CloseDataSource = False
    DataSet = DataSetKart
    Left = 86
    Top = 425
  end
end
