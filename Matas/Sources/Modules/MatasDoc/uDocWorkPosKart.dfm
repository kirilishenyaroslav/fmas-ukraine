object Form1: TForm1
  Left = 310
  Top = 234
  Width = 622
  Height = 266
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl: TcxPageControl
    Left = 0
    Top = 0
    Width = 614
    Height = 233
    ActivePage = cxTabSheetPos
    Align = alTop
    TabOrder = 0
    object cxTabSheetPos: TcxTabSheet
      Caption = 'cxTabSheetPos'
      ImageIndex = 0
      object Label1: TLabel
        Left = 16
        Top = 19
        Width = 38
        Height = 13
        Caption = #1053#1072#1079#1074#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 304
        Top = 59
        Width = 116
        Height = 13
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1092#1072#1082#1090#1080#1095#1085#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 60
        Width = 150
        Height = 13
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1079#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1084
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 16
        Top = 93
        Width = 95
        Height = 13
        Caption = #1054#1076#1080#1085#1080#1094#1103' '#1074#1080#1084#1110#1088#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 408
        Top = 123
        Width = 27
        Height = 13
        Caption = #1062#1110#1085#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 403
        Top = 92
        Width = 31
        Height = 13
        Caption = #1057#1091#1084#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 16
        Top = 125
        Width = 49
        Height = 13
        Caption = #1056#1072#1093#1091#1085#1086#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 12
        Top = 155
        Width = 54
        Height = 13
        Caption = #1055#1110#1076#1089#1090#1072#1074#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxName: TcxButtonEdit
        Left = 80
        Top = 16
        Width = 497
        Height = 21
        BeepOnEnter = False
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.TransparentBorder = True
        TabOrder = 0
      end
      object cxKolDoc: TcxCurrencyEdit
        Left = 176
        Top = 56
        Width = 113
        Height = 21
        BeepOnEnter = False
        EditValue = 0.000000000000000000
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.0000;-,0.0000'
        TabOrder = 1
      end
      object cxKolMat: TcxCurrencyEdit
        Left = 448
        Top = 56
        Width = 129
        Height = 21
        BeepOnEnter = False
        EditValue = 0.000000000000000000
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.0000;-,0.0000'
        Properties.UseLeftAlignmentOnEditing = False
        Style.Color = clInfoBk
        TabOrder = 2
      end
      object cxSumma: TcxCurrencyEdit
        Left = 448
        Top = 88
        Width = 129
        Height = 21
        BeepOnEnter = False
        EditValue = 0.000000000000000000
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.UseThousandSeparator = True
        Style.Color = clInfoBk
        TabOrder = 3
      end
      object cxPrice: TcxCurrencyEdit
        Left = 448
        Top = 120
        Width = 129
        Height = 21
        BeepOnEnter = False
        EditValue = 0
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.0000;-,0.0000'
        Style.Color = clInfoBk
        TabOrder = 4
      end
      object cxUnit: TcxButtonEdit
        Left = 160
        Top = 88
        Width = 129
        Height = 21
        BeepOnEnter = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        TabOrder = 5
      end
      object cxNameSch: TcxButtonEdit
        Left = 160
        Top = 120
        Width = 129
        Height = 21
        BeepOnEnter = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = False
        TabOrder = 6
      end
      object cxCheckWorkPos: TcxCheckBox
        Left = 448
        Top = 152
        Width = 129
        Height = 21
        ParentFont = False
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1053#1077' '#1073#1088#1072#1090#1080' '#1087#1110#1076#1079#1074#1110#1090
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 7
        Visible = False
      end
      object cxPosNote: TcxTextEdit
        Left = 72
        Top = 152
        Width = 361
        Height = 21
        BeepOnEnter = False
        TabOrder = 8
      end
    end
    object cxTabSheetInv: TcxTabSheet
      Caption = 'cxTabSheetInv'
      ImageIndex = 1
      object Label18: TLabel
        Left = 8
        Top = 11
        Width = 74
        Height = 13
        Caption = #1044#1072#1090#1072' '#1086#1087#1088#1080#1073'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 199
        Top = 11
        Width = 74
        Height = 13
        Caption = #1044#1072#1090#1072' '#1077#1082#1089#1087#1083'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 8
        Top = 38
        Width = 78
        Height = 13
        Caption = #1047#1072#1083#1080#1096'. '#1074#1072#1088#1090'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 8
        Top = 61
        Width = 30
        Height = 13
        Caption = #1047#1085#1086#1089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelID_Am_grp: TLabel
        Left = 8
        Top = 85
        Width = 72
        Height = 13
        Caption = #1043#1088#1091#1087#1072' '#1079#1085#1086#1089#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelPercent: TLabel
        Left = 8
        Top = 111
        Width = 88
        Height = 13
        Caption = #1055#1088#1086#1094#1077#1085#1090' '#1079#1085#1086#1089#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelPer_Nachisl: TLabel
        Left = 8
        Top = 137
        Width = 82
        Height = 13
        Caption = #1055#1077#1088#1110#1086#1076' '#1085#1072#1088#1072#1093'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelBuh_id_db_sch: TLabel
        Left = 8
        Top = 161
        Width = 68
        Height = 13
        Caption = #1044#1073' '#1088#1072#1093#1091#1085#1086#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelBuh_id_kr_sch: TLabel
        Left = 8
        Top = 189
        Width = 66
        Height = 13
        Caption = #1050#1088' '#1088#1072#1093#1091#1085#1086#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 391
        Top = 11
        Width = 81
        Height = 13
        Caption = #1041#1072#1083'. '#1074#1072#1088#1090#1110#1089#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxDateEdit1: TcxDateEdit
        Left = 88
        Top = 4
        Width = 105
        Height = 21
        BeepOnEnter = False
        ParentFont = False
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
      end
      object cxDateEdit2: TcxDateEdit
        Left = 280
        Top = 8
        Width = 105
        Height = 21
        BeepOnEnter = False
        ParentFont = False
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
      end
      object cxCurrencyEdit1: TcxCurrencyEdit
        Left = 88
        Top = 28
        Width = 129
        Height = 21
        BeepOnEnter = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.UseThousandSeparator = True
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 2
      end
      object cxCurrencyEdit2: TcxCurrencyEdit
        Left = 88
        Top = 52
        Width = 129
        Height = 21
        BeepOnEnter = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.UseThousandSeparator = True
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 3
      end
      object cxButtonEditID_Am_grp: TcxButtonEdit
        Left = 88
        Top = 76
        Width = 129
        Height = 23
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = False
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 4
      end
      object cxCurrencyEditPersent: TcxCurrencyEdit
        Left = 150
        Top = 106
        Width = 68
        Height = 23
        ParentFont = False
        Properties.DisplayFormat = ',0.00;-,0.00'
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 5
      end
      object cxComboBoxPeriodNach: TcxComboBox
        Left = 96
        Top = 131
        Width = 121
        Height = 23
        ParentFont = False
        Properties.Items.Strings = (
          #1065#1086#1084#1110#1089#1103#1095#1085#1086
          #1065#1086#1082#1074#1072#1088#1090#1072#1083#1100#1085#1086
          #1065#1086#1088#1110#1095#1085#1086)
        Properties.ReadOnly = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 6
      end
      object cxButtonEditBuh_id_db_sch: TcxButtonEdit
        Left = 128
        Top = 157
        Width = 89
        Height = 23
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 7
      end
      object cxButtonEditBuh_id_kr_sch: TcxButtonEdit
        Left = 128
        Top = 185
        Width = 89
        Height = 23
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -12
        Style.Font.Name = 'Microsoft Sans Serif'
        Style.Font.Style = []
        TabOrder = 8
      end
      object cxCurrencyEdit3: TcxCurrencyEdit
        Left = 480
        Top = 8
        Width = 113
        Height = 21
        BeepOnEnter = False
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.UseThousandSeparator = True
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 9
      end
    end
    object cxTabSheetMna: TcxTabSheet
      Caption = 'cxTabSheetMna'
      ImageIndex = 2
      object Label17: TLabel
        Left = 8
        Top = 11
        Width = 46
        Height = 13
        Caption = #1053#1086#1084'. '#8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 8
        Top = 43
        Width = 74
        Height = 13
        Caption = #1044#1072#1090#1072' '#1086#1087#1088#1080#1073'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 207
        Top = 43
        Width = 74
        Height = 13
        Caption = #1044#1072#1090#1072' '#1077#1082#1089#1087#1083'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 248
        Top = 11
        Width = 39
        Height = 13
        Caption = #1030#1085#1074'. '#8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 8
        Top = 75
        Width = 68
        Height = 13
        Caption = #1047#1072#1074'. '#1085#1086#1084#1077#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 208
        Top = 75
        Width = 72
        Height = 13
        Caption = #8470' '#1087#1072#1089#1087#1086#1088#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 8
        Top = 107
        Width = 46
        Height = 13
        Caption = #1052#1086#1076#1077#1083#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 350
        Top = 107
        Width = 39
        Height = 13
        Caption = #1052#1072#1088#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 8
        Top = 138
        Width = 56
        Height = 13
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxNNum: TcxTextEdit
        Left = 56
        Top = 8
        Width = 113
        Height = 21
        BeepOnEnter = False
        ParentFont = False
        Properties.MaxLength = 8
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
      end
      object cxNNumExt: TcxTextEdit
        Left = 168
        Top = 8
        Width = 73
        Height = 21
        ParentFont = False
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
      end
      object cxDateOpr: TcxDateEdit
        Left = 88
        Top = 40
        Width = 113
        Height = 21
        BeepOnEnter = False
        ParentFont = False
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 3
      end
      object cxDateExpl: TcxDateEdit
        Left = 280
        Top = 40
        Width = 113
        Height = 21
        BeepOnEnter = False
        ParentFont = False
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 4
      end
      object cxINum: TcxTextEdit
        Left = 288
        Top = 8
        Width = 113
        Height = 21
        BeepOnEnter = False
        ParentFont = False
        Properties.MaxLength = 8
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 2
      end
      object cxZavNum: TcxTextEdit
        Left = 80
        Top = 72
        Width = 121
        Height = 21
        BeepOnEnter = False
        ParentFont = False
        Properties.MaxLength = 30
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 5
      end
      object cxPassNum: TcxTextEdit
        Left = 280
        Top = 72
        Width = 161
        Height = 21
        BeepOnEnter = False
        ParentFont = False
        Properties.MaxLength = 30
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 6
      end
      object cxModel: TcxTextEdit
        Left = 64
        Top = 104
        Width = 281
        Height = 21
        BeepOnEnter = False
        ParentFont = False
        Properties.MaxLength = 50
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 7
      end
      object cxMarka: TcxTextEdit
        Left = 392
        Top = 104
        Width = 193
        Height = 21
        BeepOnEnter = False
        ParentFont = False
        Properties.MaxLength = 50
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 8
      end
      object cxNote: TcxTextEdit
        Left = 80
        Top = 136
        Width = 505
        Height = 49
        AutoSize = False
        BeepOnEnter = False
        ParentFont = False
        Properties.MaxLength = 255
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 9
      end
    end
  end
end
