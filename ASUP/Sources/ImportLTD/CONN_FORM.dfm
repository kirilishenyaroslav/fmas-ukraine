object Form1: TForm1
  Left = 291
  Top = 116
  Width = 490
  Height = 300
  Caption = #1047#1072#1073#1086#1088' '#1076#1072#1085#1085#1099#1093
  Color = clBtnFace
  Constraints.MaxHeight = 300
  Constraints.MaxWidth = 490
  Constraints.MinHeight = 300
  Constraints.MinWidth = 490
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Box1: TGroupBox
    Left = 8
    Top = 264
    Width = 465
    Height = 121
    Caption = #1086#1082#1085#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1076#1077#1081#1089#1090#1074#1080#1081
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Visible = False
    object done_Edit: TRichEdit
      Left = 8
      Top = 16
      Width = 449
      Height = 97
      TabStop = False
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        'Edit')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnChange = done_EditChange
    end
  end
  object Box2: TGroupBox
    Left = 8
    Top = 392
    Width = 465
    Height = 129
    Caption = #1086#1082#1085#1086' '#1086#1096#1080#1073#1086#1082
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Visible = False
    object error_edit: TRichEdit
      Left = 8
      Top = 16
      Width = 449
      Height = 105
      TabStop = False
      Color = clScrollBar
      Lines.Strings = (
        'error_edit')
      ReadOnly = True
      TabOrder = 0
      OnChange = error_EditChange
    end
  end
  object Panel: TPanel
    Left = 8
    Top = 160
    Width = 465
    Height = 89
    TabOrder = 2
    object CloseButton: TSpeedButton
      Left = 387
      Top = 19
      Width = 46
      Height = 46
      Hint = #1042#1099#1093#1086#1076
      Glyph.Data = {
        76020000424D7602000000000000760000002800000020000000200000000100
        0400000000000002000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777770007777777777777777777777777
        7777078007777777777777777777777777770738300777777777777777777777
        7777078383800777777777777777777777770738383830077777777777777777
        7777078383838380077777777777777770000738383838383000777777777777
        7088078383838383838077777777777770880738383838383830777777707777
        7088078383838383838077777700777770880738383838383830777770607777
        70880783838383838380777706E077777088073700383838383077706EE00000
        000007807083838383807706EEE6666666660737F73838383830706EEEEEEEEE
        EEEE078383838383838006EEEEEEEEEEEEEE07383838383838308EEEEEEEEEEE
        EEEE078383838383838078EEEEEEEEEEEEEE0738383838383830778EEEEEEEEE
        EEEE07838383838383807778EEE088888888073838383838383077778EE07777
        70880783838383838380777778E0777770880077383838383830777777807777
        7088880077838383838077777778777770888888007738383830777777777777
        7088888888007783838077777777777770888888888800773830777777777777
        7088888888888800778077777777777770888888888888880030777777777777
        7000000000000000000077777777777777777777777777777777}
      ParentShowHint = False
      ShowHint = True
      OnClick = CloseButtonClick
    end
    object ExchangeButton: TSpeedButton
      Left = 26
      Top = 19
      Width = 46
      Height = 46
      Hint = #1047#1072#1073#1086#1088' '#1076#1072#1085#1085#1099#1093
      Glyph.Data = {
        76020000424D7602000000000000760000002800000020000000200000000100
        0400000000000002000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888888888888888888800000000088888888888888888888000BF3F3
        F3B3000888888888888888003BFB3F3F3B3B38300888888888888733FFFFF3F3
        F3B3B333308888888888873B3BFB3F3F3B3B38000088888888888733FFFFF3F3
        F3B31199990088888888873B3BFB3F3F3B3199333099088888888733FFFFF3F3
        F3199333308890888888873B3BFB3F3F3B1998333088888888888733FFFFF3F3
        F199B333308888088888873B3BFB3F3F319938333088819088888733FFFFF3F3
        F199B333308819990888873B3BFB3F19999999033081999990888733FFFFF3F1
        99999033301999999908873B3BFB3F3F199908333088819088888733FFFFF3F3
        F190B333308881908888873B3BFB3F3F3B0B38333088819088888733FFFFF3F3
        F3B3B333308819088888873B3BFB3F3F3B3908333088190888888733FFFFF3F3
        F3B39003308190888888873B3BFB3F3F3B3B39900009088888888733FFFFF3F3
        F3B3B339999888888888873B3BFB3F3F3B3B38333088888888888733FFFFFFFF
        FBFBFBF3308888888888873FFFBFBFBFBFBFBFBF30888888888887FFFBFBFBFB
        FBFBFBFBF0888888888887BFFFBFBFBFBFBFBFBFB08888888888887BFBFBFBFB
        FBFBFBFB788888888888888777BFBFBFBFBFB777888888888888888888777777
        7777788888888888888888888888888888888888888888888888}
      ParentShowHint = False
      ShowHint = True
      OnClick = ExchangeButtonClick
    end
    object Bar: TProgressBar
      Left = 104
      Top = 32
      Width = 257
      Height = 25
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 24
    Width = 305
    Height = 129
    Caption = #1086#1082#1085#1086' '#1086#1073#1088#1072#1073#1086#1090#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object table_name: TLabel
      Left = 8
      Top = 24
      Width = 182
      Height = 16
      Caption = #1054#1073#1088#1072#1073#1072#1090#1099#1074#1072#1077#1090#1089#1103' '#1090#1072#1073#1083#1080#1094#1072' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object table: TLabel
      Left = 197
      Top = 24
      Width = 4
      Height = 19
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 56
      Width = 102
      Height = 16
      Caption = #1042#1089#1077#1075#1086' '#1079#1072#1087#1080#1089#1077#1081' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 88
      Width = 145
      Height = 16
      Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1085#1086' '#1079#1072#1087#1080#1089#1077#1081' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object all: TLabel
      Left = 112
      Top = 56
      Width = 5
      Height = 20
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -16
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object done: TLabel
      Left = 160
      Top = 88
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object GroupBox4: TGroupBox
    Left = 320
    Top = 24
    Width = 153
    Height = 129
    Caption = #1090#1072#1073#1083#1080#1094#1099' '#1076#1083#1103' '#1086#1073#1088#1072#1073#1086#1090#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object sp_podrb: TCheckBox
      Left = 8
      Top = 32
      Width = 97
      Height = 17
      Caption = 'SP_PODRB'
      TabOrder = 0
    end
    object waccount: TCheckBox
      Left = 8
      Top = 64
      Width = 97
      Height = 17
      Caption = 'WACCOUNT'
      TabOrder = 1
    end
    object nachisl: TCheckBox
      Left = 8
      Top = 96
      Width = 97
      Height = 17
      Caption = 'NACHISL'
      TabOrder = 2
    end
  end
  object upvchm_database: TpFIBDatabase
    DBName = 'd:\projects\upvchm\database\upvchm.gdb'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 296
    Top = 192
  end
  object u_dataset: TpFIBDataSet
    Database = upvchm_database
    Transaction = read_u
    Options = [poTrimCharFields, poRefreshAfterPost, poStartTransaction]
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 168
    Top = 192
    poSQLINT64ToBCD = True
  end
  object u_StoredProc: TpFIBStoredProc
    Database = upvchm_database
    Transaction = write_u
    Left = 136
    Top = 192
  end
  object write_u: TpFIBTransaction
    DefaultDatabase = upvchm_database
    TimeoutAction = TARollback
    Left = 200
    Top = 192
  end
  object read_u: TpFIBTransaction
    DefaultDatabase = upvchm_database
    TimeoutAction = TARollback
    Left = 232
    Top = 192
  end
  object HalcyonDataSet: THalcyonDataSet
    AutoFlush = False
    Exclusive = False
    LargeIntegerAs = asLargeInt
    LockProtocol = Default
    TranslateASCII = False
    UseDeleted = False
    UserID = 0
    OnNewRecord = HalcyonDataSetNewRecord
    Left = 264
    Top = 192
  end
  object Clear_WAccount: TpFIBQuery
    Database = upvchm_database
    Transaction = write_u
    Left = 168
    Top = 128
  end
end
