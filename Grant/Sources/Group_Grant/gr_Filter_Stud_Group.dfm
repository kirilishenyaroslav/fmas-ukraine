object FFilter: TFFilter
  Left = 970
  Top = 503
  BorderStyle = bsSingle
  Caption = 'FFilter'
  ClientHeight = 421
  ClientWidth = 294
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
  object Panel1: TPanel
    Left = 0
    Top = 380
    Width = 294
    Height = 41
    Align = alBottom
    TabOrder = 0
    object ButtonYes: TcxButton
      Left = 120
      Top = 8
      Width = 81
      Height = 25
      Action = ActionYes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
    end
    object ButtonCancel: TcxButton
      Left = 208
      Top = 8
      Width = 81
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
    end
  end
  object GroupBoxPeriod: TcxGroupBox
    Left = 8
    Top = 0
    Width = 281
    Height = 57
    Alignment = alTopLeft
    TabOrder = 1
    object EditMonth: TcxComboBox
      Left = 128
      Top = 29
      Width = 145
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'January'
        'February')
      TabOrder = 0
    end
    object EditYear: TcxSpinEdit
      Left = 7
      Top = 29
      Width = 85
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.CanEdit = False
      Properties.MaxValue = 2100.000000000000000000
      Properties.MinValue = 2000.000000000000000000
      TabOrder = 1
      Value = 2006
    end
    object CheckBoxPeriod: TcxCheckBox
      Left = 7
      Top = 8
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckBoxPeriodPropertiesChange
      State = cbsChecked
      TabOrder = 2
    end
  end
  object GroupBoxContractButget: TcxGroupBox
    Left = 8
    Top = 56
    Width = 281
    Height = 41
    Alignment = alTopLeft
    TabOrder = 2
    object CheckBoxContrakt: TcxCheckBox
      Left = 8
      Top = 15
      Width = 121
      Height = 21
      Properties.Alignment = taRightJustify
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckBoxContraktPropertiesChange
      TabOrder = 0
    end
    object CheckBoxButget: TcxCheckBox
      Left = 152
      Top = 15
      Width = 121
      Height = 21
      Properties.Alignment = taRightJustify
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckBoxButgetPropertiesChange
      TabOrder = 1
    end
  end
  object GroupBoxDep: TcxGroupBox
    Left = 7
    Top = 96
    Width = 282
    Height = 57
    Alignment = alTopLeft
    TabOrder = 3
    object EditDep: TcxButtonEdit
      Left = 8
      Top = 30
      Width = 265
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = EditDepPropertiesButtonClick
      TabOrder = 0
    end
    object CheckBoxDep: TcxCheckBox
      Left = 8
      Top = 8
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckBoxDepPropertiesChange
      TabOrder = 1
    end
  end
  object GroupBoxProp: TcxGroupBox
    Left = 6
    Top = 152
    Width = 283
    Height = 57
    Alignment = alTopLeft
    TabOrder = 4
    object CheckBoxProp: TcxCheckBox
      Left = 8
      Top = 8
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckBoxPropPropertiesChange
      TabOrder = 0
    end
    object EditProp: TcxLookupComboBox
      Left = 8
      Top = 26
      Width = 265
      Height = 21
      Enabled = False
      Properties.ListColumns = <>
      Properties.ListOptions.ShowHeader = False
      Properties.ReadOnly = False
      EditValue = 0
      TabOrder = 1
    end
  end
  object GroupBoxFiz: TcxGroupBox
    Left = 7
    Top = 208
    Width = 282
    Height = 57
    Alignment = alTopLeft
    TabOrder = 5
    object CheckBoxFiz: TcxCheckBox
      Left = 8
      Top = 8
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckBoxFizPropertiesChange
      TabOrder = 0
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 6
    Top = 264
    Width = 282
    Height = 57
    Alignment = alTopLeft
    TabOrder = 7
    object CheckBoxCat: TcxCheckBox
      Left = 8
      Top = 8
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckBoxCatPropertiesChange
      TabOrder = 0
    end
    object EditCat: TcxLookupComboBox
      Left = 8
      Top = 26
      Width = 265
      Height = 21
      Enabled = False
      Properties.ListColumns = <>
      Properties.ListOptions.ShowHeader = False
      Properties.ReadOnly = False
      EditValue = 0
      TabOrder = 1
    end
  end
  object EditMan: TcxButtonEdit
    Left = 13
    Top = 237
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
    Properties.OnButtonClick = EditManPropertiesButtonClick
    Properties.OnEditValueChanged = EditManPropertiesEditValueChanged
    TabOrder = 6
  end
  object EditManFio: TcxLabel
    Left = 75
    Top = 237
    Width = 211
    Height = 21
    AutoSize = False
    Enabled = False
    ParentColor = False
    Style.BorderColor = clHotLight
    Style.BorderStyle = ebsSingle
    Style.Color = clWhite
    TabOrder = 8
    Caption = ''
  end
  object cxGroupBox2: TcxGroupBox
    Left = 6
    Top = 320
    Width = 282
    Height = 57
    Alignment = alTopLeft
    TabOrder = 9
    object cxCheckBoxSB: TcxCheckBox
      Left = 8
      Top = 8
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBoxSBPropertiesChange
      TabOrder = 0
    end
    object cxLabel1: TcxLabel
      Left = 12
      Top = 32
      Width = 21
      Height = 17
      TabOrder = 1
      Caption = #1054#1090':'
    end
    object cxLabel2: TcxLabel
      Left = 146
      Top = 32
      Width = 26
      Height = 17
      TabOrder = 2
      Caption = #1044#1086':'
    end
    object cxCurrencyEditOt: TcxCurrencyEdit
      Left = 34
      Top = 28
      Width = 108
      Height = 21
      Enabled = False
      Properties.DisplayFormat = '0.00'
      Properties.MaxValue = 5.000000000000000000
      Properties.MinValue = 2.000000000000000000
      TabOrder = 3
    end
    object cxCurrencyEditDo: TcxCurrencyEdit
      Left = 169
      Top = 28
      Width = 109
      Height = 21
      Enabled = False
      Properties.DisplayFormat = '0.00'
      Properties.MaxValue = 5.000000000000000000
      Properties.MinValue = 2.000000000000000000
      TabOrder = 4
    end
  end
  object Actions: TActionList
    Left = 24
    Top = 389
    object ActionYes: TAction
      Caption = 'ActionYes'
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
      OnExecute = ActionYesExecute
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
    end
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = Action1Execute
    end
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 72
    Top = 384
  end
  object DB: TpFIBDatabase
    DBName = 'F:\FULL_DB.IB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 65528
    Top = 384
  end
  object DSourceProp: TDataSource
    DataSet = DSetProp
    Left = 224
    Top = 168
  end
  object DSetProp: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    Left = 192
    Top = 168
    poSQLINT64ToBCD = True
  end
  object DSetCat: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    Left = 192
    Top = 280
    poSQLINT64ToBCD = True
  end
  object DSourceCat: TDataSource
    DataSet = DSetCat
    Left = 216
    Top = 280
  end
end
