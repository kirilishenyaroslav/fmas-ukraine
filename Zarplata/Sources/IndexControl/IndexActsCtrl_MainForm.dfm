object FIndexActsControl: TFIndexActsControl
  Left = 503
  Top = 279
  BorderStyle = bsDialog
  Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1086' '#1073#1072#1079#1086#1074#1086#1084#1091' '#1087#1077#1088#1110#1086#1076#1091' '#1076#1083#1103' '#1110#1085#1076#1077#1082#1089#1072#1094#1110#1111
  ClientHeight = 181
  ClientWidth = 369
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PeriodBox: TcxGroupBox
    Left = 0
    Top = 0
    Width = 369
    Height = 177
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TabStop = False
    object DateBegLabel: TcxLabel
      Left = 11
      Top = 22
      Width = 137
      Height = 20
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 9
      Caption = #1044#1072#1090#1072' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091':'
    end
    object DateBeg: TDateTimePicker
      Left = 257
      Top = 19
      Width = 99
      Height = 24
      Date = 40616.436378460650000000
      Time = 40616.436378460650000000
      TabOrder = 0
    end
    object DateEnd: TDateTimePicker
      Left = 257
      Top = 48
      Width = 99
      Height = 24
      Date = 40616.436476608790000000
      Time = 40616.436476608790000000
      Enabled = False
      TabOrder = 2
    end
    object EditSumma: TcxMaskEdit
      Left = 256
      Top = 103
      Width = 99
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 6
    end
    object cxMaskEdit1: TcxMaskEdit
      Left = 256
      Top = 76
      Width = 99
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 4
    end
    object cxCheckBox0: TcxCheckBox
      Left = 8
      Top = 48
      Width = 234
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.ValueChecked = 'F'
      Properties.ValueUnchecked = 'T'
      Properties.OnChange = CheckBoxMonthFinishPropertiesChange
      Properties.Caption = #1042#1089#1090#1072#1085#1086#1074#1080#1090#1080' '#1073#1072#1079#1086#1074#1080#1081' '#1087#1077#1088#1110#1086#1076':'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object cxCheckBox1: TcxCheckBox
      Left = 8
      Top = 104
      Width = 144
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.ValueChecked = 'F'
      Properties.ValueUnchecked = 'T'
      Properties.OnChange = cxCheckBox1PropertiesChange
      Properties.Caption = #1057#1091#1084#1072' '#1092#1072#1082#1090#1080#1095#1085#1072':'
      State = cbsChecked
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
    object cxCheckBox2: TcxCheckBox
      Left = 8
      Top = 76
      Width = 153
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.ValueChecked = 'F'
      Properties.ValueUnchecked = 'T'
      Properties.OnChange = cxCheckBox2PropertiesChange
      Properties.Caption = #1057#1091#1084#1072' '#1092#1110#1082#1089#1086#1074#1072#1085#1072':'
      State = cbsChecked
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object CancelBtn: TcxButton
      Left = 272
      Top = 149
      Width = 81
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = CancelBtnClick
      LookAndFeel.Kind = lfFlat
    end
    object YesBtn: TcxButton
      Left = 184
      Top = 149
      Width = 81
      Height = 25
      Action = Action1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      LookAndFeel.Kind = lfFlat
    end
  end
  object ActionList1: TActionList
    Left = 184
    Top = 104
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 13
      OnExecute = Action2Execute
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 280
    Top = 32
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 312
    Top = 32
  end
end
