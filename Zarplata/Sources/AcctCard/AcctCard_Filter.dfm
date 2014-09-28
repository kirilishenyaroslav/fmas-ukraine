object FZAcctCard_Filter: TFZAcctCard_Filter
  Left = 313
  Top = 379
  BorderStyle = bsDialog
  Caption = 'FZAcctCard_Filter'
  ClientHeight = 202
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object YesBtn: TcxButton
    Left = 144
    Top = 175
    Width = 73
    Height = 23
    Caption = 'YesBtn'
    TabOrder = 1
    OnClick = YesBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 280
    Top = 175
    Width = 75
    Height = 23
    Caption = 'CancelBtn'
    ModalResult = 2
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
  end
  object pnl2: TPanel
    Left = 0
    Top = 98
    Width = 481
    Height = 71
    BorderStyle = bsSingle
    TabOrder = 0
    object CheckBoxTPaymZarplata: TcxCheckBox
      Left = 6
      Top = 5
      Width = 457
      Height = 21
      Hint = 
        #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1074#1080#1076#1099' '#1074#1099#1087#1083#1072#1090' '#1079#1072#1088#1072#1073#1086#1090#1085#1086#1081' '#1087#1083#1072#1090#1099' '#1085#1072' '#1085#1072#1083#1080#1095#1080#1077' '#1086#1090#1082#1088#1099#1090#1099#1093' '#1082#1072#1088#1090#1086 +
        #1095#1085#1099#1093' '#1089#1095#1077#1090#1086#1074' '#1080' '#1085#1072#1086#1073#1086#1088#1086#1090
      Enabled = False
      ParentShowHint = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1090#1080#1087#1099' '#1074#1099#1087#1083#1072#1090' '#1079#1072#1088#1087#1083#1072#1090#1099
      ShowHint = True
      TabOrder = 0
    end
    object CheckBoxTPaymGrant: TcxCheckBox
      Left = 6
      Top = 23
      Width = 457
      Height = 21
      Hint = 
        #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1074#1080#1076#1099' '#1074#1099#1087#1083#1072#1090' '#1089#1090#1080#1087#1077#1085#1076#1080#1080' '#1085#1072' '#1085#1072#1083#1080#1095#1080#1077' '#1086#1090#1082#1088#1099#1090#1099#1093' '#1082#1072#1088#1090#1086#1095#1085#1099#1093' '#1089#1095 +
        #1077#1090#1086#1074' '#1080' '#1085#1072#1086#1073#1086#1088#1086#1090
      Enabled = False
      ParentShowHint = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1090#1080#1087#1099' '#1074#1099#1087#1083#1072#1090' '#1089#1090#1080#1087#1077#1085#1076#1080#1080
      ShowHint = True
      TabOrder = 1
    end
    object CheckBoxCheckAll: TcxCheckBox
      Left = 6
      Top = 41
      Width = 467
      Height = 21
      Hint = 
        #1054#1090#1095#1077#1090' '#1076#1083#1103' '#1079#1072#1082#1088#1099#1090#1080#1077' '#1082#1072#1088#1090#1086#1095#1085#1099#1093' '#1089#1095#1077#1090#1086#1074', '#1074#1082#1083#1102#1095#1072#1102#1097#1080#1081' '#1091#1074#1086#1083#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090#1085 +
        #1080#1082#1086#1074' '#1080' '#1086#1090#1095#1080#1089#1083#1077#1085#1085#1099#1093' '#1089#1090#1091#1076#1077#1085#1090#1086#1074
      Enabled = False
      ParentShowHint = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1072#1082#1090#1091#1072#1083#1100#1085#1086#1089#1090#1100' '#1082#1072#1088#1090#1086#1095#1085#1099#1093' '#1089#1095#1077#1090#1086#1074
      ShowHint = True
      TabOrder = 2
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 24
    Width = 481
    Height = 73
    BorderStyle = bsSingle
    TabOrder = 3
    object LabelBank: TcxLabel
      Left = 4
      Top = 6
      Width = 123
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 0
    end
    object BankBtnEdit: TcxButtonEdit
      Left = 126
      Top = 4
      Width = 346
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = BankBtnEditPropertiesButtonClick
      TabOrder = 1
    end
    object LabelFile: TcxLabel
      Left = 4
      Top = 30
      Width = 122
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 2
    end
    object FileBtnEdit: TcxButtonEdit
      Left = 126
      Top = 28
      Width = 346
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = FileBtnEditPropertiesButtonClick
      TabOrder = 3
    end
    object CheckBoxNewFieldsDBFtable: TcxCheckBox
      Left = 4
      Top = 48
      Width = 230
      Height = 21
      Enabled = False
      Properties.DisplayUnchecked = 'False'
      TabOrder = 4
      OnClick = CheckBoxNewFieldsDBFtableClick
    end
  end
  object CheckBoxZarplata: TcxCheckBox
    Left = 2
    Top = 1
    Width = 239
    Height = 21
    Hint = #1047#1072#1088#1087#1083#1072#1090#1072
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CheckBoxZarplataPropertiesChange
    Properties.Caption = #1047#1072#1088#1087#1083#1072#1090#1072
    TabOrder = 4
  end
  object CheckBoxGrant: TcxCheckBox
    Left = 242
    Top = 1
    Width = 239
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CheckBoxZarplataPropertiesChange
    Properties.Caption = #1057#1090#1080#1087#1077#1085#1076#1080#1103
    TabOrder = 5
  end
  object OpenFile: TOpenDialog
    Filter = 'dbf - Tables|*.dbf|All Files|*.*'
    Left = 32
    Top = 41
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WTransaction
    Left = 56
    Top = 168
  end
  object DB: TpFIBDatabase
    DefaultTransaction = RTransaction
    DefaultUpdateTransaction = WTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 168
  end
  object RTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 168
  end
  object WTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 392
    Top = 168
  end
end
