object frCancelOrderItem: TfrCancelOrderItem
  Left = 0
  Top = 0
  Width = 492
  Height = 229
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold, fsItalic]
  ParentFont = False
  TabOrder = 0
  object gbxOrderItemAttr: TGroupBox
    Left = 0
    Top = 0
    Width = 492
    Height = 188
    Align = alClient
    Caption = ' '#1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1087#1091#1085#1082#1090#1091' '#1085#1072#1082#1072#1079#1091' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object edtItem: TqFSpravControl
      Left = 4
      Top = 20
      Width = 300
      Height = 21
      FieldName = 'OUT_ID_CANCEL_ORDER_ITEM'
      DisplayName = #1055#1091#1085#1082#1090
      Interval = 70
      Value = 0
      LabelColor = clGreen
      Required = True
      Semicolon = False
      Asterisk = False
      Enabled = True
      Blocked = False
      TabOrder = 0
      AutoSaveToRegistry = False
      OnOpenSprav = edtItemOpenSprav
      DisplayText = '0'
      DisplayTextField = 'OUT_CANCEL_ORDER_ITEM_TYPE'
    end
    object edtReason: TqFCharControl
      Left = 4
      Top = 53
      Width = 300
      Height = 21
      FieldName = 'OUT_REASON'
      DisplayName = #1055#1110#1076#1089#1090#1072#1074#1072
      Interval = 70
      Value = ''
      LabelColor = clGreen
      Required = True
      Semicolon = False
      Asterisk = False
      Enabled = True
      Blocked = False
      TabOrder = 1
      AutoSaveToRegistry = False
      MaxLength = 0
    end
    object edtNote: TqFCharControl
      Left = 4
      Top = 84
      Width = 300
      Height = 21
      FieldName = 'OUT_NOTE'
      DisplayName = #1055#1088#1080#1084#1110#1090#1082#1072
      Interval = 70
      Value = ''
      LabelColor = clGreen
      Required = False
      Semicolon = False
      Asterisk = False
      Enabled = True
      Blocked = False
      TabOrder = 2
      AutoSaveToRegistry = False
      MaxLength = 0
    end
    object edtKeySession: TqFInvisControl
      Left = 179
      Top = 4
      Width = 94
      Height = 13
      FieldName = 'IN_KEY_SESSION'
      DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
      Interval = 120
      Value = 0
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = False
      Enabled = True
      Blocked = False
      TabOrder = 3
      AutoSaveToRegistry = False
    end
    object edtIdOrderItem: TqFInvisControl
      Left = 179
      Top = 24
      Width = 122
      Height = 13
      FieldName = 'OUT_ID_ORDER_ITEM'
      DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
      Interval = 120
      Value = 0
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = False
      Enabled = True
      Blocked = False
      TabOrder = 4
      AutoSaveToRegistry = False
    end
    object edtIdOrder: TqFInvisControl
      Left = 179
      Top = 44
      Width = 78
      Height = 13
      FieldName = 'IN_ID_ORDER'
      DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
      Interval = 120
      Value = 0
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = False
      Enabled = True
      Blocked = False
      TabOrder = 5
      AutoSaveToRegistry = False
    end
    object edtNumItem: TqFInvisControl
      Left = 84
      Top = 16
      Width = 74
      Height = 13
      FieldName = 'IN_NUM_ITEM'
      DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
      Interval = 120
      Value = 0
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = False
      Enabled = True
      Blocked = False
      TabOrder = 6
      AutoSaveToRegistry = False
    end
    object edtNumSubItem: TqFInvisControl
      Left = 83
      Top = 32
      Width = 86
      Height = 13
      FieldName = 'IN_NUM_SUB_ITEM'
      DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
      Interval = 120
      Value = 0
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = False
      Enabled = True
      Blocked = False
      TabOrder = 7
      AutoSaveToRegistry = False
    end
    object edtIdOrderType: TqFInvisControl
      Left = 64
      Top = 0
      Width = 109
      Height = 17
      FieldName = 'IN_ID_ORDER_TYPE'
      DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
      Interval = 120
      Value = 0
      LabelColor = clGreen
      Required = False
      Semicolon = False
      Asterisk = False
      Enabled = True
      Default = 0
      Blocked = False
      TabOrder = 8
      AutoSaveToRegistry = False
    end
  end
  object pnlForButtons: TPanel
    Left = 0
    Top = 188
    Width = 492
    Height = 41
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object fmcWork: TqFFormControl
      Left = 244
      Top = 10
      Width = 60
      Height = 21
      ControlsOwner = Owner
      InsertSQL.Strings = (
        '    SELECT OUT_ID_ORDER_ITEM'
        '    FROM    UP_DT_CANCEL_INS( '
        '                 :IN_KEY_SESSION,'
        '                 :IN_ID_ORDER,'
        '                 :OUT_ID_CANCEL_ORDER_ITEM,'
        '                 :IN_NUM_ITEM,'
        '                 :IN_NUM_SUB_ITEM,'
        '                 :IN_ID_ORDER_TYPE,'
        '                 :OUT_REASON,'
        '                 :OUT_NOTE )')
      UpdateSQL.Strings = (
        '    EXECUTE PROCEDURE UP_DT_CANCEL_UPD('
        '        :IN_KEY_SESSION,'
        '        :where,'
        '        :IN_ID_ORDER_TYPE,'
        '        :OUT_ID_CANCEL_ORDER_ITEM,'
        '        :OUT_REASON,'
        '        :OUT_NOTE )')
      SelectSQL.Strings = (
        '    SELECT OUT_ID_CANCEL_ORDER_ITEM, OUT_CANCEL_ORDER_ITEM_TYPE,'
        
          '                 OUT_REASON,                              OUT_NO' +
          'TE'
        '    FROM    UP_DT_CANCEL_SEL( :where )')
      LastId = 0
      AddCaption = #1044#1086#1076#1072#1090#1080' '#1087#1091#1085#1082#1090' '#1085#1072#1082#1072#1079#1091
      ModifyCaption = #1047#1084#1110#1085#1080#1090#1080' '#1087#1091#1085#1082#1090' '#1085#1072#1082#1072#1079#1091
      InfoCaption = #1055#1077#1088#1077#1075#1083#1103#1076' '#1087#1091#1085#1082#1090#1091' '#1085#1072#1082#1072#1079#1091
      DatabaseEventBefore = fmcWorkDatabaseEventBefore
      DatabaseEventAfter = fmcWorkDatabaseEventAfter
      Mode = fmAdd
      CheckWhere = False
      CloseForm = True
      ShowErrorDialog = True
      ShowDebugInfoInOk = False
    end
    object btnOK: TBitBtn
      Left = 76
      Top = 8
      Width = 75
      Height = 25
      Hint = #1055#1088#1080#1081#1085#1103#1090#1080' '#1079#1084#1110#1085#1080' <F10>'
      Caption = #1043#1072#1088#1072#1079#1076
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnOKClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000FF00FF000066
        0000B73D3D00C95D5D00CC656500CD696900CE6D6D00D2777700149D2100179D
        270019AA2B001BA92E001AB02D001EAE31001EB1320025A83B0021B4370022B7
        380031B54D0031C24F003BCB5E0041C5630047D36D004FD6790053DE7F00D786
        8600DA909000DC959500DE9B9B00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        010100000000000000000000000000010E0E0100000000000000000000000113
        110C10010000000000000000000116140F010B0E010000000000000001171812
        010001090D010000000000000001150106020000010B01000000000000020106
        060602000001090100000000021A19060204060200000001010000021A1C0702
        0002030602000000010100000219020000000002040200000000000000020000
        0000000002030200000000000000000000000000000002020000000000000000
        0000000000000002020000000000000000000000000000000000}
    end
    object btnCancel: TBitBtn
      Left = 160
      Top = 8
      Width = 75
      Height = 25
      Hint = #1042#1110#1076#1084#1110#1085#1080#1090#1080' '#1079#1084#1110#1085#1080' <Esc>'
      Caption = #1042#1110#1076#1084#1110#1085#1072
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnCancelClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000FF00FF000000
        9A00012AF200002CF600002CF8000733F6000031FE000431FE000134FF000C3C
        FF00123BF100103BF400143EF400103DFB001743F6001B46F6001C47F6001D48
        F6001342FF001A47F8001847FF00174AFD001A48F9001D4BFF001A4CFF001D50
        FF00224DF100224CF400204BF800214CF800214EFC002550F4002D59F4002655
        FA002355FF002659FF002E5BF9002C5FFF00325DF1003B66F3003664FA00386B
        FF004071FA004274FF00497AFC00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000010100
        00000000000101000000000001150B010000000001040601000000000113180B
        010000010306030100000000000110180B010104060301000000000000000111
        190D060603010000000000000000000118120D05010000000000000000000001
        1D181312010000000000000000000124241D1D19110100000000000000012829
        2401011F191F010000000000012A2A26010000011F231D0100000000012C2701
        00000000011F1901000000000001010000000000000101000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
  end
  object dbWork: TpFIBDatabase
    DefaultTransaction = trRead
    DefaultUpdateTransaction = trWrite
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 92
    Top = 56
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dbWork
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'nowait'
      'no_rec_version'
      'read_committed')
    TPBMode = tpbDefault
    UserKindTransaction = 'ktrRead'
    Left = 135
    Top = 56
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dbWork
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'concurrency')
    TPBMode = tpbDefault
    UserKindTransaction = 'ktrWrite'
    Left = 175
    Top = 56
  end
  object dstWork: TpFIBDataSet
    Database = dbWork
    Transaction = trRead
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields]
    UpdateTransaction = trWrite
    Left = 216
    Top = 56
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object spcWork: TpFIBStoredProc
    Database = dbWork
    Transaction = trWrite
    Left = 264
    Top = 56
  end
end
