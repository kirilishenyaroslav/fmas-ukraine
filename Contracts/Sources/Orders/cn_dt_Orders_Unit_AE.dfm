object frmOrdersAE: TfrmOrdersAE
  Left = 510
  Top = 368
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmOrdersAE'
  ClientHeight = 149
  ClientWidth = 475
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
  object SpeedButton: TSpeedButton
    Left = 4
    Top = 119
    Width = 25
    Height = 25
    Flat = True
    Glyph.Data = {
      EE020000424DEE02000000000000EE0100002800000010000000100000000100
      08000000000000010000120B0000120B00006E0000006E000000FF00FF00F8F4
      F4009C68650080504B00A356470098594C0096574B00FFDCD400F7F0ED00F2C2
      A900D1926D00F7EFE900DCA37600FFD1AA00E5DAD100FEC48E00FEC69500FED1
      A700FED5AF00FFE1C600FFEDDD00FECB9900FFCF9E00FEDAB600FEDDBD00FEE2
      C600FFE6CE00FEE6CE00FFEAD500F3AA5800FFCB9500FFD4A600FEEAD500FFDC
      B100FEF2E300D0CBBD00046B0B0005891000058E13001CB032002CBD480018B1
      AA0081FFFF007FFCFC0082FFFF0082FEFE0086FFFF0088FEFE008BFFFF008CFF
      FF0063FBFF0074F8FC0069F7FF006DF8FF006EF2F8000078800064F4FF004BE9
      FC0050EBFE003FE6FF004AE6FC0055D9EB005ADDEE0036E1FF0049D1E60033CB
      EB0037C0DD005B797F0026D7FF002DD1FA00319DB5003391A70010CAFF0011CC
      FF0013C2F40019C1EF001CC5F2002C93B10003C4FF000DB4E90011C4FF00129D
      CB0017A9D70019A1CE001AA5D0001FAAD30035839A0000BDFF0000B0F20006C0
      FE00109ACB00119CCC00118EBB0000A9EB00009FDE00028EC70003BAFF000495
      CE000991CA000A96CC00008ED0000084C1000083C0000081BD000080BC000580
      B7000690D0000089CC00FFFFFF00000000000000000000676706040505050506
      060600006767675E67060D211F161E100F0367674C484E586706090202020202
      15036734322429506724071A131817121103672B312424456724240202020202
      1703672E2F242824242425242214201B190367405A6A24282827262524020202
      1C03675F4F5957242424252401080B0E2303673C3B4449603724246C6C6C6C06
      06066733353A3F4B67246C6C6C6C6C061D00672D302A3841670C0A0A0A0A0A06
      0000672C3E42545B635C5647464D43000000675162533D36394A5D5D646B6900
      0000006767676755526165666800000000000000000000676767000000000000
      000000000000000000000000000000000000}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButtonClick
  end
  object OkButton: TcxButton
    Left = 297
    Top = 118
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 389
    Top = 118
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object ord_ae_GroupBox: TcxGroupBox
    Left = 0
    Top = 0
    Width = 475
    Height = 113
    Align = alTop
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TabStop = False
    object ord_ae_TypeOrder_Label: TLabel
      Left = 8
      Top = 16
      Width = 57
      Height = 13
      Caption = #1058#1080#1087' '#1085#1072#1082#1072#1079#1091
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object ord_ae_NomOrder_Label: TLabel
      Left = 241
      Top = 16
      Width = 72
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1072#1079#1091
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object ord_ae_DateOrder_Label: TLabel
      Left = 361
      Top = 16
      Width = 64
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1082#1072#1079#1091
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object ord_ae_Comments_Label: TLabel
      Left = 8
      Top = 64
      Width = 52
      Height = 13
      Caption = #1050#1086#1084#1077#1085#1090#1072#1088#1110
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object ord_ae_Nom_Ord: TcxTextEdit
      Left = 240
      Top = 30
      Width = 113
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 50
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      OnKeyPress = ord_ae_Nom_OrdKeyPress
    end
    object ord_ae_Comments: TcxTextEdit
      Left = 8
      Top = 76
      Width = 457
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 255
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 3
      Text = '...'
      OnKeyPress = ord_ae_CommentsKeyPress
    end
    object ord_ae_Date_Ord: TcxDateEdit
      Left = 360
      Top = 30
      Width = 105
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
      OnKeyPress = ord_ae_Date_OrdKeyPress
    end
    object ord_ae_Type_Ord: TcxButtonEdit
      Left = 8
      Top = 30
      Width = 221
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = ord_ae_Type_OrdPropertiesButtonClick
      Style.Color = 16311512
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = True
      Style.ButtonTransparency = ebtNone
      TabOrder = 0
      OnKeyPress = ord_ae_Type_OrdKeyPress
    end
  end
end
