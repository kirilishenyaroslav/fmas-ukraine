object frmMfoRsch_edit: TfrmMfoRsch_edit
  Left = 631
  Top = 345
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1085#1085#1103
  ClientHeight = 671
  ClientWidth = 515
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 515
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label8: TLabel
      Left = 8
      Top = 8
      Width = 36
      Height = 13
      Caption = #1052#1060#1054':'
      FocusControl = cxButton1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 24
      Width = 66
      Height = 13
      Caption = #1056'/'#1088#1072#1093#1091#1085#1086#1082' '
      FocusControl = cxButton1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 8
      Top = 40
      Width = 144
      Height = 13
      Caption = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099':'
      FocusControl = cxButton1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1_rsch: TLabel
      Left = 160
      Top = 24
      Width = 58
      Height = 13
      Caption = 'Label1_rsch'
    end
    object Label1_mfo: TLabel
      Left = 160
      Top = 8
      Width = 55
      Height = 13
      Caption = 'Label1_mfo'
    end
    object Label1_name_bank: TLabel
      Left = 160
      Top = 40
      Width = 94
      Height = 13
      Caption = 'Label1_name_bank'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 630
    Width = 515
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 288
      Top = 8
      Width = 99
      Height = 25
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      Default = True
      TabOrder = 0
      OnClick = cxButton1Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E0000000100000000000000000000FFFF
        FF0000FF000000840000C8D0D40084848400FFFFFF0000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000040404040404
        0404040404040404040404040404040404040404040404040404040404040404
        0404040404040404040404040404040400040404040404040404040404040400
        0300040404040404040404040404000302030004040404040404040404000202
        0202030004040404040404040002020505020203000404040404040405020504
        0405020203000404040404040405040404040502020300040404040404040404
        0404040502020300040404040404040404040404050202000404040404040404
        0404040404050200040404040404040404040404040405040404040404040404
        0404040404040404040404040404040404040404040404040404}
      UseSystemPaint = False
    end
    object cxButton2: TcxButton
      Left = 400
      Top = 8
      Width = 107
      Height = 25
      Cancel = True
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 1
      OnClick = cxButton2Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E0000000100000000000000000000FFFF
        FF00C8D0D4000000FF0000008400848484000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020404050202020202020404020202020204040405
        0202020204040502020202020204040405020204040402020202020202020404
        0405040404020202020202020202020404040404020202020202020202020202
        0403040502020202020202020202020404040404050202020202020202020404
        0402040404050202020202020204040402020204040405020202020204040402
        0202020204040402020202020404020202020202020404020202020202020202
        0202020202020202020202020202020202020202020202020202}
      UseSystemPaint = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 57
    Width = 515
    Height = 412
    Align = alClient
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ParentColor = False
    TabOrder = 2
    DesignSize = (
      515
      412)
    object Label1: TLabel
      Left = 40
      Top = 8
      Width = 307
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      Caption = 
        #1055#1088#1080#1079#1085#1072#1082' '#1085#1072#1083#1080#1095#1080#1103' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1075#1086' '#1080#1084#1087#1086#1088#1090#1072' ('#1079#1072#1073#1086#1088#1072') '#1076#1072#1085#1099#1093' '#13#10#1080#1079' '#1074#1085#1077#1096 +
        #1085#1080#1093' '#1087#1086#1076#1089#1080#1089#1090#1077#1084' '#1050#1083#1080#1077#1085#1090'-'#1073#1072#1085#1082
    end
    object Label2: TLabel
      Left = 40
      Top = 38
      Width = 326
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = #1055#1088#1080#1079#1085#1072#1082' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1088#1077#1077#1089#1090#1088#1072' '#1087#1086' '#1076#1072#1085#1085#1099#1084' '#1073#1072#1085#1082#1086#1074#1089#1082#1080#1084' '#1088#1077#1082#1074#1080#1079#1080#1090#1072#1084
    end
    object Label3: TLabel
      Left = 40
      Top = 61
      Width = 198
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = #1055#1088#1080#1079#1085#1072#1082', '#1095#1090#1086' '#1088#1077#1082#1074#1080#1079#1080#1090#1099' '#1082#1072#1079#1085#1072#1095#1077#1081#1089#1082#1080#1077
    end
    object Label4: TLabel
      Left = 40
      Top = 85
      Width = 280
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1076#1086#1073#1072#1074#1083#1103#1090#1100' '#1054#1050#1055#1054' '#1074' '#1086#1089#1085#1086#1074#1072#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072
    end
    object Label5: TLabel
      Left = 40
      Top = 107
      Width = 274
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1076#1086#1073#1072#1074#1083#1103#1090#1100' '#1085#1086#1084#1077#1088#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1086#1075#1086' '
    end
    object Label6: TLabel
      Left = 40
      Top = 131
      Width = 291
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1076#1086#1073#1072#1074#1083#1103#1090#1100' '#1050#1045#1050#1042#1099' '#1074' '#1086#1089#1085#1086#1074#1072#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072', '
    end
    object Label7: TLabel
      Left = 40
      Top = 155
      Width = 242
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1088#1077#1082#1074#1080#1079#1080#1090#1099' '#1085#1072' '#1074#1099#1073#1086#1088#1077' '#1074' '#1087#1083#1072#1090#1077#1078#1082#1072#1093
    end
    object Label15: TLabel
      Left = 8
      Top = 333
      Width = 77
      Height = 13
      Caption = #1053#1072#1079#1074#1072' '#1088#1072#1093#1091#1085#1082#1091':'
    end
    object Label16: TLabel
      Left = 40
      Top = 179
      Width = 141
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1085#1086' '#1076#1086#1076#1072#1074#1072#1090#1080' '#1050#1055#1050
    end
    object Label17: TLabel
      Left = 40
      Top = 203
      Width = 267
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1085#1086' '#1076#1086#1076#1072#1074#1072#1090#1080' "'#1089#1087#1083'.'#1087#1086#1074'." '#1082' '#1087#1110#1076#1089#1090#1072#1074#1110' '#1087#1083#1072#1090#1077#1078#1091
    end
    object Label18: TLabel
      Left = 40
      Top = 227
      Width = 263
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1076#1086#1073#1072#1074#1083#1103#1090#1100' '#1050#1055#1050' '#1074' '#1085#1072#1095#1072#1083#1086' '#1086#1089#1085#1086#1074#1072#1085#1080#1103
    end
    object Label19: TLabel
      Left = 40
      Top = 251
      Width = 269
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1076#1086#1073#1072#1074#1083#1103#1090#1100' '#1050#1069#1050#1042' '#1074' '#1085#1072#1095#1072#1083#1086' '#1086#1089#1085#1086#1074#1072#1085#1080#1103
    end
    object Label20: TLabel
      Left = 40
      Top = 275
      Width = 211
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = #1056#1072#1093#1091#1085#1086#1082' '#1097#1086#1076#1086' '#1086#1073#1083#1110#1082#1091' '#1055#1044#1042' '#1076#1086#1093#1086#1076#1110#1074' '#1086#1088#1077#1085#1076#1080
    end
    object Label21: TLabel
      Left = 40
      Top = 299
      Width = 423
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = 
        #1040#1074#1090#1086#1084#1072#1090#1080#1095#1085#1086' '#1076#1086#1076#1072#1074#1072#1090#1080' '#1089#1091#1084#1091' '#1087#1110#1089#1083#1103' '#1050#1045#1050#1042', '#1091' '#1088#1072#1079#1110' '#1079#1076#1110#1081#1089#1085#1077#1085#1085#1103' '#1074#1080#1076#1072#1090#1082#1110#1074 +
        ' '#1079#1072' '#1086#1076#1085#1080#1084' '#1050#1045#1050#1042
    end
    object Label22: TLabel
      Left = 8
      Top = 357
      Width = 74
      Height = 13
      Caption = #1050#1086#1076' '#1087#1088#1086#1075#1088#1072#1084#1080':'
    end
    object Label23: TLabel
      Left = 8
      Top = 381
      Width = 95
      Height = 13
      Caption = #1050#1086#1076' '#1082#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072':'
    end
    object cxCheckBox1: TcxCheckBox
      Left = 8
      Top = 8
      Width = 25
      Height = 21
      ParentColor = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = ''
      Style.Color = clBtnFace
      TabOrder = 0
    end
    object cxCheckBox2: TcxCheckBox
      Left = 8
      Top = 32
      Width = 25
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = ''
      TabOrder = 1
    end
    object cxCheckBox3: TcxCheckBox
      Left = 8
      Top = 56
      Width = 25
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = ''
      TabOrder = 2
    end
    object cxCheckBox4: TcxCheckBox
      Left = 8
      Top = 80
      Width = 25
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = ''
      TabOrder = 3
    end
    object cxCheckBox5: TcxCheckBox
      Left = 8
      Top = 104
      Width = 25
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = ''
      TabOrder = 4
    end
    object cxCheckBox6: TcxCheckBox
      Left = 8
      Top = 128
      Width = 25
      Height = 21
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = ''
      TabOrder = 5
    end
    object cxCheckBox7: TcxCheckBox
      Left = 8
      Top = 152
      Width = 25
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = ''
      TabOrder = 6
    end
    object cxTextEdit_name_rsch: TcxTextEdit
      Left = 112
      Top = 328
      Width = 392
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Style.Color = clMoneyGreen
      TabOrder = 7
    end
    object cbKPK: TcxCheckBox
      Left = 8
      Top = 176
      Width = 25
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = ''
      TabOrder = 8
    end
    object cbSPPOV: TcxCheckBox
      Left = 8
      Top = 200
      Width = 25
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = ''
      TabOrder = 9
    end
    object KPKVFirst: TcxCheckBox
      Left = 8
      Top = 224
      Width = 25
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = ''
      TabOrder = 10
    end
    object KEKV_First: TcxCheckBox
      Left = 8
      Top = 248
      Width = 25
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = ''
      TabOrder = 11
    end
    object ArndNDS: TcxCheckBox
      Left = 8
      Top = 272
      Width = 25
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = ''
      TabOrder = 12
    end
    object cxCheckBoxSum: TcxCheckBox
      Left = 8
      Top = 296
      Width = 25
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = ''
      TabOrder = 13
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 112
      Top = 352
      Width = 392
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 14
    end
    object cxButtonEdit2: TcxButtonEdit
      Left = 112
      Top = 376
      Width = 392
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 15
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 565
    Width = 515
    Height = 65
    Align = alBottom
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    DesignSize = (
      515
      65)
    object Label11: TLabel
      Left = 9
      Top = 14
      Width = 302
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1087#1083#1072#1090#1077#1078#1077#1081', '#1089#1076#1077#1083#1072#1085#1085#1099#1081' '#1074' '#1101#1090#1086#1090' '#1076#1077#1085#1100' '#1087#1086' '#1101#1090#1086#1084#1091' '#1087#1083#1072#1090#1077#1078#1091
    end
    object Label12: TLabel
      Left = 9
      Top = 39
      Width = 273
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1079#1072#1103#1074#1083#1077#1085#1085#1099#1093' '#1082' '#1086#1087#1083#1072#1090#1077' '#1079#1072#1103#1074#1086#1082' '#1087#1086' '#1101#1090#1086#1084#1091' '#1088'/'#1089#1095#1077#1090#1091
    end
    object CurrencyEdit_sum_pay: TCurrencyEdit
      Left = 328
      Top = 12
      Width = 168
      Height = 21
      AutoSize = False
      Color = clMoneyGreen
      DisplayFormat = ',0.00'#39'.'#39';-,0.00'#39'.'#39
      Enabled = False
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object CurrencyEdit_sum_case: TCurrencyEdit
      Left = 328
      Top = 36
      Width = 168
      Height = 21
      AutoSize = False
      Color = clMoneyGreen
      DisplayFormat = ',0.00'#39'.'#39';-,0.00'#39'.'#39
      Enabled = False
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 469
    Width = 515
    Height = 96
    Align = alBottom
    Anchors = [akLeft, akTop, akRight]
    Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1073#1091#1092#1077#1088#1072#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    DesignSize = (
      515
      96)
    object Label13: TLabel
      Left = 8
      Top = 57
      Width = 62
      Height = 13
      Caption = #1050#1086#1084#1077#1085#1090#1072#1088#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 8
      Top = 15
      Width = 90
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1073#1091#1092#1077#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object cxTextEdit_comment: TcxTextEdit
      Left = 8
      Top = 72
      Width = 496
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
    end
    object DBLookupComboBox: TDBLookupComboBox
      Left = 8
      Top = 32
      Width = 495
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clMoneyGreen
      DropDownRows = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'id_bank_buff'
      ListField = 'comment'
      ListSource = DataSource
      ParentFont = False
      TabOrder = 1
      OnClick = DBLookupComboBoxClick
      OnContextPopup = DBLookupComboBoxContextPopup
    end
  end
  object pFIBDataSet_edit: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from dog_native_rate_acc(:d_id_rate_acc)')
    Left = 344
    Top = 145
    poSQLINT64ToBCD = True
  end
  object pFIBStoredProc_edit: TpFIBStoredProc
    Left = 352
    Top = 113
  end
  object DataSource: TDataSource
    DataSet = pFIBDataSet_buff
    Left = 392
    Top = 136
  end
  object pFIBDataSet_buff: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from dog_dt_bankbuff')
    Left = 352
    Top = 184
    poSQLINT64ToBCD = True
  end
end
