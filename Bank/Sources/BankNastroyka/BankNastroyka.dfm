object fmBankNastroyka: TfmBankNastroyka
  Left = 373
  Top = 178
  Width = 667
  Height = 698
  BorderIcons = []
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    651
    660)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 9
    Top = 9
    Width = 641
    Height = 650
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvSpace
    BorderStyle = bsSingle
    ParentColor = True
    TabOrder = 21
    object cxDateValutaEdit: TcxDateEdit
      Left = 48
      Top = 595
      Width = 121
      Height = 21
      Properties.ReadOnly = True
      Style.Color = clMoneyGreen
      TabOrder = 0
    end
    object cxDateValutaMemo: TcxMemo
      Left = 222
      Top = 592
      Width = 401
      Height = 25
      Lines.Strings = (
        'cxDateValutaMemo')
      TabOrder = 1
    end
  end
  object cxMaskDayShowLast: TcxMaskEdit
    Left = 87
    Top = 58
    Width = 71
    Height = 21
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '[0-9] | [1-9][0-9]+'
    Properties.MaxLength = 0
    Style.Color = clMoneyGreen
    TabOrder = 1
  end
  object cxMemoDayShowLast: TcxMemo
    Left = 232
    Top = 54
    Width = 400
    Height = 32
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 12
  end
  object cxButtonEditGroup: TcxButtonEdit
    Left = 23
    Top = 199
    Width = 200
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditGroupPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 6
  end
  object cxMemoGroup: TcxMemo
    Left = 232
    Top = 194
    Width = 400
    Height = 32
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 13
  end
  object cxButtonEditGroupAddPR: TcxButtonEdit
    Left = 23
    Top = 233
    Width = 200
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditGroupAddPRPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 7
  end
  object cxMemoGroupAddPR: TcxMemo
    Left = 232
    Top = 228
    Width = 400
    Height = 32
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 14
  end
  object cxButtonEditGroupAddRas: TcxButtonEdit
    Left = 23
    Top = 268
    Width = 200
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditGroupAddRasPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 8
  end
  object cxMemoGroupAddRas: TcxMemo
    Left = 232
    Top = 263
    Width = 400
    Height = 32
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 15
  end
  object cxDateEditDateInstallSystem: TcxDateEdit
    Left = 62
    Top = 24
    Width = 121
    Height = 21
    Style.Color = clMoneyGreen
    TabOrder = 0
  end
  object cxMemoDateInstallSystem: TcxMemo
    Left = 231
    Top = 20
    Width = 400
    Height = 32
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 16
  end
  object cxButtonCancel: TcxButton
    Left = 510
    Top = 632
    Width = 115
    Height = 22
    Cancel = True
    Caption = #1042'i'#1076#1084'i'#1085#1080#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = cxButtonCancelClick
    LookAndFeel.NativeStyle = False
  end
  object cxButtonWrite: TcxButton
    Left = 376
    Top = 632
    Width = 115
    Height = 22
    Caption = #1047#1072#1087#1080#1089#1072#1090#1080
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = cxButtonWriteClick
    LookAndFeel.NativeStyle = False
  end
  object cxMemoIDDogKomis: TcxMemo
    Left = 232
    Top = 88
    Width = 400
    Height = 32
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      '')
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 17
  end
  object cxButtonEditIDDogKomis: TcxButtonEdit
    Left = 23
    Top = 94
    Width = 200
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditIDDogKomisPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 2
  end
  object cxMemoKODDogKomis: TcxMemo
    Left = 232
    Top = 297
    Width = 400
    Height = 33
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      '')
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 18
  end
  object cxButtonEditKODDogKomis: TcxButtonEdit
    Left = 23
    Top = 303
    Width = 200
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditKODDogKomisPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 9
  end
  object cxMemoState: TcxMemo
    Left = 231
    Top = 123
    Width = 400
    Height = 32
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      '')
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 19
  end
  object cxButtonEditState: TcxButtonEdit
    Left = 22
    Top = 129
    Width = 200
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditStatePropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 3
  end
  object cxCheckBoxKomis: TcxCheckBox
    Left = 108
    Top = 163
    Width = 22
    Height = 21
    Properties.Alignment = taRightJustify
    Properties.DisplayUnchecked = 'False'
    Properties.MultiLine = True
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = '1'
    Properties.ValueGrayed = 'null'
    Properties.ValueUnchecked = '0'
    Properties.OnChange = cxCheckBoxKomisPropertiesChange
    Properties.Caption = ''
    TabOrder = 4
  end
  object cxMemoKomis: TcxMemo
    Left = 410
    Top = 159
    Width = 223
    Height = 32
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 20
  end
  object cxButtonKomis: TcxButtonEdit
    Left = 232
    Top = 164
    Width = 171
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonKomisPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 5
  end
  object cxButtonEditID_KEKV: TcxButtonEdit
    Left = 23
    Top = 338
    Width = 200
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditID_KEKVPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 22
  end
  object cxMemoID_KEKV: TcxMemo
    Left = 232
    Top = 332
    Width = 400
    Height = 33
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      '')
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 23
  end
  object MaskDay_AgoShow: TcxMaskEdit
    Left = 71
    Top = 369
    Width = 71
    Height = 21
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '[0-9] | [1-9][0-9]+'
    Properties.MaxLength = 0
    Style.Color = clMoneyGreen
    TabOrder = 24
  end
  object MaskDay_AgoDo: TcxMaskEdit
    Left = 71
    Top = 408
    Width = 71
    Height = 21
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '[0-9] | [1-9][0-9]+'
    Properties.MaxLength = 0
    Style.Color = clMoneyGreen
    TabOrder = 25
  end
  object MemoDay_AgoShow: TcxMemo
    Left = 232
    Top = 367
    Width = 400
    Height = 32
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 26
  end
  object MemoDay_AgoDo: TcxMemo
    Left = 232
    Top = 402
    Width = 400
    Height = 31
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 27
  end
  object CheckBoxExpertSystem: TcxCheckBox
    Left = 108
    Top = 446
    Width = 22
    Height = 21
    Properties.Alignment = taRightJustify
    Properties.DisplayUnchecked = 'False'
    Properties.MultiLine = True
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = '1'
    Properties.ValueGrayed = 'null'
    Properties.ValueUnchecked = '0'
    Properties.OnChange = cxCheckBoxKomisPropertiesChange
    Properties.Caption = ''
    TabOrder = 28
  end
  object MemoExpertSystem: TcxMemo
    Left = 232
    Top = 438
    Width = 401
    Height = 32
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 29
  end
  object MemoMoveDBKr: TcxMemo
    Left = 232
    Top = 474
    Width = 401
    Height = 32
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 30
  end
  object cxComboBox1: TcxComboBox
    Left = 23
    Top = 476
    Width = 200
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 12
    Properties.Items.Strings = (
      #1054#1089#1085#1086#1074#1085#1080#1081'/'#1082#1086#1088#1077#1089#1087#1086#1085#1076#1091#1102#1095#1080#1081
      #1044#1077#1073#1077#1090'/'#1082#1088#1077#1076#1080#1090
      #1050#1088#1077#1076#1080#1090'/'#1076#1077#1073#1077#1090)
    Style.Color = clMoneyGreen
    TabOrder = 31
  end
  object cxButtonRazd: TcxButtonEdit
    Left = 20
    Top = 544
    Width = 200
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonRazdPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 32
  end
  object cxMemoRazd: TcxMemo
    Left = 232
    Top = 544
    Width = 401
    Height = 21
    Properties.ReadOnly = True
    TabOrder = 33
  end
  object cxButtonDog: TcxButtonEdit
    Left = 20
    Top = 579
    Width = 200
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonDogPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 34
  end
  object cxMemoDog: TcxMemo
    Left = 232
    Top = 578
    Width = 401
    Height = 21
    Lines.Strings = (
      '')
    Properties.ReadOnly = True
    TabOrder = 35
  end
  object cxMemoNich: TcxMemo
    Left = 232
    Top = 509
    Width = 401
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 36
  end
  object cxCheckBoxNich: TcxCheckBox
    Left = 108
    Top = 505
    Width = 23
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = ''
    TabOrder = 37
  end
  object pFIBDatabase1: TpFIBDatabase
    DBParams.Strings = (
      'password=masterkey'
      'user_name=SYSDBA'
      'lc_ctype=WIN1251')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 500
    Top = 15
  end
  object pFIBTransactionBase: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 532
    Top = 14
  end
  object pFIBDataSet: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransactionDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    BAN.BANK_DAY_SHOW_LAST,'
      '    BAN.BANK_INSTALL_SYSTEM,'
      '    BAN.BANK_ID_DOG_KOMIS,'
      '    BAN.BANK_KOD_DOG_KOMIS,'
      '    BAN.BANK_ID_STATE_KOMIS,'
      '    BAN.BANK_SCH_KOMIS,'
      '    BAN.BANK_FLAG_SCH_KOMIS,'
      '    BAN.ID_GROUP,'
      '    BAN.ID_GROUP_ADD_PR,'
      '    BAN.ID_GROUP_ADD_RAS,'
      '    BAN.ID_DOG_RS_RS_DEBET,'
      '    BAN.KOD_DOG_RS_RS_DEBET,'
      '    BAN.ID_KEKV_FOR_OLD_TRIT,'
      '    BAN.COUNT_DAY_FOR_KOMIS,'
      '    BAN.DAY_AGO_SHOW,'
      '    BAN.DAY_AGO_DO,'
      '    BAN.USE_EXPERT_SYSTEM,'
      '    BAN.USE_MOVE_ORDER_DEB_KR,'
      '    BAN.BANK_ID_RAZDEL_NICH,'
      '    BAN.BANK_ID_DOG_NICH,'
      '    BAN.BANK_KOD_DOG_NICH,'
      '    BAN.CHECK_SHOW_NICH'
      'FROM'
      '    BANK_INI BAN')
    Left = 501
    Top = 49
    poSQLINT64ToBCD = True
  end
  object pFIBTransactionDataSet: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 536
    Top = 49
  end
  object pFIBDataSetState: TpFIBDataSet
    Left = 272
    Top = 147
    poSQLINT64ToBCD = True
  end
  object pFIBTransactionState: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 299
    Top = 147
  end
  object pFIBQueryWrite: TpFIBQuery
    Left = 504
    Top = 137
  end
  object pFIBTransactionWrite: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 536
    Top = 139
  end
  object pFIBDataSet_Get_Group: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransaction_Get_Group
    SelectSQL.Strings = (
      'select * from DOG_DT_GROUP_DOC where ID_GROUP_DOC = :id')
    Left = 96
    Top = 255
    poSQLINT64ToBCD = True
    object pFIBDataSet_Get_GroupID_GROUP_DOC: TFIBBCDField
      FieldName = 'ID_GROUP_DOC'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSet_Get_GroupN_GROUP_DOC: TFIBIntegerField
      FieldName = 'N_GROUP_DOC'
    end
    object pFIBDataSet_Get_GroupNAME_GROUP_DOC: TFIBStringField
      FieldName = 'NAME_GROUP_DOC'
      Size = 80
      EmptyStrToNull = True
    end
  end
  object pFIBTransaction_Get_Group: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 96
    Top = 285
  end
  object DataSet: TpFIBDataSet
    Left = 449
    Top = 187
    poSQLINT64ToBCD = True
  end
  object Transaction: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 513
    Top = 187
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Database = pFIBDatabase1
    Transaction = pFIBTransaction_start
    Left = 233
    Top = 57
  end
  object pFIBTransaction_start: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 264
    Top = 56
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 104
    Top = 240
  end
  object Transaction1: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    TPBMode = tpbDefault
    Left = 420
    Top = 99
  end
end
