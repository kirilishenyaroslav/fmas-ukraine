object frmTable: TfrmTable
  Left = 0
  Top = 0
  Width = 795
  Height = 526
  TabOrder = 0
  object TableGrid: TStringGrid
    Left = 0
    Top = 25
    Width = 795
    Height = 357
    Align = alClient
    Color = clInfoBk
    ColCount = 10
    DefaultColWidth = 36
    Enabled = False
    FixedColor = clInactiveCaptionText
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnDrawCell = TableGridDrawCell
    OnMouseDown = TableGridMouseDown
    OnSelectCell = TableGridSelectCell
    RowHeights = (
      24)
  end
  object StatusPanel: TPanel
    Left = 0
    Top = 0
    Width = 795
    Height = 25
    Align = alTop
    TabOrder = 1
    object StatusCaptionLabel: TLabel
      Left = 336
      Top = 5
      Width = 45
      Height = 13
      Caption = #1057#1090#1072#1090#1091#1089':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object StatusLabel: TLabel
      Left = 385
      Top = 5
      Width = 96
      Height = 13
      AutoSize = False
      Caption = '-------------------------------'
      ParentShowHint = False
      ShowHint = True
    end
    object SearchLabel: TLabel
      Left = 8
      Top = 3
      Width = 43
      Height = 13
      Caption = #1055#1086#1096#1091#1082':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object WeekDayLabel: TLabel
      Left = 240
      Top = 5
      Width = 72
      Height = 13
      Caption = #1044#1077#1085#1100' '#1090#1080#1078#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DepartmentLabel: TLabel
      Left = 528
      Top = 5
      Width = 257
      Height = 13
      AutoSize = False
      Caption = '---'
      ParentShowHint = False
      ShowHint = True
    end
    object CalcInHoursLabel: TLabel
      Left = 501
      Top = 5
      Width = 13
      Height = 13
      Caption = '---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SearchEdit: TEdit
      Left = 56
      Top = 0
      Width = 161
      Height = 21
      Hint = '195.184.198.137'
      TabOrder = 0
      OnChange = SearchEditChange
      OnKeyDown = SearchEditKeyDown
    end
  end
  object InfoPanel: TPanel
    Left = 0
    Top = 390
    Width = 795
    Height = 136
    Align = alBottom
    TabOrder = 2
    object AllPanel: TPanel
      Left = 1
      Top = 80
      Width = 793
      Height = 21
      Align = alBottom
      TabOrder = 0
      object TotalHoursCaption: TLabel
        Left = 175
        Top = 4
        Width = 86
        Height = 13
        Caption = #1059#1089#1100#1086#1075#1086' '#1075#1086#1076#1080#1085':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TotalNHoursCaption: TLabel
        Left = 336
        Top = 4
        Width = 43
        Height = 13
        Caption = #1053#1110#1095#1085#1080#1093':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TotalHoursLabel: TLabel
        Left = 264
        Top = 4
        Width = 9
        Height = 13
        Caption = '---'
      end
      object TotalNHoursLabel: TLabel
        Left = 384
        Top = 4
        Width = 13
        Height = 13
        Caption = '---'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TotalPHoursCaption: TLabel
        Left = 440
        Top = 4
        Width = 67
        Height = 13
        Caption = #1057#1074#1103#1090#1082#1086#1074#1080#1093':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TotalPHoursLabel: TLabel
        Left = 512
        Top = 4
        Width = 13
        Height = 13
        Caption = '---'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TotalDaysCaption: TLabel
        Left = 680
        Top = 4
        Width = 77
        Height = 13
        Caption = #1044#1085#1110#1074' '#1088#1086#1073#1086#1090#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TotalDaysLabel: TLabel
        Left = 757
        Top = 4
        Width = 9
        Height = 13
        Caption = '---'
      end
      object TotalLabel: TLabel
        Left = 3
        Top = 4
        Width = 148
        Height = 13
        Caption = #1059#1057#1068#1054#1043#1054' '#1079#1072' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1086#1084':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TotalVihHoursCaption: TLabel
        Left = 560
        Top = 4
        Width = 69
        Height = 13
        Caption = #1059' '#1074#1080#1093#1110#1076#1085#1080#1081':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TotalVHoursLabel: TLabel
        Left = 637
        Top = 4
        Width = 13
        Height = 13
        Caption = '---'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object ManPanel: TPanel
      Left = 1
      Top = 46
      Width = 793
      Height = 34
      Align = alBottom
      TabOrder = 1
      object AHLabel: TLabel
        Left = 145
        Top = 1
        Width = 133
        Height = 13
        Caption = #1043#1086#1076#1080#1085' '#1088#1086#1073#1086#1090#1080' ('#1091#1089#1100#1086#1075#1086' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object AllHoursLabel: TLabel
        Left = 392
        Top = 1
        Width = 21
        Height = 13
        Caption = '-------'
      end
      object AllNHoursLabel: TLabel
        Left = 440
        Top = 1
        Width = 29
        Height = 13
        Caption = '-------'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object AllPHoursLabel: TLabel
        Left = 480
        Top = 1
        Width = 29
        Height = 13
        Caption = '-------'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object AGLabel: TLabel
        Left = 312
        Top = 17
        Width = 79
        Height = 13
        Caption = #1047#1072' '#1075#1088#1072#1092#1110#1082#1086#1084':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object AllGHoursLabel: TLabel
        Left = 392
        Top = 17
        Width = 21
        Height = 13
        Caption = '-------'
      end
      object SverhLabel: TLabel
        Left = 672
        Top = 1
        Width = 74
        Height = 13
        Caption = #1053#1072#1076#1091#1088#1086#1095#1085#1080#1093':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DaysCaptionLabel: TLabel
        Left = 192
        Top = 17
        Width = 77
        Height = 13
        Caption = #1044#1085#1110#1074' '#1088#1086#1073#1086#1090#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DaysLabel: TLabel
        Left = 272
        Top = 17
        Width = 9
        Height = 13
        Caption = '---'
      end
      object AllManLabel: TLabel
        Left = 3
        Top = 1
        Width = 130
        Height = 13
        Caption = #1059#1057#1068#1054#1043#1054' '#1079#1072' '#1083#1102#1076#1080#1085#1086#1102':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object AVihLabel: TLabel
        Left = 1
        Top = 17
        Width = 144
        Height = 13
        Caption = #1056#1086#1073#1086#1090#1072' '#1091' '#1074#1080#1093#1110#1076#1085#1080#1081' '#1076#1077#1085#1100':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object AllVHoursLabel: TLabel
        Left = 152
        Top = 17
        Width = 13
        Height = 13
        Caption = '---'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ACLabel: TLabel
        Left = 528
        Top = 1
        Width = 110
        Height = 13
        Caption = #1050#1072#1083#1077#1085#1076#1072#1088#1085#1080#1093' '#1076#1085#1110#1074':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CalDaysLabel: TLabel
        Left = 640
        Top = 1
        Width = 9
        Height = 13
        Caption = '---'
      end
      object Work1Label: TLabel
        Left = 440
        Top = 17
        Width = 58
        Height = 13
        Caption = #1055#1088#1072#1094#1102#1108' '#1079
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Work2Label: TLabel
        Left = 576
        Top = 17
        Width = 15
        Height = 13
        Caption = #1087#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DateBegLabel: TLabel
        Left = 504
        Top = 17
        Width = 36
        Height = 13
        Caption = '------------'
      end
      object DateEndLabel: TLabel
        Left = 600
        Top = 17
        Width = 84
        Height = 13
        Caption = '----------------------------'
      end
      object StavokLabel: TLabel
        Left = 736
        Top = 17
        Width = 9
        Height = 13
        Caption = '---'
      end
      object Label1: TLabel
        Left = 281
        Top = 1
        Width = 37
        Height = 13
        Caption = #1085#1110#1095#1085#1080#1093
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 321
        Top = 1
        Width = 66
        Height = 13
        Caption = #1089#1074#1103#1090#1082#1086#1074#1080#1093')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SverhEdit: TCheckEdit
        Left = 752
        Top = 1
        Width = 33
        Height = 16
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        InputSet = isDigitsDot
      end
    end
    object HoursPanel: TPanel
      Left = 1
      Top = 101
      Width = 793
      Height = 34
      Align = alBottom
      TabOrder = 2
      object HoursCaptionLabel: TLabel
        Left = 272
        Top = 2
        Width = 131
        Height = 13
        Caption = #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1075#1086#1076#1080#1085':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object HoursLabel: TLabel
        Left = 408
        Top = 2
        Width = 15
        Height = 13
        Caption = '-----'
      end
      object VihodCaptionLabel: TLabel
        Left = 137
        Top = 18
        Width = 71
        Height = 13
        Caption = #1058#1080#1087' '#1074#1080#1093#1086#1076#1091':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object VihodLabel: TLabel
        Left = 216
        Top = 18
        Width = 9
        Height = 13
        Caption = '---'
        ParentShowHint = False
        ShowHint = True
      end
      object NHLabel: TLabel
        Left = 456
        Top = 2
        Width = 43
        Height = 13
        Caption = #1053#1110#1095#1085#1080#1093':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object NHoursLabel: TLabel
        Left = 504
        Top = 2
        Width = 21
        Height = 13
        Caption = '-----'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PHLabel: TLabel
        Left = 552
        Top = 2
        Width = 67
        Height = 13
        Caption = #1057#1074#1103#1090#1082#1086#1074#1080#1093':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PHoursLabel: TLabel
        Left = 624
        Top = 2
        Width = 21
        Height = 13
        Caption = '-----'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GHLabel: TLabel
        Left = 680
        Top = 2
        Width = 79
        Height = 13
        Caption = #1047#1072' '#1075#1088#1072#1092#1110#1082#1086#1084':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GHoursLabel: TLabel
        Left = 768
        Top = 2
        Width = 15
        Height = 13
        Caption = '-----'
      end
      object WBegLabel: TLabel
        Left = 1
        Top = 2
        Width = 91
        Height = 13
        Caption = #1055#1086#1095#1072#1090#1086#1082' '#1079#1084#1110#1085#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object WorkBegLabel: TLabel
        Left = 104
        Top = 2
        Width = 15
        Height = 13
        Caption = '-----'
      end
      object WEndLabel: TLabel
        Left = 144
        Top = 2
        Width = 81
        Height = 13
        Caption = #1050#1110#1085#1077#1094#1100' '#1079#1084#1110#1085#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object WorkEndLabel: TLabel
        Left = 232
        Top = 2
        Width = 15
        Height = 13
        Caption = '-----'
      end
      object VihLabel: TLabel
        Left = 1
        Top = 18
        Width = 101
        Height = 13
        Caption = #1059' '#1074#1080#1093#1110#1076#1085#1080#1081' '#1076#1077#1085#1100':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object VHoursLabel: TLabel
        Left = 104
        Top = 18
        Width = 13
        Height = 13
        Caption = '---'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object WorkModePanel: TPanel
      Left = 1
      Top = 3
      Width = 793
      Height = 43
      Align = alBottom
      TabOrder = 3
      object Label4: TLabel
        Left = 600
        Top = 25
        Width = 40
        Height = 13
        Caption = #1043#1086#1076#1080#1085':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 710
        Top = 25
        Width = 32
        Height = 13
        Caption = #1044#1085#1110#1074':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object WorkModeChanges: TBitBtn
        Left = 16
        Top = 4
        Width = 153
        Height = 32
        Action = WorkModes
        Caption = #1047#1084#1110#1085#1080' '#1075#1088#1072#1092#1110#1082#1091'...(F9)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000530B0000530B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFC8B3A4694731694731694731694731694731694731694731694731
          6947316947316947316947316947316947316947316947316947316947316947
          31694731694731FF00FFFF00FFC8B3A4C8B3A4B7A293B7A293B7A293B7A293B7
          A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293
          B7A293B7A293B7A293B7A293694731FF00FFFF00FFC8B3A4DBD0C9B7A293C8B3
          A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFB7A293694731FF00FFFF00FFC3AFA1
          E2D9D4DBD0C9C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFB7A293694731FF
          00FFFF00FFC8B3A4F1ECEAE2D9D4C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFF
          FFB7A293694731FF00FFFF00FFC8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8
          B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4
          C8B3A4C8B3A4C8B3A4B7A293694731FF00FFFF00FFC8B3A4DBD0C9B7A293C8B3
          A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFB7A293694731FF00FFFF00FFC8B3A4
          E2D9D4DBD0C9C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFB7A293694731FF
          00FFFF00FFC8B3A4F1ECEAE2D9D4C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFF
          FFB7A293694731FF00FFFF00FFC8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8
          B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4
          C8B3A4C8B3A4C8B3A4B7A293694731FF00FFFF00FFC8B3A4DBD0C9B7A293C8B3
          A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFB7A293694731FF00FFFF00FFC8B3A4
          E2D9D4DBD0C9C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFB7A293694731FF
          00FFFF00FFC8B3A4F1ECEAE2D9D4C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFF
          FFB7A293694731FF00FFFF00FFC8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8
          B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4
          C8B3A4C8B3A4C8B3A4B7A293694731FF00FFFF00FFC8B3A4DBD0C9B7A293C8B3
          A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFB7A293694731FF00FFFF00FFC8B3A4
          E2D9D4DBD0C9C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFB7A293694731FF
          00FFFF00FFC8B3A4F1ECEAE2D9D4C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF694731FF00FFFF00FFC86000C86000C86000C86000C86000C86000C8
          6000C86000C86000C86000C86000C86000C86000C86000C86000C86000C86000
          C86000C86000C86000C86000983000FF00FFFF00FFC86000F8B65AF8B65AC860
          00F8B555F8B555F8B046F8A62AF89800C86000F8B555F8B555F8B046F8A62AF8
          9800C86000F8B555F8B555F8B046F8A62AF89800983000FF00FFFF00FFC86000
          F8B65AF8B65AC86000F8B555F8B555F8B555F8B046F8AB38C86000F8B555F8B5
          55F8B555F8B046F8AB38C86000F8B555F8B555F8B555F8B046F8AB38983000FF
          00FFFF00FFC86000C86000C86000C86000C86000C86000C86000C86000C86000
          C86000C86000C86000C86000C86000C86000C86000C86000C86000C86000C860
          00C86000983000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object NevihodButton: TBitBtn
        Left = 176
        Top = 5
        Width = 249
        Height = 32
        Caption = #1053#1077#1074#1080#1093#1086#1076#1080' '#1079#1072' '#1089#1083#1091#1078#1073#1086#1074#1086#1102' '#1079#1072#1087#1080#1089#1082#1086#1102'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = NevihodButtonClick
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000130B0000130B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF556AB5364BAA1F37AB1F37
          AB1F37AB364BAA556AB5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF364BAA32418512258D
          071D9A041BA1051B9E081C9314257D24326F24326F364BAAFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF556AB522349103
          1AAD011CCD001CDD001CE0001CE0001CDE001CDA011DD1011BB9061B94061B94
          24326FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF364B
          AA071EA3001CD5001DE9001DEA001DEA001DE9001DE8001DE6001DE3001DE100
          1DDD001CD7011BB80E208224326FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF364BAA021BB5011EEC001EF1001EF2001EF2001EF2001EF0001EEF001D
          ED001DEA001DE7001DE4001DE0001DDC011CCA081C8C24326FFF00FFFF00FFFF
          00FFFF00FFFF00FF556AB5041DB1001FF20122F50325F50427F50427F50427F5
          0324F50122F5001FF4001EF1001DEE001DEA001DE6001DE2001CDD011CCA061B
          9424326FFF00FFFF00FFFF00FFFF00FF172D9F0424E9082BF60D30F61134F613
          36F61336F61336F61034F60C2FF6082AF60325F5001FF4001EF0001DEC001DE7
          001DE2001DDD011BB6061B94FF00FFFF00FFFF00FF556AB50724C91033F6173A
          F61E40F62244F62447F72447F72447F72143F61C3FF61639F60F32F6072AF601
          22F5001EF1001DEC001DE7001DE2001CD8061B94364BAAFF00FFFF00FF1930A1
          1436ED1F41F62749F72E50F73455F73758F73758F73758F73354F72D4FF72648
          F71D40F61336F60A2CF60223F5001EF1001DEC001DE6001DE0011BBB061B94FF
          00FF556AB51F37AB2345F63652F06378F2667AF2677BF2657AF26278F16076F1
          5C73F1576EF0516AF04C65EF465FEF405AEE3954EE3550ED344FEB344FE90320
          E4011DD4031BB0364BAA364BAA1735CA3152F77789F3FFFFFFFFFFFFFEFEFEF8
          FAFDF0F3FCE8ECFBE0E6FAD8E0F9D1D9F8C9D4F7C0CEF6B8C6F5AFC0F3A7B9F2
          A1B5F2A1B5F20926E5001CDE1735CA2234911F37AB2140D63F5FF77A8BF3FFFF
          FFFFFFFFFFFFFFFEFEFEF9FAFDF1F4FCE8EDFBE0E6FAD8E0F9D1D9F8C9D4F7C1
          CEF6B9C7F5B1C0F3A8BAF2A2B5F20926E7001CE31735CA2234911F37AB2A48D7
          4C6AF77E8EF3FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF9FBFDF1F4FCE9EDFBE1E7
          FAD9E1F9D1DAF8CAD5F7C1CEF6B9C7F5B1C1F3A8BAF20926E8001DE61735CA22
          3491364BAA2D49D15773F88090F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF
          FAFBFEF1F4FCE9EDFBE1E7FAD9E1F9D2DAF8CAD5F7C2CFF6BAC8F5B1C1F40A27
          EA001DE61735CA223491556AB51F37AB607BF86175F0AFB8F6AFB8F6AFB8F6AF
          B8F6AFB8F6AFB8F6AEB8F6ABB5F5A6B1F4A0ACF39AA8F394A2F28F9EF18A9BF0
          8496F07F92F10724EB001DE3031BB0364BAAFF00FF1F37AB637EF57990F98EA1
          F9A5B4FABBC6FACED6FBD5DBFBCBD4FBB7C3FAA1B1FA8A9EF9758CF85F79F74A
          67F73656F62446F61436F50527F5001EF2011DD2061B94FF00FFFF00FF364BAA
          506AE07F95FA97A9FBB1BFFBCAD4FCE4E8FCF3F4FDE0E5FCC5D0FCACBBFB93A6
          FA7B92FA647FF84E6CF8395AF72648F71538F60527F6001EF2031BB0364BAAFF
          00FFFF00FFFF00FF263DB17B91F796A8FAAFBDFBC6D0FCDDE2FCE6EAFCD9E0FC
          C2CDFCABB9FB92A5FA7B92FA647EF84E6BF83959F72648F71538F60527F6001C
          DC223491FF00FFFF00FFFF00FFFF00FF556AB54D65D18EA2FAA4B5FBB8C5FBC7
          D1FCCCD5FCC6D0FCB5C2FBA1B2FB8B9FFA758DF95F7AF84A68F73657F72346F6
          1336F60527F2071EA5556AB5FF00FFFF00FFFF00FFFF00FFFF00FF344BAA637A
          E095A7FAA5B5FBB0BEFBB2C0FBAFBDFBA2B3FB91A5FA7F95FA6B85F95773F843
          63F73052F71F42F60F31F3031EB7364BAAFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF364BAA526AD28B9FF797A9FA99ABFB96A9FA8DA1FA8096FA7089
          F95F7AF84D6AF83B5BF7294BF71738EB0823B1364BAAFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF556AB52A42B1637AE17D93F77F95FA
          788FFA6D86F95F7BF8516EF84060F72D4DEE1533CB1A30A3556AB5FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF36
          4BAA263EAD1F37AB435DD6435FDE3955DB2A46CE1F37AB1B33A2364BAAFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF556AB5364BAA1F37AB1F37AB364BAA556AB5FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object HalfTimeButton: TBitBtn
        Left = 440
        Top = 5
        Width = 153
        Height = 32
        Caption = #1053#1077#1087#1086#1074#1085#1080#1081' '#1075#1088#1072#1092#1110#1082'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = HalfTimeButtonClick
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000530B0000530B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFC8B3A4404000404000404000404000404000404000404000404000
          4040004040004040004040004040004040004040004040004040004040004040
          00404000404000FF00FFFF00FFC8B3A4C8B3A4B7A293B7A293B7A293B7A293B7
          A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293
          B7A293B7A293B7A293B7A293404000FF00FFFF00FFC8B3A4DBD0C9B7A293C8B3
          A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8
          B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4B7A293404000FF00FFFF00FFC3AFA1
          E2D9D4DBD0C9C8B3A4808080808080808080808080808080C8B3A48080808080
          80808080808080808080C8B3A4808080808080808080808080B7A293404000FF
          00FFFF00FFC8B3A4F1ECEAE2D9D4C8B3A4808080808080808080808080808080
          C8B3A4808080808080808080808080808080C8B3A48080808080808080808080
          80B7A293404000FF00FFFF00FFC8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8
          B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4
          C8B3A4C8B3A4C8B3A4B7A293404000FF00FFFF00FFC8B3A4DBD0C9B7A293C8B3
          A4808080808080808080808080808080C8B3A480808080808080808080808080
          8080C8B3A4808080808080808080808080B7A293404000FF00FFFF00FFC8B3A4
          E2D9D4DBD0C9C8B3A4808080808080808080808080808080C8B3A48080808080
          80808080808080808080C8B3A4808080808080808080808080B7A293404000FF
          00FFFF00FFC8B3A4F1ECEAE2D9D4C8B3A4808080808080808080808080808080
          C8B3A4808080808080808080808080808080C8B3A48080808080808080808080
          80B7A293404000FF00FFFF00FFC8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8
          B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4
          C8B3A4C8B3A4C8B3A4B7A293404000FF00FFFF00FFC8B3A4DBD0C9B7A293C8B3
          A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFB7A293404000FF00FFFF00FFC8B3A4
          E2D9D4DBD0C9C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFB7A293404000FF
          00FFFF00FFC8B3A4F1ECEAE2D9D4C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFF
          FFB7A293404000FF00FFFF00FFC8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8
          B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4
          C8B3A4C8B3A4C8B3A4B7A293404000FF00FFFF00FFC8B3A4DBD0C9B7A293C8B3
          A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFB7A293404000FF00FFFF00FFC8B3A4
          E2D9D4DBD0C9C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFB7A293404000FF
          00FFFF00FFC8B3A4F1ECEAE2D9D4C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B3A4FFFFFFFFFFFFFFFFFFFFFF
          FFC8B3A4404000FF00FFFF00FF00800000800000800000800000800000800000
          8000008000008000008000008000008000008000008000008000008000008000
          008000008000008000008000404000FF00FFFF00FF00800080FF0080FF000080
          0080FF0080FF0080FF0080FF0080FF0000800080FF0080FF0080FF0080FF0080
          FF0000800080FF0080FF0080FF0080FF00008000404000FF00FFFF00FF008000
          80FF0080FF0000800080FF0080FF0080FF0080FF0080FF0000800080FF0080FF
          0080FF0080FF0080FF0000800080FF0080FF0080FF0080FF00008000404000FF
          00FFFF00FF008000008000008000008000008000008000008000008000008000
          0080000080000080000080000080000080000080000080000080000080000080
          00008000983000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object Hours_Norm_Edit: TCheckEdit
        Left = 640
        Top = 23
        Width = 33
        Height = 16
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        InputSet = isDigitsDot
      end
      object Days_Norm_Edit: TCheckEdit
        Left = 742
        Top = 23
        Width = 33
        Height = 16
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        InputSet = isDigits
      end
      object SetNorm: TBitBtn
        Left = 600
        Top = 3
        Width = 177
        Height = 18
        Caption = #1042#1089#1090#1072#1085#1086#1074#1080#1090#1080' '#1085#1086#1088#1084#1091'!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = SetNormClick
        Glyph.Data = {
          22030000424D22030000000000003600000028000000160000000B0000000100
          180000000000EC020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFFFFD7D2D108521AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE1E1E1777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFDCCFD500610100A500205C2EFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE0E0E0727272919191828282FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFFCCCCCA007B0039E336417559007500006300DFD2D9FFFF
          FFFFFFFFFFFFFFFFFFFFDCDCDC848585C2C1C19595957F7F7F717171E2E2E2FF
          FFFFFFFFFFFFFFFF0000FFFFFF69897124D354232E00DD6F7EE7F2F728832100
          6300FFFFFFFFFFFFFFFFFFFFFFFFA5A5A5C9C7C7737373A7A7A7F6F6F6929292
          6E6E6EFFFFFFFFFFFFFFFFFF0000FFFFFFC94E544A3A21D42933D24040B46163
          FFFFFF185F2810600EFFFFFFFFFFFFFFFFFF9A9A9A7978788B8B8B9695959899
          99FFFFFF8080807F7F7FFFFFFFFFFFFF0000C28A8AD07373C15256F0EFEFAF61
          61CD1D1DAE4A4AFFFFFF105810004400FFFFFFADADADBABABA9B9999F3F3F398
          9898838383959595FFFFFF7979796C6C6CFFFFFF0000EAD8D8B14343D59F9FFF
          FFFFFFFFFFE7E3E3B60000AA3F3FFFFFFFC7D0C74C704CF2EFF2908E8EC9C9C9
          FFFFFFFFFFFFEAEAEA7B7B7B8D8D8DFFFFFFDDDDDD9B9B9B0000FFFFFFE0C5C5
          FFFFFFFFFFFFFFFFFFFFFFFFE3D8D8E88C8CCC7979FFFFFFFFFFFFFFFFFFDADB
          DBFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4C1C1C1ADADADFFFFFFFFFFFF0000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3CCCCB56C6CFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFA4A4A4FFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000}
        NumGlyphs = 2
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 382
    Width = 795
    Height = 8
    Hint = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1081#1085#1072' '#1087#1072#1085#1077#1083#1100
    HotZoneClassName = 'TcxMediaPlayer9Style'
    AlignSplitter = salBottom
    Control = InfoPanel
    ShowHint = True
    ParentShowHint = False
  end
  object BufferQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT First_PBKey, Last_PBKey FROM ASUP_LTD_ONE_TABLE_EXPORT(:I' +
        'd_PCard, :Tbl_Year, :Tbl_Month)')
    Left = 408
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_PCard'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tbl_Year'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tbl_Month'
        ParamType = ptUnknown
      end>
  end
  object ActionList1: TActionList
    Left = 120
    Top = 216
    object WorkModes: TAction
      Caption = #1047#1084#1110#1085#1080' '#1075#1088#1072#1092#1110#1082#1091'...(F9)'
      ShortCut = 120
      OnExecute = WorkModesExecute
    end
  end
end
