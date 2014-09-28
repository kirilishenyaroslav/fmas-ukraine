object fmEdit: TfmEdit
  Left = 437
  Top = 188
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1089#1072#1083#1100#1076#1086
  ClientHeight = 226
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 6
    Width = 457
    Height = 171
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 8
    Top = 176
    Width = 457
    Height = 49
    Shape = bsFrame
  end
  object ButtonCancel: TcxButton
    Left = 296
    Top = 192
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 0
    OnClick = ButtonCancelClick
  end
  object EditSch: TcxButtonEdit
    Left = 64
    Top = 16
    Width = 65
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = False
    Properties.OnButtonClick = EditSchPropertiesButtonClick
    Style.BorderColor = clBlue
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 1
    OnExit = EditSchExit
    OnKeyPress = EditSchKeyPress
  end
  object cxLabel1: TcxLabel
    Left = 26
    Top = 136
    Width = 37
    Height = 17
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNone
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 2
    Caption = #1057#1091#1084#1072':'
  end
  object cxLabel2: TcxLabel
    Left = 18
    Top = 66
    Width = 44
    Height = 17
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNone
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 3
    Caption = #1056#1086#1079#1076#1110#1083':'
  end
  object cxLabel3: TcxLabel
    Left = 16
    Top = 88
    Width = 45
    Height = 17
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNone
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 4
    Caption = #1057#1090#1072#1090#1090#1103':'
  end
  object cxLabel4: TcxLabel
    Left = 10
    Top = 16
    Width = 52
    Height = 17
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNone
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 5
    Caption = #1056#1072#1093#1091#1085#1086#1082':'
  end
  object cxLabel5: TcxLabel
    Left = 10
    Top = 40
    Width = 51
    Height = 17
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNone
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 6
    Caption = #1041#1102#1076#1078#1077#1090':'
  end
  object cxLabel6: TcxLabel
    Left = 24
    Top = 112
    Width = 39
    Height = 17
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNone
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 7
    Caption = #1050#1045#1050#1042':'
  end
  object EditSchTitle: TcxTextEdit
    Left = 136
    Top = 16
    Width = 313
    Height = 21
    ParentFont = False
    Properties.ReadOnly = True
    TabOrder = 8
  end
  object EditSmetaTitle: TcxTextEdit
    Left = 136
    Top = 40
    Width = 313
    Height = 21
    ParentFont = False
    Properties.ReadOnly = True
    TabOrder = 9
  end
  object EditRazdTitle: TcxTextEdit
    Left = 136
    Top = 64
    Width = 313
    Height = 21
    ParentFont = False
    Properties.ReadOnly = True
    TabOrder = 10
  end
  object EditStatTitle: TcxTextEdit
    Left = 136
    Top = 88
    Width = 313
    Height = 21
    ParentFont = False
    Properties.ReadOnly = True
    TabOrder = 11
  end
  object EditKekvTitle: TcxTextEdit
    Left = 136
    Top = 112
    Width = 313
    Height = 21
    ParentFont = False
    Properties.ReadOnly = True
    TabOrder = 12
  end
  object EditSaldo: TcxMaskEdit
    Left = 64
    Top = 136
    Width = 161
    Height = 21
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '-?[0-9]+(,[0-9][0-9]|,[0-9])?'
    Properties.MaxLength = 0
    TabOrder = 13
    OnKeyPress = EditSaldoKeyPress
  end
  object EditKekv: TcxButtonEdit
    Left = 64
    Top = 112
    Width = 65
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '([0-9]+)?'
    Properties.MaxLength = 0
    Properties.ReadOnly = False
    Properties.OnButtonClick = EditKekvPropertiesButtonClick
    Style.BorderColor = clBlue
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 14
    OnExit = EditKekvExit
    OnKeyPress = EditKekvKeyPress
  end
  object ButtonOK: TcxButton
    Left = 112
    Top = 192
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 15
    OnClick = ButtonOKClick
  end
  object EditStat: TcxMaskEdit
    Left = 64
    Top = 88
    Width = 65
    Height = 21
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '([0-9]+)?'
    Properties.MaxLength = 0
    TabOrder = 16
    OnEnter = EditStatClick
    OnExit = EditStatExit
    OnKeyPress = EditStatKeyPress
  end
  object EditRazd: TcxMaskEdit
    Left = 64
    Top = 64
    Width = 65
    Height = 21
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '([0-9]+)?'
    Properties.MaxLength = 0
    TabOrder = 17
    OnEnter = EditRazdClick
    OnExit = EditRazdExit
    OnKeyPress = EditRazdKeyPress
  end
  object EditSmeta: TcxButtonEdit
    Left = 64
    Top = 40
    Width = 65
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '([0-9]+)?'
    Properties.MaxLength = 0
    Properties.OnButtonClick = EditSmetaPropertiesButtonClick
    TabOrder = 18
    OnExit = EditSmetaExit
    OnKeyPress = EditSmetaKeyPress
  end
end
