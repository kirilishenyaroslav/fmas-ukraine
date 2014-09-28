object fzCurrentFilter: TfzCurrentFilter
  Left = 221
  Top = 81
  BorderStyle = bsDialog
  Caption = 'fzCurrentFilter'
  ClientHeight = 368
  ClientWidth = 429
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
    Width = 429
    Height = 338
    Align = alTop
    Shape = bsFrame
  end
  object BoxSmeta: TcxGroupBox
    Left = 3
    Top = 226
    Width = 423
    Height = 36
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 11
    TabStop = False
    object EditSmeta: TcxButtonEdit
      Left = 5
      Top = 10
      Width = 60
      Height = 21
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
      TabOrder = 0
      OnExit = EditSmetaExit
    end
    object LabelSmetaData: TcxLabel
      Left = 65
      Top = 10
      Width = 352
      Height = 21
      AutoSize = False
      ParentColor = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 1
      Caption = ''
    end
  end
  object YesBtn: TcxButton
    Left = 264
    Top = 344
    Width = 65
    Height = 23
    Action = Action1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 344
    Top = 344
    Width = 65
    Height = 23
    Cancel = True
    Caption = 'CancelBtn'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object BoxKodSetup: TcxGroupBox
    Left = 3
    Top = 16
    Width = 423
    Height = 37
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 3
    TabStop = False
    object MonthesList1: TcxComboBox
      Left = 5
      Top = 10
      Width = 148
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'January'
        'February')
      TabOrder = 0
    end
    object YearSpinEdit1: TcxSpinEdit
      Left = 150
      Top = 10
      Width = 47
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.CanEdit = False
      Properties.MaxValue = 2100.000000000000000000
      Properties.MinValue = 1995.000000000000000000
      TabOrder = 1
      Value = 2000
    end
    object MonthesList2: TcxComboBox
      Left = 225
      Top = 10
      Width = 148
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'January'
        'February')
      TabOrder = 2
    end
    object YearSpinEdit2: TcxSpinEdit
      Left = 370
      Top = 10
      Width = 47
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.CanEdit = False
      Properties.MaxValue = 2100.000000000000000000
      Properties.MinValue = 1995.000000000000000000
      TabOrder = 3
      Value = 2000
    end
    object cxLabel1: TcxLabel
      Left = 194
      Top = 12
      Width = 32
      Height = 17
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
  object CheckBoxKodSetup: TcxCheckBox
    Left = 3
    Top = 0
    Width = 422
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 2
    OnClick = CheckBoxKodSetupClick
  end
  object CheckBoxDepartment: TcxCheckBox
    Left = 3
    Top = 157
    Width = 423
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 8
    OnClick = CheckBoxDepartmentClick
  end
  object BoxDepartment: TcxGroupBox
    Left = 3
    Top = 175
    Width = 423
    Height = 36
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 9
    TabStop = False
    object EditDepartment: TcxButtonEdit
      Left = 5
      Top = 10
      Width = 60
      Height = 21
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
      TabOrder = 0
      OnExit = EditDepartmentExit
    end
    object LabelDepartmentData: TcxLabel
      Left = 65
      Top = 10
      Width = 352
      Height = 21
      AutoSize = False
      ParentColor = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 1
      Caption = ''
    end
  end
  object CheckBoxSmeta: TcxCheckBox
    Left = 3
    Top = 210
    Width = 423
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 10
    OnClick = CheckBoxSmetaClick
  end
  object CheckBoxIdMan: TcxCheckBox
    Left = 3
    Top = 52
    Width = 417
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 4
    OnClick = k
  end
  object BoxIdMan: TcxGroupBox
    Left = 3
    Top = 70
    Width = 423
    Height = 36
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 5
    TabStop = False
    object EditMan: TcxButtonEdit
      Left = 5
      Top = 10
      Width = 60
      Height = 21
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
      TabOrder = 0
    end
    object LabelManData: TcxLabel
      Left = 65
      Top = 10
      Width = 352
      Height = 21
      AutoSize = False
      ParentColor = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 1
      Caption = ''
    end
  end
  object CheckBoxVidOpl: TcxCheckBox
    Left = 2
    Top = 105
    Width = 424
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 6
    OnClick = CheckBoxVidOplClick
  end
  object BoxVidOpl: TcxGroupBox
    Left = 2
    Top = 123
    Width = 423
    Height = 36
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 7
    TabStop = False
    object EditVidOpl: TcxButtonEdit
      Left = 5
      Top = 10
      Width = 60
      Height = 21
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
      TabOrder = 0
      OnExit = EditVidOplExit
    end
    object LabelVidOplData: TcxLabel
      Left = 65
      Top = 10
      Width = 352
      Height = 21
      AutoSize = False
      ParentColor = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 1
      Caption = ''
    end
  end
  object CheckBoxOperationsFilter: TcxCheckBox
    Left = 4
    Top = 314
    Width = 423
    Height = 21
    Properties.DisplayUnchecked = 'False'
    State = cbsChecked
    TabOrder = 14
    OnClick = CheckBoxOperationsFilterClick
  end
  object CheckBoxPrikaz: TcxCheckBox
    Left = 3
    Top = 260
    Width = 423
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 12
    OnClick = CheckBoxPrikazClick
  end
  object BoxPrikaz: TcxGroupBox
    Left = 3
    Top = 276
    Width = 423
    Height = 36
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 13
    TabStop = False
    object EditPrikaz: TcxMaskEdit
      Left = 6
      Top = 10
      Width = 411
      Height = 21
      TabOrder = 0
      OnKeyPress = EditPrikazKeyPress
    end
  end
  object ActionList: TActionList
    Left = 67
    Top = 282
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
  end
end
