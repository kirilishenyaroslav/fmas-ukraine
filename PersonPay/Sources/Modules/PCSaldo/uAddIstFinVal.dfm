object AddIstValForm: TAddIstValForm
  Left = 418
  Top = 154
  Width = 379
  Height = 293
  Caption = 'AddIstFinValForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl12: TLabel
    Left = 10
    Top = 66
    Width = 47
    Height = 13
    Caption = #1041#1102#1076#1078#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl13: TLabel
    Left = 98
    Top = 66
    Width = 40
    Height = 13
    Caption = #1056#1086#1079#1076#1110#1083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl14: TLabel
    Left = 191
    Top = 66
    Width = 41
    Height = 13
    Caption = #1057#1090#1072#1090#1090#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl15: TLabel
    Left = 279
    Top = 66
    Width = 33
    Height = 13
    Caption = #1050#1045#1050#1042
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl11: TLabel
    Left = 13
    Top = 162
    Width = 97
    Height = 13
    Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1072' '#1089#1091#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 13
    Top = 116
    Width = 92
    Height = 13
    Caption = #1044#1077#1073#1077#1090#1086#1074#1072' '#1089#1091#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 13
    Top = 12
    Width = 22
    Height = 13
    Caption = #1055#1030#1041
  end
  object lbl3: TLabel
    Left = 45
    Top = 13
    Width = 21
    Height = 13
    Caption = 'lbl3'
  end
  object lbl4: TLabel
    Left = 160
    Top = 119
    Width = 129
    Height = 13
    Caption = #1044#1077#1073#1077#1090#1086#1074#1072' '#1089#1091#1084#1072' ('#1074#1072#1083'.)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 160
    Top = 165
    Width = 134
    Height = 13
    Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1072' '#1089#1091#1084#1072' ('#1074#1072#1083'.)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl6: TLabel
    Left = 13
    Top = 38
    Width = 45
    Height = 13
    Caption = #1042#1072#1083#1102#1090#1072
  end
  object lblVal: TLabel
    Left = 70
    Top = 38
    Width = 32
    Height = 13
    Caption = 'lblVal'
  end
  object lbl8: TLabel
    Left = 189
    Top = 38
    Width = 29
    Height = 13
    Caption = #1050#1091#1088#1089
  end
  object lblKurs: TLabel
    Left = 231
    Top = 39
    Width = 39
    Height = 13
    Caption = 'lblKurs'
  end
  object cxDBKEKV: TcxButtonEdit
    Left = 277
    Top = 82
    Width = 75
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxDBKEKVPropertiesButtonClick
    Style.Color = clWindow
    TabOrder = 3
  end
  object cxDbSmeta: TcxButtonEdit
    Left = 11
    Top = 83
    Width = 75
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxDbSmetaPropertiesButtonClick
    Style.Color = clWindow
    TabOrder = 0
  end
  object cxDBRazdel: TcxTextEdit
    Left = 98
    Top = 82
    Width = 75
    Height = 21
    BeepOnEnter = False
    Properties.ReadOnly = True
    TabOrder = 1
  end
  object cxDBStatya: TcxTextEdit
    Left = 190
    Top = 82
    Width = 75
    Height = 21
    BeepOnEnter = False
    Properties.ReadOnly = True
    TabOrder = 2
  end
  object Kr_summa: TcxCurrencyEdit
    Left = 15
    Top = 184
    Width = 121
    Height = 21
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = ',0.00;-,0.00'
    Properties.ReadOnly = False
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Style.Color = clInfoBk
    TabOrder = 6
    OnExit = Kr_summaExit
  end
  object Db_summa: TcxCurrencyEdit
    Left = 14
    Top = 134
    Width = 121
    Height = 21
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = ',0.00;-,0.00'
    Properties.ReadOnly = False
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Style.Color = clInfoBk
    TabOrder = 4
    OnExit = Db_summaExit
  end
  object AddBut: TcxButton
    Left = 71
    Top = 223
    Width = 100
    Height = 26
    Hint = 'Enter'
    Action = actOk
    TabOrder = 8
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF0066001EB2311FB133006600FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565659A9A9A9A9A9A65
      6565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF00660031C24F22B7381AB02D21B437006600FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565ABABAB9E9E9E9797979C
      9C9C656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      00660047D36D3BCB5E25A83B0066001BA92E1DB132006600FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF656565BFBFBFB5B5B598989865656594
      9494999999656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600
      4FD67953DE7F31B54D006600FF00FF006600179D271EAE31006600FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF656565C4C4C4CACACAA5A5A5656565FF00FF65
      65658C8C8C989898656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      00660041C563006600FF00FFFF00FFFF00FFFF00FF00660019AA2B006600FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF656565B5B5B5656565FF00FFFF00FFFF
      00FFFF00FF656565939393656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600149D210066
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF6565658A8A8A656565FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066
      00006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    NumGlyphs = 2
    UseSystemPaint = False
  end
  object CancelBut: TcxButton
    Left = 190
    Top = 223
    Width = 100
    Height = 25
    Hint = 'Esc'
    Action = actNo
    TabOrder = 9
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF0732DE0732DEFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FF0732DE
      0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732
      DE0732DEFF00FFFF00FFFF00FF0732DE0732DD0732DE0732DEFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF
      0534ED0732DF0732DE0732DEFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DDFF
      00FF0732DD0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF0732DD0633E60633E60633E90732DCFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0633E307
      32E30534EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF0732DD0534ED0533E90434EF0434F5FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0434F40534EF0533EBFF
      00FFFF00FF0434F40335F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF0335FC0534EF0434F8FF00FFFF00FFFF00FFFF00FF0335FC0335FBFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FCFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB
      0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF0335FBFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    UseSystemPaint = False
  end
  object db_summa_val: TcxCurrencyEdit
    Left = 161
    Top = 134
    Width = 121
    Height = 21
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = ',0.00;-,0.00'
    Properties.ReadOnly = False
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Style.Color = clInfoBk
    TabOrder = 5
    OnExit = db_summa_valExit
  end
  object kr_summa_val: TcxCurrencyEdit
    Left = 162
    Top = 184
    Width = 121
    Height = 21
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = ',0.00;-,0.00'
    Properties.ReadOnly = False
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Style.Color = clInfoBk
    TabOrder = 7
    OnExit = kr_summa_valExit
  end
  object actlst1: TActionList
    Left = 321
    Top = 84
    object actOk: TAction
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      ShortCut = 13
      OnExecute = actOkExecute
    end
    object actNo: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = actNoExecute
    end
  end
end
