object UVVedViewFilter: TUVVedViewFilter
  Left = 331
  Top = 229
  BorderStyle = bsDialog
  Caption = 'UVVedViewFilter'
  ClientHeight = 291
  ClientWidth = 240
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object BoxSmeta: TcxGroupBox
    Left = 0
    Top = 226
    Width = 241
    Height = 36
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 9
    TabStop = False
    object EditSmeta: TcxButtonEdit
      Left = 5
      Top = 10
      Width = 232
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = EditSmetaPropertiesButtonClick
      TabOrder = 0
    end
  end
  object YesBtn: TcxButton
    Left = 112
    Top = 266
    Width = 57
    Height = 23
    Caption = 'YesBtn'
    Default = True
    TabOrder = 10
    OnClick = YesBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 176
    Top = 266
    Width = 57
    Height = 23
    Cancel = True
    Caption = 'CancelBtn'
    TabOrder = 11
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object BoxKodSetup: TcxGroupBox
    Left = 0
    Top = 16
    Width = 241
    Height = 37
    Alignment = alTopLeft
    TabOrder = 1
    TabStop = False
    object MonthesList: TcxComboBox
      Left = 5
      Top = 10
      Width = 156
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'January'
        'February')
      TabOrder = 0
    end
    object YearSpinEdit: TcxSpinEdit
      Left = 158
      Top = 10
      Width = 78
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaxValue = 2100.000000000000000000
      Properties.MinValue = 1995.000000000000000000
      TabOrder = 1
      Value = 2000
    end
  end
  object CheckBoxKodSetup: TcxCheckBox
    Left = 0
    Top = 0
    Width = 209
    Height = 21
    Properties.DisplayUnchecked = 'False'
    State = cbsChecked
    TabOrder = 0
    OnClick = CheckBoxKodSetupClick
  end
  object CheckBoxKod: TcxCheckBox
    Left = 0
    Top = 51
    Width = 209
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 2
    OnClick = CheckBoxKodClick
  end
  object BoxKod: TcxGroupBox
    Left = 0
    Top = 69
    Width = 241
    Height = 36
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 3
    TabStop = False
    object EditKod: TcxMaskEdit
      Left = 5
      Top = 10
      Width = 232
      Height = 21
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d?\d?\d?\d?\d?\d?\d?\d'
      Properties.MaxLength = 0
      TabOrder = 0
    end
  end
  object CheckBoxDepartment: TcxCheckBox
    Left = 0
    Top = 157
    Width = 209
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 6
    OnClick = CheckBoxDepartmentClick
  end
  object BoxDepartment: TcxGroupBox
    Left = 0
    Top = 175
    Width = 241
    Height = 36
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 7
    TabStop = False
    object EditDepartment: TcxButtonEdit
      Left = 5
      Top = 10
      Width = 232
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      TabOrder = 0
    end
  end
  object CheckBoxSmeta: TcxCheckBox
    Left = 0
    Top = 210
    Width = 208
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 8
    OnClick = CheckBoxSmetaClick
  end
  object CheckBoxIdMan: TcxCheckBox
    Left = 0
    Top = 102
    Width = 209
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 4
    OnClick = CheckBoxIdManClick
  end
  object BoxIdMan: TcxGroupBox
    Left = 0
    Top = 120
    Width = 241
    Height = 36
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 5
    TabStop = False
    object EditMan: TcxButtonEdit
      Left = 5
      Top = 10
      Width = 232
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = EditManPropertiesButtonClick
      TabOrder = 0
    end
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 168
    Top = 56
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 168
    Top = 85
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 168
    Top = 113
  end
end
