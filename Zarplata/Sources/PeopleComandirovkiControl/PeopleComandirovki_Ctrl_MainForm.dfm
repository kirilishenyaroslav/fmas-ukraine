object FSp_People_WorkMode_Control: TFSp_People_WorkMode_Control
  Left = 400
  Top = 264
  BorderStyle = bsDialog
  Caption = 'FSp_People_WorkMode_Control'
  ClientHeight = 342
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object IdentificationBox: TcxGroupBox
    Left = 0
    Top = 0
    Width = 425
    Height = 121
    Alignment = alTopLeft
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    LookAndFeel.NativeStyle = False
    ParentFont = False
    TabOrder = 0
    TabStop = False
    object PeopleLabel: TcxLabel
      Left = 8
      Top = 18
      Width = 409
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = 'PeopleLabel'
    end
    object PeopleEdit: TcxMaskEdit
      Left = 8
      Top = 40
      Width = 409
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      TabOrder = 0
    end
    object WorkDogLabel: TcxLabel
      Left = 8
      Top = 66
      Width = 409
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = 'WorkDogLabel'
    end
    object cxMaskEdit1: TcxMaskEdit
      Left = 8
      Top = 88
      Width = 409
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      TabOrder = 3
    end
  end
  object PeriodBox: TcxGroupBox
    Left = 0
    Top = 123
    Width = 425
    Height = 166
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TabStop = False
    object DateBegLabel: TcxLabel
      Left = 6
      Top = 16
      Width = 113
      Height = 19
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object DateBeg: TcxDateEdit
      Left = 119
      Top = 14
      Width = 97
      Height = 24
      Properties.DateButtons = [btnToday]
      TabOrder = 1
      EditValue = 0d
    end
    object DateEndLabel: TcxLabel
      Left = 8
      Top = 39
      Width = 105
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object DateEnd: TcxDateEdit
      Left = 118
      Top = 40
      Width = 97
      Height = 24
      Properties.DateButtons = [btnToday]
      Properties.DateOnError = deToday
      Properties.MaxDate = 55153.000000000000000000
      Properties.MinDate = 37987.000000000000000000
      TabOrder = 3
      EditValue = 37987d
    end
    object cxLabel1: TcxLabel
      Left = 265
      Top = 11
      Width = 151
      Height = 19
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      Caption = #1057#1077#1088#1077#1076#1085#1108' '#1079#1085#1072#1095#1077#1085#1085#1103
    end
    object AvgCalc: TcxCalcEdit
      Left = 328
      Top = 31
      Width = 87
      Height = 24
      EditValue = 0.000000000000000000
      Enabled = False
      TabOrder = 5
    end
    object EditSmeta: TcxButtonEdit
      Left = 158
      Top = 84
      Width = 65
      Height = 24
      Enabled = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d?\d?\d?\d?\d?\d?\d?\d?'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = EditSmetaPropertiesButtonClick
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 6
      OnExit = EditSmetaExit
    end
    object LabelSmetaName: TcxLabel
      Left = 224
      Top = 84
      Width = 193
      Height = 24
      TabStop = False
      AutoSize = False
      Enabled = False
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Style.BorderColor = clMedGray
      Style.BorderStyle = ebsSingle
      Style.Color = clBtnHighlight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
      Caption = ''
    end
    object cxLabel2: TcxLabel
      Left = 21
      Top = 85
      Width = 70
      Height = 19
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 8
      Caption = #1041#1102#1076#1078#1077#1090':'
    end
    object CheckBox1: TCheckBox
      Left = 92
      Top = 87
      Width = 64
      Height = 17
      Caption = #1040#1042#1058#1054
      Checked = True
      State = cbChecked
      TabOrder = 9
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 260
      Top = 34
      Width = 66
      Height = 17
      Caption = #1040#1042#1058#1054
      Checked = True
      State = cbChecked
      TabOrder = 10
      OnClick = CheckBox2Click
    end
    object EditVidOpl: TcxButtonEdit
      Left = 158
      Top = 116
      Width = 65
      Height = 24
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
      TabOrder = 11
      OnExit = EditVidOplExit
    end
    object LabelVidOplData: TcxLabel
      Left = 224
      Top = 116
      Width = 193
      Height = 24
      TabStop = False
      AutoSize = False
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Style.BorderColor = clMedGray
      Style.BorderStyle = ebsSingle
      Style.Color = clBtnHighlight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 12
      Caption = ''
    end
    object cxLabel3: TcxLabel
      Left = 23
      Top = 118
      Width = 106
      Height = 19
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 13
      Caption = #1042#1080#1076' '#1086#1087#1077#1088#1072#1094#1110#1111':'
    end
  end
  object YesBtn: TcxButton
    Left = 248
    Top = 305
    Width = 81
    Height = 25
    Action = ActionYes
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 336
    Top = 305
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object Actions: TActionList
    Left = 24
    Top = 8
    object ActionYes: TAction
      Caption = 'ActionIns'
      ShortCut = 121
      OnExecute = ActionYesExecute
    end
  end
end
