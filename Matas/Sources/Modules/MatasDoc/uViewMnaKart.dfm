object MNAViewForm: TMNAViewForm
  Left = 350
  Top = 278
  Width = 656
  Height = 144
  Caption = #1052#1053#1040' '#1082#1072#1088#1090#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 14
    Top = 16
    Width = 38
    Height = 13
    Caption = #1053#1072#1079#1074#1072
  end
  object lbl3: TLabel
    Left = 11
    Top = 48
    Width = 142
    Height = 13
    Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1085#1080#1081' '#1085#1086#1084#1077#1088
  end
  object lbl4: TLabel
    Left = 11
    Top = 79
    Width = 123
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1087#1088#1080#1073#1091#1090#1091#1074#1072#1085#1085#1103
  end
  object lbl5: TLabel
    Left = 299
    Top = 45
    Width = 124
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1077#1082#1089#1087#1083'.'
  end
  object lbl6: TLabel
    Left = 305
    Top = 83
    Width = 96
    Height = 13
    Caption = #1044#1072#1090#1072' '#1074#1080#1083#1091#1095#1077#1085#1085#1103
  end
  object cxDBTextEdit9: TcxDBTextEdit
    Left = 59
    Top = 13
    Width = 562
    Height = 21
    DataBinding.DataField = 'NAME'
    DataBinding.DataSource = ds1
    TabOrder = 0
  end
  object cxDBTextEdit8: TcxDBTextEdit
    Left = 163
    Top = 43
    Width = 121
    Height = 21
    DataBinding.DataField = 'NNUM_FULL'
    DataBinding.DataSource = ds1
    TabOrder = 1
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 163
    Top = 78
    Width = 121
    Height = 21
    DataBinding.DataField = 'DATE_OPR'
    DataBinding.DataSource = ds1
    TabOrder = 2
  end
  object cxDBTextEdit3: TcxDBTextEdit
    Left = 449
    Top = 44
    Width = 121
    Height = 21
    DataBinding.DataField = 'DATE_EXPL'
    DataBinding.DataSource = ds1
    TabOrder = 3
  end
  object cxDBTextEdit5: TcxDBTextEdit
    Left = 450
    Top = 73
    Width = 121
    Height = 21
    DataBinding.DataField = 'DATE_OUT'
    DataBinding.DataSource = ds1
    TabOrder = 4
  end
  object actlst1: TActionList
    Left = 376
    Top = 33
    object act1: TAction
      Caption = 'act1'
      ShortCut = 27
      OnExecute = act1Execute
    end
  end
  object ds1: TDataSource
    DataSet = DocWorkOstForm.ds_mna
    Left = 314
    Top = 74
  end
end
