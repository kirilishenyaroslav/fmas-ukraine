object DM: TDM
  OldCreateOrder = False
  Left = 245
  Top = 177
  Height = 112
  Width = 283
  object MainDatabase: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 24
    Top = 16
  end
  object ReadTransaction: TIBTransaction
    Active = False
    DefaultDatabase = MainDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 200
    Top = 16
  end
  object WriteTransaction: TIBTransaction
    Active = False
    DefaultDatabase = MainDatabase
    DefaultAction = TARollback
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 112
    Top = 16
  end
end
