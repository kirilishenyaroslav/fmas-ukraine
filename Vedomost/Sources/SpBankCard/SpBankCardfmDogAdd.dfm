object fmSpBankCardfmDogAdd: TfmSpBankCardfmDogAdd
  Left = 235
  Top = 179
  Width = 537
  Height = 305
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
  object cxTextEditNumber: TcxTextEdit
    Left = 242
    Top = 16
    Width = 175
    Height = 21
    Properties.MaxLength = 25
    TabOrder = 1
  end
  object cxMemoComment: TcxMemo
    Left = 9
    Top = 172
    Width = 511
    Height = 57
    TabOrder = 5
  end
  object cxButtonEdit1: TcxButtonEdit
    Left = 9
    Top = 54
    Width = 379
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    TabOrder = 3
  end
  object cxButtonEdit2: TcxButtonEdit
    Left = 9
    Top = 111
    Width = 379
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
    TabOrder = 4
  end
  object cxDateEdit1: TcxDateEdit
    Left = 419
    Top = 16
    Width = 101
    Height = 21
    TabOrder = 2
  end
  object cxTextEditName: TcxTextEdit
    Left = 9
    Top = 16
    Width = 232
    Height = 21
    Properties.MaxLength = 30
    TabOrder = 0
  end
  object cxButton1: TcxButton
    Left = 352
    Top = 239
    Width = 153
    Height = 25
    Cancel = True
    Caption = 'cxButton1'
    TabOrder = 7
    OnClick = cxButton1Click
    Glyph.Data = {
      32040000424D3204000000000000360000002800000014000000110000000100
      180000000000FC030000120B0000120B00000000000000000000C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4B54A009C31009C3100C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4B54A00FFEFA5FFEFA55A31185A3118C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4B54A00FFEFA5FFEFA5FFE78CFFE78C313131313131C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      FF6331B54A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65A3131319C31009C31
      00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF31FFFF6331B5
      4A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65AFF9C00FF9C639C3100C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331B54A00FFEF
      A5FFEFA5000000080808FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4080808C8D0D4C8D0D4FF6331B54A00FFEFA5FFEFA5
      FFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4000000000000C8D0D4C8D0D4FF6331B54A00F7FFFFFFDE84FFDE84FF
      DE84FFDE84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000
      FFFFCE000000000000000000000000B54A00F7FFFFFFEFA5FFDE84FFDE84FFDE
      84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4000000FFFFCEFFFFCEFF
      FFBDFFC65AFFA510FF9C00B54A00F7FFFFFFEFA5FFDE84FFDE84FFCE63FFC65A
      FF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000FFFFCE0000000000
      00000000080808B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF
      9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4080808000000C8D0D4C8D0D4
      FF6331B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C31
      00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4FF31FFFF6331C6
      5A00C65A00FFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C009C3100C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD6
      73C65A00C65A00CE6363FFCE63FFC65AFF9C00FF9C009C3100C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD673FFD673
      FFD673C65A00C65A00CE6363FF9C00FF9C009C3100C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFDE84FFDE84FFDE84FFDE84FF
      DE84FFDE84C65A00C65A00C65A009C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4FF6331FF6331FF6331FF6331FF6331FF6331FF63
      31FF6331FF6331FF6331FF6331C8D0D4C8D0D4C8D0D4}
    UseSystemPaint = False
  end
  object cxButton2: TcxButton
    Left = 192
    Top = 239
    Width = 145
    Height = 25
    Caption = 'cxButton2'
    Default = True
    TabOrder = 6
    OnClick = cxButton2Click
    Glyph.Data = {
      AE010000424DAE01000000000000AE000000280000000F000000100000000100
      08000000000000010000C30E0000C30E00001E0000001E00000000000000FFFF
      FF008C5A5A009C6B6B00BD848400B58C8C00BDADAD00D6C6C600EFDEDE009C6B
      6300A57B7300C68C7B00F7DECE00FFE7D600F7DEC600EFDECE00FFF7EF00F7E7
      D600FFD6A500EFB56B00F7DEBD00F7E7CE00FFF7E700F7EFDE00FFFFF7004C80
      4C0052AE570069CA8000C8D0D400FFFFFF001C1C1C1C05020202020202020202
      1C001C1C1C1C051617171717171715021C001C1C1C1C05170C0E0E0E0E0F0F02
      1C001C1C1C1C05161212121212120F021C000502020205100E0E0E0E14150F09
      1C00051617170510150E0E0E0E110F031C0005170C0E0518121212191919190A
      1C000516121205180D0D11191A1A190A1C0005100E0E0501011919191A1A1919
      19000510150E050101191A1A1A1A1A1A190005181212050101191B1B1B1A1A1A
      190005180D0D0505051919191B1A19191900050101011818080706191B1A191C
      1C00050101011818050505191919191C1C0005010101010105130B1C1C1C1C1C
      1C0005050505050505041C1C1C1C1C1C1C00}
    UseSystemPaint = False
  end
  object cxLabel1: TcxLabel
    Left = 7
    Top = 1
    Width = 226
    Height = 17
    AutoSize = False
    TabOrder = 8
  end
  object cxLabel2: TcxLabel
    Left = 241
    Top = 0
    Width = 176
    Height = 17
    AutoSize = False
    TabOrder = 9
  end
  object cxLabel3: TcxLabel
    Left = 419
    Top = 1
    Width = 106
    Height = 17
    AutoSize = False
    TabOrder = 10
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 39
    Width = 353
    Height = 17
    AutoSize = False
    TabOrder = 11
  end
  object cxLabel5: TcxLabel
    Left = 7
    Top = 95
    Width = 465
    Height = 17
    AutoSize = False
    TabOrder = 12
  end
  object cxLabel6: TcxLabel
    Left = 7
    Top = 156
    Width = 457
    Height = 17
    AutoSize = False
    TabOrder = 13
  end
  object cxTextEdit1: TcxTextEdit
    Left = 9
    Top = 133
    Width = 512
    Height = 21
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 14
  end
  object cxTextEdit2: TcxTextEdit
    Left = 9
    Top = 77
    Width = 512
    Height = 21
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 15
  end
  object DB: TpFIBDatabase
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 264
    Top = 32
  end
  object DataSet: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    Left = 320
    Top = 32
    poSQLINT64ToBCD = True
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 368
    Top = 32
  end
  object ActionList1: TActionList
    Left = 440
    Top = 128
    object SelectLang: TAction
      Caption = 'SelectLang'
      ShortCut = 24652
      OnExecute = SelectLangExecute
    end
  end
end
