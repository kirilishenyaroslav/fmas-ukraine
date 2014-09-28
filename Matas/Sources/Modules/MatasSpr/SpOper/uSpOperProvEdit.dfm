object SpOperProvForm: TSpOperProvForm
  Left = 308
  Top = 245
  BorderStyle = bsDialog
  ClientHeight = 411
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 105
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object LabelName: TLabel
      Left = 8
      Top = 16
      Width = 119
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 44
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxNameEdit: TcxTextEdit
      Left = 136
      Top = 12
      Width = 593
      Height = 21
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxPropDbSch: TcxButtonEdit
      Left = 400
      Top = 40
      Width = 329
      Height = 21
      Enabled = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxPropDbSchPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object cxPropKrSch: TcxButtonEdit
      Left = 400
      Top = 64
      Width = 329
      Height = 21
      Enabled = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object cxCheckDBProp: TcxCheckBox
      Left = 8
      Top = 40
      Width = 393
      Height = 21
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckDBPropPropertiesChange
      Properties.Caption = #1047#1072#1089#1090#1086#1089#1086#1074#1091#1074#1072#1090#1080' '#1074#1083#1072#1089#1090#1080#1074#1110#1089#1090#1100' '#1076#1083#1103' '#1079#1072#1084#1110#1085#1080' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1091' '#1074' '#1076#1077#1073#1077#1090#1110
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object cxCheckKRProp: TcxCheckBox
      Left = 8
      Top = 64
      Width = 393
      Height = 21
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckKRPropPropertiesChange
      Properties.Caption = #1047#1072#1089#1090#1086#1089#1086#1074#1091#1074#1072#1090#1080' '#1074#1083#1072#1089#1090#1080#1074#1110#1089#1090#1100' '#1076#1083#1103' '#1079#1072#1084#1110#1085#1080' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1091' '#1074' '#1082#1088#1077#1076#1080#1090#1110
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object cxIstfin: TcxCheckBox
      Left = 8
      Top = 85
      Width = 385
      Height = 21
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1042#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1074#1072#1090#1080' '#1076#1083#1103' '#1079#1084#1110#1085' '#1076#1078#1077#1088#1077#1083' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
  end
  object PanelButton: TPanel
    Left = 618
    Top = 105
    Width = 124
    Height = 306
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object CancelButton: TcxButton
      Left = 5
      Top = 280
      Width = 115
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 0
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        00009A174AFD103BF400009AFF00FFFF00FFFF00FFFF00FF00009A002CF80030
        FC00009AFF00FFFF00FFFF00FFFF00FF6B6B6BA8A8A8A0A0A06B6B6BFF00FFFF
        00FFFF00FFFF00FF6B6B6B9A9A9A9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FF
        00009A1A47F81A4CFF123BF100009AFF00FFFF00FF00009A012DF60132FF002A
        F300009AFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7AAAAAA9F9F9F6B6B6BFF
        00FFFF00FF6B6B6B9999999E9E9E9797976B6B6BFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A1C47F61B4DFF143EF400009A00009A002DF80134FF032BF20000
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ABABABA2A2A26B
        6B6B6B6B6B9A9A9A9E9E9E9898986B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00009A1D48F61D50FF103DFB0431FE0132FF002CF600009AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ACACACA3
        A3A39F9F9F9E9E9E9999996B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00009A1A48F91342FF0C3CFF0733F600009AFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7A7
        A7A7A3A3A39C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00009A214EFC1D4BFF1847FF1743F600009AFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BACACACAC
        ACACA9A9A9A4A4A46B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00009A2E5BF92C5FFF224DF8204BF82355FF1B46F600009AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB1B1B1B3B3B3AB
        ABABAAAAAAAFAFAFA6A6A66B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A3664FA386BFF2D59F400009A00009A224CF42558FF1D49F60000
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB6B6B6B9B9B9AEAEAE6B
        6B6B6B6B6BA9A9A9B0B0B0A7A7A76B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        00009A4071FA4274FF325DF100009AFF00FFFF00FF00009A224DF1275AFF204C
        F800009AFF00FFFF00FFFF00FFFF00FF6B6B6BBBBBBBBEBEBEAFAFAF6B6B6BFF
        00FFFF00FF6B6B6BA7A7A7B1B1B1AAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FF
        00009A497AFC3B66F300009AFF00FFFF00FFFF00FFFF00FF00009A2550F42655
        FA00009AFF00FFFF00FFFF00FFFF00FF6B6B6BC0C0C0B5B5B56B6B6BFF00FFFF
        00FFFF00FFFF00FF6B6B6BAAAAAAAEAEAE6B6B6BFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      UseSystemPaint = False
    end
    object OkButton: TcxButton
      Left = 5
      Top = 248
      Width = 115
      Height = 25
      Caption = #1055#1088#1080#1085#1103#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0066001EB2311FB133006600FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565659A9A9A9A9A9A65
        6565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00660031C24F22B7381AB02D21B437006600FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565ABABAB9E9E9E9797979C
        9C9C656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        00660047D36D3BCB5E25A83B0066001BA92E1DB132006600FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF656565BFBFBFB5B5B598989865656594
        9494999999656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600
        4FD67953DE7F31B54D006600FF00FF006600179D271EAE31006600FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF656565C4C4C4CACACAA5A5A5656565FF00FF65
        65658C8C8C989898656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        00660041C563006600FF00FFFF00FFFF00FFFF00FF00660019AA2B006600FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF656565B5B5B5656565FF00FFFF00FFFF
        00FFFF00FF656565939393656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600149D210066
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF6565658A8A8A656565FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066
        00006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FF
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
    object cxDelButton: TcxButton
      Left = 5
      Top = 64
      Width = 115
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = cxDelButtonClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF0732DE0732DEFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FF0732DE
        0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732
        DE0732DEFF00FFFF00FFFF00FF0732DE0732DD0732DE0732DEFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF
        0534ED0732DF0732DE0732DEFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DDFF
        00FF0732DD0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0633E60633E60633E90732DCFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0633E307
        32E30534EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0534ED0533E90434EF0434F5FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0434F40534EF0533EBFF
        00FFFF00FF0434F40335F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0335FC0534EF0434F8FF00FFFF00FFFF00FFFF00FF0335FC0335FBFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FCFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB
        0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0335FBFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object cxAddButton: TcxButton
      Left = 5
      Top = 0
      Width = 115
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = cxAddButtonClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        B78183B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
        83B78183B78183FF00FFFF00FFFF00FFC7A79CFEEED4F7E3C5F6DFBCF5DBB4F3
        D7ABF3D3A2F1CF9AF0CF97F0CF98F0CF98F5D49AB78183FF00FFFF00FFFF00FF
        C7A79EFDEFD9F6E3CBF5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC
        97F3D199B78183FF00FFFF00FFFF00FFC7A9A1FEF3E3F8E7D3F5E3CBF5DFC3F3
        DBBBF2D7B2F1D4ABF0D0A3EECC9AEECC97F3D199B78183FF00FFFF00FFFF00FF
        C9ACA5FFF7EBF9EBDAF7E7D2F6E3CAF5DFC2F4DBB9F2D7B2F1D4AAF0D0A1EFCD
        99F3D198B78183FF00FFFF00FFFF00FFCEB2AAFFFCF4FAEFE4F8EADAF7E7D3F5
        E2CBF5DFC2F4DBBBF1D7B2F1D3AAF0D0A1F3D29BB78183FF00FFFF00FFFF00FF
        D3B7AFFFFFFDFBF4ECFAEFE3F9EBDAF7E7D2F5E3C9F5DFC2F4DBBAF2D7B1F0D4
        A9F5D5A3B78183FF00FFFF00FFFF00FFD7BBB2FFFFFFFEF9F5FBF3ECFAEFE2F9
        EADAF8E7D2F5E3CAF5DEC2F4DBBAF2D8B2F6D9ACB78183FF00FFFF00FFFF00FF
        DABEB3FFFFFFFFFEFDFDF8F4FBF3ECF9EFE3F8EADAF7E7D2F6E2CAF6DEC1F4DB
        B9F8DDB4B78183FF00FFFF00FFFF00FFDEC1B5FFFFFFFFFFFFFFFEFDFEF9F4FB
        F3EBFAEFE2F9EBD9F8E6D1F6E2C8F7E1C2F0DAB7B78183FF00FFFF00FFFF00FF
        E2C5B5FFFFFFFFFFFFFFFFFFFFFEFDFDF9F4FBF3EBFAEEE2FAEDDCFCEFD9E6D9
        C4C6BCA9B78183FF00FFFF00FFFF00FFE5C7B7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFDFDF8F3FDF6ECF1E1D5C6A194B59489B08F81B78183FF00FFFF00FFFF00FF
        E9CBB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9BF8C76E8B2
        70ECA54AC58768FF00FFFF00FFFF00FFECCDBAFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFE4D4D2C89A7FFAC577CD9377FF00FFFF00FFFF00FFFF00FF
        EACAB6FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEC7977CCF9B
        86FF00FFFF00FFFF00FFFF00FFFF00FFE9C6B1EBCCB8EBCCB8EBCCB8EBCBB8EA
        CBB8EACBB8EACCB9DABBB0B8857AFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object cxEditButton: TcxButton
      Left = 5
      Top = 32
      Width = 115
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = cxEditButtonClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFB78183B78183B78183B78183B78183B78183B78183B7
        8183B78183B78183B78183B78183B78183FF00FFFF00FFFF00FFB78183FDEFD9
        F4E1C9E4CFB4D1BCA0CDB798DAC09AE4C599E9C896EDCB96EECC97F3D199B781
        83FF00FFFF00FFFF00FFB48176FEF3E3F8E7D3494645373C3E516061AE9C82BF
        A889D0B48DE4C393EDCB96F3D199B78183FF00FFFF00FFFF00FFB48176FFF7EB
        F9EBDAB0A5981B617D097CA818556F66625BA79479C5AC86DCBD8DEECD95B781
        83FF00FFFF00FFFF00FFBA8E85FFFCF4FAEFE4F2E5D638728629799A8D787F95
        6D6F7959539D8B73BAA380D9BC8CB47F81FF00FFFF00FFFF00FFBA8E85FFFFFD
        FBF4ECFAEFE3A5B3B17C7078E5A6A3C89292A4727276575195856CAF9978A877
        79FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5FBF3ECF4EBDF85787CEEB7B5DA
        A6A6C38E8E9E6E6E73564F93836B996E6FFF00FFFF00FFFF00FFCB9A82FFFFFF
        FFFEFDFDF8F4FBF3ECF0E4D9A37978E9B5B5D9A5A5C48F8F9D6D6D7759528F67
        69FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFFFFEFDFEF9F4FBF3EBE8D9CE9E
        7473E8B5B5D8A4A4C18D8D9D6C6C7D5556FF00FFFF00FFFF00FFDCA887FFFFFF
        FFFFFFFFFFFFFFFEFDFDF9F4FBF3EBE0CFC5A17676ECB9B9D6A2A2C68E8E965F
        5D585C60FF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDF8F3FD
        F6ECDAC5BCAC8080F3BCBBA3878C3392B319ADCC19ADCCFF00FFE3B18EFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9AA7A71B27873469CBA0FCA
        F400A4E6021EAA000099EDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE4D4D2B8857ADCA76A10A5CF04A8E60936C9092CC30318AEEDBD92FCF7F4
        FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B86FF00FF077D
        CD4860F1204ADD0416AAEDBD92DCA887DCA887DCA887DCA887DCA887DCA887DC
        A887DCA887B8857AFF00FFFF00FFFF00FF3E4BDB192DC4FF00FF}
      UseSystemPaint = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 105
    Width = 618
    Height = 306
    Align = alClient
    TabOrder = 2
    object cxProvGrid: TcxGrid
      Left = 1
      Top = 1
      Width = 616
      Height = 304
      Align = alClient
      TabOrder = 0
      object cxProvGridDBTableView1: TcxGridDBTableView
        DataController.DataSource = ProvDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyle13
        Styles.Content = cxStyle13
        Styles.Inactive = cxStyle9
        Styles.Selection = cxStyle14
        Styles.Header = cxStyle7
        object cxProvGridDBTableView1ID_PROV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'ID_PROV'
        end
        object cxProvGridDBTableView1ID_OPER: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'ID_OPER'
        end
        object cxProvGridDBTableView1DB_ID_SCH: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_ID_SCH'
        end
        object cxProvGridDBTableView1DB_SCH_TITLE: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_SCH_TITLE'
        end
        object cxProvGridDBTableView1DBColumn1: TcxGridDBColumn
          Options.Filtering = False
          Width = 30
          DataBinding.FieldName = 'EX_PROV'
          IsCaptionAssigned = True
        end
        object cxProvGridDBTableView1DBColumn2: TcxGridDBColumn
          Options.Filtering = False
          Width = 200
          DataBinding.FieldName = 'STR_FDB_SCH'
          IsCaptionAssigned = True
        end
        object cxProvGridDBTableView1DB_SCH_NUMBER: TcxGridDBColumn
          Caption = #1044#1077#1073#1077#1090
          Options.Filtering = False
          Width = 100
          DataBinding.FieldName = 'DB_SCH_NUMBER'
        end
        object cxProvGridDBTableView1KR_ID_SCH: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_ID_SCH'
        end
        object cxProvGridDBTableView1KR_SCH_TITLE: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_SCH_TITLE'
        end
        object cxProvGridDBTableView1DBColumn3: TcxGridDBColumn
          Options.Filtering = False
          Width = 200
          DataBinding.FieldName = 'STR_FKR_SCH'
          IsCaptionAssigned = True
        end
        object cxProvGridDBTableView1KR_SCH_NUMBER: TcxGridDBColumn
          Caption = #1050#1088#1077#1076#1080#1090
          Options.Filtering = False
          Width = 100
          DataBinding.FieldName = 'KR_SCH_NUMBER'
        end
        object cxProvGridDBTableView1FORMULA: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'FORMULA'
        end
        object cxProvGridDBTableView1DB_SCH_TYPE: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_SCH_TYPE'
        end
        object cxProvGridDBTableView1DB_TYPE_OBJECT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_TYPE_OBJECT'
        end
        object cxProvGridDBTableView1DB_SCH_OBJ_TYPE_TITLE: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_SCH_OBJ_TYPE_TITLE'
        end
        object cxProvGridDBTableView1DB_SCH_TYPE_TITLE: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_SCH_TYPE_TITLE'
        end
        object cxProvGridDBTableView1DB_ID_SYSTEM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_ID_SYSTEM'
        end
        object cxProvGridDBTableView1DB_ID_SM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_ID_SM'
        end
        object cxProvGridDBTableView1DB_NAME_SM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_NAME_SM'
        end
        object cxProvGridDBTableView1DB_KOD_SM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_KOD_SM'
        end
        object cxProvGridDBTableView1DB_ID_RZ: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_ID_RZ'
        end
        object cxProvGridDBTableView1DB_NAME_RZ: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_NAME_RZ'
        end
        object cxProvGridDBTableView1DB_KOD_RZ: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_KOD_RZ'
        end
        object cxProvGridDBTableView1DB_ID_ST: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_ID_ST'
        end
        object cxProvGridDBTableView1DB_NAME_ST: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_NAME_ST'
        end
        object cxProvGridDBTableView1DB_KOD_ST: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_KOD_ST'
        end
        object cxProvGridDBTableView1DB_ID_KEKV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_ID_KEKV'
        end
        object cxProvGridDBTableView1DB_NAME_KEKV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_NAME_KEKV'
        end
        object cxProvGridDBTableView1DB_KOD_KEKV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_KOD_KEKV'
        end
        object cxProvGridDBTableView1DB_ID_MARK: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_ID_MARK'
        end
        object cxProvGridDBTableView1DB_NAME_MARK: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_NAME_MARK'
        end
        object cxProvGridDBTableView1DB_SHORT_MARK: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_SHORT_MARK'
        end
        object cxProvGridDBTableView1KR_SCH_TYPE: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_SCH_TYPE'
        end
        object cxProvGridDBTableView1KR_TYPE_OBJECT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_TYPE_OBJECT'
        end
        object cxProvGridDBTableView1KR_SCH_OBJ_TYPE_TITLE: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_SCH_OBJ_TYPE_TITLE'
        end
        object cxProvGridDBTableView1KR_SCH_TYPE_TITLE: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_SCH_TYPE_TITLE'
        end
        object cxProvGridDBTableView1KR_ID_SYSTEM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_ID_SYSTEM'
        end
        object cxProvGridDBTableView1KR_ID_SM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_ID_SM'
        end
        object cxProvGridDBTableView1KR_NAME_SM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_NAME_SM'
        end
        object cxProvGridDBTableView1KR_KOD_SM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_KOD_SM'
        end
        object cxProvGridDBTableView1KR_ID_RZ: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_ID_RZ'
        end
        object cxProvGridDBTableView1KR_NAME_RZ: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_NAME_RZ'
        end
        object cxProvGridDBTableView1KR_KOD_RZ: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_KOD_RZ'
        end
        object cxProvGridDBTableView1KR_ID_ST: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_ID_ST'
        end
        object cxProvGridDBTableView1KR_NAME_ST: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_NAME_ST'
        end
        object cxProvGridDBTableView1KR_KOD_ST: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_KOD_ST'
        end
        object cxProvGridDBTableView1KR_ID_KEKV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_ID_KEKV'
        end
        object cxProvGridDBTableView1KR_NAME_KEKV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_NAME_KEKV'
        end
        object cxProvGridDBTableView1KR_KOD_KEKV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_KOD_KEKV'
        end
        object cxProvGridDBTableView1KR_ID_MARK: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_ID_MARK'
        end
        object cxProvGridDBTableView1KR_NAME_MARK: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_NAME_MARK'
        end
        object cxProvGridDBTableView1KR_SHORT_MARK: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_SHORT_MARK'
        end
        object cxProvGridDBTableView1IS_EX_PROV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'IS_EX_PROV'
        end
        object cxProvGridDBTableView1SUM_DB_PROV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_DB_PROV'
        end
        object cxProvGridDBTableView1SUM_KR_PROV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_KR_PROV'
        end
        object cxProvGridDBTableView1DB_SCH: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_SCH'
        end
        object cxProvGridDBTableView1KR_SCH: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_SCH'
        end
        object cxProvGridDBTableView1FDB_SCH: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'FDB_SCH'
        end
        object cxProvGridDBTableView1FKR_SCH: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'FKR_SCH'
        end
        object cxProvGridDBTableView1FKOL_MAT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'FKOL_MAT'
        end
        object cxProvGridDBTableView1FSUMMA: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'FSUMMA'
        end
        object cxProvGridDBTableView1IS_GROUP: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'IS_GROUP'
        end
        object cxProvGridDBTableView1NPROV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'NPROV'
        end
        object cxProvGridDBTableView1SUM_BY_DB_SCH: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_BY_DB_SCH'
        end
        object cxProvGridDBTableView1SUM_BY_DB_SM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_BY_DB_SM'
        end
        object cxProvGridDBTableView1SUM_BY_DB_RZ: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_BY_DB_RZ'
        end
        object cxProvGridDBTableView1SUM_BY_DB_ST: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_BY_DB_ST'
        end
        object cxProvGridDBTableView1SUM_BY_DB_KEKV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_BY_DB_KEKV'
        end
        object cxProvGridDBTableView1SUM_BY_KR_SCH: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_BY_KR_SCH'
        end
        object cxProvGridDBTableView1SUM_BY_KR_SM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_BY_KR_SM'
        end
        object cxProvGridDBTableView1SUM_BY_KR_RZ: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_BY_KR_RZ'
        end
        object cxProvGridDBTableView1SUM_BY_KR_ST: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_BY_KR_ST'
        end
        object cxProvGridDBTableView1SUM_BY_KR_KEKV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_BY_KR_KEKV'
        end
        object cxProvGridDBTableView1SUM_ID_DB_SCH: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_ID_DB_SCH'
        end
        object cxProvGridDBTableView1SUM_DB_SCH_NUMBER: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_DB_SCH_NUMBER'
        end
        object cxProvGridDBTableView1SUM_ID_DB_SM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_ID_DB_SM'
        end
        object cxProvGridDBTableView1SUM_DB_NAME_SM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_DB_NAME_SM'
        end
        object cxProvGridDBTableView1SUM_DB_KOD_SM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_DB_KOD_SM'
        end
        object cxProvGridDBTableView1SUM_ID_DB_RZ: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_ID_DB_RZ'
        end
        object cxProvGridDBTableView1SUM_DB_NAME_RZ: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_DB_NAME_RZ'
        end
        object cxProvGridDBTableView1SUM_DB_KOD_RZ: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_DB_KOD_RZ'
        end
        object cxProvGridDBTableView1SUM_ID_DB_ST: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_ID_DB_ST'
        end
        object cxProvGridDBTableView1SUM_DB_NAME_ST: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_DB_NAME_ST'
        end
        object cxProvGridDBTableView1SUM_DB_KOD_ST: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_DB_KOD_ST'
        end
        object cxProvGridDBTableView1SUM_ID_DB_KEKV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_ID_DB_KEKV'
        end
        object cxProvGridDBTableView1SUM_DB_NAME_KEKV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_DB_NAME_KEKV'
        end
        object cxProvGridDBTableView1SUM_DB_KOD_KEKV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_DB_KOD_KEKV'
        end
        object cxProvGridDBTableView1SUM_ID_KR_SCH: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_ID_KR_SCH'
        end
        object cxProvGridDBTableView1SUM_KR_SCH_NUMBER: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_KR_SCH_NUMBER'
        end
        object cxProvGridDBTableView1SUM_ID_KR_SM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_ID_KR_SM'
        end
        object cxProvGridDBTableView1SUM_KR_NAME_SM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_KR_NAME_SM'
        end
        object cxProvGridDBTableView1SUM_KR_KOD_SM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_KR_KOD_SM'
        end
        object cxProvGridDBTableView1SUM_ID_KR_RZ: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_ID_KR_RZ'
        end
        object cxProvGridDBTableView1SUM_KR_NAME_RZ: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_KR_NAME_RZ'
        end
        object cxProvGridDBTableView1SUM_KR_KOD_RZ: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_KR_KOD_RZ'
        end
        object cxProvGridDBTableView1SUM_ID_KR_ST: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_ID_KR_ST'
        end
        object cxProvGridDBTableView1SUM_KR_NAME_ST: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_KR_NAME_ST'
        end
        object cxProvGridDBTableView1SUM_KR_KOD_ST: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_KR_KOD_ST'
        end
        object cxProvGridDBTableView1SUM_ID_KR_KEKV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_ID_KR_KEKV'
        end
        object cxProvGridDBTableView1SUM_KR_NAME_KEKV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_KR_NAME_KEKV'
        end
        object cxProvGridDBTableView1SUM_KR_KOD_KEKV: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUM_KR_KOD_KEKV'
        end
        object cxProvGridDBTableView1IS_OUT_POS: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'IS_OUT_POS'
        end
        object cxProvGridDBTableView1DBColumn4: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072
          Options.Filtering = False
          DataBinding.FieldName = 'STR_FSUMMA'
        end
      end
      object cxProvGridLevel1: TcxGridLevel
        GridView = cxProvGridDBTableView1
      end
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 128
    Top = 248
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
      Font.Style = []
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
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
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
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
  object WorkStoredProc: TpFIBStoredProc
    Database = ProvDB
    Transaction = ProvTransaction
    Left = 16
    Top = 248
  end
  object ProvTransaction: TpFIBTransaction
    DefaultDatabase = ProvDB
    TimeoutAction = TARollback
    Left = 208
    Top = 271
  end
  object ProvDB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = ProvTransaction
    DefaultUpdateTransaction = ProvTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 168
    Top = 256
  end
  object ProvDataSet: TpFIBDataSet
    Database = ProvDB
    Transaction = ProvTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_SP_OPER_PROV_SELECT(:ID_OPER)')
    OnCalcFields = ProvDataSetCalcFields
    Left = 208
    Top = 240
    poSQLINT64ToBCD = True
    object ProvDataSetID_PROV: TFIBIntegerField
      FieldName = 'ID_PROV'
    end
    object ProvDataSetID_OPER: TFIBIntegerField
      FieldName = 'ID_OPER'
    end
    object ProvDataSetDB_ID_SCH: TFIBIntegerField
      FieldName = 'DB_ID_SCH'
    end
    object ProvDataSetDB_SCH_TITLE: TFIBStringField
      FieldName = 'DB_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object ProvDataSetDB_SCH_NUMBER: TFIBStringField
      FieldName = 'DB_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object ProvDataSetKR_ID_SCH: TFIBIntegerField
      FieldName = 'KR_ID_SCH'
    end
    object ProvDataSetKR_SCH_TITLE: TFIBStringField
      FieldName = 'KR_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object ProvDataSetKR_SCH_NUMBER: TFIBStringField
      FieldName = 'KR_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object ProvDataSetFORMULA: TFIBStringField
      FieldName = 'FORMULA'
      Size = 255
      EmptyStrToNull = True
    end
    object ProvDataSetDB_SCH_TYPE: TFIBIntegerField
      FieldName = 'DB_SCH_TYPE'
    end
    object ProvDataSetDB_TYPE_OBJECT: TFIBIntegerField
      FieldName = 'DB_TYPE_OBJECT'
    end
    object ProvDataSetDB_SCH_OBJ_TYPE_TITLE: TFIBStringField
      FieldName = 'DB_SCH_OBJ_TYPE_TITLE'
      Size = 30
      EmptyStrToNull = True
    end
    object ProvDataSetDB_SCH_TYPE_TITLE: TFIBStringField
      FieldName = 'DB_SCH_TYPE_TITLE'
      Size = 30
      EmptyStrToNull = True
    end
    object ProvDataSetDB_ID_SYSTEM: TFIBIntegerField
      FieldName = 'DB_ID_SYSTEM'
    end
    object ProvDataSetDB_ID_SM: TFIBBCDField
      FieldName = 'DB_ID_SM'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetDB_NAME_SM: TFIBStringField
      FieldName = 'DB_NAME_SM'
      Size = 180
      EmptyStrToNull = True
    end
    object ProvDataSetDB_KOD_SM: TFIBIntegerField
      FieldName = 'DB_KOD_SM'
    end
    object ProvDataSetDB_ID_RZ: TFIBBCDField
      FieldName = 'DB_ID_RZ'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetDB_NAME_RZ: TFIBStringField
      FieldName = 'DB_NAME_RZ'
      Size = 180
      EmptyStrToNull = True
    end
    object ProvDataSetDB_KOD_RZ: TFIBIntegerField
      FieldName = 'DB_KOD_RZ'
    end
    object ProvDataSetDB_ID_ST: TFIBBCDField
      FieldName = 'DB_ID_ST'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetDB_NAME_ST: TFIBStringField
      FieldName = 'DB_NAME_ST'
      Size = 180
      EmptyStrToNull = True
    end
    object ProvDataSetDB_KOD_ST: TFIBIntegerField
      FieldName = 'DB_KOD_ST'
    end
    object ProvDataSetDB_ID_KEKV: TFIBBCDField
      FieldName = 'DB_ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetDB_NAME_KEKV: TFIBStringField
      FieldName = 'DB_NAME_KEKV'
      Size = 180
      EmptyStrToNull = True
    end
    object ProvDataSetDB_KOD_KEKV: TFIBIntegerField
      FieldName = 'DB_KOD_KEKV'
    end
    object ProvDataSetDB_ID_MARK: TFIBBCDField
      FieldName = 'DB_ID_MARK'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetDB_NAME_MARK: TFIBStringField
      FieldName = 'DB_NAME_MARK'
      Size = 100
      EmptyStrToNull = True
    end
    object ProvDataSetDB_SHORT_MARK: TFIBStringField
      FieldName = 'DB_SHORT_MARK'
      EmptyStrToNull = True
    end
    object ProvDataSetKR_SCH_TYPE: TFIBIntegerField
      FieldName = 'KR_SCH_TYPE'
    end
    object ProvDataSetKR_TYPE_OBJECT: TFIBIntegerField
      FieldName = 'KR_TYPE_OBJECT'
    end
    object ProvDataSetKR_SCH_OBJ_TYPE_TITLE: TFIBStringField
      FieldName = 'KR_SCH_OBJ_TYPE_TITLE'
      Size = 30
      EmptyStrToNull = True
    end
    object ProvDataSetKR_SCH_TYPE_TITLE: TFIBStringField
      FieldName = 'KR_SCH_TYPE_TITLE'
      Size = 30
      EmptyStrToNull = True
    end
    object ProvDataSetKR_ID_SYSTEM: TFIBIntegerField
      FieldName = 'KR_ID_SYSTEM'
    end
    object ProvDataSetKR_ID_SM: TFIBBCDField
      FieldName = 'KR_ID_SM'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetKR_NAME_SM: TFIBStringField
      FieldName = 'KR_NAME_SM'
      Size = 180
      EmptyStrToNull = True
    end
    object ProvDataSetKR_KOD_SM: TFIBIntegerField
      FieldName = 'KR_KOD_SM'
    end
    object ProvDataSetKR_ID_RZ: TFIBBCDField
      FieldName = 'KR_ID_RZ'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetKR_NAME_RZ: TFIBStringField
      FieldName = 'KR_NAME_RZ'
      Size = 180
      EmptyStrToNull = True
    end
    object ProvDataSetKR_KOD_RZ: TFIBIntegerField
      FieldName = 'KR_KOD_RZ'
    end
    object ProvDataSetKR_ID_ST: TFIBBCDField
      FieldName = 'KR_ID_ST'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetKR_NAME_ST: TFIBStringField
      FieldName = 'KR_NAME_ST'
      Size = 180
      EmptyStrToNull = True
    end
    object ProvDataSetKR_KOD_ST: TFIBIntegerField
      FieldName = 'KR_KOD_ST'
    end
    object ProvDataSetKR_ID_KEKV: TFIBBCDField
      FieldName = 'KR_ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetKR_NAME_KEKV: TFIBStringField
      FieldName = 'KR_NAME_KEKV'
      Size = 180
      EmptyStrToNull = True
    end
    object ProvDataSetKR_KOD_KEKV: TFIBIntegerField
      FieldName = 'KR_KOD_KEKV'
    end
    object ProvDataSetKR_ID_MARK: TFIBBCDField
      FieldName = 'KR_ID_MARK'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetKR_NAME_MARK: TFIBStringField
      FieldName = 'KR_NAME_MARK'
      Size = 100
      EmptyStrToNull = True
    end
    object ProvDataSetKR_SHORT_MARK: TFIBStringField
      FieldName = 'KR_SHORT_MARK'
      EmptyStrToNull = True
    end
    object ProvDataSetIS_EX_PROV: TFIBIntegerField
      FieldName = 'IS_EX_PROV'
      OnGetText = ProvDataSetIS_EX_PROVGetText
    end
    object ProvDataSetSUM_DB_PROV: TFIBIntegerField
      FieldName = 'SUM_DB_PROV'
    end
    object ProvDataSetSUM_KR_PROV: TFIBIntegerField
      FieldName = 'SUM_KR_PROV'
    end
    object ProvDataSetDB_SCH: TFIBStringField
      FieldName = 'DB_SCH'
      Size = 10
      EmptyStrToNull = True
    end
    object ProvDataSetKR_SCH: TFIBStringField
      FieldName = 'KR_SCH'
      Size = 10
      EmptyStrToNull = True
    end
    object ProvDataSetFDB_SCH: TFIBSmallIntField
      FieldName = 'FDB_SCH'
    end
    object ProvDataSetFKR_SCH: TFIBSmallIntField
      FieldName = 'FKR_SCH'
    end
    object ProvDataSetFKOL_MAT: TFIBSmallIntField
      FieldName = 'FKOL_MAT'
    end
    object ProvDataSetFSUMMA: TFIBSmallIntField
      FieldName = 'FSUMMA'
    end
    object ProvDataSetIS_GROUP: TFIBSmallIntField
      FieldName = 'IS_GROUP'
    end
    object ProvDataSetNPROV: TFIBIntegerField
      FieldName = 'NPROV'
    end
    object ProvDataSetSUM_BY_DB_SCH: TFIBSmallIntField
      FieldName = 'SUM_BY_DB_SCH'
    end
    object ProvDataSetSUM_BY_DB_SM: TFIBSmallIntField
      FieldName = 'SUM_BY_DB_SM'
    end
    object ProvDataSetSUM_BY_DB_RZ: TFIBSmallIntField
      FieldName = 'SUM_BY_DB_RZ'
    end
    object ProvDataSetSUM_BY_DB_ST: TFIBSmallIntField
      FieldName = 'SUM_BY_DB_ST'
    end
    object ProvDataSetSUM_BY_DB_KEKV: TFIBSmallIntField
      FieldName = 'SUM_BY_DB_KEKV'
    end
    object ProvDataSetSUM_BY_KR_SCH: TFIBSmallIntField
      FieldName = 'SUM_BY_KR_SCH'
    end
    object ProvDataSetSUM_BY_KR_SM: TFIBSmallIntField
      FieldName = 'SUM_BY_KR_SM'
    end
    object ProvDataSetSUM_BY_KR_RZ: TFIBSmallIntField
      FieldName = 'SUM_BY_KR_RZ'
    end
    object ProvDataSetSUM_BY_KR_ST: TFIBSmallIntField
      FieldName = 'SUM_BY_KR_ST'
    end
    object ProvDataSetSUM_BY_KR_KEKV: TFIBSmallIntField
      FieldName = 'SUM_BY_KR_KEKV'
    end
    object ProvDataSetSUM_ID_DB_SCH: TFIBBCDField
      FieldName = 'SUM_ID_DB_SCH'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetSUM_DB_SCH_NUMBER: TFIBStringField
      FieldName = 'SUM_DB_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object ProvDataSetSUM_ID_DB_SM: TFIBBCDField
      FieldName = 'SUM_ID_DB_SM'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetSUM_DB_NAME_SM: TFIBStringField
      FieldName = 'SUM_DB_NAME_SM'
      Size = 180
      EmptyStrToNull = True
    end
    object ProvDataSetSUM_DB_KOD_SM: TFIBIntegerField
      FieldName = 'SUM_DB_KOD_SM'
    end
    object ProvDataSetSUM_ID_DB_RZ: TFIBBCDField
      FieldName = 'SUM_ID_DB_RZ'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetSUM_DB_NAME_RZ: TFIBStringField
      FieldName = 'SUM_DB_NAME_RZ'
      Size = 180
      EmptyStrToNull = True
    end
    object ProvDataSetSUM_DB_KOD_RZ: TFIBIntegerField
      FieldName = 'SUM_DB_KOD_RZ'
    end
    object ProvDataSetSUM_ID_DB_ST: TFIBBCDField
      FieldName = 'SUM_ID_DB_ST'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetSUM_DB_NAME_ST: TFIBStringField
      FieldName = 'SUM_DB_NAME_ST'
      Size = 180
      EmptyStrToNull = True
    end
    object ProvDataSetSUM_DB_KOD_ST: TFIBIntegerField
      FieldName = 'SUM_DB_KOD_ST'
    end
    object ProvDataSetSUM_ID_DB_KEKV: TFIBBCDField
      FieldName = 'SUM_ID_DB_KEKV'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetSUM_DB_NAME_KEKV: TFIBStringField
      FieldName = 'SUM_DB_NAME_KEKV'
      Size = 180
      EmptyStrToNull = True
    end
    object ProvDataSetSUM_DB_KOD_KEKV: TFIBIntegerField
      FieldName = 'SUM_DB_KOD_KEKV'
    end
    object ProvDataSetSUM_ID_KR_SCH: TFIBBCDField
      FieldName = 'SUM_ID_KR_SCH'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetSUM_KR_SCH_NUMBER: TFIBStringField
      FieldName = 'SUM_KR_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object ProvDataSetSUM_ID_KR_SM: TFIBBCDField
      FieldName = 'SUM_ID_KR_SM'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetSUM_KR_NAME_SM: TFIBStringField
      FieldName = 'SUM_KR_NAME_SM'
      Size = 180
      EmptyStrToNull = True
    end
    object ProvDataSetSUM_KR_KOD_SM: TFIBIntegerField
      FieldName = 'SUM_KR_KOD_SM'
    end
    object ProvDataSetSUM_ID_KR_RZ: TFIBBCDField
      FieldName = 'SUM_ID_KR_RZ'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetSUM_KR_NAME_RZ: TFIBStringField
      FieldName = 'SUM_KR_NAME_RZ'
      Size = 180
      EmptyStrToNull = True
    end
    object ProvDataSetSUM_KR_KOD_RZ: TFIBIntegerField
      FieldName = 'SUM_KR_KOD_RZ'
    end
    object ProvDataSetSUM_ID_KR_ST: TFIBBCDField
      FieldName = 'SUM_ID_KR_ST'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetSUM_KR_NAME_ST: TFIBStringField
      FieldName = 'SUM_KR_NAME_ST'
      Size = 180
      EmptyStrToNull = True
    end
    object ProvDataSetSUM_KR_KOD_ST: TFIBIntegerField
      FieldName = 'SUM_KR_KOD_ST'
    end
    object ProvDataSetSUM_ID_KR_KEKV: TFIBBCDField
      FieldName = 'SUM_ID_KR_KEKV'
      Size = 0
      RoundByScale = True
    end
    object ProvDataSetSUM_KR_NAME_KEKV: TFIBStringField
      FieldName = 'SUM_KR_NAME_KEKV'
      Size = 180
      EmptyStrToNull = True
    end
    object ProvDataSetSUM_KR_KOD_KEKV: TFIBIntegerField
      FieldName = 'SUM_KR_KOD_KEKV'
    end
    object ProvDataSetIS_OUT_POS: TFIBSmallIntField
      FieldName = 'IS_OUT_POS'
    end
    object ProvDataSetEX_PROV: TStringField
      FieldKind = fkCalculated
      FieldName = 'EX_PROV'
      Calculated = True
    end
    object ProvDataSetSTR_FDB_SCH: TStringField
      FieldKind = fkCalculated
      FieldName = 'STR_FDB_SCH'
      Calculated = True
    end
    object ProvDataSetSTR_FKR_SCH: TStringField
      FieldKind = fkCalculated
      FieldName = 'STR_FKR_SCH'
      Calculated = True
    end
    object ProvDataSetSTR_FSUMMA: TStringField
      FieldKind = fkCalculated
      FieldName = 'STR_FSUMMA'
      Calculated = True
    end
  end
  object ProvDataSource: TDataSource
    DataSet = ProvDataSet
    Left = 72
    Top = 248
  end
  object IniDataSet: TpFIBDataSet
    Database = ProvDB
    Transaction = ProvTransaction
    Left = 256
    Top = 169
    poSQLINT64ToBCD = True
  end
end
