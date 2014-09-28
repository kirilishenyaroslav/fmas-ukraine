object SelPochasForm: TSelPochasForm
  Left = 427
  Top = 277
  Width = 860
  Height = 563
  Caption = #1055#1086#1075#1086#1076#1080#1085#1085#1072' '#1086#1087#1083#1072#1090#1072' '#1087#1088#1072#1094#1110
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
    Top = 0
    Width = 844
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 11
      Top = 20
      Width = 103
      Height = 16
      Caption = #1055#1086#1096#1091#1082' '#1079#1072' '#1055#1030#1041':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxButton1: TcxButton
      Left = 399
      Top = 16
      Width = 83
      Height = 25
      Caption = #1064#1091#1082#1072#1090#1080
      TabOrder = 0
      OnClick = cxButton1Click
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = True
    end
    object cxButton2: TcxButton
      Left = 499
      Top = 16
      Width = 83
      Height = 25
      Caption = #1057#1082#1072#1089#1091#1074#1072#1090#1080
      TabOrder = 1
      OnClick = cxButton2Click
      LookAndFeel.Kind = lfStandard
    end
    object cxButton3: TcxButton
      Left = 599
      Top = 16
      Width = 83
      Height = 25
      Caption = #1054#1073#1088#1072#1090#1080
      TabOrder = 2
      OnClick = cxButton3Click
      LookAndFeel.Kind = lfStandard
    end
    object SearchEdit: TEdit
      Left = 119
      Top = 18
      Width = 229
      Height = 21
      TabOrder = 3
    end
  end
  object PochasGrid: TcxGrid
    Left = 0
    Top = 57
    Width = 844
    Height = 468
    Align = alClient
    TabOrder = 1
    object PochasGridView: TcxGridDBTableView
      OnDblClick = PochasGridViewDblClick
      OnKeyDown = PochasGridViewKeyDown
      DataController.DataSource = DSPochas
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = cxGridTableViewStyleSheet1
      object PochasGridViewDBColumn1: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_POCHAS_PLAN'
      end
      object PochasGridViewDBColumn2: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_MAN'
      end
      object PochasGridViewDBColumn9: TcxGridDBColumn
        Caption = #1055#1030#1041
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        GroupIndex = 0
        SortOrder = soAscending
        Width = 130
        DataBinding.FieldName = 'FIO'
      end
      object PochasGridViewDBColumn3: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1072#1079#1091
        Width = 75
        DataBinding.FieldName = 'NUM_ORDER'
      end
      object PochasGridViewDBColumn4: TcxGridDBColumn
        Caption = #1058#1072#1088#1080#1092
        Width = 52
        DataBinding.FieldName = 'TARIF'
      end
      object PochasGridViewDBColumn5: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
        Width = 72
        DataBinding.FieldName = 'DATE_BEG'
      end
      object PochasGridViewDBColumn6: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1082#1110#1085#1094#1103
        Width = 67
        DataBinding.FieldName = 'DATE_END'
      end
      object PochasGridViewDBColumn7: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1091
        Width = 215
        DataBinding.FieldName = 'NAME_DEPARTMENT'
      end
      object PochasGridViewDBColumn8: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1087#1086#1075#1086#1076#1080#1085#1082#1080
        Width = 214
        DataBinding.FieldName = 'POCHAS_TYPE'
      end
    end
    object PochasGridLevel1: TcxGridLevel
      GridView = PochasGridView
    end
  end
  object DSPochas: TDataSource
    DataSet = DSetPochas
    Left = 264
    Top = 136
  end
  object DSetPochas: TpFIBDataSet
    Database = frmPochasDisOrder.Database
    Transaction = ReadTr
    Left = 304
    Top = 136
    poSQLINT64ToBCD = True
  end
  object ReadTr: TpFIBTransaction
    DefaultDatabase = frmPochasDisOrder.Database
    TimeoutAction = TARollback
    Left = 344
    Top = 136
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 40
    Top = 176
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
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 14745599
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16776176
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
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      Caption = 'qizzStyle'
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
      BuiltIn = True
    end
  end
end
