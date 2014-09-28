object frmVzyskADD: TfrmVzyskADD
  Left = 474
  Top = 416
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'frmVzyskADD'
  ClientHeight = 77
  ClientWidth = 266
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxTextEditNameVzysk: TcxTextEdit
    Left = 0
    Top = 16
    Width = 265
    Height = 21
    Properties.MaxLength = 25
    Style.Color = 15204351
    TabOrder = 0
  end
  object cxLabelNameVzysk: TcxLabel
    Left = 0
    Top = 0
    Width = 197
    Height = 17
    TabOrder = 1
    Caption = 'cxLabelNameVzysk                                '
  end
  object cxButtonOk: TcxButton
    Left = 104
    Top = 48
    Width = 75
    Height = 25
    Caption = 'cxButtonOk'
    Default = True
    TabOrder = 2
    OnClick = cxButtonOkClick
  end
  object cxButtonExit: TcxButton
    Left = 184
    Top = 48
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'cxButtonExit'
    TabOrder = 3
    OnClick = cxButtonExitClick
  end
  object pFIBDataSetLoadVzysk: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from st_sp_vzysk'
      'where id_vzysk=:param_vzysk')
    Left = 32
    Top = 40
    poSQLINT64ToBCD = True
  end
end
