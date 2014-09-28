object frmDissInfo: TfrmDissInfo
  Left = 413
  Top = 244
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmDissInfo'
  ClientHeight = 189
  ClientWidth = 343
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
  object SpeedButton: TSpeedButton
    Left = 4
    Top = 154
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
  object GroupBox: TcxGroupBox
    Left = 3
    Top = 8
    Width = 332
    Height = 140
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object OrderNum_Label: TLabel
      Left = 236
      Top = 14
      Width = 80
      Height = 13
      Caption = 'OrderNum_Label'
    end
    object Comments_Label: TLabel
      Left = 8
      Top = 95
      Width = 81
      Height = 13
      Caption = 'Comments_Label'
    end
    object DateDiss_Label: TLabel
      Left = 10
      Top = 14
      Width = 75
      Height = 13
      Caption = 'DateDiss_Label'
    end
    object OrderDate_Label: TLabel
      Left = 130
      Top = 14
      Width = 81
      Height = 13
      Caption = 'OrderDate_Label'
    end
    object TypeDiss_Label: TLabel
      Left = 8
      Top = 56
      Width = 81
      Height = 13
      Caption = 'Comments_Label'
    end
    object OrderNum_Edit: TcxTextEdit
      Left = 236
      Top = 32
      Width = 90
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 16311512
      TabOrder = 2
      OnKeyPress = OrderNum_EditKeyPress
    end
    object Comments_Edit: TcxTextEdit
      Left = 7
      Top = 109
      Width = 320
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 16311512
      TabOrder = 4
      OnKeyPress = Comments_EditKeyPress
    end
    object DateDiss: TcxDateEdit
      Left = 8
      Top = 32
      Width = 97
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DateButtons = []
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = 16311512
      Style.ButtonTransparency = ebtInactive
      TabOrder = 0
      OnKeyPress = DateDissKeyPress
    end
    object OrderDate: TcxDateEdit
      Left = 128
      Top = 32
      Width = 97
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DateButtons = []
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = 16311512
      Style.ButtonTransparency = ebtInactive
      TabOrder = 1
      OnKeyPress = OrderDateKeyPress
    end
    object TypeDiss_Edit: TcxButtonEdit
      Left = 7
      Top = 71
      Width = 319
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
      Properties.OnButtonClick = TypeDiss_EditPropertiesButtonClick
      Style.Color = 16311512
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsDefault
      Style.ButtonTransparency = ebtInactive
      TabOrder = 3
      OnKeyPress = TypeDiss_EditKeyPress
    end
  end
  object OkButton: TcxButton
    Left = 152
    Top = 154
    Width = 92
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    Visible = False
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 250
    Top = 154
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
