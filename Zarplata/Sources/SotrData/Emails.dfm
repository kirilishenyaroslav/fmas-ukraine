object frmUseEmail: TfrmUseEmail
  Left = 347
  Top = 262
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1079' '#1088#1086#1079#1089#1080#1083#1082#1080
  ClientHeight = 348
  ClientWidth = 663
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 307
    Width = 663
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 504
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 584
      Top = 8
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
    Width = 663
    Height = 33
    Align = alTop
    TabOrder = 1
    object cxCheckBox1: TcxCheckBox
      Left = 8
      Top = 4
      Width = 401
      Height = 21
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox1PropertiesChange
      Properties.Caption = #1056#1086#1079#1089#1080#1083#1072#1090#1080' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1102' '#1087#1086' '#1079#1072#1088#1087#1083#1072#1090#1110'/'#1089#1090#1080#1087#1077#1085#1076#1110#1111
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 33
    Width = 249
    Height = 274
    Align = alLeft
    Caption = 'Panel3'
    TabOrder = 2
    object ListGrid: TcxGrid
      Left = 1
      Top = 42
      Width = 247
      Height = 231
      Align = alClient
      TabOrder = 0
      object ListGridTabView: TcxGridDBTableView
        DataController.DataSource = PeriodsDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'TN'
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = TNColumn
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object TNColumn: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1087#1077#1088#1110#1086#1076#1091' '#1088#1086#1079#1089#1080#1083#1082#1080
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 183
          DataBinding.FieldName = 'date_beg'
        end
        object FIOColumn: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091' '#1088#1086#1079#1089#1080#1083#1082#1080
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 176
          DataBinding.FieldName = 'date_end'
        end
      end
      object ListGridLevel1: TcxGridLevel
        GridView = ListGridTabView
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 247
      Height = 41
      Align = alTop
      TabOrder = 1
      object cxButton3: TcxButton
        Left = 1
        Top = 8
        Width = 75
        Height = 25
        Caption = #1044#1086#1076#1072#1090#1080
        TabOrder = 0
        OnClick = cxButton3Click
      end
      object cxButton4: TcxButton
        Left = 80
        Top = 8
        Width = 75
        Height = 25
        Caption = #1042#1080#1076#1072#1083#1080#1090#1080
        TabOrder = 1
        OnClick = cxButton4Click
      end
      object cxButton9: TcxButton
        Left = 159
        Top = 8
        Width = 75
        Height = 25
        Caption = #1047#1084#1110#1085#1080#1090#1080
        TabOrder = 2
        OnClick = cxButton9Click
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 249
    Top = 33
    Width = 8
    Height = 274
    Control = Panel3
  end
  object Panel4: TPanel
    Left = 257
    Top = 33
    Width = 406
    Height = 274
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 4
    object cxGrid1: TcxGrid
      Left = 1
      Top = 42
      Width = 404
      Height = 231
      Align = alClient
      TabOrder = 0
      object cxGridDBTableView1: TcxGridDBTableView
        DataController.DataSource = ValuesDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'TN'
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = cxGridDBColumn1
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = #1050#1086#1085#1090#1072#1082#1090' '#1076#1083#1103' '#1088#1086#1079#1089#1080#1083#1082#1080
          PropertiesClassName = 'TcxHyperLinkEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 195
          DataBinding.FieldName = 'value_contact'
        end
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1076#1110#1111' '#1082#1086#1085#1090#1072#1082#1090#1091
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 93
          DataBinding.FieldName = 'date_beg'
        end
        object cxGridDBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1076#1110#1111' '#1082#1086#1085#1090#1072#1082#1090#1091
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 114
          DataBinding.FieldName = 'date_end'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 404
      Height = 41
      Align = alTop
      TabOrder = 1
      object cxButton5: TcxButton
        Left = 13
        Top = 8
        Width = 75
        Height = 25
        Caption = #1044#1086#1076#1072#1090#1080
        TabOrder = 0
        OnClick = cxButton5Click
      end
      object cxButton6: TcxButton
        Left = 94
        Top = 8
        Width = 75
        Height = 25
        Caption = #1042#1080#1076#1072#1083#1080#1090#1080
        TabOrder = 1
        OnClick = cxButton6Click
      end
      object cxButton7: TcxButton
        Left = 258
        Top = 8
        Width = 75
        Height = 25
        Caption = #1055#1088#1086#1090#1086#1082#1086#1083
        TabOrder = 2
        OnClick = cxButton7Click
      end
      object cxButton8: TcxButton
        Left = 176
        Top = 8
        Width = 75
        Height = 25
        Caption = #1047#1084#1110#1085#1080#1090#1080
        TabOrder = 3
        OnClick = cxButton8Click
      end
    end
  end
  object Styles: TcxStyleRepository
    Left = 384
    Top = 8
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
      Color = 10382168
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
      Color = 13249860
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
  end
  object WorkDatabase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=win1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 80
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 56
    Top = 80
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 88
    Top = 80
  end
  object PeriodsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 24
    Top = 112
    poSQLINT64ToBCD = True
  end
  object PeriodsDataSource: TDataSource
    DataSet = PeriodsDataSet
    Left = 56
    Top = 112
  end
  object ValuesDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    DataSource = PeriodsDataSource
    Left = 24
    Top = 144
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object ValuesDataSource: TDataSource
    DataSet = ValuesDataSet
    Left = 56
    Top = 144
  end
end
