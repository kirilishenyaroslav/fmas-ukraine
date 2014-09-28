object frmRelations: TfrmRelations
  Left = 342
  Top = 151
  BorderStyle = bsSingle
  Caption = #1057#1074#1103#1079#1100' '#1087#1086#1083#1077#1081' '#1073#1072#1079#1099' '#1080' '#1087#1086#1083#1077#1081' dbf '#1090#1072#1073#1083#1080#1094#1099
  ClientHeight = 345
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 0
    Top = 16
    Width = 545
    Height = 288
    DataSource = DataSource
    PanelHeight = 48
    PanelWidth = 528
    TabOrder = 0
    RowCount = 6
    object DBEdit_field: TDBEdit
      Left = 8
      Top = 24
      Width = 161
      Height = 21
      Color = 14281696
      DataField = 'RDB$PARAMETER_NAME'
      DataSource = DataSource
      TabOrder = 0
    end
    object DBEdit_dbf_field: TDBEdit
      Left = 176
      Top = 24
      Width = 177
      Height = 21
      Color = clMoneyGreen
      DataField = 'DBF_FIELDS'
      DataSource = DataSource
      TabOrder = 1
    end
    object cxDBButtonEdit1: TcxDBButtonEdit
      Left = 352
      Top = 24
      Width = 20
      Height = 21
      DataBinding.DataSource = DataSource
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxDBButtonEdit1PropertiesButtonClick
      TabOrder = 2
    end
    object DBMemo1: TDBMemo
      Left = 8
      Top = 8
      Width = 161
      Height = 17
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'RDB$DESCRIPTION'
      DataSource = DataSource
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 376
      Top = 24
      Width = 145
      Height = 21
      Color = 14281696
      DataField = 'FIELDS_TYPE'
      DataSource = DataSource
      TabOrder = 4
    end
  end
  object cxHeader1: TcxHeader
    Left = 0
    Top = 0
    Width = 545
    Height = 17
    Sections = <
      item
        Alignment = taCenter
        Text = #1055#1086#1083#1103
        Width = 175
      end
      item
        Alignment = taCenter
        Text = #1055#1086#1083#1103' DBF'
        Width = 200
      end
      item
        Alignment = taCenter
        Text = #1058#1080#1087
        Width = 170
      end>
    LookAndFeel.Kind = lfFlat
  end
  object cxButton1: TcxButton
    Left = 448
    Top = 312
    Width = 91
    Height = 25
    Caption = #1047#1072#1082#1088#1080#1090#1080
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 336
    Top = 312
    Width = 107
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object Button1: TButton
    Left = 8
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Memo2: TMemo
    Left = 104
    Top = 350
    Width = 409
    Height = 137
    TabOrder = 5
  end
  object DataSource: TDataSource
    DataSet = pFIBDataSet_sel
    Left = 208
    Top = 144
  end
  object pFIBDataSet_sel: TpFIBDataSet
    Database = frmBuff.pFIBDatabase
    Transaction = frmBuff.pFIBTransactionRead
    SelectSQL.Strings = (
      
        'select pp.*, cast('#39#39' as VARCHAR(255)) as dbf_fields, cast('#39#39' as ' +
        'VARCHAR(255)) as fields_type from RDB$PROCEDURE_PARAMETERS pp'
      'where RDB$PROCEDURE_NAME='#39'DOG_DT_BUFF_SELECT'#39
      'and   RDB$PARAMETER_TYPE=1')
    Left = 177
    Top = 144
    poSQLINT64ToBCD = True
    object pFIBDataSet_selRDBPARAMETER_NAME: TFIBStringField
      FieldName = 'RDB$PARAMETER_NAME'
      Size = 31
      EmptyStrToNull = True
    end
    object pFIBDataSet_selRDBPROCEDURE_NAME: TFIBStringField
      FieldName = 'RDB$PROCEDURE_NAME'
      Size = 31
      EmptyStrToNull = True
    end
    object pFIBDataSet_selRDBPARAMETER_NUMBER: TFIBSmallIntField
      FieldName = 'RDB$PARAMETER_NUMBER'
    end
    object pFIBDataSet_selRDBPARAMETER_TYPE: TFIBSmallIntField
      FieldName = 'RDB$PARAMETER_TYPE'
    end
    object pFIBDataSet_selRDBFIELD_SOURCE: TFIBStringField
      FieldName = 'RDB$FIELD_SOURCE'
      Size = 31
      EmptyStrToNull = True
    end
    object pFIBDataSet_selRDBDESCRIPTION: TMemoField
      FieldName = 'RDB$DESCRIPTION'
      BlobType = ftMemo
      Size = 8
    end
    object pFIBDataSet_selRDBSYSTEM_FLAG: TFIBSmallIntField
      FieldName = 'RDB$SYSTEM_FLAG'
    end
    object pFIBDataSet_selDBF_FIELDS: TFIBStringField
      FieldName = 'DBF_FIELDS'
      Size = 255
      EmptyStrToNull = True
    end
    object pFIBDataSet_selFIELDS_TYPE: TFIBStringField
      FieldName = 'FIELDS_TYPE'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = frmBuff.pFIBDatabase
    Transaction = frmBuff.pFIBTransactionWrite
    Left = 240
    Top = 144
  end
  object pFIBDataSet_buff_relat: TpFIBDataSet
    Database = frmBuff.pFIBDatabase
    Transaction = frmBuff.pFIBTransactionRead
    SelectSQL.Strings = (
      'select * from DOG_BANKBUFF_RELATIONS where id_bank_buff=:param')
    Left = 272
    Top = 144
    poSQLINT64ToBCD = True
  end
  object pFIBQuery1: TpFIBQuery
    Database = frmBuff.pFIBDatabase
    ParamCheck = False
    Transaction = pFIBTransaction1
    Left = 144
    Top = 144
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = frmBuff.pFIBDatabase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 144
    Top = 176
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 176
    Top = 312
  end
end
