object FZ_NonSpisok_Control: TFZ_NonSpisok_Control
  Left = 644
  Top = 585
  BorderStyle = bsDialog
  Caption = 'FZ_NonSpisok_Control'
  ClientHeight = 339
  ClientWidth = 596
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
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BoxMan: TcxGroupBox
    Left = 0
    Top = 0
    Width = 596
    Height = 44
    Align = alTop
    Alignment = alTopLeft
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
      Left = 16
      Top = 15
      Width = 113
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
      Left = 131
      Top = 13
      Width = 433
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
    Top = 44
    Width = 596
    Height = 275
    Align = alClient
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TabStop = False
    object LabelSumma: TcxLabel
      Left = 287
      Top = 144
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
      TabOrder = 10
      Caption = 'LabelSumma'
    end
    object LabelPeriod: TcxLabel
      Left = 22
      Top = 146
      Width = 109
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
      TabOrder = 14
      Caption = 'LabelPeriod'
    end
    object EditMonth: TcxComboBox
      Left = 133
      Top = 143
      Width = 105
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'January'
        'February')
      TabOrder = 8
      OnExit = EditMonthExit
    end
    object EditYear: TcxSpinEdit
      Left = 237
      Top = 143
      Width = 60
      Height = 24
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaxValue = 2050.000000000000000000
      Properties.MinValue = 2000.000000000000000000
      TabOrder = 9
      Value = 2000
      OnExit = EditMonthExit
    end
    object LabelCategory: TcxLabel
      Left = 19
      Top = 17
      Width = 112
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
      TabOrder = 15
      Caption = 'LabelCategory'
    end
    object EditVidOpl: TcxButtonEdit
      Left = 133
      Top = 85
      Width = 71
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
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
      TabOrder = 4
      OnExit = EditVidOplExit
    end
    object LabelVidOpl: TcxLabel
      Left = 19
      Top = 88
      Width = 112
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
      TabOrder = 16
      Caption = 'LabelVidOpl'
    end
    object EditDepartment: TcxButtonEdit
      Left = 133
      Top = 60
      Width = 71
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d?\d?\d?\d?\d?\d?\d?\d?'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = EditDepartmentPropertiesButtonClick
      TabOrder = 2
      OnExit = EditDepartmentExit
    end
    object LabelDepartment: TcxLabel
      Left = 19
      Top = 62
      Width = 112
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
      TabOrder = 17
      Caption = 'LabelDepartment'
    end
    object EditSmeta: TcxButtonEdit
      Left = 133
      Top = 109
      Width = 71
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
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
      TabOrder = 6
      OnExit = EditSmetaExit
    end
    object LabelSmeta: TcxLabel
      Left = 19
      Top = 111
      Width = 112
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
      TabOrder = 18
      Caption = 'LabelSmeta'
    end
    object EditCategory: TcxLookupComboBox
      Left = 133
      Top = 14
      Width = 433
      Height = 24
      Properties.KeyFieldNames = 'ID_CATEGORY'
      Properties.ListColumns = <
        item
          FieldName = 'NAME_CATEGORY'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.OnChange = EditCategoryPropertiesChange
      TabOrder = 0
    end
    object LabelVidOplData: TcxLabel
      Left = 204
      Top = 85
      Width = 363
      Height = 24
      AutoSize = False
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Style.BorderColor = clBtnShadow
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Caption = ''
    end
    object LabelDepartmentData: TcxLabel
      Left = 204
      Top = 60
      Width = 363
      Height = 24
      AutoSize = False
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Style.BorderColor = clBtnShadow
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Caption = ''
    end
    object LabelSmetaData: TcxLabel
      Left = 204
      Top = 109
      Width = 363
      Height = 24
      AutoSize = False
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Style.BorderColor = clBtnShadow
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
      Caption = ''
    end
    object EditTypePost: TcxLookupComboBox
      Left = 133
      Top = 37
      Width = 433
      Height = 24
      Properties.KeyFieldNames = 'ID_TYPE_POST'
      Properties.ListColumns = <
        item
          Caption = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
          FieldName = 'name_type_post'
        end>
      Properties.ListOptions.ShowHeader = False
      TabOrder = 1
    end
    object cxLabel1: TcxLabel
      Left = 19
      Top = 37
      Width = 112
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
      TabOrder = 19
      Caption = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
    end
    object EditPrikazB: TcxButtonEdit
      Left = 133
      Top = 176
      Width = 433
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = EditPrikazBPropertiesButtonClick
      TabOrder = 11
      Visible = False
    end
    object cxLabel2: TcxLabel
      Left = 19
      Top = 178
      Width = 112
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
      TabOrder = 20
      Visible = False
      Caption = #1053#1072#1082#1072#1079
    end
    object cxLabel3: TcxLabel
      Left = 65
      Top = 203
      Width = 66
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
      TabOrder = 21
      Visible = False
      Caption = #1043#1086#1076#1080#1085#1080
    end
    object EdHours: TcxCalcEdit
      Left = 133
      Top = 202
      Width = 152
      Height = 24
      EditValue = 0.000000000000000000
      Properties.OnEditValueChanged = EdHoursPropertiesEditValueChanged
      TabOrder = 12
      Visible = False
    end
    object cxLabel4: TcxLabel
      Left = 300
      Top = 203
      Width = 57
      Height = 20
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 22
      Visible = False
      Caption = #1058#1072#1088#1080#1092
    end
    object EdTarif: TcxCalcEdit
      Left = 356
      Top = 202
      Width = 208
      Height = 24
      Enabled = False
      Properties.OnEditValueChanged = EdTarifPropertiesEditValueChanged
      TabOrder = 13
      Visible = False
    end
    object YesBtn: TcxButton
      Left = 392
      Top = 240
      Width = 81
      Height = 25
      Action = ActionYes
      TabOrder = 23
      LookAndFeel.Kind = lfFlat
    end
    object CancelBtn: TcxButton
      Left = 480
      Top = 240
      Width = 81
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 24
      LookAndFeel.Kind = lfFlat
    end
    object EditSumma: TcxMaskEdit
      Left = 445
      Top = 144
      Width = 121
      Height = 24
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 25
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 319
    Width = 596
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
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
  object Actions: TActionList
    Left = 24
    Top = 184
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
      OnExecute = ActionYesExecute
    end
    object ActionSaveToBuffer: TAction
      Caption = 'ActionSaveToBuffer'
      ShortCut = 120
      OnExecute = ActionSaveToBufferExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 552
    Top = 8
    object ByClock: TMenuItem
      Caption = #1055#1086' '#1095#1072#1089#1072#1084
      OnClick = ByClockClick
    end
  end
  object CheckDS: TpFIBDataSet
    Left = 32
    Top = 232
    poSQLINT64ToBCD = True
  end
end
