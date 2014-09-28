object frmNaruskADD: TfrmNaruskADD
  Left = 298
  Top = 253
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'frmNaruskADD'
  ClientHeight = 148
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxButtonOk: TcxButton
    Left = 168
    Top = 120
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'cxButtonOk'
    Default = True
    TabOrder = 0
    OnClick = cxButtonOkClick
  end
  object cxButtonExit: TcxButton
    Left = 248
    Top = 120
    Width = 75
    Height = 25
    Caption = 'cxButtonExit'
    TabOrder = 1
    OnClick = cxButtonExitClick
  end
  object cxLabelShortName: TcxLabel
    Left = 0
    Top = 0
    Width = 167
    Height = 17
    TabOrder = 2
    Caption = 'cxLabelShortName                       '
  end
  object cxTextEditShortName: TcxTextEdit
    Left = 0
    Top = 16
    Width = 329
    Height = 21
    Properties.MaxLength = 20
    Style.Color = 15204351
    TabOrder = 3
  end
  object cxMemoName: TcxMemo
    Left = 0
    Top = 56
    Width = 329
    Height = 57
    Properties.MaxLength = 100
    Style.Color = 15204351
    TabOrder = 4
  end
  object cxLabelName: TcxLabel
    Left = 0
    Top = 40
    Width = 157
    Height = 17
    TabOrder = 5
    Caption = 'cxLabelName                            '
  end
  object pFIBDataSetLoadNarush: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from st_sp_narush'
      'where id_narush=:param_narush')
    Left = 56
    Top = 72
    poSQLINT64ToBCD = True
  end
end
