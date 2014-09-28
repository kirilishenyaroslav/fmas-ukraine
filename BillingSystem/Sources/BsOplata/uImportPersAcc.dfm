object frmImportPersAcc: TfrmImportPersAcc
  Left = 338
  Top = 223
  Width = 800
  Height = 600
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1087#1072#1095#1082#1072#1084#1080' '#1090#1072' '#1086#1089#1086#1073#1086#1074#1080#1084#1080' '#1088#1072#1093#1091#1085#1082#1072#1084#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TcxPageControl
    Left = 34
    Top = 44
    Width = 758
    Height = 522
    ActivePage = TabSheetPack
    Align = alClient
    TabOrder = 0
    OnChange = PageControlChange
    object TabSheetPack: TcxTabSheet
      Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1087#1072#1095#1082#1072#1084#1080
      ImageIndex = 0
      OnHide = TabSheetPackHide
      object TextEditNumb: TcxTextEdit
        Left = 8
        Top = 200
        Width = 673
        Height = 21
        Properties.OnChange = TextEditNumbPropertiesChange
        Style.Color = clWindow
        TabOrder = 0
        OnKeyPress = TextEditNumbKeyPress
      end
      object LabelNumb: TcxLabel
        Left = 8
        Top = 179
        Width = 137
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
        Caption = #1053#1086#1084#1077#1088' '#1087#1072#1095#1082#1080
      end
      object LabelNameFile: TcxLabel
        Left = 8
        Top = 228
        Width = 137
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 2
        Caption = #1053#1072#1079#1074#1072' '#1092#1072#1081#1083#1091
      end
      object LabelCount_records: TcxLabel
        Left = 8
        Top = 342
        Width = 137
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 3
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1079#1072#1087#1080#1089#1110#1074
      end
      object LabelSum: TcxLabel
        Left = 8
        Top = 387
        Width = 201
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 4
        Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1089#1091#1084#1072' '#1079#1072' '#1087#1072#1095#1082#1086#1102
      end
      object Labeldate: TcxLabel
        Left = 8
        Top = 287
        Width = 137
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 5
        Caption = #1044#1072#1090#1072
      end
      object TextEditNameFile: TcxTextEdit
        Left = 8
        Top = 256
        Width = 673
        Height = 21
        Properties.OnChange = TextEditNameFilePropertiesChange
        Style.Color = clWindow
        TabOrder = 6
        OnKeyPress = TextEditNameFileKeyPress
      end
      object TextEditCountRec: TcxTextEdit
        Left = 8
        Top = 363
        Width = 673
        Height = 21
        Properties.OnChange = TextEditCountRecPropertiesChange
        Style.Color = clWindow
        TabOrder = 7
        OnKeyPress = TextEditNameFileKeyPress
      end
      object TextEditSum: TcxTextEdit
        Left = 8
        Top = 411
        Width = 673
        Height = 21
        Properties.OnChange = TextEditSumPropertiesChange
        Style.Color = clWindow
        TabOrder = 8
        OnKeyPress = TextEditNameFileKeyPress
      end
      object DateEdit: TcxDateEdit
        Left = 8
        Top = 310
        Width = 121
        Height = 21
        Properties.OnChange = DateEditPropertiesChange
        Style.Color = clWindow
        TabOrder = 9
        OnKeyPress = TextEditNameFileKeyPress
      end
      object ToolBarPack: TToolBar
        Left = 0
        Top = 0
        Width = 758
        Height = 40
        Anchors = [akTop, akRight]
        AutoSize = True
        ButtonHeight = 36
        ButtonWidth = 75
        Caption = 'ToolBarPack'
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Flat = True
        Images = PopupImageList
        ShowCaptions = True
        TabOrder = 10
        object ToolButtonSign: TToolButton
          Left = 0
          Top = 0
          Action = ActionSign
        end
        object ToolButtonUnSign: TToolButton
          Left = 75
          Top = 0
          Action = ActionUnsign
        end
      end
      object cxComboBoxMonth: TcxComboBox
        Left = 8
        Top = 152
        Width = 128
        Height = 21
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          #1089#1110#1095#1077#1085#1100
          #1083#1102#1090#1080#1081
          #1073#1077#1088#1077#1079#1077#1085#1100
          #1082#1074#1110#1090#1077#1085#1100
          #1090#1088#1072#1074#1077#1085#1100
          #1095#1077#1088#1074#1077#1085#1100
          #1083#1080#1087#1077#1085#1100
          #1089#1077#1088#1087#1077#1085#1100
          #1074#1077#1088#1077#1089#1077#1085#1100
          #1078#1086#1074#1090#1077#1085#1100
          #1083#1080#1089#1090#1086#1087#1072#1076
          #1075#1088#1091#1076#1077#1085#1100)
        Properties.OnChange = cxComboBoxMonthPropertiesChange
        TabOrder = 11
        OnKeyPress = cxComboBoxMonthKeyPress
      end
      object LabelPeriod: TcxLabel
        Left = 9
        Top = 130
        Width = 296
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 12
        Caption = #1055#1077#1088#1110#1086#1076' '#1089#1080#1089#1090#1077#1084#1080', '#1076#1086' '#1103#1082#1086#1075#1086' '#1074#1110#1076#1085#1086#1089#1080#1090#1100#1089#1103' '#1087#1072#1095#1082#1072
      end
      object cxSpinEditYear: TcxSpinEdit
        Left = 143
        Top = 152
        Width = 65
        Height = 21
        Properties.MaxValue = 2999.000000000000000000
        Properties.MinValue = 2000.000000000000000000
        Properties.ReadOnly = False
        Properties.OnChange = cxSpinEditYearPropertiesChange
        TabOrder = 13
        Value = 2000
        OnKeyPress = cxComboBoxMonthKeyPress
      end
      object LabelSign: TcxLabel
        Left = 9
        Top = 50
        Width = 296
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 14
        Caption = '1'
      end
      object ComboBoxProp: TcxComboBox
        Left = 8
        Top = 101
        Width = 128
        Height = 21
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          #1054#1087#1083#1072#1090#1072
          #1057#1091#1073#1089#1110#1076#1110#1103)
        Properties.OnChange = ComboBoxPropPropertiesChange
        Properties.OnInitPopup = ComboBoxPropPropertiesInitPopup
        Properties.OnPopup = ComboBoxPropPropertiesInitPopup
        TabOrder = 15
        OnExit = ComboBoxPropExit
        OnKeyPress = TextEditNameFileKeyPress
      end
      object LabelProp: TcxLabel
        Left = 9
        Top = 77
        Width = 296
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 16
        Caption = #1058#1080#1087' '#1087#1072#1095#1082#1080
      end
    end
    object TabSheetPersAcc: TcxTabSheet
      Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1086#1089#1086#1073#1080#1089#1090#1080#1084#1080' '#1088#1072#1093#1091#1085#1082#1072#1084#1080
      ImageIndex = 1
      object Panel1: TPanel
        Left = 501
        Top = 0
        Width = 257
        Height = 499
        Align = alRight
        TabOrder = 0
        object cxSplitter1: TcxSplitter
          Left = 1
          Top = 1
          Width = 8
          Height = 497
          HotZoneClassName = 'TcxMediaPlayer9Style'
          HotZone.SizePercent = 100
          MinSize = 100
          Control = Panel1
        end
        object GridBalance: TcxGrid
          Left = 9
          Top = 1
          Width = 247
          Height = 497
          Align = alClient
          TabOrder = 1
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          object GridBalanceDBTableView: TcxGridDBTableView
            DataController.DataSource = DataSourceBalances
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skSum
                FieldName = 'SUMMA_PAY'
                Column = GridBalanceDBTableViewDBColumn2
              end>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnFiltering = False
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.GroupFooters = gfAlwaysVisible
            Styles.StyleSheet = DevExpress_Style
            Styles.Footer = cxStyle32
            object GridBalanceDBTableViewDBColumn1: TcxGridDBColumn
              Caption = #1053#1072#1079#1074#1072' '#1090#1080#1087#1091' '#1087#1086#1089#1083#1091#1075
              DataBinding.FieldName = 'NAME_TYPE_GROUP_BALANCE'
            end
            object GridBalanceDBTableViewDBColumn2: TcxGridDBColumn
              Caption = #1057#1091#1084#1072
              Styles.Footer = cxStyle32
              DataBinding.FieldName = 'SUMMA_PAY'
            end
          end
          object GridBalanceLevel: TcxGridLevel
            GridView = GridBalanceDBTableView
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 501
        Height = 499
        Align = alClient
        TabOrder = 1
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 499
          Height = 312
          Align = alTop
          TabOrder = 0
          object ToolBar1: TToolBar
            Left = 1
            Top = 1
            Width = 497
            Height = 40
            AutoSize = True
            ButtonHeight = 36
            ButtonWidth = 144
            Caption = 'ToolBar1'
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            Flat = True
            Images = PopupImageList
            ShowCaptions = True
            TabOrder = 0
            Transparent = False
            object ToolButtonadd: TToolButton
              Left = 0
              Top = 0
              Action = ActionAddPersAcc
              AutoSize = True
            end
            object ToolButtonEdit: TToolButton
              Left = 49
              Top = 0
              Action = ActionEditPersAcc
              AutoSize = True
            end
            object ToolButtonDel: TToolButton
              Left = 100
              Top = 0
              Action = ActionDelPersAcc
              AutoSize = True
            end
            object ToolButtonBalan: TToolButton
              Left = 159
              Top = 0
              Action = ActionBalance
              AutoSize = True
              ImageIndex = 10
            end
          end
          object LabelPersAcc: TcxLabel
            Left = 242
            Top = 48
            Width = 105
            Height = 17
            AutoSize = False
            TabOrder = 1
            Caption = #1054#1089#1086#1073#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
          end
          object LabelTypeCash: TcxLabel
            Left = 246
            Top = 120
            Width = 97
            Height = 17
            AutoSize = False
            TabOrder = 2
            Caption = #1042#1080#1076' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091
          end
          object LabelNameKasApp: TcxLabel
            Left = 8
            Top = 147
            Width = 89
            Height = 17
            AutoSize = False
            TabOrder = 3
            Caption = #1050#1072#1089#1086#1074#1080#1081' '#1072#1087#1072#1088#1072#1090
          end
          object LabelKodKasApp: TcxLabel
            Left = 248
            Top = 144
            Width = 97
            Height = 19
            AutoSize = False
            TabOrder = 4
            Caption = #1050#1086#1076' '#1082#1072#1089'.'#1072#1087#1072#1088#1072#1090#1091
          end
          object BsPersAccBox: TcxLookupComboBox
            Left = 349
            Top = 45
            Width = 140
            Height = 21
            Properties.DropDownHeight = 100
            Properties.DropDownListStyle = lsEditList
            Properties.IncrementalFiltering = False
            Properties.KeyFieldNames = 'id_client_account'
            Properties.ListColumns = <
              item
                FieldName = 'client_account'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = ClientDS
            Properties.OnInitPopup = BsPersAccBoxPropertiesInitPopup
            TabOrder = 5
            OnClick = BsPersAccBoxClick
            OnEnter = BsPersAccBoxEnter
            OnExit = BsPersAccBoxExit
            OnKeyPress = TextEditNumbKeyPress
            OnKeyUp = BsPersAccBoxKeyUp
          end
          object BoxTypeCash: TcxLookupComboBox
            Left = 347
            Top = 119
            Width = 142
            Height = 21
            Properties.DropDownHeight = 100
            Properties.DropDownListStyle = lsEditList
            Properties.IncrementalFiltering = False
            Properties.KeyFieldNames = 'ID_GR_LIST_OBJ'
            Properties.ListColumns = <
              item
                Caption = #1056#1045#1043#1030#1054#1053
                Width = 70
                FieldName = 'Name_Gr_List_Obj'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = CashTypeDS
            Properties.OnInitPopup = BoxTypeCashPropertiesInitPopup
            TabOrder = 6
            OnClick = BsPersAccBoxClick
            OnEnter = BoxTypeCashEnter
            OnExit = BoxTypeCashExit
            OnKeyUp = BoxTypeCashKeyUp
          end
          object BoxKasKod: TcxLookupComboBox
            Left = 347
            Top = 144
            Width = 142
            Height = 21
            Properties.DropDownHeight = 100
            Properties.DropDownListStyle = lsEditList
            Properties.IncrementalFiltering = False
            Properties.KeyFieldNames = 'ID_GR_LIST_OBJ'
            Properties.ListColumns = <
              item
                FieldName = 'NOTE_GR_LIST_OBJ'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = KodKassaAppDS
            Properties.OnInitPopup = BoxKasKodPropertiesInitPopup
            TabOrder = 7
            OnClick = BsPersAccBoxClick
            OnEnter = BsPersAccBoxEnter
            OnExit = BoxKasKodExit
            OnKeyUp = BoxKasKodKeyUp
          end
          object BoxKassApp: TcxLookupComboBox
            Left = 97
            Top = 145
            Width = 142
            Height = 21
            Properties.DropDownHeight = 100
            Properties.DropDownListStyle = lsEditList
            Properties.IncrementalFiltering = False
            Properties.KeyFieldNames = 'ID_GR_LIST_OBJ'
            Properties.ListColumns = <
              item
                Caption = #1056#1045#1043#1030#1054#1053
                Width = 70
                FieldName = 'Name_Gr_List_Obj'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = KassaAppDS
            Properties.OnInitPopup = BoxKassAppPropertiesInitPopup
            TabOrder = 8
            OnClick = BsPersAccBoxClick
            OnEnter = BsPersAccBoxEnter
            OnExit = BoxKassAppExit
            OnKeyUp = BoxKassAppKeyUp
          end
          object LabelSumAcc: TcxLabel
            Left = 8
            Top = 122
            Width = 41
            Height = 17
            AutoSize = False
            TabOrder = 9
            Caption = #1057#1091#1084#1072
          end
          object LabelPeriodBeg: TcxLabel
            Left = 9
            Top = 174
            Width = 96
            Height = 17
            AutoSize = False
            TabOrder = 10
            Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091
          end
          object LabelPeriodEnd: TcxLabel
            Left = 248
            Top = 175
            Width = 86
            Height = 17
            AutoSize = False
            TabOrder = 11
            Caption = #1050#1110#1085#1077#1094#1100' '#1087#1077#1088#1110#1086#1076#1091
          end
          object DateEditBegPeriod: TcxDateEdit
            Left = 98
            Top = 173
            Width = 140
            Height = 21
            TabOrder = 12
          end
          object DateEditEndPeriod: TcxDateEdit
            Left = 347
            Top = 173
            Width = 142
            Height = 21
            TabOrder = 13
          end
          object pnlAdr: TPanel
            Left = 11
            Top = 208
            Width = 494
            Height = 97
            BorderStyle = bsSingle
            TabOrder = 14
            object StreetBox: TcxLookupComboBox
              Left = 127
              Top = 37
              Width = 149
              Height = 21
              Properties.DropDownHeight = 100
              Properties.DropDownListStyle = lsEditList
              Properties.IncrementalFiltering = False
              Properties.KeyFieldNames = 'Id_Street'
              Properties.ListColumns = <
                item
                  Caption = #1042#1059#1051#1048#1062#1071
                  Width = 130
                  FieldName = 'Name_Street'
                end
                item
                  Width = 40
                  FieldName = 'Type_Street'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = StreetDS
              Properties.OnInitPopup = StreetBoxPropertiesInitPopup
              TabOrder = 2
              OnClick = BsPersAccBoxClick
              OnEnter = BsPersAccBoxEnter
              OnExit = StreetBoxExit
              OnKeyUp = StreetBoxKeyUp
            end
            object HouseEdit: TcxTextEdit
              Left = 52
              Top = 64
              Width = 60
              Height = 21
              Properties.MaxLength = 10
              TabOrder = 4
            end
            object lblHouse: TcxLabel
              Left = 5
              Top = 65
              Width = 50
              Height = 17
              TabOrder = 3
              Caption = #1041#1091#1076#1080#1085#1086#1082
            end
            object lblKorpus: TcxLabel
              Left = 129
              Top = 65
              Width = 44
              Height = 17
              TabOrder = 5
              Caption = #1050#1086#1088#1087#1091#1089
            end
            object KorpusEdit: TcxTextEdit
              Left = 175
              Top = 65
              Width = 58
              Height = 21
              Enabled = False
              Properties.MaxLength = 5
              TabOrder = 6
            end
            object lblAdres: TcxLabel
              Left = 6
              Top = 37
              Width = 44
              Height = 17
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsUnderline]
              TabOrder = 0
              Caption = #1042#1091#1083#1080#1094#1103
            end
            object TypeStreetBox: TcxLookupComboBox
              Left = 55
              Top = 36
              Width = 61
              Height = 21
              Properties.DropDownHeight = 100
              Properties.DropDownListStyle = lsEditList
              Properties.DropDownWidth = 100
              Properties.IncrementalFiltering = False
              Properties.KeyFieldNames = 'Id_Type_Street'
              Properties.ListColumns = <
                item
                  FieldName = 'Name_Short'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = StreetDS
              Properties.OnInitPopup = TypeStreetBoxPropertiesInitPopup
              TabOrder = 1
              OnClick = BsPersAccBoxClick
              OnEnter = BsPersAccBoxEnter
              OnExit = TypeStreetBoxExit
              OnKeyUp = TypeStreetBoxKeyUp
            end
            object BsRegionBox: TcxLookupComboBox
              Left = 43
              Top = 8
              Width = 182
              Height = 21
              Properties.DropDownHeight = 100
              Properties.DropDownListStyle = lsEditList
              Properties.IncrementalFiltering = False
              Properties.KeyFieldNames = 'Id_Gr_List_Obj'
              Properties.ListColumns = <
                item
                  Caption = #1056#1045#1043#1030#1054#1053
                  Width = 70
                  FieldName = 'Name_Gr_List_Obj'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = RegionDS
              Properties.OnInitPopup = BsRegionBoxPropertiesInitPopup
              TabOrder = 7
              OnClick = BsPersAccBoxClick
              OnEnter = BsPersAccBoxExit
              OnExit = BsRegionBoxExit
              OnKeyUp = BsRegionBoxKeyUp
            end
            object CityAreaBox: TcxLookupComboBox
              Left = 275
              Top = 8
              Width = 202
              Height = 21
              Properties.DropDownHeight = 100
              Properties.DropDownListStyle = lsEditList
              Properties.IncrementalFiltering = False
              Properties.KeyFieldNames = 'Id_City_Area'
              Properties.ListColumns = <
                item
                  Caption = #1056#1040#1049#1054#1053
                  FieldName = 'Name_City_Area'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = CityAreaDS
              Properties.OnInitPopup = CityAreaBoxPropertiesInitPopup
              TabOrder = 8
              OnClick = BsPersAccBoxClick
              OnEnter = BsPersAccBoxEnter
              OnExit = CityAreaBoxExit
              OnKeyUp = CityAreaBoxKeyUp
            end
            object lblCItyArea: TcxLabel
              Left = 235
              Top = 8
              Width = 39
              Height = 17
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsUnderline]
              TabOrder = 9
              Caption = #1056#1072#1081#1086#1085
            end
            object lblRegion: TcxLabel
              Left = 5
              Top = 8
              Width = 40
              Height = 17
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'MS Sans Serif'
              Style.Font.Style = [fsUnderline]
              TabOrder = 10
              Caption = #1056#1077#1075#1110#1086#1085
            end
            object LabelFlat: TcxLabel
              Left = 237
              Top = 66
              Width = 56
              Height = 17
              TabOrder = 11
              Caption = #1050#1074#1072#1088#1090#1080#1088#1072
            end
            object TextEditFlat: TcxTextEdit
              Left = 306
              Top = 65
              Width = 60
              Height = 21
              Properties.MaxLength = 10
              TabOrder = 12
            end
          end
          object lblFamiliya: TcxLabel
            Left = 8
            Top = 47
            Width = 57
            Height = 17
            TabOrder = 15
            Caption = #1055#1088#1110#1079#1074#1080#1097#1077
          end
          object FamiliyaBox: TcxLookupComboBox
            Left = 85
            Top = 45
            Width = 154
            Height = 21
            Properties.DropDownHeight = 100
            Properties.DropDownListStyle = lsEditList
            Properties.IncrementalFiltering = False
            Properties.KeyFieldNames = 'Out_Str'
            Properties.ListColumns = <
              item
                Caption = #1055#1088#1110#1079#1074#1080#1097#1077
                FieldName = 'Out_Str'
              end>
            Properties.ListSource = FamSource
            Properties.MaxLength = 40
            Properties.OnInitPopup = FamiliyaBoxPropertiesInitPopup
            TabOrder = 16
            OnClick = FamiliyaBoxClick
            OnEnter = FamiliyaBoxEnter
            OnExit = FamiliyaBoxExit
            OnKeyUp = FamiliyaBoxKeyUp
          end
          object ImyaBox: TcxLookupComboBox
            Left = 85
            Top = 71
            Width = 154
            Height = 21
            Properties.DropDownHeight = 100
            Properties.DropDownListStyle = lsEditList
            Properties.IncrementalFiltering = False
            Properties.KeyFieldNames = 'Out_Str'
            Properties.ListColumns = <
              item
                Caption = #1030#1084#39#1103
                FieldName = 'Out_Str'
              end>
            Properties.ListSource = ImyaSource
            Properties.MaxLength = 40
            Properties.OnInitPopup = ImyaBoxPropertiesInitPopup
            TabOrder = 17
            OnClick = BsPersAccBoxClick
            OnEnter = BsPersAccBoxEnter
            OnExit = ImyaBoxExit
            OnKeyUp = ImyaBoxKeyUp
          end
          object PatronomycBox: TcxLookupComboBox
            Left = 85
            Top = 95
            Width = 154
            Height = 21
            Properties.DropDownHeight = 100
            Properties.DropDownListStyle = lsEditList
            Properties.IncrementalFiltering = False
            Properties.KeyFieldNames = 'Out_Str'
            Properties.ListColumns = <
              item
                Caption = #1055#1086' '#1073#1072#1090#1100#1082#1086#1074#1110
                FieldName = 'Out_Str'
              end>
            Properties.ListSource = PatrSource
            Properties.MaxLength = 40
            Properties.OnInitPopup = PatronomycBoxPropertiesInitPopup
            TabOrder = 18
            OnClick = BsPersAccBoxClick
            OnEnter = BsPersAccBoxEnter
            OnExit = PatronomycBoxExit
            OnKeyUp = PatronomycBoxKeyUp
          end
          object lblOtch: TcxLabel
            Left = 7
            Top = 97
            Width = 68
            Height = 17
            TabOrder = 19
            Caption = #1055#1086' '#1073#1072#1090#1100#1082#1086#1074#1110
          end
          object lblImya: TcxLabel
            Left = 8
            Top = 72
            Width = 27
            Height = 17
            TabOrder = 20
            Caption = #1030#1084#39#1103
          end
          object TextEditSumAcc: TcxTextEdit
            Left = 88
            Top = 120
            Width = 153
            Height = 21
            TabOrder = 21
          end
        end
        object GridAcc: TcxGrid
          Left = 1
          Top = 354
          Width = 499
          Height = 144
          Align = alClient
          TabOrder = 1
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          object GridAccDBView: TcxGridDBTableView
            DataController.DataSource = DataSourcePersAcc
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OnCustomDrawCell = GridAccDBViewCustomDrawCell
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnFiltering = False
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            Styles.StyleSheet = DevExpress_Style
            object GridAccDBViewDBColumn1: TcxGridDBColumn
              Caption = 'O'#1089#1086#1073#1086#1074#1080#1081' '#1088#1072#1093'.'
              SortOrder = soAscending
              Width = 100
              DataBinding.FieldName = 'CLIENT_ACCOUNT'
            end
            object GridAccDBViewDBColumn6: TcxGridDBColumn
              Caption = #1060#1030#1054
              Width = 126
              DataBinding.FieldName = 'FIO'
            end
            object GridAccDBViewDBColumn3: TcxGridDBColumn
              Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091
              Width = 105
              DataBinding.FieldName = 'DATE_BEG_PERIOD_FOR_ACC'
            end
            object GridAccDBViewDBColumn4: TcxGridDBColumn
              Caption = #1050#1110#1085#1077#1094#1100' '#1087#1077#1088#1110#1086#1076#1091
              Width = 99
              DataBinding.FieldName = 'DATE_END_PERIOD_FOR_ACC'
            end
            object GridAccDBViewDBColumn2: TcxGridDBColumn
              Caption = #1057#1091#1084#1072
              Width = 55
              DataBinding.FieldName = 'SUM_OPL'
            end
            object GridAccDBViewDBColumn5: TcxGridDBColumn
              Visible = False
              DataBinding.FieldName = 'FLAG_ALLOC_ER'
            end
          end
          object GridAccLevel: TcxGridLevel
            GridView = GridAccDBView
          end
        end
        object PanelButtons: TPanel
          Left = 1
          Top = 313
          Width = 499
          Height = 41
          Align = alTop
          TabOrder = 2
          Visible = False
          object ButtonSave: TcxButton
            Left = 321
            Top = 8
            Width = 91
            Height = 25
            Action = ActionSave
            TabOrder = 0
            Glyph.Data = {
              36090000424D3609000000000000360000002800000018000000180000000100
              2000000000000009000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B
              0000004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B00000E9D
              1D000E9D1D00004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B00001CB1350011A4
              22000E9D1D0011A42200004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00004B00002EC6520024BC43001392
              2400004B00000D931A000E9D1D00004B0000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00004B000035CA5E0039D465001CA13400004B
              0000FF00FF00004B00000A8615000E9D1D00004B0000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00004B000029B54800004B0000FF00
              FF00FF00FF00FF00FF00FF00FF00004B00000D931A00004B0000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B0000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00004B00000A861500004B0000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B0000004B
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B
              0000004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          end
          object cxButton2: TcxButton
            Left = 417
            Top = 8
            Width = 89
            Height = 25
            Action = ActionCancel
            TabOrder = 1
          end
        end
      end
    end
    object TabSheetErr: TcxTabSheet
      Caption = #1055#1086#1084#1080#1083#1082#1080
      ImageIndex = 2
      object ToolBarError: TToolBar
        Left = 0
        Top = 0
        Width = 758
        Height = 48
        AutoSize = True
        ButtonHeight = 44
        ButtonWidth = 68
        Caption = 'ToolBarError'
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Flat = True
        Images = ImageList
        ShowCaptions = True
        TabOrder = 0
        Transparent = True
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Action = ActionCheck
        end
      end
      object GridPack: TcxGrid
        Left = 0
        Top = 48
        Width = 758
        Height = 451
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        object GridPackDBView: TcxGridDBTableView
          OnDblClick = GridPackDBViewDblClick
          DataController.DataSource = DataSourceCheckError
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.KeyFieldNames = 'ID_DT_ALLOC_PERS_AC'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnFiltering = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = DevExpress_Style
          object GridPackDBViewDBColumn1: TcxGridDBColumn
            Caption = #1050#1086#1076' '#1087#1086#1084#1080#1083#1082#1080
            Width = 84
            DataBinding.FieldName = 'KOD_ERROR'
          end
          object GridPackDBViewDBColumn2: TcxGridDBColumn
            Caption = #1050#1086#1088#1086#1090#1082#1072' '#1085#1072#1079#1074#1072
            Width = 113
            DataBinding.FieldName = 'NAME_ERROR'
          end
          object GridPackDBViewDBColumn3: TcxGridDBColumn
            Caption = #1055#1086#1074#1110#1076#1086#1084#1083#1077#1085#1085#1103' '#1087#1086#1084#1080#1083#1082#1080
            Width = 570
            DataBinding.FieldName = 'ERROR_MESSAGE'
          end
        end
        object GridPackLevel: TcxGridLevel
          GridView = GridPackDBView
        end
      end
    end
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
        BorderStyle = bbsNone
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 288
        FloatTop = 223
        FloatClientWidth = 0
        FloatClientHeight = 0
        IsMainMenu = True
        ItemLinks = <
          item
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            Item = dxBarLargeButton2
            Visible = True
          end
          item
            Item = dxBarLargeButton4
            Visible = True
          end
          item
            Item = dxBarLargeButton3
            Visible = True
          end>
        MultiLine = True
        Name = 'Custom 1'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'FilterPanel'
        DockedDockingStyle = dsLeft
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsLeft
        FloatLeft = 404
        FloatTop = 341
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarLargeButton5
            Visible = True
          end
          item
            Item = dxBarLargeButton6
            Visible = True
          end
          item
            Item = dxBarLargeButton7
            Visible = True
          end
          item
            Item = dxBarLargeButton8
            Visible = True
          end
          item
            Item = dxBarLargeButton9
            Visible = True
          end
          item
            Item = dxBarLargeButton10
            Visible = True
          end
          item
            Item = dxBarLargeButton11
            Visible = True
          end
          item
            Item = dxBarLargeButton12
            Visible = True
          end>
        Name = 'FilterPanel'
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LargeImages = ImageList
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 432
    Top = 7
    DockControlHeights = (
      34
      0
      44
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Action = ActionBack
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = ActionNext
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = ActionClose
      Category = 0
      Hint = #1047#1072#1082#1088#1080#1090#1080
      AutoGrayScale = False
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Action = ActionRefresh
      Category = 0
      AutoGrayScale = False
    end
    object btnFilter: TdxBarButton
      Category = 0
      Visible = ivAlways
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FFF9F500FFF9F500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F9F3EE00FF00
        FF00F7F0EC00CAC5C300A4A19F00DBD5D300F9F3EE00FF00FF00F9F3EE00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00DBD5D300A5A3A200898787009C9A9800E5E0DC00F9F3EE00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F9F3EE00FF00
        FF00DBD5D300D3CECC00A5A3A2008C8A8A00B0ACAB00F2EAE500FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00EFE9E500D3CECC00CAC5C3009C9A98008C8A8A00C5C1BF00F7F0EC00FF00
        FF00F9F3EE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F9F3
        EE00FFF9F500E4DEDA00CAC5C300BCBABA008C8A8A00908E8E00DBD5D300F9F3
        EE00FF00FF00F9F3EE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00F9F3EE00FFF9F500DBD5D300CAC5C300B4B0AF0084838300A5A3A200EDE6
        E200F9F3EE00F7F0EC00F9F3EE00F9F3EE00F9F3EE00F9F3EE00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00F9F3EE00FFF9F500DBD5D300CAC5C300A5A3A20084838300C4BE
        BC00FF00FF00FFFDF800FFF9F500FFF9F500FFF9F500FFF9F500FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00F9F3EE00FFF9F500D3CECC00CABEBC008C8A8A008A88
        8600C5C1BF00B9B5B300A19D9C00969392009C9A9800C4BEBC00EDE6E200F9F3
        EE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D9CFCE00B9B5B3006F6F
        6F007B78780096939200AAA5A200AAA5A20094918E007776750084838300D3CE
        CC00F7F0EC00FF00FF00F9F3EE00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00F9F3EE00FF00FF00F9F3EE00AAA8A800B0AC
        AB00DCD3CC00F7F0EC00FF00FF00FFF9F500F9F3EE00E2D9D4009A9795007B78
        7800D3CECC00F9F3EE00FF00FF00F9F3EE00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FFF9F500CFCAC800AAA5A200EADD
        D200F8EEE300F8EEE300F9F3EE00F7F0EC00F9F3EE00FAEFE900F5E3DF009C98
        97008A888600E4DEDA00FF00FF00FF00FF00F9F3EE00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00F2EAE500AAA5A200D9CEC400F9E9
        DB00F5E9DC00F8EEE300F2EAE500F8EEE300F8EEE300F2EAE500F7E6E200E6D4
        D10081807F00B9B5B300F9F3EE00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00F9F3EE00FFF9F500D3CECC00ABA29B00F4DECA00F6E4
        D200F9E9DB00F9E9DB00F9E9DB00F9E9DB00F9E9DB00F9E9DB00F5E9DC00F9E2
        DA00AAA5A20096939200F2EAE500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00F9F3EE00FFF9F500BCBABA00B7AA9E00F4DECA00F6E4
        D200F9E9DB00FBE8D600FBE8D600FBE8D600FBE8D600F9E9DB00F5E9DC00F9E2
        DA00CABEBC00908E8E00EAE3DF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00F9F3EE00FFF9F500B4B0AF00B5A59600F9DDC300FBE6
        D300FBE8D600FBE6D300FBE6D300FBE6D300FBE8D600F9E9DB00F9E9DB00F9E2
        DA00D1BCB600908E8E00EAE3DF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00F9F3EE00FFF9F500C5C1BF00A4968A00F4D6BA00FADC
        BE00F9DDC300F9DDC300F9DDC300FBE0C700FCE4CC00FCE4CC00F7E3CE00FADD
        CC00CEBBB4009C9A9800F2EAE500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00DCD8D600928B8300E3C2A200FCE4
        CC00F9DDC300FADCBE00FADCBE00FADCBE00F9DDC300F9DDC300F7E3CE00FADD
        CC00BAAEA800AAA8A800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00F9F3EE00FF00FF00F6EEEA00ACA8A600B1967B00FCE4
        CC00FBE6D300FCE4CC00FCE4CC00FCE4CC00FCE4CC00FBE6D300FBE6D300EDD2
        BB009C989700D3CECC00FFF9F500F9F3EE00F9F3EE00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DBD5D3009D918700C6AA
        9100FCE4CC00FFE8CE00FCE4CC00FCE4CC00FCE4CC00FBE6D300EDD2BB00B3A8
        A000B4B1B000F9F3EE00FF00FF00F9F3EE00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F7F0EC00CCC9C7009D91
        8700B7A08C00DBC2A900EDD2BB00F4D6BA00EACEB300D2B8A100ABA29B00B4B1
        B000F2EAE500FF00FF00F9F3EE00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F7F0EC00D3CE
        CC00AAA5A2009D918700A2918200A2918200A4968A00AAA5A200CAC5C300F6EE
        EA00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F9F3EE00F9F3EE00FF00
        FF00F6EEEA00E4DEDA00D3CECC00D3CECC00DCD8D600F2EAE500FFF9F500FF00
        FF00F9F3EE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F6EEEA00F6EE
        EA00F6EEEA00F6EEEA00F6EEEA00F6EEEA00F6EEEA00F6EEEA00F6EEEA00F6EE
        EA00F9F3EE00FFF9F500FFFDF800FFFDF800FFF9F500F9F3EE00F6EEEA00F6EE
        EA00F6EEEA00F6EEEA00F6EEEA00F6EEEA00F6EEEA00F6EEEA00}
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FEFEFE00FDFDFD00FCFCFC00FCFCFC00FDFDFD00FEFE
        FE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FCFC
        FC00F4F4F400F2F2F200EFEFEF00ECECEC00ECECEC00ECECEC00EDEDED00EEEE
        EE00F0F0F000F9F9F900FCFCFC00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FBFBFB00F1F1F100ECECEC00E8E8
        E80023ABCA0025ABC8005DB8CD00D0D1D200D1D1D100D1D1D100D3D3D300D6D6
        D600D9D9D900E1E1E100E6E6E600EAEAEA00F4F4F400FBFBFB00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FCFCFC00F7F7F700ECECEC00E7E7E700C0D8
        DD005CCBDF0051BFD70049C5DC0008A2C30052AFC400A6BEC300C8C8C800CCCC
        CC00D0D0D000DADADA00DFDFDF00E4E4E400EFEFEF00F4F4F400FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FBFBFB00F5F5F500EAEAEA00E4E5E50026AB
        CA0075CFE10044CCE00061D1E40078D8E70057C9DD0004A0C500A2BCC200C7C7
        C700CCCCCC00D7D7D700DDDDDD00E2E2E200EDEDED00F3F3F300FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FAFAFA00EFF0F0001AAACA0057D1
        E30007BED70028BCD60007B1D10048CFE30002A4C60047D1E30013A9CB002BB7
        D20012A7C700DFDFDF00E4E4E400E9E9E900F3F3F300F8F8F800FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B3DFE90021B2CE0064D5
        E60019C8E10009AACC001ACDE70013ADCD001CC0DA0042C8DD001CC4DB0089E2
        EE006CD5E50066C0D300ECECEC00F0F0F000F9F9F900FEFEFE00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0054C1D80040C7DC0038C8
        DD0013C1DC0012BDDB0035DBF00007ABCD0042D1E5000CA7CA0033CDE00050D4
        E4003CC0D90030B4D1006FC8DB00F9FAFA00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF001AADCB006FDDEB0015C7
        E2001BC3E00036E3FA0021C7E20031C9E20008B4D20013C4DC0007ACCC0031C1
        D80097E4EF001FADCC00ACE0EC00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002DB9D30061DCED0023D4
        ED002FD4EE003CDFF70014B7D70016BBD80013C9DF0030C8DD003BC8DD009AE4
        EE0048BED600F6FCFC00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003BC4DC005AE0F10031E0
        F80048E2F80030CBE7002DD1EC001ACBE40028C8DF0003B3D00091E0EC002EB2
        D000A3DDEA00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00DADAE9004DCFE50065EAFC004EE6
        FC0053DBF0004EE3F70033DBF40014C6DE0050D3E40074D5E600D7F0F600FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00B5B5D3000A0B74000D5AA0008EE8F80089EF
        FE0064E5F90050E6FC0035E3F90063DBEA005CCDDE0025AFCD00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF001F1F80000000AA0002088900020E75004E92
        C1007AEEFD0048E7FD004DE4F70044C1D90037B7D200EFF9FB00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0005A2C50022A3C600174193001011AE003333E3004B4B
        F40003087200053F90002EB1CF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0002A1C4002CBFD7005DDCED0011248400101688004545
        DF002B2BD2000E0E7B00BCBCD800FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00DBF2F600179FC20010A5C8008EEFFC005193C4000D13
        79001A1AB2000D0D7400EEEEF500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00106396004292C2002E89C100188FBD00059FC30047C5
        DC00E0F3F700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FDFEFE003E8CBB005DA7D500107CBF002378AE005192B70070CB
        DE00FCFEFE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0085B0CA008DC1E1002186C5001982C30011649800CEDFE900FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF004787B0005FA0C70019689A0012689E0097C6E300B1CCDC00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000E6296007AB0D100ECEEEE0019689A006BA7CD00FDFEFE00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF001E6D9E0093C1DE00126497002F79A7003580AD00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00F8FAFC005B94B80017679A005F97BA00EAF1F600FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ImageIndex = 13
    end
    object dxBarLargeButton5: TdxBarLargeButton
      Action = ActionFilter
      Category = 0
      AutoGrayScale = False
      ShowCaption = False
    end
    object dxBarLargeButton6: TdxBarLargeButton
      Action = ActionClear
      Category = 0
      AutoGrayScale = False
      ShowCaption = False
    end
    object dxBarLargeButton7: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 15
      AutoGrayScale = False
      ShowCaption = False
    end
    object dxBarLargeButton8: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 16
      AutoGrayScale = False
      ShowCaption = False
    end
    object dxBarLargeButton9: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 17
      AutoGrayScale = False
      ShowCaption = False
    end
    object dxBarLargeButton10: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 18
      ShowCaption = False
    end
    object dxBarLargeButton11: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 19
      AutoGrayScale = False
      ShowCaption = False
    end
    object dxBarLargeButton12: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 20
      AutoGrayScale = False
      ShowCaption = False
    end
  end
  object Styles: TcxStyleRepository
    Left = 760
    Top = 8
    object BackGround: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object FocusedRecord: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 11037222
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clDefault
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Header: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object DesabledRecord: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor]
      Color = 13875838
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor]
      Color = 15850428
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15850428
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14531001
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor]
      Color = 12937777
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxGridTableViewStyleSheet2: TcxGridTableViewStyleSheet
      Styles.Background = BackGround
      Styles.Content = BackGround
      Styles.ContentEven = cxStyle22
      Styles.ContentOdd = cxStyle23
      Styles.Inactive = DesabledRecord
      Styles.Selection = FocusedRecord
      Styles.Header = Header
      BuiltIn = True
    end
    object DevExpress_Style: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle24
      Styles.Content = cxStyle25
      Styles.ContentEven = cxStyle26
      Styles.ContentOdd = cxStyle27
      Styles.Inactive = cxStyle33
      Styles.IncSearch = cxStyle34
      Styles.Selection = cxStyle37
      Styles.FilterBox = cxStyle28
      Styles.Footer = cxStyle29
      Styles.Group = cxStyle30
      Styles.GroupByBox = cxStyle31
      Styles.Header = cxStyle32
      Styles.Indicator = cxStyle35
      Styles.Preview = cxStyle36
      BuiltIn = True
    end
  end
  object ImageList: TImageList
    Height = 24
    Width = 24
    Left = 592
    Top = 2
    Bitmap = {
      494C010115001800040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000006000000090000000010020000000000000D8
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000FCFDFD00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FEFDFC000000
      0000FEFEFE0000000000FEFEFE0000000000FCFDFD00FDFCFB0000000000FEFE
      FE00FFFFFE000000000000000000000000000000000000000000000000000000
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
      000000000000FFFEFE0000000000FDFDFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00FEFFFF00000000000000000000000000000000000000000014141400FEFF
      FF00FDFDFD00FEFFFF0000000000000000000000000000000000000000000000
      0000FFFFFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FEFFFF00FEFEFE00CCDBDB000000000000000000DEDBDB00FEFEFE00FFFE
      FE00FEFEFE00FCFCFD00FFFFFB00CCDBDB000000000000000000CCDBDB00FBFA
      FB00FFFFFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFB0000000000000000000000000000000000FCFDFF000000
      0000FCFEFE00FFFDFA00FEFEFE00FEFEFE00000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FEFFFF00FEFBF900FDFEFE000000000000000000FEFEFE00FCFBFC00FDFD
      FE00FCFAFA00F5FFFF00CCDBDB0000000000000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFCFA0000000000000000000000000000000000FBFBFD00FBFB
      FA0000000000CCDBDB000000020000000000000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFCFA00000000000000000000000000FEFEFE00FEFEFE00FEFE
      FE00CCDBDB00000000000000000000000000000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFCFA00000000000000000000000000FDFEFF0000000000CCDB
      DB00000000000000000000000000CCDBDB00000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFCFA00FEFFFF000000000000000000FFFFFD00CCDBDB000000
      00000A00000000000000CCDBDB00FEFDFD00000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFCFA00000000000000000000000000CCDBDB00000000000000
      000000000000CCDBDB00F5F8FA00FFFFFE00000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000000000000000
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
      0000CCDBDB00FBFBFE00FAFAF90000000000000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00FEFF
      FF00FEFEFE00FEFBFA00FEFEFE0000000000000000000000020000000000CCDB
      DB00FAFCFF00FEFDFC00F8FAFC00FCFDFD000000000000000000FDFDFC00FBFA
      FA00FFFEFE00FEFEFE00FFFFFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CCDBDB00FDFF
      FF00FDFCFB0000000000FFFFFE0000000000000000000000000000000000FEFF
      FF00FFFFFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFEFE00FEFF
      FF00FDFCFB00FDFCFB00CCDBDB000000000000000000CCDBDB0000000000FDFB
      FB00FEFEFE00FDFEFF00FDFCFB00CCDBDB000000000000000000CCDBDB00FDFC
      FB00FFFEFD00FEFDFD00FFFFFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFE00FEFF
      FF00FDFCFB00000000000000000000000000000000000000000000000000FFFF
      FE00FCFDFE00FEFEFF0000000000000000000000000000000000000000000000
      0000FFFEFF00FDFDFD00FFFFFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD0000000000FEFE
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE000000
      0000FDFEFE00FAFAFA00FAFAFA00FAFAFA00FDFCFB0000000000FEFEFE000000
      0000FEFEFE0000000000FCFDFE00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FEFD
      FC0000000000FEFEFE00FFFFFE00000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009933000099330000993300009933
      0000993300009933000099330000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FDFDFD00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFF00FAFBFB00F9F9
      F900F9FAFA00F9F9FA00FAF9F900FEFDFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000993300007B3E2900984D1B00AA551200B158
      0E00B1580E00AB5711009A4E19007E4027009933000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000EAEAEA00C7C7
      C700EAEAEA00000000000000000000000000FEFEFE00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000993300009933000086432300B65C0C00D1690000D46B0000D36A0000D16A
      0000D1690000D36A0000D46B0000D1690000BB5F0B008D462000993300009933
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000BEBEBE00A5A5
      A500A5A3A300B6B6B600DADADA00F7F7F700000000000000000000000000FEFE
      FE00FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDFEFF0043617E00363636003738
      39003636390040363600E6CFAA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      00007B3E2900A8561300D56C0000D36A0000CB660100CA650100C9640000CB66
      0100CB660100CB660100CB660100CB660000D16A0000D86C0000AC5711009933
      0000993300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000E0E0E000A2A1A100B1B0
      B000AEAEAE00A8A7A7009C9B9B00A5A4A400C6C6C500EAEAEA00000000000000
      000000000000FEFEFE00FEFEFE00000000000000000000000000000000000000
      000000000000000000000000000000000000E7FDFF00042C5300000000000000
      00000000000001000000DEBF8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000993300008342
      2400AE571000D66C0000CD680000CA660100CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100CB660100CB660100CB670000D96D0000AE57
      1000993300009933000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F700A0A0A000717171007878
      7800757474007776760079797900777676006E6D6C007E7D7C00AAAAA900D8D8
      D800F6F6F6000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E9FEFF0012385C00020202000304
      0500020206000F020200E0C29400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C0C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000F0F0F00000000000000
      000000000000000000000000000000000000000000000000000099330000AF59
      0E00D46B0000CC660000CB660100CB660100CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100CB660100CB660100CB660100CA650100D96C
      0000AC5711009933000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE0000000000CCCBCB005D5A5A00565353005655
      5500585555005856550058565500595656005A58570058565500555251005F5D
      5C008B898800BFBEBE00ECECEC00FDFDFD000000000000000000000000000000
      000000000000000000000000000000000000E9FEFF0013395D00040404000405
      06000404070010040400E0C29400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000F0F0F0000000000FCFCFC0000000000000000000000
      000000000000000000000000000000000000CECECE001E1E1E00000000000000
      0000000000000000000000000000000000000000000099330000A2511500D169
      0000CC670000CB660100CB660100CB670200CB660100D27B2500D5843300D584
      3400D5843400D5843400D0741900CB660100CB660100CB660100CB660100CB66
      0100D66B00008D46200099330000000000000000000000000000000000000000
      000000000000FEFEFE0000000000ECECEC0089868600545353006C6C6C00514F
      4F00585655005452510056545300595756005A58570059575600585656005554
      530053504F00514D4C0097959300FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000E7FDFF0000274E00000000000000
      00000000000000000000DDBD8B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000F0F0F0000000000FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000BE600800D26A
      0200CD6A0700CE6B0800CE6E0B00CC670200CE6B0700EFD2B500FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00F9F0E600DFA36600CB660100CB660100CA66
      0100D2690000BA5E090099330000000000000000000000000000000000000000
      000000000000FEFEFE00FCFCFC00B7B6B6005C5A5A005D5C5C00555353005452
      5200616161005553530054525200545252005451500056535200595756005856
      56005B5858005C585700DCDBDB00000000000000000000000000000000000000
      000000000000000000000000000000000000F1FEFF0071879D00686868006869
      690068686A006F676800ECDABE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000F0F0F0000000000FCFCFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000A7541400CF6E0900D272
      1000D2761500D3771900D4791B00D2721000D4761800EBC29800F5E1CE00F4E1
      CD00F4E0CC00F4E0CB00F8ECE000FEFEFE00FEFEFE00EBC59F00CB660100CB66
      0100CB660100D36A00007F3F2700993300000000000000000000000000000000
      0000FEFEFE0000000000DBDBDB00777575005250500063626200555353005C5B
      5B0052515100504E4D005B5A5A00585656005856550059575600514E4D005754
      530055515000ACABAA0000000000FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000F0F0F0000000000FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000B75F1300D87A1700D57C
      2000D77F2400D8812800D9832A00D77C2000D9802700D77E2300D67A1D00D376
      1600CF6E0D00CC690400CB660100D78A3D00FAF3EC00FEFEFE00D9914800CB66
      0100CB660100D46B00009A4F1A00993300000000000000000000000000000000
      0000FEFEFE00F4F4F400A3A2A200555354006C6B6B0054535300555353005B5A
      5A00535251005C5B5B0059585700504D4C005554530056545400585655005C5B
      5A0073717000F8F8F800FDFDFD00FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000FDFEFE0044668300131414001617
      170013131400281C1300F9E1C200FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000F0F0F000000
      0000FCFCFC000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000C26B1800DE852900DC86
      3000DC873200DD8A3600DE8C3900DD872E00DE893500DC863000DA832A00D77D
      2200D3771900D1700E00CC690500CB660100DFA36600FEFEFE00EBC59F00CB66
      0100CB660100D36A0000AA55120099330000000000000000000000000000FEFE
      FE0000000000C9C8C8006F6D6E00555454005D5C5C0055545400636262005857
      57005452510058575600514F4F005A5959005C5B5B00504D4C00585756005552
      5100DADAD90000000000FDFDFD00000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFF0036597B00000000000000
      00000000000001000000BE9B7200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000909
      0900000000006565650000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000CA762300E3964600E199
      4D00E1914200E2934400E3954700E3954600E2924200E08F3C00FEFEFE00DB85
      2D00D77D2300D4771900CF6F0D00CB680300D6883A00FEFEFE00F0D3B700CB66
      0100CA650100D2690000B1580E00993300000000000000000000FEFEFE000000
      0000E7E7E7009492920053515100676767005857570059585800595858005150
      50005C5A5A005A585800565454005A595800504D4C005A5857005B595800A4A3
      A20000000000FDFDFD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008AAACF00000001000505
      020002020200010201001E0B0400BFA98C0000000000FCFCFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000F0F0F00ABABAB0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000CF7D2F00E9A96600EAAE
      7200E79F5500E79E5300E9A05600E8A05500E79D5100FEFEFE00FEFEFE00DF8E
      3B00DB852E00D67D2400D3751600CE6B0800E2AA7200FEFEFE00EAC19900CB66
      0100CA650100D2690000B1580E00993300000000000000000000FEFEFE00FDFD
      FD00B7B6B60068676700636363005A595900545151005F5E5E00575555005C5A
      5A005D5C5C00504E4D005A5858005A595900565555005B5A5A006C6A6900F6F6
      F600FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900F2FDFD003E5E87000000
      0000020200000101020000000100050000009A755C00FFFFF500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000F0F
      0F00F0F0F0000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000CF7E2F00EDB37900F0C3
      9500ECAE6D00ECA76000EDAA6400EDA96300FEFEFE00FEFEFE00FEFEFE00E499
      4E00DE8B3600DA832A00D67A1D00E09F5D00FCF7F200FDFCFB00D6863700CB66
      0100CB660100D36A0000AA5512009933000000000000FDFDFD0000000000D7D7
      D6008A8788005856550061605F0056555400605F5E005D5C5C0056555500605F
      5F00585656005C5A5A0063626200524F4F005B5959005A575600D4D3D3000000
      0000FDFDFD00000000000000000000000000000000000000000000000000FFFE
      FF00000000000000000000000000000000000000000000000000F4FFFF005178
      960000000000010000000201010000020300000000007E574000FFFBEE00FCFD
      FD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000F0F0F00F0F0
      F000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000CB762500EFB67D00F5D3
      B000F3C29000F1B16F00F8D8B800FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00E5B38100CB660100CB66
      0100CB660100D46B0000984D1C0099330000FEFEFE00FEFEFE00F5F5F500A6A4
      A500676466005B5858005C5A5A005B595800656669005B5A5A005B5956005F5E
      5C005755540062606000545251005A5858005A5958009B99980000000000FDFD
      FD0000000000000000000000000000000000000000000000000000000000FEFF
      FE00FAFDFF00E7E8EB00E6E5E400DFE6E600758A9C008F717100FFF3E3000000
      00008EA8BC00010A250000000000010001000305040000000000A8805500FFFF
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000F0F0F00F0F0F0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000D6820000ECAE7000F7D8
      B900FADBBB00F6C18D00FADEC000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFDFB00F5E1CD00DD9A5600CB670100CB660100CB66
      0100CC660000D16900007C3F280099330000FCFCFC0000000000BFBFBE008987
      870081847F006D6D6B005D5B5B0057545400848796009CA3B800898E9D006C6D
      74005E5C5C005F5E5D005B5959006261610067646300F3F3F300FEFEFE00FEFE
      FE0000000000000000000000000000000000000000000000000000000000FFFE
      FD00E6FBFF001426540005050500050607000000000005000000F5D7B200F9FA
      FC000000000098BDDD0000011800010100000202020001020200361B0700FEF2
      DA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000F0F0F00F0F0F000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6820000DF954C00F8D1
      AA00FBEAD700FADBBB00FCCC9800FBC38800FEFEFE00FEFEFE00FEFEFE00E9A6
      5F00E3954600DE8C3800D9822A00D4781B00CE6D0A00CB670200CB660100CA66
      0100D36A0000B85D0A00993300000000000000000000DCDDDD0075737400929A
      9000B4C6AF009FAA9800929B8D007D827A0068696500676668007D7E8A008B8F
      9F00615F5F00585553005C5A580058555400CCCBCB0000000000FDFDFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000365C8300000000000102020006050500010405008A6C4A00FFFF
      FE0000000000B3D3F0000001180001000000010101000000000021150200FAE2
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000F0F0F00F0F0F00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6820000D6820000F3C0
      8B00FCE5CD00FDEFE000FEDFBE00FCCA9300F7C18800FEFEFE00FEFEFE00E9A2
      5A00E2954600DE8C3800D9822A00D4781B00CE6D0B00CB670200CB660100CC66
      0000D66B000087442300993300000000000000000000C9C9CA00848485008693
      86009DB09B009CAB96009EAE97009AA8920095A28F00838C7D0072776D006262
      5D005A5857005C585800595654009392910000000000FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008AB0D4000000030004040300000000000000000000000000564A
      3C0061616100162133000000000001010100020100000101020045250D00FEF6
      E200000000000000000000000000000000000000000000000000000000000000
      000000000000000000000F0F0F00000000000000000000000000000000000000
      000000000000000000000000000000000000CECECE000B0B0B00000000000000
      0000000000000000000000000000000000000000000000000000D6820000DA8D
      4200FAD2A800FDEDDD00FEF2E600FBDDBE00F8CA9D00F0B06E00FEFEFE00E79E
      5300E2934300DD8A3600D8812800D3771900CE6C0900CB660200CC670000D86C
      0000A452140099330000000000000000000000000000DADADA005D5C5C003D39
      3B00414140005B615B007C877C00909F8E0098A8940097A7920095A491008A96
      850080897C006E726A0057555400EEEEEE0000000000FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E8F9FF0018375A00000000000405050001020200000000000000
      0000000000000000000001010100020202000204050000000000B99166000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000F0F0F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000005050500000000000000
      0000000000000000000000000000000000000000000000000000D6820000D682
      0000DD944C00F9D3AC00FCEBD900FEF2E600FAE5CF00F6D4B000F0B98300E8A4
      5D00E2994C00DE8F3E00DA893600D7842F00D27C2400D1721100D86C0000A652
      14006A3531009933000000000000000000000000000000000000F1F1F000CACA
      CA008C8A8A00494444002722230031302F004E534E00707B7100859385008B9A
      890092A18E0074807400BEBDBD0000000000FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFEFC00C1D9F2000F1D3D000000000000000000040302000707
      0600070707000505060000000000000000000000000081674600FFF9F100FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D682
      0000D6820000DA8F4600F5C69600FBDFC200FBEBDB00FBEBDB00F8E2CC00F2D4
      B500EFC89F00EBBD8E00E8B58200E3A66800DE8F3E00D6761600A75313006F39
      2D00993300000000000000000000000000000000000000000000000000000000
      000000000000F7F7F700D4D4D40099969600534F5000262122002E2C2C005054
      5000687269007F807E0000000000FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D5E1F30057687700212A3000000000000000
      00000000000000000000120A00003F383200B3A28D00FFFFF800FDFFFF00FEFE
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6820000D6820000D6820000E09E5D00F0C08E00F5D1AA00F7D8B900F6D8
      BA00F4D2AF00EFC59900E9B17700DC944A00C06E2400974E2000993300009933
      0000000000000000000000000000000000000000000000000000FEFEFE00FDFD
      FD00FDFDFD00000000000000000000000000FCFCFC00DEDEDE00A8A7A700635F
      6000413D3E00E9E9E90000000000FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0FBFF00B3B5B900B3B3
      B300B4B4B400B3B3B300DFD4C7000000000000000000FCFDFF00FEFEFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6820000D6820000D6820000C9803B00D28F5100D595
      5800D1905300C9824400B56C31009C5526008845250099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFDFD00FDFDFD000000000000000000000000000000
      0000F2F2F2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFDFE00FCFCFB00FFFFFD0000000000000000000000
      00000000000000000000FCFCFC00FCFBFB00FFFEFE0000000000FFFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000D6820000D6820000D682
      0000D6820000D6820000D6820000D68200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC00FBFBFB000000
      000000000000FEFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000FDFEFE00F8F9
      F900F8F8F800F9F9F900F8F8F800FCFBFA0000000000FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FDFDFD00FCFCFC00FCFCFC00FDFDFD00FEFEFE00000000000000
      000000000000000000000000000000000000000000000000000000000000FFF9
      F500FFF9F5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009933000099330000993300009933
      0000993300009933000099330000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC00F4F4F400F2F2
      F200EFEFEF00ECECEC00ECECEC00ECECEC00EDEDED00EEEEEE00F0F0F000F9F9
      F900FCFCFC00000000000000000000000000F9F3EE0000000000F7F0EC00CAC5
      C300A4A19F00DBD5D300F9F3EE0000000000F9F3EE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000993300007B3E2900984D1B00AA551200B158
      0E00B1580E00AB5711009A4E19007E4027009933000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBFBFB00F1F1F100ECECEC00E8E8E80023ABCA0025AB
      C8005DB8CD00D0D1D200D1D1D100D1D1D100D3D3D300D6D6D600D9D9D900E1E1
      E100E6E6E600EAEAEA00F4F4F400FBFBFB000000000000000000DBD5D300A5A3
      A200898787009C9A9800E5E0DC00F9F3EE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000993300009933000086432300B65C0C00D1690000D46B0000D36A0000D16A
      0000D1690000D36A0000D46B0000D1690000BB5F0B008D462000993300009933
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFCFC00F7F7F700ECECEC00E7E7E700C0D8DD005CCBDF0051BF
      D70049C5DC0008A2C30052AFC400A6BEC300C8C8C800CCCCCC00D0D0D000DADA
      DA00DFDFDF00E4E4E400EFEFEF00F4F4F400F9F3EE0000000000DBD5D300D3CE
      CC00A5A3A2008C8A8A00B0ACAB00F2EAE5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      00007B3E2900A8561300D56C0000D36A0000CB660100CA650100C9640000CB66
      0100CB660100CB660100CB660100CB660000D16A0000D86C0000AC5711009933
      0000993300000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004B000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBFBFB00F5F5F500EAEAEA00E4E5E50026ABCA0075CFE10044CC
      E00061D1E40078D8E70057C9DD0004A0C500A2BCC200C7C7C700CCCCCC00D7D7
      D700DDDDDD00E2E2E200EDEDED00F3F3F3000000000000000000EFE9E500D3CE
      CC00CAC5C3009C9A98008C8A8A00C5C1BF00F7F0EC0000000000F9F3EE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000993300008342
      2400AE571000D66C0000CD680000CA660100CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100CB660100CB660100CB670000D96D0000AE57
      1000993300009933000000000000000000000000000000000000000000000000
      0000000000000000000000000000004B0000118C1F00004B0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FAFAFA00EFF0F0001AAACA0057D1E30007BED70028BC
      D60007B1D10048CFE30002A4C60047D1E30013A9CB002BB7D20012A7C700DFDF
      DF00E4E4E400E9E9E900F3F3F300F8F8F80000000000F9F3EE00FFF9F500E4DE
      DA00CAC5C300BCBABA008C8A8A00908E8E00DBD5D300F9F3EE0000000000F9F3
      EE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099330000AF59
      0E00D46B0000CC660000CB660100CB660100CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100CB660100CB660100CB660100CA650100D96C
      0000AC5711009933000000000000000000000000000000000000000000000000
      00000000000000000000004B0000138F230007931000169C2800004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B3DFE90021B2CE0064D5E60019C8E10009AA
      CC001ACDE70013ADCD001CC0DA0042C8DD001CC4DB0089E2EE006CD5E50066C0
      D300ECECEC00F0F0F000F9F9F900FEFEFE000000000000000000F9F3EE00FFF9
      F500DBD5D300CAC5C300B4B0AF0084838300A5A3A200EDE6E200F9F3EE00F7F0
      EC00F9F3EE00F9F3EE00F9F3EE00F9F3EE000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000A2511500D169
      0000CC670000CB660100CB660100CB670200CB660100CB660100D0741800D584
      3400D5843400D5843400D5843400D27B2500CB660100CB660100CB660100CB66
      0100D66B00008D46200099330000000000000000000000000000000000000000
      000000000000004B0000159127000FA01D000B99160008961100159A2700004B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000054C1D80040C7DC0038C8DD0013C1DC0012BD
      DB0035DBF00007ABCD0042D1E5000CA7CA0033CDE00050D4E4003CC0D90030B4
      D1006FC8DB00F9FAFA000000000000000000000000000000000000000000F9F3
      EE00FFF9F500DBD5D300CAC5C300A5A3A20084838300C4BEBC0000000000FFFD
      F800FFF9F500FFF9F500FFF9F500FFF9F5000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000BE600800D26A
      0200CD6A0700CE6B0800CE6E0B00CC670200E1A66A00F9F0E700FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00EFD1B400CB660100CB660100CB660100CA66
      0100D2690000BA5E090099330000000000000000000000000000000000000000
      0000004B00000F811C001AAF310014A727000FA11F000C9A1800089612001399
      2500004B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001AADCB006FDDEB0015C7E2001BC3E00036E3
      FA0021C7E20031C9E20008B4D20013C4DC0007ACCC0031C1D80097E4EF001FAD
      CC00ACE0EC000000000000000000000000000000000000000000000000000000
      0000F9F3EE00FFF9F500D3CECC00CABEBC008C8A8A008A888600C5C1BF00B9B5
      B300A19D9C00969392009C9A9800C4BEBC00EDE6E200F9F3EE00000000000000
      000000000000000000000000000000000000D6820000A7541400CF6E0900D272
      1000D2761500D3771900D4791B00EDC9A400FEFEFE00FEFEFE00F9EDE200F4E1
      CD00F4E0CC00F4E0CB00F4E0CB00E8BC9000CB660100CB660100CB660100CB66
      0100CB660100D36A00007F3F270099330000000000000000000000000000004B
      00000E7D1A0028C0480021B83D001BB0330013902400004B0000169D29000997
      130013982300004B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000002DB9D30061DCED0023D4ED002FD4EE003CDF
      F70014B7D70016BBD80013C9DF0030C8DD003BC8DD009AE4EE0048BED600F6FC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D9CFCE00B9B5B3006F6F6F007B7878009693
      9200AAA5A200AAA5A20094918E007776750084838300D3CECC00F7F0EC000000
      0000F9F3EE00000000000000000000000000D6820000B75F1300D87A1700D57C
      2000D77F2400D8812800E3A66600FEFEFE00FBF5EF00E09C5700D67A1D00D376
      1600CF6E0D00CC690400CB660100CB660100CB660100CB660100CB660100CB66
      0100CB660100D46B00009A4F1A00993300000000000000000000004B00000C77
      170035CF5E002FC9540028C149001B9F3100004B000000000000004B00000D9E
      1B000997140011972200004B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003BC4DC005AE0F10031E0F80048E2F80030CB
      E7002DD1EC001ACBE40028C8DF0003B3D00091E0EC002EB2D000A3DDEA000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F9F3EE0000000000F9F3EE00AAA8A800B0ACAB00DCD3CC00F7F0
      EC0000000000FFF9F500F9F3EE00E2D9D4009A9795007B787800D3CECC00F9F3
      EE0000000000F9F3EE000000000000000000D6820000C26B1800DE852900DC86
      3000DC873200DD8A3600F2D3B400FEFEFE00EBB88500DC863000DA832A00D77D
      2200D3771900D1700E00CC690500CB660100CB660100CB660100CB660100CB66
      0100CB660100D36A0000AA551200993300000000000000000000004B00003FD9
      6F003BD7680036D0600020AA3B00004B0000000000000000000000000000004B
      0000097411000A99150011962000004B00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DADAE9004DCFE50065EAFC004EE6FC0053DBF0004EE3
      F70033DBF40014C6DE0050D3E40074D5E600D7F0F60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFF9F500CFCAC800AAA5A200EADDD200F8EEE300F8EE
      E300F9F3EE00F7F0EC00F9F3EE00FAEFE900F5E3DF009C9897008A888600E4DE
      DA000000000000000000F9F3EE0000000000D6820000CA762300E3964600E199
      4D00E1914200E2934400F6E0CA00FEFEFE00E8AA6C00E08F3C00DE8B3500DB85
      2D00D77D2300D4771900FEFEFE00CB680300CB660100CB660100CB660100CB66
      0100CA650100D2690000B1580E00993300000000000000000000004B00001C9C
      340041DC700023AD4100004B0000000000000000000000000000000000000000
      000000000000004B00000B99160010951F00004B000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5D3000A0B74000D5AA0008EE8F80089EFFE0064E5F90050E6
      FC0035E3F90063DBEA005CCDDE0025AFCD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F2EAE500AAA5A200D9CEC400F9E9DB00F5E9DC00F8EE
      E300F2EAE500F8EEE300F8EEE300F2EAE500F7E6E200E6D4D10081807F00B9B5
      B300F9F3EE00000000000000000000000000D6820000CF7D2F00E9A96600EAAE
      7200E79F5500E79E5300F6D8BB00FEFEFE00F1C89E00E5984B00E2934300DF8D
      3900DB852E00D67F2700FEFEFE00FEFEFE00CC660100CB660100CB660100CB66
      0100CA650100D2690000B1580E0099330000000000000000000000000000004B
      00002EC15200004B000000000000000000000000000000000000000000000000
      00000000000000000000004B00000C9A180009961200004B0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001F1F80000000AA0002088900020E75004E92C1007AEEFD0048E7
      FD004DE4F70044C1D90037B7D200EFF9FB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F3EE00FFF9F500D3CECC00ABA29B00F4DECA00F6E4D200F9E9DB00F9E9
      DB00F9E9DB00F9E9DB00F9E9DB00F9E9DB00F5E9DC00F9E2DA00AAA5A2009693
      9200F2EAE500000000000000000000000000D6820000CF7E2F00EDB37900F0C3
      9500ECAE6D00ECA76000F1BC8500FEFDFC00FDFAF700F0BF8E00E69A4F00E293
      4300DE8B3600DC8A3600FEFEFE00FEFEFE00FEFEFE00CB660100CB660100CB66
      0100CB660100D36A0000AA551200993300000000000000000000000000000000
      0000004B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004B00000464080009961300004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000005A2C50022A3C600174193001011AE003333E3004B4BF40003087200053F
      90002EB1CF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F3EE00FFF9F500BCBABA00B7AA9E00F4DECA00F6E4D200F9E9DB00FBE8
      D600FBE8D600FBE8D600FBE8D600F9E9DB00F5E9DC00F9E2DA00CABEBC00908E
      8E00EAE3DF00000000000000000000000000D6820000CB762500EFB67D00F5D3
      B000F3C29000F1B16F00F1B27100F8D8B800FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00E5B28000CB66
      0100CB660100D46B0000984D1C00993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B000007740E00004B
      0000000000000000000000000000000000000000000000000000000000000000
      000002A1C4002CBFD7005DDCED0011248400101688004545DF002B2BD2000E0E
      7B00BCBCD8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F3EE00FFF9F500B4B0AF00B5A59600F9DDC300FBE6D300FBE8D600FBE6
      D300FBE6D300FBE6D300FBE8D600F9E9DB00F9E9DB00F9E2DA00D1BCB600908E
      8E00EAE3DF00000000000000000000000000D6820000D6820000ECAE7000F7D8
      B900FADBBB00F6C18D00F6BD8100F7BC7F00F7CCA200FBEDDF00FEFDFC00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00E5B28000CB66
      0100CC660000D16900007C3F2800993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B0000035E
      0600004B00000000000000000000000000000000000000000000000000000000
      0000DBF2F600179FC20010A5C8008EEFFC005193C4000D1379001A1AB2000D0D
      7400EEEEF5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F3EE00FFF9F500C5C1BF00A4968A00F4D6BA00FADCBE00F9DDC300F9DD
      C300F9DDC300FBE0C700FCE4CC00FCE4CC00F7E3CE00FADDCC00CEBBB4009C9A
      9800F2EAE50000000000000000000000000000000000D6820000DF954C00F8D1
      AA00FBEAD700FADBBB00FCCC9800FBC38800F7C08700F2B17000EDA96400E8A0
      5500E3954600E0934400FEFEFE00FEFEFE00FEFEFE00CB670200CB660100CA66
      0100D36A0000B85D0A0099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004B0000004B000000000000000000000000000000000000000000000000
      0000106396004292C2002E89C100188FBD00059FC30047C5DC00E0F3F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DCD8D600928B8300E3C2A200FCE4CC00F9DDC300FADC
      BE00FADCBE00FADCBE00F9DDC300F9DDC300F7E3CE00FADDCC00BAAEA800AAA8
      A8000000000000000000000000000000000000000000D6820000D6820000F3C0
      8B00FCE5CD00FDEFE000FEDFBE00FCCA9300F7C18800F2B37200EDA96400E8A0
      5600E2954600DF8F3D00FEFEFE00FEFEFE00CE6D0B00CB670200CB660100CC66
      0000D66B00008744230099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B000000000000000000000000000000000000FDFE
      FE003E8CBB005DA7D500107CBF002378AE005192B70070CBDE00FCFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F3EE0000000000F6EEEA00ACA8A600B1967B00FCE4CC00FBE6D300FCE4
      CC00FCE4CC00FCE4CC00FCE4CC00FBE6D300FBE6D300EDD2BB009C989700D3CE
      CC00FFF9F500F9F3EE00F9F3EE00000000000000000000000000D6820000DA8D
      4200FAD2A800FDEDDD00FEF2E600FBDDBE00F8CA9D00F0B06E00ECA76000E79E
      5300E2934300DD8A3600FEFEFE00D3771900CE6C0900CB660200CC670000D86C
      0000A45214009933000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000085B0
      CA008DC1E1002186C5001982C30011649800CEDFE90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DBD5D3009D918700C6AA9100FCE4CC00FFE8
      CE00FCE4CC00FCE4CC00FCE4CC00FBE6D300EDD2BB00B3A8A000B4B1B000F9F3
      EE0000000000F9F3EE0000000000000000000000000000000000D6820000D682
      0000DD944C00F9D3AC00FCEBD900FEF2E600FAE5CF00F6D4B000F0B98300E8A4
      5D00E2994C00DE8F3E00DA893600D7842F00D27C2400D1721100D86C0000A652
      14006A3531009933000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004787B0005FA0
      C70019689A0012689E0097C6E300B1CCDC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F0EC00CCC9C7009D918700B7A08C00DBC2
      A900EDD2BB00F4D6BA00EACEB300D2B8A100ABA29B00B4B1B000F2EAE5000000
      0000F9F3EE00000000000000000000000000000000000000000000000000D682
      0000D6820000DA8F4600F5C69600FBDFC200FBEBDB00FBEBDB00F8E2CC00F2D4
      B500EFC89F00EBBD8E00E8B58200E3A66800DE8F3E00D6761600A75313006F39
      2D00993300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000E6296007AB0
      D100ECEEEE0019689A006BA7CD00FDFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F0EC00D3CECC00AAA5A2009D91
      8700A2918200A2918200A4968A00AAA5A200CAC5C300F6EEEA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6820000D6820000D6820000E09E5D00F0C08E00F5D1AA00F7D8B900F6D8
      BA00F4D2AF00EFC59900E9B17700DC944A00C06E2400974E2000993300009933
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001E6D9E0093C1
      DE00126497002F79A7003580AD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F9F3EE00F9F3EE0000000000F6EEEA00E4DE
      DA00D3CECC00D3CECC00DCD8D600F2EAE500FFF9F50000000000F9F3EE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6820000D6820000D6820000C9803B00D28F5100D595
      5800D1905300C9824400B56C31009C5526008845250099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F8FAFC005B94
      B80017679A005F97BA00EAF1F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6EEEA00F6EEEA00F6EEEA00F6EE
      EA00F6EEEA00F6EEEA00F6EEEA00F6EEEA00F6EEEA00F6EEEA00F9F3EE00FFF9
      F500FFFDF800FFFDF800FFF9F500F9F3EE00F6EEEA00F6EEEA00F6EEEA00F6EE
      EA00F6EEEA00F6EEEA00F6EEEA00F6EEEA000000000000000000000000000000
      000000000000000000000000000000000000D6820000D6820000D6820000D682
      0000D6820000D6820000D6820000D68200000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000092635D008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      590080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093655E00EFD3
      B400F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB9700EFC79100EEC58900EBC1
      8200EBC08000EBC08000EBC08000EBC08000EBC08000EBC08000EDC18000EABF
      7F0080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093655F00EED4
      B800F4DABB00F2D5B100F0D1AA00EFCFA300EECB9D00EDC79600EDC58F00EBC1
      8800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093655F00EED7
      C000F6E0C100F2D9B800F2D4B100F0D1AA00EFCFA400EECB9D00EDC79600EDC5
      8F00EBC18900EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000099CC000099CC00AB72
      6600B6716200AD746700AD746700AD746700AD746700AB726600AB726600AB72
      6600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000081BD000081BD000081
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093655F00EFDA
      C500F7E2C700F3DCBF00F2D8B70000700000F0D1AA00EFCEA300B1B874000070
      00000070000000700000ADAD6000E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      000000000000000000000099CC000099CC000099CC0000B3E6000099CC00AB72
      6600FFDCBC00FFE4C200FFDEB900FFDAB200FFD7AA00FED3AA00FED1A400986B
      6600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000081BD000081BD000081BD00009FDE000081BD0000AC
      EB000081BD000081BD000081BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B0000004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093656000F0DE
      CC00F8E6CF00F6E0C600F3DCBD000070000004750300B2BD7F0000700000B1B8
      7400EDC79600B0B46B0000700000ADAF6200E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      00000099CC000099CC0031D2F50020D6FF0008D1FF0000C1F5000099CC00AB72
      6600F5D0BB00B0827F00B0827F00B0827F00B0827F00B0827F00FED7AE00986B
      6600000000000000000000000000000000000000000000000000000000000000
      00000081BD000081BD001CC5F20010CAFF0003C4FF0000B0F2000081BD0000C5
      FF0000BFFF0000BBFC0000AAEA000081BD000081BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004B00000E9D1D000E9D1D00004B
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000095666000F2E2
      D300FAEAD700F6E3CE00F4DEC500007000000070000000700000B2BD7F00EFCE
      A300EECB9D00EDC79700B0B46B0000700000E9BD8100E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      00000099CC0083F9FF007DFCFF000C8518002CC2BC0021D1FF000099CC000C85
      1800FFE4DE00FFECD900FFE8D300FEE5CC00FEE3C600FEDFC000FEDCBA00986B
      6600000000000000000000000000000000000000000000000000000000000000
      00000081BD0069F7FF004FEDFF0033DDFE001CD4FF0009B6EF000081BD0000C2
      FF0000BDFF0000BDFF0000C1FF0000B5F4000082C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004B00001CB1350011A422000E9D1D0011A4
      2200004B00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000098696300F2E6
      DA00FAEEDE00F7E7D400F6E2CB0000700000007000000070000000700000F0D1
      A900EFCEA300EECB9D00EDC7960000700000EBC18900E9BD8100EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      00000099CC0097FDFD00A3FFFF000C8518000C85180045DCFB000099CC000C85
      18000C851800B0827F00B0827F00B0827F00B0827F00B0827F00FEE3C600986B
      6600000000000000000000000000000000000000000000000000000000000000
      00000081BD007FFCFC0079FCFF0060F2FE0047EAFF0025C9F0000081BD0000C9
      FF0000C6FF0000C6FF0000C7FF0000BAFF000381BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B00002EC6520024BC430013922400004B00000D93
      1A000E9D1D00004B000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009E6E6400F4EA
      E100FBF2E600F8EADC00F7E6D300007000000070000000700000007000000070
      0000F0D1AA00EFCEA400EDCB9C00EDC79600EBC58F00EBC18800EABF8200E7BB
      7E0080504B000000000000000000000000000000000000000000000000000000
      00000099CC009DFFFF009FFEFE000C85180044CC63000C8518000C8518000C85
      18000EA020000C851800FEF5EA00FFF1E500FEEFDF00FEECD900FEE9D300986B
      6600000000000000000000000000000000000000000000000000000000000000
      00000081BD0086FFFF008AFFFF0082FEFF0068EFF80029BBDE000081BD009657
      4B0096574B0096574B0096574B0096574B0096574B0096574B0096574B009657
      4B00000000000000000000000000000000000000000000000000000000000000
      000000000000004B000035CA5E0039D465001CA13400004B000000000000004B
      00000A8615000E9D1D00004B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A3726600F6EE
      E900FCF6ED00F8EFE300F7EADA00F7E6D300F6E2CC00F4DEC500F3DCBD00F2D8
      B600F0D5B000F0D1AA00EFCEA300EECA9C00EDC79500EBC48E00EBC28800E7BC
      800080504B000000000000000000000000000000000000000000000000000000
      00000099CC0064DCEC0020AFD7000FA6DB000C85180044CC630044CC630030C1
      4B000EA425000EA020000C851800B0827F00B0827F00B0827F00FFEFDF00986B
      6600000000000000000000000000000000000000000000000000000000000000
      00000081BD0049D1E60030B7D8001198CA000189C500008BC9000081BD009657
      4B00FED9B600FFD5AF00FED1A700FECFA100FECA9900FEC69500FEC48E008050
      4B00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B000029B54800004B000000000000000000000000
      000000000000004B00000D931A00004B00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A7756800F8F3
      F000FEFBF600FBF3EB00F8EEE300F8EBDC00F7E7D300F6E2CC00F4E0C5000070
      000000700000007000000070000000700000EDCB9C00EDC79500EDC58F00E9BF
      870080504B000000000000000000000000000000000000000000000000000000
      00000099CC0007A4D4001CC4EE000FCEFE0000CCFF000C8518000C8518000C85
      18000EA020000C851800FAF7F700F9F4F100F9F3EE00EBE3DC00DBD7CC00986B
      6600000000000000000000000000000000000000000000000000000000000000
      00000081BD00028EC700049FD90001ABEA0000B7FB00046B0B000081BD009657
      4B00FFE2C6009C6865009C6865009C6865009C6865009C686500FECB99008050
      4B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004B00000000000000000000000000000000
      00000000000000000000004B00000A861500004B000000000000000000000000
      0000000000000000000000000000000000000000000000000000AC796900FAF6
      F400FFFFFE00FEF8F300FBF2EA0000700000F8EBDA00F7E6D300F7E2CC00F6E0
      C50000700000007000000070000000700000EFCEA300EECB9C00EEC99600EAC1
      8E0080504B000000000000000000000000000000000000000000000000000000
      00000099CC0065ECFD0059ECFF003DE0FF0021D8FF0009C9FF00019198000C85
      18000C851800FFFFFF00FFFFFF00FFFFFF00FFFFFF00AB726600AB726600AB72
      6600000000000000000000000000000000000000000000000000000000000000
      00000081BD004AE6FC0035E2FF001ED9FF00046B0B00046B0B000081BD009C5C
      4F00FFEAD500FFE6CE00FFE1C600FEDDBD00FEDAB600FED5AF00FED1A7008050
      4B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004B0000004B0000000000000000
      0000000000000000000000000000000000000000000000000000B17E6B00FAF6
      F400FFFFFF00FFFEFB00FEF7F00000700000BAD4AA00F8EADA00F7E7D300F6E2
      CB00B7C79200007000000070000000700000F0D1A900EFCEA100EECB9C00EBC5
      920080504B000000000000000000000000000000000000000000000000000000
      00000099CC008DFAFD0087FAFF006BF0FE0050E8FF002DCFF3000099CC000C85
      1800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AB726600F6BC73000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000081BD0074F8FC0065F6FF00046B0B001DA93500046B0B00046B0B00A465
      5300FEF0E3009C6865009C6865009C6865009C6865009C686500FEDAB6008050
      4B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B0000004B00000000
      0000000000000000000000000000000000000000000000000000B6816C00FAF6
      F400FFFFFF00FFFFFF00FFFCFB00BCDAB40000700000B8D3AA00F8EBDC00B7CC
      9D0000700000B7C792000475030000700000F2D4AF00F0D1A900F0CFA300EDC9
      990080504B000000000000000000000000000000000000000000000000000000
      00000099CC009AFEFE00A2FFFF0099FFFF007EF7FF004CD7F0000099CC00E4B6
      8F00DCA88700DCA88700DCA88700DCA88700DCA88700AB726600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000081BD0082FEFE00046B0B0030C056002CBD48001EAF360002804100046B
      0B00FFF8F000FFF4EB00FEF2E300FFEDDD00FEEAD500FEE6CE00FEE2C6008050
      4B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BB846E00FAF6
      F400FFFFFF00FFFFFF00FFFFFF00FFFEFB00BCDAB40000700000007000000070
      0000B7CC9D00F6E2CB00F6DEC40000700000F2D8B600F0D4AF00EFD0A700CEB4
      910080504B000000000000000000000000000000000000000000000000000000
      00000099CC009AFFFF0075E5F20051CEE5002EB8DB0022B0D80016ABD80021A4
      CA004E9BAF004CA7BA004AB1C50044A9C2007692970000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000081BD0082FFFF0068E5D400046B0B002EC24F00046B0B00046B0B00046B
      0B00046B0B009C6865009C6865009C6865009C6865009C686500FFEAD5008050
      4B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0896F00FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2EA00FAEE
      E200F8EBDA00F7E6D300F6E2CB00F6DEC400F3DCBD00E5CEAF00C4B09600A192
      7F0080504B000000000000000000000000000000000000000000000000000000
      00000099CC0023B1D70014A7D6002DB5D90070E2F00088F5FA0066EEFD0025D0
      F70000BBF00000BBF00000A4DB0000A0D8000D98C70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000081BD00129DCB000991CA0019A1CE00046B0B00046B0B002AB48F00298A
      4200046B0B009CC59E00FFFEFC00FFFBF600FFF8F000E5DAD100D0CBBD008050
      4B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C58C7000FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FCF8F200FBF3
      EA00F8EEE200F8EAD900F8E7D400FAE9D000E0D0BA00B8AB9A00A79C8B00A497
      860080504B000000000000000000000000000000000000000000000000000000
      0000000000000099CC000099CC000099CC000099CC0034BCDD002ABBE0000CAA
      D900009CCF00009BCE000098CB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000081BD000081BD000081BD000081BD00046B0B0018BBE500CC92
      6C00046B0B008AC59200FFFFFF00FFFFFF00FFFCFB0096574B0096574B009657
      4B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CB917300FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FCF7
      F000FBF2E900FBF2E500E9D3C400A0675B00A0675B00A0675B00A0675B00A067
      5B00A0675B000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000099CC000099CC000099
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000081BD000081BD00D79D
      7200C0E0B800AFDCBB00FFFFFF00FFFFFF00FFFFFF0096574B00F3AA58000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CF967400FBF7
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFC
      FA00FCF7F000FFFAEF00DAC0B600A0675B00DAA16B00DD984F00E2903A00EA89
      2300A5686B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DCA3
      7600D1926D00D1926D00D1926D00D1926D00D1926D0096574B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCFB00FFFEF700DDC4BC00A0675B00EAB47400EFA95200F6A03600A568
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DDC7C200A0675B00EAB27300EFA75100A5686B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987500FFFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E2D0CE00A0675B00EDB57200A5686B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800A0675B00A5686B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008B8B8B008A8A8A009494
      94008989890087878700939393008B8B8B0086868600939393008C8C8C008686
      8600939393008C8C8C0085858500929292008D8D8D0086868600919191008F8F
      8F0085858500939393009F9F9F0054545400000000008B8B8B008A8A8A009494
      94008989890087878700939393008B8B8B0086868600939393008C8C8C008686
      8600939393008C8C8C0085858500929292008D8D8D0086868600919191008F8F
      8F0085858500939393009F9F9F00545454000000000000000000000000000000
      0000000000000000000000000000000000000450070004500700045007000450
      0700045007000450070004500700045007000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000136020001360200013602000136
      0200013602000136020001360200013602000000000000000000000000000000
      00000000000000000000000000000000000094949400F8F8F800F8F8F800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F6F6F600FCFCFC008888880094949400F8F8F800F8F8F800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F6F6F600FCFCFC00888888000000000000000000000000000000
      0000000000000000000008650C0004500700089D150009AE180009B3190009B5
      190009B5190009B3190009AD1800089914000450070004500700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000034A0400013602000386090003990B00039F0C0003A1
      0C0003A10C00039F0C0003980B00038109000136020001360200000000000000
      00000000000000000000000000000000000097979700EEEEEE00F0F0F000ABAB
      AB00A4A4A400AEAEAE00B1B1B100B2B2B200B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200AEAEAE00AFAFAF00A4A4
      A400ABABAB00EFEFEF00F4F4F4007B7B7B0097979700EEEEEE00F0F0F000ABAB
      AB00A4A4A400AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAF
      AF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00ADADAD00AFAFAF00A4A4
      A400ABABAB00EFEFEF00F4F4F4007B7B7B000000000000000000000000000000
      000008650C0008650C0009A5170009B71A0009B71A0009B3190009B3190009B3
      190009B3190009B3190009B3190009B71A0009B71A00089F1600045007000450
      0700000000000000000000000000000000000000000000000000000000000000
      0000034A0400034A0400038F0A0003A40C0003A40C00039F0C00039F0C00039F
      0C00039F0C00039F0C00039F0C0003A40C0003A40C0003880A00013602000136
      02000000000000000000000000000000000096969600F0F0F000EAEAEA002F2F
      2F009D9D9D006D6D6D005E5E5E005B5B5B005B5B5B005B5B5B005B5B5B005B5B
      5B005B5B5B005B5B5B005B5B5B005A5A5A005A5A5A006B6B6B00686868009E9E
      9E0030303000EAEAEA00F6F6F6007E7E7E0096969600F0F0F000EAEAEA003030
      30009E9E9E00000000006D6D6D006C6C6C006C6C6C006C6C6C006C6C6C006C6C
      6C006C6C6C006C6C6C006C6C6C006C6C6C006A6A6A0070707000676767009E9E
      9E0030303000EAEAEA00F6F6F6007E7E7E000000000000000000000000000F83
      19000B8319000FB825000CB61E0009B2190009B2190009B2190009B2190009B2
      190009B2190009B2190009B2190009B2190009B2190009B71A0009B119000676
      0E00045007000000000000000000000000000000000000000000000000000669
      0C0004690C0006A5130004A30F00039E0C00039E0C00039E0C00039E0C00039E
      0C00039E0C00039E0C00039E0C00039E0C00039E0C0003A40C00039D0C00025B
      05000136020000000000000000000000000096969600F1F1F100E0E0E0006464
      6400A7A7A7000000000053535300535353005353530053535300535353005353
      5300535353005353530050505000595959005A5A5A00151515000F0F0F00A1A1
      A1005C5C5C00E3E3E300F7F7F7007E7E7E0096969600F1F1F100E4E4E4005C5C
      5C00A1A1A100090909005C5C5C00585858005656560057575700575757005757
      570057575700575757005757570056565600646464004B4B4B0010101000A0A0
      A0005C5C5C00E3E3E300F7F7F7007E7E7E0000000000000000000F8319000E83
      200017BD350013B82D000FB426000CB31F000CB31F000CB31F0009B2190009B2
      190009B2190009B2190009B2190009B2190009B2190009B2190009B3190009B3
      190006720D00045007000000000000000000000000000000000006690C000569
      10000AAB1F0008A5190006A01400049F0F00049F0F00049F0F00039E0C00039E
      0C00039E0C00039E0C00039E0C00039E0C00039E0C00039E0C00039F0C00039F
      0C000257050001360200000000000000000096969600F0F0F000F5F5F5002828
      280073737300A0A0A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F1F1F1007F7F7F0078787800454545008D8D
      8D0056565600E4E4E400F6F6F6007F7F7F0095959500F0F0F000E5E5E5005656
      56008F8F8F00454545007C7C7C00747474007777790077777B0077777B007777
      7B0077777B007777780074747300767676004040400063636300494949008D8D
      8D0056565600E4E4E400F6F6F6007F7F7F0000000000000000000F8319001DBD
      42001ABA3C0016B734000CB31F000CB31F000CB31F000CB31F001BB9330043C5
      5500F0FAF200FFFFFF00A4E2AB0009B2190009B2190009B2190009B2190009B5
      190009AE1800045007000000000000000000000000000000000006690C000EAB
      2A000CA725000AA41F00049F0F00049F0F00049F0F00049F0F0093DD9E00FFFF
      FF00EBF8EE0027B23300059F0F00039E0C00039E0C00039E0C00039E0C0003A1
      0C0003990B0001360200000000000000000090909000F6F6F600BABABA007878
      7800F6F6F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A4A4A4004B4B4B006A6A6A00949494003C3C3C009090
      900056565600E4E4E400F7F7F7007D7D7D0096969600F1F1F100E5E5E5005A5A
      5A00828282009D9D9D00FFFFFF00FFFFFF00FFFFFF00FFFFFA00FFFFFA00FFFF
      FA00FFFFFA00FFFFFF00FFFFFF00FFFFFF006A6A6A0061616100484848008F8F
      8F0056565600E4E4E400F7F7F7007D7D7D00000000000F8319001EAA430022C1
      4D001DBB43001DBB43001BBA3D001DBB400015B7310024BC400020BA3A008EDC
      9A00FFFFFF00FFFFFF00FFFFFF00A2E2A80009B2190009B2190009B2190009B2
      190009B81A000893130004500700000000000000000006690C000F952B0011B0
      34000EA92B000EA92B00049F0F00049F0F00049F0F0098DEA400FFFFFF00FFFF
      FF00FFFFFF0070D07B0006A11300039E0C00039E0C00039E0C00039E0C00039E
      0C0003A50C00037A08000136020000000000ACACAC008A8A8A004A4A4A00A6A6
      A6009E9E9E00999999009F9F9F00A0A0A000A0A0A000A0A0A000A0A0A0009C9C
      9C00979797004C4C4C004A4A4A0088888800818181008D8D8D003E3E3E009090
      900057575700E4E4E400F6F6F6007E7E7E0096969600F1F1F100E5E5E5005959
      5900848484008F8F8F00FCFCFC0094948C001E1E5C00232383001E1E7F001E1E
      7E00222282001E1E4700C7C7BE00FCFCFC00656565005F5F5F00484848008F8F
      8F0057575700E4E4E400F6F6F6007E7E7E00000000000F83190029C45B0025BE
      510021BC4B0029BE530028C0570029C058002CBF510029BD480025BC410044C5
      5A00D4F2D900FDFEFD00FFFFFF00FFFFFF00A2E2A80009B2190009B2190009B2
      190009B3190009B2190004500700000000000000000006690C0016B4410013AC
      370011AA320016AB3700049F0F00049F0F009CE0AA00FFFFFF00FFFFFF00FCFE
      FC00C7EECE0025B2360009A31700039E0C00039E0C00039E0C00039E0C00039E
      0C00039F0C00039E0C0001360200000000009F9F9F00B2B2B20051515100C4C4
      C400C7C7C700C9C9C900B9B9B900B4B4B400B4B4B400B4B4B400B4B4B400B5B5
      B500DBDBDB009090900042424200878787007B7B7B008F8F8F003D3D3D009090
      900057575700E4E4E400F7F7F7007D7D7D0097979700F1F1F100E5E5E5005A5A
      5A008484840090909000FFFFFF0083836C000000AF000000FF000000FF000000
      FF000000FF0000006F00C0C0A500FFFFFF006565650060606000494949008F8F
      8F0057575700E4E4E400F7F7F7007D7D7D0009B2190021A54A002EC6650029C0
      580029C0580029C0580024BE4F0030C15A0032C155002EC04F002ABE480025BD
      420041C55700BDEBC400EBF9ED00FFFFFF00FFFFFF00A2E2A80009B2190009B2
      190009B2190009B81A000785110004500700039E0C00118F31001AB64A0016AF
      3E0016AF3E0016AF3E00049F0F00A0E1B100FFFFFF00FFFFFF00E7F7EA00AFE6
      B80029B53D000EA61F000BA51C00039E0C00039E0C00039E0C00039E0C00039E
      0C00039E0C0003A50C00026B0700013602008C8C8C00FFFFFF00919191009B9B
      9B00FFFFFF006B6B6B00808080009F9F9F009D9D9D009E9E9E009E9E9E009595
      9500B1B1B100FFFFFF0082828200454545008C8C8C008A8A8A003E3E3E008F8F
      8F0057575700E4E4E400F7F7F7007E7E7E0096969600F1F1F100E5E5E5005959
      5900848484008E8E8E00FBFBFB0088887D0005055B000A0A900005058B000505
      8B000909900005053E00C1C1B400FBFBFB006464640060606000484848008F8F
      8F0057575700E4E4E400F7F7F7007E7E7E0009B219002DBB620031C469002DC2
      62002DC262002DC2620040C669003CC4620037C35C0033C156002FC04F002ABE
      490026BD430043C55A0087DA9500FFFFFF00FFFFFF00FFFFFF0069D1750009B2
      190009B2190009B51A00089F160004500700039E0C0019A947001CB44E0019B1
      470019B1470019B147006ED08A00FFFFFF00FFFFFF00FFFFFF0078D48B0032B8
      4A0014AB2B0011A925000EA620000CA51C0009A3180007A1140006A11100039E
      0C00039E0C0003A10C0003880A000136020097979700ECECEC00FFFFFF000E0E
      0E00B2B2B200E9E9E90053535300E8E8E800E6E6E600E8E8E800E6E6E600D9D9
      D90044444400A9A9A900FAFAFA0051515100585858009A9A9A003B3B3B009090
      900057575700E4E4E400F6F6F6007E7E7E0095959500F0F0F000E5E5E5005959
      5900828282009F9F9F00FFFFFF00FFFFFF00FAFAED00FAFAE600FAFAE600FAFA
      E600FAFAE600FAFAF100FFFFFF00FFFFFF006F6F6F005E5E5E00494949008F8F
      8F0057575700E4E4E400F6F6F6007E7E7E0009B2190036C36C0038C6700030C3
      690030C36900BAEBCA00D0F1DB00CFF1D900CEF0D800CDF0D600CCEFD500CBEF
      D300CAEFD200C8EECF00E1F6E400FFFFFF00FFFFFF00FFFFFF00FFFFFF0069D0
      750009B2190009B2190009AE180004500700039E0C0020B2510022B655001CB2
      4E001CB24E0074D39200FFFFFF00FFFFFF00FFFFFF00FFFFFF00DAF3E100BBEA
      C500BBEAC500BAE9C200B7E9C000B7E9BF00B6E7BC00B5E7BB00B4E7BA008FDA
      9600039E0C00039E0C0003990B000136020095959500F0F0F000EDEDED002A2A
      2A0063636300DADADA00E3E3E300989898009C9C9C009B9B9B009A9A9A00A0A0
      A000A3A3A300C0C0C000FFFFFF00EDEDED004B4B4B0080808000424242008F8F
      8F0057575700E4E4E400F6F6F6007E7E7E0096969600F1F1F100E4E4E4005959
      59008F8F8F005252520092929200909090009696980095959900969699009696
      990095959900969697008D8D8D00919191003C3C3C0068686800474747008E8E
      8E0057575700E4E4E400F6F6F6007E7E7E0009B2190047C979004ACB7D0035C4
      6D0035C46D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0009B2190009B2190009B3190004500700039E0C002EBA5E0031BC63001FB4
      52001FB45200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00039E0C00039E0C00039F0C000136020096969600F1F1F100E3E3E3006060
      60009494940049494900989898009B9B9B009D9D9D009E9E9E009E9E9E009D9D
      9D009D9D9D009B9B9B0089898900939393004040400064646400474747008E8E
      8E0057575700E4E4E400F7F7F7007D7D7D0096969600F0F0F000E6E6E6005252
      52008181810088888800DCDCDC00D8D8D800DBDBDB00DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00DADADA00D6D6D600DADADA005454540067676700474747008F8F
      8F0057575700E4E4E400F7F7F7007D7D7D0009B2190058CE860062D28E003BC6
      71003BC67100F4FCF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F4FCF600E2F6E600FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3F1
      D70009B2190009B2190009B2190004500700039E0C003EC06C0047C5750024B6
      560024B65600D4F2E000FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCF4E300F2FB
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBF8
      EE00039E0C00039E0C00039E0C000136020097979700F0F0F000E5E5E5005757
      57008686860085858500DFDFDF00D8D8D800DCDCDC00DCDCDC00DCDCDC00DCDC
      DC00DBDBDB00DDDDDD00DADADA00DEDEDE005B5B5B0064646400484848008F8F
      8F0057575700E4E4E400F7F7F7007D7D7D0097979700EDEDED00FBFBFB000707
      07006F6F6F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00ABABAB003D3D3D009A9A9A003C3C3C008F8F
      8F0057575700E4E4E400F7F7F7007D7D7D0009B2190062D08B0081DBA4004DCB
      7E004DCB7E0067D391007BD99E0079D79B0077D7980074D6950071D590006ED4
      8C0061D07E005DCF7A00A0E3B000FFFFFF00FFFFFF00FFFFFF00C7EECD0029BC
      3F0009B21A0009B3190009A9180004500700039E0C0047C2720067D08E0034BC
      640034BC640041C26F00C6EED500FFFFFF00FFFFFF00FFFFFF0092DDA90049C4
      690046C264004DC5690049C4630046C15D0042C0590041BD54003DBD4F0022B0
      3300039E0C00039F0C0003930B000136020096969600F1F1F100E5E5E5005A5A
      5A00838383009A9A9A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006C6C6C005F5F5F00494949008F8F
      8F0057575700E4E4E400F7F7F7007E7E7E0094949400F6F6F600D7D7D7004646
      4600F6F6F600FAFAFA00FAFAFA00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00F9F9F900FFFFFF00D6D6D6002F2F2F00828282008D8D8D003D3D3D009090
      900057575700E4E4E400F7F7F7007E7E7E0009B219005ACA80009BE2B7006DD5
      950052CD820052CD820051CD810050CD7E004DCB7A0049CA760046C9710042C7
      6B0046C86D00BCEBC900FFFFFF00FFFFFF00FFFFFF00AEE7B90024BC40001FBA
      39000AB21C0009B619000897140004500700039E0C0040BB660083D9A40052C9
      7D0038BF680038BF680037BF6700ABE6C000FFFFFF00FFFFFF00FFFFFF00ADE6
      BF002DB8520023B4450020B13F001DB0390019AD340016AC2D0013AA28000FA7
      2300039E0D0003A30C00037F09000136020095959500F1F1F100E5E5E5005959
      59008484840095959500FEFEFE00FAFAFA00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00F8F8F800FEFEFE006868680060606000484848008F8F
      8F0057575700E4E4E400F6F6F6007E7E7E008C8C8C00F1F1F1005D5D5D00DFDF
      DF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F7004141410070707000818181008E8E8E003E3E3E008F8F
      8F0057575700E4E4E400F6F6F6007E7E7E0009B2190043BC63009FE4BB009DE3
      B8004FCC7F0052CD820052CD820052CD820050CC7E004DCB7B004ACA77005FD0
      8500E1F6E700FFFFFF00FFFFFF00FFFFFF00AAE5B8001ABA3C0017B8360013B6
      2D000DB422000BB81D00067B0F0004500700039E0C002BAA480088DCA90086DA
      A50035BD650038BF680038BF680038BF6800ABE6C000FFFFFF00FFFFFF00FFFF
      FF00D8F3E0003EC05F0023B4460011AA30000EA92B000CA725000AA5200008A3
      190005A0110004A50E00026006000136020096969600F1F1F100E5E5E5005959
      59008484840094949400FDFDFD00F9F9F900FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00F7F7F700FDFDFD006868680060606000484848008F8F
      8F0057575700E4E4E400F7F7F7007D7D7D00B1B1B1007B7B7B004B4B4B009292
      9200828282008787870087878700878787008787870087878700878787008484
      8400898989003232320053535300919191007A7A7A008E8E8E003E3E3E008F8F
      8F0057575700E4E4E400F7F7F7007D7D7D000000000009B2190085DBA700BFEC
      D10088DDA90043C9770052CD820052CD820052CD820050CC7F004DCB7B00A3E4
      BA00FFFFFF00FFFFFF00FFFFFF00ADE7BD0021BC4B001EBB44001ABA3C0016B7
      320012B82B000EAE2200045007000000000000000000039E0C006BD09100ADE6
      C4006ED393002BBA5C0038BF680038BF680038BF6800ABE6C100FFFFFF00FFFF
      FF00FFFFFF0089DAA10028B64C0013AC370011AA32000FA92C000CA725000AA4
      1D0007A5180005991100013602000000000096969600F1F1F100E5E5E5005A5A
      5A00838383009B9B9B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006F6F6F005D5D5D00484848008F8F
      8F0056565600E4E4E400F6F6F6007E7E7E0098989800CBCBCB0073737300BDBD
      BD00F6F6F600EDEDED00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00E9E9
      E900E9E9E900BFBFBF005A5A5A0060606000848484008E8E8E003C3C3C009090
      900056565600E4E4E400F6F6F6007E7E7E000000000009B2190051C57200B1E9
      C800C5EED50081DAA30052CD820052CD820052CD820052CD820050CC7F007AD8
      9C00FFFFFF00FFFFFF008ADCA40028BF590025BF530021BD4A001DBA400019B9
      390016BE35000C851A00045007000000000000000000039E0C0037B557009DE2
      B800B5E9C90067CF8C0038BF680038BF680038BF680038BF680079D59A00FFFF
      FF00FFFFFF005ACB7E002CB7520016AD3F0013AD390011AB31000EA728000CA6
      23000AAC1F00046B0C00013602000000000097979700F1F1F100E5E5E5005858
      58008989890080808000D2D2D200CDCDCD00D1D1D100D1D1D100D1D1D100D1D1
      D100D1D1D100D1D1D100CBCBCB00D1D1D100535353006C6C6C004E4E4E008F8F
      8F0056565600E4E4E400F7F7F7007C7C7C0095959500F9F9F900F0F0F0002525
      2500A3A3A300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00949494005B5B5B0095959500454545009090
      900056565600E4E4E400F7F7F7007C7C7C00000000000000000009B2190075D5
      9800C7EFD600CAF0D9008CDEAB0052CD820052CD820052CD820052CD820051CC
      80004ECB7C004BCB780048C974002BC15F0027BF570023BD4E0020BB47001EC0
      440015A4300008650C0000000000000000000000000000000000039E0C005AC9
      8000B7EACA00BBEBCE0073D4960038BF680038BF680038BF680038BF680037BD
      660035BC620032BC5D002FBA590018B0440015AD3D0012AB350010A92E000FAF
      2C00098E1C00034A0400000000000000000096969600F0F0F000E4E4E4005757
      5700969696000000000066666600000000006868680000000000000000000000
      0000000000000000000000000000686868006C6C6C003F3F3F00212121008C8C
      8C0059595900E4E4E400F6F6F6007E7E7E0096969600EEEEEE00E6E6E6005757
      57008383830023232300BEBEBE00C2C2C200C3C3C300C4C4C400C4C4C400C3C3
      C300C4C4C400C1C1C100C3C3C300CECECE008C8C8C0037373700232323008C8C
      8C0059595900E4E4E400F6F6F6007E7E7E00000000000000000009B219002CB3
      420081DAA300C9EFD800D6F3E100ACE7C30078D89D0054CD830041C8750038C5
      6F0035C46D0035C46D0037C56E003BC66D0038C567002DC15B0026C354001DB1
      41000F821C0008650C0000000000000000000000000000000000039E0C00189F
      2A0067CF8C00BAEACC00CAEFD80097E0B2005DCC86003ABF690029B85A0022B5
      54001FB452001FB4520021B5530024B6520022B54C0019B0410014B23A000E9D
      290006680D00034A0400000000000000000096969600F1F1F100E5E5E5004848
      4800B4B4B4003737370046464600424242004242420042424200424242004242
      420042424200424242004242420042424200414141003737370034343400B4B4
      B40048484800E5E5E500F7F7F7007E7E7E0096969600F1F1F100E5E5E5004949
      4900B8B8B8002D2D2D0035353500303030003030300030303000303030003030
      30003030300030303000303030002D2D2D003B3B3B003838380034343400B4B4
      B40048484800E5E5E500F7F7F7007E7E7E0000000000000000000000000009B2
      19002BB3410074D59600B6EACB00D6F3E100CFF1DC00B4E9C80097E1B40082DB
      A40077D79C0073D6990073D699006AD4930052CE810038C96B0020AD48000F82
      1C000F831900000000000000000000000000000000000000000000000000039E
      0C00189F290059C97E00A3E3BC00CAEFD800C1EDD100A0E2B8007FD8A00068D0
      8E005CCB840058CA810058CA81004FC77A0038C0670022BA500010982F000668
      0D0006690C0000000000000000000000000096969600EFEFEF00F0F0F0005151
      5100828282008787870086868600868686008686860086868600868686008686
      8600868686008686860086868600868686008686860089898900888888008282
      820051515100EFEFEF00F5F5F5007E7E7E0096969600EFEFEF00F0F0F0005151
      510082828200898989008A8A8A008A8A8A008A8A8A008A8A8A008A8A8A008A8A
      8A008A8A8A008A8A8A008A8A8A008A8A8A008787870088888800888888008282
      820051515100EFEFEF00F5F5F5007E7E7E000000000000000000000000000000
      000009B2190009B219004FC56E0086DCA700AFE8C600C2EED300C5EED500BDEC
      CF00B1E9C7009FE3BA0086DDA90065D5920042C472001F9C3E000F821C000F82
      1C00000000000000000000000000000000000000000000000000000000000000
      0000039E0C00039E0C0035B553006CD191009AE1B600B1E9C600B5E9C900ABE6
      C1009DE2B70088DAA7006CD393004AC979002AB457000F84270006680D000668
      0D000000000000000000000000000000000096969600EFEFEF00F0F0F000F7F7
      F700E9E9E900E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E9E9
      E900F7F7F700EFEFEF00F5F5F5007E7E7E0096969600EFEFEF00F0F0F000F7F7
      F700E9E9E900E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E9E9
      E900F7F7F700EFEFEF00F5F5F5007E7E7E000000000000000000000000000000
      0000000000000000000009B2190009B219003FBE5C005BCA7D006CD2900070D4
      950069D2900058CA7F003FBA640024A241000F821C000F831900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000039E0C00039E0C0028AC410041BB630051C5770055C7
      7D004EC577003EBB650028A74900138B290006680D0006690C00000000000000
      000000000000000000000000000000000000AEAEAE00B6B6B600B7B7B700ADAD
      AD00B8B8B800B9B9B900B3B3B300B7B7B700BABABA00B2B2B200B6B6B600BABA
      BA00B3B3B300B6B6B600BABABA00B3B3B300B5B5B500BABABA00B3B3B300B4B4
      B400B6B6B600B1B1B100AFAFAF006F6F6F00AEAEAE00B6B6B600B7B7B700ADAD
      AD00B8B8B800B9B9B900B3B3B300B7B7B700BABABA00B2B2B200B6B6B600BABA
      BA00B3B3B300B6B6B600BABABA00B3B3B300B5B5B500BABABA00B3B3B300B4B4
      B400B6B6B600B1B1B100AFAFAF006F6F6F000000000000000000000000000000
      00000000000000000000000000000000000009B2190009B2190009B2190009B2
      190009B2190009B2190009B2190009B219000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000039E0C00039E0C00039E0C00039E
      0C00039E0C00039E0C00039E0C00039E0C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFD6B500F7DEB500F7D6AD00F7D6A500F7CE9C00EFCE9400EFC69400EFC6
      8C00EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFC6
      8400EFBD7B009C6B6300000000000000000093655F00A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A46769000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B700000000000000000000000000000000000000
      000000000000000000000000000000000000824B4B00824B4B008C4B4B00914B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFD6BD00F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC69400EFC6
      8C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093655F00EED4B800F2DABC00F2D5
      B100EDCEA700E6C79D00E1C09300DEBB8C00E1BB8800E5BC8400E7BC8100E7BC
      7E00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC7E009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000005B7000005B7000005B700000000000000000000000000000000000000
      000000000000824B4B00824B4B00894B4B009C4B4C00B64B4C00BD4B4C009F4B
      4C004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFD6C600F7E7C600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC6
      9400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093655F00ECD5C200F4DEC000F0D8
      B700E9CCAB00D9BD9900C9AD8900C1A57F00C6A67E00D1AF7F00DAB47F00E1B7
      7D00E3BA7D00E7BC7E00E9BD7F00E9BD7F00EABF7F00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000005
      B7000005B7000005B7000000000000000000000000000000000000000000824B
      4B00824B4B009A4D4E00AF4E4F00C14E4F00C04D4E00BF4C4D00BF4C4D009F4B
      4C004E1E1F00994B4B00824B4B00824B4B00824B4B00824B4B00824B4B00824B
      4B00824B4B00824B4B0000000000000000000000000000000000000000009463
      5A00EFDEC600F7E7C600F7DEBD00F7DEB500F7D6B500F7D6AD00EFCEA500EFCE
      9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093655F00EFDAC500F6E1C600F2DA
      BC00E6CEAF00222123003E3935008C7960009D876700AA8F6B00B89A6F00C7A4
      7400D1AB7500DEB57900E5BB7D00E7BC7E00EABF7F00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000005B70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000005B700000000000000000000000000000000000000000000000000824B
      4B00C5545500C9545500C7535400C6525300C5515200C4505100C24F5000A04C
      4D004E1E1F00FE8B8C00FC929300FB9A9C00FAA3A400F8AAAB00F7B1B100F7B5
      B600F7B5B600824B4B0000000000000000000000000000000000000000009463
      6300F7DECE00FFE7CE00F7E7C600F7DEBD00F7DEB500F7D6B500EFCEA500DEBD
      9400D6B58C00D6B58400DEB58400E7BD8400EFBD8400EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093656000F0DECB00F7E5CE00F4DE
      C500EAD4B6003C3835001F1F2100182A330034434400836F56008E7759009E83
      5F00B2926800C7A36F00D9B17600E3BA7D00E7BC7E00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000005B7000005
      B70000000000000000000000000000000000000000000000000000000000824B
      4B00CE585900CC575800CB565700CA555600C9545500C7535400C6525300A34E
      4F004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000009463
      6300F7E7D600FFEFD600F7E7CE00F7DEC600F7DEBD00F7DEBD00DEC6A500BDA5
      8400AD947300A58C6B00BD9C7300DEB58400EFC68C00EFBD8400EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000095666000F2E2D300FAEAD700F6E3
      CE00F0DAC200AC9D8A00113B4E0004689A00064F75000C3C52003A4948007764
      4C0089725300A4865F00BC996900D1AB7300E1B77900E3BA7B009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000005
      B7000005B7000005B7000005B7000005B7000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000005B7000005B7000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00D15B5C00D05A5B00CF595A00CE585900CC575800CB565700CA555600A550
      50004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000009C6B
      6300F7E7DE00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DEBD00004A0000004A
      0000004A0000004A0000A58C6B00D6B58400EFC68C00EFC68C00EFBD8400EFBD
      7B00E7BD7B009C6B6300000000000000000098696300F2E6DA00FAEEDE00F7E7
      D400F4E1CA00EBD8BD001A3E4D00036A9D00056798001B506E002A3440004135
      38006A5542007E694C00987D5800B2916300CCA66E00DAB177009D6D5F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000006F6000005B7000005B7000005B7000005B70000000000000000000000
      000000000000000000000005B7000005B7000005B7000005B700000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00D55E5F00D55E5F00D45D5E00D35C5D00D15B5C00D05A5B00CF595A00A651
      52004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000009C6B
      6300F7EFE700FFF7E700FFEFDE00F7E7CE00E7D6BD00DECEB500004A00000894
      100000940800004A0000A58C6B00C6AD8400D6B58400DEB58400E7BD8400EFBD
      8400E7BD7B009C6B630000000000000000009E6E6400F4EAE100FBF2E600F8EB
      DC00F7E6D300F3E0CA0074868600045983003150650095606000AA6E6E00965D
      5D00643B3A0065524000766347008E745100A9895D00C09C690096695A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B7000005B7000005B700000000000000
      00000005B7000005B7000005B7000005B7000005B70000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00DA636400D9626300D8606200D75F6000D55E5F00D45D5E00D35C5D00A953
      54004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B000000000000000000000000000000000000000000A573
      6300F7EFEF00FFF7EF00FFEFE700E7DECE00C6B5A500AD9C8C00004A0000089C
      1800089C1000004A000094846B00A58C6B00A58C6B00BD9C7300DEB58400EFC6
      8C00E7BD84009C6B63000000000000000000A3726600F6EEE900FCF6ED00F8EE
      E300F7EADA00F7E6D300F0DECB000B4159008C5B5B00CC8E8E00BB7E7E00AA6E
      6E00965D5D00643B3A0064513E006F5D4300826C4B009A7E5500865D51000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000005B7000005B7000005
      B7000005B7000005B7000005B7000005B7000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00DE666700DD656600DC646500DA636400D9626300D8606200D75F6000AB55
      55004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B000000000000000000000000000000000000000000A573
      6B00FFF7F700FFFFF700FFF7EF00004A0000004A0000004A0000004A000010A5
      210008A51800004A0000004A0000004A0000004A0000A58C6B00D6B58400EFC6
      8C00EFBD84009C6B63000000000000000000A7756800F8F3F000FEFBF600FBF3
      EA00F8EEE300F8EBDC00F6E6D1004E6C76009C696900DC9D9D00CB8C8C00BA7D
      7D00A96D6D00915959005A35350062503D006A5841007B664800735046000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000006F6000005
      B7000006F6000005B7000005B700000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00E2696A00E1686900E0676800DE666700E06D6E00E6909100DC646500AC56
      57004E1E1F0058A55B001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B000000000000000000000000000000000000000000AD7B
      6B00FFF7F700FFFFFF00FFFFF700004A000021C6420021C6420018BD390018B5
      310010AD290010A5210008A51800089C1000004A0000AD947300D6B58C00EFCE
      9400EFC68C00A57363000000000000000000AC796900FAF6F400FFFFFE00FDF8
      F300FBF2E900F8EEE300F8EBDA00F4E3D0007B504F00E2A4A400DC9D9D00CB8C
      8C00BA7D7D00A96D6D008C5757005A353500604F3D006C59410062443C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000006F6000005B70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00E76D6E00E66C6D00E56B6C00E36A6B00EEA6A700FFFFFF00EB9C9C00AF58
      59004E1E1F00EECEAF00B7EBAA005ED377005ED3770045CA670045CA670045CA
      6700F7B5B600824B4B000000000000000000000000000000000000000000B57B
      6B00FFF7F700FFFFFF00FFFFFF00004A000029D6520029CE4A0021C6420018BD
      390018B5310010B5290010AD210010A52100004A0000BDA58400DEBD9400EFCE
      9C00EFC69400A57363000000000000000000B17E6B00FAF6F400FFFFFF00FFFE
      FB00FEF7F000FBF3EA00FAEEE300F8EAD900E1CCBB007B504F00E2A3A300DC9D
      9D00CA8B8B00B87B7B00A76C6C008B5656005A35350066523F00583F37000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000006F6000005
      B7000005B7000006F6000006F600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00EB707200EA6F7000E96E6F00E76D6E00F2A9AA00FFFFFF00EB959600B15A
      5A004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300D9F6BD00D9F6
      BD00F7B5B600824B4B000000000000000000000000000000000000000000B584
      6B00FFF7F700FFFFFF00FFFFFF00004A0000004A0000004A0000004A000021CE
      4A0021C64200004A0000004A0000004A0000004A0000E7C6A500EFCEA500F7CE
      A500EFCE9C009C7363000000000000000000B6816C00FAF6F400FFFFFF00FFFF
      FF00FFFCFB00FEF7F200FBF3EA00F8EEE300F8EBDC00E1CCBB0073484700E1A3
      A300DA9C9C00C98B8B00B87B7B00A76C6C008B5656005D383600533C35000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000006F6000005B7000006
      F6000006F6000006F6000005B7000006F6000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00EF747500EE737400ED727300EB707200EA6F7000EF909100E76D6E00B25B
      5C004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000000000000000000000000000BD84
      6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700004A000029D6
      5A0029CE5200004A0000AD9C8C00DECEB500F7DEBD00F7DEB500F7D6AD00EFD6
      A500CEB594008C6B63000000000000000000BB846E00FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFEFB00FEF7F200FBF3EA00FAEEE300F8EAD900BBA196007348
      4700E1A1A100DA9A9A00C98B8B00B77A7A00A66B6B008B5555005A3535000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000006F6000006F6000006F6000005B7000006F6000000
      0000000000000006F6000006F6000006F6000006F60000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F3777800F3777800F2767700F0757600EF747500EE737400ED727300B55D
      5D004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000000000000000000000000000C68C
      6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004A000031DE
      630031DE5A00004A0000C6B5A500E7D6BD00F7DEC600F7DEBD00E7CEAD00C6B5
      9400A5947B00846363000000000000000000C0896F00FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2E900FAEEE300F8EBDA00BBA1
      960073484700E1A1A100D99A9A00C78A8A00B77A7A00A66B6B008B5555005A35
      3500000000000000000000000000000000000000000000000000000000000000
      0000000000000006F6000006F6000005B7000006F6000006F600000000000000
      000000000000000000000006F6000006F6000006F6000006F600000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F87B7D00F77A7B00F6797A00F4787900F3777800F2767700F0757600B75F
      5F004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000000000000000000000000000C68C
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004A0000004A
      0000004A0000004A0000E7DECE00F7E7CE00FFEFD600E7D6BD00BDAD9C00A59C
      8C00A5948400846B63000000000000000000C58C7000FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FDF8F300FBF3EA00F8EEE300F8EA
      D900BCA1960091606000EBAAAA00D9999900C78A8A00B6797900804E4E004148
      5500354756000000000000000000000000000000000000000000000000000000
      00000006F6000006F6000006F6000006F6000006F60000000000000000000000
      0000000000000000000000000000000000000006F6000006F6000006F6000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00FC7F8000FB7E7F00FA7D7E00F87B7D00F77A7B00F6797A00F4787900B860
      62004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000000000000000000000000000CE94
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7E700EFD6C6009C635A009C635A0094635A009463
      5A0094635A009C6B5A000000000000000000CB917300FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FCF7F000FBF2E900FBF2
      E600ECD5C20084544C0091606000EBAAAA00D9999900534E5700028AC40000AA
      EA0000A6E6000087C40000000000000000000000000000000000000000000006
      F6000006F6000006F6000006F6000006F6000000000000000000000000000000
      000000000000000000000000000000000000000000000006F6000006F6000006
      F60000000000000000000000000000000000000000000000000000000000824B
      4B00FF818200FF818200FE808100FC7F8000FC7F8000FB7E7F00FA7D7E00BB63
      63004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000000000000000000000000000CE94
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFFFEF00DEC6B5009C635A00DEA56B00DE9C4A00E794
      3900EF8C2100A56B6B000000000000000000CF967400FBF7F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FCF7F000FFFA
      EF00DAC0B6009F675B00AA78560091606000C2898900097BAB0000BDFF0000BD
      FF0000A6E600001C9D00000082000000000000000000000000000006F6000006
      F6000006F6000006F6000006F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000006
      F60000000000000000000000000000000000000000000000000000000000824B
      4B00FF818200FF818200FF818200FF818200FF818200FE808100FE808100BD65
      65004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000000000000000000000000000D69C
      7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700DEC6BD009C635A00EFB57300EFAD5200F7A5
      3100A56B6B00000000000000000000000000D4987500FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FFFE
      F700DDC4BC009F675B00EAB47400B77D460073474700009FDE0000BDFF00008C
      D100001C9D00010D9D00010A970000008200000000000006F6000006F6000006
      F6000006F6000006F60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F77E7F00FF818200FF818200FF818200FF818200FF818200FF818200BF66
      66004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000000000000000000000000000D69C
      7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEC6C6009C635A00EFB57300EFA55200A56B
      6B0000000000000000000000000000000000D4987500FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DDC7C2009F675B00EAB27300EFA751007A494A000093D10000B1F200012B
      A7000725DC000420B800021DB100010A9700000000000006F6000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B00AF5E5F00D56F7000FF818200FF818200FF818200FF818200BF66
      66004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000000000000000000000000000D69C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6CE009C635A00EFB57300A56B6B000000
      000000000000000000000000000000000000D4987500FFFFFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E2D0CE009F675B00EDB57200A5686B0000000000000000000084C1000C21
      BF002D4FF6000F2ECC00031EB10000058F00000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000824B4B00824B4B0091515200B6626300EE7A7B00FF818200BF66
      66004E1E1F00914B4B00824B4B00824B4B00824B4B00824B4B00824B4B00824B
      4B00824B4B00824B4B000000000000000000000000000000000000000000D694
      7300E7C6AD00E7C6B500E7C6B500E7C6B500E7C6B500E7C6AD00DEBDAD00DEBD
      AD00DEBDAD00D6B5AD00D6B5AD00C69C94009C635A00A56B6B00000000000000
      000000000000000000000000000000000000CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E68009F675B00A5686B00000000000000000000000000000000001624
      BF005270FC001839E30001099700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000824B4B00824B4B00985555009F58
      58004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001322BD00050DA50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000900000000100010000000000C00600000000000000000000
      000000000000000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00
      0000000000000000FFFFFF000000000000000000FFFFFF000000000000000000
      E81527000000000000000000FFFAFF000000000000000000E000070000000000
      00000000E00007000000000000000000FA5027000000000000000000E0002700
      0000000000000000FA4827000000000000000000FA0027000000000000000000
      FA2027000000000000000000F80027000000000000000000FA00270000000000
      00000000FE0127000000000000000000C00001000000000000000000FE052700
      0000000000000000C02001000000000000000000C00001000000000000000000
      FFAFF7000000000000000000D05409000000000000000000FFFFFF0000000000
      00000000FFFFFF000000000000000000FF00FFFFF8FFFF80FFFFFFFFFC003FFF
      473FFFFFFFFFFFFFF0000FFF40E7FF01FFFFFFFFE00007FE8039FF01FFFC003F
      C00003FF0007FF01FFFC003FC00003FD0000FF01FFFC7F3F800001FA0000FF01
      FFFE3FFF800001F80001FF01FFFF1FFF000000F40002FFFEFFFF8FFF000000F0
      0000FF00FFFFC7FF000000E80005FF01FFFFE3FF000000D0000BFF80BFFFE3FF
      000000C00007FF003FFFC7FF000000A00017EFC00FFF8FFF00000000002FE010
      0FFF1FFF00000040000FE0080FFE3FFF80000180005FF8080FFC7FFF80000180
      00BFF8000FFCFF3FC000038000BFF8001FFC003FC00003C0017FF8000FFC003F
      E00007F802FFFE000FFFFFFFF0000FC702FFFF819FFFFFFFFC003FFCF7FFFC7C
      5FFFFFFFFF00FFFF9BFFFF40BFFFFFFFFFFFFFFFF03FE7FFFFFF00FFFFFFFFFF
      8007417FFFFC003FFFFFFFFC0000C0FFFFF0000FFFFFFFF8000040FFFFE00007
      FF7FFFF80000C05FFFC00003FE3FFFFC0000802FFFC00003FC1FFFFE0000C000
      FF800001F80FFFFE0003E020FF800001F007FFFE0007F0003F000000E003FFFE
      000FFE0017000000C041FFFE001FFA080B000000C0E0FFFC007FFC000D000000
      C1F87FF800FFFC0007000000E3FC3FF800FFF00007000000F7FE1FF007FFF000
      07000000FFFF8FF007FFF00007000000FFFFC7F007FFF00007800001FFFFF3F0
      1FFFFC000F800001FFFFFDE01FFFF40001C00003FFFFFFE07FFFFE000BC00003
      FFFFFFC0FFFFFE0017E00007FFFFFFC0FFFFFF003FF0000FFFFFFFC1FFFFFE40
      5FFC003FFFFFFFC1FFFF000000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0
      0007FFFFFFFFFFFFFFFFFFC00007FFFFFFFFFFFFFFFFFFC00007FFFFFFFFFFFF
      FFFFFFC00007FF800FFF8FFFFFFFFFC00007FC000FFC01FFFF9FFFC00007F000
      0FF0007FFF0FFFC00007F0000FF0007FFE07FFC00007F0000FF0007FFC03FFC0
      0007F0000FF0000FF821FFC00007F0000FF0000FFC78FFC00007F0000FF0000F
      FEFC7FC00007F0000FF0000FFFFF3FC00007F0001FF0000FFFFF9FC00007F000
      3FF0000FFFFFFFC00007F0007FF0000FFFFFFFC00007F0007FF0000FFFFFFFC0
      0007F801FFF8000FFFFFFFC00007FF8FFFFF801FFFFFFFC00007FFFFFFFFE03F
      FFFFFFC0000FFFFFFFFFFFFFFFFFFFC0001FFFFFFFFFFFFFFFFFFFC0003FFFFF
      FFFFFFFFFFFFFFC0007FFFFFFFFFFFFF800000800000FF00FFFF00FF00000000
      0000FC003FFC003F000000000000F0000FF0000F000000040000E00007E00007
      000000000000C00003C00003000000000000C00003C000030000000000008000
      0180000100000000000080000180000100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000180000100000000
      0000800001800001000000000000C00003C00003017E00000000C00003C00003
      000000000000E00007E00007000000000000F0000FF0000F000000000000FC00
      3FFC003F000000000000FF00FFFF00FFE00003FFFFFFFFFFFFFFE7FFE0000300
      001FFFFFF9FF07FFE0000300001FFFFFF1F807FFE0000300001FC7FFE3E00003
      E0000300001FC3FF87E00003E0000300001FC1FF0FE00003E0000300001FE0FE
      1FE00003E0000300001FF07C3FE00003E0000300001FFC307FE00003E0000300
      001FFE00FFE00003E0000300001FFF01FFE00003E0000300001FFF83FFE00003
      E0000300001FFF01FFE00003E0000300001FFE00FFE00003E0000300001FFC18
      7FE00003E0000300000FF83C3FE00003E00003000007F07F1FE00003E0000300
      0003E0FF8FE00003E00003000001C1FFEFE00003E0000700000083FFFFE00003
      E0000F00000087FFFFE00003E0001F0000C08FFFFFF80003E0003F0001E1FFFF
      FFFF07FFFFFFFFFFFFF3FFFFFFFFE7FF00000000000000000000000000000000
      000000000000}
  end
  object ActionListPersAcc: TActionList
    Images = ImageList
    Left = 568
    Top = 3
    object ActionNext: TAction
      Caption = #1044#1072#1083#1110
      ImageIndex = 6
      OnExecute = ActionNextExecute
    end
    object ActionBack: TAction
      Caption = #1053#1072#1079#1072#1076
      ImageIndex = 7
      OnExecute = ActionBackExecute
    end
    object ActionClose: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ImageIndex = 3
      ShortCut = 27
      OnExecute = ActionCloseExecute
    end
    object ActionAddPersAcc: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      ImageIndex = 0
      OnExecute = ActionAddPersAccExecute
    end
    object ActionEditPersAcc: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      ImageIndex = 1
      OnExecute = ActionEditPersAccExecute
    end
    object ActionDelPersAcc: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ImageIndex = 2
      OnExecute = ActionDelPersAccExecute
    end
    object ActionSave: TAction
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      ImageIndex = 8
      OnExecute = ActionSaveExecute
    end
    object ActionCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = ActionCancelExecute
    end
    object ActionBalance: TAction
      Caption = #1056#1086#1079#1087#1086#1076#1110#1083' '#1079#1072' '#1090#1080#1087#1072#1084#1080' '#1087#1086#1089#1083#1091#1075
      OnExecute = ActionBalanceExecute
    end
    object ActionRefresh: TAction
      Caption = #1054#1085#1086#1074#1080#1090#1080
      ImageIndex = 9
      OnExecute = ActionRefreshExecute
    end
    object ActionCheck: TAction
      Caption = 'ActionCheck'
      ImageIndex = 8
      OnExecute = ActionCheckExecute
    end
    object ActionFilter: TAction
      ImageIndex = 14
      OnExecute = ActionFilterExecute
    end
    object ActionClear: TAction
      ImageIndex = 13
      OnExecute = ActionClearExecute
    end
  end
  object Db: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 288
    Top = 8
  end
  object DataSetPersAcc: TpFIBDataSet
    Database = Db
    Transaction = Transaction
    OnEndScroll = DataSetPersAccEndScroll
    SelectSQL.Strings = (
      
        'select* from BS_ALLOCATION_ACCOUNT_FILTER(1,'#39'1'#39','#39'1'#39','#39'1'#39','#39'1'#39',1,1,' +
        #39'1'#39','#39'1'#39','#39'1'#39','#39'1'#39',1,1,1,1,'#39'1'#39','#39'1'#39','#39'1'#39')'
      '')
    Left = 216
    Top = 472
    poSQLINT64ToBCD = True
    object DataSetPersAccID_DT_ALLOC_PERS_AC: TFIBBCDField
      FieldName = 'ID_DT_ALLOC_PERS_AC'
      Size = 0
      RoundByScale = True
    end
    object DataSetPersAccID_PERSONAL_ACCOUNT: TFIBBCDField
      FieldName = 'ID_PERSONAL_ACCOUNT'
      Size = 0
      RoundByScale = True
    end
    object DataSetPersAccSUM_OPL: TFIBBCDField
      FieldName = 'SUM_OPL'
      Size = 2
      RoundByScale = True
    end
    object DataSetPersAccDATE_OPL: TFIBDateField
      FieldName = 'DATE_OPL'
    end
    object DataSetPersAccDATE_OBR: TFIBDateField
      FieldName = 'DATE_OBR'
    end
    object DataSetPersAccID_REC_BUFF: TFIBBCDField
      FieldName = 'ID_REC_BUFF'
      Size = 0
      RoundByScale = True
    end
    object DataSetPersAccDATE_BEG_PERIOD_FOR_ACC: TFIBDateField
      FieldName = 'DATE_BEG_PERIOD_FOR_ACC'
    end
    object DataSetPersAccDATE_END_PERIOD_FOR_ACC: TFIBDateField
      FieldName = 'DATE_END_PERIOD_FOR_ACC'
    end
    object DataSetPersAccCLIENT_ACCOUNT: TFIBBCDField
      FieldName = 'CLIENT_ACCOUNT'
      currency = True
      Size = 0
      RoundByScale = True
    end
    object DataSetPersAccNAME_CASH_TYPE: TFIBStringField
      FieldName = 'NAME_CASH_TYPE'
      Size = 50
      EmptyStrToNull = True
    end
    object DataSetPersAccNOTE_CASH_TYPE: TFIBStringField
      FieldName = 'NOTE_CASH_TYPE'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetPersAccNAME_KASSA_APP: TFIBStringField
      FieldName = 'NAME_KASSA_APP'
      Size = 50
      EmptyStrToNull = True
    end
    object DataSetPersAccNOTE_KASSA_APP: TFIBStringField
      FieldName = 'NOTE_KASSA_APP'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetPersAccFLAG_ALLOC_ER: TFIBSmallIntField
      FieldName = 'FLAG_ALLOC_ER'
    end
    object DataSetPersAccFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetPersAccFULL_ADRESS: TFIBStringField
      FieldName = 'FULL_ADRESS'
      Size = 500
      EmptyStrToNull = True
    end
    object DataSetPersAccNUM_FLAT: TFIBStringField
      FieldName = 'NUM_FLAT'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetPersAccHOUSE: TFIBStringField
      FieldName = 'HOUSE'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetPersAccKORPUS: TFIBStringField
      FieldName = 'KORPUS'
      Size = 5
      EmptyStrToNull = True
    end
    object DataSetPersAccID_CITY_AREA: TFIBIntegerField
      FieldName = 'ID_CITY_AREA'
    end
    object DataSetPersAccID_REGION: TFIBIntegerField
      FieldName = 'ID_REGION'
    end
    object DataSetPersAccID_TYPE_STREET: TFIBSmallIntField
      FieldName = 'ID_TYPE_STREET'
    end
    object DataSetPersAccID_STREET: TFIBIntegerField
      FieldName = 'ID_STREET'
    end
    object DataSetPersAccID_DISCOUNT_OBJECT: TFIBIntegerField
      FieldName = 'ID_DISCOUNT_OBJECT'
    end
    object DataSetPersAccNAME_REGION: TFIBStringField
      FieldName = 'NAME_REGION'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetPersAccFAMILIYA: TFIBStringField
      FieldName = 'FAMILIYA'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetPersAccIMYA: TFIBStringField
      FieldName = 'IMYA'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetPersAccOTCH: TFIBStringField
      FieldName = 'OTCH'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetPersAccNAME_CITY_AREA: TFIBStringField
      FieldName = 'NAME_CITY_AREA'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetPersAccNAME_STREET: TFIBStringField
      FieldName = 'NAME_STREET'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetPersAccNAME_TYPE_STREET: TFIBStringField
      FieldName = 'NAME_TYPE_STREET'
      Size = 50
      EmptyStrToNull = True
    end
    object DataSetPersAccID_KASSA_APP: TFIBIntegerField
      FieldName = 'ID_KASSA_APP'
    end
    object DataSetPersAccID_CASH_TYPE_ROOT: TFIBIntegerField
      FieldName = 'ID_CASH_TYPE_ROOT'
    end
    object DataSetPersAccID_KASSA_APP_ROOT: TFIBIntegerField
      FieldName = 'ID_KASSA_APP_ROOT'
    end
    object DataSetPersAccID_CASH_TYPE: TFIBIntegerField
      FieldName = 'ID_CASH_TYPE'
    end
    object DataSetPersAccID_CLIENT_ACCOUNT: TFIBIntegerField
      FieldName = 'ID_CLIENT_ACCOUNT'
    end
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = Db
    TimeoutAction = TARollback
    Left = 319
    Top = 7
  end
  object DataSourcePersAcc: TDataSource
    DataSet = DataSetPersAcc
    Left = 240
    Top = 472
  end
  object DataSetSelNumb: TpFIBDataSet
    Database = Db
    Transaction = Transaction
    Left = 368
    Top = 7
    poSQLINT64ToBCD = True
  end
  object StoredProc: TpFIBStoredProc
    Database = Db
    Transaction = Transaction
    Left = 344
    Top = 7
  end
  object DataSourceBalances: TDataSource
    DataSet = DataSetBalances
    Left = 536
    Top = 472
  end
  object DataSetBalances: TpFIBDataSet
    Database = Db
    Transaction = Transaction
    SelectSQL.Strings = (
      'select * from BS_PAYMENT_CURRENT_SEL(1)')
    DataSource = DataSourcePersAcc
    Left = 568
    Top = 472
    poSQLINT64ToBCD = True
    object DataSetBalancesID_PAYMENT_CURRENT: TFIBIntegerField
      FieldName = 'ID_PAYMENT_CURRENT'
    end
    object DataSetBalancesKOD_PERIOD_FOR_ACC: TFIBSmallIntField
      FieldName = 'KOD_PERIOD_FOR_ACC'
    end
    object DataSetBalancesSUMMA_PAY: TFIBBCDField
      FieldName = 'SUMMA_PAY'
      Size = 2
      RoundByScale = True
    end
    object DataSetBalancesID_TYPE_GROUP_BALANCE: TFIBSmallIntField
      FieldName = 'ID_TYPE_GROUP_BALANCE'
    end
    object DataSetBalancesNAME_TYPE_GROUP_BALANCE: TFIBStringField
      FieldName = 'NAME_TYPE_GROUP_BALANCE'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object PopupImageList: TImageList
    Left = 710
    Top = 10
    Bitmap = {
      494C01010F001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
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
      0000000000000081BD000081BD000081BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000099CC000099CC00AB726600B6716200AD746700AD746700AD74
      6700AD746700AB726600AB726600AB7266000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001D69FF00908A820077736C000000000000000000000000000081BD000081
      BD000081BD00009FDE000081BD0000ACEB000081BD000081BD000081BD000000
      00000000000000000000000000000000000000000000000000000099CC000099
      CC000099CC0000B3E6000099CC00AB726600FFDCBC00FFE4C200FFDEB900FFDA
      B200FFD7AA00FED3AA00FED1A400986B66000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AA71
      7100A4717100AB7A7A00AB787800A5727200936060006F3A3A006B3333003277
      FF002A7BFF007FDEFF0098908500000000000081BD000081BD001CC5F20010CA
      FF0003C4FF0000B0F2000081BD0000C5FF0000BFFF0000BBFC0000AAEA000081
      BD000081BD000000000000000000000000000099CC000099CC0031D2F50020D6
      FF0008D1FF0000C1F5000099CC00AB726600F5D0BB00B0827F00B0827F00B082
      7F00B0827F00B0827F00FED7AE00986B66000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BA838300ECC1
      C100F6CFCF00E3B5B500E1B3B300D3A4A400C4959500AD7A7A0060649A002A77
      F80071E1FF003188FF00216AFC00000000000081BD0069F7FF004FEDFF0033DD
      FE001CD4FF0009B6EF000081BD0000C2FF0000BDFF0000BDFF0000C1FF0000B5
      F4000082C0000000000000000000000000000099CC0083F9FF007DFCFF000C85
      18002CC2BC0021D1FF000099CC000C851800FFE4DE00FFECD900FFE8D300FEE5
      CC00FEE3C600FEDFC000FEDCBA00986B66000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C99B9B00FFEF
      EF00E9CDCD00DBB5B5009B8D8D007874750073706F00756E6E008D8986008CC5
      D6002D83FF00347AFF0000000000000000000081BD007FFCFC0079FCFF0060F2
      FE0047EAFF0025C9F0000081BD0000C9FF0000C6FF0000C6FF0000C7FF0000BA
      FF000381BD000000000000000000000000000099CC0097FDFD00A3FFFF000C85
      18000C85180045DCFB000099CC000C8518000C851800B0827F00B0827F00B082
      7F00B0827F00B0827F00FEE3C600986B66000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8A0A000F7DA
      DA00EBBEBE009E8F9000BDAA9000FFD18400FED08500FED698009A948B008C8A
      87003D7BED000000000000000000000000000081BD0086FFFF008AFFFF0082FE
      FF0068EFF80029BBDE000081BD0096574B0096574B0096574B0096574B009657
      4B0096574B0096574B0096574B0096574B000099CC009DFFFF009FFEFE000C85
      180044CC63000C8518000C8518000C8518000EA020000C851800FEF5EA00FFF1
      E500FEEFDF00FEECD900FEE9D300986B66000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CB9B9B00FFE3
      E300F7E3E300807C7A00FFDD9700F2D59800EFCD9000F1C88200FED99D006A62
      6300000000000000000000000000000000000081BD0049D1E60030B7D8001198
      CA000189C500008BC9000081BD0096574B00FED9B600FFD5AF00FED1A700FECF
      A100FECA9900FEC69500FEC48E0080504B000099CC0064DCEC0020AFD7000FA6
      DB000C85180044CC630044CC630030C14B000EA425000EA020000C851800B082
      7F00B0827F00B0827F00FFEFDF00986B66000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CCA4A400F9E1
      E100E7C6C6007B777200FFEEBD00F8E8BB00F4DDA900F0D09400FFD59000716D
      6C00000000000000000000000000000000000081BD00028EC700049FD90001AB
      EA0000B7FB00046B0B000081BD0096574B00FFE2C6009C6865009C6865009C68
      65009C6865009C686500FECB990080504B000099CC0007A4D4001CC4EE000FCE
      FE0000CCFF000C8518000C8518000C8518000EA020000C851800FAF7F700F9F4
      F100F9F3EE00EBE3DC00DBD7CC00986B66000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CD9D9D00FFDE
      DE00F2D0D000827D7900FFFFEA00FFFEEF00F9EDC200F6DAA000FFDA96006D65
      6600000000000000000000000000000000000081BD004AE6FC0035E2FF001ED9
      FF00046B0B00046B0B000081BD009C5C4F00FFEAD500FFE6CE00FFE1C600FEDD
      BD00FEDAB600FED5AF00FED1A70080504B000099CC0065ECFD0059ECFF003DE0
      FF0021D8FF0009C9FF00019198000C8518000C851800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00AB726600AB726600AB7266000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D0A7A700F9E8
      E800F3E3E300A5A0A000DEDAC400FFFFF200FFF7CB00FFE7A600B1A290007967
      6700000000000000000000000000000000000081BD0074F8FC0065F6FF00046B
      0B001DA93500046B0B00046B0B00A4655300FEF0E3009C6865009C6865009C68
      65009C6865009C686500FEDAB60080504B000099CC008DFAFD0087FAFF006BF0
      FE0050E8FF002DCFF3000099CC000C851800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00AB726600F6BC7300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CCA0A000FFDE
      DE00F0CBCB00E4BCBC00A29696007F7B79007A77730079747300867777006C3A
      3A00000000000000000000000000000000000081BD0082FEFE00046B0B0030C0
      56002CBD48001EAF360002804100046B0B00FFF8F000FFF4EB00FEF2E300FFED
      DD00FEEAD500FEE6CE00FEE2C60080504B000099CC009AFEFE00A2FFFF0099FF
      FF007EF7FF004CD7F0000099CC00E4B68F00DCA88700DCA88700DCA88700DCA8
      8700DCA88700AB72660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D3A6A600FFDB
      DB00F0CACA00E8C3C300E8C5C500DDB9B900CCA7A700BA929200834F4F006A37
      3700000000000000000000000000000000000081BD0082FFFF0068E5D400046B
      0B002EC24F00046B0B00046B0B00046B0B00046B0B009C6865009C6865009C68
      65009C6865009C686500FFEAD50080504B000099CC009AFFFF0075E5F20051CE
      E5002EB8DB0022B0D80016ABD80021A4CA004E9BAF004CA7BA004AB1C50044A9
      C200769297000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEA5A500FFFD
      FD00FFF1F100FFE8E800FBE0E000F9DADA00F7D5D500E9C4C400D7ACAC007C48
      4800000000000000000000000000000000000081BD00129DCB000991CA0019A1
      CE00046B0B00046B0B002AB48F00298A4200046B0B009CC59E00FFFEFC00FFFB
      F600FFF8F000E5DAD100D0CBBD0080504B000099CC0023B1D70014A7D6002DB5
      D90070E2F00088F5FA0066EEFD0025D0F70000BBF00000BBF00000A4DB0000A0
      D8000D98C7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C38C8C00B37F
      7F00BF909000C1949400BE919100BA8B8B00B1838300A879790094606000824F
      4F0000000000000000000000000000000000000000000081BD000081BD000081
      BD000081BD00046B0B0018BBE500CC926C00046B0B008AC59200FFFFFF00FFFF
      FF00FFFCFB0096574B0096574B0096574B00000000000099CC000099CC000099
      CC000099CC0034BCDD002ABBE0000CAAD900009CCF00009BCE000098CB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000081BD000081BD00D79D7200C0E0B800AFDCBB00FFFFFF00FFFF
      FF00FFFFFF0096574B00F3AA5800000000000000000000000000000000000000
      0000000000000099CC000099CC000099CC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DCA37600D1926D00D1926D00D1926D00D192
      6D00D1926D0096574B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001F1E
      1F001F2325000D222B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006C6A6A006C6A6A0000000000000000006C6A6A006C6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D4663000362920006365100161A1F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C6A
      6A00AAA7A700A19F9F006C6A6A006C6A6A006C6A6A00E5E3E3006C6A6A006C6A
      6A006C6A6A0000000000000000000000000000000000000000009B7C6B009D7E
      6D009C7E6D009C7E6D009C7E6D009C7D6D009C7D6C009B7C6B009B7C6B009A7C
      6A00997B68009B7C6B0000000000000000000000000098656500AA787800B385
      8400A16965009E6A680099696900B65555000000000000000000000000000000
      000000000000000000000000000000000000BD4C0000BC4B0000BC4B0000B64A
      00001C414500165E8200745D65007D525400572D1F006C300400883A0300A342
      0100B84A0000BC4B0000BC4B00000000000000000000000000006C6A6A00DAD9
      D900A19F9F00A19F9F00A19F9F0037363600353535006C6D6D00BFBFBF00E1E2
      E200B7B6B6006C6A6A006C6A6A006C6A6A0000000000000000009B776600FFFF
      FF00FAF4E900FAF4E900EEE9DE00E8E2D800F7F0E400FAF2E600FAF1E400F9EF
      E000F8EDDA00977967000000000000000000000000009B666600D2ABA900FFFF
      FF0098A9FF00F0D8D400D3B1B300BC969700B07B7B00A46B6B00B67878000000
      000000000000000000000000000000000000BD4C0000FFFFFF00FFFFFF00FFF8
      F20093A5A50062555D00DD908C00B87979008E5757005D3D3600846C5300A183
      6300E1B58600FECB9600BC4B000000000000000000006C6A6A00D4D3D300CACA
      CA008E8C8C008E8C8C008E8C8C003C3B3B000A090A00070707000B0B0B000707
      07007A7A7A00BBBBBB006C6A6A00000000000000000000000000A27F6F00FFFF
      FF00DDC2B500DDC2B500B5A9A400B1A19A00DBC2B400DCBBA900DCBAA500DCBA
      A300FAF1E2009879680000000000000000000000000098666600D9B3AF00FFF7
      E00099A3E800FFF1D800F9E1CE00FFECDD00FFF5F100FAE6E700A56C6C000000
      000000000000000000000000000000000000BD4C0000FFFFFF00C0582D008936
      1C0086391F005D484A00E9A4A100CF909000B2757500875353005A3C35007F68
      4F00C59F7600FECB9600BC4B0000000000006C6A6A00CACACA00CACACA008E8C
      8C00D7D4D400CECBCB00BFBCBC00B1AFAF00A3A0A000888686005E5B5C000707
      070009090900080808006C6A6A00767373000000000000000000A3807000FFFF
      FF00DBC3BB00EADDD7006F6D7100928B9600C3CDB900E8D6CC00DAB8A500DCB9
      A500FAF3E600997A6A000000000000000000000000009B686800E0BCB400FFF6
      DD009DA5E800F8E3D000D6C9C600FFF7F300FFEBDD00FFE0CD00A86F70000000
      000000000000000000000000000000000000BD4C0000FFFFFF00CB532A00FF5D
      3500FFFFFF00F396810084525000E2A1A100CE8F8F00B4767600865252005D3E
      3600B4916D00FECB9600BC4B0000000000006C6A6A00CACACA008E8C8C00EFEE
      EE00FFFEFE00FBFAFA00E3E0E100DEDEDE00DEDDDD00CFCECE00BDBCBC00ADAB
      AB008B898900585656007A787800757373000000000000000000A9877800FFFF
      FF00DBC7C200E9DDDA00A8BBCE0034B356002CB4440071B46F00ECDBD200DCBB
      A700FBF4E800997B6B000000000000000000000000009F696900E8C8C600FFFE
      F400A0B1FD00F0E7E200424B530078716A00B6B28D00FED9CA00AF7275000000
      000000000000000000000000000000000000BD4C0000FFFFFF00F0C5B8008981
      9900157BB6007E91A700D0A0900087595900E1A1A100CC8E8E00B07474008651
      510072422700FECB9600BC4B0000000000006C6A6A008E8C8C00FFFFFF00FEFC
      FC00FAFAFA00D5D4D50098919300A0989900B2ABAC00C4C0C100D7D7D700D8D8
      D800C7C6C600B7B6B600918F8F006C6969000000000000000000AB897A00FFFF
      FF00DBC7C300E6D7D40099D0A70066FF98005AEC86002EAD460087BE8100EAD8
      CC00FBF5EA009A7C6B00000000000000000000000000A06B6B00F1D4D200FFFA
      E900A3ACEB00FFF4DD00669EA80024A94200139A2B00367D3200BB7A7E000000
      000000000000000000000000000000000000BD4C0000FFFFFF0084BCEA00157B
      B6001F87E900157BB600B0D7F600DCCFC70089575300E6A6A600CA8B8B00B675
      7500814844003E414500BC4B000000000000000000006C6A6A006C6A6A00EDEB
      EB00B1A6A7007A6F72008A83880096929500969091009D9798009A9395009E98
      9900BBBABA00D1D1D100C2C2C2006C6A6A000000000000000000AF8E7F00FFFF
      FF00DCC5C000DEC9C300DBE4D60057E27F006AFF9D0055E17C002AA43C009CC4
      9400FCF8F2009B7C6B00000000000000000000000000A36E6E00F7DAD100FFF6
      E000A4AEEA00FFF4E0004EBB720062FF960052E17B001E9C3300007705000000
      000000000000000000000000000000000000BD4C0000FFFFFF00145C8C00319F
      FC0035A3FF00157BB60084C1ED00FFFFFF00A74605009A6B6A00EFAAA9008C6D
      73002180A3000C98BD000C98BD00000000000000000000000000000000006C6A
      6A00BB897F00A7876D008B6F64007D6760006F626500797379008F8B8E00A9A3
      A400CBCACA00C1C1C1006C6A6A00000000000000000000000000AF8F8000FFFF
      FF00FEFEFE00FEFEFE00FEFDFD00D1F8DC0054EE830068FF9B0050DC7700249E
      3800B7DCB600B69F9400000000000000000000000000AA747400FBE5DF00FFFD
      EF00A8B7F500FFFBF50099D9A4003BDC6C0064FE96004DDA74001E962F00037E
      090000000000000000000000000000000000BD4C0000FFFFFF00004B8200319F
      FC00319FFC00004B8200C9E0EB00FFFFFF00BC4B0000DDCFC9009E5C56002D84
      A70007BCED00008EDE00000F9500000081000000000000000000000000000000
      0000BD828100FFE3B400FFD39F00E9B28100C9997300BA916C00BD828100807D
      7E006C6A6A006C6A6A0000000000000000000000000000000000AF8F8000FFFF
      FF00DFCECC00DFCDCB00DECAC600E9D9D500ADEAB9005AF6880064FF970042DA
      690034873E00C6BDB600000000000000000000000000B07B7B00FDECE900FFFF
      F400AABAF500FFF8E900FFF4EE0064CF86004AE7790063FB950049D36C001690
      2500007F0500000000000000000000000000BD4C0000FFFFFF00D8E6EF00004B
      8200004B82005896B800F0F6F800FFFFFF00BC4B0000FFFFFF00D7C2BC00068F
      C1000196DE000320BA000318B200010B99000000000000000000000000000000
      0000BD828100FFE0B800FFD3A700FFD09D00FFCE9000FFC68800BD8281000000
      0000000000000000000000000000000000000000000000000000B1908000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFEFD0091EFAC0055FC88009AC1
      A400CDBBB6006E6D8C00030FB4000000000000000000B8838400FFECDF00FFFA
      E200B0BBEE00FFF8DF00FFF2E000FFEFDF004BCD710055F386005DFE90005BA1
      69006E6E670079776E000000000000000000BD4C0000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BC4B0000FFFFFF00FFFFFF00FFF8
      F2000263BF002F45ED001031D300010A9500000000000000000000000000C086
      8300FFE7CF00FFE0C000FFD9B200FFD3A500FFD09900BD828100000000000000
      0000000000000000000000000000000000000000000000000000B7978700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFDFB00FBFCFA00A5C5A600FFFF
      FF007892F500203DDC0000029F000000000000000000C28B8B00E4DDDF00E2E4
      E300A8B3D600B3B4B300A1A2A300A6A2A400ACAEAD0025C056008ABF9900DFD4
      D2006A77C1001624B5000206A90000000000BD4C0000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BC4B0000FFFFFF00FFFFFF00FFFF
      FF00EEEFEF002732D0000C19B40000000000000000000000000000000000BD82
      8100FEEBD800FFE6CC00FFDEBD00FFD8B100FED3A400BD828100000000000000
      0000000000000000000000000000000000000000000000000000B8988800FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FEFEFD00FEFCFA00FDFBF900DED0C9008C99
      DE004277FF002D4AD80001029E000000000000000000C8919100C4B9B800817E
      810069656C006D626100908080008A78780088707100455F4B00D5CCC7007992
      F3003862F2001F36C7000000990000000000BC4B0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000000000000000000000000000BD828100FFFF
      F200FFFFF200FFEBD800FFE5CA00FFE1BD00F3C7A700BD828100000000000000
      0000000000000000000000000000000000000000000000000000B8988800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B3938400C1B9
      D0003243C700090FA60000009400000000000000000093717100967575005A53
      530052505000565454005653530054555500595A5A005554520094A0DE002B50
      E600436CF4001625B800000098000000000000000000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B000000000000000000000000000000000000BD828100BD82
      8100BD828100FBEFE200FBE3CF00FBDDC200BD82810000000000000000000000
      0000000000000000000000000000000000000000000000000000B8988800B898
      8800B4938300B4938300B08E7D00B08E7D00AC887700AC887700A7827000BCA0
      92000000000000000000000000000000000000000000808282005C5F5F005E5E
      5E006262620062626200606060005C5C5C006B6B6B0000000000000000001522
      C1000D15AA000000980000009900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD828100BD828100BD8281000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000314B6200AC7D7E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000824B4B00824B4B00A64B4B00A94D4D004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005084B2000F6FE100325F8C00B87E
      7A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00824B
      4B00B64F5000C24F5000C54D4E00B24D4E004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000000000000000
      000000000000004B0000004B0000000000000000000000000000000000000000
      00000000000000000000000000000000000032A0FE0037A1FF00106FE200325F
      8B00B67D79000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000F59E1001A57CA003767BF00415B9F001344B4000000
      0000000000000000000000000000000000000000000000000000824B4B00D458
      5900CB555600C9545500C9525300B74F52004E1E1F00FE8B8C00FB9A9C00F8AA
      AB00F7B5B600F7B5B600824B4B00000000000000000000000000000000000000
      0000004B00000E9D1D000E9D1D00004B00000000000000000000000000000000
      0000000000000000000000000000000000000000000037A4FE00379FFF000E6D
      DE00355F8900BB7F790000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000317BEB005D8CD1009EA7B700C5B4AA00DEAB8B00F0995B00A4908C002358
      C200000000000000000000000000000000000000000000000000824B4B00D75C
      5D00D05A5B00CF595A00CF575800BD5356004E1E1F0023B54A0013C1480016BD
      48000CBC4100F7B5B600824B4B0000000000000000000000000000000000004B
      00001CB1350011A422000E9D1D0011A42200004B000000000000000000000000
      000000000000000000000000000000000000000000000000000037A4FE00359E
      FF000F6FDE0035608B00A67B7F00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001676FF005F98
      E300FAD3A300FFD7A500FFDDA700FFD1A300E6A47800D9834F00FCC08B00E9D4
      C2005F8BD7001E60D80000000000000000000000000000000000824B4B00DD63
      6400D75F6000D55E5F00D55C5D00C2575A004E1E1F002AB44D001CBF4C001EBC
      4C0013BC4500F7B5B600824B4B00000000000000000000000000004B00002EC6
      520024BC430013922400004B00000D931A000E9D1D00004B0000000000000000
      00000000000000000000000000000000000000000000000000000000000038A5
      FE00329DFF00156DCE00444F5B00000000009C6B6500AF887B00AF887E00AA80
      75000000000000000000000000000000000000000000000000002A68B800CAB7
      9E00FFEAC600FEE6C700FCE2C500EFC9AB00DA926800E69D6900F8D5B400FFEA
      D400FFFAEB00A6C5EF002D75E900000000000000000000000000824B4B00E368
      6900DD656600DA636400DE666700C6595B004E1E1F0026B1490016BC48001BBB
      490010BB4300F7B5B600824B4B000000000000000000004B000035CA5E0039D4
      65001CA13400004B000000000000004B00000A8615000E9D1D00004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003BABFF00A1CAE700AD867900A9837300E0CFB100FFFFDA00FFFFDD00FCF8
      CF00CCB29F00A1746B000000000000000000000000001C76FF00AB753D00FFDD
      A100FEF4EA00FEF3E300FAE5D300E9BC9F00D4805100EAAC8100FCE6CF00FFF3
      E900FFFAF600FFFFFF0099B6E300135DE0000000000000000000824B4B00EB6D
      6E00E2676800E67E7F00FAD3D400CC6E70004E1E1F00A5D8970050D16F0042C9
      66002DC75800F7B5B600824B4B00000000000000000000000000004B000029B5
      4800004B000000000000000000000000000000000000004B00000D931A00004B
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0917D00FCE9AC00FFFFCC00FFFFCF00FFFFD000FFFF
      DE00FFFFFA00E3D3D1009969650000000000000000001A6AC7006EB45900FFF6
      E600FFFAF400FFFAF300F7E0D000E0A58400E1966600F3CCAD00B5B0A900DAD5
      D000FEFEFC00FFFFFE00B69193002A69D1000000000000000000824B4B00F273
      7400E96C6D00EB818200FCD1D300CF6E70004E1E1F00FFF2CC00FFFFD700FFFF
      D400E6FCC700F7B5B600824B4B0000000000000000000000000000000000004B
      0000000000000000000000000000000000000000000000000000004B00000A86
      1500004B00000000000000000000000000000000000000000000000000000000
      00000000000000000000B0897800FAD19200FEF4C200FFFFD000FFFFDA00FFFF
      F600FFFFFC00FFFFFC00B69384000000000000000000186F750062D18800FFFF
      FF00FFFEFB00FEFBF700EFD0BC00D9916800E39F7300FEE5D000F3EDE500BABB
      B800C2C4C100F4F0EF00807AA1002378FA000000000000000000824B4B00F878
      7900F0757600EE727300F0737400D16566004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD700F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004B0000004B000000000000000000000000000000000000000000000000
      000000000000B0897800FEDA9700EDB47800FBEEBB00FFFFD300FFFFDC00FFFF
      F400FFFFF400FFFFE200E9DDBC00A67B730000000000093BC200C0D5EE00FFFF
      FF00FFFFFF00FEFCFA00E7CABC00DA976D00F2C09800E1D8CF00FBF6F200FFFF
      FF00EAE9E700A1C7F7002378FA00000000000000000000000000824B4B00FE7F
      8000F77A7B00F6797A00F7777900D76B6B004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004B0000004B0000000000000000000000000000000000000000
      000000000000B18A7800FFDE9900E9A16700F4D19900FEFCCC00FFFFD500FFFF
      DA00FFFFDC00FFFFD700EFE6C500A97E75001864E3001F42EF00FFFFFF00D8EA
      FF00A7CFFF0080B7FF003289FF005C96E500D5D7DC00D3CBC000B4B4B100E0E0
      E000FFFFFF00569EFF001673FF00000000000000000000000000824B4B00FF83
      8400FC7F8000FB7E7F00FE7F8000DA6E6F004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AA7F7300FAE0A400F0B77800EEBA7B00F6DDA600FEFBCC00FFFF
      D300FFFFD100FFFFD700D9C5A700A3756C001B75FF00398AFF004D99FF00589F
      FF00000000000000000000000000000000001974FF009DCAFF00EDEDEB00D5CE
      C000CEE2F800287FFF0000000000000000000000000000000000824B4B00FF88
      8900FF828300FF818200FF828300E07374004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEB29300FFFEDD00F4D1A500EEBA7B00F2C78F00F8E1
      AB00FCF0BA00FCFACA00A3776F00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001974FF00ADD3
      FF005BA0FE001873FF0000000000000000000000000000000000824B4B00824B
      4B00E2757600FE818200FF868700E57677004E1E1F00FAEBC500FCFBD100FCFB
      CF00FCFBD100F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A1746B00E1D4D300FFFEEE00F7CC8C00F0B47300F7C7
      8800FCE3A500C2A08800A5776C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001974FF000000000000000000000000000000000000000000000000000000
      0000824B4B009C565700CB6C6D00CF6E6E004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000098686500BA958700EAD7A400EAD59E00E0C0
      9700A5776C00A5776C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000824B4B00824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A77E7000A9807300A478
      6E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F785100BB86
      7F00B7827800B7807600B67F7300B67E7100B57D6E00B57D6E00B57D6E00B57D
      6E00B67D6E00B5856900BA479100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A1946600FFEA
      C600F8DCB100F5D8A700F4D19B00F3CD9100F0C68400EFC58000EFC58100EFC5
      8100F0C68100F3D37D00B1458A0000000000A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A46769000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B7000000000000000000A46769008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D590080504B00000000000000000000000000000000009F926700FBE8
      CC00F2D8B800F1D2AE00EFCFA400EECA9B00EEC69000ECC18600E8BC7D00E8BC
      7E00E8BE7F00ECCB7A00B1448A0000000000A4676900FCEACE00F0D8BA00DCC1
      A000C4AA8900BFA48000CFAF8200DCB58100E2B87E00E7BC7E00E9BD7F00EFC4
      8100A4676900000000000000000000000000000000000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B7000000000000000000A4676900FCEACE00F3DA
      BC00F2D5B100F0D0A700EECB9E00EDC79300EDC28B00E9BD8100E9BD7F00E9BD
      7F00EFC4810080504B00000000000000000000000000000000009F936A00FCEC
      D500F4DDC000F1D7B600F3D3AE00F0CCA400E9C19400E5BD8B00E8BD8300E9BD
      7E00E9BE7F00EDCB7B00B1448A0000000000A0675B00FEEFDA00F6E0C600302D
      2D00212527003745460099846800AD926F00C2A07400DCB27A00E7BC7E00EFC4
      8100A4676900000000000000000000000000000000000005B7000005B7000005
      B7000005B7000000000000000000000000000000000000000000000000000005
      B7000005B70000000000000000000000000000000000A0675B00FEEFDA00F6E0
      C600F2DABC00F2D5B200C1C188000070000000700000BDB67200E9BD8200E9BD
      7F00EFC4810080504B0000000000000000000000000000000000A2976E00FFF4
      E400F5E2CD00F8E2C700DCCBA70080845D00676D460096866300E7BF8C00EDC1
      8700E9BE7E00EDCB7A00B1448A0000000000A0675B00FFF4E500F7E5CF009C8F
      80000D466300036292000B3B54004B474100917B5E00B5976C00D1AB7400E9BF
      7D00A467690000000000000000000000000000000000000000000005B7000005
      B7000005B70000000000000000000000000000000000000000000005B7000005
      B7000005B70000000000000000000000000000000000A0675B00FFF4E500F7E5
      CF0000700000C4CA970000700000C2C18700C0BD800000700000BDB66F00EABF
      8100EFC4800080504B0000000000000000000000000000000000A89D7400FFF9
      ED00FBE9D800FFE6D500A2A68100005D0000006300006C704A00E6BC9300E6BE
      8C00E9BE8200EDCA7A00B1448A0000000000A7756B00FFFBF000F8EADC00EEDD
      CA0022576C00165E8200745D65007D5254005E3F390086725800A78C6600CEAA
      7300A06567000000000000000000000000000000000000000000000000000000
      00000005B7000005B7000005B700000000000005B7000005B7000005B7000000
      00000000000000000000000000000000000000000000A7756B00FFFBF000F8EA
      DC000070000000700000C4C99800F2D5B100F0D0A900BFBD800000700000EBC2
      8A00EFC5830080504B0000000000000000000000000000000000B1A47A00FFFF
      FF00E1DFCE00879073004B5D390000850D0000820900465730006C6F49009686
      6200E4BC8A00EECE8200B144890000000000A7756B00FFFFFC00FAF0E600F8EA
      DA008F9F9D0062555D00DD908C00B87979008E5757005B3D37007D6B51009A81
      5D00925C5E000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B7000005B7000005B7000005B7000005B7000000
      00000000000000000000000000000000000000000000A7756B00FFFFFC00FAF0
      E600007000000070000000700000F2DABA00F2D5B100F0D0A700EECB9D00EBC7
      9300F2C98C0080504B0000000000000000000000000000000000B6AA7D00FFFF
      FF00AAB89F00007402000D9D250015AB2C000FA1200001880F0000680000676D
      4500EAC29500F1D28D00B2448A0000000000BC826800FFFFFF00FEF7F200FAEF
      E600F0E5D5006B5D6200E9A4A100CF909000B275750087535300583C35007A69
      5000815354000000000000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B7000006F60000000000000000000000
      00000000000000000000000000000000000000000000BC826800FFFFFF00FEF7
      F200FAEFE600F8EAD900F7E3CF00F6E0C500007000000070000000700000EECC
      9E00F3CE970080504B0000000000000000000000000000000000BDB18000FFFF
      FF00ABBEA700007604000FA12B0020BE40001AB23400058F1600006700008084
      5A00F1CDA300F4D99700B3468B0000000000BC826800FFFFFF00FFFEFC00FCF6
      F000FAEFE600EBDCCE008C5E5D00E2A1A100CE8F8F00B4767600865252005C3F
      3800764C4E000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B7000005B7000005B7000006F600000000000000
      00000000000000000000000000000000000000000000BC826800FFFFFF00FFFE
      FC0000700000CADABA00F7EADA00F6E3CF00C5CE9F000070000000700000F0D0
      A600F6D3A00080504B0000000000000000000000000000000000C3B38100FFFF
      FF00E9F0EA00B2C2AD00778A690013A6330013A73300495B3700A2A37E00DCCB
      A600F9D8AF00E8D29A00A5428A0000000000D1926D00FFFFFF00FFFFFF00FFFE
      FC00FEF7F000FAEFE500E1CEC00087595800E1A1A100CC8E8E00B07474008651
      5100633B3C000000000000000000000000000000000000000000000000000000
      00000006F6000006F6000005B70000000000000000000006F6000006F6000000
      00000000000000000000000000000000000000000000D1926D00FFFFFF00FFFF
      FF00CEE7CC0000700000CADAB800C9D7B00000700000C6CC9E0000700000F4D8
      B100EBCFA40080504B0000000000000000000000000000000000CABB8200FFFF
      FF00FFFFFF00FFFFFF00B1C1AC00007C0C00007F1000878F7100FFECDA00FFEC
      CF00CEBEA500A1A183009E428B0000000000D1926D00FFFFFF00FFFFFF00FFFF
      FF00FFFEFC00FCF7F000FAEFE500D7C1B5008A5B5B00E6A6A600CA8B8B00B675
      75007E4442003E41450000000000000000000000000000000000000000000006
      F6000006F6000006F6000006F60000000000000000000006F6000006F6000006
      F6000000000000000000000000000000000000000000D1926D00FFFFFF00FFFF
      FF00FFFFFF00CEE7CC000070000000700000C9D5B000F8E7D100FBEACE00DECE
      B400B6AA930080504B0000000000000000000000000000000000D0BE8500FFFF
      FF00FFFFFF00FFFFFF00E9F0EA00AABDA600A8B69B00E6E4D200E2C4B400A77C
      72008D6D6B008D756600AC4A840000000000DA9D7500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFC00FCF6EF00FCF3E600CFB5AA0097666600EFAAA9008C6D
      73001E799F000C98BD000C98BD000000000000000000000000000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000006
      F6000006F60000000000000000000000000000000000DA9D7500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFC00FCF6EF00FCF3E600EDD8C900A0675B00A067
      5B00A0675B00A0675B0000000000000000000000000000000000D7C58700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BC969000C88E
      6200F3A23F00E1981400D02BC20000000000DA9D7500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFB00FFFEF700DAC1BA00955F56009E5D58002D84
      A70006BBF000008EDE00000F950000008100000000000006F6000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DA9D7500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FFFEF700DAC1BA00A0675B00E19E
      5500E68F3100B56D4D0000000000000000000000000000000000DAC78900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C09E9A00D39A
      6800E2B03B00CA3CA8000000000000000000E7AB7900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500A56B5F00D1914F00068F
      C1000393DE000320BA000318B200010B9900000000000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7AB7900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500A0675B00F8B5
      5C00BF7A5C000000000000000000000000000000000000000000D5D07900F9FF
      EA00F6FEE100F4FDE100F3FCE000F2FBDF00EFFADF00F4FFE800BAA88F00BA9D
      4B00CE20C400000000000000000000000000E7AB7900FBF4F000FBF4EF00FAF3
      EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000A56B5F00C1836C000000
      00000263BF002F45ED001031D300010A9500000000000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7AB7900FBF4F000FBF4
      EF00FAF3EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000A0675B00C183
      6C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900D1926D00D1926D00D192
      6D00D1926D00D1926D00D1926D00D1926D00D1926D00A56B5F00000000000000
      0000000000002732D0000C19B400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7AB7900CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800A0675B000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF8FFF8000000FFF1C01FC0000000
      E001000700000000C001000700000000C003000700000000C007000000000000
      C00F000000000000C00F000000000000C00F000000000000C00F000000010000
      C00F000000030000C00F000000070000C00F000000070000C00F8000801F0000
      FFFFF801F8FF0000FFFFFE03FFFF0000E3FFF33FFFFFFFFFF0FFE007C00380FF
      0001C000C003801F00018001C003801F00010000C003801F00010000C003801F
      00010000C003801F00018000C003800F0001E001C003800F0000F003C0038007
      0000F01FC00180030000E03FC00180010001E03FC00180010001C03FC0018001
      8003C07FC00F8061FFFFF8FFFFFFFFFFFE7FFFFF9FFFFFFFF07FFFFF0FFFFFFF
      C001F9FF07FFFC1FC001F0FF83FFF00FC001E07FC1FFC003C001C03FE10FC001
      C001821FF0038000C001C78FFC018000C001EFC7FC018000C001FFF3F8008001
      C001FFF9F8000001C001FFFFF8000F03C001FFFFFC01FFC3C001FFFFFC01FFF7
      F001FFFFFE03FFFFFC7FFFFFFF8FFFFFC001FFFFFFFFFFFFC0010007FFF98003
      C00100079FF98003C001000787E78003C0010007C7C78003C0010007F11F8003
      C0010007F81F8003C0010007FC7F8003C0010007F83F8003C0010007F19F8003
      C0010003E18F8003C0010001C7E78003C001000087FF8003C00300009FFF8007
      C00700109FFF800FFFFF0039FFFF801F00000000000000000000000000000000
      000000000000}
  end
  object ActionListPack: TActionList
    Images = PopupImageList
    Left = 680
    Top = 8
    object ActionSign: TAction
      Caption = #1055#1110#1076#1087#1080#1089#1072#1090#1080
      ImageIndex = 14
      OnExecute = ActionSignExecute
    end
    object ActionUnsign: TAction
      Caption = #1056#1086#1079#1087#1110#1076#1087#1080#1089#1072#1090#1080
      ImageIndex = 13
      OnExecute = ActionUnsignExecute
    end
  end
  object TimerEnter: TTimer
    Enabled = False
    OnTimer = TimerEnterTimer
    Left = 490
    Top = 9
  end
  object ClientDS: TDataSource
    DataSet = ClientDSet
    Left = 457
    Top = 128
  end
  object ClientDSet: TpFIBDataSet
    Database = Db
    Transaction = Transaction
    Left = 425
    Top = 112
    poSQLINT64ToBCD = True
  end
  object TypeStreetDSet: TpFIBDataSet
    Database = Db
    Transaction = Transaction
    Left = 84
    Top = 313
    poSQLINT64ToBCD = True
  end
  object TypeStreetDS: TDataSource
    DataSet = TypeStreetDSet
    Left = 112
    Top = 313
  end
  object RegionDSet: TpFIBDataSet
    Database = Db
    Transaction = Transaction
    Left = 144
    Top = 275
    poSQLINT64ToBCD = True
  end
  object RegionDS: TDataSource
    DataSet = RegionDSet
    Left = 166
    Top = 275
  end
  object StreetDSet: TpFIBDataSet
    Database = Db
    Transaction = Transaction
    Left = 171
    Top = 312
    poSQLINT64ToBCD = True
  end
  object StreetDS: TDataSource
    DataSet = StreetDSet
    Left = 202
    Top = 312
  end
  object CityAreaDSet: TpFIBDataSet
    Database = Db
    Transaction = Transaction
    Left = 366
    Top = 274
    poSQLINT64ToBCD = True
  end
  object CityAreaDS: TDataSource
    DataSet = CityAreaDSet
    Left = 347
    Top = 273
  end
  object FamSource: TDataSource
    DataSet = FamDSet
    Left = 213
    Top = 99
  end
  object FamDSet: TpFIBDataSet
    Database = Db
    Transaction = Transaction
    Left = 188
    Top = 98
    poSQLINT64ToBCD = True
  end
  object ImyaDSet: TpFIBDataSet
    Database = Db
    Transaction = Transaction
    Left = 148
    Top = 126
    poSQLINT64ToBCD = True
  end
  object ImyaSource: TDataSource
    DataSet = ImyaDSet
    Left = 176
    Top = 125
  end
  object PatrDSet: TpFIBDataSet
    Database = Db
    Transaction = Transaction
    Left = 231
    Top = 153
    poSQLINT64ToBCD = True
  end
  object PatrSource: TDataSource
    DataSet = PatrDSet
    Left = 257
    Top = 152
  end
  object CashTypeDSet: TpFIBDataSet
    Database = Db
    Transaction = Transaction
    Left = 464
    Top = 180
    poSQLINT64ToBCD = True
  end
  object CashTypeDS: TDataSource
    DataSet = CashTypeDSet
    Left = 440
    Top = 179
  end
  object KodKassaAppDSet: TpFIBDataSet
    Database = Db
    Transaction = Transaction
    Left = 416
    Top = 212
    poSQLINT64ToBCD = True
  end
  object KassaAppDSet: TpFIBDataSet
    Database = Db
    Transaction = Transaction
    Left = 160
    Top = 212
    poSQLINT64ToBCD = True
  end
  object KodKassaAppDS: TDataSource
    DataSet = KodKassaAppDSet
    Left = 448
    Top = 212
  end
  object KassaAppDS: TDataSource
    DataSet = KassaAppDSet
    Left = 184
    Top = 212
  end
  object DataSetGrRoot: TpFIBDataSet
    Database = Db
    Transaction = Transaction
    Left = 209
    Top = 13
    poSQLINT64ToBCD = True
  end
  object DataSourceCheckError: TDataSource
    DataSet = DataSetCheckErr
    Left = 743
    Top = 531
  end
  object DataSetCheckErr: TpFIBDataSet
    Database = Db
    Transaction = Transaction
    SelectSQL.Strings = (
      'select * from BS_SELECT_ERRORS_PACK_SIGN(1)')
    Left = 679
    Top = 520
    poSQLINT64ToBCD = True
    object DataSetCheckErrERROR_MESSAGE: TFIBStringField
      FieldName = 'ERROR_MESSAGE'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetCheckErrID_DT_ALLOC_PERS_AC: TFIBBCDField
      FieldName = 'ID_DT_ALLOC_PERS_AC'
      Size = 0
      RoundByScale = True
    end
    object DataSetCheckErrSUM_OPL: TFIBBCDField
      FieldName = 'SUM_OPL'
      Size = 2
      RoundByScale = True
    end
    object DataSetCheckErrSUM_ALLOC_ALL: TFIBBCDField
      FieldName = 'SUM_ALLOC_ALL'
      Size = 2
      RoundByScale = True
    end
    object DataSetCheckErrFLAG_ALLOC_ER: TFIBIntegerField
      FieldName = 'FLAG_ALLOC_ER'
    end
    object DataSetCheckErrCLIENT_ACCOUNT: TFIBBCDField
      FieldName = 'CLIENT_ACCOUNT'
      Size = 0
      RoundByScale = True
    end
    object DataSetCheckErrFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetCheckErrMONTH_SYS: TFIBIntegerField
      FieldName = 'MONTH_SYS'
    end
    object DataSetCheckErrYEAR_SYS: TFIBIntegerField
      FieldName = 'YEAR_SYS'
    end
    object DataSetCheckErrKOD_ERROR: TFIBIntegerField
      FieldName = 'KOD_ERROR'
    end
    object DataSetCheckErrNAME_ERROR: TFIBStringField
      FieldName = 'NAME_ERROR'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetCheckErrDATE_BEG_PERIOD_FOR_ACC: TFIBDateField
      FieldName = 'DATE_BEG_PERIOD_FOR_ACC'
    end
    object DataSetCheckErrDATE_END_PERIOD_FOR_ACC: TFIBDateField
      FieldName = 'DATE_END_PERIOD_FOR_ACC'
    end
    object DataSetCheckErrID_DOC_PROP: TFIBIntegerField
      FieldName = 'ID_DOC_PROP'
    end
  end
end
