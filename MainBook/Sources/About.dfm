object AboutBox: TAboutBox
  Left = 277
  Top = 169
  BorderStyle = bsDialog
  Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103
  ClientHeight = 377
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 549
    Height = 336
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 541
        Height = 305
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        ParentColor = True
        TabOrder = 0
        object ProgramIcon: TImage
          Left = 8
          Top = 8
          Width = 49
          Height = 49
          Picture.Data = {
            055449636F6E0000010001002020100000000000E80200001600000028000000
            2000000040000000010004000000000080020000000000000000000000000000
            0000000000000000000080000080000000808000800000008000800080800000
            80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
            FFFFFF00099999900000AAAAAA0000000000000099999999000AAAAAAAA00000
            00000AAA99999999000AAAAAAAA00000000AAAAA99999999000AAAAAAAA00000
            00AAAAAA99999999000AAAAAAAA000000AAAAAAA99999999000AAAAAAAA00000
            0AAAAAAA99999999000AAAAAAAA00000AAAAAAAA99999999000AAAAAAAA0000A
            AAAAAAAA99999999000AAAAAAAA0000AAAAAAAAA99999999000AAAAAAAA000AA
            AAAAAAAA99999999000AAAAAAAA00AAAAAAAAAA099999999000AAAAAAAAAAAAA
            AAAAAAA099999999000AAAAAAAAAAAAAAAAAAA0099999999000AAAAAAAAAAAAA
            AAAAA00099999999000AAAAAAAAAAAAAAAAA000099999999000AAAAAAAAAAAAA
            AAA0000099999999000AAAAAAAAAAAAAAA00000099999999000AAAAAAAAAAAAA
            AAA0000099999999000AAAAAAAAAAAAAAAAAA00099999999000AAAAAAAAAAAAA
            AAAAAA0099999999000AAAAAAAAAAAAAAAAAAAAA99999999000AAAAAAAAAAAAA
            AAAAAAAA99999999000AAAAAAAA00AAAAAAAAAAA99999999000AAAAAAAA000AA
            AAAAAAAA99999999000AAAAAAAA0000AAAAAAAAA99999999000AAAAAAAA99999
            9AAAAAAA99999999999AAAAAAAA99999999AAAAA99999999999AAAAAAAA99999
            9999AAAA99999999999AAAAAAAA9999999999AAA99999999999AAAAAAAA99999
            9999990A99999999999AAAAAAAA999999999900099999999999AAAAAAAA99999
            9999900081F03FFF00E01FF800E01FE000E01FC000E01F8000E01F8000E01F00
            00E01E0000E01E0000E01C0000E0180100E0000100E0000300E0000700E0000F
            00E0001F00E0003F00E0001F00E0000700E0000300E0000000E0000000E01800
            00E01C0000E01E0000E000000000000000000000000000000000000200000007
            00000007}
          Stretch = True
          IsControl = True
        end
        object ProductName: TLabel
          Left = 88
          Top = 16
          Width = 227
          Height = 24
          Caption = #1057#1080#1089#1090#1077#1084#1072' "'#1043#1086#1083#1086#1074#1085#1072' '#1082#1085#1080#1075#1072'"'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          IsControl = True
        end
        object Label1: TLabel
          Left = 16
          Top = 80
          Width = 54
          Height = 16
          Caption = #1042#1077#1088#1089#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 16
          Top = 120
          Width = 209
          Height = 145
          AutoSize = False
          Caption = 
            #1056#1086#1079#1088#1086#1073#1085#1080#1082#1080#13#10#13#10#1053#1086#1074#1110#1082#1086#1074' '#1044'.'#1043'.'#13#10#1057#1084#1086#1082#1090#1110#1081' '#1050'.'#1042#13#10#1052#1080#1095#1082#1110#1074#1089#1082#1080#1081' '#1057'.'#1052'.'#13#10#1050#1080#1088#1080#1083#1080 +
            #1096#1077#1085' '#1071'.'#1042'                                                         ' +
            '                                              '#1054#1089#1086#1073#1072' '#1087#1086#1076#1103#1082#1072'      ' +
            '                 HyperSoft, '#1030#1075#1086#1088' '#1064#1077#1074#1095#1077#1085#1082#1086
          WordWrap = True
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1065#1086' '#1085#1086#1074#1086#1075#1086'?'
      ImageIndex = 1
      object cxMemo1: TcxMemo
        Left = 0
        Top = 0
        Width = 541
        Height = 305
        Align = alClient
        Properties.ReadOnly = True
        Properties.ScrollBars = ssBoth
        Style.Color = clInfoBk
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 336
    Width = 549
    Height = 41
    Align = alBottom
    TabOrder = 1
    object OKButton: TButton
      Left = 454
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = OKButtonClick
    end
  end
end
