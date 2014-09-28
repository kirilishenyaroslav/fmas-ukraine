object frmMatrixEdit: TfrmMatrixEdit
  Left = 294
  Top = 216
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1082#1086#1088#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1080#1080
  ClientHeight = 327
  ClientWidth = 508
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 286
    Width = 508
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 344
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 424
      Top = 8
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 508
    Height = 286
    Align = alClient
    TabOrder = 1
    object Bevel1: TBevel
      Left = 16
      Top = 16
      Width = 481
      Height = 257
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 24
      Width = 465
      Height = 65
      Caption = #1050#1088#1077#1076#1080#1090
      TabOrder = 0
      object Label1: TLabel
        Left = 51
        Top = 19
        Width = 65
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072
      end
      object Label2: TLabel
        Left = 40
        Top = 43
        Width = 76
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end
      object EdKrSchNum: TcxTextEdit
        Left = 120
        Top = 16
        Width = 145
        Height = 21
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        TabOrder = 0
      end
      object EdKrSchTitle: TcxTextEdit
        Left = 120
        Top = 40
        Width = 209
        Height = 21
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 24
      Top = 91
      Width = 465
      Height = 65
      Caption = #1044#1077#1073#1077#1090
      TabOrder = 1
      object Label3: TLabel
        Left = 51
        Top = 19
        Width = 65
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072
      end
      object Label4: TLabel
        Left = 40
        Top = 43
        Width = 76
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end
      object EdDBSchNum: TcxTextEdit
        Left = 120
        Top = 16
        Width = 145
        Height = 21
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        TabOrder = 0
      end
      object EdDBSchTitle: TcxTextEdit
        Left = 120
        Top = 40
        Width = 209
        Height = 21
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        TabOrder = 1
      end
    end
    object EdCrProv: TRadioGroup
      Left = 247
      Top = 160
      Width = 242
      Height = 105
      Caption = #1055#1088#1086#1074#1086#1076#1082#1072' '#1089#1086#1079#1076#1072#1077#1090#1089#1103' '
      Ctl3D = False
      ItemIndex = 0
      Items.Strings = (
        #1082#1088#1077#1076#1080#1090#1086#1074#1086#1081' '#1095#1072#1089#1090#1100#1102
        #1076#1077#1073#1077#1090#1086#1074#1086#1081' '#1095#1072#1089#1090#1100#1102)
      ParentCtl3D = False
      TabOrder = 2
    end
    object GroupBox3: TGroupBox
      Left = 24
      Top = 160
      Width = 217
      Height = 105
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1086#1079#1076#1072#1077#1090#1089#1103
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 217
        Height = 105
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1086#1079#1076#1072#1077#1090#1089#1103
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object cxCheckBox1: TcxCheckBox
          Left = 24
          Top = 20
          Width = 121
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1057#1086#1079#1076#1072#1077#1090' '#1076#1086#1082#1091#1084#1077#1085#1090
          TabOrder = 0
        end
        object GroupBox5: TGroupBox
          Left = 0
          Top = 0
          Width = 217
          Height = 105
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1086#1079#1076#1072#1077#1090#1089#1103
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          object EdDbcrdoc: TcxCheckBox
            Left = 24
            Top = 60
            Width = 121
            Height = 21
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1076#1077#1073#1077#1090#1086#1074#1086#1081' '#1095#1072#1089#1090#1100#1102
            TabOrder = 0
          end
          object edkrcrdoc: TcxCheckBox
            Left = 24
            Top = 20
            Width = 153
            Height = 21
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1082#1088#1077#1076#1080#1090#1086#1074#1086#1081' '#1095#1072#1089#1090#1100#1102' '
            TabOrder = 1
          end
        end
      end
    end
  end
end
