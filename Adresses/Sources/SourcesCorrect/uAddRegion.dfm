object Add_Region_Form: TAdd_Region_Form
  Left = 295
  Top = 237
  BorderStyle = bsDialog
  ClientHeight = 172
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object NameTE: TcxTextEdit
    Left = 88
    Top = 7
    Width = 273
    Height = 21
    Properties.CharCase = ecUpperCase
    TabOrder = 0
  end
  object NameLbl: TcxLabel
    Left = 36
    Top = 8
    Width = 51
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Caption = #1056#1077#1075#1110#1086#1085':'
  end
  object AcceptBtn: TcxButton
    Left = 115
    Top = 140
    Width = 75
    Height = 25
    Action = AcceptAction
    TabOrder = 2
  end
  object CancelBtn: TcxButton
    Left = 211
    Top = 140
    Width = 75
    Height = 25
    Action = CancelAction
    TabOrder = 3
  end
  object cxLabel1: TcxLabel
    Left = 0
    Top = 32
    Width = 87
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Caption = #1058#1080#1087' '#1088#1077#1075#1110#1086#1085#1072':'
  end
  object cxLabel2: TcxLabel
    Left = 36
    Top = 56
    Width = 51
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
    Caption = #1050#1088#1072#1111#1085#1072':'
  end
  object TypeBE: TcxButtonEdit
    Left = 88
    Top = 32
    Width = 273
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = TypeBEPropertiesButtonClick
    TabOrder = 6
  end
  object CountryBE: TcxButtonEdit
    Left = 88
    Top = 56
    Width = 273
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = CountryBEPropertiesButtonClick
    TabOrder = 7
  end
  object EqualCB: TcxCheckBox
    Left = 96
    Top = 112
    Width = 233
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = EqualCBPropertiesChange
    Properties.Caption = #1055#1086#1095#1072#1090#1086#1082' '#1090#1072' '#1082#1110#1085#1077#1094#1100' '#1076#1110#1072#1087#1072#1079#1086#1085#1091' '#1079#1073#1110#1075#1072#1102#1090#1100#1089#1103
    TabOrder = 8
  end
  object Zip1: TcxMaskEdit
    Left = 144
    Top = 87
    Width = 73
    Height = 21
    ParentFont = False
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '\d+'
    Properties.MaxLength = 0
    Properties.OnEditValueChanged = Zip1PropertiesEditValueChanged
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 9
  end
  object Zip2: TcxMaskEdit
    Left = 239
    Top = 87
    Width = 73
    Height = 21
    ParentFont = False
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '\d+'
    Properties.MaxLength = 0
    Properties.OnEditValueChanged = Zip2PropertiesEditValueChanged
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 10
  end
  object cxLabel3: TcxLabel
    Left = 12
    Top = 89
    Width = 125
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 11
    Caption = #1044#1110#1072#1087#1072#1079#1086#1085' '#1110#1085#1076#1077#1082#1089#1110#1074':'
  end
  object cxLabel4: TcxLabel
    Left = 217
    Top = 89
    Width = 21
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 12
    Caption = '-'
  end
  object ActionList: TActionList
    Left = 64
    Top = 136
    object AcceptAction: TAction
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      ShortCut = 121
      OnExecute = AcceptActionExecute
    end
    object CancelAction: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 296
    Top = 136
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 360
    Top = 136
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 328
    Top = 136
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 136
    poSQLINT64ToBCD = True
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Top = 136
  end
end
