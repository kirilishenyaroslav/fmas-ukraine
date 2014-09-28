object fmFilterForm: TfmFilterForm
  Left = 752
  Top = 495
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'fmFilterForm'
  ClientHeight = 429
  ClientWidth = 512
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
  object OkBtn: TcxButton
    Left = 350
    Top = 384
    Width = 75
    Height = 25
    Action = OkAction
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object CancelBtn: TcxButton
    Left = 430
    Top = 384
    Width = 75
    Height = 25
    Action = CancelAction
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 512
    Height = 60
    Align = alTop
    TabOrder = 2
    object CheckBoxMan: TcxCheckBox
      Left = 12
      Top = 4
      Width = 373
      Height = 21
      Properties.DisplayUnchecked = 'False'
      State = cbsChecked
      TabOrder = 0
      OnClick = CheckBoxManClick
    end
    object ManBtnEdit: TcxButtonEdit
      Left = 24
      Top = 28
      Width = 89
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+'
      Properties.MaxLength = 0
      Properties.OnButtonClick = ManBtnEditPropertiesButtonClick
      TabOrder = 1
      OnExit = ManBtnEditExit
      OnKeyPress = ManBtnEditKeyPress
    end
    object ManTextEdit: TcxTextEdit
      Left = 111
      Top = 28
      Width = 274
      Height = 21
      TabStop = False
      Properties.ReadOnly = True
      TabOrder = 2
      OnExit = DepTextEditExit
      OnKeyPress = DepTextEditKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 60
    Width = 512
    Height = 60
    Align = alTop
    TabOrder = 3
    object CheckBoxDepartment: TcxCheckBox
      Left = 12
      Top = 4
      Width = 373
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 0
      OnClick = CheckBoxDepartmentClick
    end
    object DepBtnEdit: TcxButtonEdit
      Left = 24
      Top = 28
      Width = 89
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+'
      Properties.MaxLength = 0
      Properties.OnButtonClick = DepBtnEditPropertiesButtonClick
      Properties.OnChange = DepBtnEditPropertiesChange
      TabOrder = 1
      OnExit = DepTextEditExit
      OnKeyPress = DepTextEditKeyPress
    end
    object DepTextEdit: TcxTextEdit
      Left = 111
      Top = 28
      Width = 274
      Height = 21
      TabStop = False
      Enabled = False
      Properties.ReadOnly = True
      TabOrder = 2
      OnExit = DepTextEditExit
      OnKeyPress = DepTextEditKeyPress
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 120
    Width = 512
    Height = 65
    Align = alTop
    TabOrder = 4
    object CheckBoxProp: TcxCheckBox
      Left = 12
      Top = 4
      Width = 373
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 0
      OnClick = CheckBoxPropClick
    end
    object PropEdit: TcxLookupComboBox
      Left = 24
      Top = 28
      Width = 361
      Height = 21
      Enabled = False
      Properties.ListColumns = <>
      Properties.ListOptions.ShowHeader = False
      Properties.ReadOnly = False
      EditValue = 0
      TabOrder = 1
    end
    object RB_HasProp: TcxRadioButton
      Left = 392
      Top = 23
      Width = 129
      Height = 17
      Caption = 'RB_HasProp'
      Checked = True
      Enabled = False
      TabOrder = 2
      TabStop = True
    end
    object RB_HasNotProp: TcxRadioButton
      Left = 392
      Top = 42
      Width = 129
      Height = 17
      Caption = 'RB_HasNotProp'
      Enabled = False
      TabOrder = 3
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 185
    Width = 512
    Height = 65
    Align = alTop
    TabOrder = 5
    object CheckBoxPriv: TcxCheckBox
      Left = 12
      Top = 4
      Width = 373
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 0
      OnClick = CheckBoxPrivClick
    end
    object PrivEdit: TcxButtonEdit
      Left = 24
      Top = 28
      Width = 361
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = PrivEditPropertiesButtonClick
      TabOrder = 1
    end
    object RB_HasPriv: TcxRadioButton
      Left = 392
      Top = 23
      Width = 129
      Height = 17
      Caption = 'RB_HasPriv'
      Checked = True
      Enabled = False
      TabOrder = 2
      TabStop = True
    end
    object RB_HasNotPriv: TcxRadioButton
      Left = 392
      Top = 42
      Width = 129
      Height = 17
      Caption = 'RB_HasNotPriv'
      Enabled = False
      TabOrder = 3
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 250
    Width = 512
    Height = 65
    Align = alTop
    TabOrder = 6
    object CheckBoxRaise: TcxCheckBox
      Left = 12
      Top = 4
      Width = 373
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 0
      OnClick = CheckBoxRaiseClick
    end
    object RaiseEdit: TcxButtonEdit
      Left = 24
      Top = 28
      Width = 361
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = RaiseEditPropertiesButtonClick
      TabOrder = 1
    end
    object RB_HasRaise: TcxRadioButton
      Left = 392
      Top = 23
      Width = 129
      Height = 17
      Caption = 'RB_HasRaise'
      Checked = True
      Enabled = False
      TabOrder = 2
      TabStop = True
    end
    object RB_HasNotRaise: TcxRadioButton
      Left = 392
      Top = 42
      Width = 129
      Height = 17
      Caption = 'RB_HasNotRaise'
      Enabled = False
      TabOrder = 3
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 315
    Width = 512
    Height = 60
    Align = alTop
    TabOrder = 7
    object CheckBoxPeriod: TcxCheckBox
      Left = 12
      Top = 4
      Width = 313
      Height = 21
      Properties.DisplayUnchecked = 'False'
      State = cbsChecked
      TabOrder = 0
      OnClick = CheckBoxPeriodClick
    end
    object DateEditBeg: TcxDateEdit
      Left = 24
      Top = 28
      Width = 121
      Height = 21
      Properties.DateButtons = [btnToday]
      TabOrder = 1
    end
    object cxLabel2: TcxLabel
      Left = 155
      Top = 19
      Width = 17
      Height = 31
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -24
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = '-'
    end
    object DateEditEnd: TcxDateEdit
      Left = 178
      Top = 28
      Width = 121
      Height = 21
      Properties.DateButtons = [btnToday]
      TabOrder = 3
    end
    object LeavedJob: TcxCheckBox
      Left = 328
      Top = 3
      Width = 185
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = 'LeavedJob'
      TabOrder = 4
    end
    object CheckBoxNotMainJob: TcxCheckBox
      Left = 328
      Top = 35
      Width = 185
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = 'CheckBoxNotMainJob'
      State = cbsChecked
      TabOrder = 5
      OnClick = CheckBoxNotMainJobClick
    end
    object CheckBoxMainJob: TcxCheckBox
      Left = 328
      Top = 19
      Width = 185
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = 'CheckBoxMainJob'
      State = cbsChecked
      TabOrder = 6
      OnClick = CheckBoxMainJobClick
    end
  end
  object ActionList1: TActionList
    Left = 8
    Top = 383
    object OkAction: TAction
      Caption = 'OkAction'
      ShortCut = 121
      OnExecute = OkActionExecute
    end
    object CancelAction: TAction
      Caption = 'CancelAction'
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
  end
  object DB: TpFIBDatabase
    DefaultTransaction = pFIBTransaction1
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 360
  end
  object DSourceProp: TDataSource
    DataSet = DSetProp
    Left = 424
  end
  object DSetProp: TpFIBDataSet
    Database = DB
    Transaction = pFIBTransaction1
    Left = 392
    poSQLINT64ToBCD = True
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 456
  end
end
