object fmSpSotr: TfmSpSotr
  Left = 286
  Top = 207
  Width = 994
  Height = 755
  Caption = #1044#1072#1085#1110' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCanResize = FormCanResize
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 46
    Width = 978
    Height = 671
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 4
    object PageControl1: TPageControl
      Left = 17
      Top = 145
      Width = 1013
      Height = 280
      ActivePage = TabSheetRmoving
      MultiLine = True
      Style = tsButtons
      TabOrder = 0
      OnChange = PageControl1Change
      object TabSheetRmoving: TTabSheet
        Caption = 'RMoving'
        ImageIndex = 1
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 1005
          Height = 233
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Panel2'
          TabOrder = 0
          object PanelDetailGrid: TPanel
            Left = 0
            Top = 0
            Width = 201
            Height = 233
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object DetailGrid: TcxGrid
              Left = 0
              Top = 0
              Width = 201
              Height = 233
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              TabOrder = 0
              object DetailGridDBTableView1: TcxGridDBTableView
                DataController.DataSource = DSourceDetail
                DataController.Filter.Criteria = {FFFFFFFF0000000000}
                DataController.KeyFieldNames = 'RMOVING'
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                NavigatorButtons.ConfirmDelete = False
                OnFocusedRecordChanged = DetailGridDBTableView1FocusedRecordChanged
                OptionsBehavior.IncSearch = True
                OptionsCustomize.ColumnFiltering = False
                OptionsCustomize.ColumnGrouping = False
                OptionsCustomize.ColumnMoving = False
                OptionsData.Deleting = False
                OptionsSelection.CellSelect = False
                OptionsView.CellAutoHeight = True
                OptionsView.ColumnAutoWidth = True
                OptionsView.ExpandButtonsForEmptyDetails = False
                OptionsView.GroupByBox = False
                OptionsView.HeaderAutoHeight = True
                object Grid2ClRMoving: TcxGridDBColumn
                  Caption = #1058#1080#1087' '#1090#1088'.'#1091#1075#1086#1076#1080
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Width = 62
                  DataBinding.FieldName = 'name_short'
                end
                object Grid2ClPeriodBeg: TcxGridDBColumn
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Width = 71
                  DataBinding.FieldName = 'DATE_BEG'
                end
                object Grid2ClPeriodEnd: TcxGridDBColumn
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  SortOrder = soDescending
                  Width = 68
                  DataBinding.FieldName = 'DATE_END'
                end
              end
              object DetailGridLevel1: TcxGridLevel
                GridView = DetailGridDBTableView1
              end
            end
          end
          object Panel6: TPanel
            Left = 721
            Top = 0
            Width = 284
            Height = 233
            Align = alRight
            TabOrder = 1
            object PageControl3: TPageControl
              Left = 1
              Top = 1
              Width = 282
              Height = 231
              ActivePage = TabSheet1
              Align = alClient
              TabOrder = 0
              object TabSheet2: TTabSheet
                Caption = #1060#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
                ImageIndex = 1
                object cxGrid3: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 274
                  Height = 203
                  Align = alClient
                  TabOrder = 0
                  object cxGridDBBandedTableView1: TcxGridDBBandedTableView
                    DataController.DataSource = SmetaDataSource
                    DataController.DetailKeyFieldNames = 'RMOVING'
                    DataController.Filter.Criteria = {FFFFFFFF0000000000}
                    DataController.MasterKeyFieldNames = 'RMOVING'
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
                    OptionsCustomize.ColumnFiltering = False
                    OptionsSelection.CellSelect = False
                    OptionsView.CellAutoHeight = True
                    OptionsView.ColumnAutoWidth = True
                    OptionsView.GroupByBox = False
                    OptionsView.HeaderAutoHeight = True
                    OptionsView.Indicator = True
                    OptionsView.BandHeaders = False
                    Bands = <
                      item
                        Width = 127
                      end>
                    object cxGridDBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn
                      Caption = #1041#1102#1076#1078#1077#1090
                      PropertiesClassName = 'TcxTextEditProperties'
                      Properties.Alignment.Horz = taCenter
                      Properties.Alignment.Vert = taVCenter
                      HeaderAlignmentHorz = taCenter
                      HeaderAlignmentVert = vaCenter
                      Position.BandIndex = 0
                      Position.ColIndex = 0
                      Position.RowIndex = 0
                      DataBinding.FieldName = 'kod_sm'
                    end
                    object cxGridDBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn
                      Caption = #1057#1090#1072#1074#1082#1072
                      PropertiesClassName = 'TcxTextEditProperties'
                      Properties.Alignment.Horz = taCenter
                      Properties.Alignment.Vert = taVCenter
                      HeaderAlignmentHorz = taCenter
                      HeaderAlignmentVert = vaCenter
                      Position.BandIndex = 0
                      Position.ColIndex = 1
                      Position.RowIndex = 0
                      DataBinding.FieldName = 'kol_stavok'
                    end
                    object cxGridDBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn
                      Caption = #1057#1091#1084#1072
                      PropertiesClassName = 'TcxTextEditProperties'
                      Properties.Alignment.Horz = taRightJustify
                      Properties.Alignment.Vert = taVCenter
                      HeaderAlignmentHorz = taCenter
                      HeaderAlignmentVert = vaCenter
                      Position.BandIndex = 0
                      Position.ColIndex = 2
                      Position.RowIndex = 0
                      DataBinding.FieldName = 'oklad_base'
                    end
                    object cxGridDBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn
                      Caption = #1041#1102#1076#1078#1077#1090' '#1050#1055#1054
                      PropertiesClassName = 'TcxTextEditProperties'
                      Properties.Alignment.Horz = taCenter
                      Properties.Alignment.Vert = taVCenter
                      HeaderAlignmentHorz = taCenter
                      HeaderAlignmentVert = vaCenter
                      Position.BandIndex = 0
                      Position.ColIndex = 3
                      Position.RowIndex = 0
                      DataBinding.FieldName = 'kod_sm_pps'
                    end
                    object cxGridDBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn
                      Caption = #1057#1091#1084#1072' '#1050#1055#1054
                      PropertiesClassName = 'TcxTextEditProperties'
                      Properties.Alignment.Horz = taRightJustify
                      Properties.Alignment.Vert = taVCenter
                      HeaderAlignmentHorz = taCenter
                      HeaderAlignmentVert = vaCenter
                      Position.BandIndex = 0
                      Position.ColIndex = 4
                      Position.RowIndex = 0
                      DataBinding.FieldName = 'oklad_pps'
                    end
                  end
                  object cxGridLevel4: TcxGridLevel
                    GridView = cxGridDBBandedTableView1
                  end
                end
              end
              object TabSheet1: TTabSheet
                Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1086' '#1091#1075#1086#1076#1110
                object Panel10: TPanel
                  Left = 0
                  Top = 0
                  Width = 274
                  Height = 203
                  Align = alClient
                  Color = 15451300
                  TabOrder = 0
                  object LabelCategor: TcxLabel
                    Left = 22
                    Top = 3
                    Width = 64
                    Height = 17
                    AutoSize = False
                    ParentFont = False
                    Properties.Alignment.Horz = taRightJustify
                    TabOrder = 0
                    Caption = 'LabelCategor'
                  end
                  object EditRazryad: TcxDBMaskEdit
                    Left = 94
                    Top = 3
                    Width = 178
                    Height = 21
                    DataBinding.DataField = 'name_category'
                    DataBinding.DataSource = DSourceBanded
                    ParentFont = False
                    Properties.ReadOnly = True
                    Style.Font.Charset = DEFAULT_CHARSET
                    Style.Font.Color = clWindowText
                    Style.Font.Height = -11
                    Style.Font.Name = 'MS Sans Serif'
                    Style.Font.Style = [fsBold]
                    TabOrder = 1
                  end
                  object LabelDepartment: TcxLabel
                    Left = 18
                    Top = 27
                    Width = 72
                    Height = 17
                    AutoSize = False
                    ParentFont = False
                    Properties.Alignment.Horz = taRightJustify
                    TabOrder = 2
                    Caption = 'LabelDepartment'
                  end
                  object EditDepartment: TcxDBMaskEdit
                    Left = 93
                    Top = 26
                    Width = 179
                    Height = 21
                    DataBinding.DataField = 'DEP_NAME'
                    DataBinding.DataSource = DSourceBanded
                    ParentFont = False
                    Properties.ReadOnly = True
                    Style.Font.Charset = DEFAULT_CHARSET
                    Style.Font.Color = clWindowText
                    Style.Font.Height = -11
                    Style.Font.Name = 'MS Sans Serif'
                    Style.Font.Style = [fsBold]
                    TabOrder = 3
                  end
                  object LabelPrikaz: TcxLabel
                    Left = 23
                    Top = 50
                    Width = 67
                    Height = 17
                    AutoSize = False
                    ParentFont = False
                    Properties.Alignment.Horz = taRightJustify
                    TabOrder = 4
                    Caption = 'LabelPrikaz'
                  end
                  object EditPrikaz: TcxDBMaskEdit
                    Left = 93
                    Top = 48
                    Width = 179
                    Height = 21
                    DataBinding.DataField = 'ORDER_TEXT'
                    DataBinding.DataSource = DSourceBanded
                    ParentFont = False
                    Properties.ReadOnly = True
                    Style.Font.Charset = DEFAULT_CHARSET
                    Style.Font.Color = clWindowText
                    Style.Font.Height = -11
                    Style.Font.Name = 'MS Sans Serif'
                    Style.Font.Style = [fsBold]
                    TabOrder = 5
                  end
                  object cxLabel1: TcxLabel
                    Left = 3
                    Top = 72
                    Width = 89
                    Height = 17
                    AutoSize = False
                    ParentFont = False
                    Properties.Alignment.Horz = taRightJustify
                    TabOrder = 6
                    Caption = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
                  end
                  object cxDBMaskEdit1: TcxDBMaskEdit
                    Left = 93
                    Top = 69
                    Width = 179
                    Height = 21
                    DataBinding.DataField = 'name_type_post'
                    DataBinding.DataSource = DSourceBanded
                    ParentFont = False
                    Properties.ReadOnly = True
                    Style.Font.Charset = DEFAULT_CHARSET
                    Style.Font.Color = clWindowText
                    Style.Font.Height = -11
                    Style.Font.Name = 'MS Sans Serif'
                    Style.Font.Style = [fsBold]
                    TabOrder = 7
                  end
                end
              end
            end
          end
          object cxSplitter2: TcxSplitter
            Left = 713
            Top = 0
            Width = 8
            Height = 233
            HotZoneClassName = 'TcxMediaPlayer9Style'
            AlignSplitter = salRight
            Control = Panel6
          end
          object Panel7: TPanel
            Left = 201
            Top = 0
            Width = 512
            Height = 233
            Align = alClient
            TabOrder = 3
            object DetailGridBanded: TcxGrid
              Left = 9
              Top = 1
              Width = 502
              Height = 231
              Align = alClient
              TabOrder = 0
              object DetailGridDBBandedTableView1: TcxGridDBBandedTableView
                DataController.DataSource = DSourceBanded
                DataController.DetailKeyFieldNames = 'RMOVING'
                DataController.Filter.Criteria = {FFFFFFFF0000000000}
                DataController.KeyFieldNames = 'NUM'
                DataController.MasterKeyFieldNames = 'RMOVING'
                DataController.Summary.DefaultGroupSummaryItems = <
                  item
                    Format = #1057#1090#1072#1074#1082#1080': 0.00'
                    Kind = skSum
                    FieldName = 'KOL_STAVOK'
                    Column = Grid22ClStavka
                  end>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                NavigatorButtons.ConfirmDelete = False
                OptionsBehavior.CellHints = True
                OptionsCustomize.ColumnFiltering = False
                OptionsSelection.CellSelect = False
                OptionsView.CellAutoHeight = True
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                OptionsView.Indicator = True
                OptionsView.BandHeaders = False
                Bands = <
                  item
                    Options.Sizing = False
                    Width = 60
                  end
                  item
                    Width = 412
                  end
                  item
                    Options.Sizing = False
                    Visible = False
                    Width = 60
                  end
                  item
                    Options.Sizing = False
                    Visible = False
                    Width = 50
                  end>
                object Grid22ClManMoving: TcxGridDBBandedColumn
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  Visible = False
                  Position.BandIndex = 1
                  Position.ColIndex = 0
                  Position.LineCount = 2
                  Position.RowIndex = 0
                  DataBinding.FieldName = 'ID_MAN_MOVING'
                end
                object Grid22ClDateBeg: TcxGridDBBandedColumn
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  MinWidth = 60
                  Options.HorzSizing = False
                  Options.VertSizing = False
                  Width = 60
                  Position.BandIndex = 0
                  Position.ColIndex = 0
                  Position.RowIndex = 1
                  DataBinding.FieldName = 'DATE_BEG'
                end
                object Grid22ClRealDateEnd: TcxGridDBBandedColumn
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  MinWidth = 60
                  Options.HorzSizing = False
                  Options.VertSizing = False
                  SortOrder = soAscending
                  Width = 60
                  Position.BandIndex = 0
                  Position.ColIndex = 0
                  Position.RowIndex = 0
                  DataBinding.FieldName = 'REAL_END'
                end
                object Grid22ClNameSovmest: TcxGridDBBandedColumn
                  Caption = #1058#1080#1087' '#1090#1088'.'#1091#1075#1086#1076#1080
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  Properties.MaxLength = 0
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Width = 113
                  Position.BandIndex = 1
                  Position.ColIndex = 1
                  Position.LineCount = 2
                  Position.RowIndex = 0
                  DataBinding.FieldName = 'NAME_SOVMEST'
                end
                object Grid22ClNamePost: TcxGridDBBandedColumn
                  Caption = #1055#1086#1089#1072#1076#1072
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Options.Filtering = False
                  Width = 168
                  Position.BandIndex = 1
                  Position.ColIndex = 2
                  Position.LineCount = 2
                  Position.RowIndex = 0
                  DataBinding.FieldName = 'VPOST'
                end
                object Grid22ClStavka: TcxGridDBBandedColumn
                  Caption = #1057#1090#1072#1074#1082#1072
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  MinWidth = 50
                  Options.HorzSizing = False
                  Width = 50
                  Position.BandIndex = 1
                  Position.ColIndex = 3
                  Position.LineCount = 2
                  Position.RowIndex = 0
                  DataBinding.FieldName = 'KOL_STAVOK'
                end
                object Grid22ClKodSmBase: TcxGridDBBandedColumn
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentVert = vaCenter
                  MinWidth = 50
                  Options.HorzSizing = False
                  Width = 50
                  Position.BandIndex = 3
                  Position.ColIndex = 0
                  Position.RowIndex = 0
                  DataBinding.FieldName = 'KOD_SM'
                  IsCaptionAssigned = True
                end
                object Grid22ClOkladBase: TcxGridDBBandedColumn
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentVert = vaCenter
                  MinWidth = 60
                  Options.HorzSizing = False
                  Width = 60
                  Position.BandIndex = 2
                  Position.ColIndex = 0
                  Position.RowIndex = 0
                  DataBinding.FieldName = 'OKLAD_BASE'
                  IsCaptionAssigned = True
                end
                object Grid22ClKodSmPPS: TcxGridDBBandedColumn
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentVert = vaCenter
                  MinWidth = 50
                  Options.HorzSizing = False
                  Width = 50
                  Position.BandIndex = 3
                  Position.ColIndex = 0
                  Position.RowIndex = 1
                  DataBinding.FieldName = 'KOD_SM_PPS'
                  IsCaptionAssigned = True
                end
                object Grid22ClOkladPPS: TcxGridDBBandedColumn
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  HeaderAlignmentVert = vaCenter
                  MinWidth = 60
                  Options.HorzSizing = False
                  Width = 60
                  Position.BandIndex = 2
                  Position.ColIndex = 0
                  Position.RowIndex = 1
                  DataBinding.FieldName = 'OKLAD_PPS'
                  IsCaptionAssigned = True
                end
                object DetailGridDBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn
                  Caption = #1055#1077#1088#1077#1084#1110#1097#1077#1085#1085#1103
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  Visible = False
                  Position.BandIndex = 1
                  Position.ColIndex = 4
                  Position.RowIndex = 0
                  DataBinding.FieldName = 'GR_STR'
                end
              end
              object DetailGridLevel4: TcxGridLevel
                GridView = DetailGridDBBandedTableView1
              end
            end
            object cxSplitter3: TcxSplitter
              Left = 1
              Top = 1
              Width = 8
              Height = 231
              HotZoneClassName = 'TcxMediaPlayer9Style'
              MinSize = 200
              Control = PanelDetailGrid
            end
          end
        end
      end
    end
    object PeopleGrid: TcxGrid
      Left = 1
      Top = 1
      Width = 976
      Height = 429
      Align = alClient
      BorderStyle = cxcbsNone
      TabOrder = 1
      object PeopleGridDBTableView1: TcxGridDBTableView
        OnKeyPress = PeopleGridDBTableView1KeyPress
        DataController.DataSource = DSourceMain
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnGrouping = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        object cmnID_MAN: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 57
          DataBinding.FieldName = 'OUT_ID_MAN'
        end
        object cmnID_PCARD: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 47
          DataBinding.FieldName = 'OUT_ID_PCARD'
        end
        object cmnTN: TcxGridDBColumn
          Caption = 'cmnTN'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Grouping = False
          SortOrder = soAscending
          Width = 90
          DataBinding.FieldName = 'OUT_TN'
        end
        object cmnFIO: TcxGridDBColumn
          Caption = 'cmnFIO'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Grouping = False
          Width = 451
          DataBinding.FieldName = 'OUT_FIO'
        end
        object cmnTin: TcxGridDBColumn
          Caption = #1030#1053#1053
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 179
          DataBinding.FieldName = 'OUT_TIN'
        end
        object cmnBDate: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 256
          DataBinding.FieldName = 'OUT_BIRTH_DATE'
        end
        object cmnSex: TcxGridDBColumn
          Caption = #1057#1090#1072#1090#1100
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 151
          DataBinding.FieldName = 'sex_short_name'
        end
        object use_email: TcxGridDBColumn
          Caption = #1056#1086#1079#1089#1080#1083#1082#1072
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 151
          DataBinding.FieldName = 'use_email_text'
        end
      end
      object PeopleGridLevel1: TcxGridLevel
        GridView = PeopleGridDBTableView1
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 471
      Width = 976
      Height = 179
      Align = alBottom
      Caption = 'Panel3'
      TabOrder = 2
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 248
        Height = 177
        Align = alLeft
        Caption = 'Panel4'
        TabOrder = 0
        object DetailGrid_: TcxGrid
          Left = 1
          Top = 1
          Width = 246
          Height = 175
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          TabOrder = 0
          object DetailGrid_DBTableView1: TcxGridDBTableView
            DataController.DataSource = DSourceDetail
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.KeyFieldNames = 'RMOVING'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OnFocusedRecordChanged = DetailGridDBTableView1FocusedRecordChanged
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsData.Deleting = False
            OptionsSelection.CellSelect = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.ExpandButtonsForEmptyDetails = False
            OptionsView.GroupByBox = False
            OptionsView.HeaderAutoHeight = True
            object cxGridDBColumn1: TcxGridDBColumn
              Caption = #1058#1080#1087' '#1090#1088'.'#1091#1075#1086#1076#1080
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 62
              DataBinding.FieldName = 'name_short'
            end
            object cxGridDBColumn2: TcxGridDBColumn
              Caption = #1047
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 71
              DataBinding.FieldName = 'DATE_BEG'
            end
            object cxGridDBColumn3: TcxGridDBColumn
              Caption = #1055#1086
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              SortOrder = soDescending
              Width = 68
              DataBinding.FieldName = 'DATE_END'
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = DetailGrid_DBTableView1
          end
        end
      end
      object Panel5: TPanel
        Left = 706
        Top = 1
        Width = 269
        Height = 177
        Align = alRight
        Color = 15451300
        TabOrder = 1
        object Label1: TLabel
          Left = 48
          Top = 8
          Width = 187
          Height = 13
          Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1086' '#1091#1075#1086#1076#1110
          Color = 12937777
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object cxLabel2: TcxLabel
          Left = 22
          Top = 35
          Width = 64
          Height = 17
          AutoSize = False
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          TabOrder = 0
          Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
        end
        object cxLabel3: TcxLabel
          Left = 10
          Top = 59
          Width = 72
          Height = 17
          AutoSize = False
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          TabOrder = 1
          Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
        end
        object cxLabel4: TcxLabel
          Left = 15
          Top = 82
          Width = 67
          Height = 17
          AutoSize = False
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          TabOrder = 2
          Caption = #1053#1072#1082#1072#1079
        end
        object cxLabel5: TcxLabel
          Left = 3
          Top = 104
          Width = 86
          Height = 17
          AutoSize = False
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          TabOrder = 3
          Caption = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
        end
        object cxDBMaskEdit2: TcxDBMaskEdit
          Left = 82
          Top = 35
          Width = 183
          Height = 21
          DataBinding.DataField = 'name_category'
          DataBinding.DataSource = DSourceBanded
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 4
        end
        object cxDBMaskEdit3: TcxDBMaskEdit
          Left = 85
          Top = 58
          Width = 179
          Height = 21
          DataBinding.DataField = 'DEP_NAME'
          DataBinding.DataSource = DSourceBanded
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 5
        end
        object cxDBMaskEdit4: TcxDBMaskEdit
          Left = 85
          Top = 80
          Width = 179
          Height = 21
          DataBinding.DataField = 'ORDER_TEXT'
          DataBinding.DataSource = DSourceBanded
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 6
        end
        object cxDBMaskEdit5: TcxDBMaskEdit
          Left = 85
          Top = 101
          Width = 179
          Height = 21
          DataBinding.DataField = 'name_type_post'
          DataBinding.DataSource = DSourceBanded
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 7
        end
      end
      object Panel8: TPanel
        Left = 257
        Top = 1
        Width = 441
        Height = 177
        Align = alClient
        Caption = 'Panel8'
        TabOrder = 2
        object DetailGridBanded_: TcxGrid
          Left = 1
          Top = 1
          Width = 439
          Height = 175
          Align = alClient
          TabOrder = 0
          object DetailGridDBBandedTableView1_: TcxGridDBBandedTableView
            DataController.DataSource = DSourceBanded
            DataController.DetailKeyFieldNames = 'RMOVING'
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.KeyFieldNames = 'NUM'
            DataController.MasterKeyFieldNames = 'RMOVING'
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
            OptionsCustomize.ColumnFiltering = False
            OptionsSelection.CellSelect = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            OptionsView.BandHeaders = False
            Bands = <
              item
                Options.Sizing = False
                Width = 60
              end
              item
                Width = 412
              end
              item
                Options.Sizing = False
                Visible = False
                Width = 60
              end
              item
                Options.Sizing = False
                Visible = False
                Width = 50
              end>
            object cxGridDBBandedColumn1: TcxGridDBBandedColumn
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Visible = False
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'ID_MAN_MOVING'
            end
            object cxGridDBBandedColumn2: TcxGridDBBandedColumn
              Caption = #1047
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 60
              Options.HorzSizing = False
              Options.VertSizing = False
              Width = 60
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 1
              DataBinding.FieldName = 'DATE_BEG'
            end
            object cxGridDBBandedColumn3: TcxGridDBBandedColumn
              Caption = #1055#1086
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 60
              Options.HorzSizing = False
              Options.VertSizing = False
              Width = 60
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
              DataBinding.FieldName = 'REAL_END'
            end
            object cxGridDBBandedColumn4: TcxGridDBBandedColumn
              Caption = #1058#1080#1087' '#1090#1088'.'#1091#1075#1086#1076#1080
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.MaxLength = 0
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 113
              Position.BandIndex = 1
              Position.ColIndex = 1
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'NAME_SOVMEST'
            end
            object cxGridDBBandedColumn5: TcxGridDBBandedColumn
              Caption = #1055#1086#1089#1072#1076#1072
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              SortOrder = soAscending
              Width = 168
              Position.BandIndex = 1
              Position.ColIndex = 2
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'VPOST'
            end
            object cxGridDBBandedColumn7: TcxGridDBBandedColumn
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 50
              Options.HorzSizing = False
              Width = 50
              Position.BandIndex = 3
              Position.ColIndex = 0
              Position.RowIndex = 0
              DataBinding.FieldName = 'KOD_SM'
              IsCaptionAssigned = True
            end
            object cxGridDBBandedColumn8: TcxGridDBBandedColumn
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 60
              Options.HorzSizing = False
              Width = 60
              Position.BandIndex = 2
              Position.ColIndex = 0
              Position.RowIndex = 0
              DataBinding.FieldName = 'OKLAD_BASE'
              IsCaptionAssigned = True
            end
            object cxGridDBBandedColumn9: TcxGridDBBandedColumn
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 50
              Options.HorzSizing = False
              Width = 50
              Position.BandIndex = 3
              Position.ColIndex = 0
              Position.RowIndex = 1
              DataBinding.FieldName = 'KOD_SM_PPS'
              IsCaptionAssigned = True
            end
            object cxGridDBBandedColumn10: TcxGridDBBandedColumn
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 60
              Options.HorzSizing = False
              Width = 60
              Position.BandIndex = 2
              Position.ColIndex = 0
              Position.RowIndex = 1
              DataBinding.FieldName = 'OKLAD_PPS'
              IsCaptionAssigned = True
            end
            object cxGridDBBandedColumn11: TcxGridDBBandedColumn
              Caption = #1055#1077#1088#1077#1084#1110#1097#1077#1085#1085#1103
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Visible = False
              Position.BandIndex = 1
              Position.ColIndex = 3
              Position.RowIndex = 0
              DataBinding.FieldName = 'GR_STR'
            end
          end
          object cxGridLevel2: TcxGridLevel
            GridView = DetailGridDBBandedTableView1_
          end
        end
      end
      object cxSplitter4: TcxSplitter
        Left = 249
        Top = 1
        Width = 8
        Height = 177
        HotZoneClassName = 'TcxMediaPlayer9Style'
        MinSize = 200
        Control = Panel4
        OnAfterOpen = cxSplitter4AfterOpen
        OnAfterClose = cxSplitter4AfterClose
      end
      object cxSplitter5: TcxSplitter
        Left = 698
        Top = 1
        Width = 8
        Height = 177
        HotZoneClassName = 'TcxMediaPlayer9Style'
        AlignSplitter = salRight
        Control = Panel5
        OnAfterOpen = cxSplitter5AfterOpen
        OnAfterClose = cxSplitter5AfterClose
      end
    end
    object Panel9: TPanel
      Left = 1
      Top = 438
      Width = 976
      Height = 33
      Align = alBottom
      Caption = #1058#1088#1091#1076#1086#1074#1080#1081' '#1076#1086#1075#1086#1074#1110#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object cxSplitter6: TcxSplitter
      Left = 1
      Top = 430
      Width = 976
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      AlignSplitter = salBottom
      Control = Panel3
      OnAfterOpen = cxSplitter6AfterOpen
      OnAfterClose = cxSplitter6AfterClose
    end
    object dxstsbr1: TdxStatusBar
      Left = 1
      Top = 650
      Width = 976
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        end>
      PaintStyle = stpsOffice11
      LookAndFeel.Kind = lfStandard
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=win1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 72
    Top = 64
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 104
    Top = 64
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 64
  end
  object DSetMain: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '    Z_GET_SOTR_DATA'
      '    ('
      '    NULL,'
      '    NULL,'
      '    NULL,'
      '    NULL,'
      '    NULL,'
      '    NULL,'
      '    NULL'
      '    ) ')
    Left = 104
    Top = 104
    poSQLINT64ToBCD = True
  end
  object DSourceMain: TDataSource
    DataSet = DSetMain
    Left = 136
    Top = 104
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
        Caption = #1055#1072#1085#1077#1083#1100' '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = FilterBtn
            Visible = True
          end
          item
            BeginGroup = True
            Item = ShowAllDataBtn
            Visible = True
          end
          item
            BeginGroup = True
            Item = ExitBtn
            Visible = True
          end>
        Name = 'ControlBar1'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockColor = clBtnFace
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 216
    Top = 104
    DockControlHeights = (
      0
      0
      46
      0)
    object InsertBtn: TdxBarLargeButton
      Category = 0
      Visible = ivNever
      ShortCut = 45
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
        F0D1AAEFCEA3EECB9CEDC796EDC590EBC189E9BF82E9BD7FE9BD7FEABF7FE7BC
        7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2D3FAEAD7F6E3CEF4
        DEC5F3DCBFF2D8B8F0D4B1F0D1AAEFCEA3EECB9DEDC797EDC590EBC189E9BD81
        E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF986963F2E6
        DAFAEEDEF7E7D4F6E2CBF4E0C5F3DCBFF2D8B7F2D5B0F0D1A9EFCEA3EECB9DED
        C796EDC58FEBC189E9BD81EABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FF
        FF00FF9E6E64F4EAE1FBF2E6F8EADCF7E6D3F6E2CCF4E0C6F3DCBFF2D8B7F2D5
        B0F0D1AAEFCEA4EDCB9CEDC796EBC58FEBC188EABF82E7BB7E9F6F60FF00FFFF
        00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3F7EADAF7E6D3F6E2CC
        F4DEC5F3DCBDF2D8B6F0D5B0F0D1AAEFCEA3EECA9CEDC795EBC48EEBC288E7BC
        809F6F60FF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3F0FEFBF6FBF3EBF8
        EEE3F8EBDCF7E7D3F6E2CCF4E0C5F3DCBDF2D8B7F2D4B1F0D1A9EFCEA3EDCB9C
        EDC795EDC58FE9BF879F6F62FF00FFFF00FFFF00FFFF00FFFF00FFAC7969FAF6
        F4FFFFFEFEF8F3FBF2EAF8EEE3F8EBDAF7E6D3F7E2CCF6E0C5F3DCBFF2D8B7F2
        D4B0F0D1AAEFCEA3EECB9CEEC996EAC18EA07063FF00FFFF00FFFF00FFFF00FF
        FF00FFB17E6BFAF6F4FFFFFFFFFEFBFEF7F0FBF3EAFAEFE3F8EADAF7E7D3F6E2
        CBF6E0C5F3DCBFF2D8B6F2D4B0F0D1A9EFCEA1EECB9CEBC592A07264FF00FFFF
        00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFFFFCFBFEF7F2FBF3EB
        F8EEE3F8EBDCF7E6D3F6E3CCF6DEC5F3DCBDF3D8B6F2D4AFF0D1A9F0CFA3EDC9
        999D7065FF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFFFFFFFFFFFF
        FFFFFFFEFBFEF7F2FBF3EAFAEEE3F8EADAF7E6D3F6E2CBF6DEC4F3DABCF2D8B6
        F0D4AFEFD0A7CEB491896A63FF00FFFF00FFFF00FFFF00FFFF00FFC0896FFBF7
        F4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFEF7F2FBF2EAFAEEE2F8EBDAF7E6D3F6
        E2CBF6DEC4F3DCBDE5CEAFC4B096A1927F806762FF00FFFF00FFFF00FFFF00FF
        FF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFCF8F2FBF3
        EAF8EEE2F8EAD9F8E7D4FAE9D0E0D0BAB8AB9AA79C8BA49786846964FF00FFFF
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
    end
    object UpdateBtn: TdxBarLargeButton
      Category = 0
      Visible = ivNever
      ShortCut = 113
      AutoGrayScale = False
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
    object DeleteBtn: TdxBarLargeButton
      Category = 0
      Visible = ivNever
      ShortCut = 46
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
    end
    object DetailBtn: TdxBarLargeButton
      Category = 0
      Visible = ivNever
      ShortCut = 32
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF8E5D598E5D598E5D598E5D598E5D598E5D598E5D59
        8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D
        5980504BFF00FFFF00FFFF00FFFF00FF646365314B62AC7D7EF6DAB6F3D5ADF2
        D1A5F0CE9EEFCB97EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080
        EBC080EDC180EABF7F80504BFF00FFFF00FFFF00FFFF00FF5084B20F6FE1325F
        8CB87E7AF2D5B1F0D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9
        BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FF
        32A0FE37A1FF106FE2325F8BB67D79F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC5
        8FEBC189EABF82E9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF
        00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79F2D4B0F0D1AA
        EFCEA3EECB9CEDC795EDC58FEBC189E9BD81E9BD7FE9BD7FE9BD7FEABF7FE7BC
        7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF93656037A4FE359EFF0F6FDE35
        608BA67B7FF2D5B1F0D1AAEFCEA3EECB9CEDC796EDC590EBC189E9BF82E9BD7F
        E9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2
        D338A5FE329DFF156DCE444F5BDAB8A0925D5A986660935E5B9A6663B88A74D7
        AB82EBC189E9BD81E9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FF
        FF00FF986963F2E6DAFAEEDE3BABFFA1CAE78F6D6B96665FC2A38CE9DCB7FBF8
        CBE7DCB6BF9A899D6B66CB9E7BEBC189E9BD81EABF7FE7BC7E80504BFF00FFFF
        00FFFF00FFFF00FFFF00FF9E6E64F4EAE1FBF2E6F8EADCB49291A06D66EDD4A4
        FFFCCAFFFFCFFFFFCFFFFFD5FFFFEAE3D3CC96635FD5AB82EBC188EABF82E7BB
        7E80504BFF00FFFF00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3A1
        6C67C79F81F6D095FCF4C2FFFFCFFFFFD8FFFFEEFFFFFAFFFFFFB79387B88A73
        EBC48EEBC288E7BC8080504BFF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3
        F0FEFBF6FBF3EB9D6A64E7C28EEEB87FFBF0BDFFFFD0FFFFDCFFFFF7FFFFFAFF
        FFE6DCCEAD996560EDC795EDC58FE9BF8780504BFF00FFFF00FFFF00FFFF00FF
        FF00FFAC7969FAF6F4FFFFFEFEF8F3935F5BF7D495EAA76CF7DAA3FFFFCEFFFF
        D4FFFFE1FFFFE3FFFFD7F6F2C9935E5BEECB9CEEC996EAC18E80504BFF00FFFF
        00FFFF00FFFF00FFFF00FFB17E6BFAF6F4FFFFFFFFFEFB9E6B65E9C793EAA96A
        EFBD80FAE9B4FFFFD0FFFFD3FFFFD1FFFFD1E1D1B0996660EFCEA1EECB9CEBC5
        9280504BFF00FFFF00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFA4
        706BCBA989F8E2B5F0C690F0C286F7DCA5FEF3C1FEF8C6FFFFCFBB9984BB8F7E
        F0D1A9F0CFA3EDC99980504BFF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6
        F4FFFFFFFFFFFFE5D5D5A07068EDE3E2FFF4E2EFBD80EBAB6FF0C086FBDEA3EB
        D9A9986760DAB89FF0D4AFEFD0A7CEB49180504BFF00FFFF00FFFF00FFFF00FF
        FF00FFC0896FFBF7F4FFFFFFFFFFFFFFFFFFD7C0BF9E6F6BC6A999EAD19EFADA
        9CE9C793C59D829D6A64D0AC9CF3DCBDE5CEAFC4B096A1927F80504BFF00FFFF
        00FFFF00FFFF00FFFF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFE5D5D5
        A4766A9A6862935F5B9E6A64BD988FE0C4B5FAE9D0E0D0BAB8AB9AA79C8BA497
        8680504BFF00FFFF00FFFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C49E675B98665B
        95655B96655B96655B986859FF00FFFF00FFFF00FFFF00FFFF00FFCF9674FBF7
        F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDA
        C0B69F675BDAA16BDD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FF
        FF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFCFBFFFEF7DDC4BC9F675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDC7C29F675BEAB273EFA751A5686BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CE9F675BEDB572
        A5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF8E
        68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF
        8E689F675BA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object ShowAvgBtn: TdxBarLargeButton
      Category = 0
      Visible = ivNever
      ShortCut = 121
      OnClick = ShowAvgBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF002F2EFF003736D1004946FE004B49E9003C3AB4003D3CAB00605EE2006362
        E6006968ED007372FE006E6DEA006A69E1006F6EE200362FE000625EE1008F8C
        FB008280B000CFCDFA00ACABCA00AAA9BF00CCC9F8009391B2008F89D300938C
        D400908BBB008B87AB00ADACB400C7C5D300AAA5C000EAE9EE00BAAFCF00D3C9
        DC00FF00FF00C6BCC500744F690086778100FEECF500E3DDDE00FEE8EB00AD69
        6900B4747400AA6D6D00A76B6B00DC989700D9979700D9989800D5959500C78C
        8C00CA909000CE898700CC8C8A005B414000FEE5E40067403D00CEC2C1007335
        2E0068413D00FEE1DE005F3F3800FEDCD500FED8CA00FFFCFB00B2847200AB83
        7300A67E6D00BB4A0000CC580000FFF8F300E7A9700083685000755E4900FFEF
        E100FFF4EA00FFF7F000F6B67500D8A36E00F6BC8300B6926D00E6BD9300FFD5
        AA00FFDDBA00FFDEBC00FFE7CF00FFEBD700FFF7EF00EDB57A00EEB87B00FECB
        9600FBC99500F4C49000E9BB8A00DCB18200D7AC7F00EFC08E00C49E7500F4C6
        9600FED1A000FFD5A700FFD9B100FEDAB200FFDCB600FEDDB800FEDEBB00FFE0
        BE00FEE2C400FEE3C600FFE6CB00FEE5CA00FFEBD500FFEDDA00FFEFDD00FEF0
        E100FEF3E7009A7F5F00FFE2C100FFE5C600FFE6C900FFEAD100FEE9D100FEED
        D900FFF0DE00FEEFDE00FFF2E300FFF3E500FFF4E700FFF8F000FFD09200F4C7
        8C00F7CE9A00FFEFDA00FFF7ED00FFFCF800F8D09800FFFBF500F4CF9600E6DA
        C700FFFAF200FFDCA100E6D5B800A3937300FFFEFC00FAE3AD00DED4BD00EAE2
        CE008F887600BDB08A00887F6500FBEFBA00FFF7C200FFF8C40056544700FFFB
        DA00FFFAC900FEFCCF00FFFFD000D7D7B000FFFFD300FFFFD500AFAF9300FFFF
        D800B5B59900E7E7C700FFFFDD00FFFFEB00FFFFEF00FFFFF300FFFFF400FFFF
        F600FFFFFB0056574C0053602C0037383400535A51001F4A1700236D1800216A
        1800379C2900379C2A0029961C00268C1E003B3C3B002A6C2C00E3EEEB002852
        4C00FCFFFF00C9CACA0077B2B400FAFEFF00109AC1001588AB001E8FB5000E3C
        4C001E566B0004A6ED00055F8E00CBE3EF0035546C00F8FCFF00BBD0E300CEDA
        E5002C2D2E000759CF000024AC001628D5001D2EC900020FA000282DEE003941
        EB00000289001717FF001818FF001B1BFF001C1CFF002626FF002024CD002828
        FB002C2CFE003030FC002F2FF7003333FF003232F4002C2CD5003535FF003737
        FE003838FF003939E5004141FF004242FA003E3EE5004747FF004848FF004444
        E9004242E0004C4DFE004142D4003E3EBB003C3CAD004141BA003E3EA9004C4D
        CE005C5CED005858D9006565F700484AAC006A6AFB004E4FB1005050B2004B4C
        A6007575FF007979FF007A7AC6009797D8000000000000000000222222222222
        2222222222222222222222222222222222222222222222222222222222222222
        2222222222222222222222224343434343434343434343434343434343434343
        2222222243017E7A6E6CB467646362614FB05D5F5A5959432222222243017F4A
        4955B46A68645150CAC1AE735E5B594322222222430185454A71B4546B536551
        92C4C63547605C432222222243B3B4B4B4B4B4B4B4B4B4B4B5B9332A3CAFB143
        22222222430101013F87B47D7077766966B7342E2B3748432222222243010101
        018EB45672706E6D74B440312F2C3A4322222222430101010101B4875672706E
        6CB4674232302939222222224313FBE7DAD9CE0B164B727B6EB47452412D25BF
        BE22222243D1E6EDF8F706DFD0C2B4B4B4B4B4B4B4ACC0C3CCD22222EBF11290
        38149117EEDE11454AB479546B53BCCBCDCF22E8F3159A86574682A5BB07E113
        8AB47C6F786B6924D82222F4FC9F96958F815888991B03FA3FB4847D83777543
        2222E2091DA49C9C9C978B4C4E89F00426B228363B3D3E432222E80DC9BAA19E
        A0B6B6B6B623F90F44444444444444432222E80EC8BDA9A1A2B6AD944D1EF50F
        43434343434343222222E00C210101A7A19DAB8D808CEF022222222222222222
        222222F618A80101AAA6A398931AE3222222222222222222222222E40A20A801
        BAC7019B1CEC0222222222222222222222222222E7F21927B8C51FFDEADB2222
        22222222222222222222222222DDE5051008E9DCD72222222222222222222222
        22222222222222D6D5D4D3222222222222222222222222222222}
    end
    object ShowAllDataBtn: TdxBarLargeButton
      Caption = #1054#1073#1088#1072#1090#1080
      Category = 0
      Hint = #1055#1086#1082#1072#1079#1091#1074#1072#1090#1080' '#1090#1110#1083#1100#1082#1080' '#1076#1072#1085#1110' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1087#1077#1088#1110#1086#1076#1091
      Visible = ivAlways
      OnClick = ShowAllDataBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        0800000000004002000000000000000000000001000000000000FF00FF00004B
        0000035E06000464080007740E00097411000C7717000E7D1A000F811C00118C
        1F000793100008961200099714000A9915000C9A18000D9E1B0010951F000FA0
        1E00138F23001196210013902400159127001398230013992500159A2700169C
        28001B9F31001C9C340014A727001AAF31001BB0330020AA3B0021B83D0023AD
        410028C048002EC152002FC9540035CF5E0036D060003BD768003FD96F0041DC
        7000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000010000000000000000000000000000000000000000000001090100000000
        0000000000000000000000000000000001120A19010000000000000000000000
        000000000000000115110D0B1801000000000000000000000000000000000108
        1D1C110E0B18010000000000000000000000000000010722201E1501190B1801
        00000000000000000000000001062524221A0100010E0D150100000000000000
        00000000012827261F0100000001040D180100000000000000000000011A2921
        01000000000000010D1001000000000000000000000123010000000000000000
        010E0B0100000000000000000000010000000000000000000001030B01000000
        0000000000000000000000000000000000000001040100000000000000000000
        0000000000000000000000000102010000000000000000000000000000000000
        0000000000000101000000000000000000000000000000000000000000000000
        0100000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object FilterBtn: TdxBarLargeButton
      Caption = #1060#1110#1083#1100#1090#1088
      Category = 0
      Hint = #1060#1110#1083#1100#1090#1088
      Visible = ivAlways
      ShortCut = 119
      OnClick = FilterBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        0800000000004002000000000000000000000001000000000000FF00FF00004B
        0000004E000000580000005E0000015D0400055E080000620000006600000260
        050001690200006F000004640A0005670D00076A0F0000730000007600000376
        08000C731500760376000A4A52000D5862000D5A6400C47B0000FF7E00000081
        0000018603000289060003810800048E0A0005910E00078612000A8C1B001080
        1E0007961300099816000A9A19000C9D1D00149110001488230019932B001C9A
        3100189D33001E9E34000DA021000EA324000FA4280010A5280011A72C001CA9
        2F0013AB300015AD35001DA5390016B0390018B23D0020A5390019B641001BB8
        45001CB845001DBB49001FBF4D0023AC400032A54B0028B4450027B548002EBB
        550028CC4F0021C2500023C5530026C9560029CD5A0033CC580034CC59002FD7
        51002FD850002DD35E002FD7620031D9640034DD670036E16A003BE76F003EEB
        730041EF760045F67B0045F67F0047F87E00DAAB1F00E0B73B00E0B83B00E2AB
        6F00E3C15200E5C65B00E7C96600FC00FC00FF78FF0000A6BD0045F6800049FB
        80004BFE820000B1CA0000C4E00000C9E30000CCE90000D7F40054E6F7007FFA
        F800EDD78A00EFDC9800F6E9BD00FA95FA0081FFFE00F8F2D400FFFFFF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000001010101
        0000000000000000000000000000000000000005426049190100000000000000
        0000000000000000000000054260491901000000000000000000000000000000
        0000000542604919010000000000000000000000000000000000000542544919
        0100000000000000000000000000000000000005426049190100000000000000
        0000000000000000000000053E41312601000000000000000000000000000000
        0000052A443830241C0100000000000000000000000000000005344B44363023
        1B100100000000000000000000000000053D4F463C362C221B19100100000000
        00000000000000053F524E463C322C1E1919191001000000000000000000053F
        61514E443832242219191919100100000000000000053F6155504C443830241D
        191919191910010000000000052A482A2A210E0D0D0505050505050808101001
        00000005010105050A101F206E66635F143F372A271201010100050510101717
        17172430326E656465155461616161480601000508175B5A5856173032386E67
        6767154837285E010100000000596B6A5C5817010101016E67150101015E5E13
        0000000000596F6C6A5A170000000000680000006D5E5D13130000000059706F
        6B5B1800000000000000006D6D5D5D5D13130000000059595959000000000000
        000000006D6D5D131300000000000000000000000000000000000000006D5E13
        000000000000000000000000000000000000000000005E000000}
    end
    object ExitBtn: TdxBarLargeButton
      Align = iaRight
      Category = 0
      Visible = ivAlways
      ShortCut = 27
      OnClick = ExitBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF004E1E1F00BF4C4D00BD4B4C00C04D4E00C14E4F00C4505100C24F
        5000C5515200B64B4C00C9545500C7535400C6525300CA555600CB565700CE58
        5900CC575800C5545500D05A5B00CF595A00D35C5D00D15B5C00D55E5F00D45D
        5E00D8606200D75F6000AF4E4F00D9626300DD656600DC646500DA636400E067
        6800DE666700E2696A00E1686900E56B6C00E36A6B00E96E6F00E76D6E00E66C
        6D009F4B4C00EA6F7000A04C4D00EB707200A34E4F00EE737400ED7273009C4B
        4C00F2767700F0757600EF747500E06D6E00A6515200F6797A00F4787900F377
        7800A9535400F87B7D00F77A7B00FB7E7F00FA7D7E00AF585900AC5657009A4D
        4E00FF818200FE808100FC7F8000F77E7F00B25B5C00EE7A7B00D56F7000B860
        6200B6626300AF5E5F00FE8B8C0091515200FC929300EF909100FB9A9C00E690
        9100EB959600FAA3A400F8AAAB00F2A9AA00EEA6A700F7B5B600A5505000994B
        4B00AB555500B15A5A00B55D5D00B75F5F00914B4B00BB636300BF666600BD65
        65008C4B4B00894B4B009F58580098555500824B4B00EB9C9C00F7B1B100EECE
        AF00FFFFD300D9F6BD00B7EBAA0058A55B003F9E4C005ED3770045CA67001EBC
        4C00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
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
        02020202026603020202020202020202020202020202020202026666625E0302
        020202020202020202020202020202666663310B052A03020202020202020202
        02020202026666411C070604042A03596666666666666666020202020266130C
        0D0E0A08092C034C4E505354685757660202020202661112100F0C0D0E2E036E
        71717171717157660202020202661714151112100F58036E7171717171715766
        0202020202661818191617141536036E7171717171715766020202020266201D
        1A1B1819163A036E7171717171715766020202020266221E1F201D1A1B5A036E
        71717171717157660202020202662324212235511F40036D7171717171715766
        020202020266282925265601673F03696C6F6F70707057660202020202662D2B
        27285501525B03696A6A6A6A6B6B5766020202020266342F302D2B4F28460369
        6A6A6A6A6A6A576602020202026639393233342F305C03696A6A6A6A6A6A5766
        0202020202663B3C37383932335D03696A6A6A6A6A6A5766020202020266443D
        3E3B3C37384903696A6A6A6A6A6A576602020202026642424344443D3E5F0369
        6A6A6A6A6A6A5766020202020266424242424243436103696A6A6A6A6A6A5766
        020202020266454242424242426003696A6A6A6A6A6A5766020202020266664B
        48424242426003696A6A6A6A6A6A57660202020202020266664D4A474260035E
        6666666666666666020202020202020202026666656403020202020202020202
        0202020202020202020202020266030202020202020202020202}
    end
    object AcctCardBtn: TdxBarLargeButton
      Category = 0
      Visible = ivNever
      OnClick = AcctCardBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF002D2C9800FF00FF00AC430F00A5461000A74912009E674100A5673A00954A
        0F00F7A05600FEAB6700DE7F2600E1822900E3842D00E68A3500EB903D00F097
        4800EFA05700F2AA6900FFBB7F00D8842F00EA9E5000FAAB5C00EFA75F00FAB5
        7200D9802100D8802100DE862300DE872600D5812700D9822800D8832800D782
        2800D7832900D8832A00D8842B00DC882D00DC892D00D8842C00E18A2F00D986
        2D00D8872D00EB913200D9872E00DA883000DA893000DE8C3300DA893200DC8A
        3300DC8B3400DD8C3500E1913700DE8E3600DD8E3700E08F3900E2933B00E090
        3A00E1913C00E2923F00E6984100E2934000DA903E00E79A4300E5964300E798
        4500EA9E4800EA9F4B00E79A4A00E3984900EFA55200E38B2600DA882B00DD8C
        2F00DE8F3400E0913600E5973E00E99C4000E99D4600E79C4600AD936900A390
        650030641700035A0600169E350021BA490019B4450019B143001ABA49001AB5
        48001CB84B001DBD4D001CB749001EBC4C001FC14F001FC04E001FBF4E001FBF
        500020C2510020C04F001FBB4E0021C4520021C4530023C9550022C2510024CA
        570024C9560023C6540023C5530022C1520024C5550026CB580027CE5A0027CC
        580026C9560027C9580029D05D0029CF5C0028CC590028CB58002BD560002AD0
        5C002BD15D002CD15D002DD560002DD45F0031DC660034E0690035DE680039E5
        6D003CE9700023CC590027D45E002BD15F002DD963002DD8630035E36C0037EA
        720039E9700038E76F003BEA72003BEA73003EEE750043F77D0042F47A0046FA
        7F004AFF830053FF91002D7EC0003379B100377BB4002C78BB00347AB6003476
        AF001C87FF001480FF001681FF001E87FF000A5FDE000B63E000485A7E00525A
        7500001EF4000018FF00001CF4001524BF001A28B5001D27B0002329A500292A
        9C00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303030303030303030303090909090909090909090909090909090903030303
        030309464F3C38344A4926484707A6A5A094975109030303030309433D393531
        2C2723201BA9A3A29F9D9C9809030303030309423B37332E292421201A02A3A4
        9E9A9B96090303030303094E3A36312D2A22211E1C08A8A7A195995009030303
        0303093F09090909090909091E1D1F152B3E4517090303030303093F37322E29
        24221E1E1E23252F3A411613090303030303093C090909090909090909090909
        09441219090303030303094C33302C2722211E1E222A31394016181909030303
        0303094D4B4A280D0C0C0C0C0D0E0F10110A0B14095252525203030605040909
        09090909090909090909090958838487895203030303035285736E6D61645A5C
        595656575383777B88520303030303528675716A6B625E5F5B5B606053537A7E
        8B520303030303527C76736E686360605D5D606B545353538C52030303030352
        7852525252525252525260626F5553538E520303030303527A726E6C6263605D
        5D6060686A7A7F8A905203030303035279525252525252525252525252525281
        9152030303030352756A6C6263605D5D5D60686E767D80829252030303030352
        787069676B656262666B6F74877F8D8F93520303030303035252525252525252
        5252525252525252520303030303030303030303030303030303030303030303
        0303030303030303030303030303030303030303030303030303}
    end
    object AvansBtn: TdxBarLargeButton
      Category = 0
      Visible = ivNever
      OnClick = AvansBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF92635D8E5D598E5D598E5D598E5D598E5D598E5D598E5D59
        8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598050
        4BFF00FFFF00FFFF00FFFF00FFFF00FF93655EEFD3B4F6DAB6F3D5ADF2D1A5F0
        CE9EEFCB97EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080
        EDC180EABF7F80504BFF00FFFF00FFFF00FFFF00FFFF00FF93655FEED4B8F4DA
        BBF2D5B1F0D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9BD7FE9
        BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF
        93655FEED7C0F6E0C1F2D9B8F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC58FEBC1
        89EABF82E9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF
        00FFFF00FFFF00FF93655FEFDAC5F7E2C7F3DCBF811E00811E00811E00811E00
        811E00811E00811E00811E00811E00811E00811E00E9BD7FEABF7FE7BC7E8050
        4BFF00FFFF00FFFF00FFFF00FFFF00FF936560F0DECCF8E6CFF6E0C6811E00FE
        FEFEFEFEFEFEFEFEFEFEFED5DDFE1D41FBE9EDFEFEFEFEFEFEFE811E00E9BD7F
        EABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2D3FAEA
        D7F6E3CE811E00FEFEFEFEFEFEFEFEFE9AADFC082AFA011FFA899EFCFEFEFEFE
        FEFE811E00E9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF
        986963F2E6DAFAEEDEF7E7D4811E00FEFEFEFEFEFE5674FB011FFA011FFA011F
        FA1135FAFEFEFEFEFEFE811E00E9BD81EABF7FE7BC7E80504BFF00FFFF00FFFF
        00FFFF00FFFF00FF9E6E64F4EAE1FBF2E6F8EADC811E00E9EDFE1D41FB011FFA
        011FFA5674FB082AFA011FFA9AADFCFEFEFE811E00EBC188EABF82E7BB7E8050
        4BFF00FFFF00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3811E0011
        35FA011FFA082AFA9AADFCFEFEFE6681FB011FFA1135FAFEFEFE811E00EBC48E
        EBC288E7BC8080504BFF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3F0FEFB
        F6FBF3EB811E00899EFC1D41FBC1CCFCFEFEFEFEFEFEE9EDFE082AFA011FFA66
        81FB811E00EDC795EDC58FE9BF8780504BFF00FFFF00FFFF00FFFF00FFFF00FF
        AC7969FAF6F4FFFFFEFEF8F3811E00FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FE899EFC011FFA011FFA631E1BEECB9CEEC996EAC18E80504BFF00FFFF00FFFF
        00FFFF00FFFF00FFB17E6BFAF6F4FFFFFFFFFEFB811E00FEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFE3859FB011FFA041FE5DCC1A6EECB9CEBC5928050
        4BFF00FFFF00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFF811E00FE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE9EDFE1D41FB011FFA1C3AEA
        F0CFA3EDC99980504BFF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFF
        FFFFFFFF811E00811E00811E00811E00811E00811E00811E00811E00811E0063
        1E1B041FE5011FFA011FFACEB49180504BFF00FFFF00FFFF00FFFF00FFFF00FF
        C0896FFBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFEF7F2FBF2EAFAEEE2F8EB
        DAF7E6D3F6E2CBF6DEC4F3DCBD011FFA011FFA011FFA011FFAFF00FFFF00FFFF
        00FFFF00FFFF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFB
        FCF8F2FBF3EAF8EEE2F8EAD9F8E7D4FAE9D0E0D0BAB8AB9A011FFA011FFA011F
        FA011FFA011FFAFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C4A0675BA0675BA0675B
        A0675BA0675B011FFA011FFA011FFAFF00FFFF00FFFF00FFCF9674FBF7F6FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B6A0
        675BDAA16BDD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FFFF00FF
        D49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
        FBFFFEF7DDC4BCA0675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFDDC7C2A0675BEAB273EFA751A5686BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CEA0675BEDB572A5686B
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF8E68CF8E
        68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68A0
        675BA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object DSetDetail: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID_MAN_MOVING,'
      '    ID_MOVING_TYPE,'
      '    ID_ORDER,'
      '    NUM_ITEM,'
      '    ID_PCARD,'
      '    DATE_BEG,'
      '    DATE_END,'
      '    KOL_STAVOK,'
      '    TEST_TERM,'
      '    STAJIROVKA_TERM,'
      '    IS_MAIN,'
      '    ID_SHTATRAS,'
      '    ID_WORK_MODE,'
      '    ID_DEPARTMENT,'
      '    WORK_MODE_SHIFT,'
      '    BUHG_PODR,'
      '    RMOVING,'
      '    REAL_END,'
      '    PAYMENT,'
      '    DEP_NAME,'
      '    VPOST,'
      '    DIGIT,'
      '    PARENT_NAME,'
      '    TARST,'
      '    NUM_ORDER,'
      '    RAZR_OR_KLASS,'
      '    NAME_SOVMEST,'
      '    OKLAD_PPS,'
      '    OKLAD_BASE,'
      '    KOD_SM,'
      '    KOD_SM_PPS,'
      '    TIN'
      'FROM'
      '    Z_GET_ALL_MOVINGS'
      '    ('
      '    ?IN_ID_PCARD'
      '    ) ')
    DataSource = DSourceMain
    Left = 104
    Top = 136
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSourceDetail: TDataSource
    DataSet = DSetDetail
    Left = 136
    Top = 136
  end
  object DSetBanded: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    NUM,'
      '    ID_MAN_MOVING,'
      '    ID_MOVING_TYPE,'
      '    ID_ORDER,'
      '    NUM_ITEM,'
      '    ID_PCARD,'
      '    DATE_BEG,'
      '    DATE_END,'
      '    KOL_STAVOK,'
      '    TEST_TERM,'
      '    STAJIROVKA_TERM,'
      '    IS_MAIN,'
      '    ID_SHTATRAS,'
      '    ID_WORK_MODE,'
      '    ID_DEPARTMENT,'
      '    WORK_MODE_SHIFT,'
      '    BUHG_PODR,'
      '    RMOVING,'
      '    REAL_END,'
      '    PAYMENT,'
      '    DEP_NAME,'
      '    VPOST,'
      '    DIGIT,'
      '    PARENT_NAME,'
      '    TARST,'
      '    NUM_ORDER,'
      '    RAZR_OR_KLASS,'
      '    NAME_SOVMEST,'
      '    OKLAD_PPS,'
      '    OKLAD_BASE,'
      '    KOD_SM,'
      '    KOD_SM_PPS,'
      '    TIN,'
      'gr_str'
      'FROM'
      '    Z_GET_ALL_MOVINGS_DETAIL'
      '    ('
      '    ?IN_ID_PCARD'
      '    ) ')
    DataSource = DSourceMain
    OnFilterRecord = DSetBandedFilterRecord
    Left = 104
    Top = 168
    poSQLINT64ToBCD = True
    poAskRecordCount = True
    WaitEndMasterScroll = True
  end
  object DSourceBanded: TDataSource
    DataSet = DSetBanded
    Left = 136
    Top = 168
  end
  object DSet2: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 104
    Top = 200
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 136
    Top = 200
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = StProcTransaction
    Left = 104
    Top = 270
  end
  object StProcTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 270
  end
  object pm1: TPopupMenu
    Left = 176
    Top = 104
    object N1: TMenuItem
      Caption = #1040#1085#1072#1083#1110#1090#1080#1082#1072' '#1087#1086' '#1087#1077#1088#1077#1088#1072#1093#1091#1074#1072#1085#1085#1102' '#1085#1072#1083#1086#1075#1091' '#1079' '#1076#1086#1093#1086#1076#1091' '#1060#1054
      OnClick = N1Click
    end
  end
  object SmetaDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from Z_GET_ALL_MOVINGS_SM_DETAIL(?id_man_moving)')
    DataSource = DSourceBanded
    Left = 109
    Top = 237
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object SmetaDataSource: TDataSource
    DataSet = SmetaDataSet
    Left = 141
    Top = 237
  end
  object BonusSmetaDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from z_get_bonus_smet(?id_man_bonus)')
    DataSource = DSource2
    Left = 101
    Top = 309
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object BonusSmetaDataSource: TDataSource
    DataSet = BonusSmetaDataSet
    Left = 141
    Top = 309
  end
end
