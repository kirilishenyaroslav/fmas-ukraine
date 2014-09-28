object fmCancelOrderItem: TfmCancelOrderItem
  Left = 395
  Top = 215
  AutoSize = True
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 319
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = True
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object gbxCancelItemAttr: TGroupBox
    Left = 0
    Top = 0
    Width = 312
    Height = 157
    Align = alTop
    Caption = ' '#1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1087#1091#1085#1082#1090#1091' '#1085#1072#1082#1072#1079#1091', '#1097#1086' '#1074#1110#1076#1084#1110#1085#1103#1108#1090#1100#1089#1103' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object edtDateProjCancelOrder: TqFDateControl
      Left = 4
      Top = 49
      Width = 300
      Height = 21
      FieldName = 'OUT_DATE_PROJ_CANCEL_ORDER'
      DisplayName = #1044#1072#1090#1072' '#1087#1088#1086#1077#1082#1090#1091' '#1085#1072#1082#1072#1079#1072
      Interval = 200
      Value = 0
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = False
      Enabled = True
      OnChange = edtNumProjCancelOrderChange
      Default = 0d
      Blocked = False
      TabOrder = 1
      AutoSaveToRegistry = False
      CheckDateIsEmpty = False
    end
    object edtNumCancelItem: TqFIntControl
      Left = 4
      Top = 77
      Width = 300
      Height = 21
      FieldName = 'OUT_NUM_CANCEL_ITEM'
      DisplayName = #8470' '#1055#1091#1085#1082#1090#1091
      Interval = 200
      Value = 0
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = False
      Enabled = True
      OnChange = edtNumProjCancelOrderChange
      Default = 0
      Blocked = False
      TabOrder = 2
      AutoSaveToRegistry = False
      MaxLength = 10
      NegativeAllowed = False
      ZeroAllowed = False
    end
    object edtNumCancelSubItem: TqFIntControl
      Left = 4
      Top = 105
      Width = 300
      Height = 21
      FieldName = 'OUT_NUM_CANCEL_SUB_ITEM'
      DisplayName = #8470' '#1055#1110#1076#1087#1091#1085#1082#1090#1091
      Interval = 200
      Value = 0
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = False
      Enabled = True
      OnChange = edtNumProjCancelOrderChange
      Default = 0
      Blocked = False
      TabOrder = 3
      AutoSaveToRegistry = False
      MaxLength = 10
      NegativeAllowed = False
      ZeroAllowed = True
    end
    object cbxBoby: TCheckBox
      Left = 11
      Top = 132
      Width = 206
      Height = 17
      Alignment = taLeftJustify
      Caption = #1058#1110#1083#1086' '#1087#1091#1085#1082#1090#1091':'
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = cbxBobyClick
    end
    object edtNumProjCancelOrder: TqFCharControl
      Left = 4
      Top = 21
      Width = 300
      Height = 21
      FieldName = 'OUT_NUM_PROJ_CANCEL_ORDER'
      DisplayName = #8470' '#1055#1088#1086#1077#1082#1090#1091' '#1085#1072#1082#1072#1079#1072
      Interval = 200
      Value = '0'
      LabelColor = clGreen
      Required = True
      Semicolon = True
      Asterisk = False
      Enabled = True
      OnChange = edtNumProjCancelOrderChange
      Default = '0'
      Blocked = False
      TabOrder = 0
      AutoSaveToRegistry = False
      MaxLength = 10
    end
  end
  object pnlForButtons: TPanel
    Left = 0
    Top = 278
    Width = 312
    Height = 41
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      312
      41)
    object fmcWork: TqFFormControl
      Left = 8
      Top = 11
      Width = 60
      Height = 21
      ControlsOwner = Owner
      InsertSQL.Strings = (
        '    SELECT OUT_ID_ORDER_ITEM'
        '    FROM   UP_DT_CANCEL_INS_TMP('
        '                     :IN_KEY_SESSION,'
        '                     :IN_ID_ORDER,'
        '                     :IN_NUM_ITEM,'
        '                     :IN_NUM_SUB_ITEM,'
        '                     :IN_ID_ORDER_TYPE,'
        '                     :OUT_REASON,'
        '                     :OUT_NOTE,'
        '                     :OUT_NUM_PROJ_CANCEL_ORDER,'
        '                     :OUT_DATE_PROJ_CANCEL_ORDER,'
        '                     :OUT_NUM_CANCEL_ITEM,'
        '                     :OUT_NUM_CANCEL_SUB_ITEM )')
      UpdateSQL.Strings = (
        '    EXECUTE PROCEDURE UP_DT_CANCEL_UPD_TMP('
        '        :IN_KEY_SESSION,'
        '        :where,'
        '        :IN_ID_ORDER_TYPE,'
        '        :OUT_REASON,'
        '        :OUT_NOTE,'
        '        :OUT_NUM_PROJ_CANCEL_ORDER,'
        '        :OUT_DATE_PROJ_CANCEL_ORDER,'
        '        :OUT_NUM_CANCEL_ITEM,'
        '        :OUT_NUM_CANCEL_SUB_ITEM )')
      SelectSQL.Strings = (
        
          '    SELECT OUT_REASON,                                   OUT_NOT' +
          'E,                         OUT_NUM_PROJ_CANCEL_ORDER,'
        
          '                 OUT_DATE_PROJ_CANCEL_ORDER, OUT_NUM_CANCEL_ITEM' +
          ', OUT_NUM_CANCEL_SUB_ITEM,'
        '                 OUT_BODY'
        '    FROM   UP_DT_CANCEL_SEL_TMP( :where )')
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
      Left = 149
      Top = 8
      Width = 75
      Height = 25
      Hint = #1055#1088#1080#1081#1085#1103#1090#1080' '#1079#1084#1110#1085#1080' <F10>'
      Anchors = [akRight, akBottom]
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
      Left = 233
      Top = 8
      Width = 75
      Height = 25
      Hint = #1042#1110#1076#1084#1110#1085#1080#1090#1080' '#1079#1084#1110#1085#1080' <Esc>'
      Anchors = [akRight, akBottom]
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
  object pnlWebBrowContainer: TPanel
    Left = 0
    Top = 218
    Width = 312
    Height = 60
    Align = alBottom
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 3
    TabStop = True
    object wbbBody: TWebBrowser
      Left = 1
      Top = 1
      Width = 310
      Height = 58
      Align = alClient
      TabOrder = 0
      ControlData = {
        4C0000000A200000FF0500000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
    object edtBody: TqFInvisControl
      Left = 2
      Top = 1
      Width = 60
      Height = 13
      FieldName = 'OUT_BODY'
      DisplayName = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
      Interval = 120
      LabelColor = clGreen
      Required = False
      Semicolon = False
      Asterisk = False
      Enabled = True
      Blocked = False
      TabOrder = 1
      AutoSaveToRegistry = False
    end
    object edtIdOrderType: TqFInvisControl
      Left = 91
      Top = 33
      Width = 109
      Height = 13
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
      TabOrder = 2
      AutoSaveToRegistry = False
    end
    object edtNumItem: TqFInvisControl
      Left = 215
      Top = 1
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
      TabOrder = 3
      AutoSaveToRegistry = False
    end
    object edtNumSubItem: TqFInvisControl
      Left = 2
      Top = 33
      Width = 86
      Height = 14
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
      TabOrder = 4
      AutoSaveToRegistry = False
    end
    object edtKeySession: TqFInvisControl
      Left = 91
      Top = 1
      Width = 94
      Height = 15
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
      TabOrder = 5
      AutoSaveToRegistry = False
    end
    object edtIdOrderItem: TqFInvisControl
      Left = 91
      Top = 17
      Width = 118
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
      TabOrder = 6
      AutoSaveToRegistry = False
    end
    object edtIdOrder: TqFInvisControl
      Left = 2
      Top = 17
      Width = 74
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
      TabOrder = 7
      AutoSaveToRegistry = False
    end
  end
  object splWebBrow: TcxSplitter
    Left = 0
    Top = 210
    Width = 312
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer8Style'
    AlignSplitter = salBottom
    Control = pnlWebBrowContainer
  end
  object gbxItemAttr: TGroupBox
    Left = 0
    Top = 157
    Width = 312
    Height = 80
    Align = alTop
    Caption = ' '#1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1087#1091#1085#1082#1090#1091' '#1085#1072#1082#1072#1079#1091', '#1097#1086' '#1074#1110#1076#1084#1110#1085#1103#1108' '#1110#1085#1096#1080#1081' '
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object edtReason: TqFCharControl
      Left = 4
      Top = 22
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
      TabOrder = 0
      AutoSaveToRegistry = False
      MaxLength = 0
    end
    object edtNote: TqFCharControl
      Left = 4
      Top = 50
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
      TabOrder = 1
      AutoSaveToRegistry = False
      MaxLength = 0
    end
  end
  object dbWork: TpFIBDatabase
    DefaultTransaction = trRead
    DefaultUpdateTransaction = trWrite
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 88
    Top = 44
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
    Left = 131
    Top = 44
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
    Left = 171
    Top = 44
  end
  object dstWork: TpFIBDataSet
    Database = dbWork
    Transaction = trRead
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields]
    UpdateTransaction = trWrite
    Left = 212
    Top = 44
    poSQLINT64ToBCD = True
  end
  object spcWork: TpFIBStoredProc
    Database = dbWork
    Transaction = trWrite
    Left = 260
    Top = 44
  end
  object pprBody: TPageProducer
    Left = 260
    Top = 264
  end
end
