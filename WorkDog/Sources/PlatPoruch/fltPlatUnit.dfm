object fltPlatForm: TfltPlatForm
  Left = 826
  Top = 693
  BorderStyle = bsDialog
  Caption = #1060#1110#1083#1100#1090#1088' '#1085#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
  ClientHeight = 263
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 433
    Height = 225
    Alignment = alTopLeft
    TabOrder = 0
    object Label1: TLabel
      Left = 322
      Top = 138
      Width = 103
      Height = 13
      AutoSize = False
      Caption = #1076#1086
    end
    object fltTipDogCheck: TcxCheckBox
      Left = 4
      Top = 95
      Width = 229
      Height = 21
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1058#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1091
      TabOrder = 10
      OnClick = fltTipDogCheckClick
    end
    object fltDatePeriodCheck: TcxCheckBox
      Left = 4
      Top = 135
      Width = 89
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1072' '#1087#1077#1088#1110#1086#1076' '#1079
      TabOrder = 12
      OnClick = fltDatePeriodCheckClick
    end
    object fltCustCheck: TcxCheckBox
      Left = 4
      Top = 56
      Width = 309
      Height = 21
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      TabOrder = 8
      OnClick = fltCustCheckClick
    end
    object fltTipDogEdit: TcxButtonEdit
      Left = 8
      Top = 112
      Width = 417
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = fltTipDogEditPropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 11
      OnKeyPress = fltTipDogEditKeyPress
    end
    object fltDateBegEdit: TcxDateEdit
      Left = 8
      Top = 152
      Width = 89
      Height = 21
      Enabled = False
      PopupMenu = PopupMenu1
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clMoneyGreen
      TabOrder = 13
      OnKeyPress = fltDateBegEditKeyPress
    end
    object fltDateEndEdit: TcxDateEdit
      Left = 104
      Top = 152
      Width = 89
      Height = 21
      Enabled = False
      PopupMenu = PopupMenu1
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clMoneyGreen
      TabOrder = 14
      OnKeyPress = fltDateEndEditKeyPress
    end
    object cxLabel10: TcxLabel
      Left = 101
      Top = 137
      Width = 92
      Height = 17
      AutoSize = False
      TabOrder = 16
      Caption = #1087#1086
    end
    object fltCustEdit: TcxButtonEdit
      Left = 8
      Top = 72
      Width = 417
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = False
      Properties.OnButtonClick = fltCustEditPropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 9
      OnKeyPress = fltCustEditKeyPress
    end
    object fltRegNumCheck: TcxCheckBox
      Left = 4
      Top = 14
      Width = 117
      Height = 21
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1056#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1080#1081' '#8470
      TabOrder = 0
      OnClick = fltRegNumCheckClick
    end
    object fltRegNumEdit: TcxTextEdit
      Left = 8
      Top = 32
      Width = 105
      Height = 21
      Enabled = False
      Properties.MaxLength = 50
      Style.Color = clMoneyGreen
      TabOrder = 1
      OnKeyDown = fltRegNumEditKeyDown
    end
    object fltSumCheck: TcxCheckBox
      Left = 204
      Top = 134
      Width = 109
      Height = 21
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1057#1091#1084#1072' '#1074#1110#1076
      TabOrder = 15
      OnClick = fltSumCheckClick
    end
    object fltSumFromEdit: TcxCurrencyEdit
      Left = 208
      Top = 152
      Width = 105
      Height = 21
      OnFocusChanged = fltSumFromEditFocusChanged
      BeepOnEnter = False
      Enabled = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;-,0.00'
      Style.Color = clMoneyGreen
      TabOrder = 17
      OnKeyPress = fltSumFromEditKeyPress
    end
    object fltSumToEdit: TcxCurrencyEdit
      Left = 320
      Top = 152
      Width = 105
      Height = 21
      BeepOnEnter = False
      Enabled = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;-,0.00'
      Style.Color = clMoneyGreen
      TabOrder = 18
      OnKeyPress = fltSumToEditKeyPress
    end
    object chNumPlat: TcxCheckBox
      Left = 116
      Top = 14
      Width = 85
      Height = 21
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #8470' '#1087#1083#1072#1090#1077#1078#1091
      TabOrder = 2
      OnClick = chNumPlatClick
    end
    object NumPlatEdit: TcxTextEdit
      Left = 120
      Top = 32
      Width = 73
      Height = 21
      Enabled = False
      Properties.MaxLength = 10
      Style.Color = clMoneyGreen
      TabOrder = 3
      OnKeyDown = NumPlatEditKeyDown
    end
    object cbType: TcxComboBox
      Left = 200
      Top = 32
      Width = 105
      Height = 21
      Enabled = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #1054#1073#1088#1086#1073#1083#1077#1085#1086' '#1073#1072#1085#1082#1086#1084
        #1053#1077' '#1086#1073#1088#1086#1073#1083#1077#1085#1086' '#1073#1072#1085#1082#1086#1084
        #1042#1080#1076#1072#1083#1077#1085
        #1042#1089'i')
      Style.Color = clMoneyGreen
      TabOrder = 4
      OnKeyDown = cbTypeKeyDown
    end
    object chType: TcxCheckBox
      Left = 196
      Top = 14
      Width = 117
      Height = 21
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1058#1080#1087
      TabOrder = 5
      OnClick = chTypeClick
    end
    object chAcc: TcxCheckBox
      Left = 308
      Top = 14
      Width = 117
      Height = 21
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1056#1072#1093#1091#1085#1086#1082
      TabOrder = 6
      OnClick = chAccClick
    end
    object cbAcc: TcxLookupComboBox
      Left = 312
      Top = 32
      Width = 113
      Height = 21
      Enabled = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownWidth = 280
      Properties.GridMode = True
      Properties.KeyFieldNames = 'ID_RATE_ACCOUNT'
      Properties.ListColumns = <
        item
          Caption = #1052#1060#1054
          HeaderAlignment = taCenter
          FieldName = 'MFO'
        end
        item
          Caption = #1056#1072#1093#1091#1085#1086#1082
          HeaderAlignment = taCenter
          FieldName = 'RATE_ACCOUNT'
        end
        item
          Fixed = True
          MinWidth = 0
          Width = 0
          FieldName = 'ID_RATE_ACCOUNT'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListOptions.AnsiSort = True
      Properties.ListSource = DataSource1
      Properties.OnChange = cbAccPropertiesChange
      Style.Color = clMoneyGreen
      TabOrder = 7
      OnKeyDown = cbAccKeyDown
    end
    object depCheck: TcxCheckBox
      Left = 4
      Top = 175
      Width = 413
      Height = 21
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055'i'#1076#1088#1086#1079#1076'i'#1083
      TabOrder = 19
      OnClick = depCheckClick
    end
    object depEdit: TcxButtonEdit
      Left = 8
      Top = 192
      Width = 417
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = depEditPropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 20
    end
  end
  object OKButton: TcxButton
    Left = 136
    Top = 232
    Width = 105
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080' '#1092#1110#1083#1100#1090#1088
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object cxButton2: TcxButton
    Left = 248
    Top = 232
    Width = 105
    Height = 25
    Caption = #1057#1082#1072#1089#1091#1074#1072#1090#1080' '#1092#1110#1083#1100#1090#1088
    TabOrder = 2
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 360
    Top = 232
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = cxButton3Click
  end
  object PopupMenu1: TPopupMenu
    Left = 48
    Top = 232
    object i1: TMenuItem
      Caption = #1057#1100#1086#1075#1086#1076#1085'i'
      OnClick = i1Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #1055#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1055#1086#1087#1077#1088#1077#1076#1085#1110#1081' '#1088#1110#1082
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '-'
      Visible = False
    end
    object N4: TMenuItem
      Caption = #1055#1077#1088#1096#1080#1081' '#1082#1074#1072#1088#1090#1072#1083' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1088#1086#1082#1091
      Visible = False
    end
    object N5: TMenuItem
      Caption = #1044#1088#1091#1075#1080#1081' '#1082#1074#1072#1088#1090#1072#1083' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1088#1086#1082#1091
      Visible = False
    end
    object N6: TMenuItem
      Caption = #1058#1088#1077#1090#1110#1081' '#1082#1074#1072#1088#1090#1072#1083' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1088#1086#1082#1091
      Visible = False
    end
    object N7: TMenuItem
      Caption = #1063#1077#1090#1074#1077#1088#1090#1099#1081' '#1082#1074#1072#1088#1090#1072#1083' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1088#1086#1082#1091
      Visible = False
    end
  end
  object ActionList1: TActionList
    Left = 16
    Top = 232
    object Action1: TAction
      Caption = 'actApplyFilter'
      ShortCut = 16419
      SecondaryShortCuts.Strings = (
        'F10')
      OnExecute = Action1Execute
    end
  end
  object DataSet: TpFIBDataSet
    Database = platForm.WorkDatabase
    Transaction = platForm.ReadTransaction
    SelectSQL.Strings = (
      
        'select e.id_rate_account, a.rate_account, b.mfo from pub_expand_' +
        'rate_acc_native e, pub_sp_cust_rate_acc a, pub_sp_bank b where e' +
        '.id_rate_account = a.id_rate_account and a.id_bank = b.id_bank a' +
        'nd e.ree_outch = 1')
    Left = 304
    Top = 48
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    DataSet = DataSet
    Left = 336
    Top = 48
  end
  object pFIBDatabase1: TpFIBDatabase
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 368
    Top = 48
  end
  object StoredProc: TpFIBStoredProc
    Database = platForm.WorkDatabase
    Transaction = platForm.WriteTransaction
    Left = 304
    Top = 80
  end
end
