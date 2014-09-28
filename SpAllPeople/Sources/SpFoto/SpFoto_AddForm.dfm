object fmAddFoto: TfmAddFoto
  Left = 152
  Top = 115
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1080' '#1092#1086#1090#1086
  ClientHeight = 535
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SourcePanel: TPanel
    Left = 0
    Top = 0
    Width = 454
    Height = 535
    Align = alClient
    TabOrder = 0
    OnEnter = SourcePanelEnter
    OnResize = SourcePanelResize
    object ScrollBox1: TScrollBox
      Left = 1
      Top = 1
      Width = 452
      Height = 533
      Align = alClient
      BorderStyle = bsNone
      TabOrder = 0
    end
  end
  object MainPanel: TPanel
    Left = 454
    Top = 0
    Width = 232
    Height = 535
    Align = alRight
    TabOrder = 1
    object ResultPanel: TPanel
      Left = 1
      Top = 1
      Width = 230
      Height = 287
      Align = alTop
      TabOrder = 0
      object ResultImage: TImage
        Left = 1
        Top = 1
        Width = 228
        Height = 285
        Align = alClient
        Center = True
        Proportional = True
        Stretch = True
        Visible = False
      end
    end
    object ToolsPanel: TPanel
      Left = 1
      Top = 288
      Width = 230
      Height = 246
      Align = alClient
      TabOrder = 1
      object OpenBtn: TcxButton
        Left = 24
        Top = 8
        Width = 185
        Height = 25
        Caption = #1042#1110#1076#1082#1088#1080#1090#1080
        TabOrder = 0
        OnClick = OpenBtnClick
      end
      object SaveBtn: TcxButton
        Left = 24
        Top = 40
        Width = 185
        Height = 25
        Caption = #1047#1073#1077#1088#1077#1075#1090#1080
        TabOrder = 1
        OnClick = SaveBtnClick
      end
      object ActualSizeBtn: TcxButton
        Left = 16
        Top = 208
        Width = 105
        Height = 25
        Caption = #1057#1087#1088#1072#1074#1078#1085#1110#1081' '#1088#1086#1079#1084#1110#1088
        TabOrder = 2
        Visible = False
        OnClick = ActualSizeBtnClick
      end
      object FitBtn: TcxButton
        Left = 128
        Top = 208
        Width = 75
        Height = 25
        Caption = #1056#1086#1079#1090#1103#1075#1090#1080
        TabOrder = 3
        Visible = False
        OnClick = FitBtnClick
      end
      object ExitBtn: TcxButton
        Left = 24
        Top = 72
        Width = 185
        Height = 25
        Caption = #1042#1080#1081#1090#1080
        TabOrder = 4
        OnClick = ExitBtnClick
      end
      object cxLabel3: TcxLabel
        Left = 24
        Top = 120
        Width = 89
        Height = 17
        TabOrder = 5
        Caption = #1044#1072#1090#1072' '#1092#1086#1090#1086#1075#1072#1092#1110#1111':'
      end
      object FotoDE: TcxDateEdit
        Left = 120
        Top = 120
        Width = 82
        Height = 21
        Properties.ReadOnly = True
        TabOrder = 6
      end
      object AdjustBtn: TcxButton
        Left = 48
        Top = 208
        Width = 129
        Height = 25
        Caption = #1042#1080#1073#1088#1072#1090#1080' '#1074#1089#1077' '#1092#1086#1090#1086
        TabOrder = 7
        OnClick = AdjustBtnClick
      end
      object ActualSizePanel: TPanel
        Left = 8
        Top = 152
        Width = 217
        Height = 49
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 8
        object MEActualHeight: TcxMaskEdit
          Left = 118
          Top = 25
          Width = 33
          Height = 21
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          TabOrder = 0
        end
        object LblActual: TcxLabel
          Left = 16
          Top = 6
          Width = 93
          Height = 17
          TabOrder = 1
          Caption = #1056#1077#1072#1083#1100#1085#1110' '#1088#1086#1079#1084#1110#1088#1080':'
        end
        object MEActualWidth: TcxMaskEdit
          Left = 68
          Top = 25
          Width = 33
          Height = 21
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          TabOrder = 2
        end
        object cxLabel2: TcxLabel
          Left = 103
          Top = 27
          Width = 14
          Height = 17
          AutoSize = False
          TabOrder = 3
          Caption = 'x'
        end
      end
    end
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=win1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 488
    Top = 128
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 504
    Top = 200
    poSQLINT64ToBCD = True
    object DSet1ID_FOTO: TFIBIntegerField
      FieldName = 'ID_FOTO'
    end
    object DSet1ID_MAN: TFIBIntegerField
      FieldName = 'ID_MAN'
    end
    object DSet1FOTO: TFIBBlobField
      FieldName = 'FOTO'
      Size = 8
    end
    object DSet1DATE_FOTO: TFIBDateField
      FieldName = 'DATE_FOTO'
    end
    object DSet1DATE_BEG: TFIBDateField
      FieldName = 'DATE_BEG'
    end
    object DSet1DATE_END: TFIBDateField
      FieldName = 'DATE_END'
    end
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 552
    Top = 128
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 520
    Top = 128
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 536
    Top = 200
  end
  object OpenDialog: TOpenPictureDialog
    Filter = 
      'All (*.jpg;*.jpeg)|*.jpg;*.jpeg|JPEG Image File (*.jpg)|*.jpg|JP' +
      'EG Image File (*.jpeg)|*.jpeg'
    Left = 576
    Top = 208
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = ReadTransaction
    Left = 592
    Top = 168
  end
  object MainDB: TpFIBDatabase
    DefaultTransaction = MainTrans
    DefaultUpdateTransaction = MainTrans
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 495
    Top = 49
  end
  object MainTrans: TpFIBTransaction
    DefaultDatabase = MainDB
    TimeoutAction = TARollback
    Left = 535
    Top = 49
  end
  object MainStorProc: TpFIBStoredProc
    Database = MainDB
    Transaction = MainTrans
    Left = 575
    Top = 49
  end
end
