object HistoryNomForm: THistoryNomForm
  Left = 153
  Top = 237
  Width = 1042
  Height = 628
  Caption = #1030#1089#1090#1086#1088#1110#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1026
    Height = 85
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 13
      Top = 36
      Width = 38
      Height = 13
      Caption = #1053#1072#1079#1074#1072
    end
    object lblMol: TLabel
      Left = 15
      Top = 9
      Width = 38
      Height = 16
      Caption = #1052#1054#1051':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 13
      Top = 60
      Width = 5
      Height = 13
    end
    object lbl3: TLabel
      Left = 29
      Top = 60
      Width = 52
      Height = 13
      Caption = #1055#1077#1088#1110#1086#1076' '#1079
    end
    object lbl4: TLabel
      Left = 205
      Top = 60
      Width = 15
      Height = 13
      Caption = #1087#1086
    end
    object cxName: TcxTextEdit
      Left = 67
      Top = 31
      Width = 725
      Height = 21
      Properties.ReadOnly = False
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxShow: TcxButton
      Left = 549
      Top = 54
      Width = 120
      Height = 25
      Action = act1
      TabOrder = 1
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
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        660021A335006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF656565949494656565FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF00660024A53912A92028B040006600FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565659696968F8F8F9E9E9E
        656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00660027A73E1E
        B43218AE2913AB2227AF3E006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF6565659999999B9B9B9595959191919D9D9D656565FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0066001F99312EC04A26BA3E1FB53419AF2B13AB2325AE3C0066
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF6565658E8E8EA9A9A9A2A2A29C9C9C969696
        9191919B9B9B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066001D952E3FCE6337C8572F
        C14C25A63B00660029B14114AC2524AD3A006600FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565658B8B
        8BB8B8B8B1B1B1AAAAAA9797976565659F9F9F9292929A9A9A656565FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        0066001A902A4FDA7948D56F40CF642FB34A006600FF00FF0066001CB22F15AC
        2622AC38006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF656565878787C6C6C6C0C0C0B9B9B9A3A3A3656565FF00FF
        656565999999929292999999656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF00660059E28955E08250DB7B36BC5500
        6600FF00FFFF00FFFF00FF006600148D2117AE2721AB36006600FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565CFCFCFCCCC
        CCC7C7C7ABABAB656565FF00FFFF00FFFF00FF65656582828294949498989865
        6565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        00660031B04D5BE48A3ABF5B006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF00660018AE2920AA34006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF656565A2A2A2D1D1D1AEAEAE656565FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF656565959595979797656565FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00660047CF6D006600FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00660019AF2B14AB23006600
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565BDBD
        BD656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF65656596
        9696919191656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF0066000B7E1314AB24006600FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF656565FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF656565767676919191656565FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600
        118D1D006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF656565818181656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF00660008790F006600FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565657272726565
        65FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
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
      NumGlyphs = 2
      UseSystemPaint = False
    end
    object cxMatOtv: TcxButtonEdit
      Left = 67
      Top = 7
      Width = 725
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxMatOtvPropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object cxButton1: TcxButton
      Left = 423
      Top = 54
      Width = 120
      Height = 25
      Action = act2
      TabOrder = 3
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FF868484868484FF00FFFF00FF868484868484FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868484BCBABAB5B3B386848486
        8484868484EBEAEA868484868484868484FF00FFFF00FFFF00FFFF00FFFF00FF
        868484E3E2E2B5B3B3B5B3B3B5B3B35150504F4F4F868787CDCDCDE8E9E9C7C6
        C6868484868484868484FF00FF868484DEDDDDD6D6D6A4A3A3A4A3A3A4A3A356
        5555161516121212181818121212939393CACACA868484FF00FF868484D6D6D6
        D6D6D6A4A3A3E0DEDED9D7D7CDCBCBC2C0C0B6B4B49F9D9D7976771212121414
        141313138684848F8C8C868484D6D6D6A4A3A3F3F2F2FFFEFEFCFBFBEAE7E8E6
        E6E6E6E5E5DAD9D9CCCBCBBFBDBDA2A0A07371719391918E8C8C868484A4A3A3
        FFFFFFFEFDFDFBFBFBDFDEDFADA7A9B4ADAEC3BDBED1CECFE0E0E0E1E1E1D4D3
        D3C7C6C6A7A5A5868383FF00FF868484868484F1F0F0C2B9BA93898BA19B9FAB
        A8AAABA6A7B1ACADAFA9AAB2ADAECAC9C9DCDCDCD0D0D0868484FF00FFFF00FF
        FF00FF868484CAA097BA9E87A2897E95817B897C7F928C92A5A2A4BBB6B7D7D6
        D6CFCFCF868484FF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFEAC4FFDDB3EE
        C399D5AE8CC9A786CC9A99989596868484868484FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFCC9A99FFE7C8FFDDBAFFDBB1FFD9A6FFD39FCC9A99FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9D9BFFEDDAFFE7CEFFE2C3FF
        DDB8FFDBAECC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFCC9A99FEF0E1FFECD8FFE6CCFFE1C2FEDDB7CC9A99FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFFFF5FFFFF5FFF0E1FFEBD6FF
        E8CCF6D4BACC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        CC9A99CC9A99CC9A99FCF3E9FCEADAFCE5D0CC9A99FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99CC9A99CC
        9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object cxButton2: TcxButton
      Left = 674
      Top = 54
      Width = 120
      Height = 25
      Action = act3
      TabOrder = 4
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0732DE0732DE0732DEFF00FFFF00FFFF00FF0732DE0732DE0732
        DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FF
        0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00FFFF00FFFF
        00FFFF00FFFF00FF0732DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DE07
        32DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE
        0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335
        FB0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF0732DE07
        32DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00FFFF00FF0732
        DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE
        0732DE0732DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF0732DE0732DE0335FB0732DE0335FB0732DE0732DEFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0335FB0732DEFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0335FB0732DE0732
        DE0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0335FB
        0732DE0335FB0335FB0335FB0732DE0335FBFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB03
        35FB0335FB0732DE0335FBFF00FFFF00FF0335FB0335FB0335FB0335FBFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0335FB0335FB0732DE0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB03
        35FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FBFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0335FBFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335
        FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB
        0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object cxDateBeg: TcxDateEdit
      Left = 88
      Top = 56
      Width = 113
      Height = 21
      TabOrder = 5
    end
    object cxDateEnd: TcxDateEdit
      Left = 224
      Top = 56
      Width = 113
      Height = 21
      TabOrder = 6
    end
    object cxPeriod: TcxCheckBox
      Left = 9
      Top = 56
      Width = 22
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxPeriodPropertiesChange
      Properties.Caption = ''
      TabOrder = 7
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 85
    Width = 1026
    Height = 311
    Align = alClient
    TabOrder = 1
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 1024
      Height = 309
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        DataController.DataSource = ds1
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = cxGrid1DBTableView1FocusedRecordChanged
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = cxgrdbclmnGrid1DBTableView1DBColumn1
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyle13
        Styles.Content = cxStyle13
        Styles.Header = cxStyle8
        object cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072
          Options.Editing = False
          Options.Filtering = False
          DataBinding.FieldName = 'NAME'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 404
    Width = 1026
    Height = 186
    Align = alBottom
    TabOrder = 2
    object cxGrid2: TcxGrid
      Left = 1
      Top = 1
      Width = 507
      Height = 184
      Align = alLeft
      TabOrder = 0
      object cxGrid2DBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid2DBTableView1DblClick
        DataController.DataSource = ds2
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '#.00'
            Kind = skSum
            FieldName = 'KOL_MAT'
            Column = cxgrdbclmnGrid2DBTableView1DBColumn5
          end
          item
            Format = '#.00'
            Kind = skSum
            FieldName = 'SUMMA'
            Column = cxgrdbclmnGrid2DBTableView1DBColumn6
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyle13
        Styles.Content = cxStyle13
        Styles.Header = cxStyle8
        object cxgrdbclmnGrid2DBTableView1DBColumn4: TcxGridDBColumn
          Caption = #1044#1086#1082'.'
          Options.Editing = False
          Options.Filtering = False
          SortOrder = soAscending
          Width = 63
          DataBinding.FieldName = 'TIPD'
        end
        object cxgrdbclmnGrid2DBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088
          Options.Editing = False
          Options.Filtering = False
          Width = 58
          DataBinding.FieldName = 'NUM_DOC'
        end
        object cxgrdbclmnGrid2DBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1044#1072#1090#1072
          Options.Editing = False
          Options.Filtering = False
          Width = 77
          DataBinding.FieldName = 'DATE_DOC'
        end
        object cxgrdbclmnGrid2DBTableView1DBColumn3: TcxGridDBColumn
          Caption = #1042#1110#1076' '#1082#1086#1075#1086
          Options.Editing = False
          Options.Filtering = False
          Width = 187
          DataBinding.FieldName = 'FIO_OUT'
        end
        object cxgrdbclmnGrid2DBTableView1DBColumn5: TcxGridDBColumn
          Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
          Options.Editing = False
          Options.Filtering = False
          Width = 70
          DataBinding.FieldName = 'KOL_MAT'
        end
        object cxgrdbclmnGrid2DBTableView1DBColumn7: TcxGridDBColumn
          Caption = #1062#1110#1085#1072
          Options.Editing = False
          Options.Filtering = False
          DataBinding.FieldName = 'PRICE'
        end
        object cxgrdbclmnGrid2DBTableView1DBColumn6: TcxGridDBColumn
          Caption = #1057#1091#1084#1072
          DataBinding.FieldName = 'SUMMA'
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = cxGrid2DBTableView1
      end
    end
    object cxGrid3: TcxGrid
      Left = 516
      Top = 1
      Width = 509
      Height = 184
      Align = alClient
      TabOrder = 1
      object cxGrid3DBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid3DBTableView1DblClick
        DataController.DataSource = ds3
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '#.00'
            Kind = skSum
            FieldName = 'KOL_MAT'
            Column = cxgrdbclmnGrid3DBTableView1DBColumn4
          end
          item
            Format = '#.00'
            Kind = skSum
            FieldName = 'SUMMA'
            Column = cxgrdbclmnGrid3DBTableView1DBColumn6
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyle13
        Styles.Content = cxStyle13
        Styles.Header = cxStyle8
        object cxgrdbclmnGrid3DBTableView1DBColumn5: TcxGridDBColumn
          Caption = #1044#1086#1082'.'
          Options.Editing = False
          Options.Filtering = False
          SortOrder = soAscending
          Width = 61
          DataBinding.FieldName = 'TIPD'
        end
        object cxgrdbclmnGrid3DBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088
          Options.Editing = False
          Options.Filtering = False
          Width = 77
          DataBinding.FieldName = 'NUM_DOC'
        end
        object cxgrdbclmnGrid3DBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1044#1072#1090#1072
          Options.Editing = False
          Options.Filtering = False
          Width = 70
          DataBinding.FieldName = 'DATE_DOC'
        end
        object cxgrdbclmnGrid3DBTableView1DBColumn3: TcxGridDBColumn
          Caption = #1050#1086#1084#1091
          Options.Editing = False
          Options.Filtering = False
          Width = 160
          DataBinding.FieldName = 'FIO_IN'
        end
        object cxgrdbclmnGrid3DBTableView1DBColumn4: TcxGridDBColumn
          Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
          Options.Editing = False
          Options.Filtering = False
          Width = 75
          DataBinding.FieldName = 'KOL_MAT'
        end
        object cxgrdbclmnGrid3DBTableView1DBColumn7: TcxGridDBColumn
          Caption = #1062#1110#1085#1072
          Options.Editing = False
          Options.Filtering = False
          DataBinding.FieldName = 'PRICE'
        end
        object cxgrdbclmnGrid3DBTableView1DBColumn6: TcxGridDBColumn
          Caption = #1057#1091#1084#1072
          DataBinding.FieldName = 'SUMMA'
        end
      end
      object cxGrid3Level1: TcxGridLevel
        GridView = cxGrid3DBTableView1
      end
    end
    object cxSplitter2: TcxSplitter
      Left = 508
      Top = 1
      Width = 8
      Height = 184
      HotZoneClassName = 'TcxXPTaskBarStyle'
      HotZone.SizePercent = 100
      Control = cxGrid2
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 396
    Width = 1026
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    HotZone.SizePercent = 100
    AlignSplitter = salBottom
    ResizeUpdate = True
    Control = pnl3
  end
  object StyleRepository: TcxStyleRepository
    Left = 213
    Top = 127
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
  object ds1: TDataSource
    DataSet = DS_History
    Left = 26
    Top = 130
  end
  object DB_History: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = TR_History
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 65
    Top = 128
  end
  object DS_History: TpFIBDataSet
    Database = DB_History
    Transaction = TR_History
    SelectSQL.Strings = (
      'SELECT DISTINCT C.NAME, A.ID_MO_IN As ID_MO'
      ' FROM MAT_DT_DOC A INNER JOIN MAT_DT_DOC_POS B'
      ' ON A.ID_DOC = B.ID_DOC'
      ' INNER JOIN MAT_SP_NOM_BASE C ON B.ID_NOMN = C.ID_NOMN'
      ' ')
    Left = 104
    Top = 128
    poSQLINT64ToBCD = True
    object DS_HistoryNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object DS_HistoryID_MO: TFIBBCDField
      FieldName = 'ID_MO'
      Size = 0
      RoundByScale = True
    end
  end
  object SP_History: TpFIBStoredProc
    Database = DB_History
    Transaction = TR_History
    Left = 171
    Top = 127
  end
  object TR_History: TpFIBTransaction
    DefaultDatabase = DB_History
    TimeoutAction = TARollback
    Left = 133
    Top = 125
  end
  object DS_Pos: TpFIBDataSet
    Database = DB_History
    Transaction = TR_History
    SelectSQL.Strings = (
      'SELECT * from MAT_HISTORY_SP_NOM_POS(:NAME, :ID_MO, 1)'
      'Order by Date_Doc, Num_Doc')
    DataSource = ds1
    Left = 32
    Top = 478
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
    object DS_PosFIO_IN: TFIBStringField
      FieldName = 'FIO_IN'
      Size = 255
      EmptyStrToNull = True
    end
    object DS_PosFIO_OUT: TFIBStringField
      FieldName = 'FIO_OUT'
      Size = 255
      EmptyStrToNull = True
    end
    object DS_PosTIPD: TFIBStringField
      FieldName = 'TIPD'
      EmptyStrToNull = True
    end
    object DS_PosDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object DS_PosNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object DS_PosKOL_MAT: TFIBBCDField
      FieldName = 'KOL_MAT'
      Size = 2
      RoundByScale = True
    end
    object DS_PosID_DOC: TFIBBCDField
      FieldName = 'ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object DS_PosSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DS_PosPRICE: TFIBBCDField
      FieldName = 'PRICE'
      Size = 2
      RoundByScale = True
    end
  end
  object ds2: TDataSource
    DataSet = DS_Pos
    Left = 71
    Top = 475
  end
  object pFIBDataSet: TpFIBDataSet
    Database = DB_History
    Transaction = TR_History
    SelectSQL.Strings = (
      'SELECT * from MAT_HISTORY_SP_NOM_POS(:NAME, :ID_MO, 0)'
      'Order by Date_Doc, Num_Doc')
    DataSource = ds1
    Left = 522
    Top = 464
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
    object pFIBDataSetFIO_IN: TFIBStringField
      FieldName = 'FIO_IN'
      Size = 255
      EmptyStrToNull = True
    end
    object pFIBDataSetFIO_OUT: TFIBStringField
      FieldName = 'FIO_OUT'
      Size = 255
      EmptyStrToNull = True
    end
    object pFIBDataSetTIPD: TFIBStringField
      FieldName = 'TIPD'
      EmptyStrToNull = True
    end
    object pFIBDataSetDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object pFIBDataSetNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object pFIBDataSetKOL_MAT: TFIBBCDField
      FieldName = 'KOL_MAT'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetID_DOC: TFIBBCDField
      FieldName = 'ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetPRICE: TFIBBCDField
      FieldName = 'PRICE'
      Size = 4
      RoundByScale = True
    end
  end
  object ds3: TDataSource
    DataSet = pFIBDataSet
    Left = 559
    Top = 469
  end
  object actlst1: TActionList
    Left = 255
    Top = 123
    object act1: TAction
      Caption = #1042#1110#1076#1110#1073#1088#1072#1090#1080
      ShortCut = 13
      OnExecute = act1Execute
    end
    object act2: TAction
      Caption = #1044#1088#1091#1082
      ShortCut = 16464
      OnExecute = act2Execute
    end
    object act3: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      OnExecute = act3Execute
    end
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DataSet = frxDBDataset1
    DataSetName = 'frxDBDataset1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.DoubleBuffered = False
    PreviewOptions.MDIChild = True
    PreviewOptions.Modal = False
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40260.556689814820000000
    ReportOptions.LastChange = 40260.556689814820000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 294
    Top = 125
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 333
    Top = 127
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = ForReport
    Left = 365
    Top = 130
  end
  object ForReport: TpFIBDataSet
    Database = DB_History
    Transaction = TR_History
    Left = 398
    Top = 128
    poSQLINT64ToBCD = True
  end
end
