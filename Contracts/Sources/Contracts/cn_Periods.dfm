object frmPeriods: TfrmPeriods
  Left = 375
  Top = 408
  Width = 542
  Height = 246
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'frmPeriods'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Grid_pay: TcxGrid
    Left = 0
    Top = 0
    Width = 534
    Height = 219
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    object Grid_payTableView: TcxGridTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '= 0.00 '#1075#1088#1085
          Kind = skSum
          Column = summa
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      Filtering.CustomizeDialog = False
      Filtering.Visible = fvNever
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DexExpress_Style_AE
      object date_beg: TcxGridColumn
        Caption = #1076#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.SaveTime = False
        Properties.ShowTime = False
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 87
      end
      object date_end: TcxGridColumn
        Caption = #1076#1072#1090#1072' '#1079#1072#1082#1080#1085#1095#1077#1085#1085#1103
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.SaveTime = False
        Properties.ShowTime = False
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 109
      end
      object date_pay: TcxGridColumn
        Caption = #1076#1072#1090#1072' '#1086#1087#1083#1072#1090#1080
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.SaveTime = False
        Properties.ShowTime = False
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 83
      end
      object summa: TcxGridColumn
        Caption = 'summa'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '0.00 '#1075#1088#1085'.'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 92
      end
      object id_payer_stage_opl: TcxGridColumn
        Caption = 'id_payer_stage_opl'
        Visible = False
      end
      object id_man_stage_opl: TcxGridColumn
        Caption = 'id_man_stage_opl'
        Visible = False
      end
      object num_year: TcxGridColumn
        Caption = 'num_year'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        GroupIndex = 0
        Hidden = True
        SortOrder = soAscending
      end
    end
    object Grid_payLevel: TcxGridLevel
      GridView = Grid_payTableView
    end
  end
  object Styles: TcxStyleRepository
    Left = 16
    Top = 16
    object BackGround: TcxStyle
      AssignedValues = [svColor]
      Color = 16701364
    end
    object FocusedRecord: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10779439
      TextColor = clInfoBk
    end
    object Header: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object DesabledRecord: TcxStyle
      AssignedValues = [svColor]
      Color = 13488559
    end
    object footer: TcxStyle
      AssignedValues = [svColor]
      Color = 16434322
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15850428
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15850428
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15850428
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15850428
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15850428
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14274999
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 16312275
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14531001
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
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
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15850428
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
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
    object SuperStyling_Header: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 10725714
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object Default_StyleSheet: TcxGridTableViewStyleSheet
      Styles.Background = BackGround
      Styles.Content = BackGround
      Styles.Inactive = DesabledRecord
      Styles.Selection = FocusedRecord
      Styles.Footer = footer
      Styles.Header = Header
      BuiltIn = True
    end
    object DexExpress_Style_AE: TcxGridTableViewStyleSheet
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
end
