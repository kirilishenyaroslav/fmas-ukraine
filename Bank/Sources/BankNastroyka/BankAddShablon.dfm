object fmBankAddShablon: TfmBankAddShablon
  Left = 377
  Top = 243
  BorderStyle = bsDialog
  Caption = 'fmBankAddShablon'
  ClientHeight = 404
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    626
    404)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel
    Left = 8
    Top = 8
    Width = 618
    Height = 354
    Anchors = [akLeft, akTop, akRight]
  end
  object Bevel2: TBevel
    Left = -1
    Top = 368
    Width = 639
    Height = 9
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsBottomLine
  end
  object cxButtonEditRSN: TcxButtonEdit
    Left = 217
    Top = 16
    Width = 394
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditRSNPropertiesButtonClick
    Style.Color = 15204351
    TabOrder = 0
  end
  object cxButtonEditRSK: TcxButtonEdit
    Left = 218
    Top = 61
    Width = 392
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditRSKPropertiesButtonClick
    Style.Color = 15204351
    TabOrder = 1
  end
  object cxButtonEditSchK: TcxButtonEdit
    Left = 217
    Top = 102
    Width = 394
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditSchKPropertiesButtonClick
    Style.Color = 15204351
    TabOrder = 2
  end
  object cxButtonEditSm: TcxButtonEdit
    Left = 217
    Top = 147
    Width = 394
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditSmPropertiesButtonClick
    Style.Color = 15204351
    TabOrder = 3
  end
  object cxButtonEditKekv: TcxButtonEdit
    Left = 217
    Top = 282
    Width = 394
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditKekvPropertiesButtonClick
    Style.Color = 15204351
    TabOrder = 4
  end
  object cxButtonEditDog: TcxButtonEdit
    Left = 217
    Top = 325
    Width = 394
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditDogPropertiesButtonClick
    Style.Color = 15204351
    TabOrder = 5
  end
  object cxButtonWrite: TcxButton
    Left = 252
    Top = 380
    Width = 115
    Height = 22
    Caption = #1047#1072#1087#1080#1089#1072#1090#1080
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = cxButtonWriteClick
    LookAndFeel.NativeStyle = False
  end
  object cxButtonCancel: TcxButton
    Left = 411
    Top = 380
    Width = 115
    Height = 22
    Cancel = True
    Caption = #1042'i'#1076#1084'i'#1085#1080#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = cxButtonCancelClick
    LookAndFeel.NativeStyle = False
  end
  object cxTextEditRazd: TcxTextEdit
    Left = 218
    Top = 191
    Width = 393
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Style.Color = 15204351
    TabOrder = 8
    OnKeyPress = cxTextEditRazdKeyPress
  end
  object cxTextEditStat: TcxTextEdit
    Left = 218
    Top = 234
    Width = 393
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Style.Color = 15204351
    TabOrder = 9
    OnKeyPress = cxTextEditRazdKeyPress
  end
  object cxLabel3: TcxLabel
    Left = 19
    Top = 18
    Width = 180
    Height = 31
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 10
    Caption = ''
  end
  object cxLabel1: TcxLabel
    Left = 19
    Top = 58
    Width = 180
    Height = 18
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 11
    Caption = ''
  end
  object cxLabel2: TcxLabel
    Left = 19
    Top = 102
    Width = 185
    Height = 18
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 12
    Caption = ''
  end
  object cxLabel4: TcxLabel
    Left = 19
    Top = 147
    Width = 180
    Height = 18
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 13
    Caption = ''
  end
  object cxLabel5: TcxLabel
    Left = 19
    Top = 191
    Width = 180
    Height = 18
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 14
    Caption = ''
  end
  object cxLabel6: TcxLabel
    Left = 19
    Top = 234
    Width = 180
    Height = 18
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 15
    Caption = ''
  end
  object cxLabel7: TcxLabel
    Left = 19
    Top = 281
    Width = 180
    Height = 18
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 16
    Caption = ''
  end
  object cxLabel8: TcxLabel
    Left = 19
    Top = 325
    Width = 180
    Height = 18
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 17
    Caption = ''
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Left = 56
    Top = 368
  end
  object pFIBDatabase1: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 368
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 88
    Top = 368
  end
  object DataSet: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    Left = 121
    Top = 371
    poSQLINT64ToBCD = True
  end
  object pFIBTransactionWrite: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 168
    Top = 363
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 385
    Top = 59
  end
  object pFIBTransactionBase: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 428
    Top = 54
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 104
    Top = 240
  end
end
