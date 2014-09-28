object frmGetRec: TfrmGetRec
  Left = 755
  Top = 163
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1079#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1072#1084#1080' '#1085#1072#1074#1095#1072#1085#1085#1103
  ClientHeight = 488
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label6: TLabel
    Left = 53
    Top = 163
    Width = 49
    Height = 13
    Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 447
    Width = 527
    Height = 41
    Align = alBottom
    TabOrder = 1
    object OkButton: TcxButton
      Left = 366
      Top = 8
      Width = 75
      Height = 25
      Action = Ok_act
      TabOrder = 0
    end
    object CancelButton: TcxButton
      Left = 446
      Top = 8
      Width = 75
      Height = 25
      Action = Cancel_act
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 447
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object FacLabel: TLabel
      Left = 10
      Top = 20
      Width = 56
      Height = 13
      Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SpecLabel: TLabel
      Left = 10
      Top = 52
      Width = 70
      Height = 13
      Caption = #1057#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object FormStudLabel: TLabel
      Left = 10
      Top = 109
      Width = 87
      Height = 13
      Caption = #1060#1086#1088#1084#1072' '#1085#1072#1074#1095#1072#1085#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object NacLabel: TLabel
      Left = 10
      Top = 81
      Width = 73
      Height = 13
      Caption = #1043#1088#1086#1084#1072#1076#1103#1085#1089#1090#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object KatLabel: TLabel
      Left = 10
      Top = 139
      Width = 49
      Height = 13
      Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SrokStudLabel: TLabel
      Left = 10
      Top = 171
      Width = 75
      Height = 13
      Caption = #1057#1088#1086#1082' '#1085#1072#1074#1095#1072#1085#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object AddButton: TSpeedButton
      Left = 408
      Top = 224
      Width = 30
      Height = 30
      Action = add_act
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF0092635D00A4676900A4676900A4676900A4676900A4676900A467
        6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
        6900A4676900A4676900A4676900A4676900FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0093655E00EFD3B400F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB
        9700EFC79100EEC58900EBC18200EBC08000EBC08000EBC08000EBC08000EBC0
        8000EBC08000EDC18000EABF7F009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0093655F00EED4B800F4DABB00F2D5B100F0D1AA00EFCFA300EECB
        9D00EDC79600EDC58F00EBC18800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD
        7F00E9BD7F00EABF7F00E7BC7E009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0093655F00EED7C000F6E0C100F2D9B800F2D4B100F0D1AA00EFCF
        A400EECB9D00EDC79600EDC58F00EBC18900EABF8200E9BD7F00E9BD7F00E9BD
        7F00E9BD7F00EABF7F00E7BC7E009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0093655F00EFDAC500F7E2C700F3DCBF00F2D8B700F2D4B000F0D1
        AA00EFCEA300EECB9C00EDC79500EDC58F00EBC18900E9BD8100E9BD7F00E9BD
        7F00E9BD7F00EABF7F00E7BC7E009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0093656000F0DECC00F8E6CF00F6E0C600F3DCBD00F2D8B700F2D5
        B100EACCA600DDBF9700D7B78D00D6B38700DBB68500E5BC8600E9BF8200E9BD
        7F00E9BD7F00EABF7F00E7BC7E009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0095666000F2E2D300FAEAD700F6E3CE00F4DEC500F3DCBF00F2D8
        B800DEC4A400BAA28400A8917200A78E6E00B89B7500DBB68500EBC18900E9BD
        8100E9BD7F00EABF7F00E7BC7E009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0098696300F2E6DA00FAEEDE00F7E7D400F6E2CB00F4E0C500F3DC
        BF00004B0000004B0000004B0000004B0000A78E6E00D6B38700EDC58F00EBC1
        8900E9BD8100EABF7F00E7BC7E009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009E6E6400F4EAE100FBF2E600F8EADC00F1E1CE00E4D1BD00DCCA
        B300004B00000895110006900E00004B0000A18B6F00C4A88100D6B38700D9B6
        8400E5BC8500EABF8200E7BB7E009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00A3726600F6EEE900FCF6ED00F8EFE300E5D9CA00C0B3A400AD9F
        8F00004B00000C9D19000A981400004B000096826A00A18B6E00A78E6E00B89B
        7400D9B58300EBC28800E7BC80009F6F6000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00A7756800F8F3F000FEFBF600FBF3EB00004B0000004B0000004B
        0000004B000011A624000EA11D00004B0000004B0000004B0000004B0000A68E
        6E00D6B38600EDC58F00E9BF87009F6F6200FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AC796900FAF6F400FFFFFE00FEF8F300004B000025C7470020C1
        40001CBA380018B2300014AC290011A522000DA01C000A9A1700004B0000A891
        7200D7B78D00EEC99600EAC18E00A0706300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00B17E6B00FAF6F400FFFFFF00FFFEFB00004B00002CD3550028CC
        4D0023C545001FBF3E001BB7350017B02E0013AB270010A52000004B0000BAA2
        8300DDBF9500EECB9C00EBC59200A0726400FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00B6816C00FAF6F400FFFFFF00FFFFFF00004B0000004B0000004B
        0000004B000027CB4B0022C44300004B0000004B0000004B0000004B0000E0C4
        A200EACCA500F0CFA300EDC999009D706500FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BB846E00FAF6F400FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7
        F200004B00002DD4580029CF5200004B0000AD9F8E00DEC8B100F3DABC00F2D8
        B600F0D4AF00EFD0A700CEB49100896A6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C0896F00FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
        FB00004B000034DE650030D95E00004B0000C0B3A400E4D1BC00F6DEC400F3DC
        BD00E5CEAF00C4B09600A1927F0080676200FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C58C7000FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00004B0000004B0000004B0000004B0000E6D9C900F2E2CF00FAE9D000E0D0
        BA00B8AB9A00A79C8B00A497860084696400FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00CB917300FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFEFB00FCF7F000FBF2E900FBF2E500E9D3C4009E675B009866
        5B0095655B0096655B0096655B0098685900FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00CF967400FBF7F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFCFA00FCF7F000FFFAEF00DAC0B6009F675B00DAA1
        6B00DD984F00E2903A00EA892300A5686B00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D4987500FCF8F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FFFEF700DDC4BC009F675B00EAB4
        7400EFA95200F6A03600A5686B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D4987500FCF8F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDC7C2009F675B00EAB2
        7300EFA75100A5686B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D4987500FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E2D0CE009F675B00EDB5
        7200A5686B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D3957000E6C2AC00E7C6B000E7C6B000E6C4B000E3C2B000E1C0
        AF00DEBDAD00DCBCAC00D8BAAC00D5B7AB00D3B5AB00C09990009F675B00A568
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object EditButton: TSpeedButton
      Left = 448
      Top = 224
      Width = 30
      Height = 30
      Action = edit_act
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0093655E00A467
        6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
        6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
        6900A4676900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0093655F00EED4
        B800F4DABB00F2D5B100EDCEA700E6C79D00E1C09300DEBB8C00E1BB8800E5BC
        8400E7BC8100E7BC7E00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
        7E009F6F6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0093655F00EED7
        C000F4DEC000F0D8B700E9CCAB00D9BD9900C9AD8900C1A57F00C6A67E00D1AF
        7F00DAB47F00E1B77D00E3BA7D00E7BC7E00E9BD7F00E9BD7F00EABF7F00E7BC
        7E009F6F6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0093655F00EFDA
        C500F6E1C600F0D9BC00E6CEAF00222123003E3935008C7960009D876700AA8F
        6B00B89A6F00C7A47400D1AB7500DEB57900E5BB7D00E7BC7E00EABF7F00E7BC
        7E009F6F6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0093656000F0DE
        CC00F7E5CE00F4DEC500EAD4B6003C3835001F1F2100182A330034434400836F
        56008E7759009E835F00B2926800C7A36F00D9B17600E3BA7D00E7BC7E00E7BC
        7E009F6F6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0095666000F2E2
        D300FAEAD700F6E3CE00F0DAC200AC9D8A00113B4E0004689A00064F75000C3C
        52003A49480077644C0089725300A4865F00BC996900D1AB7300E1B77900E3BA
        7B009F6F6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0098696300F2E6
        DA00FAEEDE00F7E7D400F4E1CA00EBD8BD001A3E4D00036A9D00056798001B50
        6E002A344000413538006A5542007E694C00987D5800B2916300CCA66E00DAB1
        77009D6D5F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009E6E6400F4EA
        E100FBF2E600F8EADC00F7E6D300F3E0CA007486860004598300315065009560
        6000AA6E6E00965D5D00643B3A0065524000766347008E745100A9895D00C09C
        690096695A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A3726600F6EE
        E900FCF6ED00F8EFE300F7EADA00F7E6D300F0DDC9000B4159008C5B5B00CC8E
        8E00BB7E7E00AA6E6E00965C5C00643B3A0064513E006F5D4300826C4B009A7E
        5500865D5100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A7756800F8F3
        F000FEFBF600FBF3EB00F8EEE300F8EBDC00F6E6D1004E6C76009C696900DD9D
        9D00CB8C8C00BA7D7D00A96D6D00915959005A35340062503D006A5841007B66
        480073504600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AC796900FAF6
        F400FFFFFE00FEF8F300FBF2EA00F8EEE300F8EBDA00F4E3D0007B504F00E2A4
        A400DC9D9D00CA8C8C00BA7D7D00A96D6D008C5757005A353400604F3D006C59
        410062443C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B17E6B00FAF6
        F400FFFFFF00FFFEFB00FEF7F000FBF3EA00FAEFE300F8EADA00E1CCBB007B50
        4F00E2A3A300DC9C9C00CA8B8B00B87B7B00A76C6C008C5656005A3535006652
        3F00583F3700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B6816C00FAF6
        F400FFFFFF00FFFFFF00FFFCFB00FEF7F200FBF3EB00F8EEE300F8EBDC00E1CC
        BB0073484700E1A3A300DA9C9C00C98B8B00B87B7B00A76C6C008B5656005D38
        3600533C3500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BB846E00FAF6
        F400FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF3EA00FAEEE300F8EA
        DA00BBA1960073484700E1A1A100DA9A9A00C98A8A00B77A7A00A66B6B008B55
        55005A353500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C0896F00FBF7
        F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2EA00FAEE
        E200F8EBDA00BBA1960073484700E0A1A100D99A9A00C78A8A00B77A7A00A66B
        6B008A5555005B353500FF00FF00FF00FF00FF00FF00FF00FF00C58C7000FBF7
        F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FCF8F200FBF3
        EA00F8EEE200F8EAD900BCA1960091606000EBAAAA00D9999900C7898900B679
        7900804E4E004148550035475600FF00FF00FF00FF00FF00FF00CB917300FBF7
        F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FCF7
        F000FBF2E900FBF2E500E9D3C40084544C0091606000EAAAAA00D8999900534E
        5700028AC40000AAEA0000A6E6000087C400FF00FF00FF00FF00CF967400FBF7
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFC
        FA00FCF7F000FFFAEF00DAC0B6009F675B00AA78560090606000C2898900097B
        AB0000BDFF0000BDFF0000A6E600001C9D0000008200FF00FF00D4987500FCF8
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFCFB00FFFEF700DDC4BC009F675B00EAB47400B77D460073474700009F
        DE0000BDFF00008CD100001C9D00010D9D00010A970000008200D4987500FCF8
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00DDC7C2009F675B00EAB27300EFA751007A494A000093
        D10000B1F200012BA7000725DC000420B800021DB100010A9700D4987500FFFE
        FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00E2D0CE009F675B00EDB57200A5686B00FF00FF00FF00
        FF000084C1000C21BF002D4FF6000F2ECC00031EB10000058F00CF8E6800CF8E
        6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
        6800CF8E6800CF8E6800CF8E68009F675B00A5686B00FF00FF00FF00FF00FF00
        FF00FF00FF001624BF005270FC001839E30001099700FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF001322BD00050DA500FF00FF00FF00FF00}
    end
    object DeleteButton: TSpeedButton
      Left = 488
      Top = 224
      Width = 30
      Height = 30
      Action = del_act
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000005B7000005B700FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000005B7000005B7000005B700FF00FF00FF00FF00FF00
        FF000005B7000005B7000005B700FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000005B7000005B7000005B700FF00FF00FF00FF00FF00FF00FF00
        FF000005B7000005B7000005B7000005B700FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000005
        B7000005B7000005B7000005B700FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000005B7000005B7000005B7000005B7000005B700FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000005B7000005
        B7000005B7000005B700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000005B7000005B7000005B7000005B7000005B700FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000005B7000005B7000005
        B7000005B700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000006F6000005B7000005B7000005B7000005B700FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000005B7000005B7000005B7000005
        B700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000005B7000005B7000005B7000005
        B700FF00FF00FF00FF000005B7000005B7000005B7000005B7000005B700FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000005B7000005B7000005
        B7000005B7000005B7000005B7000005B7000005B7000005B700FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000005B7000005
        B7000006F6000005B7000006F6000005B7000005B700FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000005
        B7000005B7000005B7000006F6000005B700FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000005B7000005
        B7000006F6000005B7000005B7000006F6000006F600FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000005B7000005B7000006
        F6000005B7000006F6000006F6000006F6000005B7000006F600FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000006F6000006F6000006F6000005
        B7000006F600FF00FF00FF00FF000006F6000006F6000006F6000006F600FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000006F6000006F6000005B7000006F6000006
        F600FF00FF00FF00FF00FF00FF00FF00FF000006F6000006F6000006F6000006
        F600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000006F6000006F6000006F6000006F6000006F600FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000006F6000006
        F6000006F600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000006F6000006F6000006F6000006F6000006F600FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000006
        F6000006F6000006F600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000006F6000006F6000006F6000006F6000006F600FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000006F600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000006
        F6000006F6000006F6000006F6000006F600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000006
        F6000006F6000006F6000006F600FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000006
        F6000006F6000006F600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object Label1: TLabel
      Left = 10
      Top = 203
      Width = 51
      Height = 13
      Caption = #1055#1086#1095#1072#1090#1086#1082' '#1079
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 186
      Top = 203
      Width = 28
      Height = 13
      Caption = #1082#1091#1088#1089#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Valut_Label: TLabel
      Left = 10
      Top = 235
      Width = 38
      Height = 13
      Caption = #1042#1072#1083#1102#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object FacultyText: TcxButtonEdit
      Left = 120
      Top = 16
      Width = 401
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clWindow
      TabOrder = 0
    end
    object SpecialityText: TcxButtonEdit
      Left = 120
      Top = 48
      Width = 401
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = SpecialityTextPropertiesButtonClick
      Style.Color = clWindow
      TabOrder = 1
    end
    object FormStudText: TcxButtonEdit
      Left = 120
      Top = 106
      Width = 401
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit3PropertiesButtonClick
      Style.Color = clWindow
      TabOrder = 3
    end
    object NacText: TcxButtonEdit
      Left = 120
      Top = 77
      Width = 401
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = GragdTextPropertiesButtonClick
      Style.Color = clWindow
      TabOrder = 2
    end
    object KatText: TcxButtonEdit
      Left = 120
      Top = 136
      Width = 401
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = KategoryTextPropertiesButtonClick
      Style.Color = clWindow
      TabOrder = 4
    end
    object SrokStudText: TcxCurrencyEdit
      Left = 120
      Top = 168
      Width = 121
      Height = 21
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '0.0'
      TabOrder = 5
      OnExit = SrokStudTextExit
      OnKeyPress = SrokStudTextKeyPress
    end
    object cxGridKursSumm: TcxGrid
      Left = 0
      Top = 264
      Width = 257
      Height = 177
      TabOrder = 6
      object cxGridKursSummDBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSourceSumm
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'mrSumm'
            Column = TableSumm
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyle44
        Styles.Content = cxStyle48
        Styles.ContentEven = cxStyle49
        Styles.ContentOdd = cxStyle50
        Styles.Inactive = cxStyle52
        Styles.IncSearch = cxStyle53
        Styles.Selection = cxStyle56
        Styles.Footer = cxStyle51
        Styles.Indicator = cxStyle54
        Styles.Preview = cxStyle55
        object TableYear: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.Sorting = False
          Width = 24
          DataBinding.FieldName = 'mrYear'
        end
        object TableDate_beg: TcxGridDBColumn
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.MaxDate = 420031.000000000000000000
          Properties.MinDate = 2.000000000000000000
          Properties.ReadOnly = False
          Properties.OnValidate = TableDate_begPropertiesValidate
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.Sorting = False
          Width = 67
          DataBinding.FieldName = 'mrDate_beg'
        end
        object TableDate_end: TcxGridDBColumn
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.MaxDate = 420031.000000000000000000
          Properties.MinDate = 2.000000000000000000
          Properties.ReadOnly = False
          Properties.OnValidate = TableDate_endPropertiesValidate
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.Sorting = False
          Width = 70
          DataBinding.FieldName = 'mrDate_end'
        end
        object TableMonth: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.Sorting = False
          Width = 30
          DataBinding.FieldName = 'mrMonth'
        end
        object TableSumm: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1088#1077#1077#1089#1090#1088#1072
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '0.000'
          MinWidth = 64
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.Sorting = False
          Width = 64
          DataBinding.FieldName = 'mrSumm'
        end
        object cxGridKursSummDBTableView1DBColumn1: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          DataBinding.FieldName = 'mrid_sort'
        end
      end
      object cxGridKursSummLevel1: TcxGridLevel
        GridView = cxGridKursSummDBTableView1
      end
    end
    object cxGrid1: TcxGrid
      Left = 264
      Top = 265
      Width = 257
      Height = 176
      TabOrder = 7
      object cxGridDBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSourceSmet
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = #1050#1110#1083#1100#1082#1110#1089#1090#1100':0'
            Kind = skCount
            FieldName = 'RxID_PEOPLE'
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyle44
        Styles.Content = cxStyle48
        Styles.ContentEven = cxStyle49
        Styles.ContentOdd = cxStyle50
        Styles.Inactive = cxStyle52
        Styles.IncSearch = cxStyle53
        Styles.Selection = cxStyle56
        Styles.Footer = cxStyle51
        Styles.Indicator = cxStyle54
        Styles.Preview = cxStyle55
        object smettable: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.Sorting = False
          Width = 64
          DataBinding.FieldName = 'mrSmet'
        end
        object id_smettable: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Visible = False
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.Sorting = False
          DataBinding.FieldName = 'mrid_smet'
        end
        object Razdeltable: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1088#1077#1077#1089#1090#1088#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          MinWidth = 64
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.Sorting = False
          Width = 64
          DataBinding.FieldName = 'mrRazdel'
        end
        object id_razdeltable: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          SortOrder = soAscending
          DataBinding.FieldName = 'mrid_razdel'
        end
        object stattable: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.Sorting = False
          Width = 64
          DataBinding.FieldName = 'mrstat'
        end
        object id_stattable: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.Moving = False
          Options.Sorting = False
          DataBinding.FieldName = 'mrid_stat'
        end
        object kekvtable: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.Moving = False
          Options.Sorting = False
          Width = 64
          DataBinding.FieldName = 'mrkekv'
        end
        object id_kekvtable: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.Moving = False
          Options.Sorting = False
          DataBinding.FieldName = 'mrid_kekv'
        end
        object ProcentTable: TcxGridDBColumn
          DataBinding.FieldName = 'mrProcent'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object Kurs_Edit: TcxSpinEdit
      Left = 120
      Top = 200
      Width = 57
      Height = 21
      Properties.CanEdit = False
      Properties.MaxValue = 6.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Properties.ReadOnly = False
      TabOrder = 8
      Value = 1
      OnExit = Kurs_EditExit
    end
    object Beg_second_part: TcxCheckBox
      Left = 256
      Top = 168
      Width = 265
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = Beg_second_partPropertiesChange
      Properties.Caption = #1055#1086#1095#1072#1090#1086#1082' '#1079' '#1076#1088#1091#1075#1086#1111' '#1087#1086#1083#1086#1074#1080#1085#1080' '#1085#1072#1074#1095#1072#1083#1100#1085#1086#1075#1086' '#1088#1086#1082#1091
      TabOrder = 9
    end
    object Valut_edit: TcxButtonEdit
      Left = 120
      Top = 232
      Width = 57
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = Valut_editPropertiesButtonClick
      Style.Color = clWindow
      TabOrder = 10
    end
  end
  object ActionList1: TActionList
    Left = 168
    Top = 397
    object Ok_act: TAction
      Caption = 'ActionOk'
      OnExecute = Ok_actExecute
    end
    object Cancel_act: TAction
      Caption = 'ActionCansel'
      OnExecute = Cancel_actExecute
    end
    object add_act: TAction
      Caption = 'add_act'
      OnExecute = add_actExecute
    end
    object edit_act: TAction
      Caption = 'edit_act'
      OnExecute = edit_actExecute
    end
    object del_act: TAction
      Caption = 'del_act'
      OnExecute = del_actExecute
    end
    object GoCancel: TAction
      Caption = 'GoCancel'
      ShortCut = 27
      OnExecute = GoCancelExecute
    end
  end
  object DataSet: TpFIBDataSet
    Database = frmPriceReestr.WorkDatabase
    Transaction = frmPriceReestr.ReadTransaction
    UpdateTransaction = frmPriceReestr.WriteTransaction
    Left = 232
    Top = 392
    poSQLINT64ToBCD = True
  end
  object Styles: TcxStyleRepository
    Left = 210
    Top = 439
    object BackGround: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object FocusedRecord: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 11037222
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clDefault
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      Color = clSilver
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 14601118
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = 15850428
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15850428
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14531001
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
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
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16445924
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15850688
      TextColor = clBlack
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16711164
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16236940
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = 9061632
    end
    object cxStyle48: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle49: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle50: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle51: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle52: TcxStyle
      AssignedValues = [svColor]
      Color = 13679536
    end
    object cxStyle53: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle54: TcxStyle
    end
    object cxStyle55: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16711164
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle56: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10647853
      TextColor = clWhite
    end
    object cxStyle57: TcxStyle
      AssignedValues = [svColor]
      Color = 7384944
    end
    object testColorStyle: TcxStyle
      AssignedValues = [svColor]
      Color = 15921132
    end
    object TreeListStyleSheetDevExpress: TcxTreeListStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle44
      Styles.Content = cxStyle48
      Styles.Inactive = cxStyle52
      Styles.Selection = cxStyle56
      Styles.BandBackground = cxStyle45
      Styles.BandHeader = cxStyle46
      Styles.ColumnHeader = cxStyle47
      Styles.ContentEven = cxStyle49
      Styles.ContentOdd = cxStyle50
      Styles.Footer = cxStyle51
      Styles.IncSearch = cxStyle53
      Styles.Indicator = cxStyle54
      Styles.Preview = cxStyle55
      BuiltIn = True
    end
  end
  object DataSourceSumm: TDataSource
    DataSet = MemoryDataSumm
    Left = 16
    Top = 432
  end
  object MemoryDataSumm: TRxMemoryData
    FieldDefs = <
      item
        Name = 'mrYear'
        DataType = ftInteger
      end
      item
        Name = 'mrSumm'
        DataType = ftFloat
      end
      item
        Name = 'mrMonth'
        DataType = ftInteger
      end
      item
        Name = 'mrid_sort'
        DataType = ftInteger
      end
      item
        Name = 'mrID_Summ'
        DataType = ftLargeint
      end
      item
        Name = 'mrDate_beg'
        DataType = ftDate
      end
      item
        Name = 'mrDate_End'
        DataType = ftDate
      end>
    Left = 48
    Top = 432
    object MemoryDataSummmrYear: TIntegerField
      FieldName = 'mrYear'
    end
    object MemoryDataSummmrSumm: TFloatField
      FieldName = 'mrSumm'
    end
    object MemoryDataSummmrMonth: TIntegerField
      FieldName = 'mrMonth'
    end
    object MemoryDataSummmrid_sort: TIntegerField
      FieldName = 'mrid_sort'
    end
    object MemoryDataSummmrID_Summ: TLargeintField
      FieldName = 'mrID_Summ'
    end
    object MemoryDataSummmrDate_beg: TDateField
      FieldName = 'mrDate_beg'
    end
    object MemoryDataSummmrDate_End: TDateField
      FieldName = 'mrDate_End'
    end
  end
  object DataSourceSmet: TDataSource
    DataSet = MemoryDataSmet
    Left = 296
    Top = 432
  end
  object MemoryDataSmet: TRxMemoryData
    FieldDefs = <
      item
        Name = 'mrSmet'
        DataType = ftInteger
      end
      item
        Name = 'mrid_smet'
        DataType = ftInteger
      end
      item
        Name = 'mrRazdel'
        DataType = ftInteger
      end
      item
        Name = 'mrid_razdel'
        DataType = ftInteger
      end
      item
        Name = 'mrstat'
        DataType = ftInteger
      end
      item
        Name = 'mrid_stat'
        DataType = ftInteger
      end
      item
        Name = 'mrkekv'
        DataType = ftInteger
      end
      item
        Name = 'mrid_kekv'
        DataType = ftInteger
      end
      item
        Name = 'mrProcent'
        DataType = ftInteger
      end>
    Left = 264
    Top = 432
    object MemoryDataSmetmrSmet: TIntegerField
      FieldName = 'mrSmet'
    end
    object MemoryDataSmetmrid_smet: TIntegerField
      FieldName = 'mrid_smet'
    end
    object MemoryDataSmetmrRazdel: TIntegerField
      FieldName = 'mrRazdel'
    end
    object MemoryDataSmetmrid_razdel: TIntegerField
      FieldName = 'mrid_razdel'
    end
    object MemoryDataSmetmrstat: TIntegerField
      FieldName = 'mrstat'
    end
    object MemoryDataSmetmrid_stat: TIntegerField
      FieldName = 'mrid_stat'
    end
    object MemoryDataSmetmrkekv: TIntegerField
      FieldName = 'mrkekv'
    end
    object MemoryDataSmetmrid_kekv: TIntegerField
      FieldName = 'mrid_kekv'
    end
    object MemoryDataSmetmrProcent: TIntegerField
      FieldName = 'mrProcent'
    end
  end
end
