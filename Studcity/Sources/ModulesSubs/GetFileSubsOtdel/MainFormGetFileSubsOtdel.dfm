object frmMainFormGetFileSubsOtdel: TfrmMainFormGetFileSubsOtdel
  Left = 585
  Top = 343
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmMainFormGetFileSubsOtdel'
  ClientHeight = 179
  ClientWidth = 353
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 0
    Top = 141
    Width = 353
    Height = 19
    Align = alBottom
    BackColor = 15204351
    Progress = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 160
    Width = 353
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 353
    Height = 141
    Align = alClient
    TabOrder = 1
    object DateTimePickerDateList: TDateTimePicker
      Left = 72
      Top = 16
      Width = 97
      Height = 21
      Date = 38439.669443171300000000
      Time = 38439.669443171300000000
      Color = 15204351
      TabOrder = 0
      OnChange = DateTimePickerDateListChange
      OnKeyDown = DateTimePickerDateListKeyDown
    end
    object cxButtonClose: TcxButton
      Left = 232
      Top = 112
      Width = 113
      Height = 25
      Cancel = True
      Caption = 'cxButtonClose'
      TabOrder = 1
      OnClick = cxButtonCloseClick
    end
    object ButtonStart: TcxButton
      Left = 120
      Top = 112
      Width = 105
      Height = 25
      Caption = 'ButtonStart'
      TabOrder = 2
      OnClick = ButtonStartClick
    end
    object ButtonOpenFile: TcxButton
      Left = 5
      Top = 112
      Width = 105
      Height = 25
      Caption = 'ButtonOpenFile'
      Default = True
      TabOrder = 3
      OnClick = ButtonOpenFileClick
    end
    object serves_ButtonEdit: TcxButtonEdit
      Left = 5
      Top = 80
      Width = 340
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = serves_ButtonEditPropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 4
    end
    object LabelDateList: TcxLabel
      Left = 8
      Top = 16
      Width = 65
      Height = 17
      AutoSize = False
      TabOrder = 5
    end
    object LabelNumberList: TcxLabel
      Left = 8
      Top = 40
      Width = 337
      Height = 17
      AutoSize = False
      TabOrder = 6
    end
    object cxLabel1: TcxLabel
      Left = 8
      Top = 64
      Width = 50
      Height = 17
      TabOrder = 7
      Caption = #1055#1086#1089#1083#1091#1075#1072
    end
  end
  object OpenDialogDBF: TOpenDialog
    Filter = #1060#1072#1081#1083' '#1089#1091#1073#1089#1080#1076#1080#1081'(*.dbf)|*.dbf'
    Left = 232
    Top = 8
  end
  object pFIBDatabase: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 168
    Top = 8
  end
  object pFIBDataSetNumList: TpFIBDataSet
    Database = pFIBDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from st_dt_rzlist_getnumlist(0)')
    Left = 288
    Top = 8
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TARollback
    Left = 200
    Top = 8
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TARollback
    Left = 168
    Top = 40
  end
  object FIBSProc: TpFIBStoredProc
    Database = pFIBDatabase
    Transaction = WriteTransaction
    Left = 320
    Top = 8
  end
  object HalcyonDataSet: THalcyonDataSet
    AutoFlush = False
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 256
    Top = 8
  end
  object Timer1: TTimer
    Left = 200
    Top = 40
  end
end
