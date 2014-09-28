object fmMassDismissOrder: TfmMassDismissOrder
  Left = 276
  Top = 204
  Width = 712
  Height = 480
  Caption = #1052#1072#1089#1089#1086#1074#1080#1081' '#1085#1072#1082#1072#1079' '#1085#1072' '#1079#1074#1110#1083#1100#1085#1077#1085#1085#1103' '#1089#1091#1084#1110#1089#1085#1080#1082#1110#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ItemsGrid: TcxGrid
    Left = 0
    Top = 61
    Width = 704
    Height = 329
    Align = alClient
    TabOrder = 0
    object cxGridDBTableView5: TcxGridDBTableView
      DataController.DataSource = DM.ResultDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.CellHints = True
      OptionsView.ColumnAutoWidth = True
      Styles.StyleSheet = qizzStyle
      object cxGridDBTableView5DBColumn1: TcxGridDBColumn
        Options.Editing = False
        SortOrder = soAscending
        Width = 48
        DataBinding.FieldName = 'TN'
      end
      object cxGridDBTableView5DBColumn2: TcxGridDBColumn
        Caption = #1055#1030#1055'/'#1073
        Options.Editing = False
        Width = 207
        DataBinding.FieldName = 'FIO'
      end
      object cxGridDBTableView5DBColumn8: TcxGridDBColumn
        Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
        Visible = False
        GroupIndex = 0
        Options.Editing = False
        SortOrder = soAscending
        DataBinding.FieldName = 'NAME_DEP'
      end
      object cxGridDBTableView5DBColumn5: TcxGridDBColumn
        Caption = #1055#1086#1089#1072#1076#1072
        Options.Editing = False
        Width = 151
        DataBinding.FieldName = 'NAME_POST'
      end
      object cxGridDBTableView5DBColumn6: TcxGridDBColumn
        Caption = #1055#1077#1088#1110#1086#1076
        Options.Editing = False
        Width = 84
        DataBinding.FieldName = 'PERIOD'
      end
      object cxGridDBTableView5DBColumn9: TcxGridDBColumn
        Caption = #1044#1085#1110#1074
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '\d+'
        Properties.OnEditValueChanged = cxGridDBTableView5DBColumn9PropertiesChange
        Width = 65
        DataBinding.FieldName = 'DAY_COUNT'
      end
    end
    object cxGridLevel5: TcxGridLevel
      GridView = cxGridDBTableView5
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 61
    Align = alTop
    Locked = True
    TabOrder = 1
    object CancelButton: TSpeedButton
      Left = 631
      Top = 2
      Width = 62
      Height = 57
      Action = CloseAction
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDD7444DDD
        DDDDDD74477744444444D777777748888884D777777742222284D77777774222
        2284D777787742222284D7778F8742222284D777787742672784D77777774688
        8884D777777748888884D777777748888B84D77777774888BB84D7777777488B
        BB84DD77777747777777DDDD77774DDDDDDDDDDDDD777DDDDDDD}
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object RecalcButton: TSpeedButton
      Left = 4
      Top = 2
      Width = 85
      Height = 57
      Action = RecalcAction
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000920B0000920B00000000000000000000FF00FFFF00FF
        FF00FFC8B3A46947316947316947316947316947316947316947316947316947
        31694731694731694731694731694731694731694731694731694731FF00FFFF
        00FFFF00FFFF00FFFF00FFC8B3A4EDE5E0B7A293B7A293B7A293B7A293B7A293
        B7A293B7A293B6A192B5A091B5A091B6A192B7A293B7A293B7A293B7A293B7A2
        93694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4EFE8E3EDE5E0ECE2DEEB
        E0DBE9DDD7E6D9D3E3D5CFE0D3CCD6C8C2CDBFB7D0C1B9D8C7BED9C7BED9C7BE
        DAC8BEDBC9BFB7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4F2EC
        E8F0E9E5EEE6E2EDE4DFE7DDD9DFD4CFD8CCC7D1C7C4A9ABB9999AA5B5A9A2CB
        BCB4CEBEB6CEBDB4D6C4BBDAC8BEB7A293694731FF00FFFF00FFFF00FFFF00FF
        FF00FFC8B3A4F4EEECF2ECE8F0E9E5EDE5E1E2DAD6B7B8C3B5ADAA9FA2B24581
        E24E80D2958F90AAA19FA19EA4B7A9A1CDBCB3D9C7BEB7A293694731FF00FFFF
        00FFFF00FFFF00FFFF00FFC8B3A4F6F1EFF4EEECF2ECE8EFE8E4AFBEDD4A86E3
        718CBB6C87B63D7EE8437FDF7385A85E82C04A81D99C9CA7CEBEB6D9C7BEB7A2
        93694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4F8F4F2F6F1EFF4EEECEF
        E9E5CDD1DC5D8EDF3B7EE93F7EE64E84DD5087DF4180E63C7FEA5E82C0ABA3A2
        CFC0B8D8C7BEB6A192694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4FAF6
        F6F8F4F2F4EFEDE9E4E2D4CECB7194CF3F7FE67E96C0C7C3C5D5CED083A1D83D
        7FE87587ABA19792BBAFA7CDBFB6B49F91694731FF00FFFF00FFFF00FFFF00FF
        FF00FFC8B3A4FCF9F9FAF6F6F5F1EFBBC8E08AA3CE4983DE5A85CCB4AFADDDD5
        D0E9DFDAD2CDD24F87E04D81D56E84AC8D95AAC2B5ADB19D8E694731FF00FFFF
        00FFFF00FFFF00FFFF00FFC8B3A4FDFCFCFCF9F9F8F4F484AAE84282E93B7EEA
        6089CBACA7A4CFC8C5E0D7D3CEC8CA5086DE3B7EE93F7EE56F92CFCFC2BBB39F
        90694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4FFFFFFFDFCFCFCF9F9E2
        E6F2C7D2E56795DE4D84DC8692A8B0ABA8BEB9B595A3BD4380E46085C39DA1B1
        C1BEC5DFD1CBB6A192694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4FFFF
        FFFFFFFFFEFDFEFBF9F9E3E4E96D98DE3A7EEA4983DF7490BD708BBA4883DE3C
        7FEA6F8CBEB4ADAAD8CDC7E4D7D2B7A293694731FF00FFFF00FFFF00FFFF00FF
        FF00FFC8B3A4FFFFFFFFFFFFFFFFFFFDFCFDB4CAF03F81E96D98DE6795DE3B7E
        EA3E7FE7678DCB5B8DDD4985E5B1B6C6DFD5D0E7DBD5B7A293694731FF00FFFF
        00FFFF00FFFF00FFFF00FFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFF2F5FBB4CAF0
        E4E5EAC7D1E54181E85087E0BDBCC0C8CCD8AFC0DEE1DAD6E8DEDBEBE0DBB7A2
        93694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFDFCFDFBF9F9E3E8F384AAE98CADE3DFDCDDEEE8E5F0E9E6EDE6E1
        ECE4DFECE2DEB7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFEFDFBFBF9F6F5F5F1F0F4EFEEF4
        EFECF3EDEAF1EAE7EFE8E3EDE5E0B7A293694731FF00FFFF00FFFF00FFFF00FF
        FF00FFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFEFDFB
        FBFBF8F7F9F5F4F7F2F1F5F0EDD5BFB1CAB5A6B7A293B7A293694731FF00FFFF
        00FFFF00FFFF00FFFF00FFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFDFEFDFBFBFBF8F7FAF6F6C8B3A46947316947316947316947
        31694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFCFCF9F9C8B3A4F3EBE6
        EFE6E0E8DCD4DBC9BF694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
        FCFCC8B3A4EFE6E0E8DCD4DBC9BF694731FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC8B3A4E8DCD4DBC9BF694731FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4DBC9BF694731FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4C8B3A4C8B3A4C8B3A4C8
        B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4694731
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object SpeedButton2: TSpeedButton
      Left = 89
      Top = 2
      Width = 80
      Height = 57
      Action = PrintAction
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
        180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666666666666666FFFFFFFFFFFF
        FFFFFFFFFFFF666666666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686868686868686FFFFFFFF
        FFFFFFFFFFFFFFFF868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B29696968686866666
        66666666808080666666DDDDDDCCCCCC666666666666FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0B2B2B2A4A0A0
        868686868686999999868686DDDDDDD7D7D7868686868686FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666C0C0C0A4A0A0A4
        A0A0A4A0A08686865F5F5FC0C0C0CCCCCCCCCCCCD7D7D7D7D7D7666666666666
        666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686CCCCCCB2B2
        B2B2B2B2B2B2B2999999868686C0C0C0D7D7D7D7D7D7D7D7D7D7D7D786868686
        8686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666D7D7D7C0C0C0
        A4A0A0A4A0A0A4A0A06666660404040404041616165F5F5FB2B2B2CCCCCCCCCC
        CCCCCCCCC0C0C0666666666666666666FFFFFFFFFFFFFFFFFF868686D7D7D7CC
        CCCCB2B2B2B2B2B2B2B2B2868686222222222222424242868686C0C0C0CCCCCC
        CCCCCCCCCCCCCCCCCC868686868686868686FFFFFF666666CCCCCCCCCCCCC0C0
        C0B2B2B2B2B2B2A4A0A0A4A0A09999999696969696968686865555552929290C
        0C0C040404161616666666808080666666FFFFFFFFFFFF868686CCCCCCCCCCCC
        CCCCCCC0C0C0C0C0C0B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29999998080805F5F
        5F333333222222424242868686999999868686FFFFFFFFFFFF666666CCCCCCC0
        C0C0868686F1F1F1F1F1F1F1F1F1DDDDDDCBCBCBB2B2B2A4A0A0A4A0A0A4A0A0
        9999999696962222220404041C1C1C969696666666FFFFFFFFFFFF868686CCCC
        CCCCCCCC999999EAEAEAEAEAEAE3E3E3DDDDDDCCCCCCC0C0C0B2B2B2B2B2B2B2
        B2B2B2B2B2B2B2B25555552929294D4D4DB2B2B2868686FFFFFFFFFFFF666666
        C0C0C0868686E3E3E3F1F1F1F1F1F1F1F1F1EAEAEAEAEAEAE3E3E3E3E3E3D7D7
        D7C0C0C0B2B2B2A4A0A0969696868686666666999999666666FFFFFFFFFFFF86
        8686CCCCCC999999E3E3E3EAEAEAEAEAEAE3E3E3E3E3E3E3E3E3E3E3E3DDDDDD
        D7D7D7CCCCCCC0C0C0B2B2B2B2B2B2999999868686B2B2B2868686FFFFFFFFFF
        FF666666868686EAEAEAF1F1F1F1F1F1F1F1F1D7D7D7808080969696C0C0C0DD
        DDDDE3E3E3DDDDDDDDDDDDD7D7D7B2B2B2A4A0A0999999666666666666FFFFFF
        FFFFFF868686999999E3E3E3EAEAEAEAEAEAEAEAEAD7D7D7999999B2B2B2CCCC
        CCDDDDDDDDDDDDDDDDDDDDDDDDD7D7D7C0C0C0B2B2B2B2B2B2868686868686FF
        FFFFFFFFFF666666CCCCCCF1F1F1F1F1F1F1F1F1CCCCCCB2B2B2B2B2B2999999
        808080777777868686A4A0A0C0C0C0D7D7D7CCCCCCCBCBCBC0C0C0A4A0A06666
        66FFFFFFFFFFFF868686D7D7D7EAEAEAEAEAEAEAEAEAD7D7D7C0C0C0C0C0C0B2
        B2B2999999969696A4A0A0C0C0C0CCCCCCD7D7D7D7D7D7CCCCCCC0C0C0B2B2B2
        868686FFFFFFFFFFFFFFFFFF666666666666CCCCCCA4A0A05F5F5F7777778080
        80969696B2B2B2B2B2B2A4A0A0969696808080808080C0C0C0CCCCCCCCCCCCC0
        C0C0666666FFFFFFFFFFFFFFFFFF868686868686D7D7D7C0C0C0868686969696
        999999B2B2B2C0C0C0C0C0C0C0C0C0B2B2B2999999999999CCCCCCD7D7D7CCCC
        CCCCCCCC868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666CC999999996666
        6666555555555555666666666666868686A4A0A0B2B2B2B2B2B2CCCCCCCCCCCC
        B2B2B2666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686B2B2B2B2B2
        B2868686868686868686868686868686A4A0A0B2B2B2C0C0C0C0C0C0CCCCCCD7
        D7D7C0C0C0868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9999
        F0CAA6FFCC99FFCC99CC99669966666666665555555F5F5F666666868686CCCC
        CCA4A0A0666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2
        B2B2D7D7D7D7D7D7CCCCCCC0C0C0999999969696868686868686868686A4A0A0
        D7D7D7B2B2B2868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFCC9999F0CAA6F0CAA6FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99CC999966
        6666666666666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFB2B2B2DDDDDDD7D7D7D7D7D7CCCCCCCCCCCCCCCCCCC0C0C0CCCCCCB2B2
        B2868686868686868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFCC9999FFECCCF0CAA6FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99
        CC9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFB2B2B2DDDDDDD7D7D7D7D7D7D7D7D7CCCCCCCCCCCCCCCCCCCC
        CCCCB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFECCCFFECCCFFECCCF0CAA6FFCC99FFCC99FFCC99FFCC
        99CC9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE3E3E3DDDDDDDDDDDDD7D7D7D7D7D7D7D7D7CCCCCC
        CCCCCCB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFECCCFFECCCFFECCCFFECCCF0CAA6F0CAA6FF
        CC99FFCC99CC9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3E3E3E3DDDDDDDDDDDDDDDDDDD7D7
        D7D7D7D7CCCCCCB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9999F1F1F1FFECCCFFECCCFFECCCFFECCC
        F0CAA6F0CAA6CC9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2E3E3E3E3E3E3E3E3E3DDDDDDDD
        DDDDDDDDDDD7D7D7B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9999F8F8F8F1F1F1F1F1F1FFECCCFFEC
        CCFFECCCFFECCCF0CAA6CC9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2EAEAEAEAEAEAE3E3E3E3E3E3
        E3E3E3DDDDDDDDDDDDD7D7D7B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9999CC9999CC9999F1F1F1F1
        F1F1FFECCCFFECCCFFECCCCC9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2B2B2B2B2B2B2EAEA
        EAE3E3E3E3E3E3E3E3E3DDDDDDB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        CC9999CC9999CC9999CC9999CC9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object SpeedButton1: TSpeedButton
      Left = 225
      Top = 2
      Width = 62
      Height = 57
      Action = EditAction
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDD7444DDD
        DDDDDD74477744444444D777777748888884D777777742222284D77777774222
        2284D777787742222284D7778F8742222284D777787742672784D77777774688
        8884D777777748888884D777777748888B84D77777774888BB84D7777777488B
        BB84DD77777747777777DDDD77774DDDDDDDDDDDDD777DDDDDDD}
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
  end
  inline fmSearch: TfmSearch
    Left = 0
    Top = 390
    Width = 704
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    inherited AllLabel: TLabel
      Left = 580
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 64
    Top = 152
    object stBackground: TcxStyle
      AssignedValues = [svColor]
      Color = 14745599
    end
    object stContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stContentEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stContentOdd: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stFilterBox: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object stFooter: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object stGroup: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object stGroupByBox: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object stHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stInactive: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object stIncSearch: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object stIndicator: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object stPreview: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object stSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stHotTrack: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clMaroon
    end
    object qizzStyle: TcxGridTableViewStyleSheet
      Styles.Background = stBackground
      Styles.Content = stContent
      Styles.ContentEven = stContentEven
      Styles.ContentOdd = stContentOdd
      Styles.Inactive = stInactive
      Styles.IncSearch = stIncSearch
      Styles.Selection = stSelection
      Styles.FilterBox = stFilterBox
      Styles.Footer = stFooter
      Styles.Group = stGroup
      Styles.GroupByBox = stGroupByBox
      Styles.Header = stHeader
      Styles.Indicator = stIndicator
      Styles.Preview = stPreview
      BuiltIn = True
    end
  end
  object KeyList: TActionList
    Left = 124
    Top = 151
    object CloseAction: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      Hint = #1047#1072#1082#1088#1080#1090#1080
      ShortCut = 27
      SecondaryShortCuts.Strings = (
        'F10')
      OnExecute = CloseActionExecute
    end
    object PrintAction: TAction
      Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080
      Hint = #1044#1088#1091#1082#1091#1074#1072#1090#1080
      ShortCut = 16464
      OnExecute = SpeedButton2Click
    end
    object RecalcAction: TAction
      Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080
      Hint = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1085#1072#1082#1072#1079
      ShortCut = 16466
      OnExecute = RecalcButtonClick
    end
    object AdminMode: TAction
      Caption = 'AdminMode'
      SecondaryShortCuts.Strings = (
        'Ctrl+Alt+Shift+Z')
      OnExecute = AdminModeExecute
    end
    object ShowValues: TAction
      Caption = 'ShowValues'
      ShortCut = 8315
      OnExecute = ShowValuesExecute
    end
    object EditAction: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1082#1110#1083#1100#1082#1110#1089#1090#1100' '#1085#1077' '#1074#1080#1082#1086#1088#1080#1089#1090#1072#1085#1080#1093' '#1076#1085#1110#1074' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
      ShortCut = 32
      OnExecute = EditActionExecute
    end
  end
  object PrintFooterQuery: TpFIBDataSet
    Database = DM.LocalDatabase
    Transaction = DM.LocalReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from    ASUP_ORDER_PRINT_FOOTER(:Id_Order_Group)')
    Left = 104
    Top = 208
    poSQLINT64ToBCD = True
  end
  object GetOrderGroup: TpFIBDataSet
    Database = DM.LocalDatabase
    Transaction = DM.LocalReadTransaction
    SelectSQL.Strings = (
      'select   o.id_order_group'
      'from     orders o'
      'where  o.Id_Order = :id_order')
    Left = 176
    Top = 168
    poSQLINT64ToBCD = True
  end
  object PrintFooterDataSet: TfrxDBDataset
    UserName = 'PrintFooterDataSet'
    CloseDataSource = False
    DataSet = PrintFooterQuery
    Left = 64
    Top = 208
  end
  object PrintDataSet: TfrxDBDataset
    UserName = 'PrintDataSet'
    CloseDataSource = False
    DataSet = DM.SelectDismissedInfo
    Left = 64
    Top = 240
  end
  object Report: TfrxReport
    Version = '3.15'
    DataSet = PrintDataSet
    DataSetName = 'PrintDataSet'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38757.788486851900000000
    ReportOptions.LastChange = 38817.627171747690000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'uses '#39'Reports\GoodPageBreak.pas'#39';'
      ''
      'procedure MasterData1OnAfterCalcHeight(Sender: TfrxComponent);'
      'begin'
      '  pfSaveMasterDataHeight(Sender);'
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  pfInit;'
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  pfMasterCheck(Sender);'
      'end;'
      ''
      
        'procedure ReportSummary1OnAfterCalcHeight(Sender: TfrxComponent)' +
        ';'
      'begin'
      '  pfSaveSummaryHeight(Sender);'
      'end;'
      ''
      'begin'
      ''
      'end.')
    StoreInDFM = False
    Left = 232
    Top = 152
    Datasets = <
      item
        DataSet = PrintDataSet
        DataSetName = 'PrintDataSet'
      end>
    Variables = <>
    Style = <>
  end
  object frRtfAdvExport1: TfrRtfAdvExport
    Left = 256
    Top = 264
  end
  object frOLEExcelExport1: TfrOLEExcelExport
    CellsAlign = False
    CellsFillColor = False
    CellsFontColor = False
    CellsFontName = False
    CellsFontSize = False
    CellsFontStyle = False
    Left = 168
    Top = 264
  end
  object frBMPExport1: TfrBMPExport
    Left = 216
    Top = 328
  end
  object frJPEGExport1: TfrJPEGExport
    Left = 288
    Top = 312
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'cxGridDBTableView5DBColumn1.GroupIndex'
      'cxGridDBTableView5DBColumn1.SortOrder'
      'cxGridDBTableView5DBColumn1.Visible'
      'cxGridDBTableView5DBColumn1.Width'
      'cxGridDBTableView5DBColumn2.Width'
      'cxGridDBTableView5DBColumn2.Visible'
      'cxGridDBTableView5DBColumn2.SortOrder'
      'cxGridDBTableView5DBColumn2.GroupIndex'
      'cxGridDBTableView5DBColumn5.GroupIndex'
      'cxGridDBTableView5DBColumn5.SortOrder'
      'cxGridDBTableView5DBColumn5.Visible'
      'cxGridDBTableView5DBColumn5.Width'
      'cxGridDBTableView5DBColumn6.GroupIndex'
      'cxGridDBTableView5DBColumn6.SortOrder'
      'cxGridDBTableView5DBColumn6.Visible'
      'cxGridDBTableView5DBColumn6.Width'
      'cxGridDBTableView5DBColumn8.GroupIndex'
      'cxGridDBTableView5DBColumn8.Visible'
      'cxGridDBTableView5DBColumn8.Width'
      'cxGridDBTableView5DBColumn8.SortOrder'
      'cxGridDBTableView5DBColumn9.GroupIndex'
      'cxGridDBTableView5DBColumn9.Width'
      'cxGridDBTableView5DBColumn9.Visible'
      'cxGridDBTableView5DBColumn9.SortOrder')
    StoredValues = <>
    Left = 344
    Top = 160
  end
end
