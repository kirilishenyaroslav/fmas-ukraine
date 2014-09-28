object InsForm: TInsForm
  Left = 211
  Top = 71
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Генератор инсталляционного скрипта'
  ClientHeight = 562
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 81
    Height = 13
    Caption = 'База данных:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 90
    Height = 13
    Caption = 'Пользователь:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 320
    Top = 56
    Width = 49
    Height = 13
    Caption = 'Пароль:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 56
    Top = 180
    Width = 69
    Height = 13
    Caption = 'Обработка:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 56
    Top = 208
    Width = 70
    Height = 13
    Caption = 'Исключать:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 56
    Top = 280
    Width = 69
    Height = 13
    Caption = 'Обработка:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 56
    Top = 320
    Width = 70
    Height = 13
    Caption = 'Исключать:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 16
    Top = 344
    Width = 43
    Height = 13
    Caption = 'Скрипт'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 16
    Top = 88
    Width = 69
    Height = 13
    Caption = 'Кодировка:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 480
    Top = 544
    Width = 62
    Height = 13
    Caption = '(c) Qizz 2003'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object PathEdit: TEdit
    Left = 144
    Top = 20
    Width = 385
    Height = 21
    TabOrder = 0
    Text = 'ws102_server:e:\database\upvchm.gdb'
  end
  object UserEdit: TEdit
    Left = 144
    Top = 52
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'SYSDBA'
  end
  object PasswordEdit: TEdit
    Left = 400
    Top = 52
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
    Text = 'masterke'
  end
  object OkButton: TBitBtn
    Left = 286
    Top = 520
    Width = 97
    Height = 25
    Caption = 'Создать'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = OkButtonClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777772222277777777722222222277777722222222222777722222222222
      22777222227F22222277222227FFF222222722227F7FF222222722222222FF22
      222722222222FF222227222222222FF22227722222222FF22277722222222222
      2277772222222222277777722222222277777777722222777777}
  end
  object CancelButton: TBitBtn
    Left = 398
    Top = 520
    Width = 97
    Height = 25
    Cancel = True
    Caption = 'Закрыть'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 13
    OnClick = CancelButtonClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777770777777777707770907777777779777999077777770777799997777770
      9777779990777709777777799907709977777777999009977777777779999977
      7777777770999077777777770999990777777700999779907777709999777799
      0777799997777779907779997777777779777777777777777777}
  end
  object GenBox: TCheckBox
    Left = 16
    Top = 128
    Width = 185
    Height = 17
    Caption = 'Обрабатывать генераторы'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 4
  end
  object GenProc: TEdit
    Left = 136
    Top = 176
    Width = 257
    Height = 21
    TabOrder = 6
    Text = 'g = GEN_ID(%g,:Id_Server-GEN_ID(%g,0));'
  end
  object GenExcept: TEdit
    Left = 136
    Top = 208
    Width = 257
    Height = 21
    TabOrder = 7
    Text = 'RDB$,IBE$,SQL$'
  end
  object TablesBox: TCheckBox
    Left = 16
    Top = 248
    Width = 169
    Height = 17
    Caption = 'Обрабатывать таблицы'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 8
  end
  object TableProc: TEdit
    Left = 136
    Top = 276
    Width = 257
    Height = 21
    TabOrder = 9
    Text = 'DELETE FROM %t;'
  end
  object TablesExcept: TEdit
    Left = 136
    Top = 316
    Width = 257
    Height = 21
    TabOrder = 10
    Text = 'INI_, RDB$,SYS_OPTIONS'
  end
  object ScriptMemo: TMemo
    Left = 16
    Top = 360
    Width = 515
    Height = 153
    OEMConvert = True
    ParentShowHint = False
    ShowHint = False
    TabOrder = 11
    WantReturns = False
    WordWrap = False
  end
  object CopyButton: TBitBtn
    Left = 40
    Top = 520
    Width = 113
    Height = 25
    Caption = 'В буфер!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnClick = CopyButtonClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777000000000
      0007770FFFFFFFFFFF07770FFFFFFFFFFF07707F777777777F07770FFFFFFFFF
      FF07707F777777777F07770FFFFFFFFFFF07707F777777777F07770FFFFFFFFF
      FF07707F777777777F07770FFFFFFFFFFF07707F777777777F07770FFFFFFFFF
      FF07707F777777777F07770FFFFFFFFFFF077788888888888877}
  end
  object CharsetEdit: TEdit
    Left = 144
    Top = 84
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'WIN1251'
  end
  object IdServerBox: TCheckBox
    Left = 56
    Top = 152
    Width = 257
    Height = 17
    Caption = 'Писать процедуру получения Id_Server'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 5
  end
  object DB: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterke'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = DefaultTransaction
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 456
  end
  object GenQuery: TIBQuery
    Database = DB
    Transaction = DefaultTransaction
    CachedUpdates = False
    SQL.Strings = (
      'SELECT RDB$GENERATOR_NAME'
      'FROM RDB$GENERATORS;')
    Left = 456
    Top = 136
    object GenQueryRDBGENERATOR_NAME: TIBStringField
      FieldName = 'RDB$GENERATOR_NAME'
      Size = 31
    end
  end
  object DefaultTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DB
    Left = 496
  end
  object TablesQuery: TIBQuery
    Database = DB
    Transaction = DefaultTransaction
    CachedUpdates = False
    SQL.Strings = (
      'SELECT RDB$RELATION_NAME'
      'FROM RDB$RELATIONS R'
      'WHERE NOT EXISTS'
      '(SELECT * FROM RDB$VIEW_RELATIONS V'
      'WHERE V.RDB$VIEW_NAME = R.RDB$RELATION_NAME)')
    Left = 456
    Top = 216
    object TablesQueryRDBRELATION_NAME: TIBStringField
      FieldName = 'RDB$RELATION_NAME'
      Size = 31
    end
  end
  object RefQuery: TIBQuery
    Database = DB
    Transaction = DefaultTransaction
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT C1.Rdb$Relation_Name AS Master, C2.Rdb$Relation_Name AS D' +
        'etail'
      'FROM Rdb$Relation_Constraints C1, Rdb$Relation_Constraints C2,'
      'Rdb$Ref_Constraints R'
      'WHERE'
      'C1.Rdb$Constraint_Name = R.Rdb$Constraint_Name'
      'AND C2.Rdb$Constraint_Name = R.Rdb$Const_Name_Uq'
      'AND C1.Rdb$Constraint_Type = '#39'FOREIGN KEY'#39
      'AND C2.Rdb$Constraint_Type = '#39'PRIMARY KEY'#39
      'ORDER BY C1.Rdb$Relation_Name')
    Left = 456
    Top = 280
  end
end
