object fzReeDepVOFilter: TfzReeDepVOFilter
  Left = 321
  Top = 261
  BorderStyle = bsDialog
  Caption = 'fzReeDepVOFilter'
  ClientHeight = 224
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
    Height = 196
    Align = alTop
    Shape = bsFrame
  end
  object BoxSmeta: TcxGroupBox
    Left = 3
    Top = 156
    Width = 423
    Height = 36
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 8
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
    Left = 256
    Top = 200
    Width = 65
    Height = 23
    Action = Action1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 336
    Top = 200
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
    Top = -1
    Width = 423
    Height = 37
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object MonthesList1: TcxComboBox
      Left = 5
      Top = 10
      Width = 324
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'January'
        'February')
      TabOrder = 0
    end
    object YearSpinEdit1: TcxSpinEdit
      Left = 328
      Top = 10
      Width = 87
      Height = 21
      Properties.Alignment.Horz = taRightJustify
      Properties.CanEdit = False
      Properties.MaxValue = 2100.000000000000000000
      Properties.MinValue = 1995.000000000000000000
      TabOrder = 1
      Value = 2000
    end
  end
  object CheckBoxDepartment: TcxCheckBox
    Left = 3
    Top = 87
    Width = 423
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 5
    OnClick = CheckBoxDepartmentClick
  end
  object BoxDepartment: TcxGroupBox
    Left = 3
    Top = 105
    Width = 423
    Height = 36
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 6
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
    Top = 140
    Width = 423
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 7
    OnClick = CheckBoxSmetaClick
  end
  object CheckBoxVidOpl: TcxCheckBox
    Left = 2
    Top = 35
    Width = 424
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 3
    OnClick = CheckBoxVidOplClick
  end
  object BoxVidOpl: TcxGroupBox
    Left = 2
    Top = 53
    Width = 423
    Height = 36
    Alignment = alTopLeft
    Enabled = False
    TabOrder = 4
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
  object ActionList: TActionList
    Left = 67
    Top = 202
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
  end
end
