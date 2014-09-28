object FormEdit: TFormEdit
  Left = 657
  Top = 188
  BorderStyle = bsDialog
  Caption = #1060#1086#1088#1084#1072' '#1088#1086#1073#1086#1090#1080' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1110' '#1079#1072' '#1047#1054
  ClientHeight = 394
  ClientWidth = 265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 265
    Height = 354
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 14
      Width = 56
      Height = 13
      Caption = #1055#1088#1080#1079#1074#1080#1097#1077':'
    end
    object Label2: TLabel
      Left = 16
      Top = 39
      Width = 23
      Height = 13
      Caption = #1030#1084'`'#1103':'
    end
    object Label3: TLabel
      Left = 16
      Top = 63
      Width = 63
      Height = 13
      Caption = #1055#1086' '#1073#1072#1090#1100#1082#1086#1074#1110':'
    end
    object Label4: TLabel
      Left = 16
      Top = 126
      Width = 74
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091': '
    end
    object Label5: TLabel
      Left = 16
      Top = 155
      Width = 95
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1088#1080#1087#1080#1085#1077#1085#1085#1103': '
    end
    object Label6: TLabel
      Left = 16
      Top = 87
      Width = 98
      Height = 13
      Caption = #1047#1054' '#1079#1072' '#1044#1056#1060#1054' '#1044#1055#1040':'
    end
    object Label7: TLabel
      Left = 8
      Top = 250
      Width = 96
      Height = 49
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1055#1110#1076#1089#1090#1072#1074#1072' '#1087#1088#1080#1087#1080#1085#1077#1085#1085#1103' '#1090#1088#1091#1076#1086#1074#1080#1093' '#1074#1110#1076#1085#1086#1089#1080#1085':'
      WordWrap = True
    end
    object Label8: TLabel
      Left = 8
      Top = 222
      Width = 96
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103' '#1086#1089#1086#1073#1080':'
      WordWrap = True
    end
    object Label9: TLabel
      Left = 16
      Top = 173
      Width = 87
      Height = 39
      Caption = #1044#1072#1090#1072' '#1089#1090#1074#1086#1088#1077#1085#1085#1103' '#13#10#1085#1086#1074#1086#1075#1086' '#1088#1086#1073#1086#1095#1086#1075#1086' '#13#10#1084#1110#1089#1094#1103':'
    end
    object Label10: TLabel
      Left = 10
      Top = 305
      Width = 96
      Height = 41
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1044#1086#1075#1086#1074#1086#1088' '#1062#1055#1061' '#1079#1072' '#1086#1089#1085#1086#1074#1085#1080#1084' '#1084#1110#1089#1094#1077#1084' '#1088#1086#1073#1086#1090#1080':'
      WordWrap = True
    end
    object EditDateBeg: TcxDateEdit
      Left = 120
      Top = 120
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object EditDateEnd: TcxDateEdit
      Left = 120
      Top = 148
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object EditFam: TcxButtonEdit
      Left = 120
      Top = 8
      Width = 121
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = ButtonAnketPropertiesButtonClick
      TabOrder = 0
    end
    object EditName: TcxTextEdit
      Left = 120
      Top = 32
      Width = 121
      Height = 21
      Properties.ReadOnly = True
      TabOrder = 1
    end
    object EditFath: TcxTextEdit
      Left = 120
      Top = 56
      Width = 121
      Height = 21
      Properties.ReadOnly = True
      TabOrder = 2
    end
    object EditNomerKart: TcxTextEdit
      Left = 120
      Top = 80
      Width = 121
      Height = 21
      Properties.ReadOnly = True
      TabOrder = 3
    end
    object cxTextEdit1: TcxTextEdit
      Left = 118
      Top = 250
      Width = 121
      Height = 21
      Properties.MaxLength = 150
      Properties.ReadOnly = False
      TabOrder = 8
    end
    object cxSpinEdit1: TcxSpinEdit
      Left = 120
      Top = 215
      Width = 121
      Height = 21
      Properties.MaxValue = 5.000000000000000000
      Properties.MinValue = 1.000000000000000000
      TabOrder = 7
      Value = 1
    end
    object cxDateEditDATE_NEW_WORK_PL: TcxDateEdit
      Left = 120
      Top = 176
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object RBtnYes: TcxRadioButton
      Left = 120
      Top = 305
      Width = 49
      Height = 17
      Caption = #1058#1072#1082
      TabOrder = 9
      OnExit = RBtnYesExit
    end
    object RBtnFalse: TcxRadioButton
      Left = 198
      Top = 305
      Width = 41
      Height = 17
      Caption = #1053#1110
      TabOrder = 10
      OnExit = RBtnFalseExit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 354
    Width = 265
    Height = 40
    Align = alBottom
    TabOrder = 1
    object ButtonOk: TcxButton
      Left = 64
      Top = 8
      Width = 75
      Height = 25
      Caption = #1043#1072#1088#1072#1079#1076
      TabOrder = 0
      OnClick = ButtonOkClick
    end
    object ButtonCancel: TcxButton
      Left = 144
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 1
      OnClick = ButtonCancelClick
    end
  end
end
