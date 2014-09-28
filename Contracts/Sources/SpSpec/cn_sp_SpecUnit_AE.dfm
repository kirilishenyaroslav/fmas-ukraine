object frmSpec_AE: TfrmSpec_AE
  Left = 707
  Top = 278
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmSpec_AE'
  ClientHeight = 201
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TcxButton
    Left = 214
    Top = 171
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 307
    Top = 171
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 0
    Width = 385
    Height = 161
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object NameStage_Label: TLabel
      Left = 8
      Top = 8
      Width = 88
      Height = 13
      Caption = 'NameStage_Label'
      Transparent = True
    end
    object CnCode_Label: TLabel
      Left = -47
      Top = 101
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'CnCode_Label'
      Transparent = True
    end
    object Label1: TLabel
      Left = 160
      Top = 101
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'CnCode_Label'
      Transparent = True
    end
    object FullNameStage_Label: TLabel
      Left = 8
      Top = 51
      Width = 104
      Height = 13
      Caption = 'FullNameStage_Label'
      Transparent = True
    end
    object SpeedButton1: TSpeedButton
      Left = 356
      Top = 23
      Width = 19
      Height = 20
      Flat = True
      Glyph.Data = {
        FE020000424DFE02000000000000FE0100002800000010000000100000000100
        08000000000000010000120B0000120B0000720000007200000000000000FFFF
        FF00FF00FF00A46769008E5D590080504B00A0675B00A7756B00FEFBFA00BC82
        6800CF8E6800D1926D00DA9D7500FFFCFA00E7AB7900E2AD7D00E0A66E00E1A9
        7200E1AA7500E1AA7600E2AC7800E3AD7900E1AB7800E2AD7B00E3AF7D00E3B0
        7F00E3B18000E3B18100AB907400E5AD6A00EABC8400E2A95E00E2AA6200E3AC
        6500E3AC6700E3AD6800E5B06B00E6B16E00E6B47200E6B57500E7B77900E9BB
        8000E7BB8000E9BC8200F6E3C900E9BF8200EAC18600EAC28700EBC58C00EBC5
        8E00EDC79200EBC79100EDC99300EECA9700EECA9800EECC9A00EECE9E00EFD1
        A500F2D5AC00F0D4AB00F2D8B100F3DAB600F2DAB600F4DEBD00F6E1C400F6E2
        C500F7E7CF00FBF2E500FBF4EA00FCF7F000FEFAF400EBC48900EECE9D00EFD0
        A000EFD1A300F3DCB800F3DEBD00F4E0C000F4E1C200F7E9D300F8EBD700FAEF
        DD00F8EDDC00FBF4E900FCF7EF00AD966F00B09D7B00F6E6CB00F8EBD400FBF2
        E300FCF7EE00F8EFDE00FAF3E600FFFEFC00B7B1A000B6AF9A00FFFEFB00B6B1
        9E00FCFBF600B7B4A400FEFEFC0080C47700BCC0BF003596EF003696F000409D
        F2001978D800288AEE001B7FEB000962D0000C65D1001174EA000F6AD3000739
        7A00020202020202020202020202020202020203040404040404040404040405
        020202034B3C3B3938363231472E2D05020202064E28272625242321201F2F05
        0202020657414C3D63715F483533300502020207581E2956716D71551D223405
        020202075B506671706F6D7161493705020202095C1C716A686B6C6E715E4A05
        020202095A7171716969677171713A050202020B6215657169696971403F3E05
        0202020B60181771717171712B2A4D050202020C016408465453595150422C05
        0202020C011B1A190F15161211104F050202020E011B1B1B1918171413115205
        0202020E01010101015D0D46454443050202020E0A0A0A0A0A0A0A0A0A0A0A05
        0202}
      OnClick = SpeedButton1Click
    end
    object NameStage_Edit: TcxTextEdit
      Left = 6
      Top = 22
      Width = 347
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 100
      Style.Color = clWindow
      TabOrder = 0
      OnExit = NameStage_EditExit
      OnKeyPress = NameStage_EditKeyPress
    end
    object ShortName_Edit: TcxTextEdit
      Left = 240
      Top = 97
      Width = 113
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 30
      Style.Color = clWindow
      TabOrder = 3
      OnKeyPress = ShortName_EditKeyPress
    end
    object FullName_Edit: TcxTextEdit
      Left = 6
      Top = 63
      Width = 347
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 200
      Style.Color = clWindow
      TabOrder = 1
      OnKeyPress = NameStage_EditKeyPress
    end
    object cxCheckDelete: TcxCheckBox
      Left = 8
      Top = 128
      Width = 321
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1053#1077' '#1074#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1074#1072#1090#1080' '#1089#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100
      TabOrder = 4
    end
    object cnCode_Edit: TcxTextEdit
      Left = 32
      Top = 96
      Width = 105
      Height = 21
      Properties.MaxLength = 10
      TabOrder = 2
    end
  end
end
