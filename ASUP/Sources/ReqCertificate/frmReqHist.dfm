object frmHist: TfrmHist
  Left = 271
  Top = 130
  Width = 870
  Height = 431
  Caption = 'frmHist'
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
    Width = 862
    Height = 399
    Align = alClient
    TabOrder = 0
    object ItemsGrid: TcxGrid
      Left = 1
      Top = 1
      Width = 860
      Height = 397
      Align = alClient
      TabOrder = 0
      object cxGridDBTableView5: TcxGridDBTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = cxGridTableViewStyleSheet1
        object cxGridDBTableView5DBColumn1: TcxGridDBColumn
          Caption = #1055#1030#1041
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Options.Filtering = False
          Width = 319
          DataBinding.FieldName = 'US_FIO_HST'
        end
        object cxGridDBTableView5DBColumn2: TcxGridDBColumn
          Caption = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
          Options.Editing = False
          Options.Filtering = False
          Width = 185
          DataBinding.FieldName = 'TYPE_POST'
        end
        object cxGridDBTableView5DBColumn5: TcxGridDBColumn
          Caption = #1055#1086#1089#1072#1076#1072
          Options.Editing = False
          Options.Filtering = False
          Width = 212
          DataBinding.FieldName = 'NAME_POST'
        end
        object cxGridDBTableView5DBColumn3: TcxGridDBColumn
          Caption = #1057#1090#1072#1074#1082#1072
          Options.Editing = False
          Options.Filtering = False
          Width = 142
          DataBinding.FieldName = 'RATE_COUNT'
        end
      end
      object cxGridLevel5: TcxGridLevel
        GridView = cxGridDBTableView5
      end
    end
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 860
      Height = 397
      Align = alClient
      TabOrder = 1
      object cxGridDBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSource1
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = cxGridTableViewStyleSheet1
        object cxGridDBTableView1DBColumn4: TcxGridDBColumn
          Caption = #1060'. '#1030'. '#1054'.'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 307
          DataBinding.FieldName = 'US_FIO_HST'
        end
        object cxGridDBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1044#1072#1090#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 127
          DataBinding.FieldName = 'DATE_TIME'
        end
        object cxGridDBTableView1DBColumn8: TcxGridDBColumn
          Caption = 'IP '#1072#1076#1088#1077#1089
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 113
          DataBinding.FieldName = 'IP_ADRESS'
        end
        object cxGridDBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1048#1084#1103' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 219
          DataBinding.FieldName = 'HOST_NAME'
        end
        object cxGridDBTableView1DBColumn3: TcxGridDBColumn
          Caption = #1044#1077#1081#1089#1090#1074#1080#1077
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 92
          DataBinding.FieldName = 'ACTION_H'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 240
    Top = 120
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 14745599
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
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
  object HistSel: TpFIBDataSet
    Database = fmReqCertificate.LocalDatabase
    Transaction = fmReqCertificate.LocalReadTransaction
    Left = 160
    Top = 128
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    DataSet = HistSel
    Left = 272
    Top = 168
  end
end
