object frmMainGetSpravZp: TfrmMainGetSpravZp
  Left = 447
  Top = 496
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmMainGetSpravZp'
  ClientHeight = 106
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 87
    Width = 338
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object cxButtonStart: TcxButton
    Left = 152
    Top = 56
    Width = 89
    Height = 25
    Caption = 'cxButtonStart'
    Default = True
    TabOrder = 1
    OnClick = cxButtonStartClick
  end
  object cxButtonClose: TcxButton
    Left = 256
    Top = 56
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'cxButtonClose'
    TabOrder = 2
    OnClick = cxButtonCloseClick
  end
  object cxProgressBar1: TcxProgressBar
    Left = 0
    Top = 24
    Width = 337
    Height = 21
    ParentColor = False
    Style.Color = clInfoBk
    TabOrder = 3
  end
  object cxLabelStatus: TcxLabel
    Left = 0
    Top = 8
    Width = 333
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Caption = 
      'cxLabelStatus                                                   ' +
      '          '
  end
  object MemoLog: TMemo
    Left = 184
    Top = 8
    Width = 153
    Height = 49
    TabOrder = 5
    Visible = False
  end
  object pFIBDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 56
    Top = 40
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TARollback
    Left = 88
    Top = 40
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TARollback
    Left = 56
    Top = 72
  end
  object pFIBStoredProc: TpFIBStoredProc
    Left = 120
    Top = 40
  end
end
