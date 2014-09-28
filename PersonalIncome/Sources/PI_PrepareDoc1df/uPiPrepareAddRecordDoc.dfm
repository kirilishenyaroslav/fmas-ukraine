object fmAddRecordDoc: TfmAddRecordDoc
  Left = 424
  Top = 202
  Width = 604
  Height = 248
  Caption = 'fmAddRecordDoc'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 49
    Width = 588
    Height = 2
    Align = alTop
    Shape = bsBottomLine
  end
  object Bevel2: TBevel
    Left = 0
    Top = 165
    Width = 588
    Height = 2
    Align = alTop
    Shape = bsBottomLine
  end
  object PanelMan: TPanel
    Left = 0
    Top = 0
    Width = 588
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object LabelFIO: TcxLabel
      Left = 149
      Top = 18
      Width = 44
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = #1055'.'#1030'.'#1041'.'
    end
    object LabelTin: TcxLabel
      Left = -1
      Top = 18
      Width = 33
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = #1030#1085#1085
    end
    object TextEditTn: TcxTextEdit
      Left = 32
      Top = 16
      Width = 121
      Height = 21
      Properties.MaxLength = 10
      TabOrder = 2
      OnEnter = TextEditTnExit
      OnExit = TextEditTnExit
      OnKeyPress = TextEditTnKeyPress
    end
    object ButtonEditFIO: TcxButtonEdit
      Left = 192
      Top = 16
      Width = 371
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = ButtonEditFIOPropertiesButtonClick
      TabOrder = 3
      OnKeyPress = ButtonEditFIOKeyPress
    end
  end
  object PanelData: TPanel
    Left = 0
    Top = 51
    Width = 588
    Height = 114
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object DateEditCame: TcxDateEdit
      Left = 122
      Top = 84
      Width = 137
      Height = 21
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.InputKind = ikStandard
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.PopupBorderStyle = epbsDefault
      TabOrder = 0
      EditValue = 0d
    end
    object DateEditLeave: TcxDateEdit
      Left = 426
      Top = 82
      Width = 137
      Height = 21
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.InputKind = ikMask
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      EditValue = 0d
    end
    object LabelSumNar: TcxLabel
      Left = 3
      Top = 6
      Width = 122
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086
    end
    object LabelSumVipl: TcxLabel
      Left = 3
      Top = 30
      Width = 122
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Caption = #1057#1087#1083#1072#1095#1077#1085#1086
    end
    object LabelSumUd: TcxLabel
      Left = 280
      Top = 5
      Width = 150
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      Caption = #1059#1090#1088#1080#1084#1072#1085#1086
    end
    object LabelSumPerer: TcxLabel
      Left = 280
      Top = 31
      Width = 150
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Caption = #1055#1077#1088#1077#1088#1072#1093#1086#1074#1072#1085#1086
    end
    object LabelDateCame: TcxLabel
      Left = 3
      Top = 86
      Width = 122
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
      Caption = #1044#1072#1090#1072' '#1087#1088#1080#1081#1085#1103#1090#1090#1103
    end
    object LabelDateLeave: TcxLabel
      Left = 307
      Top = 84
      Width = 122
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
      Caption = #1044#1072#1090#1072' '#1079#1074#1110#1083#1100#1085#1077#1085#1085#1103
    end
    object LabelKod1DF: TcxLabel
      Left = 0
      Top = 59
      Width = 116
      Height = 17
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
      Caption = #1054#1079#1085#1072#1082#1072' '#1076#1086#1093#1086#1076#1072
    end
    object LabelPriv: TcxLabel
      Left = 320
      Top = 58
      Width = 110
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 9
      Caption = #1055#1110#1083#1100#1075#1072
    end
    object ButtonEditPriv: TcxButtonEdit
      Left = 427
      Top = 54
      Width = 137
      Height = 21
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d?\d?'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = ButtonEditPrivPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 10
    end
    object ButtonEditProp: TcxButtonEdit
      Left = 122
      Top = 56
      Width = 137
      Height = 21
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = ButtonEditPropPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 11
      OnExit = ButtonEditPropExit
    end
    object MaskEditSumNar: TcxCurrencyEdit
      Left = 124
      Top = 2
      Width = 137
      Height = 21
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;'
      TabOrder = 12
      OnExit = MaskEditSumNarExit
      OnKeyPress = MaskEditSumNarKeyPress
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
    end
    object MaskEditSumDoh: TcxCurrencyEdit
      Left = 124
      Top = 28
      Width = 137
      Height = 21
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;'
      TabOrder = 13
      OnEditing = MaskEditSumDohEditing
      OnKeyPress = MaskEditSumNarKeyPress
    end
    object MaskEditSumTaxN: TcxCurrencyEdit
      Left = 428
      Top = 0
      Width = 137
      Height = 21
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;'
      TabOrder = 14
      OnExit = MaskEditSumTaxNExit
      OnKeyPress = MaskEditSumNarKeyPress
    end
    object MaskEditSumTaxD: TcxCurrencyEdit
      Left = 428
      Top = 28
      Width = 137
      Height = 21
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;'
      TabOrder = 15
      OnExit = MaskEditSumTaxDExit
      OnKeyPress = MaskEditSumNarKeyPress
    end
  end
  object YesBtn: TcxButton
    Left = 352
    Top = 176
    Width = 75
    Height = 25
    Caption = 'ActionYes'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = YesBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 440
    Top = 176
    Width = 75
    Height = 25
    Caption = #1042#1080#1081#1090#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
end
