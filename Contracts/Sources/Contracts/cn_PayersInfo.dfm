object frmPayeres_Info: TfrmPayeres_Info
  Left = 477
  Top = 246
  Width = 468
  Height = 238
  BorderIcons = [biSystemMenu]
  Caption = 'frmPayeres_Info'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Grid_payers: TcxGrid
    Left = 0
    Top = 0
    Width = 460
    Height = 161
    Align = alTop
    BevelOuter = bvRaised
    BevelKind = bkFlat
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    object TableView: TcxGridTableView
      OnDblClick = TableViewDblClick
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '= 0.0000 %'
          Kind = skSum
          Column = persent
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DexExpress_Style_AE
      object payer: TcxGridColumn
        Caption = 'payer'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 221
      end
      object period: TcxGridColumn
        Caption = 'period'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 101
      end
      object persent: TcxGridColumn
        Caption = 'persent'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '0.0000 %'
        HeaderAlignmentHorz = taCenter
        Width = 77
      end
      object type_payer: TcxGridColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
      end
      object id_type_stage: TcxGridColumn
        Caption = 'id_type_stage.'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
      end
      object isPercent: TcxGridColumn
        Visible = False
      end
      object id_payer: TcxGridColumn
        Caption = 'id_payer'
        Visible = False
      end
      object id_rate_account: TcxGridColumn
        Caption = 'id_rate_account'
        Visible = False
      end
      object mfo: TcxGridColumn
        Caption = 'mfo'
        Visible = False
      end
      object rate: TcxGridColumn
        Caption = 'rate'
        Visible = False
      end
    end
    object Grid_payersLevel: TcxGridLevel
      GridView = TableView
    end
  end
  object CancelButton: TcxButton
    Left = 336
    Top = 171
    Width = 120
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object Styles: TcxStyleRepository
    Left = 22
    Top = 36
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
