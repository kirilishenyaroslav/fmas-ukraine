object frmFormView: TfrmFormView
  Left = 449
  Top = 298
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1055#1077#1088#1077#1075#1083#1103#1076
  ClientHeight = 549
  ClientWidth = 461
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 530
    Width = 461
    Height = 19
    Panels = <>
  end
  object StatusBar2: TStatusBar
    Left = 0
    Top = 511
    Width = 461
    Height = 19
    Panels = <>
  end
  object GroupBoxBuff: TGroupBox
    Left = -1
    Top = 1
    Width = 449
    Height = 464
    TabOrder = 2
    object GroupBoxDateDocBuff: TGroupBox
      Left = 5
      Top = 12
      Width = 217
      Height = 41
      Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object cxDateEditBuff: TcxDateEdit
        Left = 8
        Top = 16
        Width = 200
        Height = 21
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 0
      end
    end
    object GroupBoxDateVipBuff: TGroupBox
      Left = 221
      Top = 12
      Width = 217
      Height = 41
      Caption = #1044#1072#1090#1072' '#1074#1080#1087#1080#1089#1082#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object cxDateEditDateVipBuff: TcxDateEdit
        Left = 8
        Top = 16
        Width = 200
        Height = 21
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 0
      end
    end
    object GroupBoxRSCustormerBuff: TGroupBox
      Left = 5
      Top = 103
      Width = 433
      Height = 90
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1090' '#1040
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object LabelMFO_ABuff: TLabel
        Left = 8
        Top = 40
        Width = 47
        Height = 13
        Caption = #1052#1060#1054'_'#1040
      end
      object LabelRS_Buff: TLabel
        Left = 232
        Top = 40
        Width = 38
        Height = 13
        Caption = #1056'\'#1056'_'#1040
      end
      object cxButtonEditRSPos_AtBuff: TcxButtonEdit
        Left = 8
        Top = 16
        Width = 417
        Height = 21
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 0
      end
      object cxTextEditMFOPost_ABuff: TcxTextEdit
        Left = 8
        Top = 56
        Width = 201
        Height = 21
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 1
      end
      object cxTextEditRR_APostBuff: TcxTextEdit
        Left = 226
        Top = 56
        Width = 201
        Height = 21
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 2
      end
    end
    object GroupBoxNoteBuff: TGroupBox
      Left = 5
      Top = 347
      Width = 433
      Height = 105
      Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object cxMemoNoteBuff: TcxMemo
        Left = 2
        Top = 15
        Width = 429
        Height = 88
        Align = alClient
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = 15204351
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 0
      end
    end
    object GroupBoxNumberDocBuff: TGroupBox
      Left = 5
      Top = 53
      Width = 433
      Height = 44
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object cxMaskEditNumdocBuff: TcxMaskEdit
        Left = 8
        Top = 16
        Width = 417
        Height = 21
        Properties.MaskKind = emkRegExpr
        Properties.MaxLength = 10
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 0
      end
    end
    object GroupBoxSummaBuff: TGroupBox
      Left = 5
      Top = 297
      Width = 433
      Height = 44
      Caption = #1057#1091#1084#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object cxMaskEditSummaBuff: TcxCalcEdit
        Left = 8
        Top = 16
        Width = 417
        Height = 21
        EditValue = 0.000000000000000000
        Properties.Precision = 15
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 199
      Width = 433
      Height = 90
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1090' B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object Label1: TLabel
        Left = 8
        Top = 40
        Width = 47
        Height = 13
        Caption = #1052#1060#1054'_B'
      end
      object Label2: TLabel
        Left = 232
        Top = 40
        Width = 38
        Height = 13
        Caption = #1056'\'#1056'_'#1042
      end
      object cxButtonEditRSPos_BtBuff: TcxButtonEdit
        Left = 8
        Top = 16
        Width = 417
        Height = 21
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 0
      end
      object cxTextEditMFOPost_BBuff: TcxTextEdit
        Left = 8
        Top = 56
        Width = 201
        Height = 21
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 1
      end
      object cxTextEditRR_BPostBuff: TcxTextEdit
        Left = 226
        Top = 56
        Width = 201
        Height = 21
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 2
      end
    end
  end
  object cxButtonReplace: TcxButton
    Left = 336
    Top = 472
    Width = 100
    Height = 25
    Caption = #1047#1072#1082#1088#1080#1090#1080
    TabOrder = 3
    OnClick = cxButtonReplaceClick
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = Database
    Transaction = TransactionWrite
    Left = 72
    Top = 123
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = TransactionRead
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 72
    Top = 57
  end
  object TransactionRead: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 104
    Top = 56
  end
  object TransactionWrite: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 72
    Top = 89
  end
  object ActionList1: TActionList
    Left = 176
    Top = 319
    object ActionAdd: TAction
      Caption = 'ActionAdd'
      ShortCut = 16397
    end
  end
  object pFIBDataSetEditDocBuff: TpFIBDataSet
    Database = Database
    Transaction = TransactionRead
    SelectSQL.Strings = (
      'select * from  CLBANK_TMP_BUFFER'
      'where CLBANK_TMP_BUFFER.ID_KEY_LOCAL=:ID_KEY_LOCAL')
    Left = 84
    Top = 340
    poSQLINT64ToBCD = True
  end
end
