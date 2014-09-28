object FZ_DopNach_Sp_Control: TFZ_DopNach_Sp_Control
  Left = 628
  Top = 223
  BorderStyle = bsDialog
  Caption = 'FZ_DopNach_Sp_Control'
  ClientHeight = 352
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object YesBtn: TcxButton
    Left = 376
    Top = 317
    Width = 81
    Height = 25
    Action = ActionYes
    TabOrder = 7
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 464
    Top = 317
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 8
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
      TabStop = False
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
      Properties.OnButtonClick = EditManPropertiesButtonClick
      Style.Color = clWindow
      TabOrder = 0
    end
  end
  object BoxDatesSum: TcxGroupBox
    Left = 0
    Top = 40
    Width = 553
    Height = 75
    Alignment = alTopLeft
    Caption = 'BoxMain'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TabStop = False
    object Bevel2: TBevel
      Left = 7
      Top = 41
      Width = 537
      Height = 1
      Style = bsRaised
    end
    object DateBegLabel: TcxLabel
      Left = 160
      Top = 15
      Width = 105
      Height = 20
      TabStop = False
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
      Properties.DateButtons = [btnToday]
      Properties.MaxDate = 55153.000000000000000000
      Properties.MinDate = 36526.000000000000000000
      TabOrder = 0
      EditValue = 38353d
    end
    object EditDateEnd: TcxDateEdit
      Left = 357
      Top = 14
      Width = 97
      Height = 24
      Properties.DateButtons = [btnToday]
      Properties.DateOnError = deToday
      Properties.MaxDate = 55153.000000000000000000
      Properties.MinDate = 36526.000000000000000000
      TabOrder = 1
      EditValue = 38353d
    end
    object DateEndLabel: TcxLabel
      Left = 456
      Top = 16
      Width = 89
      Height = 20
      TabStop = False
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
    object LabelSumma: TcxLabel
      Left = 283
      Top = 48
      Width = 137
      Height = 20
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Caption = 'LabelSumma'
    end
    object EditSumma: TcxMaskEdit
      Left = 424
      Top = 46
      Width = 121
      Height = 24
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 2
    end
  end
  object BoxVidOpl: TcxGroupBox
    Left = -1
    Top = 230
    Width = 554
    Height = 39
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    TabStop = False
    object LabelVidOpl: TcxLabel
      Left = 6
      Top = 12
      Width = 105
      Height = 20
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = #1042#1080#1076' '#1086#1087#1077#1088#1072#1094#1110#1111
    end
    object EditVidOpl: TcxButtonEdit
      Left = 109
      Top = 10
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
      TabOrder = 0
      OnExit = EditVidOplExit
    end
    object LabelVidOplData: TcxLabel
      Left = 168
      Top = 10
      Width = 379
      Height = 24
      AutoSize = False
      ParentColor = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Style.BorderColor = clGrayText
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 2
      Caption = ''
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 270
    Width = 554
    Height = 39
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    TabStop = False
    object LabelSmetaData: TcxLabel
      Left = 168
      Top = 10
      Width = 378
      Height = 24
      AutoSize = False
      ParentColor = False
      Properties.Alignment.Vert = taVCenter
      Style.BorderColor = clGrayText
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 1
      Caption = ''
    end
    object EditSmeta: TcxButtonEdit
      Left = 109
      Top = 10
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
      Properties.OnButtonClick = EditSmetaPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      OnExit = EditSmetaExit
    end
    object cxLabel3: TcxLabel
      Left = 4
      Top = 12
      Width = 105
      Height = 20
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = #1050#1086#1096#1090#1086#1088#1080#1089
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 115
    Width = 554
    Height = 39
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    TabStop = False
    object EditCategory: TcxLookupComboBox
      Left = 109
      Top = 12
      Width = 436
      Height = 21
      Properties.KeyFieldNames = 'ID_CATEGORY'
      Properties.ListColumns = <
        item
          FieldName = 'NAME_CATEGORY'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.OnChange = EditCategoryPropertiesChange
      TabOrder = 0
    end
    object cxLabel1: TcxLabel
      Left = 6
      Top = 12
      Width = 105
      Height = 20
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
    end
  end
  object cxGroupBox5: TcxGroupBox
    Left = 0
    Top = 154
    Width = 554
    Height = 39
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    TabStop = False
    object EditTypePost: TcxLookupComboBox
      Left = 109
      Top = 12
      Width = 436
      Height = 21
      Properties.KeyFieldNames = 'ID_TYPE_POST'
      Properties.ListColumns = <
        item
          Caption = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
          FieldName = 'name_type_post'
        end>
      Properties.ListOptions.ShowHeader = False
      TabOrder = 0
    end
    object cxLabel4: TcxLabel
      Left = 4
      Top = 12
      Width = 105
      Height = 20
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
    end
  end
  object cxGroupBox4: TcxGroupBox
    Left = 0
    Top = 194
    Width = 554
    Height = 39
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    TabStop = False
    object EditDepartment: TcxButtonEdit
      Left = 109
      Top = 10
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
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      OnExit = EditDepartmentExit
    end
    object LabelDepartmentData: TcxLabel
      Left = 168
      Top = 10
      Width = 378
      Height = 24
      AutoSize = False
      ParentColor = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Style.BorderColor = clGrayText
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 1
      Caption = ''
    end
    object cxLabel5: TcxLabel
      Left = 4
      Top = 12
      Width = 107
      Height = 20
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
    end
  end
  object Actions: TActionList
    Left = 64
    Top = 320
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
      OnExecute = ActionYesExecute
    end
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = Action1Execute
    end
  end
end
