object FCtrlStudTerms: TFCtrlStudTerms
  Left = 564
  Top = 476
  BorderStyle = bsDialog
  Caption = 'FCtrlStudTerms'
  ClientHeight = 224
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object YesBtn: TcxButton
    Left = 360
    Top = 173
    Width = 81
    Height = 25
    Action = ActionYes
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 456
    Top = 173
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object BoxMan: TcxGroupBox
    Left = 0
    Top = -3
    Width = 553
    Height = 44
    Alignment = alTopLeft
    Caption = 'BoxMan'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TabStop = False
    object LabelMan: TcxLabel
      Left = 0
      Top = 15
      Width = 137
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = 'LabelMan'
    end
    object EditMan: TcxButtonEdit
      Left = 136
      Top = 13
      Width = 409
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
          Visible = False
        end>
      Properties.MaskKind = emkRegExpr
      Properties.ReadOnly = True
      Style.Color = clWindow
      TabOrder = 0
    end
  end
  object BoxDates: TcxGroupBox
    Left = 0
    Top = 40
    Width = 553
    Height = 41
    Alignment = alTopLeft
    Caption = 'BoxDates'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TabStop = False
    object DateBegLabel: TcxLabel
      Left = 160
      Top = 15
      Width = 105
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object EditDateBeg: TcxDateEdit
      Left = 263
      Top = 14
      Width = 97
      Height = 24
      ImeMode = imHanguel
      Properties.DateButtons = [btnToday]
      Properties.InputKind = ikMask
      Properties.MaxDate = 55153.000000000000000000
      Properties.MinDate = 36526.000000000000000000
      TabOrder = 1
      EditValue = 38353d
    end
    object EditDateEnd: TcxDateEdit
      Left = 357
      Top = 14
      Width = 97
      Height = 24
      Properties.DateButtons = [btnToday]
      Properties.InputKind = ikMask
      Properties.MaxDate = 55153.000000000000000000
      Properties.MinDate = 36526.000000000000000000
      TabOrder = 2
      EditValue = 38353d
    end
    object DateEndLabel: TcxLabel
      Left = 456
      Top = 16
      Width = 89
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object LabelKurs: TcxLabel
      Left = 8
      Top = 16
      Width = 73
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Caption = 'LabelKurs'
    end
    object SpinEditKurs: TcxSpinEdit
      Left = 88
      Top = 13
      Width = 41
      Height = 24
      Properties.MaxValue = 6.000000000000000000
      Properties.MinValue = 1.000000000000000000
      TabOrder = 0
      Value = 1
      OnClick = SpinEditKursClick
    end
  end
  object BoxVidOpl: TcxGroupBox
    Left = 0
    Top = 83
    Width = 554
    Height = 86
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    TabStop = False
    object EditDepartment: TcxButtonEdit
      Left = 109
      Top = 31
      Width = 60
      Height = 24
      ParentFont = False
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
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      OnExit = EditDepartmentExit
    end
    object LabelDepartment: TcxLabel
      Left = 6
      Top = 33
      Width = 105
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object ComboBoxCategory: TcxLookupComboBox
      Left = 109
      Top = 10
      Width = 436
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'ID_CAT_STUD'
      Properties.ListColumns = <
        item
          FieldName = 'NAME_FULL'
        end>
      Properties.ListOptions.ShowHeader = False
      TabOrder = 0
    end
    object LabelCategory: TcxLabel
      Left = 5
      Top = 11
      Width = 106
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Caption = 'LabelCategory'
    end
    object PrikazMaskEdit: TcxMaskEdit
      Left = 109
      Top = 56
      Width = 436
      Height = 21
      Properties.MaskKind = emkRegExprEx
      Properties.MaxLength = 0
      TabOrder = 4
      Visible = False
    end
    object PrikazLabel: TcxLabel
      Left = 2
      Top = 56
      Width = 108
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Visible = False
      Caption = #1053#1072#1082#1072#1079
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 204
    Width = 557
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Width = 170
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Width = 170
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end>
    PaintStyle = stpsOffice11
    LookAndFeel.Kind = lfStandard
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object EditDepartmentData: TcxMaskEdit
    Left = 171
    Top = 116
    Width = 374
    Height = 21
    TabOrder = 6
  end
  object Actions: TActionList
    Left = 40
    Top = 176
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
      OnExecute = ActionYesExecute
    end
    object ActionF9: TAction
      Caption = 'ActionF9'
      ShortCut = 120
      OnExecute = ActionF9Execute
    end
    object ActionEnter: TAction
      Caption = 'ActionEnter'
      ShortCut = 13
      OnExecute = ActionEnterExecute
    end
  end
end
