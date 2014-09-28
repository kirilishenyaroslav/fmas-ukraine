object DocWorkSchKekvForm: TDocWorkSchKekvForm
  Left = 433
  Top = 310
  Width = 512
  Height = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGridPos: TcxGrid
    Left = 0
    Top = 0
    Width = 504
    Height = 267
    Align = alTop
    TabOrder = 0
    object cxGridPosDBTableView1: TcxGridDBTableView
      DataController.DataSource = DocWorkProv.DataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle2
      Styles.Header = cxStyle8
      object ID_SCH: TcxGridDBColumn
        Caption = 'ID_SCH'
        Visible = False
        Options.Editing = False
        Options.Filtering = False
      end
      object SCH_NUMBER: TcxGridDBColumn
        Caption = #1056#1072#1093#1091#1085#1086#1082
        Options.Editing = False
        Options.Filtering = False
      end
      object SCH_TITLE: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072' '#1088#1072#1093#1091#1085#1082#1091
        Visible = False
        Options.Editing = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn1: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueGrayed = 2
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn2: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn3: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn4: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn5: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn6: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn7: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn8: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn9: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn10: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn11: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn12: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn13: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn14: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn15: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn16: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn17: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn18: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn19: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
      object cxGridPosDBTableView1DBColumn20: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = 'False'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        Options.Filtering = False
      end
    end
    object cxGridPosLevel1: TcxGridLevel
      GridView = cxGridPosDBTableView1
    end
  end
  object cxButton1: TcxButton
    Left = 99
    Top = 276
    Width = 136
    Height = 32
    Action = Ok
    TabOrder = 1
    Glyph.Data = {
      B6020000424DB602000000000000760000002800000030000000180000000100
      0400000000004002000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD2DDD
      DDDDDDDDDDDDDDDDDDDD7DDDDDDDDDDDDDDDDDDDDDD222DDDDDDDDDDDDDDDDDD
      DDD777DDDDDDDDDDDDDDDDDDDD22222DDDDDDDDDDDDDDDDDDD77777DDDDDDDDD
      DDDDDDDDD2222222DDDDDDDDDDDDDDDDD7777777DDDDDDDDDDDDDDDD22322222
      2DDDDDDDDDDDDDDD778877777DDDDDDDDDDDDDD22333223222DDDDDDDDDDDDD7
      7888777777DDDDDDDDDDDD2277332D22222DDDDDDDDDDD7788887D77777DDDDD
      DDDDDD277732DDD22222DDDDDDDDDD788887DDD77777DDDDDDDDDD23732DDDDD
      D2222DDDDDDDDD78887DDDDDD7777DDDDDDDDDD272DDDDDDDD2222DDDDDDDDD7
      87DDDDDDDD7777DDDDDDDDDD2DDDDDDDDDD2222DDDDDDDDD7DDDDDDDDDD7777D
      DDDDDDDDDDDDDDDDDDDDD222DDDDDDDDDDDDDDDDDDDDD777DDDDDDDDDDDDDDDD
      DDDDDD222DDDDDDDDDDDDDDDDDDDDD777DDDDDDDDDDDDDDDDDDDDDDD22DDDDDD
      DDDDDDDDDDDDDDDD77DDDDDDDDDDDDDDDDDDDDDDDD2DDDDDDDDDDDDDDDDDDDDD
      DD7DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
    NumGlyphs = 2
    UseSystemPaint = False
  end
  object cxButton2: TcxButton
    Left = 272
    Top = 276
    Width = 136
    Height = 32
    Action = Cancel
    TabOrder = 2
    Glyph.Data = {
      96010000424D9601000000000000760000002800000018000000180000000100
      0400000000002001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD99DDDDDDDDDDDDDDDDDDDDD999DDD99
      9DDDDDDDDDDDDDD999DDDD9999DDDDDDDDDDD9999DDDDD99999DDDDDDDDD9999
      DDDDDDD99999DDDDDDD9999DDDDDDDDD99999DDDDD9999DDDDDDDDDDDD9999DD
      99999DDDDDDDDDDDDDD999999999DDDDDDDDDDDDDDDD9999999DDDDDDDDDDDDD
      DDDDD99999DDDDDDDDDDDDDDDDDD9999999DDDDDDDDDDDDDDDD999999999DDDD
      DDDDDDDDDD99999DD9999DDDDDDDDDDDD99999DDDD9999DDDDDDDDDD99999DDD
      DDDD999DDDDDDDD99999DDDDDDDDD999DDDDDD99999DDDDDDDDDDDD9DDDDD999
      99DDDDDDDDDDDDDDDDDDD9999DDDDDDDDDDDDDDDDDDDD999DDDDDDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
    UseSystemPaint = False
  end
  object StyleRepository: TcxStyleRepository
    Left = 8
    Top = 272
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
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
  object ActionList1: TActionList
    Left = 42
    Top = 271
    object Ok: TAction
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      OnExecute = OkExecute
    end
    object Cancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = CancelExecute
    end
  end
end
