object frmEditEnumItem: TfrmEditEnumItem
  Left = 299
  Top = 184
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1077#1083#1077#1084#1077#1085#1090#1072#1084#1080' '#1072#1085#1072#1083#1110#1090#1080#1082#1080
  ClientHeight = 153
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 112
    Width = 446
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 280
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 360
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
    Width = 446
    Height = 112
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 72
      Top = 24
      Width = 137
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1050#1086#1076' '#1101#1083#1077#1084#1077#1085#1090#1072
    end
    object cxTextEdit1: TcxTextEdit
      Left = 216
      Top = 21
      Width = 210
      Height = 21
      TabOrder = 0
      Text = 'cxTextEdit1'
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 444
      Height = 110
      Align = alClient
      TabOrder = 1
      object Label2: TLabel
        Left = 72
        Top = 38
        Width = 137
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1050#1086#1076' '#1077#1083#1077#1084#1077#1085#1090#1091
      end
      object Label3: TLabel
        Left = 72
        Top = 78
        Width = 137
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1077#1083#1077#1084#1077#1085#1090#1091
      end
      object Label4: TLabel
        Left = 48
        Top = 8
        Width = 177
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1056#1086#1073#1086#1090#1072' '#1089' '#1077#1083#1077#1084#1077#1085#1090#1072#1084#1080' '#1072#1085#1072#1083#1110#1090#1080#1082#1080
      end
      object Label5: TLabel
        Left = 216
        Top = 40
        Width = 209
        Height = 13
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object cxTextEdit2: TcxTextEdit
        Left = 216
        Top = 35
        Width = 210
        Height = 21
        Properties.MaxLength = 199
        Style.Color = clInfoBk
        TabOrder = 0
      end
      object cxTextEdit3: TcxTextEdit
        Left = 216
        Top = 75
        Width = 209
        Height = 21
        Properties.MaxLength = 199
        Style.Color = clInfoBk
        TabOrder = 1
      end
    end
  end
end
