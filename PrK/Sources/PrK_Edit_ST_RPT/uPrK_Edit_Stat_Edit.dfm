object FormPrK_Edit_Stat_Edit: TFormPrK_Edit_Stat_Edit
  Left = 329
  Top = 138
  BorderStyle = bsDialog
  Caption = 'FormPrK_Edit_Stat_Edit'
  ClientHeight = 361
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabelName: TcxLabel
    Left = 16
    Top = 6
    Width = 274
    Height = 19
    AutoSize = False
    ParentFont = False
    Properties.LabelStyle = cxlsRaised
    Properties.ShadowedColor = clBtnShadow
    Properties.Transparent = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    TabOrder = 12
  end
  object cxTextEditName: TcxTextEdit
    Left = 26
    Top = 27
    Width = 290
    Height = 24
    Cursor = crIBeam
    Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1090#1095#1077#1090#1072
    AutoSize = False
    ParentFont = False
    ParentShowHint = False
    Properties.Alignment.Vert = taVCenter
    Properties.MaxLength = 100
    ShowHint = True
    Style.BorderStyle = ebs3D
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.Shadow = True
    TabOrder = 0
    Text = 'cxTextEditName'
    DragCursor = crIBeam
  end
  object cxLabelShortName: TcxLabel
    Left = 16
    Top = 54
    Width = 274
    Height = 19
    AutoSize = False
    ParentFont = False
    Properties.LabelStyle = cxlsRaised
    Properties.ShadowedColor = clBtnShadow
    Properties.Transparent = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    TabOrder = 13
  end
  object cxTextEditShortName: TcxTextEdit
    Left = 26
    Top = 74
    Width = 290
    Height = 24
    Cursor = crIBeam
    Hint = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1090#1095#1077#1090#1072#13#10#1058#1086' '#1095#1090#1086' '#1086#1090#1086#1073#1088#1072#1078#1072#1077#1090#1089#1103' '#1074' '#1084#1077#1085#1102
    AutoSize = False
    ParentFont = False
    ParentShowHint = False
    Properties.Alignment.Vert = taVCenter
    Properties.MaxLength = 30
    ShowHint = True
    Style.BorderStyle = ebs3D
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.Shadow = True
    TabOrder = 1
    Text = 'cxTextEditShortName'
    DragCursor = crIBeam
  end
  object cxButtonOK: TcxButton
    Left = 127
    Top = 314
    Width = 97
    Height = 27
    Cursor = crHandPoint
    Action = ActionOK
    DragCursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000000000084830000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00000000000084830000FFFE000084830000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000000000FFFE0000FFFE0000FFFE0000FFFE00008483000000
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF000000000000FFFE0000FFFE00848484008484840000FFFE0000FFFE000084
      830000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF008484840000FFFE0084848400FF00FF00FF00FF008484840000FFFE0000FF
      FE000084830000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0084848400FF00FF00FF00FF00FF00FF00FF00FF008484840000FF
      FE0000FFFE000084830000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
      840000FFFE0000FFFE000084830000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF008484840000FFFE0000FFFE0000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF008484840000FFFE0000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
  end
  object cxButtonCansel: TcxButton
    Left = 232
    Top = 314
    Width = 97
    Height = 27
    Cursor = crHandPoint
    Action = ActionCansel
    DragCursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00000084000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0000008400000084000000840084848400FF00FF00FF00FF00FF00FF00FF00
      FF00000084000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000008400000084000000840084848400FF00FF00FF00FF000000
      84000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000008400000084000000840084848400000084000000
      840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000084000000840000008400000084000000
      8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00000084000000FF00000084008484
      8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000084000000840000008400000084000000
      840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00000084000000840000008400FF00FF00000084000000
      84000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00000084000000840000008400FF00FF00FF00FF00FF00FF000000
      8400000084000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00000084000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00000084000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
  end
  object cxLabelModuleName: TcxLabel
    Left = 16
    Top = 100
    Width = 274
    Height = 19
    AutoSize = False
    ParentFont = False
    Properties.LabelStyle = cxlsRaised
    Properties.ShadowedColor = clBtnShadow
    Properties.Transparent = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    TabOrder = 14
  end
  object cxTextEditModuleName: TcxTextEdit
    Left = 26
    Top = 123
    Width = 290
    Height = 24
    Cursor = crIBeam
    Hint = #1048#1084#1103' '#1074#1099#1079#1099#1074#1072#1102#1097#1077#1075#1086' '#1084#1086#1076#1091#1083#1103' (PRK_RPT_INI)'
    AutoSize = False
    ParentFont = False
    ParentShowHint = False
    Properties.Alignment.Vert = taVCenter
    Properties.MaxLength = 30
    ShowHint = True
    Style.BorderStyle = ebs3D
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.Shadow = True
    TabOrder = 2
    Text = 'cxTextEditShortName'
    DragCursor = crIBeam
  end
  object cxCheckBoxFak_center: TcxCheckBox
    Left = 24
    Top = 160
    Width = 268
    Height = 21
    Hint = #1045#1089#1083#1080' TRUE - ID_FAK_CENTER '#1103#1074#1083#1103#1077#1090#1089#1103' '#1074#1093#1086#1076#1085#1099#1084' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1084' '#1086#1090#1095#1077#1090#1072
    ParentShowHint = False
    Properties.DisplayUnchecked = 'False'
    Properties.ValueChecked = 1
    Properties.ValueUnchecked = 0
    ShowHint = True
    TabOrder = 3
  end
  object cxCheckBoxForm_obuch_kategory: TcxCheckBox
    Left = 24
    Top = 178
    Width = 268
    Height = 21
    Hint = 
      #1045#1089#1083#1080' TRUE - ID_SP_FORM_OBUCH_KATEGORY '#1103#1074#1083#1103#1077#1090#1089#1103' '#1074#1093#1086#1076#1085#1099#1084' '#1087#1072#1088#1072#1084#1077#1090#1088#1086 +
      #1084' '#1086#1090#1095#1077#1090#1072
    ParentShowHint = False
    Properties.DisplayUnchecked = 'False'
    Properties.ValueChecked = 1
    Properties.ValueUnchecked = 0
    ShowHint = True
    TabOrder = 4
  end
  object cxCheckBoxForm_stud: TcxCheckBox
    Left = 24
    Top = 197
    Width = 268
    Height = 21
    Hint = 
      #1045#1089#1083#1080' TRUE - ID_CN_SP_FORM_STUD '#1103#1074#1083#1103#1077#1090#1089#1103' '#1074#1093#1086#1076#1085#1099#1084' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1084' '#1086#1090#1095#1077#1090 +
      #1072
    ParentShowHint = False
    Properties.DisplayUnchecked = 'False'
    Properties.ValueChecked = 1
    Properties.ValueUnchecked = 0
    ShowHint = True
    TabOrder = 5
  end
  object cxCheckBoxCn_kat_stud: TcxCheckBox
    Left = 24
    Top = 214
    Width = 268
    Height = 21
    Hint = #1045#1089#1083#1080' TRUE - ID_CN_SP_KAT_STUD '#1103#1074#1083#1103#1077#1090#1089#1103' '#1074#1093#1086#1076#1085#1099#1084' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1084' '#1086#1090#1095#1077#1090#1072
    ParentShowHint = False
    Properties.DisplayUnchecked = 'False'
    Properties.ValueChecked = 1
    Properties.ValueUnchecked = 0
    ShowHint = True
    TabOrder = 6
  end
  object cxCheckBoxType_kat_stud: TcxCheckBox
    Left = 24
    Top = 233
    Width = 268
    Height = 21
    Hint = 
      #1045#1089#1083#1080' TRUE - ID_SP_TYPE_KAT_STUD '#1103#1074#1083#1103#1077#1090#1089#1103' '#1074#1093#1086#1076#1085#1099#1084' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1084' '#1086#1090#1095#1077 +
      #1090#1072
    ParentShowHint = False
    Properties.DisplayUnchecked = 'False'
    Properties.ValueChecked = 1
    Properties.ValueUnchecked = 0
    ShowHint = True
    TabOrder = 7
  end
  object cxCheckBoxDerg_zakaz: TcxCheckBox
    Left = 24
    Top = 252
    Width = 269
    Height = 21
    Hint = #1045#1089#1083#1080' TRUE - ID_SP_DERG_ZAKAZ '#1103#1074#1083#1103#1077#1090#1089#1103' '#1074#1093#1086#1076#1085#1099#1084' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1084' '#1086#1090#1095#1077#1090#1072
    ParentShowHint = False
    Properties.DisplayUnchecked = 'False'
    Properties.ValueChecked = 1
    Properties.ValueUnchecked = 0
    ShowHint = True
    TabOrder = 8
  end
  object cxCheckBoxPotok: TcxCheckBox
    Left = 24
    Top = 270
    Width = 270
    Height = 21
    Hint = #1045#1089#1083#1080' TRUE - ID_SP_POTOK '#1103#1074#1083#1103#1077#1090#1089#1103' '#1074#1093#1086#1076#1085#1099#1084' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1084' '#1086#1090#1095#1077#1090#1072
    ParentShowHint = False
    Properties.DisplayUnchecked = 'False'
    Properties.ValueChecked = 1
    Properties.ValueUnchecked = 0
    ShowHint = True
    TabOrder = 9
  end
  object ActionListKlassSpravEdit: TActionList
    Left = 80
    Top = 316
    object ActionOK: TAction
      Caption = 'ActionOK'
      ImageIndex = 0
      ShortCut = 121
      OnExecute = ActionOKExecute
    end
    object ActionCansel: TAction
      Caption = 'ActionCansel'
      ImageIndex = 1
      ShortCut = 27
      OnExecute = ActionCanselExecute
    end
  end
end
