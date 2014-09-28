object frmGetSchFilter: TfrmGetSchFilter
  Left = 273
  Top = 165
  BorderStyle = bsDialog
  Caption = #1060#1110#1083#1100#1090#1088' '#1085#1072' '#1088#1072#1093#1091#1085#1082#1080' '#1073#1072#1083#1072#1085#1089#1091
  ClientHeight = 402
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 449
    Height = 361
    Align = alClient
    TabOrder = 0
    object cxGrid3: TcxGrid
      Left = 1
      Top = 1
      Width = 447
      Height = 359
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      object OstView: TcxGridDBBandedTableView
        DataController.DataSource = SchDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'DB_SUMMA'
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'KR_SUMMA'
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'DB_SUMMA'
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'KR_SUMMA'
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.HeaderAutoHeight = True
        Styles.Background = cxStyle1
        Styles.Content = cxStyle1
        Styles.Footer = columnst
        Styles.Header = cxStyle3
        Styles.BandBackground = cxStyle1
        Styles.BandHeader = cxStyle3
        Bands = <
          item
            Caption = #1042#1080#1073#1077#1088#1110#1090#1100' '#1088#1072#1093#1091#1085#1082#1080' '#1076#1083#1103' '#1079#1074#1110#1090#1091
            Width = 473
          end>
        object SchColumn: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          SortOrder = soAscending
          Width = 323
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'SCH_NUMBER'
          IsCaptionAssigned = True
        end
        object OstViewDBBandedColumn1: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Options.Filtering = False
          Width = 120
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'IS_CHECKED'
          IsCaptionAssigned = True
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = OstView
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 361
    Width = 449
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 286
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 366
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 8
    Top = 8
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object columnst: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
  end
  object SchDataSet: TRxMemoryData
    FieldDefs = <>
    Left = 8
    Top = 328
  end
  object SchFibDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from MBOOK_SCH_Z_SELECT')
    Left = 40
    Top = 328
    poSQLINT64ToBCD = True
  end
  object SchDataSource: TDataSource
    DataSet = SchDataSet
    Left = 72
    Top = 328
  end
end
