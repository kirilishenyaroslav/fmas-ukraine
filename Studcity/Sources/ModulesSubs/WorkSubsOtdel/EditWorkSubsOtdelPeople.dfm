object frmEditWorkSubsOtdelPeople: TfrmEditWorkSubsOtdelPeople
  Left = 282
  Top = 311
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmEditWorkSubsOtdelPeople'
  ClientHeight = 140
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 119
    Width = 501
    Height = 21
    Panels = <>
  end
  object cxButtonFind: TcxButton
    Left = 8
    Top = 80
    Width = 105
    Height = 25
    Caption = 'cxButtonFind'
    TabOrder = 2
    OnClick = cxButtonFindClick
  end
  object cxButtonEnter: TcxButton
    Left = 248
    Top = 80
    Width = 121
    Height = 25
    Caption = 'cxButtonEnter'
    Default = True
    TabOrder = 0
    OnClick = cxButtonEnterClick
  end
  object cxButtonClose: TcxButton
    Left = 376
    Top = 80
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'cxButtonClose'
    TabOrder = 1
    OnClick = cxButtonCloseClick
  end
  object cxLabel1: TcxLabel
    Left = 0
    Top = 0
    Width = 264
    Height = 17
    TabOrder = 4
    Caption = 
      'cxLabel1                                                        ' +
      '               '
  end
  object cxLabelFIOSubs: TcxLabel
    Left = 24
    Top = 16
    Width = 161
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
    Caption = 'cxLabelFIOSubs               '
  end
  object cxLabel2: TcxLabel
    Left = 0
    Top = 32
    Width = 25
    Height = 17
    TabOrder = 6
    Caption = 'cxL'
  end
  object cxLabelFIO: TcxLabel
    Left = 24
    Top = 32
    Width = 381
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
    Caption = 
      'cxLabelFIO                                                      ' +
      '                       '
  end
  object cxLabel3: TcxLabel
    Left = 0
    Top = 48
    Width = 416
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 8
    Caption = 
      'cxLabel3                                                        ' +
      '                                 '
  end
  object cxLabel4: TcxLabel
    Left = 0
    Top = 64
    Width = 51
    Height = 17
    TabOrder = 9
  end
  object cxLabelSumma: TcxLabel
    Left = 64
    Top = 64
    Width = 93
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 10
  end
  object cxLabelFAK: TcxLabel
    Left = 408
    Top = 32
    Width = 92
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 11
    Caption = 'cxLabelFAK    '
  end
  object Database: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 176
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 208
  end
  object pFIBDataSetGetPeople: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from ST_DT_RZLIST'
      'where ST_DT_RZLIST.id_key=:PARAM_KEY')
    Left = 240
    poSQLINT64ToBCD = True
  end
  object pFIBDataSetCorrect: TpFIBDataSet
    SelectSQL.Strings = (
      'select ST_DT_PFIO.*, sp_department.name_short'
      
        'from ST_DT_PFIO left join sp_department on ST_DT_PFIO.n_fak= sp_' +
        'department.id_department'
      'where ST_DT_PFIO.nom_act=:PARAM_ACT')
    Left = 272
    poSQLINT64ToBCD = True
  end
  object ActionList: TActionList
    Left = 192
    Top = 80
    object Find: TAction
      Caption = 'Find'
      ShortCut = 118
      OnExecute = FindExecute
    end
    object OK: TAction
      Caption = 'OK'
      ShortCut = 121
      OnExecute = OKExecute
    end
  end
  object pFIBDataSetGetFak: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select sp_department.name_short'
      'from st_dt_pfio,sp_department'
      'where st_dt_pfio.n_fak=sp_department.id_department'
      'and st_dt_pfio.id_kod=:param_people')
    Left = 304
    poSQLINT64ToBCD = True
  end
end
