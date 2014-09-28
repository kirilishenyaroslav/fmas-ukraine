object Arnd_Dog_Hist_Form: TArnd_Dog_Hist_Form
  Left = 669
  Top = 469
  Width = 611
  Height = 527
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1076#1086#1075#1086#1074#1086#1088#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BottomPanel: TPanel
    Left = 0
    Top = 443
    Width = 603
    Height = 57
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object St_Label: TLabel
      Left = 56
      Top = 26
      Width = 409
      Height = 13
      AutoSize = False
      Caption = 'St_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label20: TLabel
      Left = 14
      Top = 26
      Width = 38
      Height = 13
      Caption = #1057#1090#1072#1090#1100#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 12
      Top = 14
      Width = 40
      Height = 13
      Caption = #1056#1072#1079#1076#1077#1083':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 17
      Top = 2
      Width = 35
      Height = 13
      Caption = #1057#1084#1077#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object S_Label: TLabel
      Left = 56
      Top = 2
      Width = 409
      Height = 13
      AutoSize = False
      Caption = 'S_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object R_Label: TLabel
      Left = 56
      Top = 14
      Width = 409
      Height = 13
      AutoSize = False
      Caption = 'R_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label15: TLabel
      Left = 21
      Top = 39
      Width = 31
      Height = 13
      Caption = #1050#1045#1050#1042':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object KEKV_Label: TLabel
      Left = 56
      Top = 39
      Width = 409
      Height = 13
      AutoSize = False
      Caption = 'KEKV_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object CloseButton: TcxButton
      Left = 472
      Top = 16
      Width = 115
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      OnClick = CloseButtonClick
    end
  end
  object SmetaPanel: TPanel
    Left = 0
    Top = 230
    Width = 603
    Height = 213
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object HistSGrid: TcxGrid
      Left = 0
      Top = 0
      Width = 310
      Height = 213
      Align = alClient
      TabOrder = 0
      object HistSTableView: TcxGridBandedTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = SUseBegColumn
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = HistSTableViewFocusedRecordChanged
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnSorting = False
        OptionsCustomize.BandMoving = False
        OptionsCustomize.BandSizing = False
        OptionsCustomize.ColumnVertSizing = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = GridBandedTableViewStyleSheet
        Bands = <
          item
            Caption = #1057#1091#1084#1084#1099' '#1073#1077#1079' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
          end>
        object SUseBegColumn: TcxGridBandedColumn
          Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          SortOrder = soDescending
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object SUseEndColumn: TcxGridBandedColumn
          Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
      end
      object HistSGridLevel: TcxGridLevel
        GridView = HistSTableView
      end
    end
    object SmetaGrid: TcxGrid
      Left = 310
      Top = 0
      Width = 293
      Height = 213
      Align = alRight
      TabOrder = 1
      object SmetaTableView: TcxGridDBTableView
        DataController.DataSource = SmetaDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = SSum_Column
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = SmetaTableViewFocusedRecordChanged
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 38
        Styles.StyleSheet = GridTableViewStyleSheet
        object S_Column: TcxGridDBColumn
          Caption = #1057#1084#1077#1090#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 55
          DataBinding.FieldName = 'KOD_S'
        end
        object R_Column: TcxGridDBColumn
          Caption = #1056#1072#1079#1076#1077#1083
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 49
          DataBinding.FieldName = 'KOD_R'
        end
        object St_Column: TcxGridDBColumn
          Caption = #1057#1090#1072#1090#1100#1103
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 48
          DataBinding.FieldName = 'KOD_ST'
        end
        object Kekv_Column: TcxGridDBColumn
          Caption = #1050#1045#1050#1042
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 48
          DataBinding.FieldName = 'KOD_KEKV'
        end
        object SSum_Column: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 91
          DataBinding.FieldName = 'SUMMA'
        end
        object S_Name_Column: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'NAME_S'
        end
        object R_Name_Column: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'NAME_R'
        end
        object St_Name_Column: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'NAME_ST'
        end
        object Kekv_Name_Column: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'NAME_KEKV'
        end
      end
      object SmetaGridLevel: TcxGridLevel
        GridView = SmetaTableView
      end
    end
  end
  object PerPanel: TPanel
    Left = 0
    Top = 0
    Width = 603
    Height = 230
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object HistGrid: TcxGrid
      Left = 0
      Top = 0
      Width = 310
      Height = 230
      Align = alClient
      TabOrder = 0
      object HistTableView: TcxGridBandedTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = Use_Beg_Column
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = HistTableViewFocusedRecordChanged
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnSorting = False
        OptionsCustomize.BandMoving = False
        OptionsCustomize.BandSizing = False
        OptionsCustomize.ColumnVertSizing = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = GridBandedTableViewStyleSheet
        Bands = <
          item
            Caption = #1055#1077#1088#1080#1086#1076#1099' '#1073#1077#1079' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
          end>
        object Use_Beg_Column: TcxGridBandedColumn
          Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Sorting = False
          SortOrder = soDescending
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object Use_End_Column: TcxGridBandedColumn
          Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Sorting = False
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
      end
      object HistGridLevel: TcxGridLevel
        GridView = HistTableView
      end
    end
    object PeriodGrid: TcxGrid
      Left = 310
      Top = 0
      Width = 293
      Height = 230
      Align = alRight
      TabOrder = 1
      object PeriodTableView: TcxGridDBTableView
        DataController.DataSource = PeriodDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = Date_Beg_Column
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = PeriodTableViewFocusedRecordChanged
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.HeaderHeight = 38
        Styles.StyleSheet = GridTableViewStyleSheet
        object id_Period_Column: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'ID_PERIOD_PARAM'
        end
        object Date_Beg_Column: TcxGridDBColumn
          Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          SortOrder = soAscending
          Width = 99
          DataBinding.FieldName = 'DATE_BEG_PARAM'
        end
        object Date_End_Column: TcxGridDBColumn
          Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1087#1077#1088#1080#1086#1076#1072
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 86
          DataBinding.FieldName = 'dATE_END_PARAM'
        end
        object Sum_Column: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 109
          DataBinding.FieldName = 'SUMMA_PARAM'
        end
      end
      object PeriodGridLevel: TcxGridLevel
        GridView = PeriodTableView
      end
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 72
    Top = 110
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
      Color = 15451300
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
      Color = 16247513
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
  object HistDataSet: TpFIBDataSet
    Database = Arnd_Contract_Add_Form.Database
    Transaction = Arnd_Contract_Add_Form.ReadTransaction
    UpdateTransaction = Arnd_Contract_Add_Form.WriteTransaction
    Left = 104
    Top = 72
    poSQLINT64ToBCD = True
  end
  object PeriodDataSet: TpFIBDataSet
    Database = Arnd_Contract_Add_Form.Database
    Transaction = Arnd_Contract_Add_Form.ReadTransaction
    UpdateTransaction = Arnd_Contract_Add_Form.WriteTransaction
    Left = 368
    Top = 48
    poSQLINT64ToBCD = True
  end
  object SmetaDataSet: TpFIBDataSet
    Database = Arnd_Contract_Add_Form.Database
    Transaction = Arnd_Contract_Add_Form.ReadTransaction
    UpdateTransaction = Arnd_Contract_Add_Form.WriteTransaction
    Left = 408
    Top = 272
    poSQLINT64ToBCD = True
  end
  object PeriodDataSource: TDataSource
    DataSet = PeriodDataSet
    Left = 400
    Top = 48
  end
  object SmetaDataSource: TDataSource
    DataSet = SmetaDataSet
    Left = 440
    Top = 272
  end
  object SHistDataSet: TpFIBDataSet
    Database = Arnd_Contract_Add_Form.Database
    Transaction = Arnd_Contract_Add_Form.ReadTransaction
    UpdateTransaction = Arnd_Contract_Add_Form.WriteTransaction
    Left = 112
    Top = 272
    poSQLINT64ToBCD = True
  end
  object ActionList1: TActionList
    Left = 392
    Top = 440
    object Action3: TAction
      Caption = 'Exit'
      ShortCut = 27
      OnExecute = Action3Execute
    end
  end
end
