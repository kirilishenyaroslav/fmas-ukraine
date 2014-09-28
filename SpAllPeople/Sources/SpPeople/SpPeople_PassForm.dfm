object fPassEdit: TfPassEdit
  Left = 287
  Top = 151
  BorderStyle = bsDialog
  Caption = 'fPassEdit'
  ClientHeight = 312
  ClientWidth = 446
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
  object OkButton: TcxButton
    Left = 216
    Top = 285
    Width = 97
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 322
    Top = 285
    Width = 97
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object PasportPanel: TPanel
    Left = 8
    Top = 16
    Width = 433
    Height = 265
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 49
      Height = 13
      Caption = #1055#1088#1110#1079#1074#1080#1097#1077
    end
    object Label2: TLabel
      Left = 168
      Top = 16
      Width = 19
      Height = 13
      Caption = #1030#1084#39#1103
    end
    object Label3: TLabel
      Left = 295
      Top = 16
      Width = 60
      Height = 13
      Caption = #1055#1086' '#1073#1072#1090#1100#1082#1086#1074#1110
    end
    object Label4: TLabel
      Left = 8
      Top = 64
      Width = 49
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103
    end
    object Label5: TLabel
      Left = 168
      Top = 64
      Width = 22
      Height = 13
      Caption = #1048#1084#1103
    end
    object Label6: TLabel
      Left = 292
      Top = 64
      Width = 47
      Height = 13
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    end
    object Label9: TLabel
      Left = 296
      Top = 120
      Width = 60
      Height = 13
      Caption = #1044#1072#1090#1072' '#1074#1080#1076#1072#1095#1110
    end
    object Label8: TLabel
      Left = 112
      Top = 120
      Width = 34
      Height = 13
      Caption = #1053#1086#1084#1077#1088
    end
    object Label7: TLabel
      Left = 8
      Top = 120
      Width = 27
      Height = 13
      Caption = #1057#1077#1088#1110#1103
    end
    object Label10: TLabel
      Left = 8
      Top = 168
      Width = 66
      Height = 13
      Caption = #1050#1080#1084' '#1074#1080#1076#1072#1085#1080#1081
    end
    object Label11: TLabel
      Left = 8
      Top = 216
      Width = 76
      Height = 13
      Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object VidanDateEdit: TcxDateEdit
      Left = 296
      Top = 136
      Width = 121
      Height = 21
      Properties.DateButtons = []
      TabOrder = 8
    end
    object FamiliaEdit: TcxMaskEdit
      Left = 8
      Top = 32
      Width = 153
      Height = 21
      Properties.MaskKind = emkRegExprEx
      Properties.MaxLength = 20
      TabOrder = 0
    end
    object ImyaEdit: TcxMaskEdit
      Left = 168
      Top = 32
      Width = 113
      Height = 21
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 20
      TabOrder = 1
    end
    object OtchestvoEdit: TcxMaskEdit
      Left = 296
      Top = 32
      Width = 129
      Height = 21
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 20
      TabOrder = 2
    end
    object RusOtchEdit: TcxMaskEdit
      Left = 296
      Top = 80
      Width = 129
      Height = 21
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 20
      TabOrder = 5
    end
    object RusImyaEdit: TcxMaskEdit
      Left = 168
      Top = 80
      Width = 113
      Height = 21
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 20
      TabOrder = 4
    end
    object RusFamEdit: TcxMaskEdit
      Left = 8
      Top = 80
      Width = 153
      Height = 21
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 20
      TabOrder = 3
    end
    object NomerEdit: TcxMaskEdit
      Left = 112
      Top = 136
      Width = 121
      Height = 21
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d\d\d\d\d'
      Properties.MaxLength = 0
      TabOrder = 7
    end
    object SeriaEdit: TcxMaskEdit
      Left = 8
      Top = 136
      Width = 81
      Height = 21
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '['#1040'-'#1071']+'
      Properties.MaxLength = 0
      TabOrder = 6
    end
    object PassTypeComboBox: TcxLookupComboBox
      Left = 8
      Top = 232
      Width = 169
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'ID_PASS_TYPE'
      Properties.ListColumns = <
        item
          FieldName = 'PASS_TYPE_NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = PassTypeDataSource
      Properties.ReadOnly = False
      TabOrder = 9
    end
    object GrantPanel: TPanel
      Left = 8
      Top = 184
      Width = 385
      Height = 25
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 10
      object VidanEdit: TcxTextEdit
        Left = 0
        Top = 2
        Width = 385
        Height = 21
        TabOrder = 0
      end
    end
    object SelectVidanBtn: TcxButton
      Left = 392
      Top = 184
      Width = 25
      Height = 25
      Caption = '...'
      TabOrder = 11
      OnClick = SelectVidanBtnClick
    end
  end
  object PassTypeDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      #9'PUB_INI_PASS_TYPE.ID_PASS_TYPE,'
      #9'PUB_INI_PASS_TYPE.PASS_TYPE_NAME'
      'FROM PUB_INI_PASS_TYPE')
    Left = 224
    Top = 240
    poSQLINT64ToBCD = True
    object PassTypeDataSetID_PASS_TYPE: TFIBIntegerField
      FieldName = 'ID_PASS_TYPE'
    end
    object PassTypeDataSetPASS_TYPE_NAME: TFIBStringField
      FieldName = 'PASS_TYPE_NAME'
      Size = 60
      EmptyStrToNull = True
    end
  end
  object PassTypeDataSource: TDataSource
    DataSet = PassTypeDataSet
    Left = 192
    Top = 240
  end
  object DB: TpFIBDatabase
    DBName = 'E:\FULL_DB.IB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=win1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 272
    Top = 240
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 304
    Top = 240
  end
end
