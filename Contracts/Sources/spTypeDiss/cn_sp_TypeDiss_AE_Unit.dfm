object frmTypeDiss_AE: TfrmTypeDiss_AE
  Left = 671
  Top = 269
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmTypeDiss_AE'
  ClientHeight = 135
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TcxButton
    Left = 118
    Top = 105
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 211
    Top = 105
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 297
    Height = 97
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object NameLabel: TLabel
      Left = 8
      Top = 11
      Width = 54
      Height = 13
      Caption = 'NameLabel'
      Transparent = True
    end
    object Nakaz_Label: TLabel
      Left = 9
      Top = 51
      Width = 63
      Height = 13
      Caption = 'Nakaz_Label'
      Transparent = True
    end
    object SpeedButton1: TSpeedButton
      Left = 267
      Top = 64
      Width = 21
      Height = 20
      Flat = True
      Glyph.Data = {
        C6020000424DC602000000000000C60100002800000010000000100000000100
        08000000000000010000120B0000120B0000640000006400000000000000FFFF
        FF00FF00FF000086000000830000007B0000005E0000005C0000005800000054
        00000182020000650100005D010004880700068C0900048A0B00035A06000796
        0D0006630900046D0A00068E0F000CA015000C9D150008690E000B891300096D
        110011AA1D000D8217000E78180001500A001CB62F0013872300179928001890
        290021C239001C9A31001C982F0036E554002AD149002BCE49002CD44D000E91
        2D0035E05D0025AC460047F779001DA657000B63440012805B002D919700185F
        69003EABEE0045B4F70048B7FA00196DA3003DAAF400258BD80039A4F4003BA7
        F80040ACFE0041ADFA00025291000354950004579A00065B9F00197ACC001F81
        D4002581CE00319CF700359EF2003CA6FF000458A000065BAA00075CA9000962
        B4001676CA001E80D500268BE5002687DD002889E3002C8FEB002D95EF0038A1
        FF0038A3FF000C67C4000B64BB000F69BF002184E300278CEB000F6AC900126E
        D300116CCF001B6DC4002380E100136FDC001160C0001573E7001574E0001776
        E6001877EA00166AD40002020202020202626002020202020202020202020202
        615F5D5958020202020202020202024A4C57565A535449480202020202020237
        32334D364B5547463E3D020202021D43385B344D3B3941403F3C0202022E311D
        63425E4E3A44454550020202122B1E1E1E1D1D355C4F525102020219232C251E
        292F1E1E1D1D020202020224212A22150304142D300202020202020210201A0A
        050F0C0C02020202020202021F260D070C130202020202020202021C280E0902
        02020202020202020202172711080202020202020202020202021B1606020202
        02020202020202020202180B0202020202020202020202020202020202020202
        02020202020202020202}
      OnClick = SpeedButton1Click
    end
    object Name_Edit: TcxTextEdit
      Left = 8
      Top = 25
      Width = 281
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 100
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = Name_EditKeyPress
    end
    object cn_ordertype_Edit: TcxButtonEdit
      Left = 9
      Top = 63
      Width = 256
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      ParentShowHint = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cn_ordertype_otchislenie_EditPropertiesButtonClick
      ShowHint = True
      Style.Color = 16311512
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 1
    end
  end
end
