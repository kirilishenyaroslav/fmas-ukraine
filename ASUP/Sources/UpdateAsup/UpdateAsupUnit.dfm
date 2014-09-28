object UpdateForm: TUpdateForm
  Left = 178
  Top = 115
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1054#1085#1086#1074#1083#1077#1085#1085#1103' "'#1059#1087#1088#1072#1074#1083#1110#1085#1085#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1086#1084'"'
  ClientHeight = 192
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 32
    Width = 215
    Height = 13
    Caption = #1063#1072#1089' '#1076#1086' '#1074#1080#1093#1086#1076#1091' '#1079' '#1087#1088#1086#1075#1088#1072#1084#1080' ('#1093#1074#1080#1083#1080#1085'):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 81
    Height = 13
    Caption = #1057#1090#1072#1088#1080#1081' '#1092#1072#1081#1083':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 104
    Width = 76
    Height = 13
    Caption = #1053#1086#1074#1080#1081' '#1092#1072#1081#1083':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ExitLabel: TLabel
    Left = 16
    Top = 136
    Width = 19
    Height = 20
    Caption = '---'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBPathLabel: TLabel
    Left = 16
    Top = 8
    Width = 13
    Height = 13
    Caption = '---'
  end
  object OkButton: TBitBtn
    Left = 104
    Top = 158
    Width = 153
    Height = 25
    Caption = #1055#1086#1095#1072#1090#1080' '#1074#1110#1076#1083#1110#1082
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    OnClick = OkButtonClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888882222288888888822222222288888822222222222888822222222222
      22888222228F22222288222228FFF222222822228F8FF222222822222222FF22
      222822222222FF222228222222222FF22228822222222FF22288822222222222
      2288882222222222288888822222222288888888822222888888}
  end
  object CancelButton: TBitBtn
    Left = 296
    Top = 158
    Width = 97
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 1
    OnClick = CancelButtonClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888880888888888808880908888888889888999088888880888899998888880
      9888889990888809888888899908809988888888999009988888888889999988
      8888888880999088888888880999990888888800999889908888809999888899
      0888899998888889908889998888888889888888888888888888}
  end
  object ExitMinutes: TSpinEdit
    Left = 416
    Top = 27
    Width = 41
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 5
  end
  object OldFile: TEdit
    Left = 136
    Top = 60
    Width = 289
    Height = 21
    TabOrder = 3
  end
  object OpenButton: TButton
    Left = 424
    Top = 58
    Width = 33
    Height = 25
    Caption = '...'
    TabOrder = 4
    OnClick = OpenButtonClick
  end
  object NewFile: TEdit
    Left = 136
    Top = 100
    Width = 289
    Height = 21
    TabOrder = 5
  end
  object Button1: TButton
    Left = 424
    Top = 98
    Width = 33
    Height = 25
    Caption = '...'
    TabOrder = 6
    OnClick = Button1Click
  end
  object ChermetDatabase: TIBDatabase
    DatabaseName = 'server1212:d:\upvchm\database\upvchm.gdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = DefaultTransaction
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 240
    Top = 24
  end
  object DefaultTransaction: TIBTransaction
    Active = False
    DefaultDatabase = ChermetDatabase
    AutoStopAction = saNone
    Left = 272
    Top = 24
  end
  object WriteTransaction: TIBTransaction
    Active = False
    DefaultDatabase = ChermetDatabase
    DefaultAction = TARollback
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 304
    Top = 24
  end
  object ReadTransaction: TIBTransaction
    Active = False
    DefaultDatabase = ChermetDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 336
    Top = 24
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.exe'
    Filter = 'Exe-files (*.exe)|*.exe|All files (*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 384
  end
  object WorkQuery: TIBQuery
    Database = ChermetDatabase
    Transaction = WriteTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'EXECUTE PROCEDURE Util_Exit_Prog :Exit_Time')
    Left = 416
    Top = 144
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Exit_Time'
        ParamType = ptUnknown
      end>
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 48
    Top = 168
  end
end
