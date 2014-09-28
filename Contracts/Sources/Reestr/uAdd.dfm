object frmAdd: TfrmAdd
  Left = 503
  Top = 306
  Width = 288
  Height = 195
  Caption = 'frmAdd'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Note_memo: TcxMemo
    Left = 8
    Top = 64
    Width = 265
    Height = 57
    Properties.MaxLength = 255
    TabOrder = 0
  end
  object cxButton_ok: TcxButton
    Left = 40
    Top = 128
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 1
    OnClick = cxButton_okClick
  end
  object cxButton_cancel: TcxButton
    Left = 168
    Top = 128
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = cxButton_cancelClick
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Width = 89
    Height = 17
    TabOrder = 3
    Caption = #1053#1086#1084#1077#1088':'
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 48
    Width = 55
    Height = 17
    TabOrder = 4
    Caption = #1047#1072#1084#1077#1090#1082#1072':'
  end
  object Date_Edit: TcxDateEdit
    Left = 152
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object cxLabel3: TcxLabel
    Left = 152
    Top = 8
    Width = 89
    Height = 17
    TabOrder = 6
    Caption = #1044#1072#1090#1072':'
  end
  object Num_Edit: TcxCurrencyEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    EditValue = ''
    Properties.DisplayFormat = '00'
    TabOrder = 7
  end
  object DataSet_max: TpFIBDataSet
    Database = frmReestr_DM.DB
    Transaction = frmReestr_DM.Tran_Read
    UpdateTransaction = frmReestr_DM.Tran_write
    Left = 136
    Top = 32
    poSQLINT64ToBCD = True
  end
end
