object frmInvalidHistory: TfrmInvalidHistory
  Left = 319
  Top = 236
  BorderStyle = bsDialog
  Caption = #1030#1089#1090#1086#1088#1110#1103' '#1079#1084#1110#1085
  ClientHeight = 343
  ClientWidth = 821
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
    Width = 821
    Height = 302
    Align = alClient
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 302
    Width = 821
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BtnOk: TBitBtn
      Left = 360
      Top = 8
      Width = 75
      Height = 25
      Action = okAct
      Caption = #1043#1072#1088#1072#1079#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object InvalidHistGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 821
    Height = 302
    Align = alClient
    TabOrder = 2
    object InvalidHistView: TcxGridDBTableView
      DataController.DataSource = InvalidHistSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = cxGridTableViewStyleSheet1
      object InvalidHistViewDBColumn1: TcxGridDBColumn
        Caption = #1060'.'#1030'.'#1054'.'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 200
        DataBinding.FieldName = 'USER_FIO_HST'
      end
      object InvalidHistViewDBColumn2: TcxGridDBColumn
        Caption = #1044#1110#1103
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 65
        DataBinding.FieldName = 'ACTION_HST'
      end
      object InvalidHistViewDBColumn3: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1090#1072' '#1095#1072#1089
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 90
        DataBinding.FieldName = 'DATE_TIME_HST'
      end
      object InvalidHistViewDBColumn4: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 80
        DataBinding.FieldName = 'DATE_BEG'
      end
      object InvalidHistViewDBColumn5: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1082#1110#1085#1094#1103
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 80
        DataBinding.FieldName = 'DATE_END'
      end
      object InvalidHistViewDBColumn6: TcxGridDBColumn
        Caption = #1055#1088#1080#1095#1080#1085#1072' '#1110#1085#1074#1072#1083#1110#1076#1085#1086#1089#1090#1110
        Width = 120
        DataBinding.FieldName = 'REASON_INVALID'
      end
      object InvalidHistViewDBColumn7: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1087#1086#1089#1074#1110#1076#1095#1077#1085#1085#1103
        Width = 110
        DataBinding.FieldName = 'NOMER_INV'
      end
    end
    object InvalidHistGridLevel1: TcxGridLevel
      GridView = InvalidHistView
    end
  end
  object InvalidHistSource: TDataSource
    DataSet = InvalidHistSet
    Left = 200
    Top = 200
  end
  object ActionList1: TActionList
    Left = 408
    Top = 104
    object okAct: TAction
      Caption = #1043#1072#1088#1072#1079#1076
      OnExecute = okActExecute
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 184
    Top = 104
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
      Color = 13106942
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11793652
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13302779
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
      Caption = 'KlugStyle'
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
  object InvalidHistSet: TpFIBDataSet
    Database = dmInvalid.DB
    Transaction = dmInvalid.DefaultTransaction
    Left = 272
    Top = 152
    poSQLINT64ToBCD = True
  end
end
