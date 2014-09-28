object frmEditTemplate: TfrmEditTemplate
  Left = 309
  Top = 199
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1096#1072#1073#1083#1086#1085#1091
  ClientHeight = 386
  ClientWidth = 517
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
    Top = 0
    Width = 517
    Height = 345
    Align = alClient
    TabOrder = 0
    object Bevel1: TBevel
      Left = 24
      Top = 90
      Width = 209
      Height = 241
    end
    object Bevel2: TBevel
      Left = 280
      Top = 90
      Width = 209
      Height = 241
    end
    object Label1: TLabel
      Left = 80
      Top = 74
      Width = 116
      Height = 13
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1082#1088#1077#1076#1080#1090#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 328
      Top = 74
      Width = 109
      Height = 13
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1076#1077#1073#1077#1090#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 40
      Top = 98
      Width = 47
      Height = 13
      Caption = #1041#1102#1076#1078#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 40
      Top = 170
      Width = 40
      Height = 13
      Caption = #1056#1086#1079#1076#1110#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 40
      Top = 242
      Width = 41
      Height = 13
      Caption = #1057#1090#1072#1090#1090#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 296
      Top = 98
      Width = 47
      Height = 13
      Caption = #1041#1102#1076#1078#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 296
      Top = 170
      Width = 40
      Height = 13
      Caption = #1056#1086#1079#1076#1110#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 296
      Top = 242
      Width = 41
      Height = 13
      Caption = #1057#1090#1072#1090#1090#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 24
      Top = 10
      Width = 142
      Height = 13
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1096#1072#1073#1083#1086#1085#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object KR_SM: TcxButtonEdit
      Left = 40
      Top = 114
      Width = 185
      Height = 21
      Properties.Alignment.Horz = taCenter
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object KR_RZ: TcxButtonEdit
      Left = 40
      Top = 186
      Width = 185
      Height = 21
      Properties.Alignment.Horz = taCenter
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object KR_ST: TcxTextEdit
      Left = 40
      Top = 258
      Width = 185
      Height = 21
      Properties.Alignment.Horz = taCenter
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object DB_SM: TcxButtonEdit
      Left = 296
      Top = 114
      Width = 185
      Height = 21
      Properties.Alignment.Horz = taCenter
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnButtonClick = cxButtonEdit3PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 3
    end
    object DB_RZ: TcxButtonEdit
      Left = 296
      Top = 186
      Width = 185
      Height = 21
      Properties.Alignment.Horz = taCenter
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnButtonClick = cxButtonEdit4PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 4
    end
    object DB_ST: TcxTextEdit
      Left = 296
      Top = 258
      Width = 185
      Height = 21
      Properties.Alignment.Horz = taCenter
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = clInfoBk
      TabOrder = 5
    end
    object TemplateTitle: TcxTextEdit
      Left = 24
      Top = 26
      Width = 465
      Height = 21
      Properties.MaxLength = 255
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = clInfoBk
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 345
    Width = 517
    Height = 41
    Align = alBottom
    TabOrder = 1
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
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
end
