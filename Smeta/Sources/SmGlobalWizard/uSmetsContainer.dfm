object frmGetSmForAnalize: TfrmGetSmForAnalize
  Left = 271
  Top = 278
  BorderStyle = bsDialog
  Caption = #1042#1080#1073#1077#1088#1110#1090#1100' '#1073#1102#1076#1078#1077#1090#1080' '#1076#1083#1103' '#1072#1085#1072#1083#1110#1079#1091
  ClientHeight = 253
  ClientWidth = 689
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 200
    Width = 689
    Height = 53
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 272
      Top = 16
      Width = 75
      Height = 25
      Caption = #1040#1085#1072#1083#1110#1079
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 352
      Top = 16
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 689
    Height = 200
    Align = alClient
    TabOrder = 1
    object cxGrid3: TcxGrid
      Left = 1
      Top = 1
      Width = 599
      Height = 198
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      object PeriodsView: TcxGridDBTableView
        DataController.DataSource = SmPeriodsDataSource
        DataController.DetailKeyFieldNames = 'date_beg;date_end'
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.Background = back
        Styles.Content = back
        Styles.Header = cxStyle1
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          SortOrder = soDescending
          Width = 112
          DataBinding.FieldName = 'DATE_BEG'
        end
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Styles.Content = back
          Width = 93
          DataBinding.FieldName = 'DATE_END'
        end
        object cxGridDBColumn3: TcxGridDBColumn
          Caption = #1041#1102#1076#1078#1077#1090
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 190
          DataBinding.FieldName = 'SMETA_TITLE'
        end
        object cxGridDBColumn4: TcxGridDBColumn
          Caption = #1050#1086#1084#1077#1085#1090#1072#1088
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 198
          DataBinding.FieldName = 'NOTE'
        end
        object IsDraft: TcxGridDBColumn
          Caption = #1055#1088#1086#1077#1082#1090
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = 0
          Properties.ValueUnchecked = 1
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 90
          DataBinding.FieldName = 'IS_ENABLE_IN_BUHG'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = PeriodsView
      end
    end
    object Panel3: TPanel
      Left = 600
      Top = 1
      Width = 88
      Height = 198
      Align = alRight
      TabOrder = 1
      object cxButton3: TcxButton
        Left = 5
        Top = 16
        Width = 75
        Height = 25
        Caption = #1044#1086#1076#1072#1090#1080
        TabOrder = 0
        OnClick = cxButton3Click
      end
      object cxButton4: TcxButton
        Left = 5
        Top = 48
        Width = 75
        Height = 25
        Caption = #1042#1080#1076#1072#1083#1080#1090#1080
        TabOrder = 1
        OnClick = cxButton4Click
      end
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 56
  end
  object GetInfoDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 48
    Top = 56
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 80
    Top = 56
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 144
    Top = 56
    object back: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object column_gray: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object periods: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clRed
    end
    object SilverStyle: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clInfoBk
      TextColor = clSilver
    end
  end
  object SmPeriodsDataSource: TDataSource
    DataSet = GetInfoDataSet
    Left = 112
    Top = 56
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 80
    Top = 88
  end
end
