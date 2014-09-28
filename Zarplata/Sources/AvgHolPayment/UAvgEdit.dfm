object frmAvgEdit: TfrmAvgEdit
  Left = 367
  Top = 302
  BorderStyle = bsDialog
  Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1086' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084
  ClientHeight = 138
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 97
    Width = 445
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
    Width = 445
    Height = 97
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 66
      Top = 14
      Width = 103
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#1091#1084#1072' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 122
      Top = 40
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = #1041#1102#1076#1078#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 34
      Top = 64
      Width = 135
      Height = 13
      Alignment = taRightJustify
      Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1076#1085#1110#1074' '#1074' '#1084#1110#1089#1103#1094#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SummaNar: TcxCalcEdit
      Left = 176
      Top = 14
      Width = 121
      Height = 21
      EditValue = 0.000000000000000000
      TabOrder = 0
    end
    object SmFull: TcxButtonEdit
      Left = 240
      Top = 40
      Width = 177
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = SmFullPropertiesButtonClick
      TabOrder = 2
    end
    object SmCode: TcxTextEdit
      Left = 176
      Top = 40
      Width = 57
      Height = 21
      TabOrder = 1
      OnExit = SmCodeExit
    end
    object NumDays: TcxTextEdit
      Left = 176
      Top = 64
      Width = 57
      Height = 21
      TabOrder = 3
      Text = 'cxTextEdit1'
    end
  end
end
