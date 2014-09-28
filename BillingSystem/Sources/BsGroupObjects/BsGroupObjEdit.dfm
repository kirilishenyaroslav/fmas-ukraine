object frmGroupObjEdit: TfrmGroupObjEdit
  Left = 286
  Top = 116
  BorderStyle = bsDialog
  Caption = 'frmGroupObjEdit'
  ClientHeight = 181
  ClientWidth = 365
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
  object NameObjEdit: TcxTextEdit
    Left = 96
    Top = 40
    Width = 257
    Height = 21
    TabOrder = 3
  end
  object NameComment: TcxTextEdit
    Left = 96
    Top = 72
    Width = 257
    Height = 21
    TabOrder = 5
  end
  object btnAdd: TcxButton
    Left = 57
    Top = 137
    Width = 75
    Height = 25
    Action = ActAdd
    TabOrder = 8
  end
  object btnCancel: TcxButton
    Left = 276
    Top = 137
    Width = 75
    Height = 25
    Action = ActCancel
    TabOrder = 10
  end
  object lblNameObj: TcxLabel
    Left = 8
    Top = 40
    Width = 79
    Height = 17
    TabOrder = 2
    Caption = #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1091
  end
  object lblComment: TcxLabel
    Left = 8
    Top = 72
    Width = 55
    Height = 17
    TabOrder = 4
    Caption = #1055#1088#1080#1084#1110#1090#1082#1072
  end
  object lblKodObj: TcxLabel
    Left = 8
    Top = 10
    Width = 67
    Height = 17
    TabOrder = 0
    Caption = #1050#1086#1076' '#1086#1073#39#1108#1082#1090#1072
  end
  object KodEdit: TcxTextEdit
    Left = 96
    Top = 10
    Width = 65
    Height = 21
    TabOrder = 1
    OnKeyPress = KodEditKeyPress
  end
  object btnAddParent: TcxButton
    Left = 144
    Top = 137
    Width = 120
    Height = 25
    Action = ActAddParent
    TabOrder = 9
  end
  object lblNode: TcxLabel
    Left = 8
    Top = 103
    Width = 78
    Height = 17
    TabOrder = 6
    Caption = #1055#1086#1090#1086#1095#1085#1072' '#1075#1110#1083#1082#1072
  end
  object NodeEdit: TcxTextEdit
    Left = 96
    Top = 102
    Width = 255
    Height = 21
    Properties.ReadOnly = True
    TabOrder = 7
  end
  object ActionList1: TActionList
    Left = 220
    Top = 119
    object ActAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      ShortCut = 121
      SecondaryShortCuts.Strings = (
        'enter')
      OnExecute = ActAddExecute
    end
    object ActAddParent: TAction
      Caption = #1044#1086#1076#1072#1090#1080', '#1103#1082' '#1087#1110#1076#1083#1077#1075#1083#1080#1081
      OnExecute = ActAddParentExecute
    end
    object ActCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1072
      SecondaryShortCuts.Strings = (
        'esc')
      OnExecute = ActCancelExecute
    end
  end
  object ObjectSet: TpFIBDataSet
    Database = frmGroupObject.ObjectDB
    Transaction = frmGroupObject.ObjectTransRead
    UpdateTransaction = frmGroupObject.ObjectTransWrite
    Left = 202
    Top = 11
    poSQLINT64ToBCD = True
  end
end
