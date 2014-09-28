object DocWorkReestrView: TDocWorkReestrView
  Left = 310
  Top = 230
  Width = 750
  Height = 500
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 52
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object RefreshButton: TSpeedButton
      Left = 3
      Top = 2
      Width = 70
      Height = 50
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFA87D78A47874A47874A47874A47874A47874A47874A47874
        A47874A47874A47874A47874A47874A47874A47874A47874A47874A47874986B
        66FF00FFFF00FFFF00FFFF00FFFF00FFA97F79F3DDC4F8E3C6F6DFBFF5DCB8F4
        D9B2F3D7ACF3D4A7F2D2A0F0CF9AF0CE98F0CE98F0CE98F0CE98F0CE98F0CE98
        F1CF98EFCD97986B66FF00FFFF00FFFF00FFFF00FFFF00FFA97F7AF2DEC8F7E3
        CAF5DFC2F4DCBCF3DAB6F2D7B1F1D4ABF1D2A5F0CF9FEFCD9AEECC97EECC97EE
        CC97EECC97EECC97EFCD97EDCB96986B66FF00FFFF00FFFF00FFFF00FFFF00FF
        A97F7AF2E0CEF8E7CFF5E2C8F5DEC2F4DCBCF3DAB7F2D7B1F1D4ABF1D2A5F0CF
        A0EFCD9AEECC97EECC97EECC97EECC97EFCD97EDCB96986B66FF00FFFF00FFFF
        00FFFF00FFFF00FFA97F7AF3E3D2F9E9D4F6E4CDF5E1C7018A02F4DCBCF3D9B6
        C2C88D018A02018A02018A02BFBF7BEECC97EECC97EECC97EFCD97EDCB96986B
        66FF00FFFF00FFFF00FFFF00FFFF00FFA97F7BF4E6D8FAECDAF8E7D3F6E4CC01
        8A020B8E0AC3CC97018A02C2C88DF1D4ABC1C485018A02BFC07CEECC97EECC97
        EFCD97EDCB96986B66FF00FFFF00FFFF00FFFF00FFFF00FFAA807BF5E9DDFBEF
        E0F8EAD9F7E6D2018A02018A02018A02C3CC97F3D9B6F2D7B1F1D4ACC1C48501
        8A02EECC99EECC97EFCD97EDCB96986B66FF00FFFF00FFFF00FFFF00FFFF00FF
        AD837DF5ECE3FBF2E6F9EDDEF8E9D7018A02018A02018A02018A02F4DCBBF3D9
        B6F2D7B1F1D4AB018A02F0CFA0EECC99EFCD97EDCB96986B66FF00FFFF00FFFF
        00FFFF00FFFF00FFB2887EF7EFE8FCF5ECFAEFE4F9ECDD018A02018A02018A02
        018A02018A02F4DCBCF3D9B7F1D7B0F1D4ABF0D2A5F0CF9FEFCD9AEDCA96986B
        66FF00FFFF00FFFF00FFFF00FFFF00FFB68B80F8F2EEFDF8F1FAF3EAF9EFE3F9
        ECDDF8E9D8F7E6D2F6E4CCF5E1C6F4DFC1F4DCBCF3D9B6F2D6B0F1D4AAF0D1A4
        F0D09FEDCB98986B66FF00FFFF00FFFF00FFFF00FFFF00FFBA8E82FAF6F4FEFC
        F8FCF6F0FAF2EAFAF0E4F9EDDDF8E9D8F7E7D2018A02018A02018A02018A0201
        8A02F1D7B0F1D4AAF1D2A5EECD9E986B66FF00FFFF00FFFF00FFFF00FFFF00FF
        BE9283FBF8F7FFFFFEFEFAF6FCF5EF018A02FAF0E3F9ECDDF9E9D8F8E7D2018A
        02018A02018A02018A02F3D9B6F2D7B0F2D5ABEFCFA4986B66FF00FFFF00FFFF
        00FFFF00FFFF00FFC29685FBF8F7FFFFFFFFFEFCFEF9F4018A02C9DEBCFAEFE3
        F9EDDDF8E9D7C7D4A8018A02018A02018A02F4DCBBF3D9B5F2D7B0F0D2A8986B
        66FF00FFFF00FFFF00FFFF00FFFF00FFC69986FBF8F7FFFFFFFFFFFFFFFDFCCB
        E3C4018A02C8DDBCFAF0E4C7D8B1018A02C7D4A80B8E0A018A02F5DEC0F4DCBB
        F4DAB6F1D5AE986B66FF00FFFF00FFFF00FFFF00FFFF00FFCA9C88FBF8F7FFFF
        FFFFFFFFFFFFFFFFFEFCCBE3C4018A02018A02018A02C7D8B1F8E9D7F8E6D101
        8A02F5E1C6F4DEC0F3DBBAD9C4A7986B66FF00FFFF00FFFF00FFFF00FFFF00FF
        CEA089FCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFEF9F5FCF5EFFBF2E9FAF0
        E3F9ECDDF8E9D7F8E6D1F6E4CCEBD9C0D1C1ABB5A897986B66FF00FFFF00FFFF
        00FFFF00FFFF00FFD2A38AFCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC
        FDFAF5FCF6EFFAF2E9FAEFE2FAEDDEFBEEDBE7DBC9C8BDAFBAB0A2B7AC9D986B
        66FF00FFFF00FFFF00FFFF00FFFF00FFD7A78CFCF9F7FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFCFDF9F4FCF5EEFCF5EBEEDDD1B48176B48176B48176
        B48176B48176B48176FF00FFFF00FFFF00FFFF00FFFF00FFDAAB8DFCF9F8FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFDF9F4FFFBF3E3CEC6B4
        8176E3B585E5AD6AE9A654EFA039B88285FF00FFFF00FFFF00FFFF00FFFF00FF
        DEAD8EFDFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
        FCFFFEF9E5D1CBB48176EFC48DF3BB6DF8B450B88285FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFDEAD8EFDFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE5D4D0B48176EFC38CF3BA6CB88285FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFDEAD8EFFFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DBD9B48176F1C58BB88285
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDAA482DAA482DAA4
        82DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482B4
        8176B88285FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = RefreshButtonClick
    end
    object CancelButton: TSpeedButton
      Left = 677
      Top = 2
      Width = 65
      Height = 50
      Caption = #1047#1072#1082#1088#1080#1090#1080
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D0000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A00009AFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A
        00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00009A1244FF0C30E600009AFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF00009A0028F2002CF900009AFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA6A6A69797976B6B6BFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B9797979A9A9A6B6B6BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A1A4BFF1645FF1444FF0D
        2FE500009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0027F00030FF
        0030FF002EFD00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BAAAA
        AAA8A8A8A7A7A79797976B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B
        6B6B9696969D9D9D9D9D9D9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A1740F11A4BFF1746FF1646FF0E30E400009AFF00FFFF00FFFF00
        FFFF00FF00009A0129EF0030FF002EFF0030FF0023E700009AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6B6B6BA2A2A2AAAAAAA9A9A9A8A8A89797976B6B6B
        FF00FFFF00FFFF00FFFF00FF6B6B6B9696969D9D9D9D9D9D9D9D9D9191916B6B
        6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A1940F01C4CFF18
        47FF1646FF0F32E700009AFF00FFFF00FF00009A002BF70232FF0331FF0131FF
        0023E400009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B
        6BA2A2A2ABABABA9A9A9A8A8A89999996B6B6BFF00FFFF00FF6B6B6B9999999E
        9E9E9F9F9F9E9E9E9090906B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00009A1A40EF1D4DFF1948FF1848FF1238EF00009A0000
        9A002BF8002FFF002EFF0232FF0324E500009AFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA2A2A2ACACACAAAAAAA9A9A9
        9E9E9E6B6B6B6B6B6B9A9A9A9D9D9D9D9D9D9E9E9E9292926B6B6BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A1B
        42F01E4EFF1B4AFF1949FF0E38F60431FD0131FF002EFF0030FF0027F100009A
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF6B6B6BA3A3A3ACACACABABABAAAAAAA0A0A09E9E9E9E9E9E9D9D9D9D
        9D9D9696966B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF00009A1B42EF1F4FFF1745FF0E3DFF0939
        FF0634FF0333FF0128F000009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA3A3A3ADADAD
        A9A9A9A4A4A4A2A2A2A0A0A09F9F9F9696966B6B6BFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF00009A1B45F51747FF1342FF0F3EFF0C3CFF0830F000009AFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF6B6B6BA6A6A6A9A9A9A7A7A7A5A5A5A3A3A39A9A9A6B
        6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A1F4DFC1D4CFF1A48FF1544
        FF1443FF143CF000009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BABABAB
        ACACACAAAAAAA8A8A8A7A7A7A0A0A06B6B6BFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        009A2A58FC2756FF2251FF204FFF1D4DFF1D4CFF1E4EFF173EEF00009AFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF6B6B6BB1B1B1B1B1B1AEAEAEADADADACACACACACACACACACA1
        A1A16B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF00009A2C56F43160FF2B5AFF295AFF2047F11F46
        F12454FF204FFF1F4FFF183FF000009AFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BAEAEAEB6B6B6B3B3B3
        B2B2B2A6A6A6A6A6A6AFAFAFADADADADADADA2A2A26B6B6BFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A325EF736
        66FF3361FF3365FF274FF000009A00009A2047EF2656FF2251FF2151FF1840EF
        00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF6B6B6BB2B2B2B8B8B8B7B7B7B7B7B7A9A9A96B6B6B6B6B6BA5A5A5B0B0B0AE
        AEAEAEAEAEA1A1A16B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00009A3865F73C6DFF3867FF3869FF284DE700009AFF00FFFF00
        FF00009A1E41E72757FF2352FF2252FF1A42F000009AFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB5B5B5BBBBBBB9B9B9B9B9B9A5A5A5
        6B6B6BFF00FFFF00FF6B6B6BA0A0A0B1B1B1AFAFAFAEAEAEA3A3A36B6B6BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A406EFB4172FF3E6DFF3E
        6FFF2A4CE400009AFF00FFFF00FFFF00FFFF00FF00009A1D40E42859FF2452FF
        2353FF1C45F300009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BBBBB
        BBBEBEBEBCBCBCBCBCBCA5A5A56B6B6BFF00FFFF00FFFF00FFFF00FF6B6B6B9E
        9E9EB1B1B1AFAFAFAFAFAFA5A5A56B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A4676FD4576FF4475FF2E51E500009AFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF00009A1E41E5295AFF2758FF1E48F300009AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6B6B6BBFBFBFC0C0C0BFBFBFA7A7A76B6B6BFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B9F9F9FB2B2B2B1B1B1A6A6A66B6B
        6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A4471F83356E500
        009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A2144E8
        244DF100009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B
        6BBCBCBCAAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF6B6B6BA2A2A2A8A8A86B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      OnClick = CancelButtonClick
    end
  end
  object DocGrid: TcxGrid
    Left = 0
    Top = 52
    Width = 742
    Height = 421
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    object DocsView: TcxGridDBTableView
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'SUMMA'
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      OptionsSelection.MultiSelect = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle13
      Styles.Content = cxStyle13
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle5
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      object DocsViewID_DOC: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_DOC'
      end
      object DocsViewID_TIPD: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_TIPD'
      end
      object DocsViewTIPD: TcxGridDBColumn
        Caption = #1058#1080#1087
        Width = 55
        DataBinding.FieldName = 'TIPD'
      end
      object DocsViewNAME_TIPD: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'NAME_TIPD'
      end
      object DocsViewKOD_DOC: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'KOD_DOC'
      end
      object DocsViewNUM_DOC: TcxGridDBColumn
        Caption = #8470' '#1076#1086#1082'.'
        Width = 80
        DataBinding.FieldName = 'NUM_DOC'
      end
      object DocsViewDATE_DOC: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1076#1086#1082
        Width = 73
        DataBinding.FieldName = 'DATE_DOC'
      end
      object DocsViewOSN_ID_TIPD: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'OSN_ID_TIPD'
      end
      object DocsViewOTIPD: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'OTIPD'
      end
      object DocsViewNAME_OSN: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'NAME_OSN'
      end
      object DocsViewOSN_NUM_DOC: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'OSN_NUM_DOC'
      end
      object DocsViewOSN_DATE_DOC: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'OSN_DATE_DOC'
      end
      object DocsViewID_MO_IN: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_MO_IN'
      end
      object DocsViewFIO_MO_IN: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'FIO_MO_IN'
      end
      object DocsViewNAME_DEP_IN: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'NAME_DEP_IN'
      end
      object DocsViewID_MO_OUT: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_MO_OUT'
      end
      object DocsViewFIO_MO_OUT: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'FIO_MO_OUT'
      end
      object DocsViewNAME_DEP_OUT: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'NAME_DEP_OUT'
      end
      object DocsViewID_CUST: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_CUST'
      end
      object DocsViewNAME_CUSTOMER: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'NAME_CUSTOMER'
      end
      object DocsViewNAME_IN: TcxGridDBColumn
        Caption = #1050#1086#1084#1091
        Width = 202
        DataBinding.FieldName = 'NAME_IN'
      end
      object DocsViewNAME_OUT: TcxGridDBColumn
        Caption = #1042#1110#1076' '#1082#1086#1075#1086
        Width = 190
        DataBinding.FieldName = 'NAME_OUT'
      end
      object DocsViewSHORT_NAME_IN: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'SHORT_NAME_IN'
      end
      object DocsViewSHORT_NAME_OUT: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'SHORT_NAME_OUT'
      end
      object DocsViewSUMMA: TcxGridDBColumn
        Caption = #1057#1091#1084#1072
        Width = 140
        DataBinding.FieldName = 'SUMMA'
      end
      object DocsViewID_MAN: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_MAN'
      end
      object DocsViewFIO_MAN: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'FIO_MAN'
      end
      object DocsViewDOV_NUM: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'DOV_NUM'
      end
      object DocsViewDOV_DATE: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'DOV_DATE'
      end
      object DocsViewDATE_REC: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'DATE_REC'
      end
      object DocsViewNUM_REESTR: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'NUM_REESTR'
      end
      object DocsViewDATE_REESTR: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'DATE_REESTR'
      end
      object DocsViewUSER_NAME: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'USER_NAME'
      end
      object DocsViewCOMPUTER: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'COMPUTER'
      end
      object DocsViewDATETIME: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'DATETIME'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = DocsView
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 16
    Top = 104
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
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWindow
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
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svFont, svTextColor]
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
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
  object WorkDatabase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 72
    Top = 88
  end
  object WorkDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_DT_DOC_REESTR_SELECT_DOC(:ID_REESTR)'
      'ORDER BY DATE_DOC, TIPD, NUM_DOC')
    Left = 112
    Top = 88
    poSQLINT64ToBCD = True
    object WorkDataSetID_DOC: TFIBIntegerField
      FieldName = 'ID_DOC'
    end
    object WorkDataSetID_TIPD: TFIBIntegerField
      FieldName = 'ID_TIPD'
    end
    object WorkDataSetTIPD: TFIBStringField
      FieldName = 'TIPD'
      Size = 15
      EmptyStrToNull = True
    end
    object WorkDataSetNAME_TIPD: TFIBStringField
      FieldName = 'NAME_TIPD'
      Size = 50
      EmptyStrToNull = True
    end
    object WorkDataSetKOD_DOC: TFIBSmallIntField
      FieldName = 'KOD_DOC'
    end
    object WorkDataSetNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object WorkDataSetDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object WorkDataSetOSN_ID_TIPD: TFIBIntegerField
      FieldName = 'OSN_ID_TIPD'
    end
    object WorkDataSetOTIPD: TFIBStringField
      FieldName = 'OTIPD'
      Size = 15
      EmptyStrToNull = True
    end
    object WorkDataSetNAME_OSN: TFIBStringField
      FieldName = 'NAME_OSN'
      Size = 255
      EmptyStrToNull = True
    end
    object WorkDataSetOSN_NUM_DOC: TFIBStringField
      FieldName = 'OSN_NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object WorkDataSetOSN_DATE_DOC: TFIBDateField
      FieldName = 'OSN_DATE_DOC'
    end
    object WorkDataSetID_MO_IN: TFIBIntegerField
      FieldName = 'ID_MO_IN'
    end
    object WorkDataSetFIO_MO_IN: TFIBStringField
      FieldName = 'FIO_MO_IN'
      Size = 100
      EmptyStrToNull = True
    end
    object WorkDataSetNAME_DEP_IN: TFIBStringField
      FieldName = 'NAME_DEP_IN'
      Size = 255
      EmptyStrToNull = True
    end
    object WorkDataSetID_MO_OUT: TFIBIntegerField
      FieldName = 'ID_MO_OUT'
    end
    object WorkDataSetFIO_MO_OUT: TFIBStringField
      FieldName = 'FIO_MO_OUT'
      Size = 100
      EmptyStrToNull = True
    end
    object WorkDataSetNAME_DEP_OUT: TFIBStringField
      FieldName = 'NAME_DEP_OUT'
      Size = 255
      EmptyStrToNull = True
    end
    object WorkDataSetID_CUST: TFIBBCDField
      FieldName = 'ID_CUST'
      Size = 0
      RoundByScale = True
    end
    object WorkDataSetNAME_CUSTOMER: TFIBStringField
      FieldName = 'NAME_CUSTOMER'
      Size = 255
      EmptyStrToNull = True
    end
    object WorkDataSetNAME_IN: TFIBStringField
      FieldName = 'NAME_IN'
      Size = 255
      EmptyStrToNull = True
    end
    object WorkDataSetNAME_OUT: TFIBStringField
      FieldName = 'NAME_OUT'
      Size = 255
      EmptyStrToNull = True
    end
    object WorkDataSetSHORT_NAME_IN: TFIBStringField
      FieldName = 'SHORT_NAME_IN'
      Size = 65
      EmptyStrToNull = True
    end
    object WorkDataSetSHORT_NAME_OUT: TFIBStringField
      FieldName = 'SHORT_NAME_OUT'
      Size = 65
      EmptyStrToNull = True
    end
    object WorkDataSetSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object WorkDataSetID_MAN: TFIBIntegerField
      FieldName = 'ID_MAN'
    end
    object WorkDataSetFIO_MAN: TFIBStringField
      FieldName = 'FIO_MAN'
      Size = 62
      EmptyStrToNull = True
    end
    object WorkDataSetDOV_NUM: TFIBStringField
      FieldName = 'DOV_NUM'
      Size = 15
      EmptyStrToNull = True
    end
    object WorkDataSetDOV_DATE: TFIBDateField
      FieldName = 'DOV_DATE'
    end
    object WorkDataSetDATE_REC: TFIBDateField
      FieldName = 'DATE_REC'
    end
    object WorkDataSetPUB_ID_DOC: TFIBBCDField
      FieldName = 'PUB_ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object WorkDataSetNUM_REESTR: TFIBStringField
      FieldName = 'NUM_REESTR'
      Size = 15
      EmptyStrToNull = True
    end
    object WorkDataSetDATE_REESTR: TFIBDateField
      FieldName = 'DATE_REESTR'
    end
    object WorkDataSetUSER_NAME: TFIBStringField
      FieldName = 'USER_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object WorkDataSetCOMPUTER: TFIBStringField
      FieldName = 'COMPUTER'
      Size = 15
      EmptyStrToNull = True
    end
    object WorkDataSetDATETIME: TFIBDateTimeField
      FieldName = 'DATETIME'
    end
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 72
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = WorkDataSet
    Left = 112
    Top = 128
  end
  object KeyActionList: TActionList
    Left = 224
    Top = 104
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
  end
end
