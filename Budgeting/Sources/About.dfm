object AboutBox: TAboutBox
  Left = 313
  Top = 161
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
            FFFFFF000000999900000AAAAAAAAAAAAAAAA0000099999999000AAAAAAAAAAA
            AAAAAA00009999999990AAAAAAAAAAAAAAAAAAA0099999999999AAAAAAAAAAAA
            AAAAAAA0099999999999AAAAAAAAAAAAAAAAAAAA009999999999AAAAAAAAAAAA
            AAAAAAAA009999999999AAAAAAAAAAAAAAAAAAAA000099999999AAAAAAAA0000
            AAAAAAAA000009999999AAAAAAAA0000AAAAAAAA000000999999AAAAAAAAA00A
            AAAAAAAA000000999999AAAAAAAAAAAAAAAAAAAA0000000999999AAAAAAAAAAA
            AAAAAAA00000000999999AAAAAAAAAAAAAAAAAA00000099999999AAAAAAAAAAA
            AAAAAA000009999999999AAAAAAAAAAAAAAAAA000099999999999AAAAAAAAAAA
            AAAAA0000999999999999AAAAAAAAAAAAAAA00000999999999999AAAAAAAAAAA
            AA0000009999999999999AAAAAAAA000000000009999999999999AAAAAAAA000
            000000009999999999999AAAAAAAAA00000000009999999909999AAAAAAAAA00
            0000000099999990009999AAAAAAAA000000000099999990009999AAAAAAAA00
            0000000099999900009999AAAAAAAAA00000000099999900009999AAAAAAAAAA
            AAAAAA00999999000009999AAAAAAAAAAAAAAAAA999999000009999AAAAAAAAA
            AAAAAAAA999990000009999AAAAAAAAAAAAAAAAA999990000009999AAAAAAAAA
            AAAAAAAA999990000009999AAAAAAAAAAAAAAAAA999990000009999AAAAAAAAA
            AAAAAAAAF0F80007C0380003C01000018000000180000000C0000000C0000000
            F0000F00F8000F00FC000600FC000000FE000001FE000001F8000003E0000003
            C00000078000000F8000003F000007FF000007FF000003FF008003FF01C003FF
            01C003FF03C001FF03C0000303E0000003E0000007E0000007E0000007E00000
            07E00000}
          Stretch = True
          IsControl = True
        end
        object ProductName: TLabel
          Left = 88
          Top = 16
          Width = 309
          Height = 24
          Caption = #1057#1080#1089#1090#1077#1084#1072' "'#1059#1087#1088#1072#1074#1083#1110#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1072#1084#1080'"'
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
          Width = 47
          Height = 16
          Caption = #1042#1077#1088#1089#1080#1103
        end
        object Label2: TLabel
          Left = 16
          Top = 120
          Width = 209
          Height = 97
          AutoSize = False
          Caption = 
            #1056#1086#1079#1088#1086#1073#1085#1080#1082#1080#13#10#13#10#1053#1086#1074#1110#1082#1086#1074' '#1044'.'#1043'.'#13#10#1057#1084#1086#1082#1090#1110#1081' '#1050'.'#1042#13#10#1052#1080#1095#1082#1110#1074#1089#1082#1080#1081' '#1057'.'#1052'.'#13#10#1050#1080#1088#1080#1083#1080 +
            #1096#1077#1085' '#1071'.'#1042
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
