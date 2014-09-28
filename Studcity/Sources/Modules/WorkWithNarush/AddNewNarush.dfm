object frmAddNewnarush: TfrmAddNewnarush
  Left = 492
  Top = 380
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'frmAddNewnarush'
  ClientHeight = 245
  ClientWidth = 468
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxButtonEditNarush: TcxButtonEdit
    Left = 0
    Top = 24
    Width = 201
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxButtonEditNarushPropertiesButtonClick
    Style.Color = 15204351
    TabOrder = 0
  end
  object cxDateEditNarush: TcxDateEdit
    Left = 208
    Top = 24
    Width = 137
    Height = 21
    Style.Color = 15204351
    TabOrder = 1
  end
  object cxCheckBoxOtrab: TcxCheckBox
    Left = 352
    Top = 24
    Width = 121
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 2
  end
  object cxButtonOk: TcxButton
    Left = 378
    Top = 173
    Width = 75
    Height = 25
    Caption = 'cxButtonOk'
    Default = True
    TabOrder = 3
    OnClick = cxButtonOkClick
  end
  object cxButtonExit: TcxButton
    Left = 378
    Top = 205
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'cxButtonExit'
    TabOrder = 4
    OnClick = cxButtonExitClick
  end
  object cxLabelNarush: TcxLabel
    Left = 0
    Top = 8
    Width = 166
    Height = 17
    TabOrder = 5
    Caption = 'cxLabelNarush                             '
  end
  object cxLabelDateNarush: TcxLabel
    Left = 208
    Top = 8
    Width = 102
    Height = 17
    TabOrder = 6
  end
  object Notes_Memo: TcxMemo
    Left = 0
    Top = 175
    Width = 345
    Height = 65
    Style.Color = 15204351
    TabOrder = 7
  end
  object PlaceNarushMemo: TcxMemo
    Left = 0
    Top = 63
    Width = 345
    Height = 34
    Style.Color = 15204351
    TabOrder = 8
  end
  object AcceptedArrMemo: TcxMemo
    Left = 0
    Top = 119
    Width = 345
    Height = 34
    Style.Color = 15204351
    TabOrder = 9
  end
  object cxLabelPlace: TcxLabel
    Left = 0
    Top = 48
    Width = 166
    Height = 17
    TabOrder = 10
    Caption = #1052#1110#1089#1094#1077' '#1087#1086#1088#1091#1096#1077#1085#1085#1103
  end
  object cxLabeAcceptArrang: TcxLabel
    Left = 0
    Top = 104
    Width = 166
    Height = 17
    TabOrder = 11
    Caption = #1055#1088#1080#1081#1085#1103#1090#1110' '#1079#1072#1093#1086#1076#1080
  end
  object cxLabelNote: TcxLabel
    Left = 0
    Top = 160
    Width = 166
    Height = 17
    TabOrder = 12
    Caption = 'cxLabelNote'
  end
  object pFIBDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select st_dt_narush.*,st_sp_narush.narush,st_sp_narush.short_nam' +
        'e,st_sp_vzysk.name_vzysk'
      'from st_dt_narush,st_sp_vzysk,st_sp_narush'
      'where st_sp_vzysk.id_vzysk=st_sp_narush.id_vzysk'
      'and st_dt_narush.id_narush=st_sp_narush.id_narush'
      'and st_dt_narush.id_record=:param_record')
    Left = 112
    Top = 32
    poSQLINT64ToBCD = True
  end
end
