object frmHtmlReport: TfrmHtmlReport
  Left = 334
  Top = 184
  Width = 962
  Height = 493
  Caption = #1047#1074#1110#1090#1085#1110#1089#1090#1100' '#1079#1072' '#1087#1083#1072#1085#1086#1074#1080#1084#1080' '#1090#1072' '#1092#1072#1082#1090#1080#1095#1085#1080#1084#1080' '#1087#1086#1082#1072#1079#1085#1080#1082#1072#1084#1080' '#1073#1102#1076#1078#1077#1090#1110#1074
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
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 946
    Height = 455
    Align = alClient
    TabOrder = 0
    object TitlePanel: TPanel
      Left = 1
      Top = 38
      Width = 944
      Height = 109
      Align = alTop
      BevelOuter = bvNone
      BiDiMode = bdLeftToRight
      Color = clActiveBorder
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      object Label4: TLabel
        Left = 5
        Top = 6
        Width = 212
        Height = 13
        Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1087#1086#1082#1072#1079#1085#1080#1082#1080' '#1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 172
        Top = 29
        Width = 15
        Height = 13
        Caption = #1087#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtMonthBeg: TcxMRUEdit
        Left = 6
        Top = 26
        Width = 91
        Height = 21
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownRows = 5
        Properties.ShowEllipsis = False
        Style.Color = clWhite
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
      end
      object edtYearBeg: TcxSpinEdit
        Left = 99
        Top = 26
        Width = 70
        Height = 21
        ParentFont = False
        Properties.ValueType = vtInt
        Style.Color = clWhite
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
      end
      object edtMonthEnd: TcxMRUEdit
        Left = 189
        Top = 26
        Width = 91
        Height = 21
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownRows = 5
        Properties.ShowEllipsis = False
        Style.Color = clWhite
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 2
      end
      object edtYearEnd: TcxSpinEdit
        Left = 282
        Top = 26
        Width = 70
        Height = 21
        ParentFont = False
        Properties.ValueType = vtInt
        Style.Color = clWhite
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 3
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 326
      Width = 944
      Height = 128
      Align = alBottom
      TabOrder = 1
      Visible = False
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 942
        Height = 126
        ActivePage = TabSheet1
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Style = tsFlatButtons
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = #1047#1072#1083#1080#1096#1082#1080' '#1087#1086' '#1073#1102#1076#1078#1077#1090#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          DesignSize = (
            934
            92)
          object Label2: TLabel
            Left = 10
            Top = 21
            Width = 137
            Height = 24
            Alignment = taRightJustify
            Anchors = []
            AutoSize = False
            Caption = #1043#1088#1086#1096#1086#1074#1110
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = -3
            Top = 41
            Width = 149
            Height = 39
            Alignment = taRightJustify
            Anchors = []
            AutoSize = False
            Caption = #1047' '#1091#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084' '#1079#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1086#1089#1090#1110
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object Label5: TLabel
            Left = 363
            Top = 24
            Width = 76
            Height = 16
            Alignment = taRightJustify
            Anchors = []
            AutoSize = False
            Caption = #1060#1110#1085#1072#1085#1089#1086#1074#1110
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 157
            Top = 20
            Width = 193
            Height = 24
            TabStop = False
            Anchors = []
            AutoSize = False
            DataBinding.DataField = 'REST_K'
            DataBinding.DataSource = RestDataSource
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Style.Color = clInfoBk
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 0
          end
          object cxDBTextEdit2: TcxDBTextEdit
            Left = 157
            Top = 48
            Width = 193
            Height = 24
            TabStop = False
            Anchors = []
            AutoSize = False
            DataBinding.DataField = 'REST_Z'
            DataBinding.DataSource = RestDataSource
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Style.Color = clInfoBk
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 1
          end
          object cxDBTextEdit3: TcxDBTextEdit
            Left = 448
            Top = 20
            Width = 193
            Height = 24
            TabStop = False
            Anchors = []
            AutoSize = False
            DataBinding.DataField = 'REST_F'
            DataBinding.DataSource = RestDataSource
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Style.Color = clInfoBk
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 2
          end
        end
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 944
      Height = 37
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object BackButton: TcxButton
        Left = 0
        Top = 0
        Width = 73
        Height = 36
        Caption = #1053#1072#1079#1072#1076
        Enabled = False
        ModalResult = 1
        TabOrder = 0
        OnClick = BackButtonClick
        Layout = blGlyphBottom
        UseSystemPaint = False
      end
      object cxButton7: TcxButton
        Left = 266
        Top = 0
        Width = 73
        Height = 36
        Caption = 'E-mail'
        TabOrder = 1
        Layout = blGlyphBottom
        UseSystemPaint = False
      end
      object cxButton1: TcxButton
        Left = 489
        Top = 0
        Width = 73
        Height = 36
        Caption = #1042#1080#1093#1110#1076
        TabOrder = 2
        OnClick = cxButton1Click
      end
      object cxButton2: TcxButton
        Left = 73
        Top = 0
        Width = 73
        Height = 36
        Caption = #1054#1085#1086#1074#1080#1090#1080
        ModalResult = 1
        TabOrder = 3
        OnClick = cxButton2Click
        Layout = blGlyphBottom
        UseSystemPaint = False
      end
      object PrintButton: TcxButton
        Left = 339
        Top = 0
        Width = 75
        Height = 36
        Caption = #1044#1088#1091#1082
        ModalResult = 1
        TabOrder = 4
        OnClick = PrintButtonClick
        Layout = blGlyphBottom
        UseSystemPaint = False
      end
      object cxButton11: TcxButton
        Left = 191
        Top = 0
        Width = 75
        Height = 36
        Caption = #1045#1082#1089#1087#1086#1088#1090
        TabOrder = 5
        DropDownMenu = ExportPopupMenu
        Kind = cxbkDropDownButton
        Layout = blGlyphBottom
        UseSystemPaint = False
      end
      object cxButton3: TcxButton
        Left = 414
        Top = 0
        Width = 75
        Height = 36
        Caption = #1053#1077#1086#1073#1088'.'#1087#1083'.'
        ModalResult = 1
        TabOrder = 6
        OnClick = cxButton3Click
        Layout = blGlyphBottom
        UseSystemPaint = False
      end
    end
    object BuReportsInfoGrid: TcxGrid
      Left = 1
      Top = 147
      Width = 944
      Height = 179
      Align = alClient
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = cxcbsNone
      TabOrder = 3
      object ViewLevel0: TcxGridDBTableView
        OnDblClick = ViewLevel0DblClick
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnFocusedItemChanged = ViewLevel0FocusedItemChanged
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHiding = True
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsCustomize.DataRowSizing = True
        OptionsCustomize.GroupRowSizing = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupRowHeight = 40
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridTableViewStyleSheetHighContrastWhite
        Styles.ContentEven = cxStyle1
        Styles.ContentOdd = cxStyle1
        Styles.Group = cxStyle2
        Styles.Header = cxStyle14
        object ViewLevel0DBColumn2: TcxGridDBColumn
          Caption = #1043#1056#1059#1055#1048' '#1041#1070#1044#1046#1045#1058#1030#1042
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 326
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel0DBColumn2StylesGetContentStyle
          Width = 422
          DataBinding.FieldName = 'OBJECT_TITLE'
        end
        object ViewLevel0DBColumn3: TcxGridDBColumn
          Caption = #1047#1074#1077#1076#1077#1085#1072' '#1087#1086' '#1074#1080#1082#1086#1085#1072#1085#1085#1102' '#1075#1088#1091#1087#1080' '#1074#1094#1110#1083#1086#1084#1091
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = ViewLevel0DBColumn3GetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 68
          Options.Filtering = False
          Width = 124
        end
        object ViewLevel0DBColumn5: TcxGridDBColumn
          Caption = #1047#1074#1077#1076#1077#1085#1072' '#1087#1086' '#1074#1080#1082#1086#1085#1072#1085#1085#1102' '#1075#1088#1091#1087#1080' ('#1091' '#1088#1086#1079#1088#1110#1079#1110' '#1073#1102#1076#1078#1077#1090#1110#1074')'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = ViewLevel0DBColumn5GetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 119
        end
        object ViewLevel0DBColumn4: TcxGridDBColumn
          Caption = #1055#1083#1072#1085#1086#1074#1110' '#1087#1086#1082#1072#1079#1085#1080#1082#1080' ('#1091' '#1088#1086#1079#1088#1110#1079#1110' '#1073#1102#1076#1078#1077#1090#1110#1074')'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = ViewLevel0DBColumn4GetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 67
          Options.Filtering = False
          Width = 123
        end
        object ViewLevel0DBColumn6: TcxGridDBColumn
          Caption = #1055#1083#1072#1085#1086#1074#1110' '#1087#1086#1082#1072#1079#1085#1080#1082#1080' '#1087#1086#1084#1110#1089#1103#1095#1085#1086' ('#1091' '#1088#1086#1079#1088#1110#1079#1110' '#1073#1102#1076#1078#1077#1090#1110#1074')'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = ViewLevel0DBColumn6GetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 117
        end
        object ViewLevel0DBColumn1: TcxGridDBColumn
          Visible = False
          SortOrder = soAscending
          DataBinding.FieldName = 'SHOW_POSITION'
        end
        object OBJECT_TYPE_COL: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'OBJECT_TYPE'
        end
      end
      object ViewLevel1: TcxGridDBTableView
        OnDblClick = ViewLevel1DblClick
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnFocusedItemChanged = ViewLevel1FocusedItemChanged
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnHiding = True
        OptionsCustomize.ColumnHorzSizing = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.NewItemRowSeparatorColor = clGradientActiveCaption
        Styles.StyleSheet = GridTableViewStyleSheetHighContrastWhite
        Styles.ContentEven = cxStyle3
        Styles.Group = cxStyle2
        Styles.Header = cxStyle14
        object ViewLevel1DBColumn1: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 100
          Options.Filtering = False
          Width = 100
          DataBinding.FieldName = 'BU_KOD'
        end
        object ViewLevel1DBColumn2: TcxGridDBColumn
          Caption = #1041#1102#1076#1078#1077#1090
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 200
          Options.Filtering = False
          Width = 200
          DataBinding.FieldName = 'BU_TITLE'
        end
        object ViewLevel1DBColumn9: TcxGridDBColumn
          Caption = #1044#1086#1093#1086#1076#1080
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '[-]?'#13'\d+[,]'#13'\d\d'#13#10
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 150
          Options.Filtering = False
          Options.Sorting = False
          Styles.OnGetContentStyle = ViewLevel1DBColumn9StylesGetContentStyle
          Width = 150
          DataBinding.FieldName = 'DOXOD'
        end
        object ViewLevel1DBColumn10: TcxGridDBColumn
          Caption = #1042#1080#1076#1072#1090#1082#1080
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '[-]?'#13'\d+[,]'#13'\d\d'#13#10
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 150
          Options.Filtering = False
          Options.Sorting = False
          Styles.OnGetContentStyle = ViewLevel1DBColumn10StylesGetContentStyle
          Width = 150
          DataBinding.FieldName = 'RASXOD'
        end
        object ViewLevel1DBColumn3: TcxGridDBColumn
          Caption = #1047#1072#1083#1080#1096#1086#1082' '#1075#1088#1086#1096#1086#1074#1080#1093' '#1082#1086#1096#1090#1110#1074
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '[-]?'#13'\d+[,]'#13'\d\d'#13#10
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 150
          Options.Filtering = False
          Options.Sorting = False
          Styles.OnGetContentStyle = ViewLevel1DBColumn3StylesGetContentStyle
          Width = 150
          DataBinding.FieldName = 'REST'
        end
        object ViewLevel1DBColumn4: TcxGridDBColumn
          Caption = #1047#1072#1083#1080#1096#1086#1082' '#1079' '#1091#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084' '#1082#1088'/'#1076#1073' '#1079#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1086#1089#1090#1110
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '[-]?'#13'\d+[,]'#13'\d\d'#13#10
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 165
          Options.Filtering = False
          Options.Sorting = False
          Styles.OnGetContentStyle = ViewLevel1DBColumn4StylesGetContentStyle
          Width = 165
          DataBinding.FieldName = 'REST_WITH_CREDIT'
        end
        object ViewLevel1DBColumn5: TcxGridDBColumn
          Caption = 
            #1047#1072#1083#1080#1096#1086#1082' '#1079' '#1091#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084' '#1089#1092#1086#1088#1084#1086#1074#1072#1085#1080#1093' '#1090#1072' '#1085#1077#1086#1073#1088#1086#1073#1083#1077#1085#1080#1093' '#1087#1083#1072#1090#1110#1078#1085#1080#1093' '#1076#1086#1088#1091 +
            #1095#1077#1085#1100' '#1076#1083#1103' '#1086#1087#1083#1072#1090#1080' '#1079#1072' '#1086#1089#1090#1072#1085#1085#1110' 30 '#1076#1110#1073
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '[-]?'#13'\d+[,]'#13'\d\d'#13#10
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 150
          Options.Editing = False
          Options.Filtering = False
          Options.Sorting = False
          Styles.OnGetContentStyle = ViewLevel1DBColumn5StylesGetContentStyle
          Styles.Header = cxStyle24
          Width = 150
          DataBinding.FieldName = 'REST_WITH_PL_DOCS'
        end
        object ViewLevel1DBColumn6: TcxGridDBColumn
          Caption = 
            #1057#1091#1084#1072' '#1089#1092#1086#1088#1084#1086#1074#1072#1085#1080#1093' '#1090#1072' '#1085#1077#1086#1073#1088#1086#1073#1083#1077#1085#1080#1093' '#1087#1083#1072#1090#1110#1078#1085#1080#1093' '#1076#1086#1088#1091#1095#1077#1085#1100' '#1076#1083#1103' '#1086#1087#1083#1072#1090#1080' '#1079 +
            #1072' '#1086#1089#1090#1072#1085#1085#1110' 30 '#1076#1110#1073
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '[-]?'#13'\d+[,]'#13'\d\d'#13#10
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 150
          Options.Editing = False
          Options.Filtering = False
          Options.Sorting = False
          Styles.Header = cxStyle24
          Width = 150
          DataBinding.FieldName = 'SUM_PL_DOCS'
        end
        object ViewLevel1DBColumn7: TcxGridDBColumn
          Caption = #1052'(K)'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = ViewLevel1DBColumn7GetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 50
          Options.Editing = False
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          Width = 50
        end
        object ViewLevel1DBColumn8: TcxGridDBColumn
          Caption = 'M('#1060')'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = ViewLevel1DBColumn8GetDisplayText
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          MinWidth = 55
          Options.Filtering = False
          Options.Sorting = False
          Width = 55
        end
        object ViewLevel1DBColumn11: TcxGridDBColumn
          PropertiesClassName = 'TcxCalcEditProperties'
          Visible = False
          MinWidth = 64
          SortOrder = soAscending
          DataBinding.FieldName = 'SMETA_KOD_INT'
        end
      end
      object ViewLevel2: TcxGridDBBandedTableView
        OnDblClick = ViewLevel2DblClick
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'PLAN_VALUE_FC'
            Column = PLAN_VALUE
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'BU_KASSA_FACT_FC'
            Column = BU_KASSA_FACT
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'BU_DEBIT_Z_FC'
            Column = BU_DEBIT_Z
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'BU_KREDIT_Z_FC'
            Column = BU_KREDIT_Z
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'DIFF_FROM_PLAN_FC'
            Column = DIFF_FROM_PLAN
          end>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnFocusedItemChanged = ViewLevel2FocusedItemChanged
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        Styles.StyleSheet = GridBandedTableViewStyleSheetHighContrastWhite
        Styles.ContentEven = cxStyle13
        Styles.ContentOdd = cxStyle13
        Styles.Footer = cxStyle14
        Styles.Group = cxStyle14
        Styles.Header = cxStyle14
        Styles.BandHeader = cxStyle14
        Bands = <
          item
            Caption = #1056#1086#1079#1076#1110#1083'/'#1089#1090#1072#1090#1090#1103
            Width = 307
          end
          item
            Caption = #1055#1083#1072#1085
            Width = 88
          end
          item
            Caption = #1042#1080#1082#1086#1085#1072#1085#1085#1103
            Width = 201
          end
          item
            Caption = #1047#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1110#1089#1090#1100
            Width = 130
          end
          item
            Caption = #1042#1110#1076#1093#1080#1083#1077#1085#1085#1103
            Width = 218
          end
          item
            Visible = False
          end
          item
            Caption = #1057#1080#1089#1090#1077#1084#1085#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
            Visible = False
          end>
        object PLAN_VALUE: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00 ;-,0.00'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 83
          Options.Filtering = False
          Styles.OnGetContentStyle = PLAN_VALUEStylesGetContentStyle
          Width = 105
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'PLAN_VALUE'
          IsCaptionAssigned = True
        end
        object BU_KASSA_FACT: TcxGridDBBandedColumn
          Caption = #1059#1087#1088#1072#1074#1083#1110#1085#1089#1100#1082#1080#1081
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 99
          Options.Filtering = False
          Styles.OnGetContentStyle = BU_KASSA_FACTStylesGetContentStyle
          Width = 133
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KASSA_FACT'
        end
        object BU_DEBIT_Z: TcxGridDBBandedColumn
          Caption = #1044#1077#1073'.'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 72
          Options.Filtering = False
          Styles.OnGetContentStyle = BU_DEBIT_ZStylesGetContentStyle
          Width = 72
          Position.BandIndex = 3
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_DEBIT_Z'
        end
        object BU_KREDIT_Z: TcxGridDBBandedColumn
          Caption = #1050#1088#1077#1076'.'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 58
          Options.Filtering = False
          Styles.OnGetContentStyle = BU_KREDIT_ZStylesGetContentStyle
          Width = 69
          Position.BandIndex = 3
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KREDIT_Z'
        end
        object DIFF_FROM_PLAN: TcxGridDBBandedColumn
          Caption = #1074#1110#1076' '#1087#1083#1072#1085#1091
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 101
          Options.Filtering = False
          Styles.OnGetContentStyle = DIFF_FROM_PLANStylesGetContentStyle
          Width = 101
          Position.BandIndex = 4
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'DIFF_FROM_PLAN'
        end
        object SHOW_TITLE: TcxGridDBBandedColumn
          Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 64
          Options.Filtering = False
          Options.Sorting = False
          Styles.OnGetContentStyle = SHOW_TITLEStylesGetContentStyle
          Width = 183
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'SHOW_TITLE'
        end
        object ViewLevel2DBBandedColumn1: TcxGridDBBandedColumn
          Caption = #1053#1086#1084#1077#1088' '#1087#1086#1082#1072#1079#1085#1080#1082#1072' '#1091' '#1079#1074#1110#1090#1110
          PropertiesClassName = 'TcxTextEditProperties'
          MinWidth = 64
          Options.Editing = False
          Options.Filtering = False
          Options.HorzSizing = False
          Options.VertSizing = False
          SortOrder = soAscending
          Position.BandIndex = 5
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object PROFIT_FLAG_TITLE: TcxGridDBBandedColumn
          Caption = #1044#1086#1093#1086#1076#1085#1110#1089#1090#1100' '#1087#1086#1082#1072#1079#1085#1080#1082#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          GroupIndex = 0
          SortOrder = soDescending
          Position.BandIndex = 6
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'PROFIT_FLAG_TITLE'
        end
        object PLAN_VALUE_FC: TcxGridDBBandedColumn
          Caption = #1055#1083#1072#1085#1086#1074#1077' '#1079#1085#1072#1095#1077#1085#1085#1103
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Position.BandIndex = 6
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'PLAN_VALUE_FC'
        end
        object BU_KASSA_FACT_FC: TcxGridDBBandedColumn
          Caption = #1059#1087#1088#1072#1074#1083#1110#1085#1089#1100#1082#1080#1081' '#1086#1073#1083#1110#1082
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Position.BandIndex = 6
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KASSA_FACT_FC'
        end
        object BU_DEBIT_Z_FC: TcxGridDBBandedColumn
          Caption = #1044#1077#1073'.'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Position.BandIndex = 6
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_DEBIT_Z_FC'
        end
        object BU_KREDIT_Z_FC: TcxGridDBBandedColumn
          Caption = #1050#1088#1077#1076#1080#1090#1086#1088#1089#1100#1082#1072' '#1079#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1110#1089#1090#1100
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Position.BandIndex = 6
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KREDIT_Z_FC'
        end
        object DIFF_FROM_PLAN_FC: TcxGridDBBandedColumn
          Caption = #1042#1110#1076#1093#1080#1083#1077#1085#1085#1103' '#1074#1110#1076' '#1087#1083#1072#1085#1091
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Position.BandIndex = 6
          Position.ColIndex = 5
          Position.RowIndex = 0
          DataBinding.FieldName = 'DIFF_FROM_PLAN_FC'
        end
        object TYPE_OBJ: TcxGridDBBandedColumn
          Caption = #1058#1080#1087' '
          PropertiesClassName = 'TcxTextEditProperties'
          Position.BandIndex = 6
          Position.ColIndex = 6
          Position.RowIndex = 0
          DataBinding.FieldName = 'OBJECT_TYPE'
        end
        object DIFF_WITH_PLATS: TcxGridDBBandedColumn
          Caption = #1079' '#1091#1088#1072#1093'. '#1085#1077#1086#1073#1088'.'#1076#1086#1088#1091#1095'.'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = DIFF_WITH_PLATSStylesGetContentStyle
          Width = 87
          Position.BandIndex = 4
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'DIFF_WITH_PLATS'
        end
        object Assign: TcxGridDBBandedColumn
          Caption = #1040#1089#1080#1075#1085#1091#1074#1072#1085#1085#1103
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Styles.OnGetContentStyle = AssignStylesGetContentStyle
          Width = 106
          Position.BandIndex = 2
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'ASIGN_SUM'
        end
        object Assign_differ: TcxGridDBBandedColumn
          Caption = #1079#1072#1083#1080#1096#1086#1082' '#1072#1089#1080#1075#1085#1091#1074#1072#1085#1100
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Styles.OnGetContentStyle = Assign_differStylesGetContentStyle
          Width = 71
          Position.BandIndex = 4
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'DIFF_ASIGN'
        end
      end
      object ViewLevel3: TcxGridDBBandedTableView
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'PLAN_VALUE_FC'
            Column = ViewLevel3DBBandedColumn2
          end>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnVertSizing = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridBandedTableViewStyleSheetHighContrastWhite
        Styles.Content = cxStyle12
        Styles.ContentEven = cxStyle12
        Styles.ContentOdd = cxStyle12
        Bands = <
          item
            Caption = #1047#1074#1110#1090' '#1087#1086' '#1075#1088#1091#1087#1087#1110' '#1073#1102#1076#1078#1077#1090#1110#1074
            FixedKind = fkLeft
            Width = 456
          end
          item
            Caption = #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1087#1086' '#1073#1102#1076#1078#1077#1090#1072#1084' '#1074' '#1075#1088#1091#1087#1110
            Width = 566
          end>
        object ViewLevel3DBBandedColumn4: TcxGridDBBandedColumn
          Visible = False
          GroupIndex = 0
          Options.Filtering = False
          SortOrder = soDescending
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'PROFIT_FLAG_TITLE_EX'
          IsCaptionAssigned = True
        end
        object ViewLevel3DBBandedColumn1: TcxGridDBBandedColumn
          Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1073#1102#1076#1078#1077#1090#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel3DBBandedColumn1StylesGetContentStyle
          Width = 314
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'SHOW_TITLE'
        end
        object ViewLevel3DBBandedColumn2: TcxGridDBBandedColumn
          Caption = #1047#1072#1075#1072#1083#1100#1085#1080#1081' '#1087#1083#1072#1085
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel3DBBandedColumn2StylesGetContentStyle
          Width = 125
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'PLAN_VALUE'
        end
        object ViewLevel3DBBandedColumn5: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'IS_DETAIL'
        end
        object ViewLevel3DBBandedColumn3: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'PLAN_VALUE_FC'
        end
      end
      object ViewLevel4: TcxGridDBBandedTableView
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'PLAN_VALUE_FC'
            Column = PLAN_VALUE_COLUMN
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'BU_KASSA_FACT_FC'
            Column = BU_KASSA_FACT_COLUMN
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'DIFF_FROM_PLAN_FC'
            Column = DIFF_FROM_PLAN_COLUMN
          end>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.InvertSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        Styles.StyleSheet = GridBandedTableViewStyleSheetHighContrastWhite
        Styles.Content = cxStyle12
        Styles.ContentEven = cxStyle12
        Styles.ContentOdd = cxStyle12
        Styles.Footer = cxStyle14
        Styles.Group = cxStyle14
        Styles.Header = cxStyle14
        Styles.BandHeader = cxStyle14
        Bands = <
          item
            Caption = #1056#1086#1079#1076#1110#1083'/'#1089#1090#1072#1090#1090#1103
            Width = 369
          end
          item
            Caption = #1055#1083#1072#1085
            Width = 134
          end
          item
            Caption = #1042#1080#1082#1086#1085#1072#1085#1085#1103
            Width = 139
          end
          item
            Caption = #1047#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1110#1089#1090#1100
            Width = 130
          end
          item
            Caption = #1042#1110#1076#1093#1080#1083#1077#1085#1085#1103
            Width = 134
          end
          item
            Caption = 'system'
            Visible = False
          end>
        object ViewLevel4DBBandedColumn1: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          GroupIndex = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          SortOrder = soDescending
          Styles.OnGetContentStyle = ViewLevel4DBBandedColumn1StylesGetContentStyle
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'PROFIT_FLAG_TITLE_EX'
          IsCaptionAssigned = True
        end
        object ViewLevel4DBBandedColumn3: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel4DBBandedColumn3StylesGetContentStyle
          Width = 124
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'SHOW_TITLE'
          IsCaptionAssigned = True
        end
        object PLAN_VALUE_COLUMN: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel4DBBandedColumn4StylesGetContentStyle
          Width = 139
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'PLAN_VALUE'
          IsCaptionAssigned = True
        end
        object BU_KASSA_FACT_COLUMN: TcxGridDBBandedColumn
          Caption = #1059#1087#1088#1072#1074#1083#1110#1085#1089#1100#1082#1080#1081
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel4DBBandedColumn5StylesGetContentStyle
          Width = 66
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KASSA_FACT'
        end
        object ViewLevel4DBBandedColumn6: TcxGridDBBandedColumn
          Caption = #1060#1110#1085#1072#1085#1089#1086#1074#1080#1081
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel4DBBandedColumn6StylesGetContentStyle
          Width = 79
          Position.BandIndex = 2
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'FACT_FINANCE'
        end
        object ViewLevel4DBBandedColumn7: TcxGridDBBandedColumn
          Caption = #1044#1077#1073#1110#1090#1086#1088#1089#1100#1082#1072
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel4DBBandedColumn7StylesGetContentStyle
          Width = 96
          Position.BandIndex = 3
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'Z_DEBIT'
        end
        object BU_KREDIT_Z_COLUMN: TcxGridDBBandedColumn
          Caption = #1050#1088#1077#1076#1080#1090#1086#1088#1089#1100#1082#1072
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel4DBBandedColumn8StylesGetContentStyle
          Width = 98
          Position.BandIndex = 3
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KREDIT_Z'
        end
        object DIFF_FROM_PLAN_COLUMN: TcxGridDBBandedColumn
          Caption = #1074#1110#1076' '#1087#1083#1072#1085#1091
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel4DBBandedColumn9StylesGetContentStyle
          Width = 82
          Position.BandIndex = 4
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'DIFF_FROM_PLAN'
        end
        object ViewLevel4DBBandedColumn2: TcxGridDBBandedColumn
          Options.Filtering = False
          SortOrder = soAscending
          Styles.OnGetContentStyle = ViewLevel4DBBandedColumn2StylesGetContentStyle
          Position.BandIndex = 5
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'SHOW_POSITION'
        end
        object ViewLevel4DBBandedColumn10: TcxGridDBBandedColumn
          Visible = False
          Styles.OnGetContentStyle = ViewLevel4DBBandedColumn10StylesGetContentStyle
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'IS_DETAIL'
        end
        object PLAN_FC: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'PLAN_VALUE_FC'
        end
        object KASSA_FC: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KASSA_FACT_FC'
        end
        object DIFF_FC: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
          DataBinding.FieldName = 'DIFF_FROM_PLAN_FC'
        end
      end
      object ViewLevelMonth: TcxGridDBBandedTableView
        OnDblClick = ViewLevelMonthDblClick
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'BU_KASSA_FACT_FC'
            Column = BU_KASSA_FACT_
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'DIFF_FROM_PLAN'
            Column = DIFF_FROM_PLAN_
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'PLAN_VALUE_FC'
            Column = PLAN_VALUE_
          end>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridBandedTableViewStyleSheetHighContrastWhite
        Styles.Content = ST_STYLE
        Styles.ContentEven = ST_STYLE
        Styles.ContentOdd = ST_STYLE
        Styles.Footer = cxStyle14
        Styles.Group = cxStyle14
        Styles.Header = cxStyle14
        Styles.BandHeader = cxStyle14
        Bands = <
          item
            Caption = #1056#1086#1079#1076#1110#1083'/'#1089#1090#1072#1090#1090#1103
            FixedKind = fkLeft
            Width = 341
          end
          item
            HeaderAlignmentHorz = taLeftJustify
            Caption = #1060#1072#1082#1090#1080#1095#1085#1110' '#1087#1086#1082#1072#1079#1085#1080#1082#1080' '#1091#1087#1088#1072#1074#1083#1110#1085#1089#1100#1082#1086#1075#1086' '#1086#1073#1083#1110#1082#1091
            Styles.Content = ST_STYLE
            Width = 1101
          end
          item
            Caption = #1030#1090#1086#1075#1086#1074#1110' '#1087#1086#1082#1072#1079#1085#1080#1082#1080
            FixedKind = fkRight
            Width = 180
          end>
        object OBJECT_TYPE: TcxGridDBBandedColumn
          Caption = #1058#1080#1087
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'OBJECT_TYPE'
        end
        object SHOW_TITLE_: TcxGridDBBandedColumn
          Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Styles.OnGetContentStyle = ViewLevelMonthDBBandedColumn1StylesGetContentStyle
          Width = 196
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'SHOW_TITLE'
        end
        object PLAN_VALUE_: TcxGridDBBandedColumn
          Caption = #1055#1083#1072#1085
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Styles.OnGetContentStyle = ViewLevelMonthDBBandedColumn2StylesGetContentStyle
          Width = 97
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'PLAN_VALUE'
        end
        object BU_KASSA_FACT_: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1072' '#1074#1080#1082#1086#1085#1072#1085#1085#1103
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Styles.OnGetContentStyle = ViewLevelMonthDBBandedColumn3StylesGetContentStyle
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KASSA_FACT'
        end
        object DIFF_FROM_PLAN_: TcxGridDBBandedColumn
          Caption = #1042#1110#1076#1093#1080#1083#1077#1085#1085#1103' '#1074#1110#1076' '#1087#1083#1072#1085#1091
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevelMonthDBBandedColumn4StylesGetContentStyle
          Position.BandIndex = 2
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'DIFF_FROM_PLAN'
        end
        object PROFIT_FLAG_TITLE_EX_: TcxGridDBBandedColumn
          Visible = False
          GroupIndex = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          SortOrder = soDescending
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'PROFIT_FLAG_TITLE_EX'
          IsCaptionAssigned = True
        end
        object PLAN_VALUE_FC_: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'PLAN_VALUE_FC'
        end
        object BU_KASSA_FACT_FC_: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KASSA_FACT_FC'
        end
        object DIFF_FROM_PLAN_FC_: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 6
          Position.RowIndex = 0
          DataBinding.FieldName = 'DIFF_FROM_PLAN_FC'
        end
      end
      object PLReestrView: TcxGridDBBandedTableView
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'SUMMA'
            Column = PLReestrViewDBBandedColumn2
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridBandedTableViewStyleSheetHighContrastWhite
        Bands = <
          item
            Caption = #1056#1077#1082#1074#1110#1079#1080#1090#1080' '#1087#1083#1072#1090#1110#1078#1085#1086#1075#1086' '#1076#1086#1088#1091#1095#1077#1085#1085#1103
            Width = 559
          end
          item
            Caption = #1044#1086#1087#1086#1084#1110#1078#1085#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
            Width = 181
          end>
        object PLReestrViewDBBandedColumn1: TcxGridDBBandedColumn
          Caption = #1053#1086#1084#1077#1088', '#1076#1072#1090#1072' '#1087#1083#1072#1090#1110#1078#1085#1086#1075#1086' '#1076#1086#1088#1091#1095#1077#1085#1085#1103
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 130
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'D_ATTR'
        end
        object PLReestrViewDBBandedColumn2: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1072
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 99
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'SUMMA'
        end
        object PLReestrViewDBBandedColumn4: TcxGridDBBandedColumn
          Caption = #1055#1110#1076#1089#1090#1072#1074#1072' '#1087#1083#1072#1090#1077#1078#1091
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 200
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'NOTE'
        end
        object PLReestrViewDBBandedColumn5: TcxGridDBBandedColumn
          Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 97
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'USER_FIO'
        end
        object PLReestrViewDBBandedColumn6: TcxGridDBBandedColumn
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1090#1074#1086#1088#1077#1085#1086
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          SortOrder = soAscending
          Width = 104
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'ADD_TIME'
        end
        object PLReestrViewDBBandedColumn3: TcxGridDBBandedColumn
          Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 105
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'NAME_CUSTOMER'
        end
        object PLReestrViewDBBandedColumn7: TcxGridDBBandedColumn
          Caption = #1052#1060#1054', '#1056'/'#1057
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 85
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'B_ATTR'
        end
      end
      object ViewLevel8: TcxGridDBBandedTableView
        DataController.DataSource = DataSource
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
        OptionsView.CellAutoHeight = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridBandedTableViewStyleSheetHighContrastWhite
        Styles.Content = cxStyle12
        Styles.ContentEven = cxStyle12
        Styles.ContentOdd = cxStyle12
        Bands = <
          item
            Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1073#1102#1076#1078#1077#1090#1091
            Width = 400
          end
          item
            Caption = #1059' '#1088#1086#1079#1088#1110#1079#1110' '#1073#1102#1076#1078#1077#1090#1110#1074
            Width = 579
          end>
        object ViewLevel8DBBandedColumn1: TcxGridDBBandedColumn
          Caption = #1044#1086#1093#1086#1076#1085#1110#1089#1090#1100
          Visible = False
          GroupIndex = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          SortOrder = soDescending
          Styles.OnGetContentStyle = ViewLevel8DBBandedColumn1StylesGetContentStyle
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'PROFIT_FLAG_TITLE_EX'
        end
        object ViewLevel8DBBandedColumn2: TcxGridDBBandedColumn
          Caption = #1056#1086#1079#1076#1110#1083'/'#1089#1090#1072#1090#1090#1103
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel8DBBandedColumn2StylesGetContentStyle
          Width = 215
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'SHOW_TITLE'
        end
        object BU_KASSA_FACTColumn: TcxGridDBBandedColumn
          Caption = #1059#1087#1088#1072#1074#1083#1110#1085#1089#1100#1082#1080#1081
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel8DBBandedColumn3StylesGetContentStyle
          Width = 107
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'BU_KASSA_FACT'
        end
        object FACT_FINANCEColumn: TcxGridDBBandedColumn
          Caption = #1060#1110#1085#1072#1085#1089#1086#1074#1080#1081
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel8DBBandedColumn4StylesGetContentStyle
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'FACT_FINANCE'
        end
        object ViewLevel8DBBandedColumn5: TcxGridDBBandedColumn
          Caption = #1057#1090#1080#1083#1100
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel8DBBandedColumn5StylesGetContentStyle
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'IS_DETAIL'
        end
      end
      object ViewLevel10: TcxGridDBBandedTableView
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnVertSizing = False
        OptionsView.CellAutoHeight = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridBandedTableViewStyleSheetHighContrastWhite
        Styles.Content = cxStyle12
        Styles.ContentEven = cxStyle12
        Styles.ContentOdd = cxStyle12
        Bands = <
          item
            Caption = #1047#1074#1110#1090' '#1087#1086' '#1075#1088#1091#1087#1110' '#1073#1102#1076#1078#1077#1090#1110#1074
            Width = 533
          end
          item
            Caption = ' '
            Width = 328
          end>
        object MonthShow_OBJECT_TYPE: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'OBJECT_TYPE'
        end
        object MonthShow_title: TcxGridDBBandedColumn
          Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1073#1102#1076#1078#1077#1090#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Styles.OnGetContentStyle = MonthShow_titleStylesGetContentStyle
          Width = 402
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'show_title'
        end
        object MonthShow_Plan_value: TcxGridDBBandedColumn
          Caption = #1047#1085#1072#1095#1077#1085#1085#1103' '#1079#1072' '#1087#1077#1088#1110#1086#1076
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Styles.OnGetContentStyle = ViewLevel10DBBandedColumn1StylesGetContentStyle
          Width = 131
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'Plan_value'
        end
        object ViewLevel10DBBandedColumn2: TcxGridDBBandedColumn
          Visible = False
          GroupIndex = 0
          Options.Editing = False
          Options.Filtering = False
          SortOrder = soAscending
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'GROUP1_SM_TITLE_TEXT'
          IsCaptionAssigned = True
        end
        object ViewLevel10DBBandedColumn3: TcxGridDBBandedColumn
          Visible = False
          GroupIndex = 1
          Options.Editing = False
          Options.Filtering = False
          SortOrder = soDescending
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'GROUP2_PROFIT_TITLE_TEXT'
          IsCaptionAssigned = True
        end
      end
      object Prgm_SmGroup: TcxGridLevel
        GridView = ViewLevel0
        Visible = False
      end
      object SmGroup_Sm: TcxGridLevel
        GridView = ViewLevel1
        Visible = False
      end
      object Sm_RazdSt: TcxGridLevel
        GridView = ViewLevel2
      end
      object SmGroup_Detail: TcxGridLevel
        GridView = ViewLevel3
        Visible = False
      end
      object SmGroup_RazdSt: TcxGridLevel
        GridView = ViewLevel4
        Visible = False
      end
      object SmMonthLevel: TcxGridLevel
        GridView = ViewLevelMonth
        Visible = False
      end
      object PLReestrLevel: TcxGridLevel
        GridView = PLReestrView
        Visible = False
      end
      object SmGroupV_Detail: TcxGridLevel
        GridView = ViewLevel8
        Visible = False
      end
      object SmGroup_MonthDetail: TcxGridLevel
        GridView = ViewLevel10
        Visible = False
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 353
    Top = 312
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsItalic]
      TextColor = clBlack
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15658734
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clSilver
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnHighlight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = cl3DLight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15658734
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clSilver
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = cl3DLight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object RAZD_STYLE: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = cl3DLight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
    end
    object ST_STYLE: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsItalic]
    end
    object SM_STYLE: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = cl3DLight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clInfoText
    end
    object RED_SUM_STYLE: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15658734
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object RAZD_STYLE_RED: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = cl3DLight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      TextColor = clRed
    end
    object ST_STYLE_RED: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsItalic]
      TextColor = clRed
    end
    object SM_STYLE_RED: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = cl3DLight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = cl3DLight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNone
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      TextColor = clBtnText
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10841658
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10841658
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle48: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle49: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle50: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle51: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle52: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10841658
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle53: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle54: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle55: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle56: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle57: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle58: TcxStyle
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    object GridTableViewStyleSheetHighContrastWhite: TcxGridTableViewStyleSheet
      Caption = 'High Contrast White'
      Styles.Content = cxStyle1
      Styles.ContentEven = cxStyle2
      Styles.ContentOdd = cxStyle3
      Styles.Inactive = cxStyle8
      Styles.Selection = cxStyle11
      Styles.Footer = cxStyle4
      Styles.Group = cxStyle5
      Styles.GroupByBox = cxStyle6
      Styles.Header = cxStyle7
      Styles.Indicator = cxStyle9
      Styles.Preview = cxStyle10
      BuiltIn = True
    end
    object GridBandedTableViewStyleSheetHighContrastWhite: TcxGridBandedTableViewStyleSheet
      Caption = 'High Contrast White'
      Styles.Content = cxStyle13
      Styles.ContentEven = cxStyle14
      Styles.ContentOdd = cxStyle15
      Styles.Inactive = cxStyle20
      Styles.Selection = cxStyle23
      Styles.Footer = cxStyle16
      Styles.Group = cxStyle17
      Styles.GroupByBox = cxStyle18
      Styles.Header = cxStyle19
      Styles.Indicator = cxStyle21
      Styles.Preview = cxStyle22
      Styles.BandHeader = cxStyle12
      BuiltIn = True
    end
    object GridTableViewStyleSheetWindowsClassic: TcxGridTableViewStyleSheet
      Caption = 'Windows Classic'
      Styles.Content = cxStyle25
      Styles.ContentEven = cxStyle26
      Styles.ContentOdd = cxStyle27
      Styles.Inactive = cxStyle32
      Styles.Selection = cxStyle35
      Styles.Footer = cxStyle28
      Styles.Group = cxStyle29
      Styles.GroupByBox = cxStyle30
      Styles.Header = cxStyle31
      Styles.Indicator = cxStyle33
      Styles.Preview = cxStyle34
      BuiltIn = True
    end
    object cxGridTableViewStyleSheet2: TcxGridTableViewStyleSheet
      Caption = 'Windows Classic'
      Styles.Content = cxStyle36
      Styles.ContentEven = cxStyle37
      Styles.ContentOdd = cxStyle38
      Styles.Inactive = cxStyle43
      Styles.Selection = cxStyle46
      Styles.Footer = cxStyle39
      Styles.Group = cxStyle40
      Styles.GroupByBox = cxStyle41
      Styles.Header = cxStyle42
      Styles.Indicator = cxStyle44
      Styles.Preview = cxStyle45
      BuiltIn = True
    end
    object cxGridTableViewStyleSheet3: TcxGridTableViewStyleSheet
      Caption = 'Windows Classic'
      Styles.Content = cxStyle47
      Styles.ContentEven = cxStyle48
      Styles.ContentOdd = cxStyle49
      Styles.Inactive = cxStyle54
      Styles.Selection = cxStyle57
      Styles.Footer = cxStyle50
      Styles.Group = cxStyle51
      Styles.GroupByBox = cxStyle52
      Styles.Header = cxStyle53
      Styles.Indicator = cxStyle55
      Styles.Preview = cxStyle56
      BuiltIn = True
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 376
    Top = 232
  end
  object DataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 440
    Top = 232
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TACommit
    Left = 408
    Top = 232
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 464
    Top = 320
  end
  object ExportPopupMenu: TPopupMenu
    Left = 42
    Top = 211
    object HTML1: TMenuItem
      Caption = #1044#1086' HTML '#1092#1086#1088#1084#1072#1090#1091
      OnClick = HTML1Click
    end
    object Excelajhvfne1: TMenuItem
      Caption = #1044#1086' Excel '#1092#1086#1088#1084#1072#1090#1091
      OnClick = Excelajhvfne1Click
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 2
    Top = 219
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbPageSetup]
    PreviewOptions.ShowCaptions = True
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38554.649386689800000000
    ReportOptions.LastChange = 41252.468552314810000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo4OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'end;'
      ''
      'procedure Memo1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      '     if (<DBDataset."DIFF_WITH_PLATS"><0)'
      '     then Memo31.Font.Color:=clRed'
      '     else Memo31.Font.Color:=clBlack;'
      ''
      '     if (<DBDataset."PLAN_VALUE"><0)'
      '     then Memo4.Font.Color:=clRed'
      '     else Memo4.Font.Color:=clBlack;'
      ''
      '     if (<DBDataset."BU_KASSA_FACT"><0)'
      '     then Memo9.Font.Color:=clRed'
      '     else Memo9.Font.Color:=clBlack;'
      ''
      '     if (<DBDataset."BU_KREDIT_Z"><0)'
      '     then Memo14.Font.Color:=clRed'
      '     else Memo14.Font.Color:=clBlack;'
      ''
      '     if (<DBDataset."DIFF_FROM_PLAN"><0)'
      '     then Memo17.Font.Color:=clRed'
      '     else Memo17.Font.Color:=clBlack;'
      ''
      '     if (<DBDataset."OBJECT_TYPE">=1)'
      '     then begin'
      ''
      '               Memo1.Color:=$00E4E4E4;'
      '               Memo4.Color:=$00E4E4E4;'
      '               Memo9.Color:=$00E4E4E4;'
      '               Memo14.Color:=$00E4E4E4;'
      '               Memo17.Color:=$00E4E4E4;'
      '               Memo31.Color:=$00E4E4E4;'
      '     end;'
      '     if (<DBDataset."OBJECT_TYPE">=2)'
      '     then begin'
      '               Memo1.Color:=$00E4E4E4;'
      '               Memo4.Color:=$00E4E4E4;'
      '               Memo9.Color:=$00E4E4E4;'
      '               Memo14.Color:=$00E4E4E4;'
      '               Memo17.Color:=$00E4E4E4;'
      '               Memo31.Color:=$00E4E4E4;'
      ''
      '     end;'
      '     if (<DBDataset."OBJECT_TYPE">=0)'
      '     then begin'
      '               Memo1.Color:=clWindow;'
      '               Memo4.Color:=clWindow;'
      '               Memo9.Color:=clWindow;'
      '               Memo14.Color:=clWindow;'
      '               Memo17.Color:=clWindow;'
      '               Memo31.Color:=clWindow;'
      '     end;'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 209
    Top = 299
    Datasets = <
      item
        DataSet = DBDataset
        DataSetName = 'DBDataset'
      end
      item
        DataSet = PlanRestDataset
        DataSetName = 'PlanRestDataset'
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
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 113.385900000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Top = 22.677180000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1072#1088#1090#1082#1072' '#1072#1085#1072#1083#1110#1090#1080#1095#1085#1086#1075#1086' '#1086#1073#1083#1110#1082#1091' '#1074#1080#1082#1086#1085#1072#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1091'('#1082#1072#1089#1086#1074#1080#1081' '#1086#1073#1083#1110#1082')')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 60.472480000000000000
          Width = 718.110700000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          HAlign = haCenter
          Memo.Strings = (
            '[TITLE]')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 105.826840000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '[DATE]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1088#1091#1082#1091)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        DataSet = DBDataset
        DataSetName = 'DBDataset'
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDataset."SHOW_TITLE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 264.566719210000000000
          Width = 83.149577010000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."PLAN_VALUE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 347.716760000000000000
          Width = 90.708637010000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."BU_KASSA_FACT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 438.425480000000000000
          Width = 94.488167010000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."BU_KREDIT_Z"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 532.914110790000000000
          Width = 94.488167010000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."DIFF_FROM_PLAN"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 627.402360790000000000
          Width = 90.708637010000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."DIFF_WITH_PLATS"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 37.795300000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        Condition = 'DBDataset."PROFIT_FLAG"'
        KeepChild = True
        KeepTogether = True
        OutlineText = 'DBDataset."PROFIT_FLAG"'
        object Memo2: TfrxMemoView
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          AllowHTMLTags = True
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDataset."PROFIT_FLAG_TITLE_EX"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 264.567100000000000000
          Width = 83.149660000000000000
          Height = 37.795300000000000000
          AllowHTMLTags = True
          Color = 14211288
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 347.717140790000000000
          Width = 90.708720000000000000
          Height = 37.795300000000000000
          AllowHTMLTags = True
          Color = 14211288
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 438.425860790000000000
          Width = 94.488250000000000000
          Height = 37.795300000000000000
          AllowHTMLTags = True
          Color = 14211288
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 532.914491580000000000
          Width = 94.488250000000000000
          Height = 37.795300000000000000
          AllowHTMLTags = True
          Color = 14211288
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 627.402741580000000000
          Width = 90.708720000000000000
          Height = 37.795300000000000000
          AllowHTMLTags = True
          Color = 14211288
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 37.795300000000000000
        Top = 563.149970000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Left = 578.268090000000000000
          Top = 7.559060000000040000
          Width = 136.063080000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[Page]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = -0.000000000000000444
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559060000000040000
          Width = 570.709030000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1089#1092#1086#1088#1084#1086#1074#1072#1085#1086' [date]'
            #1089#1090#1072#1085' '#1073#1102#1076#1078#1077#1090#1091' [date_data]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 37.795300000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        RowCount = 1
        Stretched = True
        object Memo13: TfrxMemoView
          Width = 264.567100000000000000
          Height = 37.795300000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1076#1110#1083'/'#1089#1090#1072#1090#1090#1103' '#1073#1102#1076#1078#1077#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 264.566719210000000000
          Width = 83.149577010000000000
          Height = 37.795300000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1083#1072#1085#1086#1074#1110' '#1087#1086#1082#1072#1079#1085#1080#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 347.716760000000000000
          Width = 90.708637010000000000
          Height = 37.795300000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1072#1089#1086#1074#1080#1081' '
            #1086#1073#1083#1110#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 438.425480000000000000
          Width = 94.488167010000000000
          Height = 37.795300000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1110#1089#1090#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 532.914110790000000000
          Width = 94.488167010000000000
          Height = 37.795300000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1093#1080#1083#1077#1085#1085#1103' '#1074#1110#1076' '#1087#1083#1072#1085#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 627.402360790000000000
          Width = 90.708637010000000000
          Height = 37.795300000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1093#1080#1083#1077#1085#1085#1103' '#1074#1110#1076' '#1087#1083#1072#1085#1091' '#1079' '#1091#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084' '#1085#1077#1086#1073'. '#1087#1083#1072#1090#1110#1078#1085#1080#1093' '#1076#1086#1088#1091#1095#1077#1085#1100)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 264.567100000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -12
          Highlight.Font.Name = 'Times New Roman'
          Highlight.Font.Style = []
          Highlight.Color = clSilver
          Highlight.Condition = 'Value<0'
          Memo.Strings = (
            '[SUM(<DBDataset."PLAN_VALUE_FC">,MasterData1)]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 347.716760000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -12
          Highlight.Font.Name = 'Times New Roman'
          Highlight.Font.Style = []
          Highlight.Color = clSilver
          Highlight.Condition = 'Value<0'
          Memo.Strings = (
            '[SUM(<DBDataset."BU_KASSA_FACT_FC">,MasterData1)]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 438.425480000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -12
          Highlight.Font.Name = 'Times New Roman'
          Highlight.Font.Style = []
          Highlight.Color = clSilver
          Highlight.Condition = 'Value<0'
          Memo.Strings = (
            '[SUM(<DBDataset."BU_KREDIT_Z_FC">,MasterData1)]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 532.913730000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -12
          Highlight.Font.Name = 'Times New Roman'
          Highlight.Font.Style = []
          Highlight.Color = clSilver
          Highlight.Condition = 'Value<0'
          Memo.Strings = (
            '[SUM(<DBDataset."DIFF_FROM_PLAN_FC">,MasterData1)]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DBDataset."PROFIT_FLAG_TITLE"]:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 627.401980000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -12
          Highlight.Font.Name = 'Times New Roman'
          Highlight.Font.Style = []
          Highlight.Color = clSilver
          Highlight.Condition = 'Value<0'
          Memo.Strings = (
            '[SUM(<DBDataset."DIFF_WITH_PLATS">,MasterData1)]')
          ParentFont = False
        end
      end
      object MasterData3: TfrxMasterData
        Height = 105.826840000000000000
        Top = 396.850650000000000000
        Width = 718.110700000000000000
        DataSet = PlanRestDataset
        DataSetName = 'PlanRestDataset'
        RowCount = 0
        object Memo25: TfrxMemoView
          Top = 18.897650000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1082#1086#1096#1090#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Top = 49.133890000000000000
          Width = 362.834880000000000000
          Height = 34.015770000000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1043#1088#1086#1096#1086#1074#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 362.834880000000000000
          Top = 49.133890000000000000
          Width = 355.275820000000000000
          Height = 34.015770000000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047' '#1091#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084' '#1079#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1086#1089#1090#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Top = 83.149660000000000000
          Width = 362.834880000000000000
          Height = 22.677180000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -12
          Highlight.Font.Name = 'Times New Roman'
          Highlight.Font.Style = []
          Highlight.Condition = 'Value<0'
          Memo.Strings = (
            '[PlanRestDataset."REST_K"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 362.834880000000000000
          Top = 83.149660000000000000
          Width = 355.275820000000000000
          Height = 22.677180000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Times New Roman'
          Highlight.Font.Style = []
          Highlight.Condition = 'Value<0'
          Memo.Strings = (
            '[PlanRestDataset."REST_Z"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object DBDataset: TfrxDBDataset
    UserName = 'DBDataset'
    CloseDataSource = False
    DataSet = DataSet
    Left = 249
    Top = 299
  end
  object PlanRestsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 376
    Top = 264
    poSQLINT64ToBCD = True
  end
  object PlanRestDataset: TfrxDBDataset
    UserName = 'PlanRestDataset'
    CloseDataSource = False
    DataSet = PlanRestsDataSet
    Left = 281
    Top = 299
  end
  object RestDataSource: TDataSource
    DataSet = PlanRestsDataSet
    Left = 505
    Top = 232
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    ShowProgress = True
    Left = 329
    Top = 206
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 441
    Top = 198
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 473
    Top = 198
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 505
    Top = 198
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 401
    Top = 302
  end
  object frxBMPExport1: TfrxBMPExport
    UseFileCache = True
    Left = 569
    Top = 134
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 273
    Top = 214
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    Left = 473
    Top = 254
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 577
    Top = 238
  end
  object RowDataSet: TfrxUserDataSet
    RangeEnd = reCount
    UserName = 'RowDataSet'
    Left = 224
    Top = 248
  end
  object ColDataSet: TfrxUserDataSet
    RangeEnd = reCount
    UserName = 'ColDataSet'
    Left = 256
    Top = 248
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 110
    Top = 235
  end
  object PrintPopupMenu: TPopupMenu
    Left = 72
    Top = 197
    object N1: TMenuItem
      Caption = #1050#1072#1089#1086#1074#1080#1081' '#1086#1073#1083#1110#1082
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1060#1110#1085#1072#1085#1089#1086#1074#1080#1081' '#1086#1073#1083#1110#1082
      OnClick = N2Click
    end
  end
  object UnWorkedPLDocsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 408
    Top = 264
    poSQLINT64ToBCD = True
  end
  object UpWorkSource: TfrxDBDataset
    UserName = 'UpWorkSource'
    CloseDataSource = False
    DataSet = UnWorkedPLDocsDataSet
    Left = 288
    Top = 248
  end
  object ExtendedPopupMenu: TPopupMenu
    Left = 152
    Top = 248
    object N3: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1090#1080' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1102' '#1087#1086' '#1072#1089#1080#1075#1085#1091#1074#1072#1085#1085#1103#1084
      OnClick = N3Click
    end
  end
end
