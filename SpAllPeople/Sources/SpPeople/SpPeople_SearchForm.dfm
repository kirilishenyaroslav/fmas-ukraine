object fSearch: TfSearch
  Left = 213
  Top = 103
  BorderStyle = bsDialog
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1092#1110#1079#1080#1095#1085#1080#1093' '#1086#1089#1110#1073
  ClientHeight = 82
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object InfoPanel: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 43
    Align = alClient
    Caption = 'InfoPanel'
    Enabled = False
    TabOrder = 0
    object InfoMemo: TcxMemo
      Left = 1
      Top = 1
      Width = 590
      Height = 41
      Align = alClient
      Lines.Strings = (
        #1042#1074#1077#1076#1110#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1080' '#1087#1086#1096#1091#1082#1091' '#1086#1089#1086#1073#1080' '#1079#1072' '#1092#1072#1084#1110#1083#1110#1108#1102', '
        #1110#1084#39#1103#1084' '#1090#1072' '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110' '#1072#1073#1086' '#1090#1072#1073#1077#1083#1100#1085#1080#1084' '#1085#1086#1084#1077#1088#1086#1084)
      ParentFont = False
      Properties.Alignment = taCenter
      Properties.AutoSelect = True
      Properties.ReadOnly = True
      Style.Color = clActiveBorder
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TransparentBorder = True
      TabOrder = 0
    end
  end
  object SearchPanel: TPanel
    Left = 0
    Top = 43
    Width = 592
    Height = 39
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 60
      Height = 13
      Caption = #1055#1030#1041' '#1072#1073#1086' '#1058#1053':'
    end
    object SearchTE: TcxTextEdit
      Left = 80
      Top = 8
      Width = 425
      Height = 21
      Properties.Alignment.Vert = taVCenter
      Properties.AutoSelect = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 28
      TabOrder = 0
      OnKeyDown = SearchTEKeyDown
    end
    object SearchBtn: TcxButton
      Left = 510
      Top = 6
      Width = 75
      Height = 25
      Caption = #1064#1091#1082#1072#1090#1080
      TabOrder = 1
      OnClick = SearchBtnClick
    end
  end
end
