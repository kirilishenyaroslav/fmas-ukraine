object frmGetDbfPath: TfrmGetDbfPath
  Left = 341
  Top = 216
  Width = 468
  Height = 238
  Caption = #1030#1084#1087#1086#1088#1090' '#1076#1072#1085#1080#1093' '#1087#1086' '#1087#1088#1086#1074#1086#1082#1072#1093
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 170
    Width = 460
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 460
    Height = 170
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 42
      Top = 84
      Width = 318
      Height = 16
      Caption = #1060#1072#1081#1083' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1087#1088#1086#1074#1086#1076#1082#1072#1084' '#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1093
    end
    object EdAllDocDBF: TcxButtonEdit
      Left = 40
      Top = 40
      Width = 393
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = EdAllDocDBFPropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object EdAllProvDBF: TcxButtonEdit
      Left = 40
      Top = 104
      Width = 393
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = EdAllProvDBFPropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object cxCheckBox1: TcxCheckBox
      Left = 38
      Top = 14
      Width = 352
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox1PropertiesChange
      Properties.Caption = #1060#1072#1081#1083' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1096#1072#1087#1082#1072#1084' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074
      State = cbsChecked
      TabOrder = 2
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 240
    Top = 8
  end
end
