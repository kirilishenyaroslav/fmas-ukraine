object fParEditor: TfParEditor
  Left = 401
  Top = 173
  BorderStyle = bsDialog
  Caption = 'fParEditor'
  ClientHeight = 362
  ClientWidth = 474
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
  object Bevel1: TBevel
    Left = 14
    Top = 196
    Width = 360
    Height = 2
  end
  object Bevel2: TBevel
    Left = 13
    Top = 39
    Width = 360
    Height = 2
  end
  object SEYear: TcxSpinEdit
    Left = 200
    Top = 8
    Width = 57
    Height = 24
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clMaroon
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Value = 1995
  end
  object CBMonth: TcxComboBox
    Left = 80
    Top = 8
    Width = 113
    Height = 24
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clMaroon
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Text = 'CBMonth'
  end
  object meProf: TcxMaskEdit
    Left = 375
    Top = 47
    Width = 93
    Height = 24
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '(100)|(\d?\d ([,]\d\d?\d?\d?)?)'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Text = '0'
  end
  object mePens: TcxMaskEdit
    Left = 375
    Top = 71
    Width = 93
    Height = 24
    Enabled = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '(100)|(\d?\d ([,]\d\d?\d?\d?)?)'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
    Text = '0'
  end
  object meZan: TcxMaskEdit
    Left = 375
    Top = 95
    Width = 93
    Height = 24
    Enabled = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '(100)|(\d?\d ([,]\d\d?\d?\d?)?)'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Text = '0'
  end
  object meSoc: TcxMaskEdit
    Left = 375
    Top = 119
    Width = 93
    Height = 24
    Enabled = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '(100)|(\d?\d ([,]\d\d?\d?\d?)?)'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
    Text = '0'
  end
  object meNSluch: TcxMaskEdit
    Left = 375
    Top = 143
    Width = 93
    Height = 24
    Enabled = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '(100)|(\d?\d ([,]\d\d?\d?\d?)?)'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
    Text = '0'
  end
  object meInv: TcxMaskEdit
    Left = 375
    Top = 167
    Width = 93
    Height = 24
    Enabled = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '(100)|(\d?\d ([,]\d\d?\d?\d?)?)'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
    Text = '0'
  end
  object lProf: TcxLabel
    Left = 1
    Top = 49
    Width = 370
    Height = 20
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 8
  end
  object lPens: TcxLabel
    Left = 1
    Top = 73
    Width = 370
    Height = 20
    AutoSize = False
    Enabled = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 9
  end
  object lZan: TcxLabel
    Left = 1
    Top = 97
    Width = 370
    Height = 20
    AutoSize = False
    Enabled = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 10
  end
  object lSoc: TcxLabel
    Left = 1
    Top = 121
    Width = 370
    Height = 20
    AutoSize = False
    Enabled = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 11
  end
  object lNSluch: TcxLabel
    Left = 1
    Top = 145
    Width = 370
    Height = 20
    AutoSize = False
    Enabled = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 12
  end
  object lInv: TcxLabel
    Left = 1
    Top = 169
    Width = 370
    Height = 20
    AutoSize = False
    Enabled = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 13
  end
  object btnOk: TcxButton
    Left = 155
    Top = 331
    Width = 75
    Height = 25
    Action = OkAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
  end
  object btnCancel: TcxButton
    Left = 243
    Top = 331
    Width = 75
    Height = 25
    Action = CancelAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
  end
  object cxLabel1: TcxLabel
    Left = 4
    Top = 201
    Width = 370
    Height = 20
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 16
    Caption = #1028#1076#1080#1085#1080#1081' '#1089#1086#1094#1110#1072#1083#1100#1085#1080#1081' '#1085#1072#1083#1086#1075' ('#1056#1086#1073#1110#1090#1085#1080#1082#1080')'
  end
  object ESN_R: TcxMaskEdit
    Left = 375
    Top = 199
    Width = 93
    Height = 24
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '(100)|(\d?\d ([,]\d\d?\d?\d?)?)'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 17
    Text = '0'
  end
  object cxLabel2: TcxLabel
    Left = 4
    Top = 225
    Width = 370
    Height = 20
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 18
    Caption = #1028#1076#1080#1085#1080#1081' '#1089#1086#1094#1110#1072#1083#1100#1085#1080#1081' '#1085#1072#1083#1086#1075' ('#1053#1044#1063')'
  end
  object ESN_NDC: TcxMaskEdit
    Left = 375
    Top = 223
    Width = 93
    Height = 24
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '(100)|(\d?\d ([,]\d\d?\d?\d?)?)'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 19
    Text = '0'
  end
  object ESN_INV: TcxMaskEdit
    Left = 375
    Top = 247
    Width = 93
    Height = 24
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '(100)|(\d?\d ([,]\d\d?\d?\d?)?)'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 20
    Text = '0'
  end
  object cxLabel3: TcxLabel
    Left = 4
    Top = 249
    Width = 370
    Height = 20
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 21
    Caption = #1028#1076#1080#1085#1080#1081' '#1089#1086#1094#1110#1072#1083#1100#1085#1080#1081' '#1085#1072#1083#1086#1075' ('#1030#1085#1074#1072#1083#1110#1076#1080')'
  end
  object cxLabel4: TcxLabel
    Left = 4
    Top = 273
    Width = 370
    Height = 20
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 22
    Caption = #1028#1076#1080#1085#1080#1081' '#1089#1086#1094#1110#1072#1083#1100#1085#1080#1081' '#1085#1072#1083#1086#1075' ('#1051#1080#1089#1090#1080' '#1085#1077#1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1086#1089#1090#1110')'
  end
  object ESN_LL: TcxMaskEdit
    Left = 375
    Top = 271
    Width = 93
    Height = 24
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '(100)|(\d?\d ([,]\d\d?\d?\d?)?)'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 23
    Text = '0'
  end
  object ESN_DP: TcxMaskEdit
    Left = 375
    Top = 295
    Width = 93
    Height = 24
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '(100)|(\d?\d ([,]\d\d?\d?\d?)?)'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 24
    Text = '0'
  end
  object cxLabel5: TcxLabel
    Left = 4
    Top = 297
    Width = 370
    Height = 20
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 25
    Caption = #1028#1076#1080#1085#1080#1081' '#1089#1086#1094#1110#1072#1083#1100#1085#1080#1081' '#1085#1072#1083#1086#1075' ('#1044#1086#1075#1086#1074#1086#1088#1080' '#1087#1110#1076#1088#1103#1076#1091')'
  end
  object DSet: TpFIBDataSet
    poSQLINT64ToBCD = True
  end
  object Write: TpFIBTransaction
    TimeoutAction = TARollback
    Top = 32
  end
  object StoredProc: TpFIBStoredProc
    Transaction = Write
    Top = 64
  end
  object ActionList1: TActionList
    Top = 96
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
end
