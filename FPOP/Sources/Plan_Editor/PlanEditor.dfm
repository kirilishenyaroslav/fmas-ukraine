object PlanEditorForm: TPlanEditorForm
  Left = 214
  Top = 194
  Width = 762
  Height = 473
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1087#1083#1072#1085#1110#1074' '#1074#1080#1088#1086#1073#1085#1080#1094#1090#1074#1072
  Color = clBtnFace
  Constraints.MinHeight = 350
  Constraints.MinWidth = 450
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    754
    439)
  PixelsPerInch = 96
  TextHeight = 13
  object RightPanel: TPanel
    Left = 193
    Top = 0
    Width = 561
    Height = 419
    Align = alClient
    TabOrder = 0
    object PageControl: TPageControl
      Left = 1
      Top = 27
      Width = 559
      Height = 391
      ActivePage = TabSheetProd
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HotTrack = True
      MultiLine = True
      ParentFont = False
      Style = tsFlatButtons
      TabOrder = 0
      OnChange = PageControlChange
      OnChanging = PageControlChanging
      object TabSheetDep: TTabSheet
        Caption = #1059' '#1088#1086#1079#1088#1110#1079#1110' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1110#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        object DepTreeList: TcxTreeList
          Left = 0
          Top = 0
          Width = 551
          Height = 360
          Styles.StyleSheet = cxTreeListStyleSheet1
          Align = alClient
          Bands = <
            item
              Caption.AlignHorz = taCenter
              Caption.AlignVert = vaCenter
              Caption.Text = 'Band1'
              FixedKind = tlbfLeft
              Width = 280
            end
            item
              Caption.AlignHorz = taCenter
              Caption.AlignVert = vaCenter
              Caption.Text = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1088#1086#1076#1091#1082#1094#1110#1111' '#1090#1072' '#1090#1072#1088#1080#1092#1080
              Width = 126
            end
            item
              Caption.AlignHorz = taCenter
              Caption.AlignVert = vaCenter
              Caption.Text = #1042#1072#1088#1090#1110#1089#1090#1100' '#1087#1088#1086#1076#1091#1082#1094#1110#1111', '
              Width = 132
            end>
          BufferedPaint = False
          OptionsBehavior.Sorting = False
          OptionsCustomizing.BandCustomizing = False
          OptionsCustomizing.BandVertSizing = False
          OptionsCustomizing.ColumnCustomizing = False
          OptionsCustomizing.ColumnMoving = False
          OptionsCustomizing.ColumnVertSizing = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRect = False
          OptionsView.Bands = True
          OptionsView.FixedSeparatorColor = clBlack
          OptionsView.FixedSeparatorWidth = 1
          OptionsView.GridLines = tlglBoth
          PopupMenu = DepTreePopupMenu
          TabOrder = 0
          OnClick = DepTreeListClick
          OnCustomDrawCell = DepTreeListCustomDrawCell
          OnKeyPress = ProductTreeListKeyPress
          object id_Product_Column2: TcxTreeListColumn
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 3
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
          end
          object Name_Column2: TcxTreeListColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Caption.AlignHorz = taCenter
            Caption.AlignVert = vaCenter
            Caption.Text = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072' '#1090#1072' '#1076#1078#1077#1088#1077#1083#1072
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
            Width = 19390
          end
          object id_Cat_Cust_Column2: TcxTreeListColumn
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 4
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
          end
          object id_Object_Column2: TcxTreeListColumn
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 5
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
          end
          object Name_Unit_Meas_Column2: TcxTreeListColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.ReadOnly = True
            Caption.AlignHorz = taCenter
            Caption.AlignVert = vaCenter
            Caption.Text = #1054#1076'. '#1074#1080#1084#1110#1088#1091
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 1
            Position.RowIndex = 0
            Position.BandIndex = 0
            Width = 5190
          end
          object NeedCatCustColumn2: TcxTreeListColumn
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 6
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
          end
          object Need_Objects_Column2: TcxTreeListColumn
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 7
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
          end
          object id_Unit_Meas_Column2: TcxTreeListColumn
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 8
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
          end
          object Coefficient_Column2: TcxTreeListColumn
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 9
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
          end
          object id_Department_Column2: TcxTreeListColumn
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 10
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
          end
          object Display_Order_Column2: TcxTreeListColumn
            DataBinding.ValueType = 'String'
            Position.ColIndex = 2
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
            Width = 150
          end
        end
      end
      object TabSheetProd: TTabSheet
        Caption = #1059' '#1088#1086#1079#1088#1110#1079#1110' '#1074#1080#1076#1110#1074' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
        ImageIndex = 1
        object ProductTreeList: TcxTreeList
          Left = 0
          Top = 0
          Width = 551
          Height = 360
          Styles.StyleSheet = cxTreeListStyleSheet1
          Align = alClient
          Bands = <
            item
              Caption.AlignHorz = taCenter
              Caption.AlignVert = vaCenter
              Caption.Text = 'Band1'
              FixedKind = tlbfLeft
              Width = 280
            end
            item
              Caption.AlignHorz = taCenter
              Caption.AlignVert = vaCenter
              Caption.Text = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1088#1086#1076#1091#1082#1094#1110#1111' '#1090#1072' '#1090#1072#1088#1080#1092#1080
              Width = 127
            end
            item
              Caption.AlignHorz = taCenter
              Caption.AlignVert = vaCenter
              Caption.Text = #1042#1072#1088#1090#1110#1089#1090#1100' '#1087#1088#1086#1076#1091#1082#1094#1110#1111', '
              Width = 136
            end>
          BufferedPaint = False
          Color = clBtnFace
          LookAndFeel.Kind = lfUltraFlat
          OptionsBehavior.Sorting = False
          OptionsCustomizing.BandCustomizing = False
          OptionsCustomizing.BandVertSizing = False
          OptionsCustomizing.ColumnMoving = False
          OptionsCustomizing.ColumnVertSizing = False
          OptionsView.Bands = True
          OptionsView.FixedSeparatorColor = clBlack
          OptionsView.FixedSeparatorWidth = 1
          OptionsView.GridLines = tlglBoth
          ParentColor = False
          PopupMenu = ProductTreePopupMenu
          TabOrder = 0
          OnClick = ProductTreeListClick
          OnContextPopup = ProductTreeListContextPopup
          OnCustomDrawCell = ProductTreeListCustomDrawCell
          OnEdited = ProductTreeListEdited
          OnEditing = ProductTreeListEditing
          OnFocusedColumnChanged = ProductTreeListFocusedColumnChanged
          OnFocusedNodeChanged = ProductTreeListFocusedNodeChanged
          OnKeyPress = ProductTreeListKeyPress
          object id_Product_Column: TcxTreeListColumn
            DataBinding.ValueType = 'Integer'
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 3
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
            Width = 108
          end
          object Name_Column: TcxTreeListColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Caption.AlignHorz = taCenter
            Caption.AlignVert = vaCenter
            Caption.Text = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072' '#1090#1072' '#1076#1078#1077#1088#1077#1083#1072
            DataBinding.ValueType = 'String'
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
            Width = 9902
          end
          object id_Cat_Cust_Column: TcxTreeListColumn
            DataBinding.ValueType = 'Integer'
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 5
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
          end
          object id_Object_Column: TcxTreeListColumn
            DataBinding.ValueType = 'Integer'
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 6
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
          end
          object Name_Unit_Meas_Column: TcxTreeListColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.ReadOnly = True
            Caption.AlignHorz = taCenter
            Caption.AlignVert = vaCenter
            Caption.Text = #1054#1076'. '#1074#1080#1084#1110#1088#1091
            DataBinding.ValueType = 'String'
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 1
            Position.RowIndex = 0
            Position.BandIndex = 0
            Width = 9892
          end
          object NeedCatCustColumn: TcxTreeListColumn
            DataBinding.ValueType = 'Boolean'
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 7
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
          end
          object Need_Objects_Column: TcxTreeListColumn
            DataBinding.ValueType = 'Boolean'
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 8
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
          end
          object id_Unit_Meas_Column: TcxTreeListColumn
            DataBinding.ValueType = 'Integer'
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 9
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
          end
          object Coefficient_Column: TcxTreeListColumn
            DataBinding.ValueType = 'Integer'
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 2
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
            Width = 111
          end
          object id_Department_Column: TcxTreeListColumn
            DataBinding.ValueType = 'Integer'
            Options.Focusing = False
            Options.Sorting = False
            Position.ColIndex = 10
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
          end
          object Display_Order_Column: TcxTreeListColumn
            DataBinding.ValueType = 'String'
            Position.ColIndex = 4
            Position.RowIndex = 0
            Position.BandIndex = 0
            Visible = False
            Width = 104
          end
        end
      end
    end
    object PlanBarDockControl: TdxBarDockControl
      Left = 1
      Top = 1
      Width = 559
      Height = 26
      Align = dalTop
      AllowDocking = False
      BarManager = BarManager
      Color = 15451300
      ParentColor = False
      UseOwnColor = True
    end
  end
  object LeftPanel: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 419
    Align = alLeft
    TabOrder = 1
    object Label3: TLabel
      Left = 1
      Top = 27
      Width = 183
      Height = 13
      Align = alTop
      Caption = #1057#1087#1080#1089#1086#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Grid: TcxGrid
      Left = 1
      Top = 40
      Width = 183
      Height = 378
      Align = alClient
      PopupMenu = DocPopupMenu
      TabOrder = 0
      object GridDoc: TcxGridTableView
        OnKeyDown = GridDocKeyDown
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = GridDocFocusedRecordChanged
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = cxGridTableViewStyleSheet1
        object id_Doc_SG: TcxGridColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
        end
        object id_Type_Doc_SG: TcxGridColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
        end
        object Name_Doc_SG: TcxGridColumn
          Caption = #1053#1072#1079#1074#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 60
        end
        object Date_Doc_SG: TcxGridColumn
          Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.ReadOnly = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 87
        end
        object Date_Reg_SG: TcxGridColumn
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ReadOnly = True
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
        end
        object id_Unit_Meas_SG: TcxGridColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
        end
        object Name_Unit_Meas_SG: TcxGridColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
        end
        object Coefficient_SG: TcxGridColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
        end
        object is_Signed_SG: TcxGridColumn
          Caption = #1055#1110#1076#1087#1080#1089#1072#1085#1086
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 34
        end
      end
      object GridLevel: TcxGridLevel
        GridView = GridDoc
      end
    end
    object DocBarDockControl: TdxBarDockControl
      Left = 1
      Top = 1
      Width = 183
      Height = 26
      Align = dalTop
      BarManager = BarManager
      Color = 15451300
      ParentColor = False
      UseOwnColor = True
    end
  end
  object Splitter: TcxSplitter
    Left = 185
    Top = 0
    Width = 8
    Height = 419
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 40
    HotZone.ShadowStartColor = clMoneyGreen
    AutoSnap = True
    ResizeUpdate = True
    Control = LeftPanel
  end
  object WaitPanel: TPanel
    Left = 196
    Top = 204
    Width = 300
    Height = 100
    Anchors = [akRight, akBottom]
    TabOrder = 3
    Visible = False
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 300
      Height = 100
      Picture.Data = {
        07544269746D6170C65F0100424DC65F01000000000036000000280000002C01
        0000640000000100180000000000905F0100120B0000120B0000000000000000
        00009A41099A41099A41099A41099A41099A41099A41099A41099A41099A4109
        9A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41
        099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A
        41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A4109
        9A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41
        099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A
        41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A4109
        9A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41
        099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A
        41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A4109
        9A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41
        099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A
        41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A4109
        9A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41
        099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A
        41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A4109
        9A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41
        099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A
        41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A4109
        9A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41
        099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A
        41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A4109
        9A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41
        099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A
        41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A4109
        9A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41
        099A41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A
        41099A41099A41099A41099A41099A41099A41099A41099A41099A41099A4109
        9A41099A41099E4309B75A14B85A14B85A14B85A14B85A14B85A14B85A14B85A
        14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B8
        5A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14
        B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A
        14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B8
        5A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14
        B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A
        14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B8
        5A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14
        B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A
        14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B8
        5A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14
        B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A
        14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B8
        5A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14
        B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A
        14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B8
        5A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14
        B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A
        14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B8
        5A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14
        B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A
        14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B8
        5A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14
        B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A
        14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B8
        5A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14
        B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B85A14B75A
        14B55914B559149A4109A6460ACC6416E48E26E58F26E58F26E58F26E58F26E5
        8F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26
        E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F
        26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E5
        8F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26
        E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F
        26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E5
        8F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26
        E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F
        26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E5
        8F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26
        E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F
        26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E5
        8F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26
        E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F
        26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E5
        8F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26
        E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F
        26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E5
        8F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26
        E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F
        26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E5
        8F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26
        E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F
        26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E5
        8F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26
        E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F
        26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E58F26E5
        8F26E28D25D38323B659149A4109AA480ADC6C18FB9C2AF5AF2FF5AF2FF5AF2F
        F5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF
        2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5
        AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2F
        F5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF
        2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5
        AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2F
        F5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF
        2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5
        AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2F
        F5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF
        2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5
        AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2F
        F5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF
        2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5
        AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2F
        F5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF
        2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5
        AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2F
        F5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF
        2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5
        AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2F
        F5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF
        2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5
        AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2F
        F5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF
        2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5
        AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2FF5AF2F
        F5AF2FF5AF2FF3AE2FE68F26BA5B149A4109AA480ADF6E18FEAA44F8B130E699
        24E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E6
        9924E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924
        E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E699
        24E69924E69924E69924E59824E59824E59824E49824E29723E29723E19523E1
        9523E19523E09523E09523E09523E09523E09523E09523E09523E19523E19523
        E19623E29723E49824E59824E59824E69924E69924E69924E69924E69924E699
        24E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E6
        9924E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924
        E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E699
        24E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E6
        9924E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924
        E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E699
        24E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E6
        9924E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924
        E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E699
        24E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E6
        9924E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924
        E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E699
        24E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E6
        9924E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924
        E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E699
        24E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E6
        9924E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924
        E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E699
        24E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E6
        9924E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924
        E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E699
        24E69924E69924E69924F6B030EA9227BB5C149A4109AA480ADF6E18FEAA44F8
        B130E69924CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212
        CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF72
        12CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF
        7212CF7212CE7212CE7212CD7112CC7012CA6F12C86E11C66D11C46C11C16A11
        C06A11BF6911BE6911BD6810BD6810BD6810BD6810BD6810BD6810BE6911BF69
        11C06A11C16A11C46C11C76E11CA6F12CC7012CD7112CE7212CF7212CF7212CF
        7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212
        CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF72
        12CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF
        7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212
        CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF72
        12CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF
        7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212
        CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF72
        12CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF
        7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212
        CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF72
        12CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF
        7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212
        CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF72
        12CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF
        7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212
        CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF72
        12CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF
        7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212
        CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF72
        12CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF
        7212CF7212CF7212CF7212E69924F6B030EA9227BB5C149A4109AA480ADF6E18
        FEAA44F8B130E69924CF7212623D18542C045B30068A5D30CE9F70F3DAC1F9F7
        F7FDD9B6B9865374410E67340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016533016533016332016231016031015E30015C2E015A2D
        01592D01572C01562C01562B01562B01562B01562B01562B01562B01562B0156
        2B01562B01572C01592D015B2E015D2F015F3001623101633201653301663301
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        673401673401673401673401CF7212E69924F6B030EA9227BB5C149A4109AA48
        0ADF6E18FEAA44F8B130E69924CF72127C5833633B14572C02673A0D9C6D3EE4
        B383F9E7D8FDFBFBFECB98A875426B3805673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        016734016634016533016432016232016031015E2F015B2E01582D01562B0152
        2A015028014E27014C27014B26014A26014A25014A25014A25014A25014A2501
        4A25014A26014B26014C26014E2701512901542B01582C015B2E015E30016131
        0163320165330165330167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401683502673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016835
        0267340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401673401673401673401673401CF7212E69924F6B030EA9227BB5C149A
        4109AA480ADF6E18FEAA44F8B130E69924CF721296714D7E562E643A0F5B2E01
        744516AF7F4EF6C492FDF2E8FFF8F3E8B5829764316734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        34016634016533016432016231015F30015C2E01592D01552B015229014E2701
        4A25014623014322014020013E1F013D1F013B1E013C1F013B1E013B1E013B1E
        013B1E013B1E013B1E013C1E013E1F014121014422014825014D270152290156
        2B015A2D015D2F01603101633201653301663301673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401CF7212E69924F6B030EA9227
        BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212AB86629D754D7E54
        2965380B5F3001835221C39160FDD4ADFFFAF6FFEFE0D5A26F88552267340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016533016433016232015F30015C2E01582C01532A014E28014A25014523
        014121013D1F01391D01361B01331A003119003018003018002F18002F18002F
        18002F18002F18002F18002F1800301800311900341A01371C013B1E01402001
        4523014B2601502801552B015A2D015E2F016131016332016533016634016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340168350267340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        673401673401673401673401673401673401673401673401CF7212E69924F6B0
        30EA9227BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212B7997BB3
        8C64A0754A7C4F22643506663505915F2DD5A370FFE0C2FFFDFDFFE2C5C28F5C
        7A47146734016734016734016734016734016734016734016734016734016734
        016634016533016332016031015C2E01582C01522A014D27014724014221013D
        1F01381C01341A013018002E17002B1600291500281400271400261300261300
        2613002613002613002613002613002613002714002814002A15002C16003018
        00341A01391D013E1F014422014A2501502801562B015A2E015F300162320165
        3301663301673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401673401673401673401673401673401673401673401673401CF7212E6
        9924F6B030EA9227BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212
        B7A798C7A27CB98F649E71447A4B1C6433036D3C0AA26F3DE6B380FFE9D5FFFE
        FEFFD4A9B07D4A703D0A67340167340167340167340167340167340167340167
        34016533016433016131015E3001592D01542A014E27014724014121013B1E01
        38210A3829173C342844433D5354535B5B5A62605D6D6764726B66776F6B7B73
        6E7B726D766E6A716B676966636262605758563B352E26180A21110022110024
        12002714002A15002E1700321900371C013E1F014422014B2601522901582C01
        5D2F016131016332016533016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        CF7212E69924F6B030EA9227BB5C149A4109AA480ADF6E18FEAA44F8B130E699
        24CF7212B7B3AEC7B19DD1A67CBC8F629A6B3C764615653301774412B17E4BF6
        C390FFF2E5FFFBF8F3C08D9F6C39673401673401673401673401673401673401
        6734016533016332016031015C2E01572C015029014925014221013B20043B2A
        183D372F4847435D59576D6662827873978B85A69993B2A59FBAAEA8BFB4AEC1
        B6B1C2B8B2C2B8B2C1B7B2BFB3AEB9ADA7AFA39C9F938E8E847E6B655F423C34
        291F141F10002111002312002613002915002D1700321900391D013F20014724
        014E2701552B015B2E015F300163320165330166340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401CF7212E69924F6B030EA9227BB5C149A4109AA480ADF6E18FEAA44F8
        B130E69924CF7212B7B7B6C7BFB8D5B9A0D6A97CBD8E5F95643372400F653300
        83501DC08D5AFFD0A2FFF7F1FFF3E9DEAB788F5C296734016734016734016734
        016634016533016332015F30015A2D01542A014D27014524023E281140362A4E
        4A45635C597F746E998B84AEA099B9ADA7C2B7B2C7BEBAC9C2BDCAC3BFCBC4C1
        CBC5C1CCC5C2CCC6C2CCC6C2CBC6C2CCC6C1CCC5C2CBC5C1CBC3BEC7BFBABFB6
        B0B1A49F9288835E5853362E252415082010002211002513002915002E170034
        1A013B1E014322014B2601522A01592D015E3001623201653301663401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401683502673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016835026734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401CF7212E69924F6B030EA9227BB5C149A4109AA480ADF6E18
        FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5C9BEE1BF9ED8A97ABB8A5A8F5D
        2B6F3D0A6835028E5B28CF9C69FFDBB8FFFCF9FFE9D5CB9865814E1B67340167
        34016633016533016232015E3001582D015229014A250142290F453E36625B57
        7D70689A8A82B2A39CBDB3AEC3BCB7C8C2BECAC5C1CDC6C2CDC7C4CDC8C4CEC9
        C5CFC9C5CEC9C5CEC9C4CEC9C5CEC9C4CEC9C4CEC9C4CEC9C4CEC9C5CEC9C5CE
        C8C4CDC8C4CCC5C2CAC2BEC3B7B2A79B95716964352E251E1001201000221100
        2613002A1500301800371C01402001482501502901582C015E2F016232016533
        0166340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        673401673401673401673401CF7212E69924F6B030EA9227BB5C149A4109AA48
        0ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D4D4E1D0C0EBC29AD7
        A776B583518855236A37046E3B089C6936DFAC79FFE5CCFFFEFEFFDBB8B98653
        75420F6633016533016131015D2F01572C01502801482706473B2C615A558373
        6B9C8B83AFA39CBDB4AFC6BFBBCAC4C0CCC6C3CDC7C4CDC8C5CDC8C6CEC8C6CD
        C8C5CDC8C5CDC8C4CDC8C5CEC8C4CDC8C4CDC8C4CDC9C4CDC8C4CEC8C4CEC9C4
        CDC8C4CEC8C4CDC8C4CEC9C4CDC8C4CBC6C2CAC3BFC2B8B2A4989358524C281D
        111F0F002111002412002814002E1700351B013D1F014623014F2801572C015D
        2F01623201653301663401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401673401673401673401673401CF7212E69924F6B030EA9227BB5C149A
        4109AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1DDDB
        EBD5BFF2C191D4A270AC7946804D1A68350274410EA97643EEBB88FFEDDDFFFD
        FDFCC996A573406837056131015C2F01562B014E28014D39225E585180716A99
        867EA99B94BDB4AFC6C0BCCBC4C1CDC6C4CEC8C4CFC9C5CEC9C5CEC9C6CEC9C6
        CDC9C6CDC9C6CDC9C5CEC8C6CEC9C5CEC9C5CDC8C6CDC8C5CDC8C5CDC8C5CEC9
        C5CEC9C5CDC8C5CEC8C5CDC8C4CEC8C5CEC9C5CDC9C5CEC8C5CDC7C4CAC3BEBB
        B0AA887F7A423D352315072010002211002613002C1600331A003C1E01452301
        4F2801572C015E30016232016533016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401CF7212E69924F6B030EA9227
        BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5
        D5E1E1E1EBE4DCF3D6BBF1BF8ECF9D6AA26F3C7845126633007E4B18B88552FD
        CA97FEF3E9FDF6F1E3B17F8F5F2E5C2E01562B01502C085B4F417C706B8E7C73
        A3948CB8ADA7C6BEBACBC5C1CDC8C5CEC9C6CFCAC7CFC9C7CEC9C6CEC9C6CEC9
        C6CFC9C6CEC9C6CEC9C5CEC9C5CDC8C4CEC9C4CEC9C5CECAC6CFCAC6D0CBC7CF
        CBC7CFCAC7CEC9C6CDC9C5CDC8C5CCC8C4CDC9C5CDC9C5CEC9C6CEC9C6CEC9C6
        CDC9C5CCC6C3C9C0BBAA9F99605E582A1F131F10002111002513002B16003219
        003B1E01462301502801582C015F300163320165330167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        673401673401673401673401673401673401673401673401CF7212E69924F6B0
        30EA9227BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7
        C7C7D5D5D5E1E1E1EBEBEBF3E7DCF9D6B4ECBA87C99663976431723F0C673401
        895623C79462FDD4ADF9F4F0F1E2D4BF916471471C5638196C645B86766F9381
        79A89A94C1B8B3CAC3BFCCC6C3CFC9C5D0CAC6CECAC6CFCAC6CFCAC6CECAC6CE
        CAC6CECAC6CECAC6CEC9C6CEC9C7D3CFCCD9D4D1DBD6D2DBD7D3DBD5D2DAD4D1
        D8D2CFD9D4CFDAD6D1DCD7D4DCD7D4D9D5D2D4D0CDCFC9C6CDC8C4CEC9C4CEC9
        C5CDC9C5CDC9C5CEC9C6CDC9C5CBC3BFB4A8A2797670362E231E0F0021110024
        12002A15003219003C1E01472401512901592D01603001643201663301673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401673401673401673401673401673401673401673401673401CF7212E6
        9924F6B030EA9227BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212
        B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9E8DAFDD3ABE5B27FBE8B588D5A
        276D3A076B380594622FD3A16FF3D5B9E7E4E3D6BEA5927B617B746E89787096
        867DAFA39EC4BBB8CCC6C1CEC9C5CFC9C6CFCBC7CFCBC7CFCAC7CFCAC7CFCAC7
        CFCAC6CECAC6D1CCC9D6D1CDDBD6D3D9D3CFC6C0BAADA6A19E97928B837C7870
        686B6562655E5967615E706A647F787097918BA8A29DC0BAB4D9D4CFDDD8D5D6
        D0CECFCAC7CDC8C5CEC9C6CEC9C6CEC9C6CEC9C6CBC3C0BBAFA98C888548443B
        1E0F002010002412002B1600341A013E1F01492501532A015B2E016131016533
        0166340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        016734016734016734016734012D50731A59991A599967340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        CF7212E69924F6B030EA9227BB5C149A4109AA480ADF6E18FEAA44F8B130E699
        24CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F6F5FDE7D3FFCF9FDE
        AB78B3804D84511E6936036F3D0B9C6B3AD3A475D9C6B5B5BABA887E798B786F
        988880B8ACA7C8C2BECDC8C4CFCAC6D1CBC8D1CCC9D0CBC8D0CBC8D0CBC8CFCB
        C7CECBC6CFCBC7DAD5D2DAD4CFBEB7B08A827C5B544E37312D262120221E1D1F
        1A191E19191E19191E1A191E19191E191A1F1919211C1B241F1E312B2858514B
        908981C6C0BADEDAD6D7D2D0CDC9C5CECAC6CECAC6CFCAC7CFC9C6CEC8C5BFB4
        AF96918E4A453C1E0F002111002613002C1600351B014020014B2601552B015D
        2F01623201653301673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        340167340161370E4D4134543D2767340167340167340167340167340161370E
        4D4134543D276734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        34016734016734016734016734016734011A59990066CC0066CC673401673401
        6734016734016734016734016734016734016734016734016734016734016137
        0E4D4134543D2767340167340167340167340167340161370E4D4134543D2767
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401CF7212E69924F6B030EA9227BB5C149A4109AA480ADF6E18FEAA44F8
        B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F9F9FDF7F2
        FFE3C9FAC794D5A26FA674417A4715643201704112996D41B9A7918C847F8A78
        6F978880B7ACA6CAC3BECEC9C5D1CBC8D0CCC9D1CBC9D1CBC9D1CCC9D1CCC8D1
        CCC8D0CBC8D7D1CFDDD8D5B0AAA3645E57302B271C17181E1A1B242021282323
        282424282424272325262224232025222025211F26211F262220252320242420
        221E1A1C1C171737312D7D776EC8C2BCDFDBD7D3CECBCFCAC6CECAC6CFCAC7CF
        CBC7CDC7C3BBAFAA93918D3C34281F0F002211002714002E1700381C01432201
        4E2801582C015F30016332016633016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734014D41340066CC1A59996734016734016734016734016835
        024D41340066CC1A599967340167340167340167340167340167340168350267
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734011A59990066CC0066CC6734
        0167340167340167340167340167340167340167340167340167340167340167
        34014D41340066CC1A59996734016734016734016734016734014D41340066CC
        1A59996734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016835026734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401CF7212E69924F6B030EA9227BB5C149A4109AA480ADF6E18
        FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F9
        F9FDFDFDFFF4EAFFDEBDF2BF8CCB99669968366F3E0E5A2D008B79628E868289
        766E978780B8ADA7C9C2BFCFC9C6D1CCC9D1CCCAD1CCCAD1CDC9D1CCC9D1CCC9
        D0CCC9D2CECBDDD8D5C6BFBA78716A2924201B18182420212A25252A25242A26
        252522261F1E271C1C26201F252D26213A2F1E44361D4A391D48391D3F331E34
        2B1F2521241D1D271F1D281E1B201D171638312D8C847DD5D1CCDCD8D5CFCBC7
        CFCBC7CFCAC8CFCAC7CDC6C2B6ABA58B8B882D21151F10002211002814003119
        003B1E01472401522A015B2E0161310165330167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        016734016734016734016734014D41340066CC0663BF67340167340167340167
        34016734013A4A5A0066CC1A5999673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        016734016734016734016734016734016734016734016734011A59990066CC00
        66CC673401673401673401673401673401673401673401673401673401673401
        6734016734014D41340066CC0663BF6734016734016734016734016734013A4A
        5A0066CC1A599967340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        673401673401673401673401CF7212E69924F6B030EA9227BB5C149A4109AA48
        0ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3
        F3F3F9F9F9FDFDFDFFFFFFFFF1E4FED8B2E6B482BB8A5A84562889775F8F8884
        88766D94847DB9AFA9CBC5C1D0CAC8D1CDCAD2CDCAD1CDC9D1CDC9D1CDC9D1CD
        C9D1CCC9D6D1CFDBD5D1928B83332D291D18172520212A252529252529252424
        21251B1B272925224A3A1A795911A7760AC68B03D79600DF9B00E29D00E19C00
        DC9900D29300B47F0784600F523F192924241C1C281F1C201C17174A443DB2AC
        A3E0DCD8D1CDCAD0CBC8D0CBC9D0CCC8CEC7C3B1A7A284868120120420100024
        12002B1600351B014020014C2601562C015E3001633201663301673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        016734016734016734016734015A3A1A4D41344D41345A3A1A67340167340167
        3401673401543D274D41344D413461370E4D41340066CC0066CC4D41344D4134
        4D41344D41344D41342753800066CC1A5999673401673401673401543D27344D
        66344D6640474D61370E67340167340167340167340167340167340167340167
        340167340161370E4D41344D41344D41344D41344D41344D41344D4134673401
        67340167340161370E4D41344D41345A3A1A6734016734016734014D41344D41
        34543D2767340167340167340167340161370E40474D344D66344D664D413467
        340167340167340167340161370E4D41344E41355A3A1A6734016734011A5999
        0066CC0066CC67340140474D344D6640474D61370E6734016734016734016734
        016734016734016734014D41340066CC0066CC4D41344D41344D41344D41344D
        41342753800066CC1A59996734016734015A3A1A344D66344D6640474D673401
        5A3A1A4D41344D413461370E6734015A3A1A4D41344D413461370E6734016734
        0161370E4D41344D41345A3A1A6734016734014D41344D4134543D2767340167
        3401673401543D274D41344D41346734015A3A1A4D41344D4134673401673401
        67340161370E4D41344D4134543D276734016734016734016734016734016734
        015A3A1A4D41344D41345A3A1A67340167340167340167340167340161370E4E
        41354D41344D4134673401673401673401673401673401673401673401673401
        4D41344D41344D413461370E6734016734016734016734016734016734016734
        01673401673401673401673401673401CF7212E69924F6B030EA9227BB5C149A
        4109AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1
        EBEBEBF3F3F3F9F9F9FDFDFDFFFFFFFFFDFDFDEAD8F7CCA2D1A273AC90709C9A
        9688756C8F7F76B1A59ECAC3BFD1CAC8D2CDCAD3CECAD2CECAD3CECAD2CDCAD2
        CDCAD2CDCADBD7D3D7D2CB787169201B1A211E1E2A25262A25252A2424232026
        1B1B27362D1F7C5B12BF8605DF9B00EDA400EEA500E9A200E59F00E59E00E39D
        00E39D00E49F00E7A000ECA300EEA500E49E00BC85067053142C27221B1C2719
        171C2A2421938C85E3DEDBD4D0CDCFCBC7D0CCC8D0CBC8C9C1BDA8A19D73736E
        1E0F002111002613002E1700391D014523015129015A2E016131016533016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401344D660066CC0066CC344D66673401
        6734016734016734011A59990066CC0066CC4D41344D41340066CC0066CC0066
        CC0066CC0066CC0066CC0066CC0066CC0066CC1A59996734016734012D507300
        66CC0066CC0066CC0066CC0D60B3543D27673401673401673401673401673401
        6734016734016734014D41340066CC0066CC0066CC0066CC0066CC0066CC0066
        CC135DA661370E6734014D41340066CC0066CC344D6667340167340167340100
        66CC0066CC1A5999673401673401673401543D270D60B30066CC0066CC0066CC
        0066CC20568C61370E6734016734014D41340066CC0066CC344D666734016734
        011A59990066CC0066CC135DA60066CC0066CC0066CC135DA661370E67340167
        34016734016734016734016734014D41340066CC0066CC0066CC0066CC0066CC
        0066CC0066CC0066CC0066CC1A5999673401543D270663BF0066CC0066CC0066
        CC20568C344D660066CC0066CC4D4134673401344D660066CC0066CC4D413467
        34016734014D41340066CC0066CC344D666734016734010066CC0066CC1A5999
        6734016734016734011A59990066CC0066CC67340140474D0066CC0066CC4D41
        346734016734012753800066CC0066CC27538067340167340167340167340167
        3401673401344D660066CC0066CC344D66673401673401673401673401673401
        4D41340066CC0066CC0066CC6734016734016734016734016734016734016734
        016734010066CC0066CC0066CC4D413467340167340167340167340167340167
        3401673401673401673401673401673401673401CF7212E69924F6B030EA9227
        BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5
        D5E1E1E1EBEBEBF3F3F3F9F9F9FDFDFDFFFFFFFEFEFEFBF7F4F2DBC4E2BB92AA
        A8A088776F8C7A73AA9C96C8BFBCD0CAC7D3CECBD3CECCD3CECBD2CECBD3CECB
        D3CECAD2CECADBD7D3C6BFB95C544D1B16162622222A25252925252824241D1C
        27302921825E0FD49401F0A600EBA300E69F00E29D00E09C00E09C00E19D00E1
        9C00E19C00E19C00E19D00E09C00E09C00E19C00E59F00ECA400EFA500C98D04
        705213292524171621201B19878079DBD7D2D5D1CED1CBC9D1CDC9D0CBC8C0B5
        B0A1A19F463F341F10002312002A1500331A003F20014B2601562B015E300163
        3201663401673401673401673401673401673401673401673401673401673401
        673401673401673401673401673401673401673401344D660066CC0066CC2D50
        736734016734016734016734011A59990066CC0066CC4D41344D41340066CC00
        66CC0066CC0066CC0066CC0066CC0066CC0066CC0066CC1A5999673401474441
        0066CC0066CC0066CC0066CC0066CC0066CC135DA66734016734016734016734
        016734016734016734016734014D41340066CC0066CC0066CC0066CC0066CC00
        66CC0066CC0066CC2753806734014D41340066CC0066CC135DA6673401673401
        6734010066CC0066CC1A5999673401673401673401135DA60066CC0066CC0066
        CC0066CC0066CC0066CC2D50736734016734014D41340066CC0066CC344D6667
        34016734011A59990066CC0066CC0066CC0066CC0066CC0066CC0066CC344D66
        6734016734016734016734016734016734014D41340066CC0066CC0066CC0066
        CC0066CC0066CC0066CC0066CC0066CC1A59996734010D60B30066CC0066CC00
        66CC0066CC0066CC0066CC0066CC0066CC61370E673401344D660066CC0066CC
        4D41346734016734014D41340066CC0066CC344D666734016734010066CC0066
        CC0663BF5A3A1A6734016734011A59990066CC0066CC6734016734010D60B300
        66CC1A599967340161370E0663BF0066CC0066CC4D4134673401673401673401
        673401673401673401344D660066CC0066CC344D666734016734016734016734
        016734014D41340066CC0066CC0066CC67340167340167340167340167340167
        34016734016734010066CC0066CC0066CC4D4134673401673401673401673401
        673401673401673401673401673401673401673401673401CF7212E69924F6B0
        30EA9227BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7
        C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F9F9FDFDFDFFFFFFFDFDFDF6F6F6EBE4DC
        C3C0B9897B7389786FA4968EC5BDB8D1CAC7D4CFCCD4CFCCD3CFCCD4CFCCD3CF
        CCD3CFCCD3CECBDEDAD8BFB8B03F39331D19192925252924242A24242421251C
        1C25634A16CA8D04F0A600E7A000E19C00E19C00E19C00E19C00E19D00E19C00
        E19C00E19C00E19C00E19D00E19C00E19C00E19C00E29D00E19C00E19C00E19C
        00E9A100EDA500BD850554411A1818241915186D665EDBD6D1D4D1CDD1CCC9D1
        CDCACFC9C5B4ABA683847F1F11022010002613002E1700391D01452301522901
        5B2E016232026533016734016734016734016734016734016734016734016734
        01673401673401673401673401673401673401673401673401344D660066CC00
        66CC0663BF61370E6734016734016734011A59990066CC0066CC4D4134543D27
        135DA60066CC0066CC135DA61A59991A59990066CC0066CC0663BF2D50736734
        010D60B30066CC0066CC1A59992D50730066CC0066CC0066CC40474D67340167
        34016734016734016734016734016734014D41340066CC0066CC0D60B31A5999
        1A59990D60B30066CC0066CC0663BF6734014D41340066CC0066CC0066CC3A4A
        5A6734016734010066CC0066CC1A599967340167340140474D0066CC0066CC00
        66CC2753801A59990066CC0066CC0066CC5A3A1A6734014D41340066CC0066CC
        344D666734016734011A59990066CC0066CC0066CC0D60B30663BF0066CC0066
        CC0D60B3673401673401673401673401673401673401543D27135DA60066CC00
        66CC135DA61A59991A59990066CC0066CC0663BF2D50735A3A1A0066CC0066CC
        0066CC2753802753800066CC0066CC0066CC0066CC673401673401344D660066
        CC0066CC4D41346734016734014D41340066CC0066CC344D6667340167340100
        66CC0066CC0066CC20568C6734016734011A59990066CC0066CC673401673401
        3A4A5A0066CC0066CC543D273A4A5A0066CC0066CC135DA66734016734016734
        01673401673401673401673401344D660066CC0066CC344D6667340167340167
        34016734016734014D41340066CC0066CC0066CC673401673401673401673401
        6734016734016734016734010066CC0066CC0066CC4D41346734016734016734
        01673401673401673401673401673401673401673401673401673401CF7212E6
        9924F6B030EA9227BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212
        B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F9F9FDFDFDFEFEFEFBFBFBF2F2
        F2D9E1E291878289766E95847DBEB5B0CFC9C6D4CECBD4D0CDD5D0CDD4D0CDD4
        D0CDD5D0CDD3CFCCDED9D8C0B9B14139341C18192A25252924242A2625201F27
        24212592690DEBA400ECA300E19D00E09C00E19C00E19D00E19D00E19D00E19D
        00E19C00E19C00E19C00E19C00E19C00E19C00E19D00E19C00E19D00E19C00E1
        9D00E19C00E09D00E29D00EDA400E7A000835F111C1B25120F14777169E1DDDA
        D3CECDD2CDCAD1CDCACCC4BFA7A39F5651481F0F002312002A1500341A014020
        014C2701572C015F300164330167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401344D66
        0066CC0066CC0066CC344D666734016734016734011A59990066CC0066CC4D41
        346734015A3A1A0066CC0066CC4D41346734016734010066CC0066CC27538067
        3401543D270066CC0066CC135DA66734016734013A4A5A0066CC0066CC20568C
        6734016734016734016734016734016734016734014D41340066CC0066CC344D
        6667340167340161370E0663BF0066CC0066CC6734014D41340066CC0066CC00
        66CC0663BF61370E6734010066CC0066CC1A59996734016734012753800066CC
        0066CC3A4A5A67340167340120568C0066CC0066CC40474D6734014D41340066
        CC0066CC344D666734016734011A59990066CC0066CC1A599961370E61370E06
        63BF0066CC0066CC543D276734016734016734016734016734016734015A3A1A
        0066CC0066CC4D41346734016734010066CC0066CC2753806734014D41340066
        CC0066CC2753806734016734013A4A5A0066CC0066CC0066CC67340167340134
        4D660066CC0066CC4D41346734016734014D41340066CC0066CC344D66673401
        6734010066CC0066CC0066CC0066CC4D41346734011A59990066CC0066CC6734
        0167340161370E0663BF0066CC2753800D60B30066CC0066CC40474D67340167
        340167340167340167340167340167340140474D1A59991A599940474D673401
        673401683502673401673401543D271A59991A59991A59996734016734016734
        016734016734016734016734016734011A59991A59991A5999543D2767340167
        3401673401673401673401673401673401673401673401673401673401673401
        CF7212E69924F6B030EA9227BB5C149A4109AA480ADF6E18FEAA44F8B130E699
        24CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F9F9FDFDFDFDFDFDF8
        F8F8E8ECEDACAFAF8B786F8D7C74AFA39CCDC7C3D3CECBD5D0CED4D1CDD5D0CE
        D6D1CED5D0CED5D0CEDED9D7BFB9B1423C361D191A2924252924242925241C1C
        27352C1EA97809F1A700E49F00E19C00E19C00E19D00E19D00E19C00E19C00E1
        9D00E19D00E19C00E19D00E19C00E29D00E19D00E19D00E29D00E19D00E19C00
        E29D00E29D00E19D00E19D00E19C00E19C00E6A100EFA500996E0C29231E1B18
        1E9D968FE1DDDAD2CDCAD2CECBD1CCC9BBB2AC9A9E9B2416082111002714002F
        18003B1E01482401542A015D2F01633201663301673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01344D660066CC0066CC0066CC0663BF61370E6734016734011A59990066CC00
        66CC4D41346734016734010066CC0066CC3A4A5A6734014D41340066CC0066CC
        344D6667340140474D0066CC0066CC3A4A5A673401673401673401344D663A4A
        5A543D276734016734016734016734016734016734016734014D41340066CC00
        66CC344D666734016734016734011A59990066CC0066CC6734014D41340066CC
        0066CC0066CC0066CC2D50736734010066CC0066CC1A5999673401673401135D
        A60066CC0066CC61370E6734016734014D41340066CC0066CC2D50736734014D
        41340066CC0066CC344D666734016734011A59990066CC0066CC543D27673401
        6734012D50730066CC0066CC40474D6734016734016734016734016734016734
        016734010066CC0066CC3A4A5A6734014D41340066CC0066CC344D666734014D
        41340066CC0066CC2D50736734016734016734010663BF0066CC0066CC673401
        673401344D660066CC0066CC4D41346734016734014D41340066CC0066CC344D
        666734016734010066CC0066CC0066CC0066CC135DA66734011A59990066CC00
        66CC673401673401673401344D660066CC0066CC0066CC0066CC0663BF673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401CF7212E69924F6B030EA9227BB5C149A4109AA480ADF6E18FEAA44F8
        B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F9F9FCFCFC
        FBFBFBF3F3F3D1D9DA90817A89786FA2938CC7BFBBD4CFCBD6D2CFD6D1CFD6D1
        CED6D1CFD5D1CED4D0CDDDD8D6CBC5C04039341E191A2A25252925252A25241D
        1C274E3C1AD09102EFA500E19C00E19C00E19C00E19C00E19D00E19C00E19D00
        E19C00E19C00E19C00E19C00E19C00E19D00E19D00E19C00E19C00E19C00E19C
        00E19C00E29D00E29D00E19C00E19C00E19C00E19C00E19C00E29D00F0A700BC
        85072C241D232022B6AFA8DFDAD8D2CDCAD3CFCBCAC3BFB4AFAB5B574E1F1000
        2412002C1600361B014322015028015A2D016131016533016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401344D660066CC0066CC0066CC0066CC344D666734016734011A5999
        0066CC0066CC4D41346835026734011A59990066CC2D507367340140474D0066
        CC0066CC4D4134673401344D660066CC0066CC4D413467340167340167340167
        34016734016734016734016734016734016734016734016734016734014D4134
        0066CC0066CC344D666734016734014D41340066CC0066CC20568C6734014D41
        340066CC0066CC0066CC0066CC0066CC543D270066CC0066CC1A599967340167
        34010066CC0066CC135DA667340167340167340161370E0066CC0066CC1A5999
        6734014D41340066CC0066CC344D666734016734011A59990066CC0066CC6734
        016734016734014744410066CC0066CC344D6667340167340167340167340167
        34016734016734011A59990066CC2D507367340140474D0066CC0066CC4D4134
        6734015A3A1A0066CC0066CC0663BF543D276734016734011A59990066CC0066
        CC673401673401344D660066CC0066CC275380344D66344D662753800066CC00
        66CC344D666734016734010066CC0066CC0066CC0066CC0066CC3A4A5A1A5999
        0066CC0066CC67340167340167340161370E0663BF0066CC0066CC0066CC344D
        6667340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401CF7212E69924F6B030EA9227BB5C149A4109AA480ADF6E18
        FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F9
        F9FCFCFCF9F9F9EAEDEEA29D9887746A94847CBCB0ABD2CBC8D7D3CFD6D2D0D6
        D2D0D6D2D0D7D2CFD6D2CFDAD6D3DBD5CF635C551A1616292525292424292525
        1C1C2846371CD99702EFA500E19C00E19C00E19C00E19C00E19C00E19C00E19C
        00E19D00E19C00E19D00E19C00E19C00E19C00E19C00E19C00E19D00E19D00E1
        9D00E19C00E19D00E19D00E19C00E19D00E19C00E29D00E19C00E19D00E19C00
        E29C00F3A900A6760B13121A474240D7D2CDD7D3D0D2CFCBD1CCC9B9B0AB8888
        831F10012211002915003219003F20014C2701572C015F300165330167340167
        3401673401673401673401673401673401673401673401673401673401673401
        673401673401673401344D660066CC0066CC0066CC0066CC0663BF61370E6734
        011A59990066CC0066CC4D41346734016734012D50730066CC1A599967340134
        4D660066CC0066CC5A3A1A673401344D660066CC0066CC0066CC0066CC0066CC
        0066CC0066CC0066CC0066CC6734016734016734016734016734016734016734
        014D41340066CC0066CC0066CC0066CC0066CC0066CC0066CC0663BF543D2767
        34014D41340066CC0066CC1A59990066CC0066CC1A59990066CC0066CC1A5999
        6734016734010066CC0066CC1A59996734016734016734016734010066CC0066
        CC1A59996734014D41340066CC0066CC344D666734016734011A59990066CC00
        66CC6734016734016734014D41340066CC0066CC344D66673401673401673401
        6734016734016835026734012D50730066CC1A5999673401344D660066CC0066
        CC5A3A1A6734016734011A59990066CC0066CC0066CC135DA6344D660D60B300
        66CC0066CC673401673401344D660066CC0066CC0066CC0066CC0066CC0066CC
        0066CC0066CC344D666734016734010066CC0066CC135DA60663BF0066CC0663
        BF135DA60066CC0066CC6734016734016734016734012D50730066CC0066CC00
        66CC5A3A1A673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        673401673401673401673401CF7212E69924F6B030EA9227BB5C149A4109AA48
        0ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3
        F3F3F9F9F9FBFBFBF6F6F6CED3D38B79718D7C72A99C94CCC4C1D6D1CED7D3D0
        D7D3D0D7D3D0D7D3D0D7D3D0D8D4D1E4DFDB877F781E19182723232925252A26
        251F1E26362E20C78B05EBA300E09C00E19C00E19C00E19D00E19C00E19C00E1
        9C00E19C00E19C00E19D00E19C00E19D00E19C00E19C00E19C00E19D00E19C00
        E19D00E19C00E19C00E19C00E19C00E19D00E19C00E19C00E19D00E19C00E19C
        00E19D00E19D00E49E00EBA3006D51130D0D1A8A857DE2DEDBD4D0CDD4D0CDC5
        BCB8B2AFAD3C33272010002714002F18003B1E01492501552B015D2F01633201
        6734016734016734016734016734016734016734016734016734016734016734
        01673401673401673401673401344D660066CC0066CC0D60B30066CC0066CC34
        4D666734011A59990066CC0066CC4D41346734016734013A4A5A0066CC0663BF
        6734011A59990066CC0066CC673401673401344D660066CC0066CC0066CC0066
        CC0066CC0066CC0066CC0066CC0066CC67340167340167340167340167340167
        34016734014D41340066CC0066CC0066CC0066CC0066CC0066CC0066CC1A5999
        61370E6734014D41340066CC0066CC344D6620568C0066CC0066CC0066CC0066
        CC1A59996734016734010066CC0066CC1A599967340167340167340167340100
        66CC0066CC1A59996734014D41340066CC0066CC344D666734016734011A5999
        0066CC0066CC6734016734016734014D41340066CC0066CC344D666734016734
        016734016734016734016734016734013A4A5A0066CC0663BF6734011A599900
        66CC0066CC67340167340167340161370E135DA60066CC0066CC0066CC0066CC
        0066CC0066CC0066CC673401683502344D660066CC0066CC0066CC0066CC0066
        CC0066CC0066CC0066CC344D666734016734010066CC0066CC1A59993A4A5A00
        66CC0066CC0066CC0066CC0066CC6734016734016734016734012D50730066CC
        0066CC20568C6734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401673401673401673401673401CF7212E69924F6B030EA9227BB5C149A
        4109AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1
        EBEBEBF3F3F3F8F8F8F9F9F9EBEFEFA098938A776D96867DC1B7B2D5CFCCD8D3
        D0D9D4D1D8D4D0D8D4D1D8D4D0D7D3D0E1DDDBA8A19825201D2521222A252429
        2525222026312A20C08705EFA600E19D00E19D00E19C00E19C00E19D00E19C00
        E19C00E19C00E19C00E19D00E19C00E19C00E19C00E19C00E19D00E19D00E19C
        00E19C00E19D00E19D00E19C00E19C00E19C00E19C00E19D00E19D00E19C00E1
        9D00E19D00E19C00E19C00E09C00E8A100DF9A013E2E13323036D1CCC5DBD7D4
        D5D1CED2CCC8B5ACA87170681F10002412002D1700381C014523015229015B2E
        0162320166330167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401344D660066CC0066CC344D660663BF
        0066CC0663BF61370E1A59990066CC0066CC4D41346734016734014D41340066
        CC0066CC5A3A1A0D60B30066CC1A59996734016734013A4A5A0066CC0066CC20
        568C344D66344D66344D660D60B30066CC0663BF673401673401673401673401
        6734016734016734014D41340066CC0066CC2753804D41344D41342D50730066
        CC0066CC344D666734014D41340066CC0066CC344D665A3A1A0663BF0066CC00
        66CC0066CC1A59996734016734010066CC0066CC0663BF673401673401673401
        543D270066CC0066CC1A59996734014D41340066CC0066CC344D666734016734
        011A59990066CC0066CC5A3A1A6734016734013A4A5A0066CC0066CC344D6667
        34016734016734016734016734016734016734014D41340066CC0066CC5A3A1A
        0D60B30066CC1A59996734016734016734016734016734014744412D50731A59
        991A59990663BF0066CC0066CC673401673401344D660066CC0066CC27538034
        4D66344D662753800066CC0066CC344D666734016734010066CC0066CC1A5999
        673401135DA60066CC0066CC0066CC0066CC67340167340167340161370E0663
        BF0066CC0066CC0663BF61370E67340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016835026734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401CF7212E69924F6B030EA9227
        BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5
        D5E1E1E1EBEBEBF3F3F3F8F8F8F6F6F6D6DCDC9080778C7970A89A93CFC8C4D8
        D3D0D9D5D2D9D5D2D9D5D2D9D5D3D9D5D2DCD8D6D9D4CF4A423E1E191B2A2525
        2924242724251F1E25A0730BF2A600E29D00E19D00E19D00E19C00E19D00E19D
        00E29D00E19C00E19C00E19D00E19D00E19C00E19D00E19C00E19D00E19C00E2
        9C00E19C00E29D00E19C00E19C00E19D00E19D00E19D00E19D00E19D00E19C00
        E19D00E19D00E19C00E19D00E19D00E19C00E19C00EFA500AD7B08141218928C
        87E4E0DDD5D1CED5D0CEC0B7B49898931E0F002312002A1500351B014221014F
        2801592D01613101653301673401673401673401673401673401673401673401
        673401673401673401673401673401673401673401344D660066CC0066CC344D
        66344D660066CC0066CC344D661A59990066CC0066CC4D413467340167340161
        370E0066CC0066CC4D41340066CC0066CC2753806734016734014D41340066CC
        0066CC2D507367340167340161370E0066CC0066CC1A59996734016734016734
        016734016734016734016734014D41340066CC0066CC344D6667340167340167
        34010066CC0066CC1A59996734014D41340066CC0066CC344D66673401344D66
        0066CC0066CC0066CC1A59996734016734010066CC0066CC0066CC543D276734
        016734013A4A5A0066CC0066CC344D666734014D41340066CC0066CC344D6667
        34016734011A59990066CC0066CC344D666734016734011A59990066CC0066CC
        4D413467340167340167340167340167340167340167340161370E0066CC0066
        CC4D41340066CC0066CC27538067340167340161370E3A4A5A20568C40474D67
        34016734016734011A59990066CC0066CC673401673401344D660066CC0066CC
        4D41346734016734014D41340066CC0066CC344D666734016734010066CC0066
        CC1A59996734014D41340066CC0066CC0066CC0066CC67340167340167340140
        474D0066CC0066CC0066CC0066CC344D66673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        673401673401673401673401673401673401673401673401CF7212E69924F6B0
        30EA9227BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7
        C7C7D5D5D5E1E1E1EBEBEBF2F2F2F6F6F6EFF1F1B1AFAC89756C96847BBCB2AD
        D6D1CEDAD6D3D9D6D3D9D6D3D9D5D2D9D5D3D9D6D3E5E1DFA09991221C1B2723
        232924242A25241B1B275D4617EBA300E39E00E19C00E19C00E19D00E19C00E1
        9C00E19C00E19C00E19C00E19C00E19C00E19D00E19C00E19D00E29D00E19C00
        E19C00E19C00E19D00E19D00E19C00E19D00E19D00E19D00E19D00E19D00E19C
        00E19A00E09700E09900E09A00E09A00E09B00E19D00E19C00E39E00EAA30057
        3F0E3D3B41DBD6D0D8D4D2D6D2CFCCC5C1A9A5A1302416221100281400321900
        3F20014C2701572C015F30016533016734016734016734016734016734016734
        01673401673401673401673401673401673401673401673401344D660066CC00
        66CC344D6661370E0663BF0066CC0663BF135DA60066CC0066CC4D4134673401
        6734016734010663BF0066CC135DA60066CC0066CC344D666734016734016734
        010663BF0066CC0066CC47444161370E2753800066CC0066CC344D6667340167
        34016734016734016734016734016734014D41340066CC0066CC2753804D4134
        4D41342D50730066CC0066CC1A59996734014D41340066CC0066CC344D666734
        0161370E0D60B30066CC0066CC1A59996734016734010D60B30066CC0066CC13
        5DA65A3A1A4D41340663BF0066CC0066CC4744416734014D41340066CC0066CC
        344D666734016734011A59990066CC0066CC0066CC3A4A5A344D660066CC0066
        CC0066CC5A3A1A67340167340167340167340167340167340167340167340106
        63BF0066CC135DA60066CC0066CC344D666734016734014D41340066CC0066CC
        0663BF4D41346734014744410066CC0066CC0066CC673401673401344D660066
        CC0066CC4D41346734016734014D41340066CC0066CC344D6668350267340100
        66CC0066CC1A599967340167340120568C0066CC0066CC0066CC673401673401
        6734010D60B30066CC0066CC0D60B30066CC0663BF61370E6734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401673401673401673401673401673401673401673401673401CF7212E6
        9924F6B030EA9227BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212
        B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF2F2F2F4F4F4E3E6E79181798F7A72A798
        91CEC7C2DAD6D3DBD7D5DAD7D4DAD7D3DAD7D4DAD7D4DEDBD8D5CFCB4A433E1F
        1A1B2925262A2525232026322B20CC8E04EAA200E09C00E19D00E19C00E19C00
        E29D00E19C00E19C00E19D00E19D00E19C00E19D00E29D00E19D00E19C00E29D
        00E19C00E19C00E19D00E19D00E19C00E19D00E19D00E19D00E29C00E19C00E1
        9C00E09B00E5A918E7B02BE5A810E3A40EE3A10AE29E00E29D00E19C00E19C00
        EFA500B37E071D191AA39E9BE4E0DDD6D2CFD3CECAB9B3AF534D432010002714
        003018003C1E014A2501562B015E300164320167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401344D66
        0066CC0066CC344D6667340140474D0066CC0066CC0066CC0066CC0066CC4D41
        346734016734016734011A59990066CC0066CC0066CC0066CC4D413467340167
        3401673401344D660066CC0066CC0066CC0066CC0066CC0066CC0066CC5A3A1A
        6734016734016734016734016734016734016734014D41340066CC0066CC0066
        CC0066CC0066CC0066CC0066CC0066CC2753806734014D41340066CC0066CC34
        4D666734016734014744410066CC0066CC1A59996734016734011A59990066CC
        0066CC0066CC0066CC0066CC0066CC0066CC0D60B36734016734014D41340066
        CC0066CC344D666734016734011A59990066CC0066CC0066CC0066CC0066CC00
        66CC0066CC1A5999673401673401673401673401673401673401673401673401
        6734011A59990066CC0066CC0066CC0066CC4D413467340167340161370E0663
        BF0066CC0066CC0066CC0066CC0066CC0066CC0066CC135DA667340167340134
        4D660066CC0066CC4D41346734016734014D41340066CC0066CC344D66673401
        6734010066CC0066CC1A59996734016734015A3A1A0663BF0066CC0066CC6734
        016734014D41340066CC0066CC0663BF543D270066CC0066CC40474D67340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        CF7212E69924F6B030EA9227BB5C149A4109AA480ADF6E18FEAA44F8B130E699
        24CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF2F2F2F1F1F1C4C5C38C776E94
        8179B9AEA8D6D0CDDCD8D6DCD8D6DBD7D4DBD7D5DBD7D4DBD7D4E5E1DF9B948C
        1F1A182824252924242824241B1C2788620EF1A700E19C00E19D00E19C00E19D
        00E19D00E19C00E19C00E19C00E19C00E19D00E19D00E19C00E19C00E19D00E1
        9D00E19D00E19C00E19C00E19D00E19C00E19D00E19D00E19D00E19D00E29D00
        E19D00E19D00E09900E5AA1AF4DC87F7E39BF5DE92F4DC8EF3D97DE7AF1FE099
        00E19C00E6A000DF9B003B2C0F605F60E4E0DCD9D5D2D6D2CEC2BAB673716920
        10002613002E1700391D01472401542A015D2F01633201673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01344D660066CC0066CC344D666734016734010D60B30066CC0066CC0066CC00
        66CC4D41346734016734016734012D50730066CC0066CC0066CC0066CC5A3A1A
        67340167340167340161370E135DA60066CC0066CC0066CC0066CC0066CC344D
        666734016734016734016734016734016734016734016734014D41340066CC00
        66CC0066CC0066CC0066CC0066CC0066CC0066CC4D41346734014D41340066CC
        0066CC344D666734016734016734010066CC0066CC1A59996734016734012753
        800066CC0066CC0066CC0066CC0066CC0066CC0066CC4744416734016734014D
        41340066CC0066CC344D666734016734011A59990066CC0D60B30663BF0066CC
        0066CC0066CC0066CC4D41346734016734016734016734016734016734016734
        016734016734012D50730066CC0066CC0066CC0066CC5A3A1A67340167340167
        340140474D0066CC0066CC0066CC0066CC0066CC0066CC0066CC474441673401
        673401344D660066CC0066CC4D41346734016734014D41340066CC0066CC344D
        666734016734010066CC0066CC1A59996734016734016734011A59990066CC00
        66CC67340167340121578D0066CC0066CC2D50736734011A59990066CC0D60B3
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401CF7212E69924F6B030EA9227BB5C149A4109AA480ADF6E18FEAA44F8
        B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF1F1F1EBEDEE9F9791
        8E79709F8D86C9C1BDDAD5D3DCD9D6DCD9D6DCD8D5DCD8D5DBD8D5DDDAD7DCD6
        D1514A441F1A1C2A2525292424211F263A301ED59401E9A200E19C00E19C00E1
        9D00E19D00E19C00E29C00E19C00E19C00E19C00E19C00E19C00E19C00E19C00
        E19D00E19C00E19C00E19D00E29C00E19C00E19D00E19D00E19C00E19C00E19C
        00E19D00E19C00E19D00E19D00DF9400E8B230F8E6A8F7E5A8F8E6ACF6E39FE5
        AA1CE09900E19D00E09B00F0A600815B07303037D1CCC7DFDBD8D8D4D1C6BFBB
        8D8B852012022412002D1700381C01452301522A015C2E016232016634016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401344D660066CC0066CC344D6667340167340140474D0066CC0066CC
        0066CC0066CC4D41346734016734016734014744411A59991A59991A59991A59
        9967340167340167340167340167340161370E2753800066CC0066CC0D60B334
        4D66673401673401673401673401673401673401673401673401673401543D27
        1A59991A59991A59991A59991A59991A599920568C4D4134673401673401543D
        271A59991A599940474D6734016734016734011A59991A59992D507367340167
        340140474D0066CC0066CC20568C0066CC0066CC135DA6474441673401673401
        673401543D271A59991A599940474D6734016734012D50731A59992D5073543D
        270D60B30066CC0663BF40474D67340167340167340167340167340167340167
        34016734016734016734014744411A59991A59991A59991A5999673401673401
        6734016734016734014744411A59990066CC0066CC0066CC145DA64744416734
        0167340167340140474D1A59991A5999543D27673401673401543D271A5A991A
        599940474D6734016734011A59991A59992D50736734016734016734012D5073
        1A59991A59996734016734011A59991A59991A59995A3A1A6734014D41341A59
        991A5999543D2767340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401CF7212E69924F6B030EA9227BB5C149A4109AA480ADF6E18
        FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBEFEFEFD8DD
        DD928077917D73AFA19BD4CECBDCD8D6DEDAD7DDD9D7DDD9D6DDD9D6DDD9D6E6
        E3E0A9A29A251F1D2722232924242925251D1C268B640EEEA500E19C00E19C00
        E19C00E19D00E19C00E19C00E19C00E19D00E19D00E19C00E19D00E19C00E19D
        00E19D00E19C00E19D00E19D00E19C00E19C00E19C00E19C00E19C00E19D00E2
        9D00E19C00E19D00E19D00E19C00E09700E6AD21F1D277F6E3A4F7E4A8F7E6AB
        F2D77EE29F06E09A00E19C00E09C00E8A100C5890129211BA8A3A0E5E2DFD9D6
        D4CCC5C1A7A49F362B1E2412002C1600361B014422015129015B2E0162310166
        3301673401673401673401673401673401673401673401673401673401673401
        673401673401673401344D660066CC0066CC344D666734016734016734010D60
        B30066CC0066CC0066CC4D413467340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        67340167340161370E0066CC0066CC344D666734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        673401673401673401673401CF7212E69924F6B030EA9227BB5C149A4109AA48
        0ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBEE
        EFEFBCBBB98E796E968279BEB4AEDBD6D3DEDBD8DEDBD9DDDAD8DDDAD8DDDAD7
        DFDCDBE2DDD9665E571C1818292525292524252226322A21D39301E7A000E09C
        00E19C00E19C00E19C00E19C00E19C00E19C00E19C00E19C00E19C00E19D00E1
        9C00E19C00E19D00E19C00E19C00E19D00E19C00E19C00E19C00E19C00E19C00
        E19D00E19C00E19C00E19D00E09A00E19A03EBBE45F6E39EF7E7ADF7E5A7F5DD
        8EF8E7AEEFCB61E09900E19C00E19D00E19C00E29D00E8A1004A350A757376E7
        E3DFDBD7D5D2CDC9BAB6B2443A2F2312002B1600351B014322015028015A2D01
        6131016533016734016734016734016734016734016734016734016734016734
        01673401673401673401673401344D660066CC0066CC344D6667340167340167
        340140474D0066CC0066CC0066CC4D4134673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        016734016734016734016734012753800066CC0066CC344D665A3A1A67340167
        34016734016734016734014D41340066CC0066CC344D66673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016835026734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401673401673401673401673401CF7212E69924F6B030EA9227BB5C149A
        4109AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1
        EBEBEBE6EBECA197928F786E9D8A82CAC1BEDEDAD8DFDCD9DFDCD9DEDBD8DEDB
        D9DEDBD8E5E2E0CEC8C33D3633211D1D2924242A26241C1C275E4617E9A200E2
        9D00E19C00E19C00E19C00E19C00E19C00E19C00E19C00E19D00E19D00E19C00
        E19C00E19C00E19C00E19D00E29D00E19C00E19C00E19D00E19C00E19D00E19C
        00E19C00E19D00E19D00E19D00E09700E3A00AEFCB63F7E6ABF7E6ADF7E7A8EE
        C75DE3A40BF2D478EDC24FE09700E19D00E19C00E19C00E19C00EEA6007B5604
        504E53E3DFDBDCD9D6D6D1CEBBB4B04F483E2211002A1500351B014221015028
        015A2D0161310165330167340167340167340167340167340167340167340167
        3401673401673401673401673401673401344D660066CC0066CC344D66673401
        6734016734016734010D60B30066CC0066CC4D41346734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        340167340167340167340167340167340161370E0663BF0066CC0066CC0066CC
        135DA64744416734016734016734014D41340066CC0066CC344D666734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401CF7212E69924F6B030EA9227
        BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5
        D5E1E1E1EBEBEBDCE3E4998C84917C72A89890D4CECBE0DDDBE0DEDBDFDCD9DF
        DBD9DFDBD9DFDBD9E8E4E2A9A19A26201F262122292525272325222024A97808
        EDA400E19C00E19C00E19C00E19C00E29D00E19C00E19C00E19C00E29D00E19D
        00E19C00E19C00E19C00E19C00E19D00E19D00E19C00E19D00E19D00E19C00E1
        9C00E19C00E19C00E19D00E09A00E09800EAB836F4DD8EF7E7ADF7E7AFF5DF92
        E9B733E09900E09600E4A60EE6AA15E19A00E19C00E19C00E19D00E19C00EDA4
        00AC770044403FD9D6D6DEDBD8DAD5D3BEB6B15D574E2211002A1500341A0141
        21014F2801592D01613101653301673401673401673401673401673401673401
        673401673401673401673401673401673401673401344D660066CC0066CC344D
        666734016734016734016734011A59990066CC0066CC4D413467340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        673401673401673401673401673401673401673401673401543D270D60B30066
        CC0066CC0066CC0066CC4744416734016734014D41340066CC0066CC344D6667
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016835026734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        673401673401673401673401673401673401673401673401CF7212E69924F6B0
        30EA9227BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7
        C7C7D5D5D5E1E1E1EBEBEBD5DBDC95847B947F76B3A7A1DBD7D4E2DFDDE1DEDB
        E0DDDAE0DDDAE0DDD9E1DEDBE7E2DF776F681D18182925252924241F1E274335
        1DDB9902E7A000E19C00E19D00E19D00E19C00E19D00E19D00E19C00E29D00E1
        9C00E19C00E19C00E19D00E19C00E19D00E19D00E19C00E29D00E19D00E19C00
        E19D00E19C00E29D00E19D00E09800E29D06EEC758F7E7AAF7E5ABF8E7ADF2D4
        76E4A618E09700E19C00E19C00E19A00E09A00E19D00E29D00E19D00E19D00E1
        9C00E9A200CB8D004B3F2CCCCACCE1DEDADCD8D5C2B9B46C68602211002A1500
        341A014121014F2801592D016131016533016734016734016734016734016734
        016734016734016734016734016734016734016734016734014D4134344D6634
        4D664D413467340167340167340167340140474D344D66344D665A3A1A673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401543D2720568C0066CC0066CC20568C6734016734015A3A1A344D66344D66
        4D41346734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401673401673401673401673401673401673401673401673401CF7212E6
        9924F6B030EA9227BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212
        B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBC8CCCB907B7299857CBFB4AFE0DCD9E3E0
        DEE2DFDCE1DEDBE1DEDBE1DEDBE3E0DEDCD6D14D4640201C1D2A26252924241C
        1C27765712EDA400E29D00E19C00E19D00E19D00E19C00E19D00E19D00E19C00
        E29D00E19C00E19C00E19C00E19C00E19C00E19D00E19C00E19C00E19C00E19D
        00E19D00E19D00E19D00E19B00E09600E5AB1DF3D77EF8E7ADF7E5ABF8E7AAEE
        C95CE19D05E09800E19C00E19C00E19D00E19C00E19D00E19C00E19C00E19C00
        E19D00E19C00E69F00DE9A00544118BCB9BDE5E1DFDDD8D6C5BCB87D79732211
        002A1500341A014121014F2801592D0161310165330167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        67340167340167340161370E4D41344D41346734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734011A59991A59992D50736734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016835026734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        CF7212E69924F6B030EA9227BB5C149A4109AA480ADF6E18FEAA44F8B130E699
        24CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBB7B6B3907B729E8C84CAC1BDE2
        DFDCE4E1DEE2DFDCE1DEDCE1DEDCE1DEDCE7E4E2C2BBB42F2925262122292525
        272325232024B07C07EDA400E19C00E19D00E19C00E19C00E19D00E19C00E19C
        00E29C00E19C00E19D00E19D00E19C00E19D00E19C00E19C00E19D00E19C00E1
        9C00E19C00E19D00E19D00E09800E19C05ECBF45F6E29CF8E6ACF7E6ACF4DC88
        E9B533E19900E19B00E29D00E19C00E19D00E29D00E19C00E19D00E19C00E19D
        00E29D00E19C00E19D00E39D00E9A200674B0DABA8ADE7E5E3DCD9D6C8C0BC83
        807A2211002A1500341A014221014F28015A2D01613101653301673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401673401673401543D270663BF0066CC0066CC0663BF543D2767340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401663301663301663301663301663301663301663301
        6633016633016633016734016734016734016734016734016734016734016734
        01673401CF7212E69924F6B030EA9227BB5C149A4109AA480ADF6E18FEAA44F8
        B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBA7A29D937D73A5948C
        D2CBC7E3E1DFE5E2E0E3E0DDE2E0DDE2DFDDE2DFDDEAE7E6A39A92211C1B2925
        252924242421263A301FD79601E69F00E19C00E19C00E19C00E19D00E19C00E1
        9C00E19C00E19C00E19D00E19C00E19C00E19D00E19C00E19D00E19D00E19C00
        E19C00E19C00E19C00E19C00DF9700E5A613F2D173F8E7AAF7E4AAF8E7AEF1D3
        77E3A310E09600E19B00E19D00E19D00E29C00E19C00E19C00E19C00E19D00E1
        9C00E19C00E19D00E19C00E19C00E19D00EDA5007A56069D9CA2E9E7E6DDDAD8
        CBC3C07C77702312002A1500351B014221015028015A2D016131016533016734
        0167340167340167340167340167340167340167340167340167340167340167
        34016734016734016734016734010D60B30066CC0066CC0066CC0066CC0D60B3
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6835026734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016633016633016633016633016633016633016532016532016532
        0165320166330166330166330166330166330166330167340167340167340167
        3401673401673401CF7212E69924F6B030EA9227BB5C149A4109AA480ADF6E18
        FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBA09690957F
        76AB9B95D8D2CFE5E2E0E5E3E0E3E1DEE3E0DEE3E0DEE3E1DFECE7E4857C741E
        19192925242A24241E1D275C4618EAA200E19D00E29D00E19D00E19C00E19C00
        E19D00E29D00E19D00E19C00E29D00E19D00E19C00E19C00E19C00E09B00E19B
        00E19A00E09A00E09A00E09A00E09900E8B22AF5DF90F7E6ACF6E4A9F6E3A4ED
        C457E19B03DF9700E19B00E19A00E19A00E19B00E19B00E19A00E19A00E09A00
        E09A00E09A00E09A00E19C00E19C00E19C00E19C00EFA6008B60039A9696EAE8
        E7DEDBD8CDC5C1756F672312002B1600351B014322015028015A2D0161310165
        3301673401673401673401673401673401673401673401673401673401673401
        673401673401673401673401673401543D270066CC0663BF5A3A1A5A3A1A0D60
        B30066CC543D2767340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401683502673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340166330166330166330165320165320165320164320164310164
        3101643101643201653201653201653201653201663301663301663301663301
        663301663301663301673401CF7212E69924F6AF30EA9227BB5C149A4109AA48
        0ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEB9C
        8F88978279B3A59EDDD7D5E6E4E2E6E4E1E4E1DFE4E1DFE4E1DFE5E3E2E8E2E0
        6B635C1D191A2925252A25241B1B27835F0FEEA500E09B00E19C00E19C00E19C
        00E29D00E19C00E19C00E19B00E19B00E09900E09A00E09A00E19B00E19E00E2
        A000E3A200E5A500E5A900E5AB00E5AA00EDC246F9EBBAF8EABCF9EBC2F8E4A6
        EEC731E7B000E7B100E8B300E7B300E7B200E7B200E7B200E7B100E7B000E7B0
        00E6AE00E6AB00E5A800E4A500E3A200E29F00E29D00E09A00EDA2009766009A
        9692ECE9E9DFDCD9CDC5C1716B622312002B1600351B014322015029015A2E01
        6131016633016734016734016734016734016734016734016734016734016734
        01673401673401673401673401673401673401543D271A59993A4A5A67340167
        34013A4A5A1A5999543D27673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401663301663301663301663301653201653201643201643101643101633001
        6330016330016330016330016330016431016431016431016532016532016532
        01653201663301663301663301663301CE7112E59824F6AF30EA9227BB5C149A
        4109AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1
        EBEBEB998B8398847AB8ABA6E0DCD9E7E5E3E7E3E2E5E2E0E5E2DFE4E2DFE8E5
        E3E1DBD65951491F1A1B2925252924251E1D25A57508EDA400E09D00E19C00E1
        9C00E09B00E19A00E09A00E19C00E29F00E3A300E5A700E7AE00E7B300E9B700
        E9BB00EBBE00EBBF00ECC100EDC200ECC100EBBF00F5E086FAF1D7FAEFCCF7E3
        9DEEC51EEBBE00EDC200ECC300EDC300ECC300ECC200ECC300ECC300ECC300ED
        C300EDC300EDC400EDC300EDC300EDC300ECC200EBC000EBBC00EAB700F4BB00
        A57E09A09B9CECE9E9E1DDDACCC4C06D675E2412002B1600361B014422015129
        015B2E0162310166330167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401683502673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401663301
        663301663301663301663301653201653201643101643101633001633102622F
        01612F01612E01612E01612E01612E01612F01622F0162300163300163300164
        3101643101643101653201653201653201663301CD7012E49723F5AF30EA9227
        BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5
        D5E1E1E1EBEBEB9989809A867DBDB1ABE2DFDDE9E6E5E7E5E3E6E3E1E6E3E1E6
        E3E1EAE7E6DBD4CF4D4541211C1C292424262225262223BC8205E9A000E09A00
        E19B00E29E00E3A300E5AA00E8B100EAB700EBBC00EBC000ECC200EDC300EDC3
        00ECC200EDC200ECC200ECC100ECC100ECC200EDC100ECBF00F6E192FBF0D3FA
        EFCFF1D050EBBE00EDC200EDC200EDC300ECC300EDC200EDC200EDC300EDC300
        EDC300EDC300EDC300EDC400EDC300EDC300EDC400EDC400EDC500EDC500EEC5
        00F8CF00AE9628AAA6ABEBE9E7E2DEDCCAC2BF69625A2412002C1600371C0145
        23015229015B2E01623201663401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016633
        01663301663301663301653201653201643101633101633001622F01612E0160
        2E01602D015F2D015F2C015F2C015F2C015F2C015F2D01602D01602E01612E01
        612F01622F01623001633001643101643101653201653201CC6F12E49723F4AE
        2FE99127BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7
        C7C7D5D5D5E1E1E1EBEBEB9A89809B887EC1B6B0E5E1DFEAE8E5E8E5E3E7E4E2
        E6E3E2E6E3E2EBE9E8D7CFC9463E39211D1D2722221E1B202C261FCA9004ECAD
        00E7B000E9B600EBBC00ECC000EDC300EDC400EDC300EDC200ECC200EDC200EC
        C200EDC200EDC200EDC200EDC200EDC300EDC300EDC200EDC300EDC303F7E4A3
        FBF0D2FBEFCEF1D048ECC100EDC300EDC400EDC400EDC400EDC400EDC400EDC4
        00EDC500EDC500EDC400EDC500EDC500EDC500EEC600EEC600EEC600EEC500EE
        C500EEC600F7CE00A48E35B5B1B6EAE9E7E1DEDCC9BFBC645D542412002D1700
        391D01462301522A015C2E016332016634016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340168350267340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340166
        3301663301663301653201653201643101633101623001622F01612E01602D01
        5F2C015E2C015D2B015D2A015C2A015C2A015C2A015C2A015D2A015D2B015E2B
        015F2C015F2D01602D01612E01612F01622F01633001643101643201CB6E11E3
        9623F4AE2FE99127BB5C149A4109AA480ADF6E18FEAA44F8B130E69924CF7212
        B7B7B6C7C7C7D5D5D5E1E1E1EBEBEB9A89819B877FC3B7B4E6E3E2EAE8E7E9E6
        E4E7E4E2E7E4E2E7E4E2ECEAE9D3CBC4433B341F1B1C322E2D4C4A4F6E685EE0
        B90EF2C700EDC400EDC400EDC500EDC300EDC300EDC300EDC300EDC300EDC300
        EDC300EDC300EDC300EDC400EDC300EDC400EDC400EDC400EDC400EDC400EDC6
        08F9E8AFFAF0D2FAEECDF1D040ECC300EDC500EEC500EEC500EEC600EEC600EE
        C500EEC600EEC600EEC600EEC600EEC601EEC704EEC705EEC704EEC705EEC709
        EEC809EEC70AEFC809F5CE0E9B8A4BC2BFC5E9E7E6E1DEDBC5BEB9605A512613
        002E17003A1D01482401542A015D2F0163320167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        663301663301663301653201643101643101633001622F01612E01602D015F2C
        015D2B015C2A015B29015A28015927015927015927015927015927015A28015A
        28015B29015C2A015D2A015E2B015F2C015F2D01612E01612F01623001643101
        CA6D11E29423F3AC2FE89026BB5C149A4109AA480ADF6E18FEAA44F8B130E699
        24CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEB998A819B887FC5B9B4E8E4E2EB
        E9E9E9E7E6E8E6E3E8E6E3E8E5E3EDECEAD2CBC4433B341C16174C484886868C
        8E887DE3BE11F1C600EDC300EDC400EDC500EDC400EDC400EDC400EEC500EDC5
        00EEC500EEC500EEC500EEC500EEC600EEC500EEC500EEC600EEC600EEC600EE
        C600EFC913F8EBB9FAF0D2F9EECAF0CF36EDC500EEC706EEC706EEC709EEC80C
        EEC70DEEC70DEEC70FEEC813EEC813EFC815EFC818EFC81BEFC91AEEC81CEFC9
        1FEFC921EFC921EFC924F1CB23F0CC298C7F5CCDCBCFE8E6E4E1DDDBC3BCB85C
        554B2714003018003D1F014A2601562B015E3001643201673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401663301663301653201643101633001623001612E01602D015F2C015D
        2B015C2A015B2901592701582601572501572501562401562401562401562401
        5725015725015826015927015A28015B29015C2A015D2B015F2C01602D01612F
        01623001C86B11E19322F2AB2EE89026BA5B149A4109AA480ADF6E18FEAA44F8
        B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEB9C8D869C897FC4B9B4
        E9E5E4EDEBE9EAE8E6E8E6E5E8E6E4E8E6E4EDEBEAD6CEC9453F391A16174A46
        4586848A8B867DE3BE11F2C800EEC600EEC600EEC701EEC602EEC601EEC702EE
        C704EEC703EEC603EEC704EEC708EEC709EEC809EEC70CEEC80CEEC80EEEC711
        EEC814EEC70EF0CC2AF9ECC5FAF0D4F9EDC7F0CE37EDC716EEC921EFC823EFC8
        25EFC926EFC925EFC929EFCA2BEFCA2AEFC92BEFCA2EEFCA2FEFCA2FEFCA30EF
        CA32EFCA32EFCA33EFCA34EFCB36F5CF33E2C23F7C7467DBD7D9E8E6E3DFDBD8
        C2BCBA5750452915003219003F20014D2701582C016030016533016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401663301663301653201643101633001622F01612E015F2D015E2B01
        5C2A015B29015927015826015725015523015422015322015321015321015321
        015321015322015422015523015624015725015826015927015B29015C2A015E
        2C01602D01612F01C66910DF9022F1A92EE78F26BA5B149A4109AA480ADF6E18
        FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBA0938C9B87
        7FC2B6B1E9E5E4EEECEBEBE9E7EAE8E5EAE8E5E9E7E5EDECEADBD4D04D453F1A
        161644403F88868B8E8984E2BF1FF2CA07EEC80DEEC811EEC813EEC814EFC815
        EFC819EFC91BEFC91BEFC81EEFC920EFC921EFC922EFCA25EFC926EFC927EFC9
        27EFCA29EFCA2CEFC826F1CF45FAEECCFBF1D4FAECC3F0CD3FEEC92BEFCB34EF
        CA35EFCA34EFCB35F0CC37F0CB38F0CB37F0CB39F0CB3AF0CC3BF0CB3BF0CB3D
        F0CC3DF0CC3EF0CC3FF0CC40F0CC40F0CC40F9D441C9AF4F797371E7E4E2E7E5
        E4DBD6D2C2BFBC4D43362B1600351B014322015028015A2D0161310165330167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401683502673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016835026734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        673401673401673401663301663301653201643101623001612E015F2D015D2B
        015828015124014D21014C20014E2001512101522101512001511F01501F0150
        1E00501E00501F01501F01511F01522001532101542201552301572501582601
        5A28015C2A015E2B01602D01C46710DD8E21EFA72DE68D26B95A14994009AA48
        0ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBA4
        99959B877EC0B3AEE9E5E4EFEDEBECEAE8EAE8E6EAE8E6EAE8E6EDEBEBE3DCD7
        584F481A16163C39388A898B8E8B8BDEBE37F3CC20EFC927EFC929EFC929EFC9
        2AEFCA2BEFCA2EEFCA2FEFCA2FEFCA30EFCB32EFCA33EFCA33EFCB33EFCA36EF
        CB37EFCB36EFCB36EFCB39EEC932F2D359FBF0D1FBF1D5F9EBC1F0CE45F0CB3A
        F0CC3FF0CC40F0CC3FF0CC41F0CC42F0CC42F0CC43F0CD44F0CD44F0CD46F0CD
        46F0CD46F0CD46F0CD48F0CD49F0CE48F0CD49F0CD4BFBD74CA593568B8486EF
        ECEAE7E5E3D6CFCDA5A4A0382A192D1700391D01462301522A015C2E01623201
        6633016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401673401673401663301663301653201643101623001612E015F2D015D
        2B015928014A20013316012B12012D1201361501481B014E1E004E1D004E1C00
        4D1C004D1C004D1C004D1C004E1C004E1D004F1E00501E00511F015221015422
        015624015826015A28015C2A015E2C01C16410DB8B20EDA52DE58C25B85A1399
        4009AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1
        EBEBEBADA7A399847BBBAEA8E8E4E3F1EEEEEEECEAEBE9E7EAE8E7EBE9E7EDEB
        EAEAE4E16960581B17163430308A87888E8D93D5BA4DF4CE30EFCB36F0CB38F0
        CA39F0CB39F0CC39F0CB3CF0CC3CF0CC3BF0CC3DF0CB3FF0CC3FF0CB3FF0CC40
        F0CC41F0CD41F0CC42F0CD44F0CD45EFCA3CF3D66CFBF2D6FBF2D7F9EBBDF1CE
        4AF0CD45F0CE4AF0CD4AF1CE4AF1CD4BF1CD4CF1CF4DF1CE4DF1CE4DF1CE4FF1
        CE4FF1CF50F1CF4FF1CE50F1CE52F1CF52F1CF52F1D053F2D053F5D4597E7359
        B0A9A7F2F0EEE7E4E1D1CBC787857E2714003018003C1E014A2501552B015E2F
        0163320167340167340167340167340167340167340167340167340167340167
        340167340167340167340167340167340167340161370E3A4A5A20568C1A5999
        1A59992D50735A3A1A6734016734016734016734016734014744411A59991A59
        9927538061370E4D4134344D66344D665A3A1A67340167340167340167340167
        340167340140474D344D66344D6667340167340167340167340161370E2D5073
        1A59991A59992D507361370E6734016734016734015A3A1A344D66344D664D41
        3467340167340167340140474D344D66344D665A3A1A6734014744411A59991A
        599927538061370E4D4134344D66344D665A3A1A6734014D4134344D66344D66
        5A3A1A6734016734015A3A1A344D66344D664D41346734016734016734015A3A
        1A344D66344D6640474D67340167340167340167340167340147444120568C1A
        599920568C4744416734016734016734016734014D4134344D66344D664D4134
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401663301663301653201633001622F01602D01
        5E2B015B290155260662332D60322E552B25472118220D01381400491B004C1B
        004B1A004B1A004819004418004418004819004C1B004C1B004D1C004E1D0050
        1E005120015322015624015826015A28015D2A01BE610FD8881FEBA22CE38A25
        B75913984009AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5
        D5E1E1E1EBEBEBBBB9B8968278B5A7A0E5E1DFF1F0EFEEEDECECEAE7ECEAE8EC
        EAE7ECEBE9EFEBE97E756C1C18182B262684818090919BC9B464F6D13CF0CC43
        F0CC43F0CD44EFCD45F0CD46F0CD46F0CD46F0CD48F0CD49F0CE48F0CE48F0CE
        4AF0CE4BF0CE4BF0CE4BF0CF4DF1CE4DF1CE4EF0CC45F4DB7DFBF2D9FBF3D9F9
        EAB8F1CF50F1CF50F1CF53F1D053F1CF53F1D055F1D055F1D056F1D055F1D056
        F1D058F1D057F1D057F1D159F1D159F1D15AF1D15AF1D15BF1D15CF6D559DBC2
        6669625ED9D4CFEEEDEBE4E2DFCAC5C16B665E2A1500341A014020014E270158
        2C01603001653301673401673401673401673401673401673401673401673401
        67340167340167340167340167340167340167340161370E135DA60066CC0066
        CC0066CC0066CC0066CC0066CC40474D67340167340167340140474D0066CC00
        66CC0066CC0066CC0D60B32753800066CC0066CC4D4134673401673401673401
        6734016734016734011A59990066CC0066CC6734016734016734015A3A1A0663
        BF0066CC0066CC0066CC0066CC0663BF5A3A1A6734016734014D41340066CC00
        66CC344D6667340167340161370E0663BF0066CC0066CC5A3A1A40474D0066CC
        0066CC0066CC0066CC0D60B32753800066CC0066CC4D4134673401344D660066
        CC0066CC4D41346734016734014D41340066CC0066CC344D6667340167340167
        34014D41340066CC0066CC1A59996734016734016734016734012D50730066CC
        0066CC0066CC0066CC0066CC2D5073673401673401673401344D660066CC0066
        CC344D6667340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        673401673401673401673401673401673401663301653201612F015B2D015D2C
        015D2B015C2A015927016633248A5757A6737397646475424231140A2A0E0041
        16004919004818004416003A13002D0F002D0F003913004517004919004B1A00
        4C1B004E1C004F1E005120015322015624015826015B2901BC5E0FD5841FE99E
        2BE18824B65813973F09AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7
        C7C7D5D5D5E1E1E1EBEBEBCFD3D297837AAF9E98E1DDDAF3F1F0F0EEEDECEAE8
        ECEAE8ECEAE9EDEBE9F3F0EE9A9088201B1A241F1F7774739797A1BBAC76F6D2
        46F0CD4CF0CE4CF0CE4DF0CE4EF0CE4EF1CE4FF1CF50F1CF50F1CF50F1CF52F1
        CF52F1CF52F1CF53F1CF54F1CF55F1D054F1D056F1D057F0CE4DF5DE8AFBF3DB
        FBF3DBF8E9B5F0CF54F1D059F1D05AF1D15AF1D15AF1D15CF0D15DF1D15DF1D1
        5DF1D15DF1D15EF1D25EF1D25FF1D260F2D260F1D261F1D261F2D262F1D262FD
        DC63A99A677B7373F1EEEBE9E9E6E1DEDABEBAB6534A3D2D1700381C01452301
        5129015B2E016131016533016734016734016734016734016734016734016734
        016734016734016734016734016734016734016734016734011A59990066CC00
        66CC0066CC0066CC0066CC0066CC0066CC0663BF5A3A1A6734016734010663BF
        0066CC0066CC0066CC0066CC0066CC0066CC0066CC0066CC6734016734016734
        016734016734016734016734011A59990066CC0066CC6734016734016734011A
        59990066CC0066CC0066CC0066CC0066CC0066CC1A59996734016734014D4134
        0066CC0066CC344D6667340167340140474D0066CC0066CC20568C6734010663
        BF0066CC0066CC0066CC0066CC0066CC0066CC0066CC0066CC67340167340134
        4D660066CC0066CC1A59996734016734014D41340066CC0066CC344D66673401
        6734016734014D41340066CC0066CC1A59996734016734016734014D41340066
        CC0066CC0066CC0066CC0066CC0066CC0066CC4D4134673401673401344D6600
        66CC0066CC344D66673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        016734016734016734016734016734016734016633016633015F2F0150270142
        20014722015126015626015625016F3B35C59393AC78789F6C6C875454572C26
        1F0A003512004014003F14003A1505592823502620210C03220B003411004517
        004A19004A19004C1B004D1C004F1E00512001542201572501592701B85B0ED2
        811EE69B2ADF8523B55613973E09AA480ADF6E18FEAA44F8B130E69924CF7212
        B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBDDE2E39B8B83A7968EDBD5D2F3F2F1F3F1
        EFEEECEAECEBE9EDEBE9EDEBE9F2F0F0B9B0A92A2320201B1B625E5E9E9EA4AC
        A389F3D153F2D054F1D055F1D056F1D056F1D057F1D058F1D158F1D058F1D158
        F0D059F1D15AF1D05AF1D15BF1D25CF2D15CF1D15CF1D25EF1D25EF1CF56F6E1
        97FBF3DCFAF3DCF8E7B0F1D15AF1D261F2D262F2D362F2D363F1D263F2D263F2
        D363F2D364F2D364F2D366F1D366F1D466F2D467F2D467F2D467F2D468F2D469
        F5D567F5D973736A58B1A9A6F4F2F1E8E6E5DBD6D2B2B0AD3B2B1A3119003D1F
        014A2501552B015E2F0163320166340167340167340167340167340167340167
        34016734016734016734016734016734016734016734016734014D41340066CC
        0066CC0066CC0663BF2D50732753800066CC0066CC0066CC275380673401543D
        270066CC0066CC0663BF40474D40474D0663BF0066CC0066CC0066CC67340167
        34016734016734016734016734016734011A59990066CC0066CC673401673401
        543D270066CC0066CC0663BF40474D3A4A5A0066CC0066CC0066CC543D276734
        014D41340066CC0066CC344D666734016734010D60B30066CC0066CC47444154
        3D270066CC0066CC0663BF40474D40474D0663BF0066CC0066CC0066CC673401
        673401344D660066CC0066CC0066CC4744416734014D41340066CC0066CC344D
        666734016734016734014D41340066CC0066CC1A599967340167340167340120
        568C0066CC0066CC20568C4D4134135DA60066CC0066CC20568C673401673401
        344D660066CC0066CC344D666734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        34016734016734016734016734016734016734016734016633015F2F01512908
        5E34243A1E0C271200331701421D01471E02703D3CE2B1B1C39898BF93939563
        6373403F220D05210B00290D0038160B5E2E2C9D6A6A824F4F602F2E30130B25
        0B003F14004817004918004A19004C1A004D1C00501E00522001552301572501
        B5570DCF7D1DE39728DD8322B45512963E09AA480ADF6E18FEAA44F8B130E699
        24CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBE7EBECA1958DA18E84D1C9C5F2
        F1F0F4F2F1EFEDECEDEBE9EDECE9EDECEAF1EFEED9D1CC423A341C1819454141
        9F9DA0A19F9CE5CA66F4D35AF1D15EF1D25EF1D25FF1D15EF1D260F2D260F2D2
        60F1D261F1D262F2D362F1D262F2D263F2D364F2D364F2D364F2D365F1D366F1
        D15FF7E4A5FBF4DEFCF4DFF7E6ACF1D260F2D468F1D369F2D469F2D469F2D46A
        F2D46BF2D46CF3D46BF2D46CF2D56DF2D46CF3D56DF2D56EF3D56FF2D56FF3D5
        6EF3D571FDDD72CDB87169615CE5E0DEEDECEAE8E5E3CCC5C1A3A6A22C160036
        1B014221014F2801592D01603101653301673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734012D50
        730066CC0066CC0663BF543D27673401673401344D660066CC0066CC0D60B367
        34014D41340066CC0066CC2D50736734016734014D41340066CC0066CC0066CC
        67340167340167340161370E4D41344D41346734011A59990066CC0066CC6734
        01673401344D660066CC0066CC3A4A5A673401673401344D660066CC0066CC34
        4D666734014D41340066CC0066CC2D50736734014D41340066CC0066CC0D60B3
        6734014D41340066CC0066CC2D50736734016734014D41340066CC0066CC0066
        CC673401673401344D660066CC0066CC0066CC0D60B36734014D41340066CC00
        66CC344D666734016734016734014D41340066CC0066CC1A5999673401673401
        6734010066CC0066CC0D60B361370E67340161370E0663BF0066CC0066CC6734
        016734014D4134344D66344D664D413467340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016633016332015B2F
        0E71423D8D5A5A7F4C4C62372D2E1608240F003A1C0E764343F0C4C4DDBBBBE1
        BFBFAD7F7F814D4D61343147221B421F18693736BD8A8AFFCBCBA77474946161
        673533210A003D13004817004817004918004A19004C1B004E1D00501F015321
        01562401B2550DCC791CE19327DB8022B25412953D08AA480ADF6E18FEAA44F8
        B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBECEFF0ADA6A29B867C
        C6BBB6F1F0EFF5F4F3F1F0EEEDEBEBEEECEBEEEDEBF0EFEEECE7E4665D551915
        16302B2C939091A2A1A8D4BF79F8D760F2D365F2D364F2D364F1D366F2D367F2
        D366F1D466F2D467F2D469F2D469F2D468F2D469F2D46AF2D56AF2D46AF3D46B
        F3D46CF2D366F9E7AEFCF4DEFCF4DFF8E5A9F2D367F3D56FF3D56FF3D66FF2D6
        6FF3D671F3D671F3D671F3D671F3D672F2D673F2D673F2D672F3D673F3D674F2
        D773F3D773F3D773FFE17B9A8C69999190F3F1F0ECEAE8E4E0DEC1BCB8645D50
        3018003B1E01482401542A015C2F016232016533016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        34011A59990066CC0066CC2D507367340167340167340161370E0066CC0066CC
        0066CC6734014D41340066CC0066CC2753806734016734016734010D60B30066
        CC0066CC673401673401543D270663BF0066CC0066CC0663BF0663BF0066CC00
        66CC67340167340120568C0066CC0066CC5A3A1A67340167340161370E4D4134
        5A3A1A6734016734014D41340066CC0066CC0066CC543D272753800066CC0066
        CC3A4A5A6734014D41340066CC0066CC2753806734016734016734010D60B300
        66CC0066CC673401673401344D660066CC0066CC0066CC0066CC344D664D4134
        0066CC0066CC344D666734016734016734014D41340066CC0066CC1A59996734
        01673401543D270066CC0066CC275380673401673401673401543D274D413467
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340166330163
        330B7A4643B48989BC8C8CA36F6F915E5E7C4B4B6D423E7C4B4BB98585E6C0C0
        DCBABADDBBBBCEA9A99B67679F6C6C925F5F885656D7A4A4FBC8C8E3B7B7BF94
        949F6B6B6B3735230B003E13004716004716004817004918004B1A004C1B004F
        1E00522001542201AF520CC9751BDE9026D87E21B15312943D08AA480ADF6E18
        FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF1F3F3C5C6
        C599857DB8ABA3EDEAE8F6F5F5F3F1F0EFECEBEEECEBEFEDEBF0EEECF5F3F19C
        928A211C1A201B1C726F6FA7A8AFBCB291F6D768F3D56AF2D56CF2D46CF2D46C
        F3D46DF2D56EF2D46EF2D56DF3D56FF3D570F3D570F3D570F2D570F3D670F3D6
        71F3D671F3D671F2D56EF9EAB9FCF4DFFCF4E1F7E4A6F2D46BF2D674F2D673F3
        D775F3D674F3D775F3D775F3D775F3D776F3D776F3D776F3D777F3D878F3D877
        F4D878F3D878F4D878F9DD79E3CD816C645FD4CECBF3F1F0EBE9E8D7D0CDA6A4
        9F382612351B014121014E2701582C015F300164330167340167340167340167
        3401683502673401673401673401673401673401673401673401673401673401
        6734016734013A4A5A1A59990066CC4D41346734016734016734016734010066
        CC0066CC0066CC67340161370E0066CC0066CC0066CC3A4A5A61370E6734011A
        59990066CC0066CC6734016734010D60B30066CC0066CC0066CC0066CC0066CC
        0066CC0066CC6734016734011A59990066CC0066CC4D41344D41344E41354D41
        344D41344D4134543D276734014D41340066CC0066CC0066CC145DA60066CC00
        66CC0066CC61370E67340161370E0066CC0066CC0066CC3A4A5A61370E673401
        1A59990066CC0066CC673401673401344D660066CC0066CC0066CC0066CC0663
        BF40474D0066CC0066CC344D666734016734016734014D41340066CC0066CC1A
        59996734016734014D41340066CC0066CC2753804D41344D41344D41344D4134
        4D41344D413461370E6734016734011A59991A59996734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401663301
        663301713F279E7373F1DCDCCAA4A49F6C6CA26E6EA26F6FD19F9FF9C5C5FEC9
        C9E0BBBBDDBCBCDCBBBBE0C1C1A67474A87474B48080D7A5A5F0BDBDDBB4B4D7
        B0B0DCB6B6BE93936C36342C0E004114004716004716004817004817004A1900
        4B1A004E1C00501F01532101AD4F0CC7721ADC8D25D77C21B05212943C08AA48
        0ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3
        F3F3DDE4E69C8C85AB9991E4DFDCF8F7F6F5F4F3F0EFEDF0EDECEFEEECF0EEED
        F7F6F4CBC5BF342E2B1A1616464242A7A6A9ABA9A7E7CE79F6D86FF3D573F3D6
        73F3D772F3D773F3D774F2D774F3D774F3D774F3D775F2D775F3D775F3D775F3
        D876F4D876F4D877F3D874F3D775F9ECC2FCF5E0FCF5E1F7E3A2F3D572F4D879
        F3D878F4D879F4D87AF4D87AF3D97AF4D97AF3D97CF4D97CF4D97CF4D97CF3D8
        7DF3D87DF3D87EF4D97EF3D87DFFE485958B6D7F7775F7F4F1EFEDEAE8E5E2C9
        C4C0716B612F18003B1E01472401522A015C2E01623101653301673401673401
        6734016734016734016734016734016835026734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340147
        44410066CC0066CC0663BF6734016734012D50730066CC0066CC0066CC0066CC
        1A59990663BF0066CC0066CC673401543D270066CC0066CC0066CC135DA60D60
        B30066CC0066CC0066CC6734016734011A59990066CC0066CC0066CC0066CC00
        66CC0066CC0066CC0066CC1A59996734014D41340066CC0066CC0066CC0066CC
        0066CC0066CC2753806734016734016734012D50730066CC0066CC0066CC0066
        CC1A59990663BF0066CC0066CC673401673401344D660066CC0066CC27538000
        66CC0066CC0D60B30066CC0066CC344D666734016734016734014D41340066CC
        0066CC1A59996734016734014D41340066CC0066CC0066CC0066CC0066CC0066
        CC0066CC0066CC0066CC4D41346734016734010066CC0066CC67340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01663301663301864D47CFB4B4E6CCCCE4C8C8E3C7C7C19999A26D6DEEBABAEE
        BEBEE9C2C2DFBFBFDEBFBFDDBDBDDFBEBED4B1B1C29898B78787D1A2A2DBB6B6
        D9B4B4D8B2B2DFB9B98E5D5D4A231C3411004315004716004716004716004817
        004918004B1A004D1C004F1E00522001AB4D0CC57019DA8A25D67A20AF511193
        3B08AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1
        EBEBEBF3F3F3F3F6F7ABA39EA28E85D7D0CCF8F6F5F6F5F4F2F1EFF0EFEDEFEE
        EDEFEEECF4F3F3EBE6E25C534B1A16162A2626989696ABABB2CCBE90F8DA72F3
        D777F3D777F3D776F3D877F4D878F3D878F3D878F3D878F4D879F3D879F4D87A
        F4D87AF3D87AF3D87AF3D776F3D672F3D877F9EEC8FBF4E0FCF4E2F6E19CF3D5
        71F3D77AF4D97FF3DA7FF4DA7FF3DA80F3DA80F3DA80F4DA80F4DA81F4DA81F4
        DA82F4DA81F4DA83F4DA83F3DA83FBDF82E3CF8D5A534FCEC7C1F4F4F3ECE9E8
        E0DBD8ACA8A53F2F1C351B014121014D2701572C015F30016432016634016734
        0167340167340167340167340167340167340167340167340167340167340167
        34016734016734016734016734016734016734016734016734015A3A1A4D4134
        40474D0663BF0066CC0066CC2753806734016734016734012D50730066CC0066
        CC0066CC0066CC0066CC0066CC0066CC6734014D41340066CC0066CC20568C67
        3401673401135DA60066CC0066CC6734016734011A59990066CC0066CC0066CC
        0066CC0066CC0066CC0066CC0066CC1A59996734014D41340066CC0066CC0066
        CC0066CC0066CC0066CC4D41346734016734016734016734012D50730066CC00
        66CC0066CC0066CC0066CC0066CC0066CC673401673401344D660066CC0066CC
        4D41341A59990066CC0066CC0066CC0066CC344D666734016734016734014D41
        340066CC0066CC1A59996734016734014D41340066CC0066CC0066CC0066CC00
        66CC0066CC0066CC0066CC0066CC4E4135673401543D270066CC0066CC543D27
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401663301663301885046B99292E8D0D0E2C7C7E3C9C9E5CBCBDFC3C3
        E3C3C3E0C5C5E0C3C3E0C3C3E1C4C4E1C4C4E0C3C3DFC1C1DDBDBDDEBDBDDCBA
        BADAB7B7D9B5B5DBB6B6CDA5A56C3939210C032B0E003912003C13003E140140
        14004616004918004A19004C1B004E1D00512001A94C0BC36E19D88824D4781F
        AE5011923B08AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5
        D5E1E1E1EBEBEBF3F3F3F9F9F9D3D6D69A867DC6BAB4F3F1F0F8F7F7F4F2F2F0
        EFEDF0F0EDF0EEEDF1F0EFF8F6F4A59A92221D1C1E191A656261B4B4B7B4B0A6
        F2D77CF5D97AF3D87CF3D87CF4D97DF3D97DF3D97DF4D97DF3D97DF4D97FF4D9
        7FF3D97FF3D980F3D97EF4DA83F5E098F5E096F6E29DFBF2D3FBF5E0FCF4E0F8
        E9B7F7E5A8F8E7AEF5DD8CF4DA82F4DA83F4DA85F4DA85F4DB85F4DB86F5DB86
        F4DB85F4DB87F5DB87F4DB87F5DB88F5DC86FFE792887F69877F7CF8F5F3EEED
        EBEBE9E7D1CBC78B89813018003B1E01472401522A015B2E0162310165330167
        3401673401673401673401673401673401673401673401673401673401673401
        673401673401673401673401673401673401673401673401673401673401344D
        660066CC0066CC0066CC0066CC0663BF5A3A1A67340167340167340167340161
        370E474441344D66344D660D60B30066CC0066CC6734014D41340066CC0066CC
        344D666734016734011A59990066CC0066CC6734016734012753800066CC0066
        CC40474D4D41344D41344744410066CC0066CC2753806734014D41340066CC00
        66CC1A59990066CC0066CC0066CC61370E673401673401673401673401673401
        61370E474441344D66344D660D60B30066CC0066CC673401673401344D660066
        CC0066CC4D4134543D270066CC0066CC0066CC0066CC344D6667340167340167
        34014D41340066CC0066CC1A59996734016734015A3A1A0066CC0066CC1A5999
        4D41344D41344D413420568C0066CC0066CC5A3A1A6734014D41340066CC0066
        CC4D413467340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016835026734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016633016332016B3A16885454DCC0C0E5CDCDE3C9C9E3C8
        C8E2C9C9E2C8C8E2C6C6E2C9C9E4CCCCE3CBCBE3CBCBE5CECEE8D2D2E8D4D4E3
        C8C8DDBBBBDBB9B9DAB7B7DBB8B8C499997A4646401F171B09011F0A00200A00
        220B002C0E003F13004717004A19004B1A004E1D00501F01A84A0BC26C18D686
        23D2761FAD4F11913A08AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7
        C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F9F9F3F7F7A19691AE9D95E7E3E2F8F8F8
        F7F5F5F2F1EFF1EFEEF0EFEEF1EFEEF3F2F1E5DDD9544B421B17182D28289B9A
        99B3B3B9D6C794F9DD7EF4DA82F4DA81F4DA82F4DA83F4DA83F4DA83F4DA83F5
        DA84F4DA84F4DB84F4DB84F4DB83F4DB84F9ECC1FCF7E6FCF5E0FBF4DEFCF5DE
        FBF4DEFCF5E2FCF8ECF9EBBEF4DA87F4DC88F4DC89F4DC89F4DC8AF4DC8AF4DD
        8AF4DD8AF4DD8BF4DC8BF4DC8BF4DD8BF4DC8CFFE68FCFBE885F5854E2DDDAF4
        F2F2EDECEAE2DDDBC3BFBD504232361B014221014E2701582C015F3001643201
        6634016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401344D660066CC0066CC0066CC0663BF5A3A1A6734016734015A3A1A20568C
        0663BF2D5073673401673401673401135DA60066CC0066CC6734014D41340066
        CC0066CC344D666734016734011A59990066CC0066CC6734016734013A4A5A00
        66CC0066CC3A4A5A67340167340140474D0066CC0066CC3A4A5A6734014D4134
        0066CC0066CC344D662D50730066CC0066CC2753806734016734015A3A1A2056
        8C0663BF2D5073673401673401673401135DA60066CC0066CC67340167340134
        4D660066CC0066CC4D41346734012753800066CC0066CC0066CC344D66673401
        6734016734014D41340066CC0066CC1A59996734016734016734010663BF0066
        CC0D60B361370E6734016734010D60B30066CC0663BF6734016734014D413400
        66CC0066CC4D4134673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        016734016734016734016634015F2F015229014723016A3D2CA07171EBD4D4E4
        CCCCE4CCCCE4C9C9E0C4C4E1C7C7E2C7C7E2C6C6E1C5C5E0C3C3E0C1C1DFC0C0
        E0C2C2E5CDCDE9D5D5DFC2C2DBB8B8DDBBBBB283839D69697441416C3B3A673B
        3A6C3A38572F2A1F09003611004516004918004B1A004D1C00501E00A7490BC0
        6A18D58323D1751EAB4D11903908AA480ADF6E18FEAA44F8B130E69924CF7212
        B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F9F9FDFDFDD0D2D09E8C82D3CA
        C7F8F7F6F9F8F7F4F3F2F1F0EEF1F0EEF2F0EEF2F1EFF7F5F4AA9F97241E1C1C
        1718565252B7B6B9BAB6AFEFD889F8DD84F4DB86F4DB86F4DB87F4DB87F4DB87
        F5DC88F4DC88F4DC88F4DC89F4DC89F4DC8AF4DB87F5DE8FFAF1D3FCF6E6FCF4
        DFFBF4DFFBF4E0FDF7E6F9EEC7F4DC8AF4DC8AF5DD8DF4DD8DF4DD8EF4DD8EF4
        DD8DF4DD8EF4DD8FF5DD8FF5DD8FF5DD8FF5DD90F7DE8EFCE69A7B7365AEA7A3
        FDFAF9EFEEEDEBE9E7CEC8C4908E88331A013D1F01492501542A015C2E016232
        0165330167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        68350267340140474D1A59990663BF0066CC0066CC20568C6734016734014D41
        340066CC0066CC0066CC344D664D41342D50730066CC0066CC0066CC6734014D
        41340066CC0066CC344D666734016734011A59990066CC0066CC673401673401
        5A3A1A0066CC0066CC0663BF3A4A5A40474D0663BF0066CC0066CC543D276734
        014D41340066CC0066CC344D66673401135DA60066CC0066CC4744416734014D
        41340066CC0066CC0066CC344D664D41342D50730066CC0066CC0066CC673401
        673401344D660066CC0066CC4D413467340161370E0663BF0066CC0066CC344D
        66673401344D66344D662753800066CC0066CC0D60B3344D66344D664D413427
        53800066CC0066CC1A59994D413420568C0066CC0066CC20568C673401673401
        4D41340066CC0066CC4D41346734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        34016734016734016734016734016232015A300F512E185833226B41358A5555
        D4B6B6E6D1D1E3CBCBDFC0C0E2C8C8E5CBCBE3C9C9E3C8C8E2C7C7E1C5C5E1C4
        C4E0C3C3DFC1C1DEBFBFE0C2C2E8D5D5E0C4C4DCBABAC89F9F9A6666C89696D8
        A4A4DDAAAADFACAC794949270F072E0E004315004918004B1A004D1C004F1E00
        A6480BBE6817D38122CF721EA94C108F3808AA480ADF6E18FEAA44F8B130E699
        24CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F9F9FDFDFDF0F4F5A2
        948DB8A9A3EFEDEBFBFBFBF6F5F5F2F1EFF1F0EFF2F1EFF2F1EFF4F4F3E7E1DD
        675C541B1717231E1E848182BBBCC2CDC3A4F8DF88F5DD8AF4DD8BF4DD8BF4DD
        8BF5DD8BF5DD8DF4DD8DF4DD8DF5DD8DF5DD8DF5DD8EF5DD8EF4DC89F6E19CFC
        F4DBFDF7E3FCF5DFFDF7E5FBF1D1F5DF93F5DD8DF5DE91F5DE91F6DE91F5DE91
        F5DE92F5DE91F5DF92F5DF92F5DF93F5DF94F5DF93F6DF92FFEC9DA4997A6E68
        67F5F1EFF2F1F0EFEDEBDFDAD7B4B3AE4F402D391D01452301502801592D0160
        3101643301663401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340161370E0663BF0066CC0066CC543D2767
        34016734010D60B30066CC0066CC0066CC0066CC0066CC0066CC0066CC20568C
        6734014D41340066CC0066CC344D666734016734011A59990066CC0066CC6734
        016734016734012753800066CC0066CC0066CC0066CC0066CC0066CC1A599967
        34016734014D41340066CC0066CC344D66673401543D270663BF0066CC0663BF
        61370E6734010D60B30066CC0066CC0066CC0066CC0066CC0066CC0066CC2056
        8C673401673401344D660066CC0066CC4D41346734016734013A4A5A0066CC00
        66CC344D666734010066CC0066CC0066CC0066CC0066CC0066CC0066CC0066CC
        344D665A3A1A0066CC0066CC0066CC0066CC0066CC0066CC0066CC4D41346734
        0167340140474D0066CC0066CC40474D67340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016D3C1A9561609F6C6CA47171A16E
        6E986464EAD6D6E8D2D2DCBBBBE3C9C9E5CECEE5CCCCE4CBCBE5CCCCE5CDCDE4
        CBCBE4C9C9E2C6C6E0C4C4DFC1C1DEC0C0DFC0C0E8D4D4DFC0C0DFBEBEB98D8D
        CB9999D9A8A8E4B5B5D5A5A58E5B5B401D16290D004115004918004A19004C1B
        004F1D00A4460ABC6517D07E21CC6F1DA74A108D3707AA480ADF6E18FEAA44F8
        B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F9F9FDFDFD
        FFFFFFC9CAC8A08D84D7D0CCFCFBFBFAF9F9F5F4F2F2F1F0F3F2F0F3F2F0F2F1
        F0F8F7F6CCC3BB37302B1C1719332E2EACAAAABABABFDACC9FF9E18CF5DD8FF5
        DD90F5DD90F5DE91F5DE91F5DE91F5DD91F5DE91F5DE91F5DE92F5DE92F5DF93
        F5DC8CF8E5A8FDF6E2FDF7E7FCF4DCF6E19CF5DD90F5DF96F6DF95F5DF95F5DF
        95F5DF95F5DF95F5DF96F5DF97F5DF96F5DF97F5DF97F5DF96FFED9FBAAE8956
        5050DEDAD6F7F6F4F0EEECEAE7E4C7C2BE817E74371C014221014D2701572C01
        5E30016332016533016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        34015A3A1A344D6620568C40474D6734016734016734012D50730066CC0066CC
        344D66673401673401543D270663BF0066CC0066CC0066CC0066CC0066CC0663
        BF543D276734014D41340066CC0066CC344D666734016734011A59990066CC00
        66CC67340167340167340161370E135DA60066CC0066CC0066CC0066CC0663BF
        5A3A1A6734016734014D41340066CC0066CC344D666734016734013A4A5A0066
        CC0066CC20568C673401543D270663BF0066CC0066CC0066CC0066CC0066CC06
        63BF543D27673401673401344D660066CC0066CC4D41346734016734014D4134
        0066CC0066CC344D666734010066CC0066CC0066CC0066CC0066CC0066CC0066
        CC0066CC344D6667340140474D0066CC0066CC0066CC0066CC0066CC2D507367
        3401673401673401344D660066CC0066CC344D66673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        016734016734016734016734016734016734016734017E4D3DBF8B8BE4AFAFCB
        9696B68080C39B9BECDADAE1C5C5E0C2C2E8D3D3E6D1D1E7D0D0E8D2D2DBBEBE
        CC9F9FCC9A9AD4A2A2DDB0B0E1BFBFE1C5C5DFC1C1DEC0C0E0C4C4E7D2D2DCBB
        BBDCBBBBDCB8B8D9B5B5D9B4B4C59B9B9B68685B2E2A2C0E004114004918004A
        19004C1B004E1D00A2440ABA6216CD791FC96B1BA4470F8B3507AA480ADF6E18
        FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F9
        F9FDFDFDFFFFFFF4F8F8A0948DB8A8A2F3F2F1FCFCFCF8F8F7F3F2F1F3F2F0F3
        F2F0F3F2F0F4F4F2F5F1EE94897F211B1A1C1818535050BCBCBFC0BFBCEDD998
        F9E291F5DF94F6DF95F5DF94F5DF95F5DF95F5DF95F5DF95F5DF95F5DF96F5DF
        96F5E097F5E095F5DE92FAECC1FCF7E8F8E6AFF5DE91F5E098F5E098F6E098F6
        E098F6E099F6DF99F6E199F6E199F6E19AF6E19AF5E09AF6DF99FFEC9FD7C997
        504A48C6C0BBFDFCFAF0F0EEEFEEECD7D2CEADB0AC432D153F20014A2601542A
        015C2E0161310165330167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        673401673401344D660066CC0066CC20568C6734016734016734012D50730066
        CC0066CC344D666734016734016734015A3A1A344D661A59991A59991A59992D
        50735A3A1A6734016734015A3A1A344D66344D664D413467340167340140474D
        344D66344D6668350267340167340167340161370E344D661A59991A59992D50
        735A3A1A6734016734016734015A3A1A344D66344D664D413467340167340167
        34013A4A5A344D66344D666734016734015A3A1A344D661A59991A59991A5999
        2D50735A3A1A6734016734016734014D4134344D66344D665A3A1A6734016734
        015A3A1A344D66344D664D4134673401344D66344D66344D66344D66344D6634
        4D66344D66344D664D41346734016734014D413420568C1A599920568C40474D
        673401673401673401673401344D660066CC0066CC344D666734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401905D5BE6C7C7
        EBD0D0E7D0D0E9D6D6ECD9D9EBD8D8D8B3B3E7D2D2E8D4D4E7D2D2EBD6D6CFAD
        ADA56F6E774A406334246736268E5C51D19D9BE1B9B9E1C5C5DFC1C1DEBEBEE5
        CDCDDFC2C2DBBABADBB8B8DAB6B6DAB6B6DFBBBB9A67674E261F351000441500
        4817004918004B1A004D1C00A0420AB75E15CA741EC4661AA1440E883207AA48
        0ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3
        F3F3F9F9F9FDFDFDFFFFFFFFFFFFD4D8D89F8E86DBD4D0FCFCFBFBFBFAF6F5F4
        F4F3F1F2F1F0F3F2F1F2F1F0F6F5F4E8E0DC7469601D19181C1818686464C0C1
        C6CAC5B8F1DC99F9E295F5DF97F5E097F5E098F5E098F5E098F5E098F5E099F5
        E099F5E099F6E099F6E19AF6E097F6E19CF8E7B0F6E098F6E199F6E19BF6E09B
        F6E19BF6E19BF6E19BF6E19CF6E19CF6E19CF6E19CF5E19DF7E29BFFEEA5DACB
        9D5E5952B2ABA8FEFDFAF2F2EFF0EFEDE5E0DDC4C2BF6D64553D1F0148250152
        29015A2E01603101643301663401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        016734016734016734014744410066CC0066CC0066CC4744416734015A3A1A06
        63BF0066CC0066CC344D66673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401673401673401673401673401344D660066CC0066CC344D6667340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016835026734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734019761
        61F0E1E1ECDBDBEBDADAEBDADAECD9D9E8D1D1D9B5B5ECD9D9E9D5D5EBD6D6E5
        CECE9561603E1F133F160048180048170048170064311FD49E9DE1C2C2E0C4C4
        DFC1C1E1C5C5E3CACADCBBBBDCBABADDBBBBE1BEBEC19898815151451E133F13
        004616004817004918004A19004C1B009D3F09B45A14C56E1CC061189D400D84
        3006AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1
        EBEBEBF3F3F3F9F9F9FDFDFDFFFFFFFFFFFFF6FBFBB3B2AFB1A29AECEAE8FDFE
        FEFBFAF9F5F4F3F3F2F1F3F2F1F3F2F1F4F3F2F7F6F6E1D9D56E635A1B17171C
        1818676363C3C4C9CAC6BCEDDA9FFAE399F6E19BF6E19BF6E19CF6E19BF6E19B
        F6E19CF6E19CF6E19DF6E19DF6E19DF6E19DF6E19CF6E09AF6E29DF6E19EF6E1
        9EF6E19EF6E19EF6E19FF6E29FF6E29FF6E29FF6E19FF6E1A0F9E39EFFEFACB9
        AF9444403FAAA5A0FFFEFEF2F1F0F0EFEEE8E6E3C8C2BF8B887E3D1F02462301
        502901592D015F30016332016533016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        340167340167340167340167340161370E0663BF0066CC0066CC0066CC1A5999
        0663BF0066CC0066CC0066CC543D276734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        344D661A59991A59993A4A5A6734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        34016734016734016734016734016734016734012D50730066CC0066CC2D5073
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016835026734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        34019B6868F5E9E9EDDDDDECDBDBECDBDBEDDBDBE5CCCCDCBBBBECDBDBEAD7D7
        EDDADAC8AAAA734540230D003D1600481800491800481700461600A3716ADCB4
        B4E2C5C5E0C2C2E0C2C2E4CCCCDDBCBCE0BFBFC098988B5A5A713D3B56291F40
        13004515004716004716004817004A19004B1A009B3D09B05512C0681ABB5B17
        983C0D802D06AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5
        D5E1E1E1EBEBEBF3F3F3F9F9F9FDFDFDFFFFFFFFFFFFFFFFFFE4EDEFA2968FC8
        BCB7F9F9F9FDFEFEF8F8F7F4F3F2F3F3F1F3F2F1F3F2F1F4F3F2F5F4F3D8CFC9
        564C441915151E191A6B6767C0C0C5CECAC6EBDAA5FBE49BF8E39DF6E29FF6E2
        9FF6E29FF6E29FF6E2A0F6E2A0F6E2A0F6E2A0F6E1A0F6E2A0F6E2A0F6E2A0F6
        E2A1F6E2A1F6E2A0F6E2A0F6E2A1F6E2A1F6E2A1F6E2A1F7E39FFFEBA5FCEAB1
        9C94833C3838B2ACA5FEFDFBF3F3F1F2F1F0EEEBEAD1CAC79D9A9442280C4523
        01502801582C015F300163320165330167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        673401673401673401673401673401673401673401344D660066CC0066CC0066
        CC0066CC0066CC0066CC0066CC1A599967340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        012D50730066CC0066CC0066CC0066CC2D507367340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734011A59990066CC0066
        CC1A599967340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734019F6A6ACDADADE9D7D7F4E6E6F0E1E1EEE0E0E5CDCDDAB9B9EEDD
        DDEBD9D9EFDEDEBB979773433F1E0B002E11003D15004216004115003C1300A2
        706BD8B5B5E2C8C8E0C4C4E0C2C2E3CACADFC0C0C19B9B7B464644221B220B02
        330F004114004615004615004716004817004918004B1901973908AC5111BB62
        18B5551594380C7D2A06AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7
        C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F9F9FDFDFDFFFFFFFFFFFFFFFFFFFEFFFF
        D7DDDEA4968FDAD2CFFFFEFEFCFDFDF8F7F6F5F4F2F4F3F2F5F3F2F5F4F2F6F5
        F3F7F5F4D2C8C061574D1D1817191516544F4FB0AEB2CDCBCBE1D5B0F6E1A0F9
        E49FF7E3A1F6E2A1F7E2A1F6E2A1F6E2A1F6E2A1F6E2A1F6E2A1F6E2A1F6E2A1
        F6E2A1F6E2A1F6E2A1F6E2A1F6E2A1F6E2A1F6E2A1F7E29FFCE7A1FFEDADD6CA
        A6676460423C3CC8C0BBFFFEFDF4F3F2F3F1F0F0EEECDAD4D1ABA9A44D361D45
        23014E2801572C015E2F01623201653301673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340127538000
        66CC0066CC0066CC0066CC0066CC1A599961370E673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        340161370E0066CC0066CC2753802753800066CC0066CC61370E673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        016734016734016734016734016734016734016734016734016734011A599900
        66CC0066CC1A5999673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401673401673401834F30986256A06A69AF8080D0B2B2F2E6E6EAD6D6D5
        ADADEFE0E0ECDBDBEFDEDEC8A8A87944444B281F1E0B01240D002A0F002B0F00
        5D352CB98483E3C9C9E2C8C8E1C5C5E0C3C3E1C7C7E0C1C1CBA4A48954547244
        41281109220A00381100441400451500451500461600481700491800953708A8
        4C10B75B16B1501390340B792705AA480ADF6E18FEAA44F8B130E69924CF7212
        B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F9F9FDFDFDFFFFFFFFFFFFFFFF
        FFFFFFFFFCFEFECDD3D4ADA09AE7E2E0FEFEFFFDFCFCF7F6F5F4F3F2F5F4F2F4
        F3F2F4F3F2F6F5F3F6F4F3E1D8D3867A70241F1C151213322E2E878586C6C6CA
        D5D0C4E9DAABF9E39FF9E49EF7E3A0F6E2A1F6E2A1F6E2A1F6E2A1F6E2A1F6E2
        A1F6E2A1F6E2A1F6E2A1F6E2A1F6E2A1F6E2A0F8E4A0FEE9A2FFECAEE2D7B184
        8077353031756E67E1DCD7FDFCFBF3F3F2F4F2F1F0EFEDDED8D5B9B8B55D4934
        4523014E2801572C015D2F016232016533016634016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        673401543D273A4A5A344D66344D66543D276734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734014D41340066CC1A599967340167340120568C0066CC4D41346734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        543D274D41344D4134543D276734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401683502673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340168350267340167340167
        34016734016734016734016734016734016734016E3A0C7A492D9E6765E5D3D3
        F2E6E6D2A6A6ECDCDCEDDEDEEEDDDDEDDEDE9966667E494970403D5831295B33
        2B7F4E4AA97777E1C8C8E6CCCCE3C8C8E3C6C6E0C4C4E0C4C4E0C2C2C39B9B99
        6464956262804C4C281007300E004013003D12003811003C1200401400451600
        923408A5480FB35615AC4A128C310A762405AA480ADF6E18FEAA44F8B130E699
        24CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F9F9FDFDFDFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFAFDFDCCD0D0B6A9A3EEEAE8FFFFFFFBFBFBF6F5F4
        F4F3F2F5F4F2F4F3F2F4F3F2F5F4F3F8F7F7ECE6E3A1948A3D352E1411111B17
        18514E4E9C9B9EC8C8CADBD5C3EDDEAFF7E3A1F9E39EF9E49FF8E3A0F7E2A0F6
        E2A1F6E2A1F6E2A0F7E2A0F7E29FF9E49FFEE9A2FFECA9FCEAB2D8CEAE86827C
        3331343E3835B3AAA3FAF7F5FBFAF9F4F2F1F3F2F1F1EFEEDCD7D4C0BEBC9987
        72613E1C4F2801572C015D2F0162310165330166340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340161370E4D41345A3A1A6734016734015A3A1A4D413461
        370E673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        673401673401673401673401673401673401673401673401633201582F099362
        5CD1B1B1F4EAEADFC0C0DEBDBDF0E3E3EEDFDFF0E0E0E4CFCFB98888B27C7CB0
        7A7ABE8989E0B1B1F9E2E2E7D0D0E4CBCBE3C9C9E2C8C8DFC2C2E0C2C2E0C2C2
        E0C2C2BF9595A673738D5A5A3D1D152D0E003B1202361408200A01210A002A0D
        003912008C3107A2450EB05214A94610892E09732204AA480ADF6E18FEAA44F8
        B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F9F9FDFDFD
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFECFD2D1BCB2ADEDE9E8FEFE
        FEFBFBFBF6F5F5F4F3F2F4F3F2F4F3F2F4F3F2F5F4F3F6F6F5F3EFECCCC1B96E
        645C2A2421130E0F201B1C5A5758969599B9B8BCD5D0C3E8DEBCF3E3B0F8E4A7
        F9E5A4FBE6A2FCE8A3FDE8A5FEEAAAFEEBAFF3E3B0DBCFACAFA99A6D6A6A3531
        3538302D898077E3DCD6FDFAFAF7F6F5F5F4F2F4F3F2F1EFEDE0DAD8BFBFBBAD
        B1B0B2A2939E764E6D42165D2F01623101653301663401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        016734016734016734016734016734016734016734016734016734016B3A1298
        6860C18F8FF0D6D6F2E8E8F2E5E5D0A3A3EAD6D6F1E3E3EEDFDFEFDFDFEFDFDF
        E5CBCBEACBCBF3D5D5ECD7D7E7D1D1E6CFCFE5CDCDE5CBCBE1C4C4DEC0C0E0C5
        C5DFC2C2DFC0C0E1C2C2DBBABA9B69694E28202E0E005D2D276D3A3A64323150
        2621250C042A0D00812C06A0420DAD4F13A6430F862B08702004AA480ADF6E18
        FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3F3F3F9F9
        F9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEDDE2E3BC
        B6B2E8E4E1FCFDFDFBFCFBF7F6F4F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2F5F5F4
        F8F7F6EDE8E5BEB4AD776C63352E29130D0D191515312D2F5350557B7A7EA19F
        9FBBB8B1C9C3B7CFC8B4CAC2ADB9B3A49F9B917875714D4A4B2F2D302F2A2A55
        4B459F958DE0DAD6FDFAF7F9F9F8F4F4F2F4F3F2F3F3F1EEECEBD9D3D0C1C0BE
        A69681B8A593CBCACADCBD9FA97A4C6F3E0D6533016634016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401683502673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016835026734016734016734
        0167340167340167340167340167340167340167340167340168350267340167
        3401673401673401673401673401673401673401673401673401673401673401
        996352C8A1A1FAE6E6F5EAEAF2E8E8F3E8E8EAD6D6D0A1A1EBD8D8F1E4E4EFDF
        DFEEDDDDEDDCDCEBDADAEAD7D7E9D4D4E8D2D2E6D1D1E6D0D0E3C8C8DBBABAE2
        C6C6E2C7C7E1C4C4E0C0C0E0C0C0E0C1C185545435180F3C170C784545BE9595
        9E6B6B825050532722230A007B2A069E410DAA4C12A3400F842A086E1E04AA48
        0ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1EBEBEBF3
        F3F3F9F9F9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE8EDEEC2BFBBE2DDDBFAFAFAFCFBFBF8F7F5F5F4F2F4F3F2F4F3F2F4F3
        F2F4F3F2F5F4F3F8F7F6F9F7F6F0EAE8D0C6BF91867E5A5149352D291C161313
        0E0D181415252124302C30302D31282528221D20231E1C332C29554D48897E76
        C5BCB4ECE6E2FAF7F6FAF9F9F6F5F4F4F3F2F5F4F2F3F2F0EDEBE9D3CDCAB4B3
        B077634B805A33C3996FE0D0C2ECEAEAF2C190A472406A380567340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        01673401AA7369E2CECEF7F1F1F4EAEAF3E9E9F4E9E9F4E9E9E9D4D4CE9F9FE2
        C7C7F1E4E4EFE0E0EDDDDDECDADAEAD8D8EAD6D6E9D5D5E9D3D3E0C3C3DAB6B6
        E3C9C9E9CFCFD5B6B6DDBEBEE6C8C8E8CBCBB38989673B37260F065D312DBE9C
        9CCFACACB68686AA7A7A6432301F09006D24058F3A0C99440F92380D7925076B
        1D04AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5D5E1E1E1
        EBEBEBF3F3F3F9F9F9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF2F6F7C6C4C3DBD4D2F9F8F7FDFDFEF9F9F8F5F4F3F4
        F3F2F4F3F2F4F3F2F4F3F2F4F3F2F5F4F3F5F5F4F8F7F6F7F3F2E9E1DECFC6BF
        ABA29B90867E7A6F6769615E685F5971665C82776F998F86B4AAA2D3C9C3E9E2
        DEF6F2F0F8F7F7F6F5F5F5F4F3F4F3F2F4F3F2F4F3F2F3F2EEE8E4E1CDC8C5B0
        AEA46A4D2D5028006B4014A5774AECBC8DF6EBE2FBF4EFE8B582966431673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016835026734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401AF776DD5B6B6FCF7F7F7F1F1F7F1F1F8F2F2F7EEEEF6EEEE
        F0E2E2D9B3B3D1A3A3DEBEBEE6CECEE8D4D4E9D4D4E5CBCBDDBFBFD7B0B0DBB9
        B9E5CECEDDC2C2A778788E58588D58588F5B5B9C6C6C8855557541417A47479C
        6A6AE7CBCBDCB9B9DFBCBCC096965E302D1908014517035F2608642C0A5B2308
        5B1C06641A04AA480ADF6E18FEAA44F8B130E69924CF7212B7B7B6C7C7C7D5D5
        D5E1E1E1EBEBEBF3F3F3F9F9F9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFBFBD1D4D3CCC7C4EDEAE8FBFAFA
        FAFAFAF7F7F5F5F4F3F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2F4F4F2F6F6F4F8F8
        F7FBF9F9FBF9F8F9F7F5F7F3F1F4F1EEF4F0EDF5F0EEF7F2F1F9F6F4FAF8F6FA
        F9F8F8F7F7F6F6F4F5F4F3F4F3F2F4F3F2F4F3F1F2F2F0EDEAE8D7D2CFC5C5C3
        BAB0A29D78517D532964370A5F3001815120C3915FFBD3ABFEF9F5FFEEDFD5A2
        6F87542167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734016734016734016734016734016734016734016734
        0167340167340167340167340167340167340167340167340167340167340167
        3401673401673401673401673401673401673401673401673401673401673401
        6734016734016734016734017A461CB17977E3CFCFE5D2D2D0ACACBB8988B984
        83D9BBBBF5EAEAF5EAEAEDDCDCE0C2C2D9B2B2D5ACACD5ADADD8B4B4DFC0C0E5
        CECEE9D2D2E9D4D4BA9191915C5CB47F7FB783839B66669A6666C18F8FDAA8A8
        E9B5B5E0ACACDEBFBFDBB9B9DCBABAC69E9E7B474761312E522214642F206F36
        2C5D29183E1304561703AA480ADF6E18FEAA44F8B130E69924CF7212B6B6B5C6
        C6C6D4D4D4DFDFDFE9E9E9F1F1F1F7F7F7FBFBFBFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFBFCFCE3E8E9C3C0
        BEDBD5D3F5F4F3FBFAFBFAFAF9F7F6F4F5F4F3F4F3F2F4F3F2F4F3F2F5F4F2F4
        F3F2F4F3F2F5F4F3F5F4F3F5F5F4F6F5F4F7F6F5F6F5F5F7F6F5F6F5F4F6F5F4
        F5F4F3F5F4F3F4F3F2F5F4F2F4F3F2F4F4F2F4F2F1EFEDEBE3DEDCCCC8C6C4C9
        C9C7C2B9CFAD8DC69A6EAB7D4F83532567370667360493602FD4A270FDDEC0FD
        FBFBFDE0C3C08E5B794614663401663401663401663401663401663401663401
        6634016634016634016634016634016634016634016634016634016634016634
        0166340166340166340166340166340166340166340166340166340166340166
        3401663401663401663401663401663401663401663401663401663401663401
        6634016634016634016634016634016634016634016634016634016634016634
        0166340166340166340166340166340166340166340166340166340166340166
        3401663401663401663401663401663401663401663401663401663401663401
        6634016634016634016634016634016634016634016634016634016634016634
        0166340166340166340166340166340166340166340166340166340166340166
        3401663401663401663401663401663401663401663401663401663401663401
        6634016634016634016634016634016634016634016634016634016634016634
        0166340166340166340166340166340166340166340166340166340166340166
        3401663401663401663401663401663401663401663401663401663401663401
        6634016634016634016634016634016634016634016634016634016634016634
        0166340166340166340166340166340166340166340166340166340166340166
        3401663401663401663401663401663401663401663401663401663401663401
        6634016634016735026634016634016634016634016634016634016634016634
        0166340166340166340166340166340166340187522FBA8483B67D769664507A
        49277E4D2CA8736AC19292F5ECECF1E4E4F1E4E4F1E5E5F3E5E5F2E4E4F0E2E2
        ECDBDBE9D5D5E7D2D2EAD4D4B98E8EAA7474CFA4A4E2C8C8CAA8A8AA7878E5B0
        B0E8BABADEB5B5DCB8B8DEBEBEDDBCBCDEBCBCC59C9CA16D6D936060966464AB
        7979AC7A7A6A3735351105451203AA480ADF6E18FEAA44F8B130E69924CF7212
        B4B4B3C4C4C4D1D1D1DCDCDCE6E6E6EDEDEDF3F3F3F7F7F7F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F0F3F4CED2D1CBC6C3E2DEDBF4F2F2FBFBFBFAF9F9F8F7F5F6F5F3F5F4F2
        F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2F5F3F2F5F4F2F4F3F2F5F4
        F2F5F4F2F4F3F2F4F4F2F4F3F2F5F4F2F4F3F2F1EEECE3DEDBD1CCCBC4C6C4C5
        CACBCDCECED7D4D3E1CEBCE8BD91D0A070AB7A497F4E1D6735036D3C0A9F6D3C
        E2B07EF9E4D0F9F8F8F9CFA5AC7A486D3C0A6533016533016533016533016533
        0165330165330165330165330165330165330165330165330165330165330165
        3301653301653301653301653301653301653301653301653301653301653301
        6533016533016533016533016533016533016533016533016533016533016533
        0165330165330165330165330165330165330165330165330165330165330165
        3301653301653301653301653301653301653301653301653301653301653301
        6533016533016533016533016533016533016533016533016533016533016533
        0165330165330165330165330165330165330165330165330165330165330165
        3301653301653301653301653301653301653301653301653301653301653301
        6533016533016533016533016533016533016533016533016533016533016533
        0165330165330165330165330165330165330165330165330165330165330165
        3301653301653301653301653301653301653301653301653301653301653301
        6533016533016533016533016533016533016533016533016533016533016533
        0165330165330165330165330165330165330165330165330165330165330165
        3301653301653301653301653301653301653301653301653301653301653301
        6533016533016533016533016533016533016533016533016533016533016533
        0165330165330165330165330165330165330165330165330165330165330165
        33016533016533016533016533016533016533016533016533016A390A643201
        65330165330164330178451FBD8A8AF7EEEEF1E4E4F2E5E5E9D6D6CBA6A6C39A
        9AB88B8BD6B7B7ECDADAE7D2D2E9D5D5C29C9C9F6E6EEFDBDBE7D0D0E7D0D0E6
        D0D0E1C8C8E2C8C8E2C6C6E3C9C9E2C9C9E1C5C5DDBCBCDEBCBCC7A0A0AA7676
        F8C4C4E4B1B1C795957A4646512218350E02AA480ADF6E18FEAA44F8B130E699
        24CF7212B2B2B1C0C0C0CDCDCDD8D8D8E1E1E1E8E8E8EDEDEDF1F1F1F3F3F3F3
        F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
        F3F3F3F3F3F3F3F3F3F1F2F2E0E6E7C8CDCDC9C7C5DAD4D1EDEAE9F6F5F4F9F8
        F7F9F8F8F8F8F7F7F6F5F6F4F4F5F4F3F4F3F2F5F4F2F5F4F2F5F4F2F4F3F2F4
        F3F2F5F4F3F5F4F2F4F4F3F4F3F1F2EFEFECE8E6DBD5D1CDCAC7C8CCCCC4CACB
        CBCCCCD4D4D4DBDBDBE3E3E3E9E3DFEDD3BBEBBC8CCA996A9E6F3E7545146232
        01724211A97847E9B988F3E6D9F3F0EDE8B78698683762320162320162320162
        3201623201623201623201623201623201623201623201623201623201623201
        6232016232016232016232016232016232016232016232016232016232016232
        0162320162320162320162320162320162320162320162320162320162320162
        3201623201623201623201623201623201623201623201623201623201623201
        6232016232016232016232016232016232016232016232016232016232016232
        0162320162320162320162320162320162320162320162320162320162320162
        3201623201623201623201623201623201623201623201623201623201623201
        6232016232016232016232016232016232016232016232016232016232016232
        0162320162320162320162320162320162320162320162320162320162320162
        3201623201623201623201623201623201623201623201623201623201623201
        6232016232016232016232016232016232016232016232016232016232016232
        0162320162320162320162320162320162320162320162320162320162320162
        3201623201623201623201623201623201623201623201623201623201623201
        6232016232016232016232016232016232016232016232016232016232016232
        0162320162320162320162320162320162320162320162320162320162320162
        3201623201623201623201623201623201623201623201623201623201623201
        6232016232016333026232016232016232016232016232016232016232016232
        01623201623201623201623201784822BF8D8DF7F0F0F2E6E6F5EAEABD8E8E84
        574B7C4F3A82513AA67170DBC0C0EBD9D9EDDADAC7A4A4956060BA9494EBD6D6
        E6CFCFE5CDCDE4CDCDE5CFCFE8D4D4E7D1D1E7D2D2E8D5D5EADADAE3CACADCBA
        BADAB4B4DDB5B5D7B2B2D9B3B39E6C6C6C38353B1003AA480ADF6E18FEAA44F8
        B130E69924CF7212AEAEADBCBCBCC8C8C8D2D2D2DADADAE1E1E1E6E6E6E9E9E9
        EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEB
        EBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBE7EAEBDCE4E5CAD1D2C6C5C2CF
        CAC8DED9D7E8E4E3F0EDEBF5F3F3F8F6F5F8F7F6F7F6F5F6F5F4F7F5F5F6F5F4
        F6F5F4F5F3F2F2EFEEEDEAE9E6E3E1DDD9D6D2CDCBC7C6C5C8CFD0C9CFD0CCCD
        CDD1D1D1D7D7D7DCDCDCE2E2E2E5E5E5E7E7E7EAE1D8EACCAFDFB081BD8E5F90
        61326C3D0E5E2F00794A1BB18253EBC095EBE4DEEBE0D7CD9E6F8455265F3001
        5F30015F30015F30015F30015F30015F30015F30015F30015F30015F30015F30
        015F30015F30015F30015F30015F30015F30015F30015F30015F30015F30015F
        30015F30015F30015F30015F30015F30015F30015F30015F30015F30015F3001
        5F30015F30015F30015F30015F30015F30015F30015F30015F30015F30015F30
        015F30015F30015F30015F30015F30015F30015F30015F30015F30015F30015F
        30015F30015F30015F30015F30015F30015F30015F30015F30015F30015F3001
        5F30015F30015F30015F30015F30015F30015F30015F30015F30015F30015F30
        015F30015F30015F30015F30015F30015F30015F30015F30015F30015F30015F
        30015F30015F30015F30015F30015F30015F30015F30015F30015F30015F3001
        5F30015F30015F30015F30015F30015F30015F30015F30015F30015F30015F30
        015F30015F30015F30015F30015F30015F30015F30015F30015F30015F30015F
        30015F30015F30015F30015F30015F30015F30015F30015F30015F30015F3001
        5F30015F30015F30015F30015F30015F30015F30015F30015F30015F30015F30
        015F30015F30015F30015F30015F30015F30015F30015F30015F30015F30015F
        30015F30015F30015F30015F30015F30015F30015F30015F30015F30015F3001
        5F30015F30015F30015F30015F30015F30015F30015F30015F30015F30015F30
        015F30015F30015F30015F30015F30015F30015F30015F30015F30015F30015F
        30015F30015F30015F30015F30015F3001764622C39191F9F5F5F7F0F0D9BBBB
        996A64482404582B015C2D01804D31A97474D9BEBEB78D8D93605D6F453C9765
        65F1E0E0E8D3D3E6D0D0E4CCCCE5CDCDE4CCCCE4CACAE1C7C7E0C3C3E0C2C2E8
        D2D2E6CECEDBB9B9DAB6B6D9B5B5DFBABAAC7F7F713C3A541907AA480ADF6E18
        FEAA44F8B130E69924CF7212AAAAA9B6B6B6C1C1C1CACACAD2D2D2D8D8D8DCDC
        DCDFDFDFE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
        E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E0E1E1
        DCE3E4D4DEDFC8CECEC6C9C8CCCAC8D1CECBD5D0CDDAD3D2DED8D6DFDAD7DFDA
        D8DDD7D6D9D4D1D5D1CFD1CECDCDCCCBC8CBCAC7CDCDCCD3D4CDD2D3CBCCCCCE
        CECED2D2D2D6D6D6D9D9D9DDDDDDDEDEDEE0E0E0E0E0E0E1E1E1E1D5C9E1BF9E
        CEA174AD80538154276235085D30037D5023B88B5EE1C1A2E1DEDDE1CEBCB386
        597144175B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B
        2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E01
        5B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E
        015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B
        2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E01
        5B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E
        015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B
        2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E01
        5B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E
        015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B
        2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015C2F02
        5B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E
        015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B
        2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E01
        5B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E
        015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B
        2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E015B2E01
        5B2E015B2E015B2E015B2E015B2E015B2E015B2E016B3C15BD8885C08C8CCBA2
        A2BB8887613A1F522901592D01592D01592C0188543DA57170986463784A4389
        5654BA9696EEDDDDEAD6D6E2C5C5E5CFCFE8D2D2E2C7C7D7ADADDCADADE3B7B7
        E3C2C2DFBFBFE5CFCFE1C3C3DAB7B7DEBABAA17474743D3867240F661C04AA48
        0ADF6E18FEAA44F8B130E69924CF7212A5A5A4AFAFAFB9B9B9C1C1C1C8C8C8CD
        CDCDD1D1D1D4D4D4D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5
        D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5
        D5D5D5D5D5D5D5D4D5D5D5D8D9D3D8D9D2D9DACFD5D5CDD2D2CDD2D3CED2D2CD
        D2D2CDD2D2CCD1D1CCD0D0CBD0D1CCD1D2CDD3D5CDD1D2CBCDCDCBCBCBCBCBCB
        CDCDCDCFCFCFD1D1D1D2D2D2D3D3D3D4D4D4D4D4D4D5D5D5D5D5D5D5D5D5D5D4
        D4D5C5B6D5B08BBD92689A6F4472481D592E035B300682582DBA9065D5BFAAD5
        D4D4D5B79A9B714662370D562B01562B01562B01562B01562B01562B01562B01
        562B01562B01562B01562B01562B01562B01562B01562B01562B01562B01562B
        01562B01562B01562B01562B01562B01562B01562B01562B01562B01562B0156
        2B01562B01562B01562B01562B01562B01562B01562B01562B01562B01562B01
        562B01562B01562B01562B01562B01562B01562B01562B01562B01562B01562B
        01562B01562B01562B01562B01562B01562B01562B01562B01562B01562B0156
        2B01562B01562B01562B01562B01562B01562B01562B01562B01562B01562B01
        562B01562B01562B01562B01562B01562B01562B01562B01562B01562B01562B
        01562B01562B01562B01562B01562B01562B01562B01562B01562B01562B0156
        2B01562B01562B01562B01562B01562B01562B01562B01562B01562B01562B01
        562B01562B01562B01562B01562B01562B01562B01562B01562B01562B01562B
        01562B01562B01562B01562B01562B01562B01562B01562B01562B01562B0156
        2B01562B01562B01562B01562B01562B01562B01562B01562B01562B01562B01
        562B01562B01562B01562B01562B01562B01562B01562B01562B01562B01562B
        01562B01562B01562B01562B01562B01562B01562B01562B01562B01562B0156
        2B01562B01562B01562B01562B01562B01562B01562B01572C02562B01562B01
        562B01562B01562B01562B01562B01562B01562B01562B01562B01562B01562B
        01562B01562B01562B01562B01562B01562B01562B01562B01562B015C300870
        432288574082533A522901542A01552A01552A01552A01552A01825244A67777
        C69696D8A4A4E3BBBBEFDFDFE5CDCDE1C7C7EBD8D8E2C9C9BD86868258506E44
        3598685EE5B0AFE1C2C2E0C3C3E4CCCCDCB9B9CFA8A8743F3C4A1F0A5F1F0666
        1D04AA480ADF6E18FEAA44F8B130E69924CF72129F9F9EA8A8A8AFAFAFB6B6B6
        BCBCBCC0C0C0C4C4C4C6C6C6C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
        C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
        C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C6C6C6C6C6C6C6C6C6C5C5C5
        C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5
        C5C5C5C5C6C6C6C6C6C6C6C6C6C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
        C7C7C7C7C7C7C4C2C7B4A2C69E77A9825A886038633B145129025B340C845C34
        BA926AC7B9ACC7C5C5C59E76835B34542C045029015029015029015029015029
        0150290150290150290150290150290150290150290150290150290150290150
        2901502901502901502901502901502901502901502901502901502901502901
        5029015029015029015029015029015029015029015029015029015029015029
        0150290150290150290150290150290150290150290150290150290150290150
        2901502901502901502901502901502901502901502901502901502901502901
        5029015029015029015029015029015029015029015029015029015029015029
        0150290150290150290150290150290150290150290150290150290150290150
        2901502901502901502901502901502901502901502901502901502901502901
        5029015029015029015029015029015029015029015029015029015029015029
        0150290150290150290150290150290150290150290150290150290150290150
        2901502901502901502901502901502901502901502901502901502901502901
        5029015029015029015029015029015029015029015029015029015029015029
        0150290150290150290150290150290150290150290150290150290150290150
        2901502901502901502901502901502901502901502901502901502901502901
        5029015029015029015029015029015029015029015029015029015029015029
        0150290150290150290150290150290150290150290150290150290150290150
        2901502901502901502901502901502901502901502901502901502901502901
        5029015029015029015029015029015029015029015029014F28014F2801935D
        56DEB1B1EDBCBCE2BABAE7CECEEFE1E1DDBFBFE9D4D4F0E0E0B6888863403724
        0F01341401361400A87973E1BABADFC1C1E3C9C9DDBCBCD7B3B37A4544411C09
        401504521803AA480ADF6E18FEAA44F8B130E69924CF72129898979F9F9FA5A5
        A5AAAAAAAEAEAEB2B2B2B4B4B4B6B6B6B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7
        B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7
        B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7
        B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7
        B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7
        B7B7B7B7B7B7B7B7B7B7B7B7B7B1ACB7A18DB18C6796714D74502B56320D4925
        005A351185603CB6916CB7B0A9B7B2AEA6825D6C48234A25014A25014A25014A
        25014A25014A25014A25014A25014A25014A25014A25014A25014A25014A2501
        4A25014A25014A25014A25014A25014A25014A25014A25014A25014A25014A25
        014A25014A25014A25014A25014A25014A25014A25014A25014A25014A25014A
        25014A25014A25014A25014A25014A25014A25014A25014A25014A25014A2501
        4A25014A25014A25014A25014A25014A25014A25014A25014A25014A25014A25
        014A25014A25014A25014A25014A25014A25014A25014A25014A25014A25014A
        25014A25014A25014A25014A25014B26014A25014A25014A25014A25014A2501
        4A25014A25014A25014A25014A25014A25014A25014A25014A25014A25014A25
        014A25014A25014A25014A25014A25014A25014A25014A25014A25014A25014A
        25014A25014A25014A25014A25014A25014A25014A25014A25014A25014A2501
        4A25014A25014A25014A25014A25014A25014A25014A25014A25014A25014A25
        014A25014A25014A25014A25014A25014A25014A25014A25014A25014A25014A
        25014A25014A25014A25014A25014A25014A25014A25014A25014A25014A2501
        4A25014A25014A25014A25014A25014A25014A25014A25014A25014A25014A25
        014A25014A25014A25014A25014A25014A25014A25014A25014A25014A25014A
        25014A25014A25014A25014A25014A25014A25014A25014A25014A25014A2501
        4A25014A25014A25014A25014A25014A25014A25014A25014A25014A25014A25
        014A25014A25014A25014A25014A25014A25014A25014A25014A25014A25014A
        2501955E58DCC5C5F5ECECF1E6E6F0E3E3F0E3E3D8B2B2EEDEDEE4D1D1965F5F
        56362E170A001F0C012A1408B48482DEBBBBE1C2C2E1C4C4DFBFBFCFA6A68D58
        587E4A464C20123E1303AA480ADF6E18FEAA44F8B130E69924CF721292929197
        97979B9B9B9F9F9FA3A3A3A5A5A5A7A7A7A8A8A8A9A9A9A9A9A9A9A9A9A9A9A9
        A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9
        A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9
        A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9
        A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9
        A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A099A9917A9E7C5A85634264
        42204C2A084422015B3917856341A98E73A9A6A3A99E948D6B4A5A3817442201
        4422014422014422014422014422014523014422014422014422014422014422
        0144220144220144220144220144220144220144220144220144220144220144
        2201442201442201442201442201442201442201442201442201442201442201
        4422014422014422014422014422014422014422014422014422014422014422
        0144220144220144220144220144220144220144220144220144220144220144
        2201442201442201442201442201442201442201442201442201442201442201
        4422014422014422014422014422014422014422014422014422014422014422
        0144220144220144220144220144220144220144220144220144220144220144
        2201442201442201442201442201442201442201442201442201442201442201
        4422014422014422014422014422014422014422014422014422014422014422
        0144220144220144220144220144220144220144220144220144220144220144
        2201442201442201442201442201442201442201442201442201442201442201
        4422014422014422014422014422014422014422014422014422014422014422
        0144220144220144220144220144220144220144220144220144220144220144
        2201442201442201442201442201442201442201442201442201442201442201
        4422014422014422014422014422014422014422014422014422014422014422
        0144220144220144220144220144220144220144220144220144220144220144
        2201442201442201442201442201442201442201442201442201442201442201
        4422014422018A584ED1B5B5F8EFEFF3E8E8F2E4E4F2E6E6D6AFAFEEDEDEE9D7
        D7925C5C9C696970494463403AA1706ED3ABABE4C9C9E0C4C4DDBFBFDEBEBED1
        ABAB9F6A6A9663637A433C3A1202AA480ADF6E18FEAA44F8B130E69924CF7212
        8C8C8B9090909393939696969898989A9A9A9C9C9C9D9D9D9D9D9D9D9D9D9D9D
        9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
        9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
        9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
        9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D
        9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D93899D836A
        8E6E4F7556365737184324044122025C3C1D8465469D8A779D9C9C9D8B797758
        394B2C0C3F20013F20013F20013F20013F20013F20013F20013F20013F20013F
        20013F20013F20013F20013F20013F20013F20013F20013F20013F20013F2001
        3F20013F20013F20013F20013F20013F20013F20013F20013F20013F20013F20
        013F20013F20013F20013F20013F20013F20013F20013F20013F20013F20013F
        20013F20013F20013F20013F20013F20013F20013F20013F20013F20013F2001
        3F20013F20013F20013F20013F20013F20013F20013F20013F20013F20013F20
        013F20013F20013F20013F20013F20013F20013F20013F20013F20013F20013F
        20013F20013F20013F20013F20013F20013F20013F20013F20013F20013F2001
        3F20013F20013F20013F20013F20013F20013F20013F20013F20013F20013F20
        013F20013F20013F20013F20013F20013F20013F20013F20013F20013F20013F
        20013F20013F20013F20013F20013F20013F20013F20013F20013F20013F2001
        3F20013F20013F20013F20013F20013F20013F20013F20013F20013F20013F20
        013F20013F20013F20013F20013F20013F20014021013F20013F20013F20013F
        20013F20013F20013F20013F20013F20013F20013F20013F20013F20013F2001
        3F20013F20013F20013F20013F20013F20013F20013F20013F20013F20013F20
        013F20013F20013F20013F20013F20013F20013F20013F20013F20013F20013F
        20013F20013F20013F20013F20013F20013F20013F20013F20013F20013F2001
        3F20013F20013F20013F20013F20013F20013F20013F20013F20013F20013F20
        013F20013F20013F2001805345B99090E2CECEF1E5E5F6EEEEF3E9E9DBB7B7E6
        CECEF3E6E6C19C9CB37D7DBD8888CE9A9AEFC8C8F1DEDEE4C9C9DEBFBFDCBCBC
        DFBFBFDEBEBEDAB8B8BA8D8D814D4B4D1A05AA480ADF6E18FEAA44F8B130E699
        24CF72128888878A8A8A8D8D8D8F8F8F90909091919192929293939393939393
        9393939393939393939393939393939393939393939393939393939393939393
        9393939393939393939393939393939393939393939393939393939393939393
        9393939393939393939393939393939393939393939393939393939393939393
        9393939393939393939393939393939393939393939393939393939393939393
        9393939393939393939393939393939393939393939393939393939393939391
        9193867B93775C806345674A2C4C2F113D1F024124065E412385684A93867B93
        9292937A6066492B4123063B1E013B1E013B1E013B1E013B1E013B1E013B1E01
        3B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E
        013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B
        1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E01
        3B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E
        013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B
        1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E01
        3B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E
        013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B
        1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E01
        3B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E
        013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B
        1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E01
        3B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E
        013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B
        1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E01
        3B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E
        013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B1E013B
        1E013B1E013B1E013B1E013B1E015130178D5D539F6A66A87070C8A4A4F9F1F1
        EBD7D7D3A8A8F1E3E3F3E4E4E1C7C7E4BFBFF4D0D0EDD4D4E5CDCDE2C5C5D8B2
        B2E0C2C2DEC0C0DEBDBDE2C0C0A57878743C2E642305AA480ADF6E18FEAA44F8
        B130E69924CF72128484848686868787878888878989888A8A898B8B8A8B8B8A
        8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B
        8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B
        8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A
        8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B
        8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B8B8A8B
        8B8A8B8B8A8B88858B7C6E886C5175593D5B3F2344280C391C0143260A604529
        866A4E8B847D8B898784694D573B1F391C01391C01391C01391C01391C01391C
        01391C01391C01391C01391C01391C01391C01391C01391C01391C01391C0139
        1C01391C01391C01391C01391C01391C01391C01391C01391C01391C01391C01
        391C01391C01391C01391C01391C01391C01391C01391C01391C01391C01391C
        01391C01391C01391C01391C01391C01391C01391C01391C01391C01391C0139
        1C01391C01391C01391C01391C01391C01391C01391C01391C01391C01391C01
        391C01391C01391C01391C01391C01391C01391C01391C01391C01391C01391C
        01391C01391C01391C01391C01391C01391C01391C01391C01391C01391C0139
        1C01391C01391C01391C01391C01391C01391C01391C01391C01391C01391C01
        391C01391C01391C01391C01391C01391C01391C01391C01391C01391C01391C
        01391C01391C01391C01391C01391C01391C01391C01391C01391C01391C0139
        1C01391C01391C01391C01391C01391C01391C01391C01391C01391C01391C01
        391C01391C01391C01391C01391C01391C01391C01391C01391C01391C01391C
        01391C01391C01391C01391C01391C01391C01391C01391C01391C01391C0139
        1C01391C01391C01391C01391C01391C01391C01391C01391C01391C01391C01
        391C01391C01391C01391C01391C01391C01391C01391C01391C01391C01391C
        01391C01391C01391C01391C01391C01391C01391C01391C01391C01391C0139
        1C01391C01391C01391C01391C01391C01391C01391C01391C01391C01391C01
        391C01391C01391C01391C01391C01391C01391C01391C01391C014A2A14A66F
        6EEADCDCF5EDEDDFBFBFD3A9A9ECD9D9EFE1E1ECDDDDEAD8D8E9D4D4DFC1C1D6
        ADADE1C2C2E5C9C9E3C5C5E5C6C6D2AEAE84504D6E3010782C05AA480ADF6E18
        FEAA44F8B130E69924CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF72
        12CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF
        7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212
        CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF72
        12CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF
        7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212
        CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF72
        12CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF
        7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212
        CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF72
        12CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF
        7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212
        CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF72
        12CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF
        7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212
        CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF72
        12CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF
        7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212
        CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF72
        12CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF
        7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212
        CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF72
        12CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF
        7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212
        CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF72
        12CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212CF7212C5
        742DB37F7DEAD9D9F4EBEBF3EAEAE3C9C9CE9E9ED4A9A9DAB7B7D8B2B2D2A5A5
        D7AEAEE5CACAD7B8B89C6A6A935E5E9765659360609C5B37923F0D873207AA48
        0ADF6E18FEAA44F8B130E69924E69924E69924E69924E69924E69924E69924E6
        9924E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924
        E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E699
        24E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E6
        9924E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924
        E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E699
        24E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E6
        9924E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924
        E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E699
        24E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E6
        9924E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924
        E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E699
        24E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E6
        9924E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924
        E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E699
        24E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E6
        9924E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924
        E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E699
        24E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E6
        9924E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924
        E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E699
        24E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E6
        9924E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924
        E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E699
        24E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924E6
        9924E69924E69924E69924E69924E69924E69924E69924E69924E69924E69924
        E69924D39151C69999F0E1E1F5ECECF4E8E8F4EBEBF3E8E8E8D3D3E1C4C4E0C4
        C4E5CDCDE9D3D3D8BBBB9B656286542CAB6821BE742DC67F36CA7220A84B108D
        3707AA480ADF6E18FEAA44F8B130F8B130F8B130F8B130F8B130F8B130F8B130
        F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B1
        30F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8
        B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130
        F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B1
        30F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8
        B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130
        F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B1
        30F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8
        B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130
        F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B1
        30F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8
        B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130
        F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B1
        30F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8
        B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130
        F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B1
        30F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8
        B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130
        F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B1
        30F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8
        B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130
        F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B1
        30F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8
        B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130
        F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B130F8B1
        30F8B130F8B130E1A15ACCA3A3FDFCFCF8F1F1F0E4E4CEA8A8CCA8A8D2B0B0D8
        BDBDEDDDDDE9D4D4E8D2D2D0B0B09C68547A5216CA8724E59829E49729D97F21
        AE5011903908AC490AE06E18FFE7CAFFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDF
        B8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FF
        DFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8
        FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDF
        B8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FF
        DFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8
        FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDF
        B8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FF
        DFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8
        FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDF
        B8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FF
        DFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8
        FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDF
        B8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FF
        DFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8
        FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDF
        B8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FF
        DFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8
        FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDF
        B8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FF
        DFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8
        FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDF
        B8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FF
        DFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8
        FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDF
        B8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FFDFB8FF
        DFB8FFDFB8FFDFB8FFDFB8F7D1B3C6928FD0A8A8E1CACAC18D8DC5998DD3A796
        D1A092B67F7BD5B6B6EDD9D9ECD8D8D3B4B4A4766F9C836BDEB998F2C9A4F196
        36DF8423B45513933C08AE4A0ADA6B18E57019E57019E57019E57019E57019E5
        7019E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019
        E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019E570
        19E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019E5
        7019E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019
        E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019E570
        19E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019E5
        7019E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019
        E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019E570
        19E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019E5
        7019E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019
        E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019E570
        19E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019E5
        7019E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019
        E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019E570
        19E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019E5
        7019E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019
        E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019E570
        19E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019E5
        7019E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019
        E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019E570
        19E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019E5
        7019E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019
        E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019E570
        19E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019E5
        7019E57019E57019E57019E57019E57019E57019E57019E57019E57019E57019
        E57019E57019E57019E57019E57019E57019E47425DB8864D69588D37741D668
        18DF6C19E26E18D9783EB48080D4B6B6BE9393A87474B06B51C45D14D86716DD
        6917DB6817CF6315B85814963E08AF4A0AB14B0AB24B0AB14B0AB14B0AB14B0A
        B14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B
        0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB1
        4B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0A
        B14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B
        0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB1
        4B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0A
        B14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B
        0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB1
        4B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0A
        B14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B
        0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB1
        4B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0A
        B14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B
        0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB1
        4B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0A
        B14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B
        0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB1
        4B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0A
        B14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B
        0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB1
        4B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0A
        B14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B
        0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB1
        4B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0A
        B14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B
        0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB14B0AB04B0AB0
        4B0AB04B0AB04A0AB04A0AB04A0AB76D55A96D62A35B3FA14D20A6470CAC480A
        AE490AAE480AAD480AAA460AA3430A9B4109}
    end
  end
  object StatusBar1: TdxStatusBar
    Left = 0
    Top = 419
    Width = 754
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 520
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clNavy
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = []
        PanelStyle.ParentFont = False
        Text = #1055#1086#1087#1088#1072#1074#1082#1072':'
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clBlue
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = []
        PanelStyle.ParentFont = False
      end>
    PaintStyle = stpsOffice11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Query: TpFIBQuery
    Database = dm.DataBase
    Transaction = dm.ReadTransaction
    Left = 424
    Top = 88
  end
  object StoredProc: TpFIBStoredProc
    Database = dm.DataBase
    Transaction = dm.WriteTransaction
    Left = 452
    Top = 88
  end
  object RowDataset: TfrUserDataset
    Left = 236
    Top = 90
  end
  object ColDataset: TfrUserDataset
    Left = 265
    Top = 90
  end
  object Report: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit, pbPageSetup]
    RebuildPrinter = False
    OnBeginBand = ReportBeginBand
    Left = 208
    Top = 90
    ReportForm = {19000000}
  end
  object ActionList1: TActionList
    Left = 344
    Top = 90
    object ActionExit: TAction
      Caption = 'ActionExit'
      ShortCut = 27
      OnExecute = ActionExitExecute
    end
  end
  object FontDialog: TFontDialog
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Device = fdBoth
    Left = 304
    Top = 90
  end
  object RTFExport: TfrRTFExport
    ScaleX = 1.300000000000000000
    ScaleY = 1.000000000000000000
    Left = 632
    Top = 90
  end
  object HTML2Export: TfrHTML2Export
    Scale = 1.000000000000000000
    Navigator.Position = []
    Navigator.Font.Charset = DEFAULT_CHARSET
    Navigator.Font.Color = clWindowText
    Navigator.Font.Height = -11
    Navigator.Font.Name = 'MS Sans Serif'
    Navigator.Font.Style = []
    Navigator.InFrame = False
    Navigator.WideInFrame = False
    Left = 680
    Top = 90
  end
  object SaveDialog: TSaveDialog
    Title = #1047#1073#1077#1088#1077#1078#1077#1085#1085#1103' '#1079#1074#1110#1090#1091
    Left = 716
    Top = 90
  end
  object DataSet: TpFIBDataSet
    Database = dm.DataBase
    Transaction = dm.ReadTransaction
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 480
    Top = 88
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ImageList2: TImageList
    Left = 379
    Top = 90
    Bitmap = {
      494C01010B000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
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
      0000000000000000000081000000000000008100000000000000810000000000
      0000810000000000000081000000000000000000000000000000000000000000
      000000000000006A0000006A0000006A0000006A0000006A0000006A0000006A
      0000006A0000006A0000006A0000006A00000000000000000000000000000000
      000000000000811E0000811E0000811E0000811E0000811E0000811E0000811E
      0000811E0000811E0000811E0000811E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000095655F00A5696A00A5696A00A569
      6A00A5696A0081000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008100000095655F00A5696A00A5696A00A569
      6A00A5696A00006A0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006A000095655F00A5696A00A5696A00A569
      6A00A5696A00811E0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00811E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000098686000FBE5C000F4D5AD00F0CF
      9F00EFCA960000000000FFFFFF00EDCFCF007204040075040400FFFFFF007F3B
      3B0073020200C19C9C00FFFFFF000000000098686000FBE5C000F4D5AD00F0CF
      9F00EFCA9600006A0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006A000098686000FBE5C000F4D5AD00F0CF
      9F00EFCA9600811E0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00811E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009D6B6200FCE7C900F2D5B500F0D0
      A900EECB9E0081000000FFFFFF00E7CECE00690101006C010100FFFFFF00893B
      3B0069000000C7999900FFFFFF00810000009D6B6200FCE7C900F2D5B500F0D0
      A900EECB9E00006A0000FFFFFF0078BB7800006A00001C831C00FAFCFA006AB4
      6A00006A00004DA34D00FFFFFF00006A00009D6B6200FCE7C900F2D5B500F0D0
      A900EECB9E00811E0000FFFFFF00FFFFFF00FFFFFF00811E0000FFFFFF00811E
      0000FFFFFF00811E0000FFFFFF00811E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A36F6400FEEED400F4DDC000F2D7
      B500F0D1AA0000000000FFFFFF00E5CECE006802020049000000BB999900C518
      18005C000000CF999900FFFFFF0000000000A36F6400FEEED400F4DDC000F2D7
      B500F0D1AA00006A0000FFFFFF00FFFFFF00B4DAB400016C01000D780D00006A
      00006AB46A00FFFFFF00FFFFFF00006A0000A36F6400FEEED400F4DDC000F2D7
      B500F0D1AA00811E0000FFFFFF00811E0000811E0000FFFFFF00FFFFFF00811E
      0000FFFFFF00811E0000FFFFFF00811E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A7746600FFF4E100F6E1CA00F3DC
      BF00F2D7B40081000000FFFFFF00E9D9D90059000000D9575700810000006D52
      520058000000D7A4A400FFFFFF0081000000A7746600FFF4E100F6E1CA00F3DC
      BF00F2D7B400006A0000FFFFFF00FFFFFF00FFFFFF004EA44E00006A00000A76
      0A00FAFCFA00FFFFFF00FFFFFF00006A0000A7746600FFF4E100F6E1CA00F3DC
      BF00F2D7B400811E0000811E0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00811E
      0000FFFFFF00811E0000FFFFFF00811E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD786900FFFBEE00F7E7D500F4E1
      CA00F3DCBF0000000000FFFFFF00F28989006C000000C69D9D005F000000D39D
      9D0077020200795E5E00FFFFFF0000000000AD786900FFFBEE00F7E7D500F4E1
      CA00F3DCBF00006A0000FFFFFF00FFFFFF005FAD5F00006A00004AA14A00016C
      010023892300EEF7EE00FFFFFF00006A0000AD786900FFFBEE00F7E7D500F4E1
      CA00F3DCBF00811E0000FFFFFF00811E0000811E0000FFFFFF00FFFFFF00811E
      0000811E0000FFFFFF00FFFFFF00811E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47E6B00FFFFFB00F8EDE100F7E6
      D400F6E1C90081000000FFFFFF00520505006C000000BB8F8F005C000000CE8C
      8C006D03030076000000FFFFFF0081000000B47E6B00FFFFFB00F8EDE100F7E6
      D400F6E1C900006A0000FFFFFF00469F4600006A000060AD6000FFFFFF00BBDD
      BB00016B010023892300FFFFFF00006A0000B47E6B00FFFFFB00F8EDE100F7E6
      D400F6E1C900811E0000FFFFFF00FFFFFF00FFFFFF00811E0000FFFFFF00811E
      0000FFFFFF00FFFFFF00FFFFFF00811E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BA836D00FFFFFF00FCF4EE00FAED
      E100F8E9D50000000000FFFFFF00AD2D2D0065141400EAA3A30092141400B6A1
      A100752020006E171700FFFFFF0000000000BA836D00FFFFFF00FCF4EE00FAED
      E100F8E9D500006A0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006A0000BA836D00FFFFFF00FCF4EE00FAED
      E100F8E9D500811E0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00811E
      0000FFFFFF00FFFFFF00FFFFFF00811E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BF877000FFFFFF00FFFBFA00FEF4
      ED00FAEEE00081000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0081000000BF877000FFFFFF00FFFBFA00FEF4
      ED00FAEEE000006A0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006A0000BF877000FFFFFF00FFFBFA00FEF4
      ED00FAEEE000811E0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00811E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C48C7200FFFFFF00FFFFFF00FFFC
      FA00FCF4ED000000000081000000000000008100000000000000810000000000
      000081000000000000008100000000000000C48C7200FFFFFF00FFFFFF00FFFC
      FA00FCF4ED00006A0000006A0000006A0000006A0000006A0000006A0000006A
      0000006A0000006A0000006A0000006A0000C48C7200FFFFFF00FFFFFF00FFFC
      FA00FCF4ED00811E0000811E0000811E0000811E0000811E0000811E0000811E
      0000811E0000811E0000811E0000811E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CA917400FFFFFF00FFFFFF00FFFF
      FF00FFFCFA00FCF4ED00FAEDDE00F8E7D400FCEBD300E3D3BB00B7AD9C00A569
      6A0000000000000000000000000000000000CA917400FFFFFF00FFFFFF00FFFF
      FF00FFFCFA00FCF4ED00FAEDDE00F8E7D400FCEBD300E3D3BB00B7AD9C00A569
      6A0000000000000000000000000000000000CA917400FFFFFF00FFFFFF00FFFF
      FF00FFFCFA00FCF4ED00FAEDDE00F8E7D400FCEBD300E3D3BB00B7AD9C00A569
      6A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE957600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFCFA00FCF6EB00FAEFE000A5696A00A5696A00A5696A00A569
      6A0000000000000000000000000000000000CE957600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFCFA00FCF6EB00FAEFE000A5696A00A5696A00A5696A00A569
      6A0000000000000000000000000000000000CE957600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFCFA00FCF6EB00FAEFE000A5696A00A5696A00A5696A00A569
      6A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D3977800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFC00F4EBE600A5696A00E2A35B00EF993800BB70
      4F0000000000000000000000000000000000D3977800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFC00F4EBE600A5696A00E2A35B00EF993800BB70
      4F0000000000000000000000000000000000D3977800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFC00F4EBE600A5696A00E2A35B00EF993800BB70
      4F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D59A7900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F8F8FE00A5696A00E5A55F00C2805C000000
      000000000000000000000000000000000000D59A7900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F8F8FE00A5696A00E5A55F00C2805C000000
      000000000000000000000000000000000000D59A7900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F8F8FE00A5696A00E5A55F00C2805C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D0906B00D0906B00D0906B00D090
      6B00D0906B00D0906B00D0906B00D0906B00A5696A00BB7F6A00000000000000
      000000000000000000000000000000000000D0906B00D0906B00D0906B00D090
      6B00D0906B00D0906B00D0906B00D0906B00A5696A00BB7F6A00000000000000
      000000000000000000000000000000000000D0906B00D0906B00D0906B00D090
      6B00D0906B00D0906B00D0906B00D0906B00A5696A00BB7F6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006C6A6A006C6A6A0000000000000000006C6A6A006C6A6A00000000000000
      0000000000000000000000000000000000000000000000000000A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C6A
      6A00AAA7A700A19F9F006C6A6A006C6A6A006C6A6A00E5E3E3006C6A6A006C6A
      6A006C6A6A00000000000000000000000000000000000000000048536000FEE9
      C700F4DAB500F3D5AA00F2D0A000EFCB9600EFC68B00EDC18200EBC17F00EBC1
      8000EBC18000F2C78200A467690000000000A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A46769000000000000000000000000008957530089575300895754008957
      5300895753008957530089575300895753008957530089575300000000000000
      00000000000000000000000000000000000000000000000000006C6A6A00DAD9
      D900A19F9F00A19F9F00A19F9F0037363600353535006C6D6D00BFBFBF00E1E2
      E200B7B6B6006C6A6A006C6A6A006C6A6A00000000004380B7001F6FC200656B
      8600F3DABC00F2D5B100F0D0A700EECB9E00EDC79300EDC28B00E9BD8100E9BD
      7F00E9BD7F00EFC48100A467690000000000A4676900FCEACE00F0D8BA00DCC1
      A000C4AA8900BFA48000CFAF8200DCB58100E2B87E00E7BC7E00E9BD7F00EFC4
      8100A467690000000000000000000000000089575300E7D5C400E2CFBC00E2CC
      B800E1CBB500E1CBB400E1CAB500E1CBB600E7D5BD0089575300000000000000
      000000000000000000000000000000000000000000006C6A6A00D4D3D300CACA
      CA008E8C8C008E8C8C008E8C8C003C3B3B000A090A00070707000B0B0B000707
      07007A7A7A00BBBBBB006C6A6A0000000000000000000000000032A3FF001672
      D7006B6A8000F2DABC00F2D5B200EFD0A900EECB9E00EDC79600EBC28C00E9BD
      8200E9BD7F00EFC48100A467690000000000A0675B00FEEFDA00F6E0C600302D
      2D00212527003745460099846800AD926F00C2A07400DCB27A00E7BC7E00EFC4
      8100A4676900000000000000000000000000AD706B00F8EEDD00F2E6D700EFE3
      D300EFE1CE00EDDECA00EDDDC700EDDEC700F6E7CE0089575300000000000000
      0000000000000000000000000000000000006C6A6A00CACACA00CACACA008E8C
      8C00D7D4D400CECBCB00BFBCBC00B1AFAF00A3A0A000888686005E5B5C000707
      070009090900080808006C6A6A00767373000000000000000000A0675B0034A1
      FF001572D4005E678200F3DABB00F2D5B100F0D0A600EECB9E00EDC79500EBC2
      8A00EABF8100EFC48000A467690000000000A0675B00FFF4E500F7E5CF009C8F
      80000D466300036292000B3B54004B474100917B5E00B5976C00D1AB7400E9BF
      7D00A4676900000000000000000000000000B4766D00F7EFE300F7D5B200F8CB
      A100F7CBA300F6CBA000F6CA9D00F3CFAA00F3E6CE0089575300000000000000
      0000000000000000000000000000000000006C6A6A00CACACA008E8C8C00EFEE
      EE00FFFEFE00FBFAFA00E3E0E100DEDEDE00DEDDDD00CFCECE00BDBCBC00ADAB
      AB008B898900585656007A787800757373000000000000000000A7756B00FFFB
      F00033A6FF004078AD008E675E00AC7F750097645E00AC7D6F00CAA08300EDC6
      9500EBC28A00EFC58300A467690000000000A7756B00FFFBF000F8EADC00EEDD
      CA0022576C00165E8200745D65007D5254005E3F390086725800A78C6600CEAA
      7300A0656700000000000000000000000000BB7D6E00F7F3EA00F6E2CC00F6DC
      C200F4DAC000F3D9BC00F3D7B800EED5BA00F0E3CB0089575300000000000000
      0000000000000000000000000000000000006C6A6A008E8C8C00FFFFFF00FEFC
      FC00FAFAFA00D5D4D50098919300A0989900B2ABAC00C4C0C100D7D7D700D8D8
      D800C7C6C600B7B6B600918F8F006C6969000000000000000000A7756B00FFFF
      FC00FAF0E600AD8A8800B78F8400D8BAA500EED5B600D7B29800B5887700CBA0
      8300EBC79300F2C98C00A467690000000000A7756B00FFFFFF00808080008080
      80008F9F9D0062555D00DD908C00008000008E5757005B3D37007D6B51009A81
      5D00925C5E00000000000000000000000000C4866F00FAF6EE00F6D5B500F3C9
      9F00F6CBA300F8CBA100EEC29800D4B79700D1C9B70089575300000000000000
      000000000000000000000000000000000000000000006C6A6A006C6A6A00EDEB
      EB00B1A6A7007A6F72008A83880096929500969091009D9798009A9395009E98
      9900BBBABA00D1D1D100C2C2C2006C6A6A000000000000000000BC826800FFFF
      FF00FEF7F200AF847F00DAC0B400F7E3CF00F6E0C500FFFFF400D7B19800AC7D
      6F00EECC9E00F3CE9700A467690000000000BC826800FFFFFF00FEF7F200FAEF
      E600F0E5D5006B5D620000FF0000CF9090000080000087535300583C35007A69
      500081535400000000000000000000000000CA8C7200FBF7F200E1D4C600C6B6
      A700D4C2B100E1CEBB00C1AF9D0091847800918B80007E5F5800000000000000
      0000000000000000000000000000000000000000000000000000000000006C6A
      6A00BB897F00A7876D008B6F64007D6760006F626500797379008F8B8E00A9A3
      A400CBCACA00C1C1C1006C6A6A00000000000000000000000000BC826800FFFF
      FF00FFFEFC0097656000F6E9E000F7EADA00F6E3CF00FFFFEB00EFD4B7009764
      5E00F0D0A600F6D3A000A467690000000000BC826800FFFFFF00808080008080
      800080808000EBDCCE008C5E5D0000FF0000CE8F8F0000800000865252005C3F
      3800764C4E00000000000000000000000000D1937300FBFBFA008890A4009A7E
      65009C7F6600AC8C6F003B57810041628E0045465B005C474200000000000000
      000000000000413D3D002D2A2A002D2A2A000000000000000000000000000000
      0000BD828100FFE3B400FFD39F00E9B28100C9997300BA916C00BD828100807D
      7E006C6A6A006C6A6A0000000000000000000000000000000000D1926D00FFFF
      FF00FFFFFF00B0888400DECAC400FAEFE500F8EAD900FFFFD400D9B8A500AC7F
      7400F4D8B100EBCFA400A467690000000000D1926D00FFFFFF00FFFFFF00FFFE
      FC00FEF7F000FAEFE500E1CEC0008759580000FF0000CC8E8E00008000008651
      5100633B3C00000000000000000000000000D7997400FEFEFE003B5781003B57
      810082807F003B57810062B4E0003B5781002A3B690037334700000000007676
      77003A3A3A00413D3D0024232500413B3B000000000000000000000000000000
      0000BD828100FFE0B800FFD3A700FFD09D00FFCE9000FFC68800BD8281000000
      0000000000000000000000000000000000000000000000000000D1926D00FFFF
      FF00FFFFFF00D5BFBC00BA979300DECAC400F6E9DE00DAC0B400B78F8400B28C
      7B00DECEB400B6AA9300A467690000000000D1926D00FFFFFF00808080008080
      8000808080008080800080808000D7C1B5008080800000FF0000CA8B8B000080
      00007E4442003E4145000000000000000000DA9D7500FFFFFF003B578100BCEA
      F3003B57810062B4E0003B57810062B4E0003B578100273F730021346A007676
      7700787D8300413D3D0038343500413B3B00000000000000000000000000C086
      8300FFE7CF00FFE0C000FFD9B200FFD3A500FFD09900BD828100000000000000
      0000000000000000000000000000000000000000000000000000DA9D7500FFFF
      FF00FFFFFF00FFFFFF00D5BFBC00B088840097656000AF867F00CAA79D00A56B
      5F00A56B5F00A56B5F00A467690000000000DA9D7500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFC00FCF6EF00FCF3E600CFB5AA008080800000FF00008C6D
      73001E799F000C98BD000C98BD0000000000E7AB7900FFFFFF00FBFBFC003B57
      8100BCEAF3003B57810062B4E0003B57810062B4E0004398E3003481DC007676
      7700EDEDED00413D3D004D49480048434300000000000000000000000000BD82
      8100FEEBD800FFE6CC00FFDEBD00FFD8B100FED3A400BD828100000000000000
      0000000000000000000000000000000000000000000000000000DA9D7500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FFFEF700DAC1BA00A56B
      5F00E19E5500E68F3100B56D4D0000000000DA9D7500FFFFFF00808080008080
      800080808000808080008080800080808000C0C0C000955F56009E5D58002D84
      A70006BBF000008EDE00000F950000008100E7AB7900F8EEE700F8EEE700F6EB
      E6003B5781008FE2F0003B57810062B4E00053ACEA004397E2003481DC007676
      7700EDEDED00413D3D005A5757005B5959000000000000000000BD828100FFFF
      F200FFFFF200FFEBD800FFE5CA00FFE1BD00F3C7A700BD828100000000000000
      0000000000000000000000000000000000000000000000000000E7AB7900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500A56B
      5F00F8B55C00BF7A5C000000000000000000E7AB7900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500A56B5F00D1914F00068F
      C1000393DE000320BA000318B200010B9900E7AB7900D79F8000D8A18100D8A1
      8100D19D80003B5781007FB1CE00B4E5F30053AFED004399E500244283007676
      7700EDEDED00413D3D0073737300737373000000000000000000BD828100BD82
      8100BD828100FBEFE200FBE3CF00FBDDC200BD82810000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AB7900FBF4
      F000FBF4EF00FAF3EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000A56B
      5F00C1836C00000000000000000000000000E7AB7900FBF4F000FBF4EF00FAF3
      EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000A56B5F00C1836C000000
      00000263BF002F45ED001031D300010A95000000000000000000000000000000
      00000000000000000000000000004F7EAF004074B7003B528E00000000007676
      770076767700413D3D00737373005F5E5E000000000000000000000000000000
      000000000000BD828100BD828100BD8281000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AB7900D192
      6D00D1926D00D1926D00D1926D00D1926D00D1926D00D1926D00D1926D00A56B
      5F0000000000000000000000000000000000E7AB7900D1926D00D1926D00D192
      6D00D1926D00D1926D00D1926D00D1926D00D1926D00A56B5F00000000000000
      0000000000002732D0000C19B400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000413D3D00413D3D00413D3D000000000000000000A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900000000000000000000000000A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B7918400FEE9
      C700F4DAB500F3D5AA00F2D0A000EFCB9600EFC68B00EDC18200EBC17F00EBC1
      8000EBC18000F2C78200A4676900000000000000000000000000B7918400FEE9
      C700F4DAB500F3D5AA00F2D0A000EFCB9600EFC68B00EDC18200EBC17F00EBC1
      8000EBC18000F2C78200A467690000000000A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B7918700FCEA
      CE00F3DABC00F2D5B100F0D0A700EECB9E00EDC79300EDC28B00E9BD8100E9BD
      7F00E9BD7F00EFC48100A4676900000000000000000000000000B7918700FCEA
      CE00F3DABC00F2D5B100F0D0A700EECB9E00EDC79300EDC28B00E9BD8100E9BD
      7F00E9BD7F00EFC48100A467690000000000A5636B00FFEFCE00F7DEBD00DEC6
      A500C6AD8C00BDA58400CEAD8400DEB58400E7BD7B00E7BD7B00EFBD7B00EFC6
      8400A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B7938A00FEEF
      DA00F6E0C600F2DABC00F2D5B200EFD0A900EECB9E00EDC79600EBC28C00E9BD
      8200E9BD7F00EFC48100A4676900000000000000000000000000B7938A00FEEF
      DA00F6E0C600F2DABC00F2D5B200EFD0A900EECB9E00EDC79600EBC28C00E9BD
      8200E9BD7F00EFC48100A467690000000000A5635A00FFEFDE00F7E7C6003129
      290021212100314242009C846B00AD946B00C6A57300DEB57B00E7BD7B00EFC6
      8400A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BA978F00FFF4
      E500F7E5CF00F4E0C500F3DABB00F2D5B100F0D0A600EECB9E00EDC79500EBC2
      8A00EABF8100EFC48000A4676900000000000000000000000000BA978F00FFF4
      E500F7E5CF00F4E0C500F3DABB00F2D5B100F0D0A600EECB9E00EDC79500EBC2
      8A00EABF8100EFC48000A467690000000000A5635A00FFF7E700F7E7CE009C8C
      84000842630000639400083952004A424200947B5A00B5946B00D6AD7300EFBD
      7B00A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C09E9500FFFB
      F000F8EADC00F6E3CF00F4E0C600F2D9BC00F2D5B100F0D0A900EDCB9E00EDC6
      9500EBC28A00EFC58300A4676900000000000000000000000000C09E9500FFFB
      F000F8EADC00F6E3CF00F4E0C600F2D9BC00F2D5B100F0D0A900EDCB9E00EDC6
      9500EBC28A00EFC58300A467690000000000A5736B00FFFFF700FFEFDE00EFDE
      CE0021526B00105A8400735A63007B5252005A39390084735A00A58C6300CEAD
      7300A56363000000000000000000000000000000000000000000000000000000
      0000000000000084000000FF0000008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6A49A00FFFF
      FC00FAF0E600F8EADA00F7E5CF00F4E0C500F2DABA00F2D5B100F0D0A700EECB
      9D00EBC79300F2C98C00A4676900000000000000000000000000C6A49A00FFFF
      FC00FAF0E600F8EADA00F7E5CF00F4E0C500F2DABA006E6ED4006E6ED4006E6E
      D400EBC79300F2C98C00A467690000000000A5736B00FFFFFF00FFF7E700FFEF
      DE008C9C9C0063525A00DE948C00BD7B7B008C5252005A3931007B6B52009C84
      5A00945A5A000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF00000084000000000000000000000000
      0000000000000000000000000000000000000000000000000000CBA99E00FFFF
      FF00FEF7F200FAEFE600F8EAD900F7E3CF00F6E0C500F2DABB00F2D4B100F0D0
      A700EECC9E00F3CE9700A467690000000000000000000000000000018B006E6E
      D4006E6ED400FAEFE600F8EAD900F7E3CF006E6ED40000018B0000018B006E6E
      D400EECC9E00F3CE9700A467690000000000BD846B00FFFFFF00FFF7F700FFEF
      E700F7E7D6006B5A6300EFA5A500CE949400B5737300845252005A3931007B6B
      52008452520000000000000000000000000000000000000000000000000000FF
      000000FF0000848484008484840000FF000000FF000000840000000000000000
      0000000000000000000000000000000000000000000000000000CFAC9F00FFFF
      FF00FFFEFC00FCF6F000FAEFE600F7EADA00F6E3CF00F4E0C500F3D9BB00F3D4
      B000F0D0A600F6D3A000A46769000000000000000000000000006E6ED4000001
      8B0000018B006E6ED400FAEFE6006E6ED40000018B0000018B006E6ED400F3D4
      B000F0D0A600F6D3A000A467690000000000BD846B00FFFFFF00FFFFFF00FFF7
      F700FFEFE700EFDECE008C5A5A00E7A5A500CE8C8C00B5737300845252005A39
      3900734A4A0000000000000000000000000000000000000000008484840000FF
      00008484840000000000000000008484840000FF000000FF0000008400000000
      0000000000000000000000000000000000000000000000000000D4B0A100FFFF
      FF00FFFFFF00FFFEFC00FEF7F000FAEFE500F8EAD900F7E5CE00F6DEC400F3D9
      B800F4D8B100EBCFA400A4676900000000000000000000000000D4B0A1006E6E
      D40000018B0000018B006E6ED40000018B0000018B006E6ED400F6DEC400F3D9
      B800F4D8B100EBCFA400A467690000000000D6946B00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFEFE700E7CEC600845A5A00E7A5A500CE8C8C00B57373008452
      5200633939000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000FF000000FF00000084
      0000000000000000000000000000000000000000000000000000D9B5A100FFFF
      FF00FFFFFF00FFFFFF00FFFEFC00FCF7F000FAEFE500F8E9D900F8E7D100FBEA
      CE00DECEB400B6AA9300A4676900000000000000000000000000D9B5A100FFFF
      FF006E6ED40000018B0000018B0000018B006E6ED400F8E9D900F8E7D100FBEA
      CE00DECEB400B6AA9300A467690000000000D6946B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFEFE700D6C6B5008C5A5A00E7A5A500CE8C8C00B573
      73007B4242003942420000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FF000000FF
      0000008400000000000000000000000000000000000000000000DDB7A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FCF6EF00FCF3E600EDD8C900B68A
      7B00A17B6F009C766700A4676900000000000000000000000000DDB7A400FFFF
      FF00FFFFFF006E6ED40000018B0000018B0000018B00FCF3E600EDD8C900B68A
      7B00A17B6F009C766700A467690000000000DE9C7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7EF00FFF7E700CEB5AD0094636300EFADAD008C6B
      7300187B9C00089CBD00089CBD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      000000FF00000000000000000000000000000000000000000000E2BCA500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FFFEF700DAC1BA00AD73
      5B00E19E5500E68F3100B56D4D00000000000000000000000000E2BCA500FFFF
      FF006E6ED40000018B0000018B006E6ED40000018B0000018B00DAC1BA00AD73
      5B00E19E5500E68F3100B56D4D0000000000DE9C7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700DEC6BD00945A52009C5A5A002984
      A50000BDF700008CDE0000089400000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FF00000000000000000000000000000000000000000000E6BFA700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500B882
      6500F8B55C00BF7A5C0000000000000000000000000000000000E6BFA7006E6E
      D40000018B0000018B006E6ED400FFFFFF006E6ED40000018B0000018B00B882
      6500F8B55C00BF7A5C000000000000000000E7AD7B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C600A56B5A00D6944A00008C
      C6000094DE000021BD000018B50000089C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000E4BCA400FBF4
      F000FBF4EF00FAF3EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000B77F
      6200C1836C000000000000000000000000000000000000000000E4BCA4000001
      8B0000018B006E6ED400FAF3EF00F8F2EF00F7F2EF006E6ED40000018B006E6E
      D400C1836C00000000000000000000000000E7AD7B00FFF7F700FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00F7F7EF00F7F7EF00DEC6C600A56B5A00C6846B000000
      00000063BD002942EF001031D600000894000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8C4AD00EBCB
      B700EBCBB700EACBB700EACAB600EACAB600EACAB600EACAB600E3C2B100A56B
      5F00000000000000000000000000000000000000000000000000E8C4AD00EBCB
      B700EBCBB700EACBB700EACAB600EACAB600EACAB600EACAB6006E6ED4000001
      8B0000000000000000000000000000000000E7AD7B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00A56B5A00000000000000
      0000000000002131D6000818B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F800F800F80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000F000F000F0000000F000F000F0000000F000F000F0000
      001F001F001F0000003F003F003F0000F33FC001FFFFFFFFE007C0010007003F
      C00080010007003F8001C0010007003F0000C0010007003F0000C0010007003F
      0000C0010007003F8000C0010007003FE001C00100070038F003C00100070020
      F01FC00100030000E03FC00100010000E03FC00100000000C03FC00300000000
      C07FC0070010FE20F8FFC00F0039FFF8C001C001FFFFFFFFC001C0010007FFFF
      C001C0010007FFFFC001C0010007FDFFC001C0010007F8FFC001C0010007F07F
      C001C0010007E03FC001C0010007C01FC001C0010007C60FC001C0010007EF07
      C001C0010003FF83C001C0010001FFC3C001C0010000FFE3C003C0030000FFF7
      C007C0070010FFFFC00FC00F0039FFFF00000000000000000000000000000000
      000000000000}
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
        Caption = 'DocPanel'
        DockControl = DocBarDockControl
        DockedDockControl = DocBarDockControl
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 401
        FloatTop = 257
        FloatClientWidth = 54
        FloatClientHeight = 154
        ItemLinks = <
          item
            Item = AddDocButton
            Visible = True
          end
          item
            Item = EditNameDocBtn
            Visible = True
          end
          item
            Item = EditDocButton
            Visible = True
          end
          item
            Item = DelDocButton
            Visible = True
          end
          item
            BeginGroup = True
            Item = SignButton
            Visible = True
          end
          item
            BeginGroup = True
            Item = SaveButton
            Visible = True
          end
          item
            Item = CloseButton
            Visible = True
          end>
        Name = 'DocPanel'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
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
        Caption = 'PlanPanel'
        DockControl = PlanBarDockControl
        DockedDockControl = PlanBarDockControl
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 399
        FloatTop = 341
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
            Item = StagesButton
            Visible = True
          end
          item
            BeginGroup = True
            Item = SetCDataBtn
            Visible = True
          end
          item
            BeginGroup = True
            Item = FontPrintButton
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
            Item = ExportButton
            Visible = True
          end
          item
            Item = OptionsBtn
            Visible = True
          end
          item
            BeginGroup = True
            Item = SpinEditQ
            Visible = True
          end
          item
            Item = SpinEditC
            Visible = True
          end
          item
            BeginGroup = True
            Item = AdjustButton
            Visible = True
          end
          item
            BeginGroup = True
            Item = ApplyButton
            Visible = True
          end
          item
            Item = CancelButton
            Visible = True
          end>
        Name = 'PlanPanel'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
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
    Images = ImageList2
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 424
    Top = 146
    DockControlHeights = (
      0
      0
      0
      0)
    object AddDocButton: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FFB7938AFEEFDAF6E0C6F2DABCF2D5B2EF
        D0A9EECB9EEDC796EBC28CE9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFC09E95FFFBF0F8EADCF6E3CFF4E0C6F2
        D9BCF2D5B1F0D0A9EDCB9EEDC695EBC28AEFC583A46769FF00FFFF00FFFF00FF
        C6A49AFFFFFCFAF0E6F8EADAF7E5CFF4E0C5F2DABAF2D5B1F0D0A7EECB9DEBC7
        93F2C98CA46769FF00FFFF00FFFF00FFCBA99EFFFFFFFEF7F2FAEFE6F8EAD9F7
        E3CFF6E0C5F2DABBF2D4B1F0D0A7EECC9EF3CE97A46769FF00FFFF00FFFF00FF
        CFAC9FFFFFFFFFFEFCFCF6F0FAEFE6F7EADAF6E3CFF4E0C5F3D9BBF3D4B0F0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFD4B0A1FFFFFFFFFFFFFFFEFCFEF7F0FA
        EFE5F8EAD9F7E5CEF6DEC4F3D9B8F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
        D9B5A1FFFFFFFFFFFFFFFFFFFFFEFCFCF7F0FAEFE5F8E9D9F8E7D1FBEACEDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDDB7A4FFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFCFCF6EFFCF3E6EDD8C9B68A7BA17B6F9C7667A46769FF00FFFF00FFFF00FF
        E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCC7C5B88265F8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EA
        CAB6EACAB6EACAB6E3C2B1A56B5FFF00FFFF00FFFF00FFFF00FF}
      OnClick = AddDocButtonClick
    end
    object CloseButton: TdxBarButton
      Caption = #1042#1080#1081#1090#1080
      Category = 0
      Hint = #1042#1080#1081#1090#1080
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4BA64B4BA9
        4D4D4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        824B4B824B4BB64F50C24F50C54D4EB24D4E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FF824B4BD45859CB5556C95455C95253B7
        4F524E1E1FFE8B8CFB9A9CF8AAABF7B5B6F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BD75C5DD05A5BCF595ACF5758BD53564E1E1F23B54A13C14816BD480CBC
        41F7B5B6824B4BFF00FFFF00FFFF00FF824B4BDD6364D75F60D55E5FD55C5DC2
        575A4E1E1F2AB44D1CBF4C1EBC4C13BC45F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BE36869DD6566DA6364DE6667C6595B4E1E1F26B14916BC481BBB4910BB
        43F7B5B6824B4BFF00FFFF00FFFF00FF824B4BEB6D6EE26768E67E7FFAD3D4CC
        6E704E1E1FA5D89750D16F42C9662DC758F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BF27374E96C6DEB8182FCD1D3CF6E704E1E1FFFF2CCFFFFD7FFFFD4E6FC
        C7F7B5B6824B4BFF00FFFF00FFFF00FF824B4BF87879F07576EE7273F07374D1
        65664E1E1FFCEFC7FFFFD5FFFFD3FFFFD7F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFE7F80F77A7BF6797AF77779D76B6B4E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4BFF8384FC7F80FB7E7FFE7F80DA
        6E6F4E1E1FFCEFC7FFFFD5FFFFD3FFFFD5F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFF8889FF8283FF8182FF8283E073744E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4B824B4BE27576FE8182FF8687E5
        76774E1E1FFAEBC5FCFBD1FCFBCFFCFBD1F7B5B6824B4BFF00FFFF00FFFF00FF
        FF00FFFF00FF824B4B9C5657CB6C6DCF6E6E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B82
        4B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = CloseButtonClick
    end
    object DelDocButton: TdxBarButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FFB7938AFEEFDAF6E0C6F2DABCF2D5B2EF
        D0A9EECB9EEDC796EBC28CE9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFC09E95FFFBF0F8EADCF6E3CFF4E0C6F2
        D9BCF2D5B1F0D0A9EDCB9EEDC695EBC28AEFC583A46769FF00FFFF00FFFF00FF
        C6A49AFFFFFCFAF0E6F8EADAF7E5CFF4E0C5F2DABA6E6ED46E6ED46E6ED4EBC7
        93F2C98CA46769FF00FFFF00FFFF00FF00018B6E6ED46E6ED4FAEFE6F8EAD9F7
        E3CF6E6ED400018B00018B6E6ED4EECC9EF3CE97A46769FF00FFFF00FFFF00FF
        6E6ED400018B00018B6E6ED4FAEFE66E6ED400018B00018B6E6ED4F3D4B0F0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFD4B0A16E6ED400018B00018B6E6ED400
        018B00018B6E6ED4F6DEC4F3D9B8F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
        D9B5A1FFFFFF6E6ED400018B00018B00018B6E6ED4F8E9D9F8E7D1FBEACEDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDDB7A4FFFFFFFFFFFF6E6ED400018B00
        018B00018BFCF3E6EDD8C9B68A7BA17B6F9C7667A46769FF00FFFF00FFFF00FF
        E2BCA5FFFFFF6E6ED400018B00018B6E6ED400018B00018BDAC1BAAD735BE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE6BFA76E6ED400018B00018B6E6ED4FF
        FFFF6E6ED400018B00018BB88265F8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E4BCA400018B00018B6E6ED4FAF3EFF8F2EFF7F2EF6E6ED400018B6E6ED4C183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EA
        CAB6EACAB6EACAB66E6ED400018BFF00FFFF00FFFF00FFFF00FF}
      OnClick = DelDocButtonClick
    end
    object EditNameDocBtn: TdxBarButton
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1085#1072#1079#1074#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1085#1072#1079#1074#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
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
        52545E3F39867258A78C66CEAA73A06567FF00FFFF00FFFF00FFA7756BFFFFFF
        8080808080808F9F9D62555DDD908C0080008E57575B3D377D6B519A815D925C
        5EFF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2FAEFE6F0E5D56B5D6200FF00CF
        9090008000875353583C357A6950815354FF00FFFF00FFFF00FFBC8268FFFFFF
        808080808080808080EBDCCE8C5E5D00FF00CE8F8F0080008652525C3F38764C
        4EFF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFFFFEFCFEF7F0FAEFE5E1CEC087
        595800FF00CC8E8E008000865151633B3CFF00FFFF00FFFF00FFD1926DFFFFFF
        808080808080808080808080808080D7C1B580808000FF00CA8B8B0080007E44
        423E4145FF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFC
        F3E6CFB5AA80808000FF008C6D731E799F0C98BD0C98BDFF00FFDA9D75FFFFFF
        808080808080808080808080808080808080C0C0C0955F569E5D582D84A706BB
        F0008EDE000F95000081E7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDCC7C5A56B5FD1914F068FC10393DE0320BA0318B2010B99E7AB79FBF4F0
        FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
        BF2F45ED1031D3010A95E7AB79D1926DD1926DD1926DD1926DD1926DD1926DD1
        926DD1926DA56B5FFF00FFFF00FFFF00FF2732D00C19B4FF00FF}
      OnClick = EditNameDocBtnClick
    end
    object SaveButton: TdxBarButton
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1079#1084#1110#1085#1080
      Category = 0
      Hint = #1047#1073#1077#1088#1077#1075#1090#1080' '#1079#1084#1110#1085#1080
      Visible = ivAlways
      Glyph.Data = {
        36030000424D360300000000000036000000280000000F000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FF7F2B287F2B28A18283A18283A18283A1
        8283A18283A18283A182837A1C1C7F2B28FF00FFFF00FF000000FF00FF7F2B28
        CA4D4DB64545DDD4D5791617791617DCE0E0D7DADECED5D7BDBABD76100F9A2D
        2D7F2B28FF00FF000000FF00FF7F2B28C24A4BB14444E2D9D9791617791617D9
        D8DAD9DEE1D3D9DCC1BDC1761111982D2D7F2B28FF00FF000000FF00FF7F2B28
        C24A4AB04242E6DCDC791617791617D5D3D5D8DEE1D7DDE0C6C2C5700F0F962C
        2C7F2B28FF00FF000000FF00FF7F2B28C24A4AB04141EADEDEE7DDDDDDD4D5D7
        D3D5D5D7D9D7D8DACAC2C57E17179E31317F2B28FF00FF000000FF00FF7F2B28
        BF4748B84545BA4C4CBD5757BB5756B64E4EB44949BD5251BB4B4CB54242BF4A
        4A7F2B28FF00FF000000FF00FF7F2B28A33B39B1605DC68684CB918FCC9190CC
        908FCB8988C98988CB9391CC9696BD4B4C7F2B28FF00FF000000FF00FF7F2B28
        BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B
        4C7F2B28FF00FF000000FF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
        F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FF000000FF00FF7F2B28
        BD4B4CF7F7F7BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFF7F7F7BD4B
        4C7F2B28FF00FF000000FF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
        F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FF000000FF00FF7F2B28
        BD4B4CF7F7F7BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFF7F7F7BD4B
        4C7F2B28FF00FF000000FF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
        F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FF000000FF00FFFF00FF
        7F2B28F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F77F2B
        28FF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000}
      OnClick = SaveButtonClick
    end
    object SignButton: TdxBarButton
      Caption = #1055#1110#1076#1087#1080#1089#1072#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
      Category = 0
      Hint = #1055#1110#1076#1087#1080#1089#1072#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
      Visible = ivAlways
      Glyph.Data = {
        76030000424D7603000000000000360000002800000011000000100000000100
        1800000000004003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF00895753895753895754895753895753895753
        895753895753895753895753FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF00895753E7D5C4E2CFBCE2CCB8E1CBB5E1CBB4E1CAB5E1CBB6E7D5BD895753
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00AD706BF8EEDDF2E6D7EF
        E3D3EFE1CEEDDECAEDDDC7EDDEC7F6E7CE895753FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00B4766DF7EFE3F7D5B2F8CBA1F7CBA3F6CBA0F6CA9DF3
        CFAAF3E6CE895753FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00BB7D
        6EF7F3EAF6E2CCF6DCC2F4DAC0F3D9BCF3D7B8EED5BAF0E3CB895753FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF00C4866FFAF6EEF6D5B5F3C99FF6CB
        A3F8CBA1EEC298D4B797D1C9B7895753FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF00CA8C72FBF7F2E1D4C6C6B6A7D4C2B1E1CEBBC1AF9D918478918B
        807E5F58FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00D19373FBFBFA
        8890A49A7E659C7F66AC8C6F3B578141628E45465B5C4742FF00FFFF00FFFF00
        FF413D3D2D2A2A2D2A2AFF00FF00D79974FEFEFE3B57813B578182807F3B5781
        62B4E03B57812A3B69373347FF00FF7676773A3A3A413D3D242325413B3BFF00
        FF00DA9D75FFFFFF3B5781BCEAF33B578162B4E03B578162B4E03B5781273F73
        21346A767677787D83413D3D383435413B3BFF00FF00E7AB79FFFFFFFBFBFC3B
        5781BCEAF33B578162B4E03B578162B4E04398E33481DC767677EDEDED413D3D
        4D4948484343FF00FF00E7AB79F8EEE7F8EEE7F6EBE63B57818FE2F03B578162
        B4E053ACEA4397E23481DC767677EDEDED413D3D5A57575B5959FF00FF00E7AB
        79D79F80D8A181D8A181D19D803B57817FB1CEB4E5F353AFED4399E524428376
        7677EDEDED413D3D737373737373FF00FF00FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF4F7EAF4074B73B528EFF00FF767677767677413D3D7373735F
        5E5EFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF413D3D413D3D413D3DFF00FF00}
      OnClick = SignButtonClick
    end
    object EditDocButton: TdxBarButton
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
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
      OnClick = EditDocButtonClick
    end
    object EditButton: TdxBarButton
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080
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
      OnClick = EditButtonClick
    end
    object AddButton: TdxBarSubItem
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080'...'
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        92635DA46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FF96655EF3DEBBF3DAB5F2D8AFF2D5A9F0
        D3A4EFD09FEFCE9AEECB96EDCA92EDC68FEDC68B9F6F60FF00FFFF00FFFF00FF
        99685FF4E1C0004B00F3DCB6F3D8B0811E00811E00811E00811E00811E00811E
        00EEC78F9F6F60FF00FFFF00FFFF00FF9E6B62F7E5C9F6E1C2F4DEBCF4DCB6F2
        D8B1F2D7ABF0D3A6EFD0A1EFCF9DEECB98EEC9939F6F60FF00FFFF00FF004B00
        004B00004B00004B00004B00004B00004B00004B00004B00004B00004B00004B
        00004B00004B00004B00FF00FF004B00A97566F8EBD5004B00F7E6CAF7E2C481
        1E00811E00811E00811E00811E00811E00F0CF9E9F6F60004B00FF00FF004B00
        004B00004B00004B00004B00004B00004B00004B00004B00004B00004B00004B
        00004B00004B00004B00FF00FFFF00FFB67F6AFBF2E2FAEEDDF8EBD8F7E9D1F7
        E6CBF7E3C6F6E1C0F4DDBAF3DCB5F2D8B0F0D5AA9F6F60FF00FFFF00FFFF00FF
        BC846CABA69E003300AAA397F8EDD8811E00811E00811E00811E00811E00811E
        00F3D9B09F6F60FF00FFFF00FFFF00FF004B00004B00004B00AAA59CFBF0DEFA
        EED9F8EBD4F7E6CEF6E3C9F6E2C2F4E0BDF4DCB69F6F60FF00FFFF00FFFF00FF
        004B000D9A1A004B00ACA69FABA59CABA399F8EEDAF8EBD4F7E7CFF7E5CAF6E2
        C4F4DEBD9F6F60FF00FF004B00004B00004B0016AC2D004B00004B00004B0058
        1400811E00811E00811E00811E00811E00F6E2C59F6F60FF00FF004B0031DA60
        2BD05423C2441AB43413A525004B00ACA7A0FCF3E6FBF0E2FAEFDDFAEBD7F8E9
        D1F7E5CB9F6F60FF00FF004B00004B00004B002ED55A004B00004B00004B00FC
        F8F0FCF7EDFBF4E7FAF2E3FAEFDDF8EDD9F8E9D19F6F60FF00FFFF00FFFF00FF
        004B0034DE65004B008C6046CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E
        68CF8E68CF8E68FF00FFFF00FFFF00FF004B00004B00004B00FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ItemLinks = <
        item
          Item = AddProductButton
          Visible = True
        end
        item
          Item = AddObjectButton
          Visible = True
        end>
    end
    object AddProductButton: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080' '#1087#1088#1086#1076#1091#1082#1094#1110#1102
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1087#1088#1086#1076#1091#1082#1094#1110#1102
      Visible = ivAlways
      OnClick = AddProductButtonClick
    end
    object AddObjectButton: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080' '#1086#1073#39#1108#1082#1090
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1086#1073#39#1108#1082#1090
      Visible = ivAlways
      OnClick = AddObjectButtonClick
    end
    object DelButton: TdxBarButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FFB7938AFEEFDAF6E0C6F2DABCF2D5B2EF
        D0A9EECB9EEDC796EBC28CE9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFC09E95FFFBF0F8EADCF6E3CFF4E0C6F2
        D9BCF2D5B1F0D0A9EDCB9EEDC695EBC28AEFC583A46769FF00FFFF00FFFF00FF
        C6A49AFFFFFCFAF0E6F8EADAF7E5CFF4E0C5F2DABA6E6ED46E6ED46E6ED4EBC7
        93F2C98CA46769FF00FFFF00FFFF00FF00018B6E6ED46E6ED4FAEFE6F8EAD9F7
        E3CF6E6ED400018B00018B6E6ED4EECC9EF3CE97A46769FF00FFFF00FFFF00FF
        6E6ED400018B00018B6E6ED4FAEFE66E6ED400018B00018B6E6ED4F3D4B0F0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFD4B0A16E6ED400018B00018B6E6ED400
        018B00018B6E6ED4F6DEC4F3D9B8F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
        D9B5A1FFFFFF6E6ED400018B00018B00018B6E6ED4F8E9D9F8E7D1FBEACEDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDDB7A4FFFFFFFFFFFF6E6ED400018B00
        018B00018BFCF3E6EDD8C9B68A7BA17B6F9C7667A46769FF00FFFF00FFFF00FF
        E2BCA5FFFFFF6E6ED400018B00018B6E6ED400018B00018BDAC1BAAD735BE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE6BFA76E6ED400018B00018B6E6ED4FF
        FFFF6E6ED400018B00018BB88265F8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E4BCA400018B00018B6E6ED4FAF3EFF8F2EFF7F2EF6E6ED400018B6E6ED4C183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EA
        CAB6EACAB6EACAB66E6ED400018BFF00FFFF00FFFF00FFFF00FF}
      OnClick = DelButtonClick
    end
    object StagesButton: TdxBarButton
      Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1087#1077#1088#1110#1086#1076#1080
      Category = 0
      Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1087#1077#1088#1110#1086#1076#1080
      Visible = ivAlways
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100000000000000000000000100000000000000000000FFFF
        FF00403EF0004D4CF4004A49E9005B59C1008B8AF2009F9ED700A6A5DC005952
        FF006D6BBD00827FE0007E79E300938FB5009790B600A7A1C100A099B4006647
        9D00DDD8E5005D446C00FF00FF00FFFCFF009F676D00D9939900E5959A00A068
        6900A3969600B1646200DE9D9A008E403000924637007D706D00C1490000B049
        0A00C64E0000BC4C0100BA4C0100BA4D0100BD4D0200BC4D0200BC4E03006048
        3800CE580100C7560200FFF2E600B47B4100D4AC8300FFCFA000D5C4B100FFEF
        DD00EEBB7D00F4BF8100FBC78800E7CBA90073685B00FFEBD300FEEBD400FFF8
        F0005A4A3600FEE1BA00FFEACF00544B3E00B2976B00FFE9C500FAE6C700F4D1
        9600FFE5B800F8F4EB006B5B3300EDE0BB00FFEFAC00EDE6C900FFFCEE00E1D8
        A600A7A17900FBF4C400726A1E00FFFAD100FEFCCA0084834F00FFFFD400D8D8
        B700FFFFD900F2F2DE00D4D4C500FFFFF300FFFFF600FFFFF800868775005F60
        5300F0F4E100AFC27D00DAE5C400EDF3E5009FC47800527732005A7D3F00A6D4
        880096C57B0067AF480067AC47009ED38700A0CE8C0067AF4B0079C15B0063AF
        4B006DBA59004EA7390070B760004DA73C00EDF7EB003D9F2D004E99410062B5
        550068BA5B0067B6590067B65B0063B46000EAF4F0006EADA7006E9D9A003134
        34003C636F000897C9000E485F00EEF3F60075808900A7BACE000559E000AFBA
        E3000018A0001B2BBB00B4B8E900040CA500222BC700353EE5004145D400545A
        F0002828FA002D30FF003536FE003232E3003839E9003C3CED004141FA00393A
        CE004647FB004545F8004445EE004647CC006363F700B2B2E000F7F7FF00EDED
        F200FCFCFF000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000141414141414
        1414141414141414141414282828282828282828282828282814142701010172
        3C3C3C2D4C2F2F2F23141428010101723C373F1F7C362E2F261414246C73746F
        696763707A163A5F251414275D6E6E715C4745496018192920141427579A9875
        5A482C40641C171B4414142206948D86967F61626B5E4F7E7B821411950E100F
        058378656D665B7780859089544633344D0A09996A15314213149007504E4B41
        323091846839383B21140381565258793D1A881E2A2B2B2B1414939701555159
        3E35871D141414141414930C430101534A0D8B1414141414141414920B12767D
        088E141414141414141414148C02048F8A141414141414141414}
      OnClick = StagesButtonClick
    end
    object SetCDataBtn: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080' '#1076#1072#1085#1110' '#1079' '#1076#1086#1075#1086#1074#1086#1088#1110#1074
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1076#1072#1085#1110' '#1079' '#1076#1086#1075#1086#1074#1086#1088#1110#1074
      Visible = ivAlways
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100000000000000000000000100000000000000000000FFFF
        FF00FF00FF00FFFEFE008E5D590080504B0091605A007547400096655C007A4C
        4300A0675B0086564800805145009E6B5E00B27B6B008C5C4B009C6A51009364
        4D00FEFCFB00A4705400CA8F6D00BF7A4F00B87D5900AB775600D1926D009784
        7800BC4B0000BB4B0000B44A0200A449060093470D00B17E5700B6825A008245
        1400BA835800BB865B00BB875C00DCA3760074471F00E29F6400FEBD8300FEC4
        8F00FEC49000FECC9E00FECC9F00FED3AC00FED5AF00FEDDBF00FECEA000FED5
        AD00FEDDBC00FEE6CE00D5812700D1802800FFC68600FEDEBC00FEE6CC00FCE7
        D000FEEDDA00C67D2A00FFC98800FFCA8800FFCA8900FFD09600FFE9CF00FBAC
        4300FFCF9300FFD8A500FFD9A500FEF7EE00FCF6ED00FEFAF40079634100EFCF
        9C00F2D4A400FFE2B600F4DCB500FBF0DE00FAF0E000FCF4E700FFD78E00D7BF
        9300F2D8AC00F6E3C200F8EAD100FCF6EB00FEFBF600E2CFAB00FFEECC00FFEE
        CA00FFFBF000FAF7EF00D9D7C900FFFFFE004D5C6000CFDAE1002396FC007A9C
        BB00C6D5E300187ADE001C87EF001767B7001F80DE006693C00076A1CA0083AF
        DA006784A0009DB2C700F6F7F8000D64C2001687FF00146AC7001673D5001662
        B200295B92003369A600253D58000D7AFE000F72E6000E59B4000D4E9E001154
        A400165CAC00154E93001542780017457D00184172005883B4000353BB00034F
        B400034EB200034CAA00034AA5000452BB000447A000074CA4000950AB000946
        95000C4EA300124B93002D4D770048527400FEFEFF0000000000000000000000
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
        0000000000000000000000000000000000000000000000000000020202020202
        020604040404040404050202020202020208594B43423C365005070404040404
        8D0D392F2E3029283D05094C524A49518986673332312C2A3E050C533434353B
        7C8582876137312B3F050B54545C6A728A7675808438322D44050F4D345E786F
        60646E81683A4058570511555F7A636671656D876C5A0A0A0A0A10562677707B
        488C83698E010A41411513032188796B4619731212120A16270217011C7E7D5B
        3425141818180A0E02021F01017F8B6247454F4E05020202020220011A1E741D
        1A1A1A5505020202020224011A1A1A1B1A1A1A56050202020202230101010101
        0101015D05020202020222181818181818181818180202020202}
      OnClick = SetCDataBtnClick
    end
    object FontPrintButton: TdxBarButton
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1096#1088#1080#1092#1090' '#1076#1088#1091#1082#1091
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1096#1088#1080#1092#1090' '#1076#1088#1091#1082#1091
      Visible = ivAlways
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100000000000000000000000100000000000000000000FFFF
        FF00FF00FF00421B210062313900441C2100461C1F00581F1600FFFCFB00902B
        0300983003009D350600AB3E0400A93F0600B24B0E00FFF4EB00FFEFE000FFF7
        F000FFD0A000FED1A400FED4A900FFD8B000FEDAB500FFDDBA00FFE7CF00FFEE
        DE00FFF0E100FFF2E500FFF7EF00CA680000FECC9800FECE9C00FFD3A400FFD4
        A600FFD5A700FED5A900FFD7AB00FED7AD00FFD9B000FED8AF00FFD9B100FFDC
        B500FEDAB400FEDDBA00FFE1C000FEE0C000FFE3C400FFE3C600FEE3C500FEE3
        C600FFE5C900FFE6CC00FFE7CC00FEE6CB00FEE7CE00FFEAD300FFEAD400FFF3
        E600FFF7EE00FFDDB400FFE1BD00FFE5C700FEE5C600FEE5C700FFE7CA00FFE9
        CF00FFEAD000FEEBD400FEF0E000FFF3E500FFF4E700FEF3E600FFF6EB00FFF8
        F000FFF4E500FFFCF800FFEFD800FEF6EB00FFF7EA00FFFAF200FFFBF400FFFE
        FB00FFFEF700FFFFFC00FFFFFE00000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000020202020202
        0202020202020202020202021D1D1D1D1D1D1D1D1D1D1D1D0202021D46183206
        06060606060606281D02021D19302D2B2A251413121F1E201D02021D39422F03
        03032723030305211D02021D484C353103041627070322241D02021D4F090909
        31030303030323151D02021D4B4A090E343E0317030326291D02021D544E1009
        0B0A0C0303033B171D02021D014F451009380D0903033C2C1D02021D01520F1B
        44090E093D032E2F1D02021D0153110F47440909363F40331D02021D01085049
        4D391A09434132371D02021D01010101010151501C461A3A1D0202021D1D1D1D
        1D1D1D1D1D1D1D1D020202020202020202020202020202020202}
      OnClick = FontPrintButtonClick
    end
    object PreviewButton: TdxBarSubItem
      Category = 0
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FF485360FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FF4380B7
        1F6FC2656B86F3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FF32A3FF1672D76B6A80F2DABCF2D5B2EF
        D0A9EECB9EEDC796EBC28CE9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        A0675B34A1FF1572D45E6782F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFA7756BFFFBF033A6FF4078AD8E675EAC
        7F7597645EAC7D6FCAA083EDC695EBC28AEFC583A46769FF00FFFF00FFFF00FF
        A7756BFFFFFCFAF0E6AD8A88B78F84D8BAA5EED5B6D7B298B58877CBA083EBC7
        93F2C98CA46769FF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2AF847FDAC0B4F7
        E3CFF6E0C5FFFFF4D7B198AC7D6FEECC9EF3CE97A46769FF00FFFF00FFFF00FF
        BC8268FFFFFFFFFEFC976560F6E9E0F7EADAF6E3CFFFFFEBEFD4B797645EF0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFB08884DECAC4FA
        EFE5F8EAD9FFFFD4D9B8A5AC7F74F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
        D1926DFFFFFFFFFFFFD5BFBCBA9793DECAC4F6E9DEDAC0B4B78F84B28C7BDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFD5BFBCB0
        8884976560AF867FCAA79DA56B5FA56B5FA56B5FA46769FF00FFFF00FFFF00FF
        DA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAA56B5FE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE7AB79FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCC7C5A56B5FF8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E7AB79FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79D1926DD1926DD1926DD1926DD1
        926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00FFFF00FF}
      ItemLinks = <
        item
          Item = SimplePreviewBtn
          Visible = True
        end
        item
          Item = ComplicatedPreviewBtn
          Visible = True
        end
        item
          Item = ReportSumsPreview
          Visible = True
        end>
    end
    object PrintButton: TdxBarSubItem
      Category = 0
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C6A6AAAA7A7A19F9F6C6A6A6C
        6A6A6C6A6AE5E3E36C6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FF
        6C6A6ADAD9D9A19F9FA19F9FA19F9F3736363535356C6D6DBFBFBFE1E2E2B7B6
        B66C6A6A6C6A6A6C6A6AFF00FF6C6A6AD4D3D3CACACA8E8C8C8E8C8C8E8C8C3C
        3B3B0A090A0707070B0B0B0707077A7A7ABBBBBB6C6A6AFF00FF6C6A6ACACACA
        CACACA8E8C8CD7D4D4CECBCBBFBCBCB1AFAFA3A0A08886865E5B5C0707070909
        090808086C6A6A7673736C6A6ACACACA8E8C8CEFEEEEFFFEFEFBFAFAE3E0E1DE
        DEDEDEDDDDCFCECEBDBCBCADABAB8B89895856567A78787573736C6A6A8E8C8C
        FFFFFFFEFCFCFAFAFAD5D4D5989193A09899B2ABACC4C0C1D7D7D7D8D8D8C7C6
        C6B7B6B6918F8F6C6969FF00FF6C6A6A6C6A6AEDEBEBB1A6A77A6F728A838896
        92959690919D97989A93959E9899BBBABAD1D1D1C2C2C26C6A6AFF00FFFF00FF
        FF00FF6C6A6ABB897FA7876D8B6F647D67606F62657973798F8B8EA9A3A4CBCA
        CAC1C1C16C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFE3B4FFD39FE9
        B281C99973BA916CBD8281807D7E6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFBD8281FFE0B8FFD3A7FFD09DFFCE90FFC688BD8281FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC08683FFE7CFFFE0C0FFD9B2FF
        D3A5FFD099BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFBD8281FEEBD8FFE6CCFFDEBDFFD8B1FED3A4BD8281FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFFFF2FFFFF2FFEBD8FFE5CAFF
        E1BDF3C7A7BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        BD8281BD8281BD8281FBEFE2FBE3CFFBDDC2BD8281FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281BD8281BD
        8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ItemLinks = <
        item
          Item = SimplePrintBtn
          Visible = True
        end
        item
          Item = ComplicatedPrintBtn
          Visible = True
        end
        item
          Item = ReportSumsPrint
          Visible = True
        end>
    end
    object ExportButton: TdxBarSubItem
      Category = 0
      Visible = ivAlways
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100000000000000000000000100000000000000000000FFFF
        FF00FF00FF00A5696A0095655F009D6B620098686000A36F6400FFFBFA00AD78
        6900A7746600BB7F6A00B47E6B00BF877000BA836D00BB704F00C48C7200D397
        7800CA917400C2805C00D0906B00D59A7900CE957600F4EBE600FEF4ED00FFFC
        FA00FCF4EE00FAEDE100FCF4ED00FEFCFA00EF993800E5A55F00F2D5B500F6E1
        CA00F8E7D400F7E6D400F7E7D500F8EDE100E2A35B00F0D0A900F6E1C900F4E1
        CA00FAEDDE00FAEEE000EECB9E00F4D5AD00F0D1AA00F2D7B400F2D7B500F4DD
        C000F3DCBF00F8E9D500FAEFE000EFCA9600F0CF9F00FCE7C900E3D3BB00FCEB
        D300FEEED400FBE5C000B7AD9C00FFF4E100FCF6EB00FFFBEE00FFFFFB00FFFF
        FC00004B000001570300026305000A72120013771A00187F1E000C8C18000C86
        1600EFF6F0001E9A360023BA410026AC440039D76700F8F8FE00000000000000
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
        0000000000000000000000000000000000000000000000000000020202020243
        4343434343434343434304030303034301010101010101010143063B2D363543
        01014242420101010143053720272C430101010144424A010143073A31302E43
        010101014742010101430A3D21322F4301014242464842420143093F24293243
        010142454D4C494201430C4025232843010101424B4E420101430E011A1B3343
        010101014242010101430D0108182B4301010101010101010143100101191C43
        4343434343434343434312010101191C2A2239383C030202020216010101011D
        3E340303030302020202110101010101411703261E0F02020202150101010101
        014F031F1302020202021414141414141414030B020202020202}
      ItemLinks = <
        item
          Item = SimpleExpBtn
          Visible = True
        end
        item
          Item = ComplicatedExpBtn
          Visible = True
        end
        item
          Item = SumExpBtn
          Visible = True
        end>
    end
    object OptionsBtn: TdxBarSubItem
      Align = iaRight
      Category = 0
      Visible = ivAlways
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100000000000000000000000100000000000000000000FFFF
        FF00FF00FF00FFFEFE00843D2400752E11008A3715007D321300783012006528
        0F00893615007B311300762F12006628100065281000692A11007E3313006B2D
        120093401A007B34160095401B0095411B008C3C1A0099441D0099411500953E
        15009A451C00A6420C00A15222009E5123009F633900FFFCFA00D0651400CF65
        1400CC641400D1681800E07011005A351300F3A96600FFF4EA00FFF7F0005A36
        1300684E3500FED5AC00FED9B400FEDEBF00FEE2C600FEE6CE00FFFBF700D581
        270062401A0062401B00684F350068503700FCCE9C00FCCF9F00FED1A100FED3
        A500FCD1A400FCD3A600FCD4A700FED5AA00FCD4A900FED9B100FCDAB400FEDC
        B600FEDCB700FCDAB600FCDCB800FEDDBA00FEDEBB00FCDDBA00FEE0BF00FCDE
        BD00FEE1C200FEE3C600FCE2C500FFE5CA00FEE5C900FEE6CC00FEE7CE00FEEA
        D400FEEAD500FFEEDC00FFEFDE00FEEEDD00FEF4E900FCD1A000FCD7AC00FCD7
        AD00F8D4AA00FCD8AF00FCD9B000FCD9B100FEE0BD00FADEBD00FCE1C200F8E3
        C900FEE9D000FFEDD800CFC1B000FFF2E300D0C6BA00FEF7EF00C78E4200C68C
        4100C68C4200CB934700CE995100FEF2E300FEF7EE00FFFBF600CB934600CC99
        5200C1914E00BB955C00F0D0A300F0D0A400F0D1A400998C7A00D0CBC400FEFA
        F4009F9D9A00F0D3A60065646200FFFEFC0091919000004B00005E817A0081FF
        FE0095E9FF0000BDFF003553C700000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000020202020202
        020202020202020202020A070B0B0B0B0B0B0B0B0B0B0B0B10060F28276D5552
        504B48455D2B3B5736080E796E617B7501015A5E415B3D3A370C0D3066337C7C
        7E010160472C593C380C0D1F34808383827E012E2D423F3D390C097D29837F7F
        837C744D313131313E0C090329817F7F837C765031313131580C0D01357A0183
        77325F514F4C49435C0C0901783529252A645463624E4A464005110101031F6F
        67566553522F4B4844131D706A69696969696968716B6C72731C182220212121
        212121232624261E841B0212141414141414141517191A160402020202020202
        0202020202020202020202020202020202020202020202020202}
      ItemLinks = <
        item
          Item = TotalObjects
          Visible = True
        end
        item
          Item = PrintDate
          Visible = True
        end
        item
          Item = NaturalPrint
          Visible = True
        end
        item
          Item = CostPrint
          Visible = True
        end
        item
          Item = CellWidthSpinEdit
          Visible = True
        end>
    end
    object SpinEditQ: TdxBarSpinEdit
      Caption = #1054#1082#1088#1091#1075#1083#1080#1090#1080' '#1086#1073#39#1108#1084' '#1076#1086'...'
      Category = 0
      Hint = #1054#1082#1088#1091#1075#1083#1080#1090#1080' '#1086#1073#39#1108#1084' '#1076#1086
      Visible = ivAlways
      OnCurChange = SpinEditQChange
      Width = 42
      MaxValue = 6.000000000000000000
      Value = 1.000000000000000000
    end
    object SpinEditC: TdxBarSpinEdit
      Caption = #1054#1082#1088#1091#1075#1083#1080#1090#1080' '#1074#1072#1088#1090#1110#1089#1090#1100' '#1076#1086'...'
      Category = 0
      Hint = #1054#1082#1088#1091#1075#1083#1080#1090#1080' '#1074#1072#1088#1090#1110#1089#1090#1100' '#1076#1086
      Visible = ivAlways
      OnCurChange = SpinEditCChange
      Width = 42
      MaxValue = 6.000000000000000000
    end
    object ApplyButton: TdxBarButton
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080' '#1079#1084#1110#1085#1080
      Category = 0
      Hint = #1055#1088#1080#1081#1085#1103#1090#1080' '#1079#1084#1110#1085#1080
      Visible = ivAlways
      Glyph.Data = {
        76030000424D7603000000000000360000002800000011000000100000000100
        1800000000004003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF00FF00FFFF00FFFF00FFFF00FFFF00FF004B00004B00FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF
        00FF004B000F9E1C0F9D1E004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FF004B001CB13511A4220C9C1911
        A021004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00
        FFFF00FF004B002EC65224BC43139224004B000D931A0E9D1D004B00FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FF004B0035CA5E39D4651CA1
        34004B00FF00FF004B000A86150F991C004B00FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF00FF00FFFF00FF004B0029B548004B00FF00FFFF00FFFF00FFFF00
        FF004B000C9518004B00FF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
        FF00FF004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00098611004B
        00FF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00004B00FF00FFFF00FFFF00
        FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF004B00004B00FF00FFFF00FF00FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00}
      OnClick = ApplyButtonClick
    end
    object CancelButton: TdxBarButton
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080' '#1079#1084#1110#1085#1080
      Category = 0
      Hint = #1042#1110#1076#1084#1110#1085#1080#1090#1080' '#1079#1084#1110#1085#1080
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
      OnClick = CancelButtonClick
    end
    object SimplePreviewBtn: TdxBarButton
      Caption = #1055#1077#1088#1077#1075#1083#1103#1085#1091#1090#1080' '#1079#1074#1110#1090
      Category = 0
      Hint = #1055#1077#1088#1077#1075#1083#1103#1085#1091#1090#1080' '#1079#1074#1110#1090
      Visible = ivAlways
      OnClick = SimplePreviewBtnClick
    end
    object ComplicatedPreviewBtn: TdxBarButton
      Caption = #1055#1077#1088#1077#1075#1083#1103#1085#1091#1090#1080' '#1079#1074#1077#1076#1077#1085#1080#1081' '#1079#1074#1110#1090
      Category = 0
      Hint = #1055#1077#1088#1077#1075#1083#1103#1085#1091#1090#1080' '#1079#1074#1077#1076#1077#1085#1080#1081' '#1079#1074#1110#1090
      Visible = ivAlways
      OnClick = ComplicatedPreviewBtnClick
    end
    object SimplePrintBtn: TdxBarButton
      Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1079#1074#1110#1090
      Category = 0
      Hint = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1079#1074#1110#1090
      Visible = ivAlways
      OnClick = SimplePrintBtnClick
    end
    object ComplicatedPrintBtn: TdxBarButton
      Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1079#1074#1077#1076#1077#1085#1080#1081' '#1079#1074#1110#1090
      Category = 0
      Hint = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1079#1074#1077#1076#1077#1085#1080#1081' '#1079#1074#1110#1090
      Visible = ivAlways
      OnClick = ComplicatedPrintBtnClick
    end
    object SimpleExpBtn: TdxBarSubItem
      Caption = #1045#1082#1089#1087#1086#1088#1090' '#1079#1074#1110#1090#1091
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = RTFButton
          Visible = True
        end
        item
          Item = ExcelButton
          Visible = True
        end
        item
          Item = HTMLButton
          Visible = True
        end>
    end
    object ComplicatedExpBtn: TdxBarSubItem
      Caption = #1045#1082#1089#1087#1086#1088#1090' '#1079#1074#1077#1076#1077#1085#1086#1075#1086' '#1079#1074#1110#1090#1091
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = RTFButtonC
          Visible = True
        end
        item
          Item = ExcelButtonC
          Visible = True
        end
        item
          Item = HTMLButtonC
          Visible = True
        end>
    end
    object RTFButton: TdxBarButton
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' Microsoft Word (*.rtf)'
      Category = 0
      Hint = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' Microsoft Word (*.rtf)'
      Visible = ivAlways
      ImageIndex = 8
      OnClick = RTFButtonClick
    end
    object HTMLButton: TdxBarButton
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' HTML (*.html)'
      Category = 0
      Hint = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' HTML (*.html)'
      Visible = ivAlways
      ImageIndex = 10
      OnClick = HTMLButtonClick
    end
    object ExcelButton: TdxBarButton
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' Microsoft Excel (*.xls)'
      Category = 0
      Hint = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' Microsoft Excel (*.xls)'
      Visible = ivAlways
      ImageIndex = 9
      OnClick = ExcelButtonClick
    end
    object RTFButtonC: TdxBarButton
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' Microsoft Word (*.rtf)'
      Category = 0
      Hint = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' Microsoft Word (*.rtf)'
      Visible = ivAlways
      ImageIndex = 8
      OnClick = RTFButtonClick
    end
    object HTMLButtonC: TdxBarButton
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' HTML (*.html)'
      Category = 0
      Hint = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' HTML (*.html)'
      Visible = ivAlways
      ImageIndex = 10
      OnClick = HTMLButtonClick
    end
    object ExcelButtonC: TdxBarButton
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' Microsoft Excel (*.xls)'
      Category = 0
      Hint = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' Microsoft Excel (*.xls)'
      Visible = ivAlways
      ImageIndex = 9
      OnClick = ExcelButtonClick
    end
    object TotalObjects: TdxBarButton
      Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1089#1091#1084#1091' '#1087#1086' '#1076#1078#1077#1088#1077#1083#1072#1084
      Category = 0
      Hint = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1089#1091#1084#1091' '#1087#1086' '#1076#1078#1077#1088#1077#1083#1072#1084
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = TotalObjectsClick
    end
    object PrintDate: TdxBarButton
      Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1076#1072#1090#1091' '#1089#1090#1074#1086#1088#1077#1085#1085#1103
      Category = 0
      Hint = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1076#1072#1090#1091' '#1089#1090#1074#1086#1088#1077#1085#1085#1103
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object CostPrint: TdxBarButton
      Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1091' '#1074#1072#1088#1090#1110#1089#1090#1085#1086#1084#1091' '#1074#1080#1088#1072#1079#1110
      Category = 0
      Hint = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1091' '#1074#1072#1088#1090#1110#1089#1090#1085#1086#1084#1091' '#1074#1080#1088#1072#1079#1110
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = CostPrintClick
    end
    object NaturalPrint: TdxBarButton
      Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1091' '#1085#1072#1090#1091#1088#1072#1083#1100#1085#1086#1084#1091' '#1074#1080#1088#1072#1079#1110
      Category = 0
      Hint = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1091' '#1085#1072#1090#1091#1088#1072#1083#1100#1085#1086#1084#1091' '#1074#1080#1088#1072#1079#1110
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = NaturalPrintClick
    end
    object AdjustButton: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = #1055#1077#1088#1077#1088#1072#1093#1091#1074#1072#1090#1080' '#1074#1072#1088#1090#1110#1089#1090#1100'/'#1086#1073#39#1108#1084'...'
      Visible = ivAlways
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000FF00FF00FAF8
        FA00FAF7F900FAF8F9007F401F00FAEEE500CC731A00F7DAB600FFEAD200FFDC
        AB00FFEED400F0D7AA00F0DDBB00FFF7E600FFF3D600F8E6B600EEE9D700E9EA
        E200EDF1DA00DFE6D4001AB12C00038F1D00038E1D00068C200018982F000389
        1E0026BF45001FBC4500109532002CC4540039D969004680570035D0690039D7
        6E001C9948002AC5600035D06B0038D76E0020A652001C84430030C7670033CA
        6A0034CC6C0034CC6D0034CB6B00EEF6F10030885700EEF6F2002DB07600EDF6
        F2002CAE78004FA183001E9D710028A17B00F6FAF90024957B0026987D001168
        5A0017756C001B7D800013666A006194A2001C659A002369A200359AF0003C9E
        F1003C9FF10044A3F30051ABF4005AB1F5001F8CEE002891EF001153930081A1
        C7008FA9C800FFFFFF0000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000000000000048
        00000000000000000000000000000048480000000000000000001818223E4845
        45483A1818181818000018253B4845454146481E323021180000182848454842
        4648171D354824180000182948481C484815481A38482A180404182B48371448
        1648482648482C180904182048341B1948454448464823180B0418181F331848
        45454347483C181827040000044B4B49484440483F2E0C070F040000044B4B4B
        3D48484A4B27080A0E0400000427272727394827272727272704000004312D2D
        2703362F2F271310120400000402020227030302012711050D04000006060606
        0606060606060606060600000006060606060606060606060600}
      OnClick = AdjustButtonClick
    end
    object ReportSumsPreview: TdxBarButton
      Caption = #1055#1077#1088#1077#1075#1083#1103#1085#1091#1090#1080' '#1087#1083#1072#1085' '#1074#1080#1088#1086#1073#1085#1080#1094#1090#1074#1072' '#1090#1086#1074#1072#1088#1085#1086#1111' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      Category = 0
      Hint = #1055#1077#1088#1077#1075#1083#1103#1085#1091#1090#1080' '#1087#1083#1072#1085' '#1074#1080#1088#1086#1073#1085#1080#1094#1090#1074#1072' '#1090#1086#1074#1072#1088#1085#1086#1111' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      Visible = ivAlways
      OnClick = ReportSumsPreviewClick
    end
    object ReportSumsPrint: TdxBarButton
      Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1087#1083#1072#1085' '#1074#1080#1088#1086#1073#1085#1080#1094#1090#1074#1072' '#1090#1086#1074#1072#1088#1085#1086#1111' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      Category = 0
      Hint = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1087#1083#1072#1085' '#1074#1080#1088#1086#1073#1085#1080#1094#1090#1074#1072' '#1090#1086#1074#1072#1088#1085#1086#1111' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      Visible = ivAlways
      OnClick = ReportSumsPrintClick
    end
    object dxBarButton1: TdxBarButton
      Category = 0
      Visible = ivAlways
    end
    object SumExpBtn: TdxBarSubItem
      Caption = #1045#1082#1089#1087#1086#1088#1090' '#1087#1083#1072#1085#1091' '#1074#1080#1088#1086#1073#1085#1080#1094#1090#1074#1072' '#1090#1086#1074#1072#1088#1085#1086#1111' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = RTFButtonS
          Visible = True
        end
        item
          Item = ExcelButtonS
          Visible = True
        end
        item
          Item = HTMLButtonS
          Visible = True
        end>
    end
    object RTFButtonS: TdxBarButton
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' Microsoft Word (*.rtf)'
      Category = 0
      Hint = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' Microsoft Word (*.rtf)'
      Visible = ivAlways
      ImageIndex = 8
      OnClick = RTFButtonClick
    end
    object HTMLButtonS: TdxBarButton
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' HTML (*.html)'
      Category = 0
      Hint = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' HTML (*.html)'
      Visible = ivAlways
      ImageIndex = 10
      OnClick = HTMLButtonClick
    end
    object ExcelButtonS: TdxBarButton
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' Microsoft Excel (*.xls)'
      Category = 0
      Hint = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082' '#1092#1072#1081#1083' Microsoft Excel (*.xls)'
      Visible = ivAlways
      ImageIndex = 9
      OnClick = ExcelButtonClick
    end
    object CellWidthSpinEdit: TdxBarEdit
      Align = iaRight
      Caption = #1044#1086#1074#1078#1080#1085#1072' '#1089#1090#1086#1074#1073#1094#1103' '#1091' '#1079#1074#1077#1076#1077#1085#1086#1084#1091' '#1079#1074#1110#1090#1110
      Category = 0
      Hint = #1044#1086#1074#1078#1080#1085#1072' '#1089#1090#1086#1074#1073#1094#1103' '#1091' '#1079#1074#1077#1076#1077#1085#1086#1084#1091' '#1079#1074#1110#1090#1110
      Visible = ivAlways
      Text = '80'
      OnCurChange = CellWidthSpinEditCurChange
      Width = 40
    end
  end
  object DocPopupMenu: TPopupMenu
    Images = ImageList2
    Left = 16
    Top = 136
    object pAddDocToolButton: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080' '#1085#1086#1074#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 0
      OnClick = AddDocButtonClick
    end
    object pEditNameDocBtn: TMenuItem
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1085#1072#1079#1074#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      ImageIndex = 6
      OnClick = EditNameDocBtnClick
    end
    object pEditDocButton: TMenuItem
      Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 2
      OnClick = EditDocButtonClick
    end
    object pDelDocButton: TMenuItem
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 1
      OnClick = DelDocButtonClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object pSignButton: TMenuItem
      Caption = #1055#1110#1076#1087#1080#1089#1072#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 7
    end
  end
  object DepTreePopupMenu: TPopupMenu
    Images = ImageList2
    Left = 663
    Top = 353
    object MenuItem7: TMenuItem
      Bitmap.Data = {
        F6060000424DF606000000000000360000002800000017000000180000000100
        180000000000C0060000230B0000230B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFABACAC989B9C989B9C989B
        9C989B9C989B9C989B9C989B9C989B9C989B9C989B9C989B9C989B9C989B9C98
        9B9C989B9C989B9C989B9C989B9C989B9CFF00FFFF00FF000000FF00FFABACAC
        DFDFDEDEDEDEDDDDDDDDDDDCDCDCDBDBDBDBDADADAD9D9D9D9D9D8D8D8D8D7D7
        D7D6D6D6D5D5D5D5D5D5D4D4D4D3D3D3D2D2D2D2D2D2989B9CFF00FFFF00FF00
        0000FF00FFABACACE0E0DF2DA7DF31A9DF33AAE033AAE033AAE033AAE033AAE0
        31A9DF2DA7DF2CA6DE28A5DE25A3DD21A1DC1EA0DC1EA0DC1EA0DCD2D2D2989B
        9CFF00FFFF00FF000000FF00FFABACACE1E1E033AAE0FFFFFFFFFFFF38ACE1FF
        FFFFFFFFFF38ACE1FFFFFFFFFFFF2FA8DFFFFFFFFFFFFF23A2DDFFFFFFFFFFFF
        1EA0DCD3D3D3989B9CFF00FFFF00FF000000FF00FFABACACE1E1E136ABE08584
        86ECECEC3DAFE2858486FFFFFF3BAEE1858486ECECEC33AAE0858486ECECEC26
        A4DD858486ECECEC1EA0DCD4D4D4989B9CFF00FFFF00FF000000FF00FFABACAC
        E2E2E13BAEE13DAFE241B0E242B1E342B1E342B1E341B0E23DAFE23BAEE1CE6B
        00CE6B00CE6B00CE6B0025A3DD1FA0DC1EA0DCD5D5D5989B9CFF00FFFF00FF00
        0000FF00FFABACACE3E3E23DAFE2FFFFFFFFFFFF48B4E4FFFFFFFFFFFF46B3E3
        FFFFFFFFFFFFCE6B00FDEDE3FDEDE3CE6B00FFFFFFFFFFFF1EA0DCD5D5D5989B
        9CFF00FFFF00FF000000FF00FFABACACE4E4E341B0E2858486ECECEC56BAE685
        8486FFFFFF4CB6E4858486ECECECCE6B00A74D21FAD8C2CE6B00858486ECECEC
        1EA0DCD6D6D6989B9CFF00FFFF00FF000000FF00FFABACACE5E5E442B1E348B4
        E456BAE65FBFE864C1E95FBFE856BAE648B4E442B1E3CE6B00CE6B00CE6B00CE
        6B0028A5DE23A2DD1EA0DCD7D7D7989B9CFF00FFFF00FF000000FF00FFABACAC
        E6E6E542B1E3FFFFFFFFFFFF64C1E9FFFFFFFFFFFF56BAE6FFFFFFFFFFFF3DAF
        E2FFFFFFFFFFFF2DA7DFFFFFFFFFFFFF1EA0DCD8D8D8989B9CFF00FFFF00FF00
        0000FF00FFABACACE7E7E642B1E3858486ECECEC5FBFE8858486FFFFFF56BAE6
        858486ECECEC3DAFE2858486ECECEC2DA7DF858486ECECEC1EA0DCD9D9D9989B
        9CFF00FFFF00FF000000FF00FFABACACE7E7E641B0E246B3E34CB6E456BAE656
        BAE656BAE64CB6E446B3E341B0E23BAEE138ACE133AAE02DA7DF28A5DE23A2DD
        1EA0DCDADAD9989B9CFF00FFFF00FF000000FF00FFABACACEAEAE9E7E7E6E7E7
        E6E6E6E5E5E5E4E4E4E3E3E3E2E3E3E2E2E2E1E1E1E0E0E0DFDFDFDFDFDFDEDE
        DEDDDDDDDCDCDCDCDBDBDBDBDBDA989B9CFF00FFFF00FF000000FF00FFABACAC
        1FA1211D9D1F1C9A1D1C991D1B971C1A951B19931A189119188F18178D17168B
        17158916158715148514148514148514148514148514989B9CFF00FFFF00FF00
        0000FF00FFABACAC21A5231FA1211D9D1F1C9A1D1C991D1B971C1A951B19931A
        189119188F18178D17168B17158916158715148514148514148514148514989B
        9CFF00FFFF00FF000000FF00FFABACAC23A92521A5230000001485141C9A1D1C
        991D1B971C1A951B19931A178D17178D17178D17168B17158916158715000000
        137913148514989B9CFF00FFFF00FF000000FF00FFABACAC24AD27636363A5A5
        A50000001485141C9A1D1C991D1B971C1B971C1B971C1B971C178D17178D1716
        8B17636363A5A5A5000000137913989B9CFF00FFFF00FF000000FF00FFABACAC
        9B9B9B636363D6D6D66363638C8C8C9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B
        9B9B9B9B9B9B9B9B9B9B636363D6D6D66363638C8C8C9B9B9BFF00FFFF00FF00
        0000FF00FFFF00FFFF00FF9B9B9BFFFFFF636363FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9BFFFFFF636363FF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9B9B9BFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9B
        FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000}
      Caption = #1055#1088#1072#1094#1102#1074#1072#1090#1080' '#1079' '#1087#1077#1088#1110#1086#1076#1072#1084#1080
      OnClick = StagesButtonClick
    end
    object MenuItem8: TMenuItem
      Caption = '-'
    end
    object MenuItem9: TMenuItem
      Caption = #1055#1077#1088#1077#1075#1083#1103#1085#1091#1090#1080
      ImageIndex = 5
    end
    object MenuItem10: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C6A6AAAA7A7A19F9F6C6A6A6C
        6A6A6C6A6AE5E3E36C6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FF
        6C6A6ADAD9D9A19F9FA19F9FA19F9F3736363535356C6D6DBFBFBFE1E2E2B7B6
        B66C6A6A6C6A6A6C6A6AFF00FF6C6A6AD4D3D3CACACA8E8C8C8E8C8C8E8C8C3C
        3B3B0A090A0707070B0B0B0707077A7A7ABBBBBB6C6A6AFF00FF6C6A6ACACACA
        CACACA8E8C8CD7D4D4CECBCBBFBCBCB1AFAFA3A0A08886865E5B5C0707070909
        090808086C6A6A7673736C6A6ACACACA8E8C8CEFEEEEFFFEFEFBFAFAE3E0E1DE
        DEDEDEDDDDCFCECEBDBCBCADABAB8B89895856567A78787573736C6A6A8E8C8C
        FFFFFFFEFCFCFAFAFAD5D4D5989193A09899B2ABACC4C0C1D7D7D7D8D8D8C7C6
        C6B7B6B6918F8F6C6969FF00FF6C6A6A6C6A6AEDEBEBB1A6A77A6F728A838896
        92959690919D97989A93959E9899BBBABAD1D1D1C2C2C26C6A6AFF00FFFF00FF
        FF00FF6C6A6ABB897FA7876D8B6F647D67606F62657973798F8B8EA9A3A4CBCA
        CAC1C1C16C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFE3B4FFD39FE9
        B281C99973BA916CBD8281807D7E6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFBD8281FFE0B8FFD3A7FFD09DFFCE90FFC688BD8281FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC08683FFE7CFFFE0C0FFD9B2FF
        D3A5FFD099BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFBD8281FEEBD8FFE6CCFFDEBDFFD8B1FED3A4BD8281FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFFFF2FFFFF2FFEBD8FFE5CAFF
        E1BDF3C7A7BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        BD8281BD8281BD8281FBEFE2FBE3CFFBDDC2BD8281FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281BD8281BD
        8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080
      ImageIndex = 4
    end
    object MenuItem11: TMenuItem
      Caption = '-'
    end
    object MenuItem12: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B390BFF00FFFF00FFFF
        00FF9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF9B390B9B390B9B390BEBA45AEBA45A9C3B0DFFCF92EBA45ADD882E9C3B
        0DFF00FFFF00FFFF00FFFF00FFFF00FF9B390B9B390B9B390B9B390B9B390BFF
        00FF9B390B9C3B0D9C3A0D9B3A0C9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF9B390BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B390BFF00FFFF00FFFF
        00FF9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFEBA45AEBA45AEBA45AEBA45A9C3B0DFFCF92EBA45ADD882E9C3B
        0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B390BFF00FFFF00FFFF
        00FF9B390B9C3B0D9C3A0D9B3A0C9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF9B390BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF9B390B9B390B9B390B9B390B9B390BFF
        00FF9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF9B390B9B390B9B390BEBA45AEBA45A9C3B0DFFCF92EBA45ADD882E9C3B
        0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B390BFF00FFFF00FFFF
        00FF9B390B9C3B0D9C3A0D9B3A0C9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF9C3B0DFFCF92EBA45ADD882E9C3B0DFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        9B390B9C3B0D9C3A0D9B3A0C9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = #1056#1086#1079#1075#1086#1088#1085#1091#1090#1080' '#1091#1089#1110' '#1074#1091#1079#1083#1080
      OnClick = ExpandButtonClick
    end
    object MenuItem13: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C3B0DFF00FFFF00FFFF
        00FF9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF9C3B0DEBA45AEBA45AEBA45A9C3B0DFFCF92EBA45ADD882E9C3B
        0DFF00FFFF00FFFF00FFFF00FFFF00FF9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF
        00FF9B390B9C3B0D9C3A0D9B3A0C9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C3B0DFF00FFFF00FFFF
        00FF9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFEBA45AEBA45AEBA45AEBA45A9C3B0DFFCF92EBA45ADD882E9C3B
        0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C3B0DFF00FFFF00FFFF
        00FF9B390B9C3B0D9C3A0D9B3A0C9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF
        00FF9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF9C3B0DEBA45AEBA45AEBA45A9C3B0DFFCF92EBA45ADD882E9C3B
        0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C3B0DFF00FFFF00FFFF
        00FF9B390B9C3B0D9C3A0D9B3A0C9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF9C3B0DFFCF92EBA45ADD882E9C3B0DFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        9B390B9C3B0D9C3A0D9B3A0C9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = #1047#1075#1086#1088#1085#1091#1090#1080' '#1091#1089#1110' '#1074#1091#1079#1083#1080
      OnClick = CollapseButtonClick
    end
    object MenuItem14: TMenuItem
      Caption = '-'
    end
    object MenuItem15: TMenuItem
      Bitmap.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF004B00004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF004B000F9E1C0F9D1E004B00FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565659A9A9A9A9A9A65
        6565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF004B001CB13511A4220C9C1911A021004B00FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565ABABAB9E9E9E9797979C
        9C9C656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        004B002EC65224BC43139224004B000D931A0E9D1D004B00FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF656565BFBFBFB5B5B598989865656594
        9494999999656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00
        35CA5E39D4651CA134004B00FF00FF004B000A86150F991C004B00FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF656565C4C4C4CACACAA5A5A5656565FF00FF65
        65658C8C8C989898656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        004B0029B548004B00FF00FFFF00FFFF00FF004B000A86150C9518004B00FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF656565B5B5B5656565FF00FFFF00FFFF
        00FF6565658C8C8C939393656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF004B00FF00FFFF00FFFF00FFFF00FFFF00FF004B000C9518098611004B
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565FF00FFFF00FFFF00FFFF
        00FFFF00FF6565658C8C8C8A8A8A656565FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B000C95180A86
        15004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF6565658C8C8C8C8C8C656565FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00004B
        00004B00004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF656565656565656565656565FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = #1055#1088#1080#1085#1103#1090#1100
      ImageIndex = 3
      OnClick = ApplyButtonClick
    end
    object MenuItem16: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
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
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      OnClick = CancelButtonClick
    end
  end
  object ProductTreePopupMenu: TPopupMenu
    Images = ImageList2
    Left = 691
    Top = 353
    object pAddButton: TMenuItem
      Bitmap.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        92635DA46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FF89898989898989898989898989898989
        8989898989898989898989898989898989898989898989FF00FFFF00FFFF00FF
        96655EF3DEBBF3DAB5F2D8AFF2D5A9F0D3A4EFD09FEFCE9AEECB96EDCA92EDC6
        8FEDC68B9F6F60FF00FFFF00FFFF00FF898989CFCFCFCDCDCDCBCBCBC9C9C9C7
        C7C7C5C5C5C3C3C3C1C1C1BFBFBFBFBFBFBDBDBD898989FF00FFFF00FFFF00FF
        99685FF4E1C0004B00F3DCB6F3D8B0811E00811E00811E00811E00811E00811E
        00EEC78F9F6F60FF00FFFF00FFFF00FF898989D1D1D16B6B6BCECECECBCBCB6B
        6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6BBFBFBF898989FF00FFFF00FFFF00FF
        9E6B62F7E5C9F6E1C2F4DEBCF4DCB6F2D8B1F2D7ABF0D3A6EFD0A1EFCF9DEECB
        98EEC9939F6F60FF00FFFF00FFFF00FF898989D5D5D5D3D3D3D0D0D0CECECECB
        CBCBCACACAC7C7C7C6C6C6C4C4C4C2C2C2C0C0C0898989FF00FFFF00FF004B00
        004B00004B00004B00004B00004B00004B00004B00004B00004B00004B00004B
        00004B00004B00004B00FF00FF62626262626262626262626262626262626262
        6262626262626262626262626262626262626262626262626262FF00FF004B00
        A97566F8EBD5004B00F7E6CAF7E2C4811E00811E00811E00811E00811E00811E
        00F0CF9E9F6F60004B00FF00FF626262898989D9D9D96B6B6BD5D5D5D3D3D36B
        6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6BC5C5C5898989626262FF00FF004B00
        004B00004B00004B00004B00004B00004B00004B00004B00004B00004B00004B
        00004B00004B00004B00FF00FF62626262626262626262626262626262626262
        6262626262626262626262626262626262626262626262626262FF00FFFF00FF
        B67F6AFBF2E2FAEEDDF8EBD8F7E9D1F7E6CBF7E3C6F6E1C0F4DDBAF3DCB5F2D8
        B0F0D5AA9F6F60FF00FFFF00FFFF00FF898989DEDEDEDCDCDCDADADAD7D7D7D6
        D6D6D4D4D4D2D2D2CFCFCFCDCDCDCBCBCBC9C9C9898989FF00FFFF00FFFF00FF
        BC846CABA69E003300AAA397F8EDD8811E00811E00811E00811E00811E00811E
        00F3D9B09F6F60FF00FFFF00FFFF00FF898989B9B9B96B6B6BB6B6B6DADADA6B
        6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6BCBCBCB898989FF00FFFF00FFFF00FF
        004B00004B00004B00AAA59CFBF0DEFAEED9F8EBD4F7E6CEF6E3C9F6E2C2F4E0
        BDF4DCB69F6F60FF00FFFF00FFFF00FF818181818181818181B8B8B8DDDDDDDB
        DBDBD9D9D9D7D7D7D4D4D4D3D3D3D0D0D0CECECE898989FF00FFFF00FFFF00FF
        004B000D9A1A004B00ACA69FABA59CABA399F8EEDAF8EBD4F7E7CFF7E5CAF6E2
        C4F4DEBD9F6F60FF00FFFF00FFFF00FF818181A9A9A9818181B9B9B9B8B8B8B7
        B7B7DBDBDBD9D9D9D7D7D7D5D5D5D3D3D3D0D0D0898989FF00FF004B00004B00
        004B0016AC2D004B00004B00004B00581400811E00811E00811E00811E00811E
        00F6E2C59F6F60FF00FF818181818181818181B4B4B48181818181818181816B
        6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6BD3D3D3898989FF00FF004B0031DA60
        2BD05423C2441AB43413A525004B00ACA7A0FCF3E6FBF0E2FAEFDDFAEBD7F8E9
        D1F7E5CB9F6F60FF00FF818181D0D0D0CBCBCBC2C2C2B9B9B9B0B0B0818181BA
        BABADFDFDFDEDEDEDCDCDCDADADAD8D8D8D6D6D6898989FF00FF004B00004B00
        004B002ED55A004B00004B00004B00FCF8F0FCF7EDFBF4E7FAF2E3FAEFDDF8ED
        D9F8E9D19F6F60FF00FF818181818181818181CECECE818181818181818181E3
        E3E3E2E2E2DFDFDFDEDEDEDCDCDCDBDBDBD8D8D8898989FF00FFFF00FFFF00FF
        004B0034DE65004B008C6046CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E
        68CF8E68CF8E68FF00FFFF00FFFF00FF818181D3D3D381818184848489898989
        8989898989898989898989898989898989898989898989FF00FFFF00FFFF00FF
        004B00004B00004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF818181818181818181FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = #1044#1086#1076#1072#1090#1080
      ImageIndex = 0
      object pAddProductButton: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          A87D78B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
          83B78183B78183FF00FFFF00FFFF00FFAB7F79F6E6CAF6E3C5F5E1C0F5DFBBF4
          DDB7F3DBB3F3D9AFF2D7ABF1D6A8F1D3A5F1D3A2B3897BFF00FFFF00FFFF00FF
          AE827AF7E8CE006600F6E4C6F6E1C19933009933009933009933009933009933
          00F2D4A5B3897BFF00FFFF00FFFF00FFB2857CF9EBD5F8E8D0F7E6CBF7E4C6F5
          E1C2F5E0BDF4DDB9F3DBB5F3DAB1F2D7ADF2D5A9B3897BFF00FFFF00FF006600
          0066000066000066000066000066000066000066000066000066000066000066
          00006600006600006600FF00FF006600BB8E80FAF0DF006600F9ECD6F9E9D199
          3300993300993300993300993300993300F4DAB2B3897B006600FF00FF006600
          0066000066000066000066000066000066000066000066000066000066000066
          00006600006600006600FF00FFFF00FFC69784FCF5E9FBF2E5FAF0E1F9EEDCF9
          ECD7F9EAD3F8E8CEF7E5C9F6E4C5F5E1C1F4DFBCB3897BFF00FFFF00FFFF00FF
          CB9C86BDB9B2004C00BCB6ACFAF1E19933009933009933009933009933009933
          00F6E2C1B3897BFF00FFFF00FFFF00FF006600006600006600BCB8B0FCF4E6FB
          F2E2FAF0DEF9ECD9F8EAD5F8E9D0F7E7CCF7E4C6B3897BFF00FFFF00FFFF00FF
          0066001BAF2E006600BEB9B3BDB8B0BDB6AEFAF2E3FAF0DEF9EDDAF9EBD6F8E9
          D1F7E6CCB3897BFF00FF00660000660000660029BE4500660000660000660073
          2600993300993300993300993300993300F8E9D2B3897BFF00FF0066004AE37B
          43DB6F39D05F2EC44D24B83C006600BEBAB4FDF6ECFCF4E9FBF3E5FBF0E0FAEE
          DCF9EBD7B3897BFF00FF00660000660000660047DF75006600006600006600FD
          FAF4FDF9F1FCF7EDFBF5EAFBF3E5FAF1E2FAEEDCB3897BFF00FFFF00FFFF00FF
          0066004DE67F006600A37B61DAA482DAA482DAA482DAA482DAA482DAA482DAA4
          82DAA482DAA482FF00FFFF00FFFF00FF006600006600006600FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = #1055#1088#1086#1076#1091#1082#1094#1110#1102'\'#1050#1072#1090#1077#1075#1086#1088#1110#1102' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1110#1074
        OnClick = AddProductButtonClick
      end
      object pAddObjectButton: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          A87D78B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
          83B78183B78183FF00FFFF00FFFF00FFAB7F79F6E6CAF6E3C5F5E1C0F5DFBBF4
          DDB7F3DBB3F3D9AFF2D7ABF1D6A8F1D3A5F1D3A2B3897BFF00FFFF00FFFF00FF
          AE827AF7E8CE006600F6E4C6F6E1C19933009933009933009933009933009933
          00F2D4A5B3897BFF00FFFF00FFFF00FFB2857CF9EBD5F8E8D0F7E6CBF7E4C6F5
          E1C2F5E0BDF4DDB9F3DBB5F3DAB1F2D7ADF2D5A9B3897BFF00FFFF00FF006600
          0066000066000066000066000066000066000066000066000066000066000066
          00006600006600006600FF00FF006600BB8E80FAF0DF006600F9ECD6F9E9D199
          3300993300993300993300993300993300F4DAB2B3897B006600FF00FF006600
          0066000066000066000066000066000066000066000066000066000066000066
          00006600006600006600FF00FFFF00FFC69784FCF5E9FBF2E5FAF0E1F9EEDCF9
          ECD7F9EAD3F8E8CEF7E5C9F6E4C5F5E1C1F4DFBCB3897BFF00FFFF00FFFF00FF
          CB9C86BDB9B2004C00BCB6ACFAF1E19933009933009933009933009933009933
          00F6E2C1B3897BFF00FFFF00FFFF00FF006600006600006600BCB8B0FCF4E6FB
          F2E2FAF0DEF9ECD9F8EAD5F8E9D0F7E7CCF7E4C6B3897BFF00FFFF00FFFF00FF
          0066001BAF2E006600BEB9B3BDB8B0BDB6AEFAF2E3FAF0DEF9EDDAF9EBD6F8E9
          D1F7E6CCB3897BFF00FF00660000660000660029BE4500660000660000660073
          2600993300993300993300993300993300F8E9D2B3897BFF00FF0066004AE37B
          43DB6F39D05F2EC44D24B83C006600BEBAB4FDF6ECFCF4E9FBF3E5FBF0E0FAEE
          DCF9EBD7B3897BFF00FF00660000660000660047DF75006600006600006600FD
          FAF4FDF9F1FCF7EDFBF5EAFBF3E5FAF1E2FAEEDCB3897BFF00FFFF00FFFF00FF
          0066004DE67F006600A37B61DAA482DAA482DAA482DAA482DAA482DAA482DAA4
          82DAA482DAA482FF00FFFF00FFFF00FF006600006600006600FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = #1054#1073#39#1108#1082#1090' '#1074#1086#1076#1086#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
        OnClick = AddObjectButtonClick
      end
    end
    object pEditButton: TMenuItem
      Bitmap.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA46769A46769
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
        9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FFA46769FCEACE
        F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
        69FF00FFFF00FFFF00FF9C9C9CEBEBEBDEDEDECCCCCCB8B8B8B2B2B2BABABABE
        BEBEBFBFBFC1C1C1C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FFA0675BFEEFDA
        F6E0C6302D2D212527374546998468AD926FC2A074DCB27AE7BC7EEFC481A467
        69FF00FFFF00FFFF00FF959595F0F0F0E5E5E5656565585858777777989898A4
        A4A4AEAEAEBBBBBBC1C1C1C6C6C69C9C9CFF00FFFF00FFFF00FFA0675BFFF4E5
        F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
        69FF00FFFF00FFFF00FF959595F5F5F5E9E9E9A4A4A46A6A6A7676766161617E
        7E7E909090A5A5A5B4B4B4C1C1C19C9C9CFF00FFFF00FFFF00FFA7756BFFFBF0
        F8EADCEEDDCA22576C165E82745D657D52545E3F39867258A78C66CEAA73A065
        67FF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE4E4E47D7D7D7F7F7F82828281
        81816666668888889D9D9DB2B2B2999999FF00FFFF00FFFF00FFA7756BFFFFFC
        FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
        5EFF00FFFF00FFFF00FF9F9F9FFEFEFEF3F3F3EEEEEEACACAC949494C4C4C4AD
        ADAD8B8B8B6363638080809393938F8F8FFF00FFFF00FFFF00FFBC8268FFFFFF
        FEF7F2FAEFE6F0E5D56B5D62E9A4A1CF9090B27575875353583C357A69508153
        54FF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3E9E9E97E7E7ED1D1D1C0
        C0C0A8A8A88686866161617F7F7F838383FF00FFFF00FFFF00FFBC8268FFFFFF
        FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
        4EFF00FFFF00FFFF00FFA6A6A6FFFFFFFEFEFEF8F8F8F3F3F3E4E4E48D8D8DCF
        CFCFBFBFBFA9A9A98585856464647B7B7BFF00FFFF00FFFF00FFD1926DFFFFFF
        FFFFFFFFFEFCFEF7F0FAEFE5E1CEC0875958E1A1A1CC8E8EB07474865151633B
        3CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3F3F3DBDBDB88
        8888CECECEBEBEBEA7A7A7848484696969FF00FFFF00FFFF00FFD1926DFFFFFF
        FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
        423E4145FF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3D2
        D2D28B8B8BD2D2D2BCBCBCAAAAAA7979795C5C5CFF00FFFF00FFDA9D75FFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFCF3E6CFB5AA976666EFAAA98C6D731E79
        9F0C98BD0C98BDFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F4
        F4F4CBCBCB969696D7D7D7959595919191909090909090FF00FFDA9D75FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
        F0008EDE000F95000081B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFC
        FCFCD6D6D68D8D8D9292929E9E9E9F9F9F9191917474746A6A6AE7AB79FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5A56B5FD1914F068FC10393
        DE0320BA0318B2010B99BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDBDBDB999999A3A3A38D8D8D928F92878787848484767676E7AB79FBF4F0
        FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
        BF2F45ED1031D3010A95BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6
        F6F6D7D7D7999999AAAAAAFF00FF888888BABABA9C9C9C757575E7AB79D1926D
        D1926DD1926DD1926DD1926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00
        FF2732D00C19B4FF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1
        B1B1B1B1B1999999FF00FFFF00FFFF00FFAAAAAA8C8C8CFF00FF}
      Caption = #1047#1084#1110#1085#1080#1090#1080
      ImageIndex = 2
      OnClick = EditButtonClick
    end
    object pDelButton: TMenuItem
      Bitmap.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FF6969696969696E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
        6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E696969FF00FFFF00FF
        B79184FEE9C7F4DAB5F3D5AAF2D0A0EFCB96EFC68BEDC182EBC17FEBC180EBC1
        80F2C782A46769FF00FF696969696969919191E1E1E1D2D2D2CBCBCBC5C5C5BF
        BFBFB9B9B9B3B3B3B2B2B2B2B2B2B2B2B2B7B7B76E6E6E696969FF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FF696969696969929292E4E4E4D4D4D4CDCDCDC7C7C7C1
        C1C1BCBCBCB6B6B6B0B0B0AFAFAFAFAFAFB5B5B56E6E6E696969FF00FFFF00FF
        B7938AFEEFDAF6E0C6F2DABCF2D5B2EFD0A9EECB9EEDC796EBC28CE9BD82E9BD
        7FEFC481A46769FF00FF696969696969949494EAEAEADBDBDBD4D4D4CECECEC8
        C8C8C1C1C1BCBCBCB6B6B6B0B0B0AFAFAFB5B5B56E6E6E696969FF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FF696969696969989898F1F1F1E0E0E0DADADAD3D3D3CD
        CDCDC7C7C7C1C1C1BCBCBCB6B6B6B1B1B1B4B4B46E6E6E696969FF00FFFF00FF
        C09E95FFFBF0F8EADCF6E3CFF4E0C6F2D9BCF2D5B1F0D0A9EDCB9EEDC695EBC2
        8AEFC583A46769FF00FF6969696969699F9F9FF8F8F8E7E7E7DFDFDFDADADAD3
        D3D3CDCDCDC8C8C8C1C1C1BCBCBCB6B6B6B6B6B66E6E6E696969FF00FFFF00FF
        C6A49AFFFFFCFAF0E6F8EADAF7E5CFF4E0C5F2DABA6E6ED46E6ED46E6ED4EBC7
        93F2C98CA46769FF00FF696969696969A5A5A5FEFEFEEEEEEEE7E7E7E0E0E0DA
        DADAD3D3D38D8D8D8D8D8D8D8D8DBBBBBBBBBBBB6E6E6E696969FF00FFFF00FF
        00018B6E6ED46E6ED4FAEFE6F8EAD9F7E3CF6E6ED400018B00018B6E6ED4EECC
        9EF3CE97A46769FF00FF6969696969692A2A2A8D8D8D8D8D8DEEEEEEE6E6E6DF
        DFDF8D8D8D2A2A2A2A2A2A8D8D8DC2C2C2C2C2C26E6E6E696969FF00FFFF00FF
        6E6ED400018B00018B6E6ED4FAEFE66E6ED400018B00018B6E6ED4F3D4B0F0D0
        A6F6D3A0A46769FF00FF6969696969698D8D8D2A2A2A2A2A2A8D8D8DEEEEEE8D
        8D8D2A2A2A2A2A2A8D8D8DCDCDCDC7C7C7C8C8C86E6E6E696969FF00FFFF00FF
        D4B0A16E6ED400018B00018B6E6ED400018B00018B6E6ED4F6DEC4F3D9B8F4D8
        B1EBCFA4A46769FF00FF696969696969AFAFAF8D8D8D2A2A2A2A2A2A8D8D8D2A
        2A2A2A2A2A8D8D8DD9D9D9D2D2D2CFCFCFC5C5C56E6E6E696969FF00FFFF00FF
        D9B5A1FFFFFF6E6ED400018B00018B00018B6E6ED4F8E9D9F8E7D1FBEACEDECE
        B4B6AA93A46769FF00FF696969696969B3B3B3FFFFFF8D8D8D2A2A2A2A2A2A2A
        2A2A8D8D8DE6E6E6E2E2E2E3E3E3C8C8C8A4A4A46E6E6E696969FF00FFFF00FF
        DDB7A4FFFFFFFFFFFF6E6ED400018B00018B00018BFCF3E6EDD8C9B68A7BA17B
        6F9C7667A46769FF00FF696969696969B5B5B5FFFFFFFFFFFF8D8D8D2A2A2A2A
        2A2A2A2A2AF0F0F0D6D6D68A8A8A7C7C7C7676766E6E6E696969FF00FFFF00FF
        E2BCA5FFFFFF6E6ED400018B00018B6E6ED400018B00018BDAC1BAAD735BE19E
        55E68F31B56D4DFF00FF696969696969B9B9B9FFFFFF8D8D8D2A2A2A2A2A2A8D
        8D8D2A2A2A2A2A2AC2C2C27272728F8F8F7C7C7C6B6B6B696969FF00FFFF00FF
        E6BFA76E6ED400018B00018B6E6ED4FFFFFF6E6ED400018B00018BB88265F8B5
        5CBF7A5CFF00FFFF00FF696969696969BCBCBC8D8D8D2A2A2A2A2A2A8D8D8DFF
        FFFF8D8D8D2A2A2A2A2A2A7F7F7FA2A2A2797979696969696969FF00FFFF00FF
        E4BCA400018B00018B6E6ED4FAF3EFF8F2EFF7F2EF6E6ED400018B6E6ED4C183
        6CFF00FFFF00FFFF00FF696969696969B9B9B92A2A2A2A2A2A8D8D8DF3F3F3F2
        F2F2F2F2F28D8D8D2A2A2A8D8D8D838383696969696969696969FF00FFFF00FF
        E8C4ADEBCBB7EBCBB7EACBB7EACAB6EACAB6EACAB6EACAB66E6ED400018BFF00
        FFFF00FFFF00FFFF00FF696969696969C1C1C1C9C9C9C9C9C9C8C8C8C8C8C8C8
        C8C8C8C8C8C8C8C88D8D8D2A2A2A696969696969696969696969}
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ImageIndex = 1
      OnClick = DelButtonClick
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object pStagesButton: TMenuItem
      Bitmap.Data = {
        F6060000424DF606000000000000360000002800000017000000180000000100
        180000000000C0060000230B0000230B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFABACAC989B9C989B9C989B
        9C989B9C989B9C989B9C989B9C989B9C989B9C989B9C989B9C989B9C989B9C98
        9B9C989B9C989B9C989B9C989B9C989B9CFF00FFFF00FF000000FF00FFABACAC
        DFDFDEDEDEDEDDDDDDDDDDDCDCDCDBDBDBDBDADADAD9D9D9D9D9D8D8D8D8D7D7
        D7D6D6D6D5D5D5D5D5D5D4D4D4D3D3D3D2D2D2D2D2D2989B9CFF00FFFF00FF00
        0000FF00FFABACACE0E0DF2DA7DF31A9DF33AAE033AAE033AAE033AAE033AAE0
        31A9DF2DA7DF2CA6DE28A5DE25A3DD21A1DC1EA0DC1EA0DC1EA0DCD2D2D2989B
        9CFF00FFFF00FF000000FF00FFABACACE1E1E033AAE0FFFFFFFFFFFF38ACE1FF
        FFFFFFFFFF38ACE1FFFFFFFFFFFF2FA8DFFFFFFFFFFFFF23A2DDFFFFFFFFFFFF
        1EA0DCD3D3D3989B9CFF00FFFF00FF000000FF00FFABACACE1E1E136ABE08584
        86ECECEC3DAFE2858486FFFFFF3BAEE1858486ECECEC33AAE0858486ECECEC26
        A4DD858486ECECEC1EA0DCD4D4D4989B9CFF00FFFF00FF000000FF00FFABACAC
        E2E2E13BAEE13DAFE241B0E242B1E342B1E342B1E341B0E23DAFE23BAEE1CE6B
        00CE6B00CE6B00CE6B0025A3DD1FA0DC1EA0DCD5D5D5989B9CFF00FFFF00FF00
        0000FF00FFABACACE3E3E23DAFE2FFFFFFFFFFFF48B4E4FFFFFFFFFFFF46B3E3
        FFFFFFFFFFFFCE6B00FDEDE3FDEDE3CE6B00FFFFFFFFFFFF1EA0DCD5D5D5989B
        9CFF00FFFF00FF000000FF00FFABACACE4E4E341B0E2858486ECECEC56BAE685
        8486FFFFFF4CB6E4858486ECECECCE6B00A74D21FAD8C2CE6B00858486ECECEC
        1EA0DCD6D6D6989B9CFF00FFFF00FF000000FF00FFABACACE5E5E442B1E348B4
        E456BAE65FBFE864C1E95FBFE856BAE648B4E442B1E3CE6B00CE6B00CE6B00CE
        6B0028A5DE23A2DD1EA0DCD7D7D7989B9CFF00FFFF00FF000000FF00FFABACAC
        E6E6E542B1E3FFFFFFFFFFFF64C1E9FFFFFFFFFFFF56BAE6FFFFFFFFFFFF3DAF
        E2FFFFFFFFFFFF2DA7DFFFFFFFFFFFFF1EA0DCD8D8D8989B9CFF00FFFF00FF00
        0000FF00FFABACACE7E7E642B1E3858486ECECEC5FBFE8858486FFFFFF56BAE6
        858486ECECEC3DAFE2858486ECECEC2DA7DF858486ECECEC1EA0DCD9D9D9989B
        9CFF00FFFF00FF000000FF00FFABACACE7E7E641B0E246B3E34CB6E456BAE656
        BAE656BAE64CB6E446B3E341B0E23BAEE138ACE133AAE02DA7DF28A5DE23A2DD
        1EA0DCDADAD9989B9CFF00FFFF00FF000000FF00FFABACACEAEAE9E7E7E6E7E7
        E6E6E6E5E5E5E4E4E4E3E3E3E2E3E3E2E2E2E1E1E1E0E0E0DFDFDFDFDFDFDEDE
        DEDDDDDDDCDCDCDCDBDBDBDBDBDA989B9CFF00FFFF00FF000000FF00FFABACAC
        1FA1211D9D1F1C9A1D1C991D1B971C1A951B19931A189119188F18178D17168B
        17158916158715148514148514148514148514148514989B9CFF00FFFF00FF00
        0000FF00FFABACAC21A5231FA1211D9D1F1C9A1D1C991D1B971C1A951B19931A
        189119188F18178D17168B17158916158715148514148514148514148514989B
        9CFF00FFFF00FF000000FF00FFABACAC23A92521A5230000001485141C9A1D1C
        991D1B971C1A951B19931A178D17178D17178D17168B17158916158715000000
        137913148514989B9CFF00FFFF00FF000000FF00FFABACAC24AD27636363A5A5
        A50000001485141C9A1D1C991D1B971C1B971C1B971C1B971C178D17178D1716
        8B17636363A5A5A5000000137913989B9CFF00FFFF00FF000000FF00FFABACAC
        9B9B9B636363D6D6D66363638C8C8C9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B
        9B9B9B9B9B9B9B9B9B9B636363D6D6D66363638C8C8C9B9B9BFF00FFFF00FF00
        0000FF00FFFF00FFFF00FF9B9B9BFFFFFF636363FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9BFFFFFF636363FF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF9B9B9BFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9B
        FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000}
      Caption = #1055#1088#1072#1094#1102#1074#1072#1090#1080' '#1079' '#1087#1077#1088#1110#1086#1076#1072#1084#1080
      OnClick = StagesButtonClick
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object pPreviewButton: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF8C6059
        A47874A47874A47874A47874A47874A47874A47874A47874A47874A478749368
        63FF00FF5F77947C8288FF00FF90635AF6E4C4FAE4BCFAE1B3F7DDABF7DAA3F6
        D79FF6D69CF6D59AF6D59AFADB9E936863637D9E2190EA65A9D4FF00FF93675C
        FFF1D5DF993EDF993EDF993EDF993EDF993EDF993EDF993EDF993EF4D49B6680
        9E228DE854BAFF54ABF1FF00FF996C5EFBF1E3F8EAD3F7E7CBF6E3C4E2CEADAC
        9C7FAB9879AA9676AD99797881961F86DD52B8FF53ABF3FF00FFFF00FF9E7161
        FFFFF4DF993EDF993EC08546BB9187C09C91BD9C8FAB7E7190705A5997CA4FB5
        FB49A9F8FF00FFFF00FFFF00FFA47863FFFFFEFCF8EFDCC8C0BC9994EDE1D0FF
        FEDFFFFFE4F2E9CEC0A291B79A9765738CFF00FFFF00FFFF00FFFF00FFAA7E66
        FFFFFFCB6600B07D65F0E8E4FFFFE6FFFFD5FFFFDCFFF9CFFFEBB8BB92847652
        4EFF00FFFF00FFFF00FFFF00FFB18369FFFFFFFFFFFFB99D92FDFDE7FFFFD9FF
        FFD9FFFFDFF9ECC3F9D29BDDBFA1865A56FF00FFFF00FFFF00FFFF00FFB7896C
        FFFFFFCB6600BC9E91FFFFE3FFFFD9FFFFDEFFFDDAF3CF9EF6C68BE9D1AE885E
        5AFF00FFFF00FFFF00FFFF00FFBD8F6EFFFFFFFFFFFFB6907FFBF9DFFEFCD7FB
        F5D0F6DBABF3CB9BFFEFBDD2B19A845B57FF00FFFF00FFFF00FFFF00FFC29470
        FFFFFFFFFFFFC3A6A3DBC6ABFFF1BDF4CA94F6CE96FFFEEEF1E7E1AA86808A60
        5CFF00FFFF00FFFF00FFFF00FFC69872FFFFFFCB6600C76607B1714DCFAE96EE
        D1AAEFDAB2CDB3A9A26E5AD5C7C6936863FF00FFFF00FFFF00FFFF00FFC99B73
        FFFFFFCB6600CB6600C86606B66933AC7151A97055AD6638BF6516FFFEFE9368
        63FF00FFFF00FFFF00FFFF00FFC99B73FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF936863FF00FFFF00FFFF00FFFF00FFC99B73
        DCA887DCA887DCA887DCA887DCA887DCA887DCA887DCA887DCA887DCA887DCA8
        87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = #1055#1077#1088#1077#1075#1083#1103#1085#1091#1090#1080
      ImageIndex = 5
    end
    object pPrintButton: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FF868484868484FF00FFFF00FF868484868484FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868484BCBABAB5B3B386848486
        8484868484EBEAEA868484868484868484FF00FFFF00FFFF00FFFF00FFFF00FF
        868484E3E2E2B5B3B3B5B3B3B5B3B35150504F4F4F868787CDCDCDE8E9E9C7C6
        C6868484868484868484FF00FF868484DEDDDDD6D6D6A4A3A3A4A3A3A4A3A356
        5555161516121212181818121212939393CACACA868484FF00FF868484D6D6D6
        D6D6D6A4A3A3E0DEDED9D7D7CDCBCBC2C0C0B6B4B49F9D9D7976771212121414
        141313138684848F8C8C868484D6D6D6A4A3A3F3F2F2FFFEFEFCFBFBEAE7E8E6
        E6E6E6E5E5DAD9D9CCCBCBBFBDBDA2A0A07371719391918E8C8C868484A4A3A3
        FFFFFFFEFDFDFBFBFBDFDEDFADA7A9B4ADAEC3BDBED1CECFE0E0E0E1E1E1D4D3
        D3C7C6C6A7A5A5868383FF00FF868484868484F1F0F0C2B9BA93898BA19B9FAB
        A8AAABA6A7B1ACADAFA9AAB2ADAECAC9C9DCDCDCD0D0D0868484FF00FFFF00FF
        FF00FF868484CAA097BA9E87A2897E95817B897C7F928C92A5A2A4BBB6B7D7D6
        D6CFCFCF868484FF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFEAC4FFDDB3EE
        C399D5AE8CC9A786CC9A99989596868484868484FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFCC9A99FFE7C8FFDDBAFFDBB1FFD9A6FFD39FCC9A99FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9D9BFFEDDAFFE7CEFFE2C3FF
        DDB8FFDBAECC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFCC9A99FEF0E1FFECD8FFE6CCFFE1C2FEDDB7CC9A99FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFFFF5FFFFF5FFF0E1FFEBD6FF
        E8CCF6D4BACC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        CC9A99CC9A99CC9A99FCF3E9FCEADAFCE5D0CC9A99FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99CC9A99CC
        9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080
      ImageIndex = 4
    end
    object N17: TMenuItem
      Caption = '-'
    end
    object ExpandButton: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B390BFF00FFFF00FFFF
        00FF9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF9B390B9B390B9B390BEBA45AEBA45A9C3B0DFFCF92EBA45ADD882E9C3B
        0DFF00FFFF00FFFF00FFFF00FFFF00FF9B390B9B390B9B390B9B390B9B390BFF
        00FF9B390B9C3B0D9C3A0D9B3A0C9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF9B390BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B390BFF00FFFF00FFFF
        00FF9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFEBA45AEBA45AEBA45AEBA45A9C3B0DFFCF92EBA45ADD882E9C3B
        0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B390BFF00FFFF00FFFF
        00FF9B390B9C3B0D9C3A0D9B3A0C9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF9B390BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF9B390B9B390B9B390B9B390B9B390BFF
        00FF9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF9B390B9B390B9B390BEBA45AEBA45A9C3B0DFFCF92EBA45ADD882E9C3B
        0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B390BFF00FFFF00FFFF
        00FF9B390B9C3B0D9C3A0D9B3A0C9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF9C3B0DFFCF92EBA45ADD882E9C3B0DFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        9B390B9C3B0D9C3A0D9B3A0C9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = #1056#1086#1079#1075#1086#1088#1085#1091#1090#1080' '#1091#1089#1110' '#1074#1091#1079#1083#1080
      OnClick = ExpandButtonClick
    end
    object CollapseButton: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C3B0DFF00FFFF00FFFF
        00FF9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF9C3B0DEBA45AEBA45AEBA45A9C3B0DFFCF92EBA45ADD882E9C3B
        0DFF00FFFF00FFFF00FFFF00FFFF00FF9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF
        00FF9B390B9C3B0D9C3A0D9B3A0C9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C3B0DFF00FFFF00FFFF
        00FF9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFEBA45AEBA45AEBA45AEBA45A9C3B0DFFCF92EBA45ADD882E9C3B
        0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C3B0DFF00FFFF00FFFF
        00FF9B390B9C3B0D9C3A0D9B3A0C9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF
        00FF9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF9C3B0DEBA45AEBA45AEBA45A9C3B0DFFCF92EBA45ADD882E9C3B
        0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C3B0DFF00FFFF00FFFF
        00FF9B390B9C3B0D9C3A0D9B3A0C9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FF
        9C3B0D9C3B0D9C3B0D9C3B0D9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF9C3B0DFFCF92EBA45ADD882E9C3B0DFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        9B390B9C3B0D9C3A0D9B3A0C9C3B0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = #1047#1075#1086#1088#1085#1091#1090#1080' '#1091#1089#1110' '#1074#1091#1079#1083#1080
      OnClick = CollapseButtonClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object pApplyButton: TMenuItem
      Caption = #1055#1088#1080#1085#1103#1090#1100
      ImageIndex = 3
      OnClick = ApplyButtonClick
    end
    object pCancelButton: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
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
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      OnClick = CancelButtonClick
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 462
    Top = 142
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
  object ExcelExport: TfrOLEExcelExport
    Default = True
    CellsAlign = False
    CellsFillColor = False
    CellsFontColor = False
    CellsFontName = False
    CellsFontSize = False
    CellsFontStyle = False
    Left = 648
    Top = 120
  end
  object EditRepository: TcxEditRepository
    Left = 504
    Top = 144
    object EditRepositoryButtonItem1: TcxEditRepositoryButtonItem
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
          LeftAlignment = True
        end>
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnButtonClick = EditRepositoryButtonItem1PropertiesButtonClick
    end
  end
end
