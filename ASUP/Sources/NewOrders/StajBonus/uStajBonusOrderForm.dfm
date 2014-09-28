object fmMassStajOrder: TfmMassStajOrder
  Left = 280
  Top = 169
  Width = 710
  Height = 436
  Caption = #1052#1072#1089#1089#1086#1074#1080#1081' '#1085#1072#1082#1072#1079' '#1079#1072' '#1085#1072#1076#1073#1072#1074#1082#1080' '#1079#1072' '#1089#1090#1072#1078
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 16
  object ItemsGrid: TcxGrid
    Left = 0
    Top = 89
    Width = 702
    Height = 320
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ReportDataView: TcxGridDBTableView
      DataController.DataSource = ReportDataDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.CellHints = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = qizzStyle
      object ReportDataViewDBColumn1: TcxGridDBColumn
        Caption = #1058'.'#1053'.'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        SortOrder = soAscending
        Width = 63
        DataBinding.FieldName = 'TN'
      end
      object ReportDataViewDBColumn2: TcxGridDBColumn
        Caption = #1055#1030#1055'/'#1073
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 234
        DataBinding.FieldName = 'FIO'
      end
      object ReportDataViewDBColumn8: TcxGridDBColumn
        Caption = #1053#1072#1076#1073#1072#1074#1082#1072
        Visible = False
        GroupIndex = 0
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        SortOrder = soAscending
        DataBinding.FieldName = 'RAISE_NAME_EX'
      end
      object ReportDataViewDBColumn5: TcxGridDBColumn
        Caption = #1055#1086#1089#1072#1076#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 173
        DataBinding.FieldName = 'NAME_POST'
      end
      object ReportDataViewDBColumn6: TcxGridDBColumn
        Caption = #1055#1086#1095#1072#1090#1086#1082
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 121
        DataBinding.FieldName = 'DATE_BEG'
      end
      object ReportDataViewDBColumn9: TcxGridDBColumn
        Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 94
        DataBinding.FieldName = 'DATE_END'
      end
    end
    object cxGridLevel5: TcxGridLevel
      GridView = ReportDataView
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 702
    Height = 89
    Align = alTop
    Locked = True
    TabOrder = 1
    object CancelButton: TSpeedButton
      Left = 639
      Top = 2
      Width = 62
      Height = 46
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
      Height = 46
      Hint = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1085#1072#1082#1072#1079
      Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080
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
      OnClick = RecalcButtonClick
    end
    object SpeedButton2: TSpeedButton
      Left = 89
      Top = 2
      Width = 80
      Height = 46
      Hint = #1044#1088#1091#1082#1091#1074#1072#1090#1080
      Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080
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
      OnClick = SpeedButton2Click
    end
    object cxCheckBox1: TcxCheckBox
      Left = 183
      Top = 14
      Width = 74
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox1PropertiesChange
      Properties.Caption = #1060#1110#1083#1100#1090#1088
      TabOrder = 0
    end
    object cxCheckBox2: TcxCheckBox
      Left = 184
      Top = 38
      Width = 257
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox2PropertiesChange
      Properties.Caption = #1055#1072#1085#1077#1083#1100' '#1076#1083#1103' '#1075#1088#1091#1087#1091#1074#1072#1085#1085#1103' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1111
      TabOrder = 1
    end
    object cxCheckBox3: TcxCheckBox
      Left = 260
      Top = 15
      Width = 297
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1077#1088#1077#1076' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103#1084' '#1087#1077#1088#1077#1088#1072#1093#1091#1074#1072#1090#1080' '#1089#1090#1072#1078
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 184
    Top = 216
    Width = 353
    Height = 73
    BorderWidth = 1
    Caption = #1047#1072#1095#1077#1082#1072#1081#1090#1077' '#1081#1076#1077' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1085#1072#1082#1072#1079#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
  object StyleRepository: TcxStyleRepository
    Left = 64
    Top = 152
    object stBackground: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object stContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object stContentEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object stContentOdd: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object stFilterBox: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object stFooter: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object stGroup: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object stGroupByBox: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object stHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object stInactive: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object stIncSearch: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object stIndicator: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object stPreview: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object stSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object stHotTrack: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
    Left = 100
    Top = 151
    object CloseAction: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      Hint = #1047#1072#1082#1088#1080#1090#1080
      SecondaryShortCuts.Strings = (
        'F10')
      OnExecute = CloseActionExecute
    end
    object PrintAction: TAction
      Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080
      Hint = #1044#1088#1091#1082#1091#1074#1072#1090#1080
    end
    object RecalcAction: TAction
      Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080
      Hint = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1085#1072#1082#1072#1079
    end
    object AdminMode: TAction
      Caption = 'AdminMode'
      ShortCut = 16449
      SecondaryShortCuts.Strings = (
        'Ctrl+Alt+Shift+Z')
      OnExecute = AdminModeExecute
    end
    object ShowValues: TAction
      Caption = 'ShowValues'
    end
    object EditAction: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1082#1110#1083#1100#1082#1110#1089#1090#1100' '#1085#1077' '#1074#1080#1082#1086#1088#1080#1089#1090#1072#1085#1080#1093' '#1076#1085#1110#1074' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
    end
  end
  object PrintFooterQuery: TpFIBDataSet
    Database = DMStaj.LocalDatabase
    Transaction = DMStaj.LocalReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from    ASUP_ORDER_PRINT_FOOTER(:Id_Order_Group)')
    Left = 96
    Top = 208
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
    DataSet = DMStaj.ReportDataDataSet
    Left = 64
    Top = 240
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38757.788486851900000000
    ReportOptions.LastChange = 38938.636130694440000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'procedure MasterData1OnAfterCalcHeight(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      
        'procedure ReportSummary1OnAfterCalcHeight(Sender: TfrxComponent)' +
        ';'
      'begin'
      ''
      'end;'
      ''
      'procedure Header1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'end;'
      ''
      'begin'
      ''
      'end.')
    StoreInDFM = False
    Left = 64
    Top = 272
    Datasets = <
      item
        DataSet = PrintDataSet
        DataSetName = 'PrintDataSet'
      end
      item
        DataSet = PrintFooterDataSet
        DataSetName = 'PrintFooterDataSet'
      end>
    Variables = <>
    Style = <>
  end
  object frRtfAdvExport1: TfrRtfAdvExport
    Left = 96
    Top = 336
  end
  object frOLEExcelExport1: TfrOLEExcelExport
    CellsAlign = False
    CellsFillColor = False
    CellsFontColor = False
    CellsFontName = False
    CellsFontSize = False
    CellsFontStyle = False
    Left = 64
    Top = 336
  end
  object frBMPExport1: TfrBMPExport
    Left = 128
    Top = 336
  end
  object frJPEGExport1: TfrJPEGExport
    Left = 160
    Top = 336
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'ReportDataViewDBColumn1.GroupIndex'
      'ReportDataViewDBColumn1.SortOrder'
      'ReportDataViewDBColumn1.Visible'
      'ReportDataViewDBColumn1.Width'
      'ReportDataViewDBColumn2.Width'
      'ReportDataViewDBColumn2.Visible'
      'ReportDataViewDBColumn2.SortOrder'
      'ReportDataViewDBColumn2.GroupIndex'
      'ReportDataViewDBColumn5.GroupIndex'
      'ReportDataViewDBColumn5.SortOrder'
      'ReportDataViewDBColumn5.Visible'
      'ReportDataViewDBColumn5.Width'
      'ReportDataViewDBColumn6.GroupIndex'
      'ReportDataViewDBColumn6.SortOrder'
      'ReportDataViewDBColumn6.Visible'
      'ReportDataViewDBColumn6.Width'
      'ReportDataViewDBColumn8.GroupIndex'
      'ReportDataViewDBColumn8.Visible'
      'ReportDataViewDBColumn8.Width'
      'ReportDataViewDBColumn8.SortOrder'
      'ReportDataViewDBColumn9.GroupIndex'
      'ReportDataViewDBColumn9.Width'
      'ReportDataViewDBColumn9.Visible'
      'ReportDataViewDBColumn9.SortOrder')
    StoredValues = <>
    Left = 64
    Top = 304
  end
  object ReportDataDataSource: TDataSource
    DataSet = DMStaj.ReportDataDataSet
    Left = 136
    Top = 152
  end
  object GetOrderGroup: TpFIBDataSet
    Database = DMStaj.LocalDatabase
    Transaction = DMStaj.LocalReadTransaction
    SelectSQL.Strings = (
      'select   o.id_order_group'
      'from     orders o'
      'where  o.Id_Order = :id_order')
    Left = 128
    Top = 208
    poSQLINT64ToBCD = True
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = DMStaj.LocalDatabase
    Transaction = DMStaj.LocalReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from    ASUP_ORDER_PRINT_FOOTER(:Id_Order_Group)')
    Left = 160
    Top = 208
    poSQLINT64ToBCD = True
  end
end
