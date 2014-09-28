object Fdt_sched_deliver_ADD2: TFdt_sched_deliver_ADD2
  Left = 252
  Top = 182
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1080' '#1087#1088#1086#1076#1091#1082#1094#1110#1102
  ClientHeight = 377
  ClientWidth = 617
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
  object Label1: TLabel
    Left = 200
    Top = 8
    Width = 51
    Height = 13
    Caption = #1055#1088#1086#1076#1091#1082#1094#1110#1103
  end
  object Label2: TLabel
    Left = 416
    Top = 8
    Width = 49
    Height = 13
    Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
  end
  object Label13: TLabel
    Left = 8
    Top = 8
    Width = 118
    Height = 13
    Caption = #1058#1086#1095#1082#1072' '#1087#1110#1076#1082#1083#1102#1095#1077#1085#1085#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 152
    Top = 348
    Width = 98
    Height = 13
    Caption = #1054#1076'. '#1074#1080#1084#1110#1088#1091' '#1074#1072#1088#1090#1086#1089#1090#1110
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 56
    Width = 601
    Height = 274
    TabOrder = 0
    OnMouseMove = cxGrid1MouseMove
    LookAndFeel.Kind = lfFlat
    object cxGrid1TableView1: TcxGridTableView
      OnKeyDown = cxGrid1TableView1KeyDown
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0.000'
          Kind = skSum
          Column = cxGrid1TableView1Column6
        end
        item
          Format = '0.000'
          Kind = skSum
          Column = cxGrid1TableView1Column5
        end
        item
          Format = '0.000'
          Kind = skSum
          Column = cxGrid1TableView1Column3
        end
        item
          Format = '0.000'
          Kind = skSum
          Column = cxGrid1TableView1Column7
        end
        item
          Format = '0.000'
          Kind = skSum
          Column = cxGrid1TableView1Column8
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = cxGrid1TableView1CellClick
      OnCustomDrawCell = cxGrid1TableView1CustomDrawCell
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.HideSelection = True
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = GridTableViewStyleSheetDevExpress
      object cxGrid1TableView1Column1: TcxGridColumn
        Caption = #1055#1086#1095#1072#1090#1086#1082
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Width = 64
      end
      object cxGrid1TableView1Column2: TcxGridColumn
        Caption = #1050#1110#1085#1077#1094#1100
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Width = 64
      end
      object cxGrid1TableView1Column3: TcxGridColumn
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 3
        Properties.DisplayFormat = ',0.000;-,0.000'
        Properties.OnValidate = cxGrid1TableView1Column3PropertiesValidate
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object cxGrid1TableView1Column4: TcxGridColumn
        Caption = #1058#1072#1088#1080#1092
        PropertiesClassName = 'TcxTextEditProperties'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
      end
      object cxGrid1TableView1Column5: TcxGridColumn
        Caption = #1042#1072#1088#1090#1110#1089#1090#1100
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '0.000;-0.000'
        Properties.Nullable = False
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
      end
      object cxGrid1TableView1Column6: TcxGridColumn
        Caption = #1055#1083#1072#1085#1086#1074#1072' '#1082#1110#1083#1100#1082#1110#1089#1090#1100
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 3
        Properties.DisplayFormat = '0.000;-0.000'
        Properties.Nullable = False
        Properties.OnValidate = cxGrid1TableView1Column6PropertiesValidate
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object cxGrid1TableView1Column7: TcxGridColumn
        Caption = #1055#1083#1072#1085#1086#1074#1080#1081' '#1090#1072#1088#1080#1092
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 3
        Properties.DisplayFormat = '0.000;-0.000'
        Properties.Nullable = False
        Visible = False
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
      end
      object cxGrid1TableView1Column8: TcxGridColumn
        Caption = #1055#1083#1072#1085#1086#1074#1072' '#1074#1072#1088#1090#1110#1089#1090#1100
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '0.000;-0.000'
        Properties.Nullable = False
        Visible = False
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
      end
      object cxGrid1TableView1Column9: TcxGridColumn
        Caption = 'CNT'
        Visible = False
      end
      object cxGrid1TableView1Column10: TcxGridColumn
        Caption = 'real_cost'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 3
        Properties.DisplayFormat = '0.000;-0.000'
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1TableView1
    end
  end
  object ProductEdit: TcxTextEdit
    Left = 200
    Top = 24
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object CatEdit: TcxTextEdit
    Left = 416
    Top = 24
    Width = 193
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object Button1: TcxButton
    Left = 424
    Top = 344
    Width = 91
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 3
    OnClick = Button1Click
  end
  object CancelButton: TcxButton
    Left = 520
    Top = 344
    Width = 89
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 4
    OnClick = CancelButtonClick
  end
  object PointEdit: TcxButtonEdit
    Left = 8
    Top = 24
    Width = 185
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = PointEditPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 5
  end
  object UMeasEdit1: TcxButtonEdit
    Left = 72
    Top = 344
    Width = 65
    Height = 21
    Properties.Alignment.Horz = taLeftJustify
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = UMeasEdit1PropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 6
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 344
    Width = 61
    Height = 17
    TabOrder = 7
    Caption = #1054#1076'. '#1074#1080#1084#1110#1088#1091
  end
  object UMeasEditS: TcxButtonEdit
    Left = 256
    Top = 344
    Width = 81
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = UMeasEditSPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 8
  end
  object cxLabel2: TcxLabel
    Left = 15
    Top = 307
    Width = 56
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 9
    Caption = #1056#1040#1047#1054#1052':'
  end
  object pFIBQuery1: TpFIBQuery
    Left = 392
    Top = 344
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 8
    Top = 248
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14084566
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clYellow
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object TreeListStyleSheetDevExpress: TcxTreeListStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle5
      Styles.Inactive = cxStyle9
      Styles.Selection = cxStyle13
      Styles.BandBackground = cxStyle2
      Styles.BandHeader = cxStyle3
      Styles.ColumnHeader = cxStyle4
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Footer = cxStyle8
      Styles.IncSearch = cxStyle10
      Styles.Indicator = cxStyle11
      Styles.Preview = cxStyle12
      BuiltIn = True
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle5
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Inactive = cxStyle9
      Styles.IncSearch = cxStyle10
      Styles.Selection = cxStyle13
      Styles.FilterBox = cxStyle4
      Styles.Footer = cxStyle8
      Styles.Group = cxStyle14
      Styles.GroupByBox = cxStyle4
      Styles.Header = cxStyle4
      Styles.Indicator = cxStyle11
      Styles.Preview = cxStyle12
      BuiltIn = True
    end
  end
  object pFIBQuery2: TpFIBQuery
    Left = 360
    Top = 344
  end
end
