object frmZPersModule1: TfrmZPersModule1
  Left = 746
  Top = 200
  Width = 522
  Height = 594
  Caption = #1058#1072#1073#1083#1080#1094#1110' 6,7 '#1044#1086#1076#1072#1090#1082#1091' 4'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 107
    Width = 506
    Height = 432
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Style = tsFlatButtons
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #1058#1072#1073#1083#1080#1094#1103' 6('#1089#1090#1072#1088#1099#1081' '#1074#1072#1088#1080#1072#1085#1090')'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 498
        Height = 41
        Align = alTop
        Caption = 
          #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1079#1072#1088#1086#1073#1110#1090#1082#1091' ('#1076#1086#1093#1086#1076#1091') '#1079#1072#1089#1090#1088#1072#1093#1086#1074#1072#1085#1080#1084' '#1086#1089#1086#1073#1072 +
          #1084
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object DetailGridBanded: TcxGrid
        Left = 0
        Top = 41
        Width = 498
        Height = 360
        Align = alClient
        TabOrder = 1
        object GridDBBandedTableView6: TcxGridDBBandedTableView
          DataController.DataSource = DataSource6
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.KeyFieldNames = 'id_record'
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = #1057#1090#1072#1074#1082#1080': 0.00'
              Kind = skSum
              FieldName = 'KOL_STAVOK'
            end>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsBehavior.CellHints = True
          OptionsSelection.CellSelect = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          OptionsView.Indicator = True
          OptionsView.BandHeaderLineCount = 2
          OptionsView.BandHeaders = False
          Styles.StyleSheet = GridBandedTableViewStyleSheetDevExpress
          Bands = <
            item
              Width = 150
            end
            item
              Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1086' '#1047#1054
              Width = 229
            end
            item
              Width = 144
            end
            item
              Width = 261
            end
            item
              Width = 89
            end
            item
              Width = 76
            end>
          object Col5_6: TcxGridDBBandedColumn
            Caption = #1058'.'#1053
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            SortOrder = soAscending
            Width = 33
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.LineCount = 6
            Position.RowIndex = 0
            DataBinding.FieldName = 'col5'
          end
          object Col6_6: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088' '#1086#1073#1083#1110#1082#1086#1074#1086#1111' '#1082#1072#1088#1090#1082#1080' '#1079#1072#1089#1090#1088#1072#1093#1086#1074#1072#1085#1085#1086#1111' '#1086#1089#1086#1073#1080' ('#1047#1054') '#1079#1072' '#1044#1056#1060#1054' '#1044#1055#1040
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taBottomJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 241
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.LineCount = 2
            Position.RowIndex = 0
            DataBinding.FieldName = 'col6'
          end
          object Col7_6: TcxGridDBBandedColumn
            Caption = #1055#1088#1110#1079#1074#1080#1097#1077' '#1090#1072' '#1110#1085#1110#1094#1110#1072#1083#1080' '#1047#1054
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 241
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.LineCount = 4
            Position.RowIndex = 1
            DataBinding.FieldName = 'col7'
          end
          object Col8_6: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1082#1072#1090#1077#1075#1086#1088#1110#1111' '#1047#1054
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 76
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.LineCount = 6
            Position.RowIndex = 0
            DataBinding.FieldName = 'col8'
          end
          object Col9_6: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1090#1080#1087#1091' '#1089#1090#1072#1074#1082#1080' '#1089#1090#1088#1072#1093#1086#1074#1086#1075#1086' '#1074#1085#1077#1089#1082#1091
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 75
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.LineCount = 6
            Position.RowIndex = 0
            DataBinding.FieldName = 'col9'
          end
          object Col10_6: TcxGridDBBandedColumn
            Caption = 
              #1047#1072#1075#1072#1083#1100#1085#1072' '#1089#1091#1084#1072' '#1085#1072#1088#1072#1093#1086#1074#1072#1085#1085#1086#1075#1086' '#1079#1072#1088#1086#1073#1110#1090#1082#1091'/'#1076#1086#1093#1086#1076#1091' ('#1091#1089#1100#1075#1086' '#1079' '#1087#1086#1095#1072#1090#1082#1091' '#1079#1074 +
              #1110#1090#1085#1086#1075#1086' '#1084#1110#1089#1103#1094#1103')'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 273
            Position.BandIndex = 3
            Position.ColIndex = 0
            Position.LineCount = 2
            Position.RowIndex = 0
            DataBinding.FieldName = 'col10'
          end
          object Col11_6: TcxGridDBBandedColumn
            Caption = 
              #1057#1091#1084#1072' '#1085#1072#1088#1072#1093#1086#1074#1072#1085#1085#1086#1075#1086' '#1079#1072#1088#1086#1073#1110#1090#1082#1091'/'#1076#1086#1093#1086#1076#1091' '#1091' '#1084#1077#1078#1072#1093' '#1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1111' '#1074#1077#1083#1080#1095#1080#1085 +
              #1080', '#1085#1072' '#1103#1082#1091' '#1085#1072#1088#1072#1093#1086#1074#1091#1102#1090#1100#1089#1103' '#1089#1090#1088#1072#1093#1086#1074#1110' '#1074#1085#1077#1089#1082#1080
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 273
            Position.BandIndex = 3
            Position.ColIndex = 0
            Position.LineCount = 4
            Position.RowIndex = 1
            DataBinding.FieldName = 'col11'
          end
          object Col12_6: TcxGridDBBandedColumn
            Caption = 
              #1057#1091#1084#1072' '#1089#1090#1088#1072#1093#1086#1074#1080#1093' '#1074#1085#1077#1089#1082#1110#1074' '#1085#1072' '#1079#1074#1110#1090#1085#1110#1081' '#1084#1110#1089#1103#1094#1100' ('#1110#1079' '#1079#1072#1088#1086#1073#1110#1090#1082#1091'/ '#1076#1086#1093#1086#1076#1091') ' +
              '1-5%'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 94
            Position.BandIndex = 4
            Position.ColIndex = 0
            Position.LineCount = 6
            Position.RowIndex = 0
            DataBinding.FieldName = 'col12'
          end
          object Col13_6: TcxGridDBBandedColumn
            Caption = #1053#1072#1103#1074#1085#1110#1089#1090#1100' '#1090#1088'. '#1082#1085'.'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayUnchecked = 'False'
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 80
            Position.BandIndex = 5
            Position.ColIndex = 0
            Position.LineCount = 2
            Position.RowIndex = 0
            DataBinding.FieldName = 'col13'
          end
          object Col14_6: TcxGridDBBandedColumn
            Caption = #1053#1072#1103#1074#1085#1110#1089#1090#1100' '#1089#1087'.'#1089#1090'.'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayUnchecked = 'False'
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 80
            Position.BandIndex = 5
            Position.ColIndex = 0
            Position.LineCount = 4
            Position.RowIndex = 1
            DataBinding.FieldName = 'col14'
          end
          object GridDBBandedTableView6DBBandedColumn1: TcxGridDBBandedColumn
            Caption = #1043#1088#1086#1084#1072#1076#1103#1085#1080#1085' '#1059#1082#1088#1072#1111#1085#1080
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 39
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.LineCount = 6
            Position.RowIndex = 0
            DataBinding.FieldName = 'country'
          end
          object GridDBBandedTableView6DBBandedColumn2: TcxGridDBBandedColumn
            Caption = #1057#1090#1072#1090#1100
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 38
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.LineCount = 6
            Position.RowIndex = 0
            DataBinding.FieldName = 'POL'
          end
        end
        object DetailGridLevel4: TcxGridLevel
          GridView = GridDBBandedTableView6
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1058#1072#1073#1083#1080#1094#1103' 6'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 498
        Height = 41
        Align = alTop
        Caption = 
          #1057#1091#1084#1080', '#1085#1072#1088#1072#1093#1086#1074#1072#1085#1110' '#1079#1072' '#1076#1085#1110' '#1090#1080#1084#1095#1072#1089#1086#1074#1086#1111' '#1085#1077#1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1086#1089#1090#1110', '#1097#1086#1088#1110#1095#1085#1110' '#1090#1072' ' +
          #1076#1086#1076#1072#1090#1082#1086#1074#1110' '#1074#1110#1076#1087#1091#1089#1090#1082#1080', '#1089#1091#1084#1080' '#1084#1080#1085#1091#1083#1080#1093' '#1087#1077#1088#1110#1086#1076#1110#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 41
        Width = 498
        Height = 360
        Align = alClient
        TabOrder = 1
        object cxGridDBBandedTableView1: TcxGridDBBandedTableView
          DataController.DataSource = DataSource7
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.KeyFieldNames = 'id_record'
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = #1057#1090#1072#1074#1082#1080': 0.00'
              Kind = skSum
              FieldName = 'KOL_STAVOK'
            end>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsBehavior.CellHints = True
          OptionsSelection.CellSelect = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          OptionsView.Indicator = True
          OptionsView.BandHeaderLineCount = 2
          OptionsView.BandHeaders = False
          Styles.StyleSheet = GridBandedTableViewStyleSheetDevExpress
          Bands = <
            item
              Width = 144
            end
            item
              Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1086' '#1047#1054
              Width = 189
            end
            item
              Width = 64
            end
            item
              Width = 82
            end
            item
              Width = 262
            end
            item
              Width = 184
            end
            item
              Width = 132
            end
            item
              Width = 70
            end
            item
            end
            item
            end>
          object Col5: TcxGridDBBandedColumn
            Caption = #1058'.'#1053
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 45
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.LineCount = 8
            Position.RowIndex = 0
            DataBinding.FieldName = 'Col5'
          end
          object Col6: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088' '#1086#1073#1083#1110#1082#1086#1074#1086#1111' '#1082#1072#1088#1090#1082#1080' '#1079#1072#1089#1090#1088#1072#1093#1086#1074#1072#1085#1085#1086#1111' '#1086#1089#1086#1073#1080' ('#1047#1054') '#1079#1072' '#1044#1056#1060#1054' '#1044#1055#1040
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taBottomJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 184
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.LineCount = 3
            Position.RowIndex = 0
            DataBinding.FieldName = 'col6'
          end
          object Col7: TcxGridDBBandedColumn
            Caption = #1055#1088#1110#1079#1074#1080#1097#1077' '#1090#1072' '#1110#1085#1110#1094#1110#1072#1083#1080' '#1047#1054
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 184
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.LineCount = 5
            Position.RowIndex = 1
            DataBinding.FieldName = 'col7'
          end
          object Col8: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1082#1072#1090#1077#1075#1086#1088#1110#1111' '#1047#1054
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 62
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.LineCount = 8
            Position.RowIndex = 0
            DataBinding.FieldName = 'col8'
          end
          object Col9: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1090#1080#1087#1091' '#1089#1090#1072#1074#1082#1080' '#1089#1090#1088#1072#1093#1086#1074#1086#1075#1086' '#1074#1085#1077#1089#1082#1091
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 80
            Position.BandIndex = 3
            Position.ColIndex = 0
            Position.LineCount = 8
            Position.RowIndex = 0
            DataBinding.FieldName = 'col9'
          end
          object Col10: TcxGridDBBandedColumn
            Caption = #1052#1110#1089#1103#1094#1100' '#1090#1072' '#1088#1110#1082', '#1079#1072' '#1103#1082#1080#1081' '#1087#1088#1086#1074#1077#1076#1077#1085#1086' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 135
            Position.BandIndex = 4
            Position.ColIndex = 0
            Position.LineCount = 8
            Position.RowIndex = 0
            DataBinding.FieldName = 'col10'
          end
          object Col11: TcxGridDBBandedColumn
            Caption = #1058#1080#1087' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 120
            Position.BandIndex = 4
            Position.ColIndex = 1
            Position.LineCount = 8
            Position.RowIndex = 0
            DataBinding.FieldName = 'col11'
          end
          object Col12: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1072' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1079#1072#1088#1086#1073#1110#1090#1082#1091'/'#1076#1086#1093#1086#1076#1091' '#1079#1072' '#1074#1110#1076#1087#1086#1074#1110#1076#1085#1080#1081' '#1084#1110#1089#1103#1094#1100
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 179
            Position.BandIndex = 5
            Position.ColIndex = 0
            Position.LineCount = 3
            Position.RowIndex = 0
            DataBinding.FieldName = 'col12'
          end
          object Col13: TcxGridDBBandedColumn
            Caption = 
              #1057#1091#1084#1072' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1079#1072#1088#1086#1073#1110#1090#1082#1091'/'#1076#1086#1093#1086#1076#1091', '#1091#1084#1077#1078#1072#1093' '#1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1111' '#1074#1077#1083#1080#1095#1080#1085#1080', ' +
              #1085#1072' '#1103#1082#1091' '#1085#1072#1088#1072#1093#1086#1074#1091#1102#1090#1100#1089#1103' '#1089#1090#1088#1072#1093#1086#1074#1110' '#1074#1085#1077#1089#1082#1080' '
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 179
            Position.BandIndex = 5
            Position.ColIndex = 0
            Position.LineCount = 5
            Position.RowIndex = 1
            DataBinding.FieldName = 'col13'
          end
          object Col14: TcxGridDBBandedColumn
            Caption = 
              #1057#1091#1084#1072' '#1089#1090#1088#1072#1093#1086#1074#1080#1093' '#1074#1085#1077#1089#1082#1110#1074' '#1079#1072' '#1074#1110#1076#1087#1086#1074#1110#1076#1085#1080#1081' '#1084#1110#1089#1103#1094#1100' ('#1110#1079' '#1079#1072#1088#1086#1073#1110#1090#1082#1091'/'#1076#1086#1093#1086#1076 +
              #1091') 1-5%'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 85
            Position.BandIndex = 6
            Position.ColIndex = 0
            Position.LineCount = 8
            Position.RowIndex = 0
            DataBinding.FieldName = 'col14'
          end
          object Col15: TcxGridDBBandedColumn
            Caption = #1053#1072#1103#1074#1085#1110#1089#1090#1100' '#1090#1088'. '#1082#1085'.'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayUnchecked = 'False'
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 68
            Position.BandIndex = 7
            Position.ColIndex = 0
            Position.LineCount = 3
            Position.RowIndex = 0
            DataBinding.FieldName = 'col15'
          end
          object Col16: TcxGridDBBandedColumn
            Caption = #1053#1072#1103#1074#1085#1110#1089#1090#1100' '#1089#1087#1077#1094#1089#1090#1072#1078#1091
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayUnchecked = 'False'
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 68
            Position.BandIndex = 7
            Position.ColIndex = 0
            Position.LineCount = 5
            Position.RowIndex = 1
            DataBinding.FieldName = 'col16'
          end
          object cxGridDBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn
            Caption = #1043#1088#1086#1084#1072#1076#1103#1085#1080#1085' '#1059#1082#1088#1072#1111#1085#1080
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 52
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.LineCount = 8
            Position.RowIndex = 0
            DataBinding.FieldName = 'country'
          end
          object cxGridDBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn
            Caption = #1057#1090#1072#1090#1100
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 43
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.LineCount = 8
            Position.RowIndex = 0
            DataBinding.FieldName = 'POL'
          end
          object Percent: TcxGridDBBandedColumn
            Caption = '% '#1091#1090#1088#1080#1084#1072#1085#1085#1103
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 43
            Position.BandIndex = 6
            Position.ColIndex = 1
            Position.LineCount = 8
            Position.RowIndex = 0
          end
          object cxGridDBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn
            Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1082#1072#1083#1077#1085#1076#1072#1088#1085#1080#1093' '#1076#1085#1110#1074' '#1090#1080#1084#1095#1072#1089#1086#1074#1086#1111' '#1085#1077#1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1086#1089#1090#1110
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Visible = False
            MinWidth = 30
            Options.Filtering = False
            Position.BandIndex = 4
            Position.ColIndex = 2
            Position.LineCount = 8
            Position.RowIndex = 0
            DataBinding.FieldName = 'num_cd_hosp'
          end
          object cxGridDBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn
            Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1082#1072#1083#1077#1085#1076#1072#1088#1085#1080#1093' '#1076#1085#1110#1074' '#1073#1077#1079' '#1079#1073#1077#1088#1077#1078#1077#1085#1085#1103' '#1079#1072#1088'.'#1087#1083#1072#1090#1080
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            MinWidth = 30
            Options.Filtering = False
            Position.BandIndex = 4
            Position.ColIndex = 3
            Position.LineCount = 8
            Position.RowIndex = 0
            DataBinding.FieldName = 'num_cd_not_zar'
          end
          object cxGridDBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn
            Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1076#1085#1110#1074' '#1087#1077#1088#1077#1073#1091#1074#1072#1085#1085#1103' '#1091' '#1090#1088#1091#1076#1086#1074#1080#1093'/'#1062#1055' '#1074#1110#1076#1085#1086#1089#1080#1085#1072#1093
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Width = 85
            Position.BandIndex = 8
            Position.ColIndex = 0
            Position.LineCount = 8
            Position.RowIndex = 0
            DataBinding.FieldName = 'NUM_CD_WORK'
          end
          object cxGridDBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn
            Caption = #1054#1079#1085#1072#1082#1072' '#1085#1086#1074#1086#1075#1086' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1084#1110#1089#1094#1103
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.Alignment = taCenter
            Properties.DisplayUnchecked = 'False'
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            HeaderAlignmentHorz = taCenter
            Width = 77
            Position.BandIndex = 8
            Position.ColIndex = 1
            Position.LineCount = 8
            Position.RowIndex = 0
            DataBinding.FieldName = 'OZN_NEW_WORK_PL'
          end
          object cxGridDBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn
            Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1082#1072#1083#1077#1085#1076#1072#1088#1085#1080#1093' '#1076#1085#1110#1074' '#1091' '#1079#1074#39#1103#1079#1082#1091' '#1079' '#1074#1072#1075#1110#1090#1085#1110#1089#1090#1102
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            HeaderGlyphAlignmentHorz = taCenter
            MinWidth = 70
            Options.Editing = False
            Options.Filtering = False
            Options.Moving = False
            Position.BandIndex = 9
            Position.ColIndex = 0
            Position.LineCount = 8
            Position.RowIndex = 0
            DataBinding.FieldName = 'NUM_CD_DEKRET'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBBandedTableView1
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1047#1072#1075#1072#1083#1100#1085#1110' '#1087#1086#1082#1072#1079#1085#1080#1082#1080
      ImageIndex = 3
      object cxGrid3: TcxGrid
        Left = 0
        Top = 0
        Width = 1175
        Height = 405
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        object cxGridDBTableView2: TcxGridDBTableView
          DataController.DataSource = GDataSource7
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '0.00'
              Kind = skSum
              Position = spFooter
              FieldName = 'col12'
              Column = g7col12
            end
            item
              Format = '0.00'
              Kind = skSum
              Position = spFooter
              FieldName = 'col13'
              Column = g7col13
            end
            item
              Format = '0.00'
              Kind = skSum
              Position = spFooter
              FieldName = 'col14'
              Column = g7col14
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'col12'
              Column = g7col12
            end
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'col13'
              Column = g7col13
            end
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'col14'
              Column = g7col14
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsBehavior.IncSearch = True
          OptionsData.Deleting = False
          OptionsSelection.CellSelect = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.HeaderAutoHeight = True
          Styles.StyleSheet = GridTableViewStyleSheetDevExpress
          object g7col8: TcxGridDBColumn
            Caption = #1050#1086#1076' '#1082#1072#1090#1077#1075#1086#1088#1110#1111' '#1047#1054
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Visible = False
            GroupIndex = 0
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            SortOrder = soAscending
            Width = 128
            DataBinding.FieldName = 'col8'
          end
          object g7col16: TcxGridDBColumn
            Caption = #1054#1079#1085#1072#1082#1072' '#1085#1072#1103#1074#1085#1086#1089#1090#1110' '#1089#1087#1077#1094#1089#1090#1072#1078#1091
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayUnchecked = 'False'
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 87
            DataBinding.FieldName = 'col16'
          end
          object g7col10: TcxGridDBColumn
            Caption = #1052#1110#1089#1103#1094#1100
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 53
            DataBinding.FieldName = 'col10'
          end
          object g7col12: TcxGridDBColumn
            Caption = #1057#1091#1084#1072' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1079#1072#1088#1086#1073#1110#1090#1082#1091'/'#1076#1086#1093#1086#1076#1091' '#1079#1072' '#1074#1110#1076#1087#1086#1074#1110#1076#1085#1080#1081' '#1084#1110#1089#1103#1094#1100
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 230
            DataBinding.FieldName = 'col12'
          end
          object g7col13: TcxGridDBColumn
            Caption = 
              #1057#1091#1084#1084#1072' '#1085#1072#1088#1072#1093#1086#1074#1072#1085#1086#1075#1086' '#1079#1072#1088#1086#1073#1110#1090#1082#1091'/'#1076#1086#1093#1086#1076#1091' '#1091' '#1084#1077#1078#1072#1093' '#1084#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1111' '#1074#1077#1083#1080#1095#1080#1085 +
              #1080', '#1085#1072' '#1103#1082#1091' '#1085#1072#1088#1072#1093#1086#1074#1091#1102#1090#1100#1089#1103' '#1089#1090#1088#1072#1093#1086#1074#1110' '#1074#1085#1077#1089#1082#1080
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Options.Grouping = False
            SortOrder = soAscending
            Width = 270
            DataBinding.FieldName = 'col13'
          end
          object g7col14: TcxGridDBColumn
            Caption = 
              #1057#1091#1084#1072' '#1089#1090#1088#1072#1093#1086#1074#1080#1093' '#1074#1085#1077#1089#1082#1110#1074' '#1079#1072' '#1079#1074#1110#1090#1085#1080#1081' '#1084#1110#1089#1103#1094#1100' ('#1110#1079' '#1079#1072#1088#1086#1073#1110#1090#1082#1091'/'#1076#1086#1093#1086#1076#1091') 1' +
              '-5%'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 240
            DataBinding.FieldName = 'col14'
          end
          object g7col11: TcxGridDBColumn
            Caption = #1058#1080#1087' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100
            Visible = False
            GroupIndex = 1
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            SortOrder = soAscending
            Width = 74
            DataBinding.FieldName = 'col11'
          end
          object gPercent: TcxGridDBColumn
            Caption = '% '#1091#1090#1088#1080#1084#1072#1085#1085#1103
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
        end
        object cxGridLevel3: TcxGridLevel
          GridView = cxGridDBTableView2
        end
      end
    end
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 539
    Width = 506
    Height = 17
    Align = alBottom
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 48
    Width = 506
    Height = 59
    Align = alTop
    TabOrder = 6
    object Label1: TLabel
      Left = 32
      Top = 8
      Width = 3
      Height = 13
    end
    object Label2: TLabel
      Left = 23
      Top = 5
      Width = 279
      Height = 13
      Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1080' '#1087#1086' '#1072#1085#1082#1077#1090#1072#1084' '#1079#1072' '#1087#1077#1088#1110#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 309
      Top = 30
      Width = 289
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.BorderStyle = ebs3D
      Style.Color = 16247513
      TabOrder = 0
    end
    object cxCheckBox1: TcxCheckBox
      Left = 16
      Top = 26
      Width = 217
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox1PropertiesChange
      Properties.Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1080#1081' '#1092#1110#1083#1100#1090#1088' '#1087#1086' '#1092#1110#1079#1080#1095#1085#1110#1081' '#1086#1089#1086#1073#1110
      TabOrder = 1
    end
    object cxTextEdit1: TcxTextEdit
      Left = 229
      Top = 30
      Width = 73
      Height = 21
      Enabled = False
      Style.BorderStyle = ebs3D
      Style.Color = 16247513
      TabOrder = 2
      OnExit = cxTextEdit1Exit
      OnKeyDown = cxTextEdit1KeyDown
    end
    object PeriodsCB: TComboBox
      Left = 309
      Top = 6
      Width = 289
      Height = 21
      Color = 16247513
      Ctl3D = False
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 3
    end
  end
  object Styles: TcxStyleRepository
    Left = 24
    Top = 296
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 8535838
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15921906
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 8535838
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
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
    object GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle18
      Styles.ContentEven = cxStyle19
      Styles.ContentOdd = cxStyle20
      Styles.Inactive = cxStyle26
      Styles.IncSearch = cxStyle27
      Styles.Selection = cxStyle30
      Styles.FilterBox = cxStyle21
      Styles.Footer = cxStyle22
      Styles.Group = cxStyle23
      Styles.GroupByBox = cxStyle24
      Styles.Header = cxStyle25
      Styles.Indicator = cxStyle28
      Styles.Preview = cxStyle29
      Styles.BandBackground = cxStyle16
      Styles.BandHeader = cxStyle17
      BuiltIn = True
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 56
    Top = 456
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 96
    Top = 456
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 24
    Top = 352
  end
  object BarManager: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'ButtonsControlBar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 287
        FloatTop = 193
        FloatClientWidth = 73
        FloatClientHeight = 176
        ItemLinks = <
          item
            Item = dxBarLargeButton6
            Visible = True
          end
          item
            Item = AddReportBtn
            Visible = True
          end
          item
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            Item = DelReportBtn
            Visible = True
          end
          item
            Item = RefreshBtn
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton7
            Visible = True
          end
          item
            Item = dxBarLargeButton8
            Visible = True
          end
          item
            Item = ExitBtn
            Visible = True
          end>
        Name = 'ButtonsControlBar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        ShowMark = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clActiveBorder
    LookAndFeel.Kind = lfUltraFlat
    PopupMenuLinks = <>
    Style = bmsOffice11
    SunkenBorder = True
    UseSystemFont = True
    Left = 120
    Top = 448
    DockControlHeights = (
      0
      0
      48
      0)
    object RefreshBtn: TdxBarLargeButton
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      Category = 0
      Hint = #1055#1086#1085#1086#1074#1080#1090#1080
      Visible = ivAlways
      ShortCut = 116
      OnClick = RefreshBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FF92635DA46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769A46769A46769A46769A46769A46769A46769A46769FF00FFFF
        00FFFF00FFFF00FFFF00FF93655EEFD3B4F6DAB6F3D5ADF2D1A5F0CE9EEFCB97
        EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080EDC180EABF
        7F9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED4B8F4DABBF2D5B1F0
        D1AAA5BB70E0C793DEC48CEDC58FEBC188EABF82E9BD7FE9BD7FE9BD7FE9BD7F
        E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED7
        C0F6E0C1F2D9B8F2D4B1C0C588008201E0C79352A035259217259116519D2EB2
        B262DABB77E9BD7FE9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FF
        FF00FF93655FEFDAC5F7E2C7F3DCBFF2D8B7E3D0A50082010686050082010082
        010082010082010082017AA643DABB77E9BD7FEABF7FE7BC7E9F6F60FF00FFFF
        00FFFF00FFFF00FFFF00FF936560F0DECCF8E6CFF6E0C6F3DCBDE3D4AC008201
        008201008201008201008201008201008201008201AFB15FE9BD7FEABF7FE7BC
        7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2D3FAEAD7F6E3CEF4
        DEC5E5D8B200820100820100820126931BB2BC76B1BA72529F33008201249015
        E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF986963F2E6
        DAFAEEDEF7E7D4F6E2CBE5DAB80082010082010082011C9014E1CA99E0C793DE
        C48C90AF57068604E9BD81EABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FF
        FF00FF9E6E64F4EAE1FBF2E6F8EADCF7E6D3E6DDC00082010082010082010082
        01008201E1CA9AEDCB9CEDC796EBC58F5FC065EABF82E7BB7E9F6F60FF00FFFF
        00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3F7EADAE7E1C6E6DDC0
        E5D9B8E5D8B2E3D4ABE2D1A5E2CE9FEFCEA3EECA9CEDC7955FC065EBC288E7BC
        809F6F60FF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3F0FEFBF6FBF3EB5F
        C065F8EBDCF7E7D3F6E2CCE5DAB8E5D8B2E3D4ACE3D0A6E2CE9EE1CA99DEC792
        EDC795EDC58FE9BF879F6F62FF00FFFF00FFFF00FFFF00FFFF00FFAC7969FAF6
        F4FFFFFEFEF8F35FC065F8EEE3F8EBDAF7E6D3E7DDC000820100820100820100
        8201008201E1CA99EECB9CEEC996EAC18EA07063FF00FFFF00FFFF00FFFF00FF
        FF00FFB17E6BFAF6F4FFFFFFFFFEFBFEF7F006880698CB8BE9E5CCE7E2C6E6DD
        BF1C9217008201008201008201E2CE9EEFCEA1EECB9CEBC592A07264FF00FFFF
        00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFFFFCFB289D27008201
        56B04FBAD5A5BAD19E279821008201008201008201E3D0A4F0D1A9F0CFA3EDC9
        999D7065FF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFFFFFFFFFFFF
        FFFFBFE3BC008201008201008201008201008201008201008201008201E3D4AB
        F0D4AFEFD0A7CEB491896A63FF00FFFF00FFFF00FFFF00FFFF00FFC0896FFBF7
        F4FFFFFFFFFFFFFFFFFFEFF8EF87CC8400820100820100820100820100820106
        8706008201E5D8B2E5CEAFC4B096A1927F806762FF00FFFF00FFFF00FFFF00FF
        FF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFEFF8EFC4E5C157B554289C
        25279A2456AF4CE9E2C7008201B2C495B8AB9AA79C8BA49786846964FF00FFFF
        00FFFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFBFCF7F0FBF2E9FBF2E5DACFB7956856696C4095655B96655B9665
        5B986859FF00FFFF00FFFF00FFFF00FFFF00FFCF9674FBF7F6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B69F675BDAA16B
        DD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FFFF00FFD49875FCF8
        F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFFFEF7DD
        C4BC9F675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFDDC7C29F675BEAB273EFA751A5686BFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CE9F675BEDB572A5686BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF8E68CF8E68CF8E68CF
        8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E689F675BA5686B
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object ExitBtn: TdxBarLargeButton
      Align = iaRight
      Caption = #1042#1080#1093#1110#1076
      Category = 0
      Hint = #1042#1080#1093#1110#1076
      Visible = ivAlways
      ShortCut = 27
      OnClick = ExitBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66666933
        34FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666
        A36666A76666693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666A0
        6666B06667C66667CC6667B36667693334FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A66
        66AF6869C0696ACF696ACE6869CD6768CD6768B36667693334AE66669A66669A
        66669A66669A66669A66669A66669A66669A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666D26F70D56F70D46E6FD36D6ED26C6DD16B6CD06A6BB467686933
        34FEA2A3FDA8A9FCAFB0FBB6B7FABCBDF9C2C2F9C5C6F9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666D97374D87273D77172D67071D56F70D46E6F
        D36D6EB6696A69333459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666DC7677DB7576DA7475D9
        7374D87273D77172D67071B86B6B69333459B26733CB6733CB6733CB6733CB67
        33CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666DF79
        7ADF797ADE7879DD7778DC7677DB7576DA7475B96C6D69333459B26733CB6733
        CB6733CB6733CB6733CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666E37D7EE27C7DE17B7CE07A7BDF797ADE7879DD7778BB6E6F6933
        3459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666E68081E57F80E47E7FE37D7EE27C7DE17B7C
        E07A7BBD707069333459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666E98384E88283E78182E6
        8081E78788ECA6A7E47E7FBE717269333473B87633CB6733CB6733CB6733CB67
        33CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666ED87
        88EC8687EB8586EA8485F2B9BAFFFFFFF0B0B0C07374693334F2D9C0C7F0BC79
        DD9079DD9060D68160D68160D681F9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666F08A8BEF898AEE8889ED8788F5BBBCFFFFFFF0AAABC275756933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDE2F8CCE2F8CCF9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666F38D8EF28C8DF18B8CF08A8BEF898AF3A6A7
        ED8788C37677693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666F69091F69091F58F90F4
        8E8FF38D8EF28C8DF18B8CC57878693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDD
        FFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666FA94
        95F99394F89293F79192F69091F58F90F48E8FC77A7A693334F2D9C0FFFFDDFF
        FFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666FD9798FC9697FB9596FA9495F99394F89293F79192C87B7C6933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666FF999AFF999AFE9899FD9798FD9798FC9697
        FB9596CA7D7D693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666FF999AFF999AFF999AFF
        999AFF999AFE9899FE9899CC7F7F693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDD
        FFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666F996
        97FF999AFF999AFF999AFF999AFF999AFF999ACD8080693334F2D9C0FFFFDDFF
        FFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A66669A6666C0797ADF898AFF999AFF999AFF999AFF999ACD80806933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666A76C6DC67C7DF29394
        FF999ACD8080693334A766669A66669A66669A66669A66669A66669A66669A66
        669A6666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF9A66669A6666AD7070B37373693334FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object AddReportBtn: TdxBarLargeButton
      Caption = #1044#1086#1076#1072#1090#1080' '#1079#1072#1087#1080#1089
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1079#1072#1087#1080#1089
      Visible = ivAlways
      ShortCut = 16429
      OnClick = AddReportBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFA97C79B78183B78183B78183B78183B78183B78183B78183B78183B781
        83B78183B78183B78183B78183B78183B78183B78183B78183B78183FF00FFFF
        00FFFF00FFFF00FFFF00FFAE7781F3DDC4F8E3C6F6DFBFF5DCB8F4D9B2F3D7AC
        F3D4A7F2D2A0F0CF9AF0CE98F0CE98F0CE98F0CE98F0CE98F0CE98F1CF98EFCD
        97B88183FF00FFFF00FFFF00FFFF00FFFF00FFAE7782F2DEC8F7E3CAF5DFC2F4
        DCBCF3DAB6F2D7B1F1D4ABF1D2A5F0CF9FEFCD9AEECC97EECC97EECC97EECC97
        EECC97EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FFFF00FFAE7782F2E0
        CEF8E7CFF5E2C8F5DEC2F4DCBCF3DAB7F2D7B1F1D4ABF1D2A5F0CFA0EFCD9AEE
        CC97EECC97EECC97EECC97EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FF
        FF00FFAE7782F3E3D2F9E9D4F6E4CDF5E1C7F5DEC1F4DCBCF3D9B6F2D7B0F1D4
        AAF1D2A5F0CFA0EECC99EECC97EECC97EECC97EFCD97EDCB96B88183FF00FFFF
        00FFFF00FFFF00FFFF00FFAE7783F4E6D8FAECDAF8E7D3F6E4CCF5E1C7F5DFC2
        F4DCBCF3D9B6F2D7B0F1D4ABF1D2A6F0CFA0EECD9AEECC97EECC97EFCD97EDCB
        96B88183FF00FFFF00FFFF00FFFF00FFFF00FFAF7883F5E9DDFBEFE0F8EAD9F7
        E6D2F6E4CDF5E1C8F4DEC2F4DCBCF3D9B6F2D7B1F1D4ACF1D2A6F0CFA0EECC99
        EECC97EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FFFF00FFB27B85F5EC
        E3FBF2E6F9EDDEF8E9D7F7E7D2F6E4CDF5E1C7F5DFC1F4DCBBF3D9B6F2D7B1F1
        D4ABF1D2A5F0CFA0EECC99EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FF
        FF00FFB78086F7EFE8FCF5ECFAEFE4F9ECDDF8E9D8F7E7D3F6E4CDF5E1C7F5DF
        C1F4DCBCF3D9B7F1D7B0F1D4ABF0D2A5F0CF9FEFCD9AEDCA96B88183FF00FFFF
        00FFFF00FFFF00FFFF00FFBB8388F8F2EEFDF8F1FAF3EAF9EFE3F9ECDDF8E9D8
        F7E6D2F6E4CCF5E1C6F4DFC1F4DCBCF3D9B6F2D6B0F1D4AAF0D1A4F0D09FEDCB
        98B88183FF00FFFF00FFFF00FFFF00FFFF00FFBE8689FAF6F4FEFCF8FCF6F0FA
        F2EAFAF0E4F9EDDDF8E9D8F7E7D2F6E4CCF5E1C7F5DEC2F4DCBBF3D9B6F1D7B0
        F1D4AAF1D2A5EECD9EB88184FF00FFFF00FFFF00FFFF00FFFF00FFC2898AFBF8
        F7FFFFFEFEFAF6FCF5EFFAF2EAFAF0E3F9ECDDF9E9D8F8E7D2F6E4CDF5E1C7F5
        DEC1F4DCBCF3D9B6F2D7B0F2D5ABEFCFA4B98285FF00FFFF00FFFF00FFFF00FF
        FF00FFC68D8CFBF8F7FFFFFFFFFEFCFEF9F4FCF6EFFBF3EAFAEFE3F9EDDDF8E9
        D7F8E7D2F6E4CDF5E1C6F5DEC1F4DCBBF3D9B5F2D7B0F0D2A8B98386FF00FFFF
        00FFFF00FFFF00FFFF00FFCA908DFBF8F7FFFFFFFFFFFFFFFDFCFEF9F5FCF6F0
        FAF2EAFAF0E4F9ECDDF8EAD8F8E6D2F6E4CCF6E1C6F5DEC0F4DCBBF4DAB6F1D5
        AEB58286FF00FFFF00FFFF00FFFF00FFFF00FFCD938FFBF8F7FFFFFFFFFFFFFF
        FFFFFFFEFCFEF9F5FCF6EFFBF2EAFAEFE3F9ECDDF8E9D7F8E6D1F6E3CBF5E1C6
        F4DEC0F3DBBAD9C4A7A47E83FF00FFFF00FFFF00FFFF00FFFF00FFD19790FCF9
        F7FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFEF9F5FCF5EFFBF2E9FAF0E3F9ECDDF8
        E9D7F8E6D1F6E4CCEBD9C0D1C1ABB5A8979C7C81FF00FFFF00FFFF00FFFF00FF
        FF00FFD59A91FCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFDFAF5FCF6
        EFFAF2E9FAEFE2FAEDDEFBEEDBE7DBC9C8BDAFBAB0A2B7AC9DA07E83FF00FFFF
        00FFFF00FFFF00FFFF00FFDA9D93FCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFCFDF9F4FCF5EEFCF5EBEEDDD1B28176AD8076AA7F76AB7F76AB7F
        76AF7F77FF00FFFF00FFFF00FFFF00FFFF00FFDDA194FCF9F8FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFDF9F4FFFBF3E3CEC6B38176E3B585
        E5AD6AE9A654EFA039B88285FF00FFFF00FFFF00FFFF00FFFF00FFE0A395FDFA
        F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFFFEF9E5
        D1CBB38176EFC48DF3BB6DF8B450B88285FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFE0A395FDFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFE5D4D0B38176EFC38CF3BA6CB88285FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFE0A395FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DBD9B38176F1C58BB88285FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEA78CECD0BEEDD3C1EDD3C1EC
        D1C1EAD0C1E8CEC0E6CCBFE4CBBEE1C9BEDFC7BDDDC5BDCEAEA6B38176B88285
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object DelReportBtn: TdxBarLargeButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1079#1072#1087#1080#1089
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1079#1072#1087#1080#1089
      Visible = ivAlways
      ShortCut = 16430
      OnClick = DelReportBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0732DE0732DE0732DEFF00FFFF00FFFF00FF0732DE0732DE0732
        DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FF
        0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00FFFF00FFFF
        00FFFF00FFFF00FF0732DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DE07
        32DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE
        0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335
        FB0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF0732DE07
        32DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00FFFF00FF0732
        DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE
        0732DE0732DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF0732DE0732DE0335FB0732DE0335FB0732DE0732DEFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0335FB0732DEFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0335FB0732DE0732
        DE0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0335FB
        0732DE0335FB0335FB0335FB0732DE0335FBFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB03
        35FB0335FB0732DE0335FBFF00FFFF00FF0335FB0335FB0335FB0335FBFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0335FB0335FB0732DE0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB03
        35FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FBFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0335FBFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335
        FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB
        0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object ExportBtn: TdxBarLargeButton
      Caption = #1045#1082#1089#1087#1086#1088#1090
      Category = 0
      Hint = #1045#1082#1089#1087#1086#1088#1090
      Visible = ivAlways
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF00FF00FF00FFFEFE008E5D590080504B0093655E009A6A6200FFFBFA00A673
        6600811E0000FEF8F600FFFCFB00B47E6900C1886D00BF8B7000D7AB9500D7B0
        9D00CC917200D5AC9600CF8E6800D4987500D3A58700FFFCFA00CE956900D09E
        7A00FFFBF800FEF8F300FEF6EE00FBF4ED00FBEFE000FAF0E300FBF2E600FCF4
        EA00EAC08100EDC48900EDC79100EECA9600EFCC9A00F0D1A300F2D3A600F2D5
        AC00F3D7B000F3D9B200F3DAB600F4DCB800F6E0BF00F6E2C500F6E3C700FAEB
        D500F8EAD500FAEDDA00FBEFDD00FAEEDD00FAF0E100FCF3E600FBF3E700FEFA
        F400EBC68C00EDCA9300EFCE9A00EFCF9E00EFD0A000F4DDB800F4E0BF00F4E1
        C200F7E5C900F7E6CB00F7E6CC00F7E7CE00F8E9D100FAEDD800FCF7EF00FCF6
        EB00FCF8F000FCFAF6006B8FB6001C81FE001C80FC00CCD8E6000A65E1000B65
        DE000A56BD000D6BE9000D69E6000F6FF2000D65DD000F6FF0000F6AE6001172
        F400106EEB00106EEA000F68DD000E5FCA001273F4001170EE001376F6001273
        F2001169E1001169E0001374F2001372F0001373EF001475F2001472E900136C
        E3001678F6001577F4001470E700146FE600146CE1001677F3001674ED00187A
        F800187BF7001778F400197DFA001A7EFB001B7EFB001D81FE0001307600012F
        74000243A30002419C00023B9000023889000237870002368300023581000235
        800002357F0002347D0002337A0002327800033C8F000655C4000548A6000863
        E1000860DD000757C6000755C4000755C2000754C1000A65E200035BE0000235
        830003368300FFFFFF0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
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
        0604040404040404040404040404040404050202020202020603081B1D1F3346
        42402C2927263B3A2205020202020202060303170B1C20343244412D2A283D25
        2305020202020202070303110A0A10211E0A45190A0A183E2405020202020202
        0903030A03030A1B490A330A302E0A293C050202020202020D03030A03030A0C
        4B0A380A31440A3F28050202020202020E03030A03030A030A0A4A0A36470A2F
        2B05020202020202120303110A0A11794F0A1A130A0A16464005020202020202
        15030303030303794C03030C3948373543050202020202021514141414140F7A
        8314141414141414141402020202020202020202020202908302020202020202
        0202020202020202850202020202028F83020202020202020202020202020278
        8402020202027E69830202020202020202020202020278897F0202020202836E
        830202020202020202020202028555657C020202858363629102020202020202
        02020202825E6A648C83837B8D51568302020202020202020202027D6775716B
        615F5B58508A8E8102020202020202020202855C767776726F665A5354878602
        020202020202020202020283684E4D746059578B889202020202020202020202
        02020202856C4E73528078790202020202020202020202020202020202786D70
        82020202020202020202020202020202020202020202795D8302020202020202
        0202020202020202020202020202028383020202020202020202020202020202
        0202020202020202830202020202020202020202020202020202}
    end
    object GroupBtn: TdxBarLargeButton
      Caption = #1044#1077#1090#1072#1083#1100#1085#1086' '#1087#1086' '#1076#1086#1076#1072#1090#1082#1091
      Category = 0
      Hint = #1044#1077#1090#1072#1083#1100#1085#1086' '#1087#1086' '#1076#1086#1076#1072#1090#1082#1091
      Visible = ivAlways
      ButtonStyle = bsChecked
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF0082220300BB490000C14D0000C14F0000BF4D0000BF4E0000BD4C
        0000CF640C00CF671400D76D1600D76E1600D56D1600D76F1700CF6B1A00D774
        2400DC7A2800D77A3000E0833700D8762200DD7D2800DC7B2800E58B3B00E68C
        3C00E78E3D00E68C3D00E18E4600EA984E00EDA16000F0A66500F6AC6A00F4AB
        6900F4AC6900F6AD6B00F4B17400F2A35500F3A45600F3A55600F2A35600F3A5
        5700F4A65900FCB8750000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
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
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020209020202020202030303030303030202
        020202020202020209020202020202031E1D14110B0302020202020202020202
        090909090907050323291A160F03020202020202020202020902020202020203
        0303030303030202020202020202020209020202020202020202020202020202
        0202020202020202090202020202020303030303030302020202020202020202
        0902020202020203222819170C03020202020202020202020909090909080503
        20261B170D030202020202020202020209020202020202030303030303030202
        0202020202020202090202020202020202020202020202020202020202020202
        0902020202020203030303030303020202020202020202020902020202020203
        212519120E0302020202020202020202090909090906040323271A160D030202
        0202020202020202090202020202020303030303030302020202020202020202
        0902020202020202020202020202020202020202020303030303030302020202
        02020202020202020202020202032B2A18150A03020202020202020202020202
        020202020203241F1C1310030202020202020202020202020202020202030303
        0303030302020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202}
    end
    object dxBarButton1: TdxBarButton
      Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1079#1074#1110#1090
      Category = 0
      Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1079#1074#1110#1090
      Visible = ivAlways
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1079#1072#1087#1080#1089
      Category = 0
      Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1079#1072#1087#1080#1089
      Visible = ivAlways
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF0022212300534E5700FF00FF0041353800A4676900A5686B007A494A005A35
        35008B555500804E4E0091595900965D5D008B565600734747008C5757009560
        6000AA6E6E00A96D6D00A76C6C00A66B6B008C5B5B0091606000B77A7A00B679
        7900B87B7B00BB7E7E00BA7D7D009C696900CB8C8C00CA8B8B00C98B8B00C78A
        8A00CC8E8E00DA9A9A00D9999900C2898900D99A9A00DC9D9D00E1A1A100DA9C
        9C00E2A3A300EBAAAA00E2A4A400E1A3A300643B3A00734847007B504F005D38
        360093656000E2D0CE009566600093655F009869630084544C009F675B009E6E
        6400A3726600DDC7C200FBF7F6009D6D5F00865D51007350460062443C00A775
        68009F6F6000AC796900583F3700533C3500DDC4BC0096695A00B17E6B00FFFC
        FB00BB846E00B6816C00BCA19600DAC0B600BBA19600CB917300C58C7000C089
        6F00FCF8F600FAF6F400CF8E6800D4987500CF967400F6EEE900F8F3F000AA78
        56003C383500FEF7F200ECD5C200E1CCBB003E3935006A554200F2E2D300FAEE
        E300F4EAE100B77D460066523F0064513E0065524000EFDAC500F2E6DA00FBF2
        E900FEF7F000FDF8F300EAB2730062503D00604F3D00EED4B800F0DAC200F6E3
        CE00F0DECB00F7E6D300F4E3D000F8EEE300FBF3EA00EFA75100EDB57200EAB4
        7400F2D5B100E9CCAB00F4DEC500F4E1CA00F3E0CA00F7E7D400FAEAD700F8EA
        D900F7EADA00F8EBDC008E745100E5BC8400A4865F00B29268009E835F00E1BB
        88006C594100897253006A5841008E775900DEBB8C00AA8F6B00C6A67E007764
        4C00E1C09300C1A57F00836F5600E6C79D00C9AD89008C796000EDCEA700D9BD
        9900E6CEAF00F2DABC00EAD4B600F4DEC000AC9D8A00F6E1C600F7E5CE00F6E6
        D100F8EBDA00FAEEDE00FBF2E600E1B77900EABF7F00CCA66E00E9BD7F00E7BC
        7E00E5BB7D00DEB57900DAB17700D9B17600E3BA7D00D1AB7300C09C6900A989
        5D009A7E5500E7BC8100E1B77D00C7A36F00BC996900B2916300D1AB7500826C
        4B00987D5800DAB47F00C7A474007B664800B89A6F007E694C00766347006F5D
        4300D1AF7F009D876700F0D8B700EBD8BD00FCF6ED00FCF7F000E3BA7B00FEFB
        F600FFFAEF00FFFEFB00FFFEF700FFFFFE003A494800748686003443440000BD
        FF0000B1F2004E6C760000AAEA0000A6E600009FDE000093D100097BAB001A3E
        4D000087C4000084C100028AC4000B4159000C3C5200113B4E00008CD100036A
        9D0004689A000459830005679800064F7500182A33001B506E00315065003547
        56002A34400041485500012BA700001C9D002D4FF6005270FC00021DB100031E
        B1000420B8000725DC000F2ECC001839E3000C21BF00010D9D001322BD001624
        BF0001099700010A9700050DA50000058F00000082001F1F2100040404040404
        0404040404040404040404040404040404043506060606060606060606060606
        06060606060404040404356F9B7A9895928E8985B3A9A8A8A8A8A6A942040404
        0404355C9DC47B99969390C2BBB4AEA9A8A8A6A942040404040435679F9B9A02
        5E97C38FBEBCB8ABAAA9A6A94204040404043272A07C9C5AFFE6D0948D8887B5
        ADAEA9A942040404040434608071709EDFE2E5DECE918B86B6AFA5C842040404
        04043668A37F7DC5D9E1E4E7EA055FBFBAB7A7AC3D04040404043962A483737E
        CFE3E811120D2E66C084B1B04704040404043A57C675827372DD16221B120D2E
        65C1B9B23E04040404044158C9767583A1D31D271E1C130C096D8CBD3F040404
        04044353CD6B6975A274302C271E1C1310096E8A400404040404485301CB6A76
        61815D302A271F1A140E09644404040404044B530101495B7675835D2F2D2920
        1A140E314504040404044A53010101CB5B7661814E2F28232018150A09040404
        0404515301010101CB5B6961A24E2F28262118150A0904040404505301010101
        01496B7675814C172B2421190BEBE90404044F53010101010101CBC769A45C37
        172B2403DCD4D5DA0404563C0101010101010149C7CA4D38591725D8D1D1D5ED
        FE045552010101010101010149CC463879630FD6D1E0EDF7FBFE555201010101
        0101010101013B386C7708D7D2ECF3F2F0FB55CD010101010101010101013338
        78070404DBF6EEF4F1FD54545454545454545454545454380704040404F9EFF5
        FA040404040404040404040404040404040404040404F8FC0404}
      PaintStyle = psCaptionGlyph
      OnClick = dxBarLargeButton1Click
      AutoGrayScale = False
      HotGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF0022212300534E5700FF00FF0041353800A4676900A5686B007A494A005A35
        35008B555500804E4E0091595900965D5D008B565600734747008C5757009560
        6000AA6E6E00A96D6D00A76C6C00A66B6B008C5B5B0091606000B77A7A00B679
        7900B87B7B00BB7E7E00BA7D7D009C696900CB8C8C00CA8B8B00C98B8B00C78A
        8A00CC8E8E00DA9A9A00D9999900C2898900D99A9A00DC9D9D00E1A1A100DA9C
        9C00E2A3A300EBAAAA00E2A4A400E1A3A300643B3A00734847007B504F005D38
        360093656000E2D0CE009566600093655F009869630084544C009F675B009E6E
        6400A3726600DDC7C200FBF7F6009D6D5F00865D51007350460062443C00A775
        68009F6F6000AC796900583F3700533C3500DDC4BC0096695A00B17E6B00FFFC
        FB00BB846E00B6816C00BCA19600DAC0B600BBA19600CB917300C58C7000C089
        6F00FCF8F600FAF6F400CF8E6800D4987500CF967400F6EEE900F8F3F000AA78
        56003C383500FEF7F200ECD5C200E1CCBB003E3935006A554200F2E2D300FAEE
        E300F4EAE100B77D460066523F0064513E0065524000EFDAC500F2E6DA00FBF2
        E900FEF7F000FDF8F300EAB2730062503D00604F3D00EED4B800F0DAC200F6E3
        CE00F0DECB00F7E6D300F4E3D000F8EEE300FBF3EA00EFA75100EDB57200EAB4
        7400F2D5B100E9CCAB00F4DEC500F4E1CA00F3E0CA00F7E7D400FAEAD700F8EA
        D900F7EADA00F8EBDC008E745100E5BC8400A4865F00B29268009E835F00E1BB
        88006C594100897253006A5841008E775900DEBB8C00AA8F6B00C6A67E007764
        4C00E1C09300C1A57F00836F5600E6C79D00C9AD89008C796000EDCEA700D9BD
        9900E6CEAF00F2DABC00EAD4B600F4DEC000AC9D8A00F6E1C600F7E5CE00F6E6
        D100F8EBDA00FAEEDE00FBF2E600E1B77900EABF7F00CCA66E00E9BD7F00E7BC
        7E00E5BB7D00DEB57900DAB17700D9B17600E3BA7D00D1AB7300C09C6900A989
        5D009A7E5500E7BC8100E1B77D00C7A36F00BC996900B2916300D1AB7500826C
        4B00987D5800DAB47F00C7A474007B664800B89A6F007E694C00766347006F5D
        4300D1AF7F009D876700F0D8B700EBD8BD00FCF6ED00FCF7F000E3BA7B00FEFB
        F600FFFAEF00FFFEFB00FFFEF700FFFFFE003A494800748686003443440000BD
        FF0000B1F2004E6C760000AAEA0000A6E600009FDE000093D100097BAB001A3E
        4D000087C4000084C100028AC4000B4159000C3C5200113B4E00008CD100036A
        9D0004689A000459830005679800064F7500182A33001B506E00315065003547
        56002A34400041485500012BA700001C9D002D4FF6005270FC00021DB100031E
        B1000420B8000725DC000F2ECC001839E3000C21BF00010D9D001322BD001624
        BF0001099700010A9700050DA50000058F00000082001F1F2100040404040404
        0404040404040404040404040404040404043506060606060606060606060606
        06060606060404040404356F9B7A9895928E8985B3A9A8A8A8A8A6A942040404
        0404355C9DC47B99969390C2BBB4AEA9A8A8A6A942040404040435679F9B9A02
        5E97C38FBEBCB8ABAAA9A6A94204040404043272A07C9C5AFFE6D0948D8887B5
        ADAEA9A942040404040434608071709EDFE2E5DECE918B86B6AFA5C842040404
        04043668A37F7DC5D9E1E4E7EA055FBFBAB7A7AC3D04040404043962A483737E
        CFE3E811120D2E66C084B1B04704040404043A57C675827372DD16221B120D2E
        65C1B9B23E04040404044158C9767583A1D31D271E1C130C096D8CBD3F040404
        04044353CD6B6975A274302C271E1C1310096E8A400404040404485301CB6A76
        61815D302A271F1A140E09644404040404044B530101495B7675835D2F2D2920
        1A140E314504040404044A53010101CB5B7661814E2F28232018150A09040404
        0404515301010101CB5B6961A24E2F28262118150A0904040404505301010101
        01496B7675814C172B2421190BEBE90404044F53010101010101CBC769A45C37
        172B2403DCD4D5DA0404563C0101010101010149C7CA4D38591725D8D1D1D5ED
        FE045552010101010101010149CC463879630FD6D1E0EDF7FBFE555201010101
        0101010101013B386C7708D7D2ECF3F2F0FB55CD010101010101010101013338
        78070404DBF6EEF4F1FD54545454545454545454545454380704040404F9EFF5
        FA040404040404040404040404040404040404040404F8FC0404}
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF0022212300534E5700FF00FF0041353800A4676900A5686B007A494A005A35
        35008B555500804E4E0091595900965D5D008B565600734747008C5757009560
        6000AA6E6E00A96D6D00A76C6C00A66B6B008C5B5B0091606000B77A7A00B679
        7900B87B7B00BB7E7E00BA7D7D009C696900CB8C8C00CA8B8B00C98B8B00C78A
        8A00CC8E8E00DA9A9A00D9999900C2898900D99A9A00DC9D9D00E1A1A100DA9C
        9C00E2A3A300EBAAAA00E2A4A400E1A3A300643B3A00734847007B504F005D38
        360093656000E2D0CE009566600093655F009869630084544C009F675B009E6E
        6400A3726600DDC7C200FBF7F6009D6D5F00865D51007350460062443C00A775
        68009F6F6000AC796900583F3700533C3500DDC4BC0096695A00B17E6B00FFFC
        FB00BB846E00B6816C00BCA19600DAC0B600BBA19600CB917300C58C7000C089
        6F00FCF8F600FAF6F400CF8E6800D4987500CF967400F6EEE900F8F3F000AA78
        56003C383500FEF7F200ECD5C200E1CCBB003E3935006A554200F2E2D300FAEE
        E300F4EAE100B77D460066523F0064513E0065524000EFDAC500F2E6DA00FBF2
        E900FEF7F000FDF8F300EAB2730062503D00604F3D00EED4B800F0DAC200F6E3
        CE00F0DECB00F7E6D300F4E3D000F8EEE300FBF3EA00EFA75100EDB57200EAB4
        7400F2D5B100E9CCAB00F4DEC500F4E1CA00F3E0CA00F7E7D400FAEAD700F8EA
        D900F7EADA00F8EBDC008E745100E5BC8400A4865F00B29268009E835F00E1BB
        88006C594100897253006A5841008E775900DEBB8C00AA8F6B00C6A67E007764
        4C00E1C09300C1A57F00836F5600E6C79D00C9AD89008C796000EDCEA700D9BD
        9900E6CEAF00F2DABC00EAD4B600F4DEC000AC9D8A00F6E1C600F7E5CE00F6E6
        D100F8EBDA00FAEEDE00FBF2E600E1B77900EABF7F00CCA66E00E9BD7F00E7BC
        7E00E5BB7D00DEB57900DAB17700D9B17600E3BA7D00D1AB7300C09C6900A989
        5D009A7E5500E7BC8100E1B77D00C7A36F00BC996900B2916300D1AB7500826C
        4B00987D5800DAB47F00C7A474007B664800B89A6F007E694C00766347006F5D
        4300D1AF7F009D876700F0D8B700EBD8BD00FCF6ED00FCF7F000E3BA7B00FEFB
        F600FFFAEF00FFFEFB00FFFEF700FFFFFE003A494800748686003443440000BD
        FF0000B1F2004E6C760000AAEA0000A6E600009FDE000093D100097BAB001A3E
        4D000087C4000084C100028AC4000B4159000C3C5200113B4E00008CD100036A
        9D0004689A000459830005679800064F7500182A33001B506E00315065003547
        56002A34400041485500012BA700001C9D002D4FF6005270FC00021DB100031E
        B1000420B8000725DC000F2ECC001839E3000C21BF00010D9D001322BD001624
        BF0001099700010A9700050DA50000058F00000082001F1F2100040404040404
        0404040404040404040404040404040404043506060606060606060606060606
        06060606060404040404356F9B7A9895928E8985B3A9A8A8A8A8A6A942040404
        0404355C9DC47B99969390C2BBB4AEA9A8A8A6A942040404040435679F9B9A02
        5E97C38FBEBCB8ABAAA9A6A94204040404043272A07C9C5AFFE6D0948D8887B5
        ADAEA9A942040404040434608071709EDFE2E5DECE918B86B6AFA5C842040404
        04043668A37F7DC5D9E1E4E7EA055FBFBAB7A7AC3D04040404043962A483737E
        CFE3E811120D2E66C084B1B04704040404043A57C675827372DD16221B120D2E
        65C1B9B23E04040404044158C9767583A1D31D271E1C130C096D8CBD3F040404
        04044353CD6B6975A274302C271E1C1310096E8A400404040404485301CB6A76
        61815D302A271F1A140E09644404040404044B530101495B7675835D2F2D2920
        1A140E314504040404044A53010101CB5B7661814E2F28232018150A09040404
        0404515301010101CB5B6961A24E2F28262118150A0904040404505301010101
        01496B7675814C172B2421190BEBE90404044F53010101010101CBC769A45C37
        172B2403DCD4D5DA0404563C0101010101010149C7CA4D38591725D8D1D1D5ED
        FE045552010101010101010149CC463879630FD6D1E0EDF7FBFE555201010101
        0101010101013B386C7708D7D2ECF3F2F0FB55CD010101010101010101013338
        78070404DBF6EEF4F1FD54545454545454545454545454380704040404F9EFF5
        FA040404040404040404040404040404040404040404F8FC0404}
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = #1044#1077#1090#1072#1083#1100#1085#1086
      Category = 0
      Hint = #1044#1077#1090#1072#1083#1100#1085#1086
      Visible = ivAlways
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Caption = #1055#1110#1076#1087#1080#1089#1072#1090#1080
      Category = 0
      Hint = #1055#1110#1076#1087#1080#1089#1072#1090#1080
      Visible = ivAlways
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Caption = #1047#1085#1103#1090#1080' '#1087#1110#1076#1087#1080#1089
      Category = 0
      Hint = #1047#1085#1103#1090#1080' '#1087#1110#1076#1087#1080#1089
      Visible = ivAlways
    end
    object dxBarButton2: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarLargeButton5: TdxBarLargeButton
      Caption = #1030#1089#1090#1086#1088#1110#1103' '#1087#1110#1076#1087#1080#1089#1110#1074
      Category = 0
      Hint = #1030#1089#1090#1086#1088#1110#1103' '#1087#1110#1076#1087#1080#1089#1110#1074
      Visible = ivAlways
    end
    object dxBarLargeButton6: TdxBarLargeButton
      Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080
      Category = 0
      Hint = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080
      Visible = ivAlways
      OnClick = dxBarLargeButton6Click
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF00FF00FF0082220300BB490000C14D0000C14F0000BF4D0000BF4E0000BD4C
        0000CF640C00CF671400D76D1600D76E1600D56D1600D76F1700CF6B1A00D774
        2400DC7A2800D77A3000E0833700D8762200DD7D2800DC7B2800E58B3B00E68C
        3C00E78E3D00E68C3D00E18E4600EA984E00EDA16000F0A66500F6AC6A00F4AB
        6900F4AC6900F6AD6B00F4B17400F2A35500F3A45600F3A55600F2A35600F3A5
        5700F4A65900FCB8750000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
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
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020209020202020202030303030303030202
        020202020202020209020202020202031E1D14110B0302020202020202020202
        090909090907050323291A160F03020202020202020202020902020202020203
        0303030303030202020202020202020209020202020202020202020202020202
        0202020202020202090202020202020303030303030302020202020202020202
        0902020202020203222819170C03020202020202020202020909090909080503
        20261B170D030202020202020202020209020202020202030303030303030202
        0202020202020202090202020202020202020202020202020202020202020202
        0902020202020203030303030303020202020202020202020902020202020203
        212519120E0302020202020202020202090909090906040323271A160D030202
        0202020202020202090202020202020303030303030302020202020202020202
        0902020202020202020202020202020202020202020303030303030302020202
        02020202020202020202020202032B2A18150A03020202020202020202020202
        020202020203241F1C1310030202020202020202020202020202020202030303
        0303030302020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202}
    end
    object dxBarLargeButton7: TdxBarLargeButton
      Caption = #1055#1110#1076#1087#1080#1089#1072#1090#1080
      Category = 0
      Hint = #1055#1110#1076#1087#1080#1089#1072#1090#1080
      Visible = ivAlways
      OnClick = dxBarLargeButton7Click
      AutoGrayScale = False
      LargeGlyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0009721300FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000972130009721300FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0093655E00BA8E
        7E00BA8E7E00BB8B7900BB8C7900BB8A7500BB8A7500BB887000BC887000BC89
        7200C48C7700B9846F00097213002EBC550009721300AF816500C28278009E67
        6900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0098696500F7D9
        B700FFE1B900FFD9AF00FFD5A700FFD19E00FFD19E00FFD39100FFD48B00FFD4
        8B00EDBF82000972130021A53F004DE581000973140009741400097414000974
        1400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0098696500F7D9
        BC00FFE0BE00FEDAB500FFD9AF00FFDDA700F4C79C00B79497008974A1008B76
        7E000972130029B750004BE07D0048DC770046D8740031C25B0023A640001789
        2800036C0A00015D0400FF00FF00FF00FF00FF00FF00FF00FF0098696500F8DC
        C400FFE5C700FFE0BE00FFE4B400977E99001F27A700001BDD000019D3000972
        130030BF50004DE27F0048DC770048D9760045D770003FD1660037CC5D0032C6
        550027B541000F801A00015D0400FF00FF00FF00FF00FF00FF0098696500F7E0
        CA00FFE5C700FFEAC1008974A1000111C700001CF700001AFF002659A4000972
        13003FD46C004BE07D0047DA770045D7700041D36A003BCE630032C655002DC0
        4A0028BB42001FB035000D841800015D0400FF00FF00FF00FF0098696500F8E3
        D100FFF7D700A698B6000115CE000021FF000024FF005372FF00E6EBFF00B3CF
        B6000972130039CC620049DD790041D36A0030BB4D001F9D34001B962D001897
        29001AA02D001AAA2D0015A9270008790F00FF00FF00FF00FF0098696500FBEA
        D800FBEAD8003642C0000020FB00001FFF003C5EFF00F6F7FF00D4DEFF00BDC6
        FF00B3CFB6000972130030BB4D003FD76900097213007A864B009E8E5A004360
        2F000162040006740E000D971A000A93140003630600FF00FF009D6E6700FFF3
        E200CFBFCC000A20CA00062FFF000023FF003C5EFF006781FF007D96FF00667B
        FF00C2CBFF00527BB800097213002EBD3D00097213008C777F00E7AC85009966
        6600FF00FF00FF00FF0004670800088E1100046E0900FF00FF00A5756B00FFFF
        EE006F6DBC00011CDC000F39FF000C34FF00032BFF00042AFF009EB2FF00D9E1
        FF00F3F6FF003656FF00011FDD0009721300097213005C5B7F00E0A47F009966
        6600FF00FF00FF00FF00FF00FF0004700A0005750B00FF00FF00A5756B00FFFF
        F3006F6DBC000320DD001640FF000E37FF00133CFF00BDCBFF00FFFFFF00F6F7
        FF005778FF000023FF000023FF000026EE00097213005C5B7F00E0A47F009365
        6300FF00FF00FF00FF00FF00FF0003640600036A0900FF00FF00AB7A6C00FFFE
        F8009796D5000B25D4001A47FF000E37FF005576FF00E6EBFF00CCD8FF006382
        FF00001FFF00032BFF000128FF000026FF000019EB0070639800E6AC7F009163
        6000FF00FF00FF00FF00FF00FF00FF00FF0002600500FF00FF00B17E6B00FEFA
        F600FBF7F6002338D0001843FF00133FFF006382FF00D4DEFF00A1B5FF009EB2
        FF00A3B7FF002348FF00032BFF00032BFF00001AD400B7949700E6AC7F009263
        6000FF00FF00FF00FF00FF00FF00FF00FF00025F0500FF00FF00B9846F00FAF6
        F400FFFFFF008487D1000C2DE300234FFF00234FFF00BDCBFF00FFFFFF00FFFF
        FF00A3B7FF001139FF000C37FF000020E90035359D00FFD5A700D5A68A009163
        6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BC877000FAF6
        F400FFFFFF00F0EEF4003541C0001035EE001A47FF002854FF0091AAFF007B96
        FF001843FF00113EFF00042BF6002430B100CEACA600FFE4B400D5A68A009162
        5E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C28C7400FAF6
        F400FFFFFF00FFFFFF00EAE7F3005F67CC002439D0001035EE000E35F3000C31
        F0000C31F0001028CF00494DB500E5CEBC00FFEAC200FFE1B900D0AA96009162
        5E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C9907500FAF6
        F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCD9EE009796D5006C70CB006C70
        CB008883C200CFC0CC00FFF2D400FFF2D400FFE5C900FFEAC200D0AA96009160
        5E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C9907500FBF7
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFB00FFFF
        F300FFFFEE00E5CEBC00CB9F8F00C6978800C6988800C6988800B68373009365
        5E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D3997700FBF7
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
        F800FFFFFB00CCABA400A4695800CA906600CB8A5400D0823900D0823900FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D59A7700FCF8
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00CCABA400B2796300EEB67000EFA95300EF9C3900FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D59A7700FCF8
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00CEAFA900B0766200EEB67000EFA95300FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D5997700FAF2
        ED00FEFAF800FCF8F600FCF8F600FBF7F600FBF7F600FAF6F400FAF6F400FAF6
        F400FFFFFF00CCABA400B2796300DAA56E00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D3936F00D599
        7700D59A7700D59A7700D3997700CE957600C9907500C28C7400C1887200BC87
        7000B6837300A9746700B17E6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object dxBarLargeButton8: TdxBarLargeButton
      Caption = #1056#1086#1079#1087#1110#1076#1087#1080#1089#1072#1090#1080
      Category = 0
      Hint = #1056#1086#1079#1087#1110#1076#1087#1080#1089#1072#1090#1080
      Visible = ivAlways
      OnClick = dxBarLargeButton8Click
      AutoGrayScale = False
      LargeGlyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002F752800047D
        1100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A87C7800A87C
        7800A87C7800A87C7800A87C7800A87C7800A87C7800A87C7800A87C7800A87C
        7800A87C7800A87C7800A87C7800A87C7800A87C7800A87C780005710A0019AC
        390005710A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AA7F7A00FAE2
        C900FFEACA00FFE3C300FFE0BA00FFDDB400FFE0AB00FFE0AB00FFDB9C00FFD5
        9D00FFDB9C00FFD8A200FFD59D00E6C28700ADAE68007EA2510005710A002BBC
        4E0035C2530005710A00FF00FF00FF00FF00FF00FF00FF00FF00AA7F7A00FAE2
        C900FEE7CD00FFE3C300FFE0BE00FFE5B900DEBBA9009A83A4006B63AC00605B
        AF007967AD00A49879006B9A43002C9A350026AA42002BBC4E0036C45B003CC9
        5D003AC95B0035C2530005710A00FF00FF00FF00FF00FF00FF00AA7F7A00F9E6
        D300FFE9D200FFEACA00FFE9C200AC97B2000A2CB100001DDF000026FC00002D
        FF000A2CB1000C7B22002DBB510049D876004AD7730046D36C0041CE66003ECA
        61003BC85C003AC95B0035C35400158D2300FF00FF00FF00FF00AA7F7A00F9E6
        D300FDECDA00FEE7CD00716BB4000221D800002FFF000028FF004F6FFF007CA5
        AC001D943D0050DB770055E0840050DA7B004ED978004AD7730046D36C0041CE
        66003ECA61003CC95D003CCC5E002AAC420005710A00FF00FF00AA807B00FDEC
        DA00FFFBE400A298C100001DDF000032FF00002AFF006583FC00D0D5D8002B93
        290052DD7C005CE88E0053DE780046CF5D0039BD45002DB6460033BE580045CF
        690041CE660041CF650026A63E0008750E00FF00FF00FF00FF00AA817C00FCEF
        E100FFF1E000434FC6000031FC000032FF001E4BFF00EAEAFB007EB47E002EB2
        4D0055E084002FAE460018814C00065C7500004A81003F685C004592330036C4
        5B004AD872002AAC420005710A00FF00FF00FF00FF00FF00FF00AF857E00FDF4
        E900D0D5D8001234DC001246FF00093DFF002752FF006583FC00238E56004DDA
        750039A543007CA5AC000938F300002DFF000028FF005549CD0085A155002DBB
        510026A63E0003700800FF00FF00FF00FF00FF00FF00FF00FF00B4898000FFFD
        EF00B9B6DB00133BE700194CFF001549FE000C3FFF00002FEC00238E56002FAE
        4600B9D8A10095A6FF00002AFF000032FF000032FF00303AD20075954E00047D
        110005710A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BA8C8100FFFE
        F600B9B6DB00183FE8002153FF001C4EFF001848FF00839EEF002C9A35002587
        3C00839EEF00133FFF00002FFF000032FF000031FF00303AD200829955000571
        0A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BC918300FFFE
        F600D5D9F7002744DB00285CFF002153FF00416BFF00EBF1F800248719001D6C
        6D001246FF001041FF000639FF000236FF00002DFF00434ABD00F4CC9B00C293
        8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C2938400FEFB
        F800FCFAFB004354D5002659FF00285AFF00416BFF00EBF1F800459233005792
        9600EAEAFB007E9BFF000236FF00093DFF000026F2007D70AC00FFE0AB00BE92
        8300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C5988600FBF8
        F700FFFFFF00A5A7E000163BE3003064FF002B5CFF0088A3FF008EBE9700CDE5
        C700D5D9F7003460FF001246FF000C3FFF001C33C900DEBFB000FFDDB400BD92
        8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CB9D8900FBF8
        F700FFFFFF00FFFFFE00777ACF001234DC003064FF002A5FFF005C82FF007E9B
        FF002659FF001E53FF001549FE00051EC400AC97B200FFEBBF00FFDDB400BD93
        8600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CDA08900FCF9
        F700FFFFFF00FFFFFF00FFFEFC009397DB002744DB002048EB001646F5000E41
        F6001646F500173CE3003B4AC800BBA9BF00FFEACA00FFE3C300FFE0BE00BE95
        8900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2A38B00FCF9
        F700FFFFFF00FFFFFF00FFFFFF00FFFFFE00EAEAFB00B7B6E2008488D7008488
        D7008E8ECF00C1B6D000F6E5D600FFF2D500FEE7CD00FDE3C800FCDFC200BE95
        8900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D7A78C00FCF9
        F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFF
        F900FFFFF300FFFBE400BE908500BE908500BF918600BE908500BE908500AF81
        7500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DCAC8E00FCF9
        F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
        FC00FFFEF600FDF4E900BA8C8100CE9F7E00D7A27400D99C5F00DD984C00C186
        5800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DEAD8E00FDFA
        F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFE00FBF5F000BF928700E6BB8B00F6C07600F8B35200C1865800FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DEAD8E00FDFA
        F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FBF8F700BF938800E5B98900F2BE7500C1865800FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DEAD8E00FBF5
        F000FEFBFA00FDFAF800FDFAF800FCF9F800FCF9F800FCF9F700FCF9F700FBF8
        F700FCF9F800F7F1F000BF928700E5B98900C1865800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DCA88700DEAD
        8E00DEAD8E00DEAD8E00DCAC8E00D9A98C00D4A58B00D2A38B00CB9D8900C89B
        8700C4978600BE918300BA897C00C1865800FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
  end
  object DataSet6: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 20
    Top = 321
    poSQLINT64ToBCD = True
  end
  object DataSet7: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 52
    Top = 337
    poSQLINT64ToBCD = True
  end
  object DataSource6: TDataSource
    DataSet = DataSet6
    Left = 68
    Top = 385
  end
  object DataSource7: TDataSource
    DataSet = DataSet7
    Left = 108
    Top = 385
  end
  object SysInfo: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 36
    Top = 450
    poSQLINT64ToBCD = True
  end
  object GDataSet7: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 188
    Top = 370
    poSQLINT64ToBCD = True
  end
  object GDataSource7: TDataSource
    DataSet = GDataSet7
    Left = 228
    Top = 370
  end
  object TypeStavkaDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 444
    Top = 406
    poSQLINT64ToBCD = True
  end
  object TypeStavkaDataSource: TDataSource
    DataSet = TypeStavkaDataSet
    Left = 476
    Top = 406
  end
end
