object fmAddOstatkiAvance: TfmAddOstatkiAvance
  Left = 291
  Top = 104
  Width = 427
  Height = 559
  Caption = 'fmAddOstatkiAvance'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 215
    Width = 401
    Height = 177
    Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1087#1088#1086#1074#1086#1076#1082#1077
    TabOrder = 2
    object cxMRUEditKekv: TcxMRUEdit
      Left = 270
      Top = 138
      Width = 121
      Height = 21
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxMRUEditKekvPropertiesButtonClick
      TabOrder = 3
    end
    object cxMRUEditState: TcxMRUEdit
      Left = 270
      Top = 95
      Width = 121
      Height = 21
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxMRUEditStatePropertiesButtonClick
      TabOrder = 2
    end
    object cxMRUEditRazd: TcxMRUEdit
      Left = 270
      Top = 54
      Width = 121
      Height = 21
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxMRUEditRazdPropertiesButtonClick
      TabOrder = 1
    end
    object cxMRUEditSmeta: TcxMRUEdit
      Left = 270
      Top = 12
      Width = 121
      Height = 21
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxMRUEditSmetaPropertiesButtonClick
      TabOrder = 0
    end
    object cxLabelSmeta: TcxLabel
      Left = 8
      Top = 13
      Width = 249
      Height = 17
      TabStop = False
      AutoSize = False
      TabOrder = 4
    end
    object cxLabelRazd: TcxLabel
      Left = 8
      Top = 56
      Width = 252
      Height = 17
      TabStop = False
      AutoSize = False
      TabOrder = 5
    end
    object cxLabelState: TcxLabel
      Left = 7
      Top = 97
      Width = 251
      Height = 17
      TabStop = False
      AutoSize = False
      TabOrder = 6
    end
    object cxLabelKekv: TcxLabel
      Left = 7
      Top = 140
      Width = 253
      Height = 17
      TabStop = False
      AutoSize = False
      TabOrder = 7
    end
    object cxLabel6: TcxLabel
      Left = 8
      Top = 31
      Width = 377
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = [fsBold]
      TabOrder = 8
      Caption = ''
    end
    object cxLabel7: TcxLabel
      Left = 8
      Top = 75
      Width = 377
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = [fsBold]
      TabOrder = 9
      Caption = ''
    end
    object cxLabel8: TcxLabel
      Left = 7
      Top = 115
      Width = 377
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = [fsBold]
      TabOrder = 10
      Caption = ''
    end
    object cxLabel9: TcxLabel
      Left = 7
      Top = 157
      Width = 377
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = [fsBold]
      TabOrder = 11
      Caption = ''
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 6
    Width = 401
    Height = 140
    TabOrder = 0
    object cxMRUEditFio: TcxMRUEdit
      Left = 144
      Top = 11
      Width = 249
      Height = 21
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxMRUEditFioPropertiesButtonClick
      TabOrder = 0
    end
    object cxMRUEditSch: TcxMRUEdit
      Left = 271
      Top = 69
      Width = 121
      Height = 21
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxMRUEditSchPropertiesButtonClick
      TabOrder = 1
    end
    object cxLabelSch: TcxLabel
      Left = 7
      Top = 72
      Width = 241
      Height = 17
      TabStop = False
      AutoSize = False
      TabOrder = 3
    end
    object cxLabelFio: TcxLabel
      Left = 5
      Top = 13
      Width = 140
      Height = 17
      TabStop = False
      AutoSize = False
      TabOrder = 4
      Caption = #1060#1048#1054' '#1087#1086#1076#1086#1090#1095#1105#1090#1085#1086#1075#1086' '#1083#1080#1094#1072
    end
    object cxComboBoxDeb: TcxComboBox
      Left = 271
      Top = 110
      Width = 121
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.ReadOnly = False
      TabOrder = 2
    end
    object cxLabelDeb: TcxLabel
      Left = 6
      Top = 112
      Width = 246
      Height = 17
      TabStop = False
      AutoSize = False
      TabOrder = 5
    end
    object cxLabel2: TcxLabel
      Left = 7
      Top = 50
      Width = 133
      Height = 17
      AutoSize = False
      TabOrder = 6
    end
    object cxLabel3: TcxLabel
      Left = 148
      Top = 49
      Width = 77
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
      Caption = ''
    end
    object cxLabel4: TcxLabel
      Left = 228
      Top = 48
      Width = 85
      Height = 17
      AutoSize = False
      TabOrder = 8
    end
    object cxLabel5: TcxLabel
      Left = 312
      Top = 47
      Width = 73
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 9
      Caption = ''
    end
    object cxLabel10: TcxLabel
      Left = 7
      Top = 90
      Width = 377
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = [fsBold]
      TabOrder = 10
      Caption = ''
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 155
    Width = 401
    Height = 61
    TabOrder = 1
    object cxTextEditSumma: TcxTextEdit
      Left = 271
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyPress = cxTextEditSummaKeyPress
    end
    object cxLabelSumma: TcxLabel
      Left = 8
      Top = 12
      Width = 249
      Height = 17
      TabStop = False
      AutoSize = False
      TabOrder = 2
    end
    object cxLabel11: TcxLabel
      Left = 9
      Top = 34
      Width = 240
      Height = 17
      TabStop = False
      AutoSize = False
      TabOrder = 3
    end
    object cxDateEditWozOst: TcxDateEdit
      Left = 271
      Top = 33
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 466
    Width = 401
    Height = 49
    Caption = #1050#1085#1086#1087#1082#1080' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103
    TabOrder = 4
    object cxButtonExit: TcxButton
      Left = 248
      Top = 16
      Width = 123
      Height = 25
      Action = ActionExit
      TabOrder = 1
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF009C3100009C310000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FFEFA500FFEFA5005A3118005A31
        1800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FFEFA500FFEFA500FFE78C00FFE7
        8C0031313100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF633100FFEFA500FFEFA500FFE78C00FFE7
        8C00FFC65A00313131009C3100009C310000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF31FF00FF633100FFEFA500FFEFA500FFE78C00FFE7
        8C00FFC65A00FF9C0000FF9C63009C310000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF633100FFEFA500FFEFA500000000000808
        0800FFC65A00FF9C0000FF9C63009C310000FF00FF00FF00FF00FF00FF00FF00
        FF0008080800FF00FF00FF00FF00FF633100FFEFA500FFEFA500FFDE8400FFDE
        8400FFC65A00FF9C0000FF9C63009C310000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FF00FF00FF00FF00FF633100F7FFFF00FFDE8400FFDE8400FFDE
        8400FFC65A00FF9C0000FF9C63009C310000FF00FF00FF00FF0000000000FFFF
        CE00FFFFBD00FFC65A00FFA51000FF9C0000F7FFFF00FFEFA500FFDE8400FFDE
        8400FFC65A00FF9C0000FF9C63009C310000FF00FF00FF00FF00FF00FF000000
        000000000000000000000000000008080800F7FFFF00FFFFFF00FFDE8400FFDE
        8400FFC65A00FF9C0000FF9C63009C310000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FF00FF00FF00FF00FF633100F7FFFF00FFFFFF00FFDE8400FFDE
        8400FFC65A00FF9C0000FF9C63009C310000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FF00FF00FF31FF00FF633100C65A0000FFFFFF00FFDE8400FFDE
        8400FFC65A00FF9C0000FF9C00009C310000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF633100FFD67300C65A0000C65A0000CE63
        6300FFC65A00FF9C0000FF9C00009C310000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF633100FFD67300FFD67300FFD67300C65A
        0000CE636300FF9C0000FF9C00009C310000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF633100FFDE8400FFDE8400FFDE8400FFDE
        8400C65A0000C65A0000C65A00009C310000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF633100FF633100FF633100FF633100FF63
        3100FF633100FF633100FF633100FF633100FF00FF00FF00FF00}
    end
    object cxButtonAdd: TcxButton
      Left = 120
      Top = 16
      Width = 123
      Height = 25
      Caption = 'ActionChange'
      TabOrder = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF008C5A
        5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
        5A008C5A5A008C5A5A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F7EF
        DE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDE
        CE00F7EFDE008C5A5A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F7EF
        DE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDE
        CE00F7EFDE008C5A5A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFF7
        E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
        A500F7E7CE008C5A5A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFF7
        E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7
        CE00F7E7CE008C5A5A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F7EF
        DE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDE
        CE00EFDECE008C5A5A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFF7
        E70045454500FFD6A50045454500FFD6A5001F1F1F00FFD6A500FFD6A500FFD6
        A500EFDECE009C6B6300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFF7
        EF00F7DEC600F7DEC600F7DEC6001F1F1F001F1F1F00F7DEC600F7DEBD00F7E7
        CE00EFDECE009C6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFF7
        EF00F7E7CE00F7DEC6001F1F1F001F1F1F001F1F1F00F7DEC600F7DEC600F7E7
        D600EFDECE009C6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFF
        F700FFD6A5001F1F1F008484840000FFFF001F1F1F00FFD6A500FFD6A500FFD6
        A500EFDECE009C6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFF
        F700FFE7D6001F1F1F00C6C6C60000FFFF001F1F1F00FFE7D600FF00FF00FF00
        FF00FF00FF009C6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFF
        FF001F1F1F008484840000FFFF001F1F1F00FFFFF700FFFFF700FF00FF00FFFF
        FF00C68C7B00C8D0D400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004545
        450084848400C6C6C60000FFFF001F1F1F00FFFFFF00FFFFFF00FF00FF00C68C
        7B00C8D0D400C8D0D400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF001F1F
        1F001F1F1F0000FFFF001F1F1F00FF00FF00FF00FF00FF00FF00FF00FF00C8D0
        D400C8D0D400C8D0D400FF00FF00FF00FF00FF00FF00FF00FF001F1F1F000000
        8400000084001F1F1F00C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
        D400C8D0D400C8D0D400FF00FF00FF00FF00FF00FF00FF00FF00C8D0D4001F1F
        1F001F1F1F001F1F1F00C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
        D400C8D0D400C8D0D400FF00FF00FF00FF00FF00FF00FF00FF00}
    end
  end
  object cxLabel1: TcxLabel
    Left = 17
    Top = 145
    Width = 256
    Height = 17
    AutoSize = False
    TabOrder = 5
    Visible = False
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 391
    Width = 401
    Height = 73
    Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1087#1088#1080#1082#1072#1079#1091
    TabOrder = 3
    object SpeedButton1: TSpeedButton
      Left = 360
      Top = 17
      Width = 33
      Height = 47
      Flat = True
      Glyph.Data = {
        EE030000424DEE03000000000000360000002800000012000000110000000100
        180000000000B803000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECFFFFFF0000FFFFFFFFFFFFD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECFFFFFF
        0000FFFFFFFFFFFFD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECFFFFFF0000FFFFFFFFFFFF
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECFFFFFF0000FFFFFFFFFFFFD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECFFFFFF0000FFFFFFFFFFFFD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECFFFFFF
        0000FFFFFFFFFFFFD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECFFFFFF0000FFFFFFFFFFFF
        D8E9ECD8E9EC000000000000D8E9ECD8E9EC000000000000D8E9ECD8E9EC0000
        00000000D8E9ECD8E9ECD8E9ECFFFFFF0000FFFFFFFFFFFFD8E9ECD8E9EC0000
        00000000D8E9ECD8E9EC000000000000D8E9ECD8E9EC000000000000D8E9ECD8
        E9ECD8E9ECFFFFFF0000FFFFFFFFFFFFD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECFFFFFF
        0000FFFFFFFFFFFFD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECFFFFFF0000FFFFFFFFFFFF
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECFFFFFF0000FFFFFFFFFFFFD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECFFFFFF0000FFFFFFFFFFFFD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECFFFFFF
        0000FFFFFFFFFFFFD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
      OnClick = SpeedButton1Click
    end
    object cxMemo1: TcxMemo
      Left = 8
      Top = 16
      Width = 353
      Height = 49
      Properties.ReadOnly = True
      TabOrder = 0
    end
  end
  object cxLabel12: TcxLabel
    Left = 15
    Top = 39
    Width = 133
    Height = 17
    AutoSize = False
    TabOrder = 6
  end
  object cxLabel13: TcxLabel
    Left = 156
    Top = 38
    Width = 77
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
    Caption = ''
  end
  object ActionList1: TActionList
    Images = fmMainOstatkiAvance.ImageList1
    Left = 334
    Top = 104
    object ActionAdd: TAction
      Caption = 'ActionAdd'
      ImageIndex = 1
      ShortCut = 121
      OnExecute = ActionAddExecute
    end
    object ActionExit: TAction
      Caption = 'ActionExit'
      ImageIndex = 5
      ShortCut = 27
      OnExecute = ActionExitExecute
    end
    object ActionShow: TAction
      Caption = 'ActionShow'
      ShortCut = 57431
      OnExecute = ActionShowExecute
    end
  end
  object StoredProcA: TpFIBStoredProc
    Database = pFIBDatabase1
    Transaction = TransactionWrite
    Left = 304
    Top = 104
  end
  object TransactionWrite: TpFIBTransaction
    DefaultDatabase = fmMainOstatkiAvance.pFIBDatabase1
    TimeoutAction = TARollback
    Left = 240
    Top = 104
  end
  object DataSet: TpFIBDataSet
    Database = fmMainOstatkiAvance.pFIBDatabase1
    Transaction = fmMainOstatkiAvance.pFIBTransaction1
    Left = 96
    Top = 104
    poSQLINT64ToBCD = True
  end
  object pFIBDatabase1: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 184
    Top = 104
  end
  object TransactionRead: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 184
    Top = 159
  end
end
