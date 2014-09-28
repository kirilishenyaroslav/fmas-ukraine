object Block_Sch_Form: TBlock_Sch_Form
  Left = 257
  Top = 209
  Width = 654
  Height = 420
  Caption = #1041#1083#1086#1082#1091#1074#1072#1085#1085#1103'/'#1056#1086#1079#1073#1083#1086#1082#1091#1074#1072#1085#1085#1103' '#1088#1072#1093#1091#1085#1082#1110#1074
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 522
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 313
    Width = 646
    Height = 73
    Align = alBottom
    BevelOuter = bvNone
    Color = 16247513
    TabOrder = 1
    object Label3: TLabel
      Left = 5
      Top = 2
      Width = 125
      Height = 13
      Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1088#1072#1093#1091#1085#1082#1072#1084#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ApplyButton: TcxButton
      Left = 328
      Top = 40
      Width = 75
      Height = 25
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      TabOrder = 2
      OnClick = ApplyButtonClick
    end
    object CancelButton: TcxButton
      Left = 405
      Top = 40
      Width = 75
      Height = 25
      Caption = #1047#1072#1083#1080#1096#1080#1090#1080
      TabOrder = 3
      OnClick = CancelButtonClick
    end
    object InfoMemo: TcxMemo
      Left = 2
      Top = 15
      Width = 287
      Height = 56
      TabStop = False
      ParentFont = False
      Properties.MaxLength = 200
      Properties.ReadOnly = True
      Properties.ScrollBars = ssVertical
      Style.Color = 14281696
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 4
    end
    object BlockAllButton: TcxButton
      Left = 296
      Top = 8
      Width = 107
      Height = 25
      Caption = #1041#1083#1086#1082#1091#1074#1072#1090#1080' '#1074#1089#1110
      TabOrder = 0
      OnClick = BlockAllButtonClick
    end
    object UnBlockAllButton: TcxButton
      Left = 405
      Top = 8
      Width = 107
      Height = 25
      Caption = #1056#1086#1079#1073#1083#1086#1082#1091#1074#1072#1090#1080' '#1074#1089#1110
      TabOrder = 1
      OnClick = UnBlockAllButtonClick
    end
  end
  object SchGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 646
    Height = 313
    Align = alClient
    TabOrder = 0
    object SchTableView: TcxGridTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = Num_Sch_Column
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = GridTableViewStyleSheet
      object id_Sch_Column: TcxGridColumn
        Visible = False
        MinWidth = 0
        Options.Focusing = False
      end
      object Num_Sch_Column: TcxGridColumn
        Caption = #1053#1086#1084#1077#1088' '#1088#1072#1093#1091#1085#1082#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.MaxLength = 0
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 0
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Width = 87
      end
      object Name_Sch_Column: TcxGridColumn
        Caption = #1053#1072#1079#1074#1072' '#1088#1072#1093#1091#1085#1082#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 0
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Width = 289
      end
      object Date_Column: TcxGridColumn
        Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1092#1091#1085#1082#1094#1110#1086#1085#1091#1074#1072#1085#1085#1103
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 0
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Width = 132
      end
      object Open_Sch: TcxGridColumn
        Caption = #1055#1077#1088#1110#1086#1076' '#1088#1072#1093#1091#1085#1082#1072' '#1091' '#1075#1086#1083#1086#1074#1085#1110#1081' '#1082#1085#1080#1079#1110
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.SaveTime = False
        Properties.ShowTime = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 0
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Width = 121
      end
      object Check_Column: TcxGridColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.DisplayUnchecked = 'False'
        HeaderGlyph.Data = {
          DA030000424DDA030000000000009A0100002800000018000000180000000100
          08000000000040020000120B0000120B0000590000005900000000000000FFFF
          FF00FF00FF0097FEFF008FFCFF0087F9FF0077F4FF007EF6FF006FF1FF0059EA
          FF005FECFF0065EEFF0065DDEE0040E2FF0047E4FF0051E7FF0057D2E80020D7
          FF0028DAFF002FDCFF0038DFFF0000CCFF0008CFFF000EC7F50010CFFD0011D2
          FF0018D4FF0037C0E00000C8FB0000C7FA0000C6F90000BFF20000B7EA0002B5
          E7000CAEDD0014BBE80016C2EE0016ADD9001DADD60000ACDF0000AADD00009F
          D2000099CC0004A3D50018A1CC0020ABD4000093C6000088BB000690C1000A96
          C6001A95BF001E98C1000080B300007AAD000882B3001C89B3000077AA000066
          9900F9F9F900F2F2F200E9E9E900E6E6E600DFDFDF00D9D9D900D6D6D600D2D2
          D200CCCCCC00C9C9C900C2C2C200BFBFBF00BCBCBC00B9B9B900B3B3B300AFAF
          AF00ACACAC00A6A6A600A3A3A3009F9F9F0099999900969696008C8C8C006C6C
          6C00696969006666660060606000434343004040400033333300FFFFFF000239
          3939393939393939393939393939393939393939390202390310262E3539382F
          2A28201C1F293439352E271E390202390310262E3539382F2A28201C1F293439
          352E271E390202390310262E3539382F2A28201C1F293439352E271E39020239
          0310262E3539382F2A28201C1F293439352E271E390202390310262E3539382F
          2A28201C1F293439352E271E390202390310262E3539382F2A28201C1F293439
          352E271E390202390310262E3539382F2A28201C1F293439352E271E39020239
          0310262E3539382F2A28201C1F293439352E271E390202390310262E3539382F
          2A28201C1F293439352E271E39020239030C1B2D3337322C2523241817223136
          302B211D390202390304050706080B0A090F0E0D141312111A19161539020239
          393939393939393939393939393939393939393939020202575048484E560202
          020202020202564E48484E5702020202575048484E560202020202020202564E
          48484E5702020202575048494E560202020202020202564E48494F5702020202
          57504B494E560202020202020202564E484B50570202020257504D474E515702
          020202020257514E464D50570202020257514E464D4E51565656565656524E4A
          3C4E51570202020202554F46404C4E4E4E4E4E4E4E4D4201484F550202020202
          0257534E3F013E4345474644413A01454E54570202020202020257544F453B01
          01010101013D484F5357020202020202020202575551504B454545474D505155
          570202020202020202020202025757575757575757575702020202020202}
        HeaderGlyphAlignmentHorz = taCenter
        MinWidth = 0
        Options.Focusing = False
        Options.Sorting = False
        Width = 41
      end
      object Old_Check_Column: TcxGridColumn
        Visible = False
        MinWidth = 0
        Options.Focusing = False
      end
    end
    object SchGridLevel: TcxGridLevel
      GridView = SchTableView
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 237
    Top = 301
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
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
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16777088
      TextColor = clBlue
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
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
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16777088
      TextColor = clBlue
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object GridTableViewStyleSheet: TcxGridTableViewStyleSheet
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
    object GridBandedTableViewStyleSheet: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
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
      Styles.BandBackground = cxStyle15
      Styles.BandHeader = cxStyle23
      BuiltIn = True
    end
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 128
    Top = 296
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 200
    Top = 296
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 160
    Top = 296
  end
  object Timer: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimerTimer
    Left = 80
    Top = 296
  end
end
