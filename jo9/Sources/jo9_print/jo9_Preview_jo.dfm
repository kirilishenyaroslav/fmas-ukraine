object jo9_Preview_joForm: Tjo9_Preview_joForm
  Left = 427
  Top = 193
  Width = 800
  Height = 431
  Caption = 'jo9_Preview_joForm'
  Color = clBtnFace
  Constraints.MinHeight = 170
  Constraints.MinWidth = 480
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TcxGrid
    Left = 0
    Top = 0
    Width = 792
    Height = 341
    Align = alClient
    TabOrder = 0
    object TableView: TcxGridDBBandedTableView
      OnKeyPress = TableViewKeyPress
      DataController.DataSource = DataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = TableViewCustomDrawCell
      Filtering.CustomizeDialog = False
      Filtering.Visible = fvNever
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnSorting = False
      OptionsCustomize.ColumnVertSizing = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      OptionsView.CellAutoHeight = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.FixedBandSeparatorWidth = 0
      Styles.StyleSheet = GridBandedTableViewStyleSheet
      Bands = <
        item
          FixedKind = fkLeft
          Width = 289
        end
        item
        end
        item
          Caption = #1057#1072#1083#1100#1076#1086' '#1074#1093#1110#1076#1085#1077
        end
        item
          Caption = #1044#1077#1073#1077#1090' '#1088#1072#1093#1091#1085#1082#1110#1074
          Width = 598
        end
        item
          Caption = #1050#1088#1077#1076#1080#1090' '#1088#1072#1093#1091#1085#1082#1110#1074
          Width = 598
        end
        item
          Caption = #1057#1072#1083#1100#1076#1086' '#1074#1080#1093#1110#1076#1085#1077
        end>
      object TableViewState: TcxGridDBBandedColumn
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'State'
      end
      object TableViewRegNum: TcxGridDBBandedColumn
        Caption = #1056#1077#1108#1089#1090#1088'. '#1085#1086#1084#1077#1088' ('#1085#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1091')'
        PropertiesClassName = 'TcxMemoProperties'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 255
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'RegNum'
      end
      object TableViewDate_Ost: TcxGridDBBandedColumn
        Caption = #1044#1072#1090#1072' '#1074#1080#1085#1080#1082'. '#1079#1072#1073#1086#1088#1075'.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'Date_Ost'
      end
      object TableViewDate_Move: TcxGridDBBandedColumn
        Caption = #1054#1089#1090#1072#1085'. '#1088#1091#1093' '#1082#1086#1096#1090#1110#1074
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'Date_Move'
      end
      object TableViewIn_Db: TcxGridDBBandedColumn
        Caption = #1044#1077#1073#1077#1090
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 67
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'In_Db'
      end
      object TableViewIn_Kr: TcxGridDBBandedColumn
        Caption = #1050#1088#1077#1076#1080#1090
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'In_Kr'
      end
      object TableViewIn_Sch: TcxGridDBBandedColumn
        Caption = #1056#1072#1093#1091#1085#1086#1082
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 54
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'In_Sch'
      end
      object TableViewIn_S: TcxGridDBBandedColumn
        Caption = #1050#1086#1096#1090#1086#1088#1080#1089
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 2
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'In_S'
      end
      object TableViewIn_R: TcxGridDBBandedColumn
        Caption = #1056#1086#1079#1076#1110#1083
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 45
        Position.BandIndex = 2
        Position.ColIndex = 4
        Position.RowIndex = 0
        DataBinding.FieldName = 'In_R'
      end
      object TableViewIn_St: TcxGridDBBandedColumn
        Caption = #1057#1090#1072#1090#1090#1103
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 46
        Position.BandIndex = 2
        Position.ColIndex = 5
        Position.RowIndex = 0
        DataBinding.FieldName = 'In_St'
      end
      object TableViewIn_Kekv: TcxGridDBBandedColumn
        Caption = #1050#1045#1050#1042
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 38
        Position.BandIndex = 2
        Position.ColIndex = 6
        Position.RowIndex = 0
        DataBinding.FieldName = 'In_Kekv'
      end
      object TableViewDb_Doc: TcxGridDBBandedColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 80
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'Db_Doc'
      end
      object TableViewDb_Date: TcxGridDBBandedColumn
        Caption = #1044#1072#1090#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 80
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'Db_Date'
      end
      object TableViewDb_Date_Reg: TcxGridDBBandedColumn
        Caption = #1041#1091#1093'. '#1087#1077#1088#1110#1086#1076
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 80
        Position.BandIndex = 3
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'Db_Date_Reg'
      end
      object TableViewDb_Sch_Db: TcxGridDBBandedColumn
        Caption = #1056#1072#1093'. '#1044#1073
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 50
        Position.BandIndex = 3
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'Db_Sch_Db'
      end
      object TableViewDb_Sch_Kr: TcxGridDBBandedColumn
        Caption = #1056#1072#1093'. '#1050#1088
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 50
        Position.BandIndex = 3
        Position.ColIndex = 4
        Position.RowIndex = 0
        DataBinding.FieldName = 'Db_Sch_Kr'
      end
      object TableViewDb_Sum: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1072
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00;-,0.00'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 3
        Position.ColIndex = 5
        Position.RowIndex = 0
        DataBinding.FieldName = 'Db_Sum'
      end
      object TableViewDb_S: TcxGridDBBandedColumn
        Caption = #1050#1086#1096#1090#1086#1088#1080#1089
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 3
        Position.ColIndex = 6
        Position.RowIndex = 0
        DataBinding.FieldName = 'Db_S'
      end
      object TableViewDb_R: TcxGridDBBandedColumn
        Caption = #1056#1086#1079#1076#1110#1083
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 64
        Position.BandIndex = 3
        Position.ColIndex = 7
        Position.RowIndex = 0
        DataBinding.FieldName = 'Db_R'
      end
      object TableViewDb_St: TcxGridDBBandedColumn
        Caption = #1057#1090#1072#1090#1090#1103
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 64
        Position.BandIndex = 3
        Position.ColIndex = 8
        Position.RowIndex = 0
        DataBinding.FieldName = 'Db_St'
      end
      object TableViewDb_Kekv: TcxGridDBBandedColumn
        Caption = #1050#1045#1050#1042
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 64
        Position.BandIndex = 3
        Position.ColIndex = 9
        Position.RowIndex = 0
        DataBinding.FieldName = 'Db_Kekv'
      end
      object TableViewKr_Doc: TcxGridDBBandedColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 80
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'Kr_Doc'
      end
      object TableViewKr_Date: TcxGridDBBandedColumn
        Caption = #1044#1072#1090#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 80
        Position.BandIndex = 4
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'Kr_Date'
      end
      object TableViewKr_Date_Reg: TcxGridDBBandedColumn
        Caption = #1041#1091#1093'. '#1087#1077#1088#1110#1086#1076
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 80
        Position.BandIndex = 4
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'Kr_Date_Reg'
      end
      object TableViewKr_Sch_Db: TcxGridDBBandedColumn
        Caption = #1056#1072#1093'. '#1044#1073
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 50
        Position.BandIndex = 4
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'Kr_Sch_Db'
      end
      object TableViewKr_Sch_Kr: TcxGridDBBandedColumn
        Caption = #1056#1072#1093'. '#1050#1088
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 50
        Position.BandIndex = 4
        Position.ColIndex = 4
        Position.RowIndex = 0
        DataBinding.FieldName = 'Kr_Sch_Kr'
      end
      object TableViewKr_Sum: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 4
        Position.ColIndex = 5
        Position.RowIndex = 0
        DataBinding.FieldName = 'Kr_Sum'
      end
      object TableViewKr_S: TcxGridDBBandedColumn
        Caption = #1050#1086#1096#1090#1086#1088#1080#1089
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 4
        Position.ColIndex = 6
        Position.RowIndex = 0
        DataBinding.FieldName = 'Kr_S'
      end
      object TableViewKr_R: TcxGridDBBandedColumn
        Caption = #1056#1086#1079#1076#1110#1083
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 64
        Position.BandIndex = 4
        Position.ColIndex = 7
        Position.RowIndex = 0
        DataBinding.FieldName = 'Kr_R'
      end
      object TableViewKr_St: TcxGridDBBandedColumn
        Caption = #1057#1090#1072#1090#1090#1103
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 64
        Position.BandIndex = 4
        Position.ColIndex = 8
        Position.RowIndex = 0
        DataBinding.FieldName = 'Kr_St'
      end
      object TableViewKr_Kekv: TcxGridDBBandedColumn
        Caption = #1050#1045#1050#1042
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 64
        Position.BandIndex = 4
        Position.ColIndex = 9
        Position.RowIndex = 0
        DataBinding.FieldName = 'Kr_Kekv'
      end
      object TableViewOut_Db: TcxGridDBBandedColumn
        Caption = #1044#1077#1073#1077#1090
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'Out_Db'
      end
      object TableViewOut_Kr: TcxGridDBBandedColumn
        Caption = #1050#1088#1077#1076#1080#1090
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 5
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'Out_Kr'
      end
      object TableViewOut_Sch: TcxGridDBBandedColumn
        Caption = #1056#1072#1093#1091#1085#1086#1082
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 5
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'Out_Sch'
      end
      object TableViewOut_S: TcxGridDBBandedColumn
        Caption = #1050#1086#1096#1090#1086#1088#1080#1089
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 5
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'Out_S'
      end
      object TableViewOut_R: TcxGridDBBandedColumn
        Caption = #1056#1086#1079#1076#1110#1083
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 45
        Position.BandIndex = 5
        Position.ColIndex = 4
        Position.RowIndex = 0
        DataBinding.FieldName = 'Out_R'
      end
      object TableViewOut_St: TcxGridDBBandedColumn
        Caption = #1057#1090#1072#1090#1090#1103
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 46
        Position.BandIndex = 5
        Position.ColIndex = 5
        Position.RowIndex = 0
        DataBinding.FieldName = 'Out_St'
      end
      object TableViewOut_Kekv: TcxGridDBBandedColumn
        Caption = #1050#1045#1050#1042
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 38
        Position.BandIndex = 5
        Position.ColIndex = 6
        Position.RowIndex = 0
        DataBinding.FieldName = 'Out_Kekv'
      end
      object TableViewCustNum: TcxGridDBBandedColumn
        Caption = #8470' '#1087'/'#1087
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 34
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'CustNum'
      end
      object TableViewNameCustFilter: TcxGridDBBandedColumn
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'CustNameFilter'
      end
    end
    object TableViewOst: TcxGridDBBandedTableView
      OnKeyPress = TableViewKeyPress
      DataController.DataSource = DataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      Filtering.CustomizeDialog = False
      Filtering.Visible = fvNever
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnSorting = False
      OptionsCustomize.BandMoving = False
      OptionsCustomize.ColumnVertSizing = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = GridBandedTableViewStyleSheet
      Bands = <
        item
        end
        item
        end>
      object TableViewOstNum: TcxGridDBBandedColumn
        Caption = #8470' '#1087'/'#1087
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 40
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'Num'
      end
      object TableViewOstNameCustomer: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 325
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'NameCustomer'
      end
      object TableViewOstSch: TcxGridDBBandedColumn
        Caption = #1056#1072#1093#1091#1085#1086#1082
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'Sch'
      end
      object TableViewOstS: TcxGridDBBandedColumn
        Caption = #1050#1086#1096#1090'.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'S'
      end
      object TableViewOstR: TcxGridDBBandedColumn
        Caption = #1056#1086#1079#1076#1110#1083
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
        DataBinding.FieldName = 'R'
      end
      object TableViewOstSt: TcxGridDBBandedColumn
        Caption = #1057#1090#1072#1090#1090#1103
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
        DataBinding.FieldName = 'St'
      end
      object TableViewOstKEKV: TcxGridDBBandedColumn
        Caption = #1050#1045#1050#1042
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.UseLeftAlignmentOnEditing = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 75
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
        DataBinding.FieldName = 'KEKV'
      end
      object TableViewOstSum: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
        DataBinding.FieldName = 'Sum'
      end
      object TableViewOstNameCustFilter: TcxGridDBBandedColumn
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
        DataBinding.FieldName = 'CustFilter'
      end
    end
    object TableViewCustSch: TcxGridDBBandedTableView
      OnKeyPress = TableViewKeyPress
      DataController.DataSource = DataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = TableViewCustSchCustomDrawCell
      Filtering.CustomizeDialog = False
      Filtering.Visible = fvNever
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnSorting = False
      OptionsCustomize.ColumnVertSizing = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.FixedBandSeparatorWidth = 1
      Styles.StyleSheet = GridBandedTableViewStyleSheet
      Bands = <
        item
          FixedKind = fkLeft
        end
        item
        end
        item
          Caption = #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1087#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1072
          Styles.Background = cxStyle30
          Styles.Content = cxStyle30
          Styles.Header = cxStyle30
          Width = 240
        end
        item
          Caption = #1047' '#1076#1077#1073#1077#1090#1072' '#1088#1072#1093#1091#1085#1082#1110#1074
          Styles.Background = cxStyle29
          Styles.Content = cxStyle29
          Styles.Header = cxStyle29
          Width = 286
        end
        item
          Caption = #1059' '#1082#1088#1077#1076#1080#1090' '#1088#1072#1093#1091#1085#1082#1110#1074
          Width = 120
        end
        item
          Caption = #1047' '#1082#1088#1077#1076#1080#1090#1072' '#1088#1072#1093#1091#1085#1082#1110#1074
          Styles.Background = cxStyle29
          Styles.Content = cxStyle29
          Styles.Header = cxStyle29
          Width = 286
        end
        item
          Caption = #1059' '#1076#1077#1073#1077#1090' '#1088#1072#1093#1091#1085#1082#1110#1074
          Width = 138
        end
        item
          Caption = #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1082#1110#1085#1077#1094#1100' '#1087#1077#1088#1110#1086#1076#1091
          Styles.Background = cxStyle30
          Styles.Content = cxStyle30
          Styles.Header = cxStyle30
          Width = 240
        end>
      object TableViewCustSch_State: TcxGridDBBandedColumn
        Visible = False
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'State'
      end
      object TableViewCustSch_Num: TcxGridDBBandedColumn
        Caption = #8470' '#1087'/'#1087
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 36
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'CustNum'
      end
      object TableViewCustSch_RegNum: TcxGridDBBandedColumn
        Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072' ('#1088#1077#1108#1089#1090#1088'. '#1085#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072')'
        PropertiesClassName = 'TcxMemoProperties'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 214
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'RegNum'
      end
      object TableViewCustSch_Note: TcxGridDBBandedColumn
        Caption = #1055#1110#1076#1089#1090#1072#1074#1072' ('#1085#1086#1084#1077#1088' '#1090#1072' '#1076#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1091')'
        PropertiesClassName = 'TcxMemoProperties'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 190
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'Dog_Note'
      end
      object TableViewCustSch_DateOst: TcxGridDBBandedColumn
        Caption = #1044#1072#1090#1072' '#1074#1080#1085#1080#1082'. '#1079#1072#1073#1086#1088#1075'.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 66
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'Date_Ost'
      end
      object TableViewCustSch_DateMove: TcxGridDBBandedColumn
        Caption = #1044#1072#1090#1072' '#1086#1089#1090'. '#1088#1091#1093#1091' '#1082#1086#1096#1090#1110#1074
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 63
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'Date_Move'
      end
      object TableViewCustSch_InSch: TcxGridDBBandedColumn
        Caption = #1056#1072#1093'.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Styles.Header = cxStyle30
        Width = 45
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'In_Sch'
      end
      object TableViewCustSch_InDb: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1072' '#1044#1073
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Styles.Header = cxStyle30
        Width = 80
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'In_Db'
      end
      object TableViewCustSch_InKr: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1072' '#1050#1088
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Styles.Header = cxStyle30
        Width = 80
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'In_Kr'
      end
      object TableViewCustSch_DbDoc: TcxGridDBBandedColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' ('#1085#1086#1084#1077#1088' '#1090#1072' '#1076#1072#1090#1072')'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.Alignment = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Styles.Header = cxStyle29
        Width = 88
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'Db_Doc'
      end
      object TableViewCustSch_DbPeriod: TcxGridDBBandedColumn
        Caption = #1041#1091#1093'. '#1087#1077#1088#1110#1086#1076
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Styles.Header = cxStyle29
        Width = 54
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'Db_Date_Reg'
      end
      object TableViewCustSch_DbSch: TcxGridDBBandedColumn
        Caption = #1056#1072#1093#1091#1085#1086#1082' '#1044#1073
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Styles.Header = cxStyle29
        Position.BandIndex = 3
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'Db_Sch'
      end
      object TableViewCustSch_DbSum: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1072' '#1087#1086' '#1044#1073
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Styles.Header = cxStyle29
        Width = 80
        Position.BandIndex = 3
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'Db_Sum'
      end
      object TableViewCustSch_KrDoc: TcxGridDBBandedColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' ('#1085#1086#1084#1077#1088' '#1090#1072' '#1076#1072#1090#1072')'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.Alignment = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Styles.Header = cxStyle29
        Width = 91
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'Kr_Doc'
      end
      object TableViewCustSch_KrPeriod: TcxGridDBBandedColumn
        Caption = #1041#1091#1093'. '#1087#1077#1088#1110#1086#1076
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Styles.Header = cxStyle29
        Width = 59
        Position.BandIndex = 5
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'Kr_Date_Reg'
      end
      object TableViewCustSch_KrSch: TcxGridDBBandedColumn
        Caption = #1056#1072#1093#1091#1085#1086#1082' '#1050#1088
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Styles.Header = cxStyle29
        Position.BandIndex = 5
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'Kr_Sch'
      end
      object TableViewCustSch_KrSum: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1072' '#1087#1086' '#1050#1088
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Styles.Header = cxStyle29
        Width = 80
        Position.BandIndex = 5
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'Kr_Sum'
      end
      object TableViewCustSch_OutSch: TcxGridDBBandedColumn
        Caption = #1056#1072#1093'.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Styles.Header = cxStyle30
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'Out_Sch'
      end
      object TableViewCustSch_OutDb: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1072' '#1044#1073
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Styles.Header = cxStyle30
        Width = 80
        Position.BandIndex = 7
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'Out_Db'
      end
      object TableViewCustSch_OutKr: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1072' '#1050#1088
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Styles.Header = cxStyle30
        Width = 80
        Position.BandIndex = 7
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'Out_Kr'
      end
      object TableViewCustSch_CustFilter: TcxGridDBBandedColumn
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
        DataBinding.FieldName = 'CustNameFilter'
      end
    end
    object GridLevel: TcxGridLevel
      GridView = TableView
    end
    object GridLevelOst: TcxGridLevel
      GridView = TableViewOst
      Visible = False
    end
    object GridLevelCustSch: TcxGridLevel
      GridView = TableViewCustSch
      Visible = False
    end
  end
  object Panel: TPanel
    Left = 0
    Top = 341
    Width = 792
    Height = 61
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 121
      Height = 13
      Caption = #1060#1110#1083#1100#1090#1088' '#1085#1072' '#1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072':'
    end
    object ApplyButton: TcxButton
      Left = 354
      Top = 18
      Width = 106
      Height = 25
      Caption = #1055#1077#1088#1077#1075#1083#1103#1076
      TabOrder = 0
      OnClick = ApplyButtonClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF73453F
        8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D597A4D
        48FF00FF445C7B62686EFF00FF774840F3DCB4F8DCAAF8D89FF4D396F4CF8CF3
        CB88F3CA84F3C982F3C982F8D0877A4D484863871177E34A93C7FF00FF7A4C41
        FFEDC9D58127D58127D58127D58127D58127D58127D58127D58127F0C7834B66
        871174E13AA7FF3A96EDFF00FF815143FAEDDAF6E3C6F4E0BCF3DAB4D9C09897
        846596805E957E5B98815E5D677E0F6CD338A5FF3996EFFF00FFFF00FF875646
        FFFFF0D58127D58127AF6B2DA9786DAF8478AB84769664567755403F7FBB35A1
        FA3093F6FF00FFFF00FFFF00FF8E5D48FFFFFEFBF6EAD1B8AFAA817BE7D8C2FF
        FED5FFFFDCEEE2C0AF8B78A4827F4A5873FF00FFFF00FFFF00FFFF00FF95644B
        FFFFFFBC4B009C634AEBE1DCFFFFDEFFFFC9FFFFD1FFF7C1FFE5A5A9796A5B38
        35FF00FFFF00FFFF00FFFF00FF9D694EFFFFFFBC4B00A68679FCFCE0FFFFCEFF
        FFCEFFFFD5F7E6B2F7C583D3AD8A6C403CFF00FFFF00FFFF00FFFF00FFA46F51
        FFFFFFBC4B00AA8778FFFFDAFFFFCEFFFFD4FFFCCFEFC187F3B672E2C4996E43
        40FF00FFFF00FFFF00FFFF00FFAB7653FFFFFFBC4B00A37765FAF7D5FEFBCBFA
        F2C2F3D096EFBC83FFEAABC59D826A413DFF00FFFF00FFFF00FFFF00FFB17B55
        FFFFFFFFFFFFB2908CD0B696FFEDABF0BB7BF3C07EFFFEE9EDE0D8956C667045
        41FF00FFFF00FFFF00FFFF00FFB68057FFFFFFBC4B00B74B029D5634C1997EE9
        C495EACF9EBF9F938B5340C9B7B67A4D48FF00FFFF00FFFF00FFFF00FFBA8358
        FFFFFFBC4B00BC4B00B84B02A34E1E97563793553B984B22AD4A0AFFFEFE7A4D
        48FF00FFFF00FFFF00FFFF00FFBA8358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF7A4D48FF00FFFF00FFFF00FFFF00FFBA8358
        D1926DD1926DD1926DD1926DD1926DD1926DD1926DD1926DD1926DD1926DD192
        6DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object CancelButton: TcxButton
      Left = 577
      Top = 18
      Width = 106
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 1
      OnClick = CancelButtonClick
      Glyph.Data = {
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
      UseSystemPaint = False
    end
    object SearchEdit: TcxButtonEdit
      Left = 8
      Top = 21
      Width = 193
      Height = 22
      Properties.Buttons = <
        item
          Default = True
          Glyph.Data = {
            BA010000424DBA01000000000000BA0000002800000010000000100000000100
            08000000000000010000120B0000120B0000210000002100000000000000FFFF
            FF00FF00FF00C0C0C000BEBEBE00BBBBBB00B9B9B900B6B6B600B5B5B500B3B3
            B300B1B1B100B0B0B000AFAFAF00AEAEAE00ACACAC00ABABAB00AAAAAA00A9A9
            A900A8A8A800A7A7A700A6A6A600A4A4A400A3A3A300A2A2A200A0A0A0009F9F
            9F009E9E9E009C9C9C009A9A9A009999990098989800979797006B6B6B000202
            0202020202020202020202020202020202020202020202020202020202020202
            022020020202020202202002020202022012182002020202201C1B2002020202
            20131019200202201D1A1F20020202020220130F1720201C1A1E200202020202
            020220130E16191A1D20020202020202020202201313161B2002020202020202
            020202200E0E111520020202020202020202200A090F100C1420020202020202
            022007060D2020110B132002020202022005040C20020220130A102002020202
            200308200202020220100D200202020202202002020202020220200202020202
            020202020202020202020202020202020202020202020202020202020202}
          Kind = bkGlyph
        end>
      Properties.OnButtonClick = SearchEditPropertiesButtonClick
      Properties.OnChange = SerachEditPropertiesChange
      Style.Color = 16247513
      TabOrder = 2
      OnKeyPress = SearchEditKeyPress
    end
    object RadioGroup: TcxRadioGroup
      Left = 209
      Top = 2
      Width = 136
      Height = 54
      ItemIndex = 0
      Properties.Items = <
        item
          Caption = #1087#1086' '#1074#1093#1086#1076#1078#1077#1085#1085#1102
        end
        item
          Caption = #1087#1086#1095#1080#1085#1072#1108#1090#1100#1089#1103' '#1079' ...'
        end>
      Properties.OnChange = RadioGroupPropertiesChange
      TabOrder = 3
      Caption = #1060#1110#1083#1100#1090#1088#1091#1074#1072#1090#1080':'
    end
    object cxButton1: TcxButton
      Left = 465
      Top = 18
      Width = 106
      Height = 25
      Caption = #1045#1082#1089#1087#1086#1088#1090'...'
      TabOrder = 4
      DropDownMenu = PopupMenu
      Glyph.Data = {
        76020000424D7602000000000000760100002800000010000000100000000100
        08000000000000010000120B0000120B0000500000005000000000000000FFFF
        FF00FF00FF00A5696A0095655F009D6B620098686000A36F6400FFFBFA00AD78
        6900A7746600BB7F6A00B47E6B00BF877000BA836D00BB704F00C48C7200D397
        7800CA917400C2805C00D0906B00D59A7900CE957600F4EBE600FEF4ED00FFFC
        FA00FCF4EE00FAEDE100FCF4ED00FEFCFA00EF993800E5A55F00F2D5B500F6E1
        CA00F8E7D400F7E6D400F7E7D500F8EDE100E2A35B00F0D0A900F6E1C900F4E1
        CA00FAEDDE00FAEEE000EECB9E00F4D5AD00F0D1AA00F2D7B400F2D7B500F4DD
        C000F3DCBF00F8E9D500FAEFE000EFCA9600F0CF9F00FCE7C900E3D3BB00FCEB
        D300FEEED400FBE5C000B7AD9C00FFF4E100FCF6EB00FFFBEE00FFFFFB00FFFF
        FC00004B000001570300026305000A72120013771A00187F1E000C8C18000C86
        1600EFF6F0001E9A360023BA410026AC440039D76700F8F8FE00020202020243
        4343434343434343434304030303034301010101010101010143063B2D363543
        01014242420101010143053720272C430101010144424A010143073A31302E43
        010101014742010101430A3D21322F4301014242464842420143093F24293243
        010142454D4C494201430C4025232843010101424B4E420101430E011A1B3343
        010101014242010101430D0108182B4301010101010101010143100101191C43
        4343434343434343434312010101191C2A2239383C030202020216010101011D
        3E340303030302020202110101010101411703261E0F02020202150101010101
        014F031F1302020202021414141414141414030B020202020202}
      Kind = cxbkDropDownButton
      UseSystemPaint = False
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 15
    Top = 175
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16777088
      TextColor = clBlue
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
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
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16777088
      TextColor = clBlue
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor]
      Color = 15518905
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor]
      Color = 11527359
    end
    object GridTableViewStyleSheet: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
    object GridBandedTableViewStyleSheet: TcxGridBandedTableViewStyleSheet
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
      Styles.BandBackground = cxStyle15
      Styles.BandHeader = cxStyle23
      BuiltIn = True
    end
  end
  object DataSource: TDataSource
    Left = 48
    Top = 175
  end
  object PopupMenu: TPopupMenu
    Left = 712
    Top = 352
    object rcgjhn1: TMenuItem
      Bitmap.Data = {
        8E020000424D8E020000000000008E0100002800000010000000100000000100
        08000000000000010000120B0000120B0000560000005600000000000000FFFF
        FF00FF00FF00A5696A0095655F009D6B620098686000A36F6400FFFBFA00AD78
        6900A7746600BB7F6A00B47E6B00BF877000BA836D00BB704F00C48C7200D397
        7800CA917400C2805C00D0906B00D59A7900CE957600F4EBE600FEF4ED00FFFC
        FA00FCF4EE00FAEDE100FCF4ED00FEFCFA00EF993800E5A55F00F2D5B500F6E1
        CA00F8E7D400F7E6D400F7E7D500F8EDE100E2A35B00F0D0A900F6E1C900F4E1
        CA00FAEDDE00FAEEE000EECB9E00F4D5AD00F0D1AA00F2D7B400F2D7B500F4DD
        C000F3DCBF00F8E9D500FAEFE000EFCA9600F0CF9F00FCE7C900E3D3BB00FCEB
        D300FEEED400FBE5C000B7AD9C00FFF4E100FCF6EB00FFFBEE00FFFFFB00FFFF
        FC00006A0000016C0100016B01000A760A000D780D001C831C0023892300469F
        46004AA14A004DA34D004EA44E005FAD5F0060AD60006AB46A0078BB7800B4DA
        B400BBDDBB00EEF7EE00FAFCFA00F8F8FE000202020202424242424242424242
        424204030303034201010101010101010142063B2D3635420101010101010101
        0142053720272C4201504247544F424B0142073A31302E420101514346424F01
        01420A3D21322F420101014C424554010142093F2429324201014D424A434853
        01420C40252328420149424E0152444801420E011A1B33420101010101010101
        01420D0108182B4201010101010101010142100101191C424242424242424242
        424212010101191C2A2239383C030202020216010101011D3E34030303030202
        0202110101010101411703261E0F020202021501010101010155031F13020202
        02021414141414141414030B020202020202}
      Caption = #1045#1082#1089#1087#1086#1088#1090' '#1091' Excel (*.xls)'
      OnClick = rcgjhn1Click
    end
    object HTMLhtml1: TMenuItem
      Bitmap.Data = {
        46020000424D4602000000000000460100002800000010000000100000000100
        08000000000000010000120B0000120B0000440000004400000000000000FFFF
        FF00FF00FF00A5696A0095655F009D6B620098686000A36F6400FFFBFA00AD78
        6900A7746600811E0000BB7F6A00B47E6B00BF877000BA836D00BB704F00C48C
        7200D3977800CA917400C2805C00D0906B00D59A7900CE957600F4EBE600FEF4
        ED00FFFCFA00FCF4EE00FAEDE100FCF4ED00FEFCFA00EF993800E5A55F00F2D5
        B500F6E1CA00F8E7D400F7E6D400F7E7D500F8EDE100E2A35B00F0D0A900F6E1
        C900F4E1CA00FAEDDE00FAEEE000EECB9E00F4D5AD00F0D1AA00F2D7B400F2D7
        B500F4DDC000F3DCBF00F8E9D500FAEFE000EFCA9600F0CF9F00FCE7C900E3D3
        BB00FCEBD300FEEED400FBE5C000B7AD9C00FFF4E100FCF6EB00FFFBEE00FFFF
        FB00FFFFFC00F8F8FE0002020202020B0B0B0B0B0B0B0B0B0B0B04030303030B
        0101010101010101010B063C2E37360B0101010101010101010B053821282D0B
        0101010B010B010B010B073B32312F0B010B0B01010B010B010B0A3E2233300B
        0B010101010B010B010B0940252A330B010B0B01010B0B01010B0D412624290B
        0101010B010B0101010B0F011B1C340B01010101010B0101010B0E0108192C0B
        0101010101010101010B1101011A1D0B0B0B0B0B0B0B0B0B0B0B130101011A1D
        2B233A393D030202020217010101011E3F350303030302020202120101010101
        421803271F100202020216010101010101430320140202020202151515151515
        1515030C020202020202}
      Caption = #1045#1082#1089#1087#1086#1088#1090' '#1091' HTML (*.html)'
      OnClick = HTMLhtml1Click
    end
    object XMLxml1: TMenuItem
      Bitmap.Data = {
        46020000424D4602000000000000460100002800000010000000100000000100
        08000000000000010000120B0000120B0000440000004400000000000000FFFF
        FF00FF00FF00A5696A0095655F009D6B620098686000A36F6400FFFBFA00AD78
        6900A7746600BB7F6A00B47E6B00BF877000BA836D00BB704F00C48C7200D397
        7800CA917400C2805C00D0906B00D59A7900CE957600F4EBE600FEF4ED00FFFC
        FA00FCF4EE00FAEDE100FCF4ED00FEFCFA00EF993800E5A55F00F2D5B500F6E1
        CA00F8E7D400F7E6D400F7E7D500F8EDE100E2A35B00F0D0A900F6E1C900F4E1
        CA00FAEDDE00FAEEE000EECB9E00F4D5AD00F0D1AA00F2D7B400F2D7B500F4DD
        C000F3DCBF00F8E9D500FAEFE000EFCA9600F0CF9F00FCE7C900E3D3BB00FCEB
        D300FEEED400FBE5C000B7AD9C00FFF4E100FCF6EB00FFFBEE00FFFFFB00FFFF
        FC0000008200F8F8FE0002020202024242424242424242424242040303030342
        01010101010101010142063B2D36354201010101010101010142053720272C42
        01010142420101014242073A31302E42014242010142014201420A3D21322F42
        42010101010142010142093F24293242014242010142014201420C4025232842
        010101424201010142420E011A1B3342010101010101010101420D0108182B42
        01010101010101010142100101191C424242424242424242424212010101191C
        2A2239383C030202020216010101011D3E340303030302020202110101010101
        411703261E0F020202021501010101010143031F130202020202141414141414
        1414030B020202020202}
      Caption = #1045#1082#1089#1087#1086#1088#1090' '#1091' XML (*.xml)'
      OnClick = XMLxml1Click
    end
    object exttxt1: TMenuItem
      Bitmap.Data = {
        76020000424D7602000000000000760100002800000010000000100000000100
        08000000000000010000120B0000120B0000500000005000000000000000FFFF
        FF00FF00FF00A5696A0095655F009D6B620098686000A36F6400FFFBFA00AD78
        6900A7746600BB7F6A00B47E6B00BF877000BA836D00BB704F00C48C7200D397
        7800CA917400C2805C00D0906B00D59A7900CE957600F4EBE600FEF4ED00FFFC
        FA00FCF4EE00FAEDE100FCF4ED00FEFCFA00EF993800E5A55F00F2D5B500F6E1
        CA00F8E7D400F7E6D400F7E7D500F8EDE100E2A35B00F0D0A900F6E1C900F4E1
        CA00FAEDDE00FAEEE000EECB9E00F4D5AD00F0D1AA00F2D7B400F2D7B500F4DD
        C000F3DCBF00F8E9D500FAEFE000EFCA9600F0CF9F00FCE7C900E3D3BB00FCEB
        D300FEEED400FBE5C000B7AD9C00FFF4E100FCF6EB00FFFBEE00FFFFFB00FFFF
        FC00004B000001570300026305000A72120013771A00187F1E000C8C18000C86
        1600EFF6F0001E9A360023BA410026AC440039D76700F8F8FE00020202020243
        4343434343434343434304030303034301010101010101010143063B2D363543
        01010101424201010143053720272C43010101424B4E42010143073A31302E43
        010142454D4C494201430A3D21322F4301014242464842420143093F24293243
        010101014742010101430C40252328430101010144424A0101430E011A1B3343
        010142424201010101430D0108182B4301010101010101010143100101191C43
        4343434343434343434312010101191C2A2239383C030202020216010101011D
        3E340303030302020202110101010101411703261E0F02020202150101010101
        014F031F1302020202021414141414141414030B020202020202}
      Caption = #1045#1082#1089#1087#1086#1088#1090' '#1091' Text (*.txt)'
      OnClick = exttxt1Click
    end
  end
  object SaveDialog: TSaveDialog
    Left = 752
    Top = 352
  end
end
