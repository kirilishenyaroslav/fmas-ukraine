object CategoryFormAddSum: TCategoryFormAddSum
  Left = 552
  Top = 228
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1089#1091#1084#1084#1091
  ClientHeight = 412
  ClientWidth = 511
  Color = clBtnFace
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
  object OKButton: TcxButton
    Left = 320
    Top = 384
    Width = 91
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 416
    Top = 384
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Width = 497
    Height = 57
    Alignment = alTopLeft
    TabOrder = 0
    object DateBegEdit: TcxDateEdit
      Left = 8
      Top = 24
      Width = 81
      Height = 21
      BeepOnEnter = False
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 0
      OnKeyPress = DateBegEditKeyPress
      EditValue = 0d
    end
    object cxLabel1: TcxLabel
      Left = 8
      Top = 8
      Width = 89
      Height = 17
      AutoSize = False
      TabOrder = 1
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
    end
    object SummaLabel: TcxLabel
      Left = 200
      Top = 8
      Width = 89
      Height = 17
      AutoSize = False
      TabOrder = 2
      Caption = #1057#1091#1084#1084#1072' '#1086#1087#1083#1072#1090#1099
    end
    object SummaEdit: TcxCurrencyEdit
      Left = 200
      Top = 24
      Width = 89
      Height = 21
      BeepOnEnter = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Style.Color = clInfoBk
      TabOrder = 3
      OnExit = SummaEditExit
    end
    object SubsSummaLabel: TcxLabel
      Left = 296
      Top = 8
      Width = 81
      Height = 17
      AutoSize = False
      Properties.ShadowedColor = clNone
      TabOrder = 4
      Caption = #1057#1091#1073#1089'. '#1089#1091#1084#1084#1072
    end
    object SubsSummaEdit: TcxCurrencyEdit
      Left = 296
      Top = 24
      Width = 89
      Height = 21
      BeepOnEnter = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Style.Color = clInfoBk
      TabOrder = 5
      OnExit = SubsSummaEditExit
      OnKeyPress = SubsSummaEditKeyPress
    end
    object cxLabel2: TcxLabel
      Left = 104
      Top = 8
      Width = 89
      Height = 17
      AutoSize = False
      TabOrder = 6
      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
    end
    object DateEndEdit: TcxDateEdit
      Left = 104
      Top = 24
      Width = 81
      Height = 21
      BeepOnEnter = False
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 7
      OnKeyPress = DateBegEditKeyPress
      EditValue = 0d
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 71
    Width = 497
    Height = 306
    Alignment = alTopLeft
    Caption = #1048#1089#1090#1086#1095#1085#1080#1082#1080' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object AddButton: TSpeedButton
      Left = 464
      Top = 16
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
        9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FF
        B79184FEE9C7F4DAB5F3D5AAF2D0A0EFCB96EFC68BEDC182EBC17FEBC180EBC1
        80F2C782A46769FF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
        CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FF9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2
        D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
        B7938AFEEFDAF6E0C6F2DABCECD0AEDDC19CD7B78FDBB88BE5BD89E9BD82E9BD
        7FEFC481A46769FF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0D7D7D7C7
        C7C7BDBDBDBFBFBFC4C4C4C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5E1CAADBCA589A89275B99E7BDBB88AEBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FF959595F5F5F5E9E9E9E4E4E4CFCFCFAA
        AAAA969696A3A3A3BEBEBEC8C8C8C4C4C4C5C5C59C9C9CFF00FFFF00FFFF00FF
        C09E95FFFBF0F2E4D7E4D2C0004B00004B00004B00A28C72C4A883DBB78AE5BD
        87EFC583A46769FF00FFFF00FFFF00FF9F9F9FF9F9F9E9E9E9D8D8D881818181
        8181818181919191ADADADBEBEBEC3C3C3C7C7C79C9C9CFF00FFFF00FFFF00FF
        C6A49AFFFFFCE7DED5C1B6A9004B000D9A1A004B0097856EA28C71B99E7AD9B8
        88F2C98CA46769FF00FFFF00FFFF00FF9F9F9FFEFEFEE1E1E1B9B9B9818181A9
        A9A9818181898989919191A2A2A2BDBDBDCCCCCC9C9C9CFF00FFFF00FFFF00FF
        CBA99EFFFFFF004B00004B00004B0016AC2D004B00004B00004B00A89275D7B8
        8FF3CE97A46769FF00FFFF00FFFF00FFA6A6A6FFFFFF818181818181818181B4
        B4B4818181818181818181979797BDBDBDD1D1D19C9C9CFF00FFFF00FFFF00FF
        CFAC9FFFFFFF004B0031DA602BD05423C2441AB43413A525004B00BDA589DEC1
        9AF6D3A0A46769FF00FFFF00FFFF00FFA6A6A6FFFFFF818181D0D0D0CBCBCBC2
        C2C2B9B9B9B0B0B0818181AAAAAAC6C6C6D6D6D69C9C9CFF00FFFF00FFFF00FF
        D4B0A1FFFFFF004B00004B00004B002ED55A004B00004B00004B00E1C9AAEED3
        ADEBCFA4A46769FF00FFFF00FFFF00FFB1B1B1FFFFFF818181818181818181CE
        CECE818181818181818181CECECED7D7D7D3D3D39C9C9CFF00FFFF00FFFF00FF
        D9B5A1FFFFFFFFFFFFFFFFFF004B0034DE65004B00C1B5A8E6D6C1FBEACEDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFF818181D3
        D3D3818181B9B9B9D9D9D9EAEAEAD5D5D5B7B7B79C9C9CFF00FFFF00FFFF00FF
        DDB7A4FFFFFFFFFFFFFFFFFF004B00004B00004B00E9E1D5E7D3C4B68A7BA17B
        6F9C7667A46769FF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFF81818181
        8181818181E2E2E2DEDEDE9999999999999999999C9C9CFF00FFFF00FFFF00FF
        E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFDFDFDFCFCFCD6D6D6999999ACACAC9B9B9B969696FF00FFFF00FFFF00FF
        E6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5B88265F8B5
        5CBF7A5CFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
        E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6
        F6F6F6F6F6F6F6F6D7D7D7999999AAAAAAFF00FFFF00FFFF00FFFF00FFFF00FF
        E8C4ADEBCBB7EBCBB7EACBB7EACAB6EACAB6EACAB6EACAB6E3C2B1A56B5FFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
        B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      OnClick = AddButtonClick
    end
    object EditButton: TSpeedButton
      Left = 464
      Top = 42
      Width = 23
      Height = 20
      Enabled = False
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA46769A46769
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
        9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FFA46769FCEACE
        F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
        69FF00FFFF00FFFF00FF9C9C9CEBEBEBDEDEDECCCCCCB8B8B8B2B2B2BABABABE
        BEBEBFBFBFC1C1C1C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FFA0675BFEEFDA
        F6E0C6302D2D212527374546998468AD926FC2A074DCB27AE7BC7EEFC481A467
        69FF00FFFF00FFFF00FF959595F0F0F0E5E5E5656565585858777777989898A4
        A4A4AEAEAEBBBBBBC1C1C1C6C6C69C9C9CFF00FFFF00FFFF00FFA0675BFFF4E5
        F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
        69FF00FFFF00FFFF00FF959595F5F5F5E9E9E9A4A4A46A6A6A7676766161617E
        7E7E909090A5A5A5B4B4B4C1C1C19C9C9CFF00FFFF00FFFF00FFA7756BFFFBF0
        F8EADCEEDDCA22576C165E82745D657D52545E3F39867258A78C66CEAA73A065
        67FF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE4E4E47D7D7D7F7F7F82828281
        81816666668888889D9D9DB2B2B2999999FF00FFFF00FFFF00FFA7756BFFFFFC
        FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
        5EFF00FFFF00FFFF00FF9F9F9FFEFEFEF3F3F3EEEEEEACACAC949494C4C4C4AD
        ADAD8B8B8B6363638080809393938F8F8FFF00FFFF00FFFF00FFBC8268FFFFFF
        FEF7F2FAEFE6F0E5D56B5D62E9A4A1CF9090B27575875353583C357A69508153
        54FF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3E9E9E97E7E7ED1D1D1C0
        C0C0A8A8A88686866161617F7F7F838383FF00FFFF00FFFF00FFBC8268FFFFFF
        FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
        4EFF00FFFF00FFFF00FFA6A6A6FFFFFFFEFEFEF8F8F8F3F3F3E4E4E48D8D8DCF
        CFCFBFBFBFA9A9A98585856464647B7B7BFF00FFFF00FFFF00FFD1926DFFFFFF
        FFFFFFFFFEFCFEF7F0FAEFE5E1CEC0875958E1A1A1CC8E8EB07474865151633B
        3CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3F3F3DBDBDB88
        8888CECECEBEBEBEA7A7A7848484696969FF00FFFF00FFFF00FFD1926DFFFFFF
        FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
        423E4145FF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3D2
        D2D28B8B8BD2D2D2BCBCBCAAAAAA7979795C5C5CFF00FFFF00FFDA9D75FFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFCF3E6CFB5AA976666EFAAA98C6D731E79
        9F0C98BD0C98BDFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F4
        F4F4CBCBCB969696D7D7D7959595919191909090909090FF00FFDA9D75FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
        F0008EDE000F95000081B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFC
        FCFCD6D6D68D8D8D9292929E9E9E9F9F9F9191917474746A6A6AE7AB79FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5A56B5FD1914F068FC10393
        DE0320BA0318B2010B99BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDBDBDB999999A3A3A38D8D8D928F92878787848484767676E7AB79FBF4F0
        FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
        BF2F45ED1031D3010A95BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6
        F6F6D7D7D7999999AAAAAAFF00FF888888BABABA9C9C9C757575E7AB79D1926D
        D1926DD1926DD1926DD1926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00
        FF2732D00C19B4FF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1
        B1B1B1B1B1999999FF00FFFF00FFFF00FFAAAAAA8C8C8CFF00FF}
      NumGlyphs = 2
      OnClick = EditButtonClick
    end
    object DeleteButton: TSpeedButton
      Left = 464
      Top = 64
      Width = 23
      Height = 22
      Enabled = False
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        00006E001DE80010DC00006EFF00FFFF00FFFF00FFFF00FF00006E0004E20008
        E700006EFF00FFFF00FFFF00FFFF00FF6B6B6BA8A8A8A0A0A06B6B6BFF00FFFF
        00FFFF00FFFF00FF6B6B6B9A9A9A9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FF
        00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
        DB00006EFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7AAAAAA9F9F9F6B6B6BFF
        00FFFF00FF6B6B6B9999999E9E9E9797976B6B6BFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E001ADF0020EB0013DC00006E00006E0005E2000BEB0004DA0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ABABABA2A2A26B
        6B6B6B6B6B9A9A9A9E9E9E9898986B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ACACACA3
        A3A39F9F9F9E9E9E9999996B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00006E001BE30016EB0011EB000ADF00006EFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7A7
        A7A7A3A3A39C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BACACACAC
        ACACA9A9A9A4A4A46B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00006E062DE30430EB0020E2001EE20027EB0019DF00006EFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB1B1B1B3B3B3AB
        ABABAAAAAAAFAFAFA6A6A66B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB6B6B6B9B9B9AEAEAE6B
        6B6B6B6B6BA9A9A9B0B0B0A7A7A76B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        00006E1442E41645EB092ED900006EFF00FFFF00FF00006E0020D9012CEB001F
        E200006EFF00FFFF00FFFF00FFFF00FF6B6B6BBBBBBBBEBEBEAFAFAF6B6B6BFF
        00FFFF00FF6B6B6BA7A7A7B1B1B1AAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FF
        00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
        E400006EFF00FFFF00FFFF00FFFF00FF6B6B6BC0C0C0B5B5B56B6B6BFF00FFFF
        00FFFF00FFFF00FF6B6B6BAAAAAAAEAEAE6B6B6BFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      OnClick = DeleteButtonClick
    end
    object Panel1: TPanel
      Left = 8
      Top = 16
      Width = 449
      Height = 289
      Caption = 'Panel1'
      TabOrder = 0
      object cxGrid1: TcxGrid
        Left = 1
        Top = 1
        Width = 447
        Height = 287
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        object cxGrid1DBTableView1: TcxGridDBTableView
          DataController.DataSource = DataSource1
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              Column = cxGrid1DBTableView1DBColumn2
            end
            item
              Kind = skSum
              Column = cxGrid1DBTableView1DBColumn3
            end
            item
              Kind = skSum
              Column = cxGrid1DBTableView1DBColumn4
            end
            item
              Kind = skSum
              Column = cxGrid1DBTableView1DBColumn5
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.Background = cxStyle1
          Styles.Content = cxStyle1
          Styles.Inactive = cxStyle4
          Styles.Selection = cxStyle5
          Styles.Header = cxStyle2
          object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.Header = cxStyle3
            Width = 80
            DataBinding.FieldName = 'md_istochnik'
          end
          object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
            FooterAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.Header = cxStyle3
            Width = 86
            DataBinding.FieldName = 'md_sum'
          end
          object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 5
            Properties.DisplayFormat = '0.00000'
            FooterAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.Header = cxStyle3
            Width = 87
            DataBinding.FieldName = 'md_procent'
          end
          object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
            FooterAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.Header = cxStyle3
            Width = 86
            DataBinding.FieldName = 'md_subs_sum'
          end
          object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 5
            Properties.DisplayFormat = '0.00000'
            FooterAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.Header = cxStyle3
            Width = 89
            DataBinding.FieldName = 'md_subs_procent'
          end
          object cxGrid1DBTableView1DBColumn6: TcxGridDBColumn
            Visible = False
            DataBinding.FieldName = 'md_id_smeta'
          end
          object cxGrid1DBTableView1DBColumn7: TcxGridDBColumn
            Visible = False
            DataBinding.FieldName = 'md_id_razdel'
          end
          object cxGrid1DBTableView1DBColumn8: TcxGridDBColumn
            Visible = False
            DataBinding.FieldName = 'md_id_stat'
          end
          object cxGrid1DBTableView1DBColumn9: TcxGridDBColumn
            Visible = False
            DataBinding.FieldName = 'md_id_kekv'
          end
          object cxGrid1DBTableView1DBColumn10: TcxGridDBColumn
            Visible = False
            GroupIndex = 0
            SortOrder = soAscending
            Styles.Content = cxStyle3
            Styles.Footer = cxStyle3
            Styles.Header = cxStyle3
            DataBinding.FieldName = 'md_name_serves'
          end
          object cxGrid1DBTableView1DBColumn11: TcxGridDBColumn
            Visible = False
            DataBinding.FieldName = 'md_id_serves'
          end
          object cxGrid1DBTableView1DBColumn12: TcxGridDBColumn
            Visible = False
            DataBinding.FieldName = 'md_options'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
  end
  object Category_ActionList: TActionList
    Left = 296
    Top = 8
    object Add_Action: TAction
      Category = 'Work'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 45
      OnExecute = Add_ActionExecute
    end
    object Edit_Action: TAction
      Category = 'Work'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ShortCut = 113
      OnExecute = Edit_ActionExecute
    end
    object Delete_Action: TAction
      Category = 'Work'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
    end
    object Ok_Action: TAction
      Category = 'Accept'
      Caption = #1055#1088#1080#1085#1103#1090#1100
      Hint = #1055#1088#1080#1085#1103#1090#1100
      ShortCut = 121
      OnExecute = Ok_ActionExecute
    end
  end
  object ReadDataSet: TpFIBDataSet
    Database = frmDM.DB
    Transaction = frmDM.Transaction_Read
    Left = 240
    Top = 183
    poSQLINT64ToBCD = True
  end
  object MemoryData_sum: TRxMemoryData
    FieldDefs = <
      item
        Name = 'md_istochnik'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'md_subs_sum'
        DataType = ftCurrency
      end
      item
        Name = 'md_subs_procent'
        DataType = ftFloat
      end
      item
        Name = 'md_sum'
        DataType = ftCurrency
      end
      item
        Name = 'md_procent'
        DataType = ftFloat
      end
      item
        Name = 'md_id_smeta'
        DataType = ftInteger
      end
      item
        Name = 'md_id_razdel'
        DataType = ftInteger
      end
      item
        Name = 'md_id_stat'
        DataType = ftInteger
      end
      item
        Name = 'md_id_kekv'
        DataType = ftInteger
      end
      item
        Name = 'md_name_serves'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'md_id_serves'
        DataType = ftInteger
      end
      item
        Name = 'md_options'
        DataType = ftInteger
      end>
    Left = 112
    Top = 231
    object MemoryData_summd_istochnik: TStringField
      FieldName = 'md_istochnik'
    end
    object MemoryData_summd_subs_sum: TCurrencyField
      FieldName = 'md_subs_sum'
    end
    object MemoryData_summd_subs_procent: TFloatField
      FieldName = 'md_subs_procent'
    end
    object MemoryData_summd_sum: TCurrencyField
      FieldName = 'md_sum'
    end
    object MemoryData_summd_procent: TFloatField
      FieldName = 'md_procent'
    end
    object MemoryData_summd_id_smeta: TIntegerField
      FieldName = 'md_id_smeta'
    end
    object MemoryData_summd_id_razdel: TIntegerField
      FieldName = 'md_id_razdel'
    end
    object MemoryData_summd_id_stat: TIntegerField
      FieldName = 'md_id_stat'
    end
    object MemoryData_summd_id_kekv: TIntegerField
      FieldName = 'md_id_kekv'
    end
    object MemoryData_summd_name_serves: TStringField
      FieldName = 'md_name_serves'
    end
    object MemoryData_summd_id_serves: TIntegerField
      FieldName = 'md_id_serves'
    end
    object MemoryData_summd_options: TIntegerField
      FieldName = 'md_options'
    end
  end
  object DataSource1: TDataSource
    DataSet = MemoryData_sum
    Left = 144
    Top = 231
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 376
    Top = 224
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
    object cxStyle2: TcxStyle
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor]
      Color = 12937777
    end
    object Cash_Style: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMoneyGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
  end
end
