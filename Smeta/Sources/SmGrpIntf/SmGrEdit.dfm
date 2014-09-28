object frmGrSmEdit: TfrmGrSmEdit
  Left = 417
  Top = 238
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1075#1088#1091#1087#1110' '#1073#1102#1076#1078#1077#1090#1110#1074
  ClientHeight = 240
  ClientWidth = 493
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
    Top = 0
    Width = 493
    Height = 199
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 117
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1050#1086#1076
    end
    object Label2: TLabel
      Left = 8
      Top = 44
      Width = 117
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
    end
    object Label3: TLabel
      Left = 8
      Top = 112
      Width = 177
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1050#1045#1050#1042' '#1079#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
    end
    object edSmGrKod: TcxTextEdit
      Left = 128
      Top = 8
      Width = 161
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object edSmGrTitle: TcxTextEdit
      Left = 128
      Top = 41
      Width = 337
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object edSmGrEnable: TcxCheckBox
      Left = 128
      Top = 76
      Width = 121
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1040#1082#1090#1080#1074#1085#1110#1089#1090#1100
      State = cbsChecked
      TabOrder = 2
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 128
      Top = 140
      Width = 337
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 199
    Width = 493
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 408
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
end
