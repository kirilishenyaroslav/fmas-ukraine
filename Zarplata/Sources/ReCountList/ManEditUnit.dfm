object ManEditForm: TManEditForm
  Left = 497
  Top = 342
  ActiveControl = EditMan
  BorderStyle = bsDialog
  Caption = 'ManEditForm'
  ClientHeight = 252
  ClientWidth = 505
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 505
    Height = 217
    Align = alTop
    Caption = 'ManEditBox'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object PeriodBegLabel: TLabel
      Left = 139
      Top = 128
      Width = 90
      Height = 13
      Caption = 'PeriodBegLabel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PeriodEndLabel: TLabel
      Left = 139
      Top = 159
      Width = 90
      Height = 13
      Caption = 'PeriodEndLabel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object YearBegEdit: TcxSpinEdit
      Left = 291
      Top = 124
      Width = 57
      Height = 24
      ParentFont = False
      Properties.MaxValue = 3000.000000000000000000
      Properties.MinValue = 2004.000000000000000000
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 4
      Value = 2005
    end
    object YearEndEdit: TcxSpinEdit
      Left = 291
      Top = 156
      Width = 57
      Height = 24
      ParentFont = False
      Properties.MaxValue = 3000.000000000000000000
      Properties.MinValue = 2004.000000000000000000
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 6
      Value = 2005
    end
    object EditMan: TcxButtonEdit
      Left = 5
      Top = 42
      Width = 108
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
      Properties.OnButtonClick = EditManPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      OnExit = EditManExit
    end
    object LabelManData: TcxLabel
      Left = 112
      Top = 42
      Width = 361
      Height = 24
      AutoSize = False
      ParentColor = False
      ParentFont = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 7
      Caption = ''
    end
    object MonthBegEdit: TcxSpinEdit
      Left = 243
      Top = 124
      Width = 49
      Height = 24
      ParentFont = False
      Properties.MaxValue = 12.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 3
      Value = 12
    end
    object MonthEndEdit: TcxSpinEdit
      Left = 243
      Top = 156
      Width = 49
      Height = 24
      ParentFont = False
      Properties.MaxValue = 12.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 5
      Value = 12
    end
    object ManLabel: TcxRadioButton
      Left = 8
      Top = 23
      Width = 113
      Height = 17
      Caption = 'ManLabel'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = ManLabelClick
    end
    object DepLabel: TcxRadioButton
      Left = 8
      Top = 71
      Width = 113
      Height = 17
      Caption = #1055#1086' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = DepLabelClick
    end
    object EditDep: TcxButtonEdit
      Left = 5
      Top = 90
      Width = 108
      Height = 24
      Enabled = False
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
      Properties.OnButtonClick = EditDepPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
      OnExit = EditDepExit
    end
    object LabelDepData: TcxLabel
      Left = 112
      Top = 90
      Width = 361
      Height = 24
      AutoSize = False
      Enabled = False
      ParentColor = False
      ParentFont = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 9
      Caption = ''
    end
  end
  object OkBtn: TcxButton
    Left = 344
    Top = 224
    Width = 75
    Height = 25
    Caption = 'OkBtn'
    TabOrder = 1
    OnClick = OkBtnClick
  end
  object CancelBtn: TcxButton
    Left = 424
    Top = 224
    Width = 75
    Height = 25
    Caption = 'CancelBtn'
    ModalResult = 2
    TabOrder = 2
    OnClick = CancelBtnClick
  end
  object ActionList: TActionList
    Left = 128
    Top = 160
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      OnExecute = ActionYesExecute
    end
    object ActionNo: TAction
      Caption = 'ActionNo'
      ShortCut = 27
      OnExecute = ActionNoExecute
    end
  end
end
