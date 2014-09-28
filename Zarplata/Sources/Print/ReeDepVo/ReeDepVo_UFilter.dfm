object fzReeDepVOFilter: TfzReeDepVOFilter
  Left = 637
  Top = 332
  BorderStyle = bsDialog
  Caption = 'fzReeDepVOFilter'
  ClientHeight = 436
  ClientWidth = 464
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
  object Bevel: TBevel
    Left = 0
    Top = 0
    Width = 464
    Height = 394
    Align = alTop
    Shape = bsFrame
  end
  object BoxSmeta: TcxGroupBox
    Left = 4
    Top = 201
    Width = 453
    Height = 36
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 12
    TabStop = False
    object LabelSmetaData: TcxLabel
      Left = 78
      Top = 10
      Width = 358
      Height = 21
      TabStop = False
      AutoSize = False
      ParentColor = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 0
      Caption = ''
    end
  end
  object YesBtn: TcxButton
    Left = 289
    Top = 404
    Width = 65
    Height = 23
    Action = Action1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 361
    Top = 404
    Width = 65
    Height = 23
    Cancel = True
    Caption = 'CancelBtn'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 22
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object CheckBoxDepartment: TcxCheckBox
    Left = 4
    Top = 132
    Width = 452
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
    TabOrder = 8
    OnClick = CheckBoxDepartmentClick
  end
  object BoxDepartment: TcxGroupBox
    Left = 4
    Top = 150
    Width = 453
    Height = 36
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 9
    TabStop = False
    object LabelDepartmentData: TcxLabel
      Left = 77
      Top = 10
      Width = 236
      Height = 21
      TabStop = False
      AutoSize = False
      ParentColor = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 0
      Caption = ''
    end
  end
  object CheckBoxSmeta: TcxCheckBox
    Left = 4
    Top = 185
    Width = 451
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1050#1086#1096#1090#1086#1088#1080#1089
    TabOrder = 11
    OnClick = CheckBoxSmetaClick
  end
  object CheckBoxVidOpl: TcxCheckBox
    Left = 4
    Top = 84
    Width = 448
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1080
    TabOrder = 4
    OnClick = CheckBoxVidOplClick
  end
  object BoxVidOpl: TcxGroupBox
    Left = 5
    Top = 100
    Width = 453
    Height = 36
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 6
    TabStop = False
    object LabelVidOplData: TcxLabel
      Left = 65
      Top = 10
      Width = 374
      Height = 21
      TabStop = False
      AutoSize = False
      ParentColor = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 0
      Caption = ''
    end
  end
  object BoxKodSetup: TcxGroupBox
    Left = 8
    Top = 8
    Width = 449
    Height = 41
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object MonthesList1: TcxComboBox
      Left = 5
      Top = 10
      Width = 116
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 12
      Properties.Items.Strings = (
        'January'
        'February')
      TabOrder = 0
    end
    object YearSpinEdit1: TcxSpinEdit
      Left = 120
      Top = 10
      Width = 77
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.CanEdit = False
      Properties.MaxValue = 2100.000000000000000000
      Properties.MinValue = 1995.000000000000000000
      TabOrder = 1
      Value = 2000
    end
    object MonthesList2: TcxComboBox
      Left = 241
      Top = 10
      Width = 116
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 12
      Properties.Items.Strings = (
        'January'
        'February')
      TabOrder = 2
    end
    object YearSpinEdit2: TcxSpinEdit
      Left = 354
      Top = 10
      Width = 77
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.CanEdit = False
      Properties.MaxValue = 2100.000000000000000000
      Properties.MinValue = 1995.000000000000000000
      TabOrder = 3
      Value = 2000
    end
    object cxLabel1: TcxLabel
      Left = 202
      Top = 12
      Width = 32
      Height = 21
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      Caption = '-'
    end
  end
  object cxRadioGroup1: TcxRadioGroup
    Left = 6
    Top = 48
    Width = 452
    Height = 38
    Properties.Items = <>
    Properties.ReadOnly = False
    TabOrder = 1
    Caption = ''
  end
  object RadioBtnNar: TcxRadioButton
    Left = 16
    Top = 60
    Width = 113
    Height = 17
    Caption = #1053#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103
    Checked = True
    TabOrder = 3
    TabStop = True
  end
  object RadioBtnVed: TcxRadioButton
    Left = 176
    Top = 60
    Width = 113
    Height = 17
    Caption = #1044#1086' '#1089#1087#1083#1072#1090#1080
    TabOrder = 2
  end
  object CheckBoxSumma: TcxCheckBox
    Left = 3
    Top = 237
    Width = 454
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CheckBoxSummaPropertiesChange
    Properties.Caption = #1057#1091#1084#1072
    TabOrder = 14
    OnClick = CheckBoxSummaClick
  end
  object EditDepartment: TcxButtonEdit
    Left = 24
    Top = 160
    Width = 60
    Height = 21
    Enabled = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?'
    Properties.MaxLength = 0
    Properties.ReadOnly = False
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    TabOrder = 10
    OnExit = EditDepartmentExit
  end
  object EditVidOpl: TcxButtonEdit
    Left = 25
    Top = 110
    Width = 61
    Height = 21
    Enabled = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '\d?\d?\d?\d?\d?\d?\d?\d?'
    Properties.MaxLength = 0
    Properties.ReadOnly = False
    Properties.OnButtonClick = EditVidOplPropertiesButtonClick
    TabOrder = 7
    OnExit = EditVidOplExit
  end
  object EditSmeta: TcxButtonEdit
    Left = 25
    Top = 211
    Width = 60
    Height = 21
    Enabled = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '\d?\d?\d?\d?\d?\d?\d?\d?'
    Properties.MaxLength = 0
    Properties.ReadOnly = False
    Properties.OnButtonClick = EditSmetaPropertiesButtonClick
    TabOrder = 13
    OnExit = EditSmetaExit
  end
  object CheckBoxVOPrint: TcxCheckBox
    Left = 226
    Top = 86
    Width = 230
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1074#1080#1076#1080' '#1086#1087#1077#1088#1072#1094#1110#1081
    TabOrder = 5
    OnClick = CheckBoxVOPrintClick
  end
  object cxGroupBox3: TcxGroupBox
    Left = 5
    Top = 255
    Width = 452
    Height = 34
    Alignment = alTopLeft
    TabOrder = 15
    TabStop = False
    object cxCurrencyEdit1: TcxCurrencyEdit
      Left = 48
      Top = 9
      Width = 180
      Height = 21
      Enabled = False
      Properties.DisplayFormat = '0.00'
      TabOrder = 0
    end
    object cxCurrencyEdit2: TcxCurrencyEdit
      Left = 254
      Top = 9
      Width = 182
      Height = 21
      Enabled = False
      Properties.DisplayFormat = '0.00'
      TabOrder = 1
    end
    object cxLabel5: TcxLabel
      Left = 229
      Top = 11
      Width = 23
      Height = 17
      TabStop = False
      TabOrder = 2
      Caption = #1076#1086':'
    end
    object cxLabel4: TcxLabel
      Left = 22
      Top = 11
      Width = 25
      Height = 17
      TabStop = False
      TabOrder = 3
      Caption = #1074#1110#1076':'
    end
  end
  object cxGroupBox4: TcxGroupBox
    Left = 6
    Top = 354
    Width = 451
    Height = 36
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 20
    TabStop = False
    object EditCat: TcxLookupComboBox
      Left = 18
      Top = 10
      Width = 417
      Height = 21
      Enabled = False
      Properties.ListColumns = <>
      Properties.ListOptions.ShowHeader = False
      Properties.ReadOnly = False
      Properties.OnChange = EditCatPropertiesChange
      EditValue = 0
      TabOrder = 0
    end
  end
  object CheckBoxCat: TcxCheckBox
    Left = 0
    Top = 340
    Width = 457
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
    TabOrder = 18
    OnClick = CheckBoxCatClick
  end
  object CheckBoxCatPrint: TcxCheckBox
    Left = 222
    Top = 340
    Width = 240
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1082#1072#1090#1077#1075#1086#1088#1110#1102
    TabOrder = 19
    Visible = False
    OnClick = CheckBoxCatPrintClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 5
    Top = 306
    Width = 451
    Height = 36
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 17
    TabStop = False
    object EditProp: TcxLookupComboBox
      Left = 18
      Top = 10
      Width = 417
      Height = 21
      Enabled = False
      Properties.ListColumns = <>
      Properties.ListOptions.ShowHeader = False
      Properties.ReadOnly = False
      Properties.OnChange = ComboBoxPropPropertiesChange
      EditValue = 0
      TabOrder = 0
    end
  end
  object CheckBoxProp: TcxCheckBox
    Left = 1
    Top = 289
    Width = 457
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1083#1072#1089#1090#1080#1074#1110#1089#1090#1100
    Style.TransparentBorder = True
    TabOrder = 16
    OnClick = CheckBoxPropClick
  end
  object DateEdit: TcxDateEdit
    Left = 314
    Top = 160
    Width = 129
    Height = 21
    Enabled = False
    Properties.DateButtons = [btnToday]
    TabOrder = 23
  end
  object ActionList: TActionList
    Left = 68
    Top = 397
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
  object DSetCat: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    Left = 364
    Top = 357
    poSQLINT64ToBCD = True
  end
  object DSourceCat: TDataSource
    DataSet = DSetCat
    Left = 396
    Top = 357
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 144
    Top = 398
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 104
    Top = 398
  end
  object DSourceProp: TDataSource
    DataSet = DSetProp
    Left = 396
    Top = 310
  end
  object DSetProp: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    Left = 364
    Top = 310
    poSQLINT64ToBCD = True
  end
end
