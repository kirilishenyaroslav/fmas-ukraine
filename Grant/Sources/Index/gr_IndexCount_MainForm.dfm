object FIndexCount: TFIndexCount
  Left = 769
  Top = 151
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FIndexCount'
  ClientHeight = 331
  ClientWidth = 495
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
  object CheckBoxVidOpl: TcxCheckBox
    Left = -1
    Top = 36
    Width = 477
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 3
    OnClick = CheckBoxVidOplClick
  end
  object BoxVidOpl: TcxGroupBox
    Left = -2
    Top = 54
    Width = 491
    Height = 36
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object EditVidOpl: TcxButtonEdit
      Left = 5
      Top = 10
      Width = 92
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
      TabOrder = 1
      OnExit = EditVidOplExit
    end
    object LabelVidOplData: TcxLabel
      Left = 99
      Top = 10
      Width = 371
      Height = 21
      AutoSize = False
      Enabled = False
      ParentColor = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 0
      Caption = ''
    end
  end
  object CheckBoxDepartment: TcxCheckBox
    Left = -1
    Top = 89
    Width = 476
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 4
    OnClick = CheckBoxDepartmentClick
  end
  object BoxDepartment: TcxGroupBox
    Left = -1
    Top = 107
    Width = 490
    Height = 36
    Alignment = alTopLeft
    TabOrder = 1
    TabStop = False
    object EditDepartment: TcxButtonEdit
      Left = 5
      Top = 10
      Width = 91
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
      Properties.OnButtonClick = EditDepartmentPropertiesButtonClick
      TabOrder = 1
      OnExit = EditDepartmentExit
    end
    object LabelDepartmentData: TcxLabel
      Left = 99
      Top = 10
      Width = 248
      Height = 21
      AutoSize = False
      Enabled = False
      ParentColor = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 0
      Caption = ''
    end
    object DateEdit: TcxDateEdit
      Left = 349
      Top = 10
      Width = 120
      Height = 21
      Enabled = False
      TabOrder = 2
    end
  end
  object CheckBoxSmeta: TcxCheckBox
    Left = -1
    Top = 142
    Width = 476
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 5
    OnClick = CheckBoxSmetaClick
  end
  object BoxSmeta: TcxGroupBox
    Left = -1
    Top = 158
    Width = 490
    Height = 36
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object EditSmeta: TcxButtonEdit
      Left = 5
      Top = 10
      Width = 90
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
      TabOrder = 1
      OnExit = EditSmetaExit
    end
    object LabelSmetaData: TcxLabel
      Left = 100
      Top = 10
      Width = 368
      Height = 21
      AutoSize = False
      Enabled = False
      ParentColor = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 0
      Caption = ''
    end
  end
  object BoxKodSetup: TcxGroupBox
    Left = 0
    Top = -2
    Width = 489
    Height = 41
    Alignment = alTopLeft
    TabOrder = 9
    TabStop = False
    object MonthesList: TcxComboBox
      Left = 5
      Top = 10
      Width = 101
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'January'
        'February')
      TabOrder = 0
    end
    object YearSpinEdit: TcxSpinEdit
      Left = 108
      Top = 10
      Width = 69
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.CanEdit = False
      Properties.MaxValue = 2100.000000000000000000
      Properties.MinValue = 2006.000000000000000000
      Properties.OnChange = YearSpinEditPropertiesChange
      TabOrder = 1
      Value = 2006
    end
    object cxLabel1: TcxLabel
      Left = 172
      Top = 12
      Width = 128
      Height = 17
      TabOrder = 2
      Caption = #1055#1088#1086#1078#1080#1090#1086#1095#1085#1099#1081' '#1084#1080#1085#1080#1084#1091#1084
    end
    object cxLabel2: TcxLabel
      Left = 362
      Top = 12
      Width = 52
      Height = 17
      TabOrder = 3
      Caption = #1042#1110#1076#1089#1086#1090#1086#1082
    end
    object MaskEditPercent: TcxMaskEdit
      Left = 416
      Top = 12
      Width = 59
      Height = 21
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '0?\d?\d ?[,] ?\d?\d'
      Properties.MaxLength = 0
      TabOrder = 4
    end
    object MaskEditPM: TcxMaskEdit
      Left = 300
      Top = 12
      Width = 64
      Height = 21
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d?\d?\d?\d?[,] ?\d?\d'
      Properties.MaxLength = 0
      TabOrder = 5
    end
    object CheckBoxIsDelete: TcxCheckBox
      Left = 177
      Top = 12
      Width = 136
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.ValueChecked = '2'
      Properties.ValueUnchecked = '0'
      Properties.Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      TabOrder = 6
      Visible = False
    end
  end
  object CheckBoxKatStud: TcxCheckBox
    Left = -1
    Top = 193
    Width = 346
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 6
    OnClick = CheckBoxKatStudClick
  end
  object BoxCatStud: TcxGroupBox
    Left = -1
    Top = 209
    Width = 490
    Height = 36
    Alignment = alTopLeft
    TabOrder = 10
    TabStop = False
    object ComboBoxCategory: TcxLookupComboBox
      Left = 6
      Top = 10
      Width = 355
      Height = 21
      Enabled = False
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'ID_CAT_STUD'
      Properties.ListColumns = <
        item
          FieldName = 'NAME_FULL'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ReadOnly = False
      TabOrder = 0
    end
    object Editkurs: TcxSpinEdit
      Left = 364
      Top = 10
      Width = 107
      Height = 21
      Enabled = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.CanEdit = False
      Properties.MaxValue = 7.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Properties.ReadOnly = False
      Properties.OnChange = YearSpinEditPropertiesChange
      TabOrder = 1
      Value = 1
    end
  end
  object BtnOk: TcxButton
    Left = 256
    Top = 304
    Width = 75
    Height = 25
    Caption = 'BtnOk'
    TabOrder = 7
    OnClick = BtnOkClick
  end
  object BtnCancel: TcxButton
    Left = 336
    Top = 304
    Width = 75
    Height = 25
    Caption = 'BtnCancel'
    TabOrder = 8
    OnClick = BtnCancelClick
  end
  object CheckBoxKurs: TcxCheckBox
    Left = 362
    Top = 193
    Width = 111
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 11
    OnClick = CheckBoxKursClick
  end
  object BoxProp: TcxGroupBox
    Left = -1
    Top = 259
    Width = 490
    Height = 36
    Alignment = alTopLeft
    TabOrder = 12
    TabStop = False
    object PropEdit: TcxLookupComboBox
      Left = 8
      Top = 10
      Width = 465
      Height = 21
      Enabled = False
      Properties.ListColumns = <>
      Properties.ListOptions.ShowHeader = False
      Properties.ReadOnly = False
      EditValue = 0
      TabOrder = 0
    end
  end
  object CheckBoxProp: TcxCheckBox
    Left = -1
    Top = 244
    Width = 474
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 13
    OnClick = CheckBoxPropClick
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 201
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StProcTransaction
    Left = 56
    Top = 200
  end
  object StProcTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 88
    Top = 200
  end
  object DSetCatStud: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 136
    Top = 160
    poSQLINT64ToBCD = True
  end
  object DSourceCatStud: TDataSource
    DataSet = DSetCatStud
    Left = 184
    Top = 160
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 200
  end
  object DSetPM: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 136
    Top = 120
    poSQLINT64ToBCD = True
  end
  object DSourcePM: TDataSource
    DataSet = DSetPM
    Left = 183
    Top = 118
  end
  object DSetProp: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 56
    poSQLINT64ToBCD = True
  end
  object DSourceProp: TDataSource
    DataSet = DSetProp
    Left = 120
    Top = 56
  end
end
