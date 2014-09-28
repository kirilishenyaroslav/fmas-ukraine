object TfrmInputData: TTfrmInputData
  Left = 903
  Top = 244
  BorderStyle = bsSingle
  Caption = #1044#1086#1076#1072#1090#1080' '#1092#1110#1085'. '#1079#1086#1073#1086#1074#39#1103#1079#1072#1085#1103
  ClientHeight = 296
  ClientWidth = 285
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DogGroupBox: TcxGroupBox
    Left = 3
    Top = 0
    Width = 273
    Height = 153
    Alignment = alTopLeft
    Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1088#1086' '#1076#1086#1075#1086#1074#1110#1088':'
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 22
      Width = 52
      Height = 13
      Caption = #1044#1086#1075#1086#1074#1110#1088':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 9
      Top = 55
      Width = 75
      Height = 13
      Caption = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082':'
    end
    object Label3: TLabel
      Left = 169
      Top = 25
      Width = 59
      Height = 13
      Caption = #1056#1077#1075'. '#1085#1086#1084#1077#1088':'
    end
    object Label11: TLabel
      Left = 9
      Top = 93
      Width = 97
      Height = 13
      Caption = #1055#1110#1076#1089#1090#1072#1074#1072' '#1076#1086#1075#1086#1074#1086#1088#1091':'
    end
    object DogNameEdit: TcxButtonEdit
      Left = 9
      Top = 34
      Width = 144
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = DogNameEditPropertiesButtonClick
      Style.Color = clMoneyGreen
      Style.LookAndFeel.Kind = lfStandard
      TabOrder = 0
    end
    object NameCustEdit: TcxTextEdit
      Left = 9
      Top = 68
      Width = 256
      Height = 21
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = clMoneyGreen
      Style.LookAndFeel.Kind = lfStandard
      TabOrder = 2
    end
    object NoteMemo: TcxMemo
      Left = 9
      Top = 106
      Width = 256
      Height = 41
      TabStop = False
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      Properties.ScrollBars = ssVertical
      Style.Color = clMoneyGreen
      Style.LookAndFeel.Kind = lfStandard
      TabOrder = 3
    end
    object RegNumEdit: TcxTextEdit
      Left = 168
      Top = 36
      Width = 97
      Height = 21
      TabStop = False
      Properties.ReadOnly = True
      Style.Color = clMoneyGreen
      Style.LookAndFeel.Kind = lfStandard
      TabOrder = 1
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 2
    Top = 157
    Width = 273
    Height = 100
    Alignment = alTopLeft
    Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1088#1086' '#1079#1086#1073#1086#1074#39#1103#1079#1072#1085#1085#1103':'
    TabOrder = 1
    object Label6: TLabel
      Left = 13
      Top = 22
      Width = 37
      Height = 13
      Caption = #1050#1045#1050#1042':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 13
      Top = 58
      Width = 118
      Height = 13
      Caption = #1055#1086#1088#1103#1076#1082#1086#1074#1080#1081' '#1085#1086#1084#1077#1088':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 157
      Top = 58
      Width = 35
      Height = 13
      Caption = #1057#1091#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object KekvEdit: TcxButtonEdit
      Left = 9
      Top = 36
      Width = 128
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfStandard
      TabOrder = 0
    end
    object Num_edit: TcxTextEdit
      Left = 9
      Top = 72
      Width = 128
      Height = 21
      TabStop = False
      Properties.ReadOnly = False
      Style.Color = clMoneyGreen
      Style.LookAndFeel.Kind = lfStandard
      TabOrder = 1
    end
    object SumEdit: TCurrencyEdit
      Left = 153
      Top = 70
      Width = 114
      Height = 21
      AutoSize = False
      Color = clMoneyGreen
      DisplayFormat = ',0.00 ;-,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object ApplyButton: TcxButton
    Left = 111
    Top = 267
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 2
    OnClick = ApplyButtonClick
    LookAndFeel.NativeStyle = False
  end
  object CancelButton: TcxButton
    Left = 197
    Top = 267
    Width = 77
    Height = 25
    Caption = #1057#1082#1072#1089#1091#1074#1072#1090#1080
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object ActionList1: TActionList
    Left = 32
    Top = 272
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 27
      OnExecute = Action1Execute
    end
  end
  object Db1: TpFIBDatabase
    DefaultTransaction = Ft1
    DefaultUpdateTransaction = Ft1
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 90
    Top = 269
  end
  object Ft1: TpFIBTransaction
    DefaultDatabase = Db1
    TimeoutAction = TARollback
    Left = 58
    Top = 269
  end
  object Ft2: TpFIBTransaction
    DefaultDatabase = Db1
    TimeoutAction = TARollback
    Left = 10
    Top = 277
  end
  object StProc: TpFIBStoredProc
    Database = frmFnzbData.WorkDB
    Transaction = frmFnzbData.ReadT
    Left = 232
    Top = 183
  end
end
