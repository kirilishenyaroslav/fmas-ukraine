object Form2: TForm2
  Left = 423
  Top = 344
  BorderStyle = bsDialog
  Caption = 'Form2'
  ClientHeight = 118
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object qFFC_Smet: TqFFormControl
    Left = 157
    Top = 88
    Width = 60
    Height = 21
    ControlsOwner = Owner
    UpdateSQL.Strings = (
      'update dt_man_bonus_smet'
      'set real_date_end=:real_date_end,'
      'summa=:summa,'
      'summa_pps=:summa_pps,'
      'kod_sm=:kod_sm,'
      'kod_sm_pps=:kod_sm_pps,'
      'date_beg=:date_beg'
      'where id_man_bonus_smet=:where;')
    SelectSQL.Strings = (
      
        'select real_date_end, summa, summa_pps,  kod_sm, kod_sm_pps, dat' +
        'e_beg from dt_man_bonus_smet where id_man_bonus_smet=:where;')
    Mode = fmModify
    CheckWhere = True
    CloseForm = True
  end
  object qFDC_Real_date_end: TqFDateControl
    Left = 184
    Top = 8
    Width = 169
    Height = 21
    FieldName = 'real_date_end'
    DisplayName = #1044#1072#1090#1072' '#1082#1086#1085#1094#1072
    Interval = 75
    Value = 0
    LabelColor = clGreen
    Required = True
    Semicolon = True
    Asterisk = False
    Enabled = True
    Blocked = False
    TabOrder = 1
    AutoSaveToRegistry = False
  end
  object qFFC_Summ: TqFFloatControl
    Left = 8
    Top = 32
    Width = 145
    Height = 21
    FieldName = 'summa'
    DisplayName = #1057#1091#1084#1084#1072
    Interval = 70
    Value = Null
    LabelColor = clGreen
    Required = True
    Semicolon = True
    Asterisk = True
    Enabled = True
    Blocked = False
    TabOrder = 2
    AutoSaveToRegistry = False
    MaxLength = 0
    NegativeAllowed = False
    Precision = 2
    Format = '#########0.00'
  end
  object qFFC_Summ_PPS: TqFFloatControl
    Left = 200
    Top = 32
    Width = 153
    Height = 21
    FieldName = 'summa_pps'
    DisplayName = #1057#1091#1084#1084#1072' '#1055#1055#1057
    Interval = 70
    Value = Null
    LabelColor = clGreen
    Required = False
    Semicolon = True
    Asterisk = True
    Enabled = True
    Blocked = False
    TabOrder = 3
    AutoSaveToRegistry = False
    MaxLength = 0
    NegativeAllowed = False
    Precision = 2
    Format = '#########0.00'
  end
  object BitBtn1: TBitBtn
    Left = 26
    Top = 86
    Width = 97
    Height = 25
    Action = Ok_Action
    Caption = #1043#1072#1088#1072#1079#1076
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clGreen
    Font.Height = -15
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 6
  end
  object BitBtn2: TBitBtn
    Left = 242
    Top = 86
    Width = 97
    Height = 25
    Action = Cancel_Action
    Caption = #1042#1110#1076#1084#1110#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 7
  end
  object qFDC_date_beg: TqFDateControl
    Left = 8
    Top = 8
    Width = 169
    Height = 21
    FieldName = 'date_beg'
    DisplayName = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
    Interval = 75
    Value = 0
    LabelColor = clGreen
    Required = True
    Semicolon = True
    Asterisk = False
    Enabled = True
    Blocked = False
    TabOrder = 0
    AutoSaveToRegistry = False
  end
  object qFIC_kod_sm: TqFIntControl
    Left = 8
    Top = 56
    Width = 145
    Height = 21
    FieldName = 'kod_sm'
    DisplayName = #1057#1084#1077#1090#1072
    Interval = 70
    Value = Null
    LabelColor = clGreen
    Required = True
    Semicolon = True
    Asterisk = True
    Enabled = True
    Blocked = False
    TabOrder = 4
    AutoSaveToRegistry = False
    MaxLength = 10
    NegativeAllowed = False
    ZeroAllowed = False
  end
  object qFIC_kod_sm_pps: TqFIntControl
    Left = 200
    Top = 56
    Width = 153
    Height = 21
    FieldName = 'kod_sm_pps'
    DisplayName = #1057#1084#1077#1090#1072' '#1055#1055#1057
    Interval = 70
    Value = Null
    LabelColor = clGreen
    Required = False
    Semicolon = True
    Asterisk = True
    Enabled = True
    Blocked = False
    TabOrder = 5
    AutoSaveToRegistry = False
    MaxLength = 10
    NegativeAllowed = False
    ZeroAllowed = False
  end
  object ActionList1: TActionList
    Left = 160
    Top = 48
    object Ok_Action: TAction
      Caption = #1043#1072#1088#1072#1079#1076
      ShortCut = 13
      OnExecute = Ok_ActionExecute
    end
    object Cancel_Action: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1072
      ShortCut = 27
      OnExecute = Cancel_ActionExecute
    end
  end
end
