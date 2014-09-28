object frmCustomerFilter: TfrmCustomerFilter
  Left = 390
  Top = 186
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1060#1110#1083#1100#1090#1088' '#1076#1086#1073#1086#1088#1091' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1110#1074
  ClientHeight = 297
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 256
    Width = 419
    Height = 41
    Align = alBottom
    TabOrder = 3
    object OKButton: TcxButton
      Left = 256
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      Default = True
      TabOrder = 0
      OnClick = OKButtonClick
    end
    object CancelButton: TcxButton
      Left = 336
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = CancelButtonClick
    end
    object ClearButton: TcxButton
      Left = 168
      Top = 8
      Width = 81
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080' '#1074#1089#1110
      TabOrder = 2
      OnClick = ClearButtonClick
    end
    object cxComboBox1: TcxComboBox
      Left = 8
      Top = 16
      Width = 153
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #1053#1072#1079#1074#1072
        #1050#1086#1076' '#1045#1044#1056#1055#1054#1059
        #1052#1060#1054
        #1053#1086#1084#1077#1088' '#1088#1072#1093#1091#1085#1082#1072
        #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090)
      Style.Color = clMoneyGreen
      TabOrder = 3
    end
    object cxLabel1: TcxLabel
      Left = 8
      Top = 0
      Width = 153
      Height = 17
      AutoSize = False
      TabOrder = 4
      Caption = #1057#1090#1072#1074#1072#1090#1080' '#1085#1072
    end
  end
  object GroupBox2: TGroupBox
    Left = 1
    Top = 81
    Width = 416
    Height = 64
    Caption = #1047#1072' '#1073#1072#1085#1082#1110#1074#1089#1100#1082#1080#1084#1080' '#1072#1090#1088#1080#1073#1091#1090#1072#1084#1080
    TabOrder = 1
    object mfoCheck: TcxCheckBox
      Left = 8
      Top = 16
      Width = 73
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1072' '#1052#1060#1054
      TabOrder = 0
      OnClick = mfoCheckClick
    end
    object typeAccCheck: TcxCheckBox
      Left = 264
      Top = 16
      Width = 145
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1072' '#1090#1080#1087#1086#1084' '#1088#1072#1093#1091#1085#1082#1091
      TabOrder = 4
      OnClick = typeAccCheckClick
    end
    object accCheck: TcxCheckBox
      Left = 88
      Top = 16
      Width = 169
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1072' '#1085#1086#1084#1077#1088#1086#1084' '#1088#1072#1093#1091#1085#1082#1091
      TabOrder = 2
      OnClick = accCheckClick
    end
    object mfoEdit: TcxTextEdit
      Left = 8
      Top = 32
      Width = 73
      Height = 21
      Enabled = False
      Style.Color = clMoneyGreen
      TabOrder = 1
    end
    object accEdit: TcxTextEdit
      Left = 88
      Top = 32
      Width = 169
      Height = 21
      Enabled = False
      Style.Color = clMoneyGreen
      TabOrder = 3
    end
    object typeAccEdit: TcxTextEdit
      Left = 264
      Top = 32
      Width = 145
      Height = 21
      Enabled = False
      Style.Color = clMoneyGreen
      TabOrder = 5
    end
  end
  object FilterProductGroup: TGroupBox
    Left = 0
    Top = 0
    Width = 417
    Height = 81
    Caption = #1047#1072' '#1086#1089#1085#1086#1074#1085#1080#1084#1080' '#1072#1090#1088#1080#1073#1091#1090#1072#1084#1080' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
    TabOrder = 0
    object CustCheck: TcxCheckBox
      Left = 8
      Top = 16
      Width = 289
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1072' '#1085#1072#1079#1074#1086#1102
      TabOrder = 0
      OnClick = CustCheckClick
    end
    object edrpouCheck: TcxCheckBox
      Left = 296
      Top = 16
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1072' '#1082#1086#1076#1086#1084' '#1045#1044#1056#1055#1054#1059
      TabOrder = 2
      OnClick = edrpouCheckClick
    end
    object fizLicoCheck: TcxCheckBox
      Left = 8
      Top = 56
      Width = 401
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1060#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072
      TabOrder = 4
    end
    object CustEdit: TcxTextEdit
      Left = 8
      Top = 32
      Width = 289
      Height = 21
      Enabled = False
      Style.Color = clMoneyGreen
      TabOrder = 1
    end
    object edrpouEdit: TcxTextEdit
      Left = 304
      Top = 32
      Width = 105
      Height = 21
      Enabled = False
      Style.Color = clMoneyGreen
      TabOrder = 3
    end
    object depEdit: TcxButtonEdit
      Left = 216
      Top = 56
      Width = 193
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.HideCursor = True
      Properties.ReadOnly = True
      Properties.OnButtonClick = depEditPropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 5
    end
    object depCheck: TcxCheckBox
      Left = 144
      Top = 55
      Width = 73
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
      TabOrder = 6
      OnClick = depCheckClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 144
    Width = 417
    Height = 105
    Caption = #1047#1072' '#1087#1086#1076#1072#1090#1082#1086#1074#1080#1084#1080' '#1072#1090#1088#1080#1073#1091#1090#1072#1084#1080' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
    TabOrder = 2
    object CheckCustNNSDate: TcxCheckBox
      Left = 8
      Top = 16
      Width = 185
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1072' '#1076#1072#1090#1086#1102' '#1074#1080#1076#1072#1095#1110' '#1089#1074#1110#1076#1086#1094#1090#1074#1072
      TabOrder = 0
      OnClick = CheckCustNNSDateClick
    end
    object CheckCustNNSNum: TcxCheckBox
      Left = 208
      Top = 16
      Width = 177
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1072' '#1085#1086#1084#1077#1088#1086#1084' '#1089#1074#1110#1076#1086#1094#1090#1074#1072
      TabOrder = 2
      OnClick = CheckCustNNSNumClick
    end
    object FilterCustomerNNSDate: TcxDateEdit
      Left = 8
      Top = 32
      Width = 193
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object CheckCustPDV: TcxCheckBox
      Left = 104
      Top = 56
      Width = 177
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1083#1072#1090#1085#1080#1082' '#1055#1044#1042
      TabOrder = 6
      Visible = False
    end
    object CheckCustPNP: TcxCheckBox
      Left = 32
      Top = 48
      Width = 257
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1083#1072#1090#1085#1080#1082' '#1087#1086#1076#1072#1090#1082#1091' '#1085#1072' '#1087#1088#1080#1073#1080#1083#1100
      TabOrder = 7
      Visible = False
    end
    object CheckCustPodNum: TcxCheckBox
      Left = 8
      Top = 56
      Width = 185
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1072' '#1087#1086#1076#1072#1090#1082#1086#1074#1080#1084' '#1085#1086#1084#1077#1088#1086#1084
      TabOrder = 4
    end
    object FIlterCustomerNNSNum: TcxComboBox
      Left = 208
      Top = 32
      Width = 201
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object FilterCustPodNum: TcxComboBox
      Left = 8
      Top = 72
      Width = 193
      Height = 21
      Enabled = False
      TabOrder = 5
    end
    object cbDnDzId: TcxCheckBox
      Left = 208
      Top = 56
      Width = 201
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1054#1089#1086#1073#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
      TabOrder = 8
      OnClick = cbDnDzIdClick
    end
    object edDnDzID: TcxTextEdit
      Left = 208
      Top = 72
      Width = 201
      Height = 21
      Enabled = False
      Style.Color = clMoneyGreen
      TabOrder = 9
    end
  end
  object ActionList1: TActionList
    Left = 176
    Top = 192
    object Action1: TAction
      Caption = 'actApplyFilter'
      ShortCut = 16419
      SecondaryShortCuts.Strings = (
        'F10')
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 121
      OnExecute = Action2Execute
    end
  end
end
