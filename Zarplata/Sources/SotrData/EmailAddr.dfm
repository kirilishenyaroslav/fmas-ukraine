object frmEmailAddr: TfrmEmailAddr
  Left = 456
  Top = 330
  BorderStyle = bsDialog
  Caption = #1040#1076#1088#1077#1089#1072' '#1088#1086#1079#1089#1080#1083#1082#1080
  ClientHeight = 193
  ClientWidth = 678
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
    Width = 678
    Height = 152
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 80
      Width = 173
      Height = 13
      HelpType = htKeyword
      HelpKeyword = '='
      Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091' '#1076#1110#1111' '#1082#1086#1085#1090#1072#1082#1090#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 23
      Top = 113
      Width = 190
      Height = 13
      Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091' '#1076#1110#1111' '#1082#1086#1085#1090#1072#1082#1090#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 52
      Top = 11
      Width = 161
      Height = 13
      Caption = #1047#1085#1072#1095#1077#1085#1085#1103'/ '#1085#1086#1084#1077#1088' '#1082#1086#1085#1090#1072#1082#1090#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 132
      Top = 41
      Width = 80
      Height = 13
      Caption = #1058#1080#1087' '#1082#1086#1085#1090#1072#1082#1090#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxDateEdit2: TcxDateEdit
      Left = 216
      Top = 109
      Width = 153
      Height = 21
      Properties.ShowTime = False
      TabOrder = 2
    end
    object cxDateEdit1: TcxDateEdit
      Left = 216
      Top = 77
      Width = 153
      Height = 21
      Properties.ShowTime = False
      TabOrder = 1
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 216
      Top = 8
      Width = 305
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '[a-zA-Z@.0-9_-]+'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      TabOrder = 0
    end
    object cxButton3: TcxButton
      Left = 528
      Top = 8
      Width = 137
      Height = 33
      Caption = #1042#1080#1073#1088#1072#1090#1080' '#1079' '#1076#1086#1074#1110#1076#1085#1080#1082#1072
      Enabled = False
      TabOrder = 3
    end
    object cxTextEdit1: TcxTextEdit
      Left = 216
      Top = 40
      Width = 305
      Height = 21
      Enabled = False
      TabOrder = 4
      Text = #1045#1083#1077#1082#1090#1088#1086#1085#1085#1072' '#1087#1086#1096#1090#1072
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 152
    Width = 678
    Height = 41
    Align = alBottom
    TabOrder = 1
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
end
