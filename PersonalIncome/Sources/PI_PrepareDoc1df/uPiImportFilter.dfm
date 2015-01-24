object fmImportFilter: TfmImportFilter
  Left = 398
  Top = 262
  Width = 445
  Height = 173
  Caption = 'fmImportFilter'
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
  object LabelDateCame: TcxLabel
    Left = 3
    Top = 20
    Width = 78
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taLeftJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Caption = #1055#1077#1088#1110#1086#1076' '#1079
  end
  object DateEditCame: TcxDateEdit
    Left = 82
    Top = 20
    Width = 137
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    Style.PopupBorderStyle = epbsDefault
    TabOrder = 1
  end
  object LabelDateLeave: TcxLabel
    Left = 227
    Top = 20
    Width = 30
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taLeftJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Caption = #1087#1086
  end
  object DateEditLeave: TcxDateEdit
    Left = 263
    Top = 20
    Width = 137
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 3
  end
  object LabelKod1DF: TcxLabel
    Left = 0
    Top = 59
    Width = 129
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taLeftJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
  end
  object ButtonEditSch: TcxButtonEdit
    Left = 130
    Top = 56
    Width = 271
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
    TabOrder = 5
  end
  object YesBtn: TcxButton
    Left = 224
    Top = 96
    Width = 75
    Height = 25
    Caption = 'ActionYes'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = YesBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 322
    Top = 96
    Width = 75
    Height = 25
    Caption = #1042#1080#1081#1090#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
end
