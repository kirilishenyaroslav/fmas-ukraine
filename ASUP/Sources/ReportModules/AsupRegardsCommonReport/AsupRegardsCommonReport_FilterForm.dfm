object FormOptions: TFormOptions
  Left = 263
  Top = 262
  BorderStyle = bsDialog
  Caption = 'FormOptions'
  ClientHeight = 109
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 389
    Height = 73
    Align = alTop
    Shape = bsFrame
  end
  object YesBtn: TcxButton
    Left = 192
    Top = 80
    Width = 91
    Height = 22
    Action = YesAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 288
    Top = 80
    Width = 89
    Height = 22
    Action = CancelAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
  end
  object ComboRegards: TcxLookupComboBox
    Left = 184
    Top = 39
    Width = 153
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'ID_REG_GROUP'
    Properties.ListColumns = <
      item
        FieldName = 'NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DSource
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
  end
  object cxLabel1: TcxLabel
    Left = 40
    Top = 12
    Width = 137
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
    Caption = #1055#1110#1076#1089#1090#1072#1074#1072' '#1076#1083#1103' '#1088#1086#1073#1086#1090#1080':'
  end
  object WorkComboBox: TcxComboBox
    Left = 184
    Top = 8
    Width = 161
    Height = 21
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Text = #1059#1089#1110
  end
  object cxLabel2: TcxLabel
    Left = 44
    Top = 40
    Width = 93
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
    Caption = #1058#1080#1087' '#1074#1110#1076#1079#1085#1072#1082#1080':'
  end
  object ActionList: TActionList
    Left = 152
    Top = 72
    object YesAction: TAction
      Caption = 'YesAction'
      ShortCut = 16464
      OnExecute = YesActionExecute
    end
    object CancelAction: TAction
      Caption = 'CancelAction'
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
  end
  object DB: TpFIBDatabase
    DefaultTransaction = Tran
    DefaultUpdateTransaction = Tran
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 72
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = Tran
    Left = 40
    Top = 72
    poSQLINT64ToBCD = True
  end
  object Tran: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 72
    Top = 72
  end
  object DSource: TDataSource
    DataSet = DSet
    Left = 104
    Top = 72
  end
end
