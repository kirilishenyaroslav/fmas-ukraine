object frmSmGrFonds: TfrmSmGrFonds
  Left = 295
  Top = 214
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1110#1079' '#1092#1086#1085#1076#1072#1084#1080' '#1087#1110#1076' '#1075#1088#1091#1087#1086#1102' '#1082#1086#1096#1090#1086#1088#1080#1089#1110#1074
  ClientHeight = 418
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 377
    Width = 490
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 408
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 1
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 490
    Height = 377
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 41
      Width = 129
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091
    end
    object Label3: TLabel
      Left = 16
      Top = 113
      Width = 185
      Height = 40
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1056#1072#1093#1091#1085#1086#1082', '#1085#1072' '#1103#1082#1086#1084#1091' '#1072#1082#1091#1084#1091#1083#1102#1102#1090#1100#1089#1103' '#1076#1086#1093#1086#1076#1080
      WordWrap = True
    end
    object Label2: TLabel
      Left = 16
      Top = 163
      Width = 185
      Height = 40
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1056#1072#1093#1091#1085#1086#1082', '#1085#1072' '#1103#1082#1086#1084#1091' '#1072#1082#1091#1084#1091#1083#1102#1102#1090#1100#1089#1103' '#1074#1080#1076#1072#1090#1082#1080
      WordWrap = True
    end
    object Label4: TLabel
      Left = 16
      Top = 213
      Width = 185
      Height = 68
      Alignment = taRightJustify
      AutoSize = False
      Caption = 
        #1056#1072#1093#1091#1085#1086#1082', '#1085#1072' '#1103#1082#1086#1084#1091' '#1072#1082#1091#1084#1091#1083#1102#1102#1090#1100#1089#1103' '#1074#1080#1076#1072#1090#1082#1080' '#1079' '#1074#1080#1087#1083#1072#1090' '#1087#1086' '#1090#1080#1084#1095#1072#1089#1086#1074#1110#1081' '#1085#1077 +
        #1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1086#1089#1090#1110' '
      WordWrap = True
    end
    object Label5: TLabel
      Left = 16
      Top = 285
      Width = 185
      Height = 84
      Alignment = taRightJustify
      AutoSize = False
      Caption = 
        #1056#1072#1093#1091#1085#1086#1082', '#1085#1072' '#1103#1082#1086#1084#1091' '#1072#1082#1091#1084#1091#1083#1102#1102#1090#1100#1089#1103' '#1074#1080#1076#1072#1090#1082#1080' '#1079' '#1074#1080#1087#1083#1072#1090' '#1087#1086' '#1090#1080#1084#1095#1072#1089#1086#1074#1110#1081' '#1085#1077 +
        #1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1086#1089#1090#1110'  '#1074#1110#1076' '#1085#1077#1089#1095#1072#1089#1085#1080#1093' '#1074#1080#1087#1072#1076#1082#1110#1074
      WordWrap = True
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 208
      Top = 119
      Width = 255
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.BorderStyle = ebs3D
      Style.Color = clInfoBk
      TabOrder = 5
    end
    object cxButtonEdit2: TcxButtonEdit
      Left = 208
      Top = 167
      Width = 257
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
      Style.BorderStyle = ebs3D
      Style.Color = clInfoBk
      TabOrder = 6
    end
    object cbMonthEnd: TComboBox
      Left = 168
      Top = 68
      Width = 206
      Height = 22
      Style = csOwnerDrawFixed
      Color = clMenu
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
    object cbMonthBeg: TComboBox
      Left = 168
      Top = 38
      Width = 206
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object cbYearBeg: TComboBox
      Left = 376
      Top = 38
      Width = 88
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object cbYearEnd: TComboBox
      Left = 376
      Top = 68
      Width = 88
      Height = 22
      Style = csOwnerDrawFixed
      Color = clMenu
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 69
      Width = 145
      Height = 17
      Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object cxButtonEdit3: TcxButtonEdit
      Left = 208
      Top = 215
      Width = 255
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit3PropertiesButtonClick
      Style.BorderStyle = ebs3D
      Style.Color = clInfoBk
      TabOrder = 7
    end
    object cxButtonEdit4: TcxButtonEdit
      Left = 208
      Top = 287
      Width = 255
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit4PropertiesButtonClick
      Style.BorderStyle = ebs3D
      Style.Color = clInfoBk
      TabOrder = 8
    end
  end
end
