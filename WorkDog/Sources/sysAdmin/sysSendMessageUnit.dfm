object frmSendMessage: TfrmSendMessage
  Left = 277
  Top = 100
  BorderStyle = bsDialog
  Caption = #1042#1110#1076#1087#1088#1072#1074#1082#1072' '#1087#1086#1074#1110#1076#1086#1084#1083#1077#1085#1085#1103
  ClientHeight = 220
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  DesignSize = (
    407
    220)
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Width = 98
    Height = 17
    TabOrder = 0
    Caption = #1058#1077#1082#1089#1090' '#1087#1086#1074#1110#1076#1086#1084#1083#1077#1085#1085#1103
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 48
    Width = 393
    Height = 137
    Alignment = alTopLeft
    Caption = #1055#1086#1074#1110#1076#1086#1084#1083#1077#1085#1085#1103' '#1076#1110#1077' '
    TabOrder = 1
    object cxRadioButton1: TcxRadioButton
      Left = 8
      Top = 24
      Width = 169
      Height = 17
      Caption = '1 '#1093#1074'.'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = cxRadioButton1Click
    end
    object cxRadioButton2: TcxRadioButton
      Left = 8
      Top = 48
      Width = 65
      Height = 17
      Caption = '15 '#1093#1074'.'
      TabOrder = 1
      OnClick = cxRadioButton2Click
    end
    object cxRadioButton3: TcxRadioButton
      Left = 8
      Top = 72
      Width = 65
      Height = 17
      Caption = '30 '#1093#1074'.'
      TabOrder = 2
      OnClick = cxRadioButton3Click
    end
    object cxRadioButton5: TcxRadioButton
      Left = 144
      Top = 48
      Width = 65
      Height = 17
      Caption = '1 '#1075#1086#1076#1080#1085#1091
      TabOrder = 3
      OnClick = cxRadioButton5Click
    end
    object cxRadioButton6: TcxRadioButton
      Left = 144
      Top = 72
      Width = 57
      Height = 17
      Caption = '2 '#1075#1086#1076#1080#1085#1080
      TabOrder = 4
      OnClick = cxRadioButton6Click
    end
    object cxRadioButton7: TcxRadioButton
      Left = 296
      Top = 24
      Width = 57
      Height = 17
      Caption = '6 '#1075#1086#1076#1080#1085
      TabOrder = 5
      OnClick = cxRadioButton7Click
    end
    object cxRadioButton8: TcxRadioButton
      Left = 296
      Top = 48
      Width = 57
      Height = 17
      Caption = '1 '#1076#1086#1073#1091
      TabOrder = 6
      OnClick = cxRadioButton8Click
    end
    object cxRadioButton9: TcxRadioButton
      Left = 296
      Top = 72
      Width = 57
      Height = 17
      Caption = '2 '#1076#1086#1073#1080
      TabOrder = 7
      OnClick = cxRadioButton9Click
    end
    object HourEdit: TcxTextEdit
      Left = 8
      Top = 112
      Width = 73
      Height = 21
      Properties.Alignment.Horz = taRightJustify
      Style.Color = clMoneyGreen
      TabOrder = 8
      Text = '0'
    end
    object MinEdit: TcxTextEdit
      Left = 88
      Top = 112
      Width = 73
      Height = 21
      Properties.Alignment.Horz = taRightJustify
      Style.Color = clMoneyGreen
      TabOrder = 9
      Text = '1'
    end
    object SecEdit: TcxTextEdit
      Left = 168
      Top = 112
      Width = 73
      Height = 21
      Properties.Alignment.Horz = taRightJustify
      Style.Color = clMoneyGreen
      TabOrder = 10
      Text = '0'
    end
    object cxLabel2: TcxLabel
      Left = 8
      Top = 96
      Width = 36
      Height = 17
      TabOrder = 11
      Caption = #1043#1086#1076#1080#1085#1080
    end
    object cxLabel3: TcxLabel
      Left = 88
      Top = 96
      Width = 51
      Height = 17
      TabOrder = 12
      Caption = #1061#1074#1080#1083#1080#1085#1080
    end
    object cxLabel4: TcxLabel
      Left = 168
      Top = 96
      Width = 52
      Height = 17
      TabOrder = 13
      Caption = #1057#1077#1082#1091#1085#1076#1080
    end
    object cxRadioButton4: TcxRadioButton
      Left = 144
      Top = 24
      Width = 65
      Height = 17
      Caption = '45 '#1093#1074'.'
      TabOrder = 14
      OnClick = cxRadioButton4Click
    end
  end
  object cxButton1: TcxButton
    Left = 304
    Top = 191
    Width = 99
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1080#1090#1080
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object SendButton: TcxButton
    Left = 128
    Top = 191
    Width = 171
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1042#1110#1076#1087#1088#1072#1074#1080#1090#1080' '#1087#1086#1074#1110#1076#1086#1084#1083#1077#1085#1085#1103
    Default = True
    TabOrder = 3
    OnClick = SendButtonClick
    Glyph.Data = {
      2A040000424D2A04000000000000EA0100002800000018000000180000000100
      08000000000040020000120B0000120B00006D0000006D00000001560300035A
      0500346CAA00048F0C00079613000A9C1C000EA3270012AA310016B13C001BB7
      44001EBC4C0022C1520025C4580028C95C002DCA5F002DCB5F0030CC640033CF
      660036D1680039D36A003AD36A003CD56B003ED76D004F82B2005988B8008E5D
      5900905F5A00905F5B0090605A0090605B0090605C0090605D00C45A1100CE73
      2E00D07B3900FF00FF00D8893200DA914000DC934200DE9C4D00DE9D5100DE9E
      53008BD5FF00A0E1FF00A6E3FF00E6B08300EABF9A00EDC9B000FFDDAA00FFDE
      AB00FFDEAC00FFE0AF00FFE0B000FFE0B100FFE1B200FFE1B400FFE2B500FFE2
      B600FFE2B700FFE2B800FFE3BB00FFE5BA00FFE5BB00FFE5BD00FFE6C000FFE7
      C200FFE7C400FFE9C500FFE9C600FFE9C900FFEBCA00FFEBCB00FFEBCC00FFEB
      CF00F7E9DC00FFEDD100FFEDD300FFEED100FFEFD500FFEFD900FFF0D800FFF0
      D900FFF0DA00FFF2DC00FFF2DE00E3EBF300FFF3E000FFF3E300FFF4E600FFF6
      E500FFF6E900FFF7EB00FFF8EE00FFF8EF00FFFAEE00FFFAF000FFFAF200FFFB
      F400FFFCF700FBFBFF00FFFBF800FFFCF800FFFCFA00FFFEFB00FCFFFF00FFFE
      FC00FFFEFE00FFFFFE00FFFFFF00232323232323232323232323232323232323
      2323232323232323232323232323232323232323232323232323232323232323
      2323232323232323232323232323232323232323232323232323232323232323
      2323232323232323232323232323232323232323232323232323232323232323
      232323232323232323232323232323232323232323232323232323232323191C
      1A1B1B1B1B1B1B1B1B1A1A1D192323232323232323231E514C4844403D383432
      303030301C2323230123232323231E5954504B46433F3B37343130301D232301
      0123232323231E5E5A57534E4945413F3A3633311E23010E0101232323231E65
      605C242525252525243E39351E0113100C09010123231E6B6762605B58564F4D
      4744403C011615110D0A070401231E6C6C6A262828282829274B47421E011612
      0F0B080501231E6C6C6C6C6966615D632F2E2D491F2301140101010603011E6C
      6C6C6C6C6C67644A222120521F2323010123230104011E6C6C6C6C6C6C6C6A55
      181702581E2323230123232300011E6C6C6C6C6C6C6C6C682C2B2A5F1E232323
      2323232300011E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2323232323232300012323
      2323232323232323232323232323232323232323012323232323232323232323
      2323232323232323232323230123232323232323232323232323232323232323
      2323232323232323232323232323232323232323232323232323232323232323
      2323232323232323232323232323232323232323232323232323232323232323
      2323232323232323232323232323}
    UseSystemPaint = False
  end
  object MessageEdit: TcxTextEdit
    Left = 8
    Top = 24
    Width = 393
    Height = 21
    BeepOnEnter = False
    Style.Color = clMoneyGreen
    TabOrder = 4
    OnKeyDown = msgMemoKeyDown
  end
end
