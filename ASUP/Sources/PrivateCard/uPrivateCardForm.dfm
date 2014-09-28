object fmPrivateCard: TfmPrivateCard
  Left = 269
  Top = 147
  Width = 780
  Height = 527
  Caption = #1054#1089#1086#1073#1080#1089#1090#1072' '#1082#1072#1088#1090#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 18
    Width = 772
    Height = 434
    Align = alClient
    MultiLine = True
    TabOrder = 0
    OnChange = PageControlChange
  end
  object Panel1: TPanel
    Left = 0
    Top = 452
    Width = 772
    Height = 41
    Align = alBottom
    TabOrder = 1
    object CloseButton: TBitBtn
      Left = 656
      Top = 8
      Width = 91
      Height = 25
      Action = CloseAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 0
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 18
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 772
      Height = 18
      Align = alClient
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object ActionList: TActionList
    Left = 704
    Top = 420
    object CloseAction: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ShortCut = 27
      OnExecute = CloseActionExecute
    end
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'password=masterkey'
      'user_name=sysdba')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 32
  end
  object PCardModules: TpFIBDataSet
    Database = DB
    Transaction = WriteTransaction
    UpdateTransaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ASUP_MODULES'
      'WHERE PARENT_NAME = '#39'PCARD_DETAILS'#39
      'order by id_order')
    Left = 56
    Top = 32
    poSQLINT64ToBCD = True
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 24
    Top = 64
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 56
    Top = 64
  end
end
