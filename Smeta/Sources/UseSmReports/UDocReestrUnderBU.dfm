object frmDocReestr: TfrmDocReestr
  Left = 325
  Top = 198
  BorderStyle = bsDialog
  Caption = #1050#1088#1080#1090#1077#1088#1110#1111' '#1074#1080#1073#1086#1088#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074' '#1087#1110#1076' '#1082#1086#1096#1090#1086#1088#1080#1089#1110#1074
  ClientHeight = 271
  ClientWidth = 575
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
    Top = 230
    Width = 575
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 488
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton3: TcxButton
      Left = 408
      Top = 8
      Width = 75
      Height = 25
      Caption = #1044#1088#1091#1082
      TabOrder = 1
      OnClick = cxButton3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 575
    Height = 230
    Align = alClient
    TabOrder = 1
    object Label3: TLabel
      Left = 32
      Top = 16
      Width = 101
      Height = 13
      Caption = #1042#1080#1073#1088#1072#1085#1080#1081' '#1082#1086#1096#1090#1086#1088#1080#1089
    end
    object Label4: TLabel
      Left = 55
      Top = 41
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1050#1086#1096#1090#1086#1088#1080#1089
    end
    object Label5: TLabel
      Left = 55
      Top = 65
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1056#1086#1079#1076#1110#1083
    end
    object Label6: TLabel
      Left = 55
      Top = 89
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1057#1090#1072#1090#1090#1103
    end
    object GroupBox1: TGroupBox
      Left = 19
      Top = 113
      Width = 307
      Height = 105
      Caption = #1055#1077#1088#1110#1086#1076' '#1076#1083#1103' '#1074#1080#1073#1086#1088#1091
      TabOrder = 0
      object Label1: TLabel
        Left = 5
        Top = 32
        Width = 49
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1055#1086#1095#1072#1090#1086#1082
      end
      object Label2: TLabel
        Left = 13
        Top = 64
        Width = 41
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1050#1110#1085#1077#1094#1100
      end
    end
    object GroupBox2: TGroupBox
      Left = 328
      Top = 113
      Width = 220
      Height = 105
      Caption = #1058#1080#1087' '#1074#1080#1082#1086#1085#1072#1085#1085#1103
      TabOrder = 1
      object cxCheckBox1: TcxCheckBox
        Left = 40
        Top = 56
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1060#1110#1085#1072#1085#1089#1086#1074#1080#1081' '#1086#1073#1083#1110#1082
        State = cbsChecked
        TabOrder = 0
      end
      object cxCheckBox2: TcxCheckBox
        Left = 40
        Top = 24
        Width = 169
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1059#1087#1088#1072#1074#1083#1110#1085#1089#1100#1082#1080#1081' '#1086#1073#1083#1110#1082
        State = cbsChecked
        TabOrder = 1
      end
    end
    object edSm: TcxTextEdit
      Left = 148
      Top = 38
      Width = 401
      Height = 21
      TabStop = False
      Properties.AutoSelect = False
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = clMenu
      TabOrder = 2
    end
    object edRz: TcxTextEdit
      Left = 148
      Top = 62
      Width = 401
      Height = 21
      TabStop = False
      Properties.AutoSelect = False
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = clMenu
      TabOrder = 3
      Text = #1055#1086' '#1074#1089#1110#1084' '#1088#1086#1079#1076#1110#1083#1072#1084
    end
    object edSt: TcxTextEdit
      Left = 148
      Top = 85
      Width = 401
      Height = 21
      TabStop = False
      Properties.AutoSelect = False
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = clMenu
      TabOrder = 4
      Text = #1055#1086' '#1074#1089#1110#1084' '#1089#1090#1072#1090#1090#1103#1084
    end
    object cbMonthBeg: TComboBox
      Left = 78
      Top = 142
      Width = 130
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 5
      OnChange = cbMonthBegChange
    end
    object cbYearBeg: TComboBox
      Left = 208
      Top = 142
      Width = 88
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 6
      OnChange = cbYearBegChange
    end
    object cbMonthEnd: TComboBox
      Left = 78
      Top = 174
      Width = 130
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 7
    end
    object cbYearEnd: TComboBox
      Left = 208
      Top = 174
      Width = 88
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 8
    end
  end
end
