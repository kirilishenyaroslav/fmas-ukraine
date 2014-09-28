object fmJNastroyka: TfmJNastroyka
  Left = 400
  Top = 140
  Width = 723
  Height = 665
  VertScrollBar.Position = 199
  Caption = 'fmJNastroyka'
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 10
    Top = -197
    Width = 682
    Height = 783
    BevelOuter = bvSpace
    BorderStyle = bsSingle
    ParentColor = True
    TabOrder = 2
    object cxButtonEditSmeta: TcxButtonEdit
      Left = 20
      Top = 35
      Width = 221
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEditSmetaPropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 0
    end
    object cxMemoSmeta: TcxMemo
      Left = 253
      Top = 34
      Width = 415
      Height = 23
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Shadow = False
      TabOrder = 1
    end
    object cxMemoRazdel: TcxMemo
      Left = 253
      Top = 58
      Width = 415
      Height = 23
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Shadow = False
      TabOrder = 2
    end
    object cxButtonEditRazdel: TcxButtonEdit
      Left = 20
      Top = 59
      Width = 221
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEditRazdelPropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 3
    end
    object cxButtonEditState: TcxButtonEdit
      Left = 20
      Top = 84
      Width = 221
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEditStatePropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 4
    end
    object cxMemoState: TcxMemo
      Left = 254
      Top = 83
      Width = 415
      Height = 23
      Lines.Strings = (
        '')
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Shadow = False
      TabOrder = 5
    end
    object cxMemoID_KEKV: TcxMemo
      Left = 254
      Top = 108
      Width = 415
      Height = 23
      Lines.Strings = (
        '')
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Shadow = False
      TabOrder = 6
    end
    object cxButtonEditID_KEKV: TcxButtonEdit
      Left = 20
      Top = 108
      Width = 221
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEditID_KEKVPropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 7
    end
    object cxCheckBoxShowDebet: TcxCheckBox
      Left = 98
      Top = 133
      Width = 25
      Height = 21
      Properties.Alignment = taRightJustify
      Properties.DisplayUnchecked = 'False'
      Properties.MultiLine = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = '1'
      Properties.ValueGrayed = 'null'
      Properties.ValueUnchecked = '0'
      Properties.Caption = ''
      TabOrder = 8
    end
    object cxMemoShowDebet: TcxMemo
      Left = 254
      Top = 133
      Width = 415
      Height = 23
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Shadow = False
      TabOrder = 9
    end
    object cxMaskDayShowLast: TcxMaskEdit
      Left = 77
      Top = 159
      Width = 71
      Height = 21
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '[0-9] | [1-9][0-9]+'
      Properties.MaxLength = 0
      Style.Color = clMoneyGreen
      TabOrder = 10
    end
    object cxMemoDayShowLast: TcxMemo
      Left = 254
      Top = 158
      Width = 415
      Height = 23
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Shadow = False
      TabOrder = 11
    end
    object cxCheckBoxNewAlg: TcxCheckBox
      Left = 101
      Top = 184
      Width = 22
      Height = 21
      Properties.Alignment = taRightJustify
      Properties.DisplayUnchecked = 'False'
      Properties.MultiLine = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = '1'
      Properties.ValueGrayed = 'null'
      Properties.ValueUnchecked = '0'
      Properties.OnChange = cxCheckBoxNewAlgPropertiesChange
      Properties.Caption = ''
      TabOrder = 12
    end
    object cxMemoAlg: TcxMemo
      Left = 400
      Top = 183
      Width = 269
      Height = 23
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Shadow = False
      TabOrder = 13
    end
    object cxDateEditDateNewAlg: TcxDateEdit
      Left = 255
      Top = 185
      Width = 121
      Height = 21
      Enabled = False
      Style.Color = clMoneyGreen
      TabOrder = 14
    end
    object cxCheckBoxShowNeosnProv: TcxCheckBox
      Left = 98
      Top = 207
      Width = 25
      Height = 21
      Properties.Alignment = taRightJustify
      Properties.DisplayUnchecked = 'False'
      Properties.MultiLine = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = '1'
      Properties.ValueGrayed = 'null'
      Properties.ValueUnchecked = '0'
      Properties.Caption = ''
      TabOrder = 15
    end
    object cxMemoShowNeosnProv: TcxMemo
      Left = 255
      Top = 208
      Width = 415
      Height = 23
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Shadow = False
      TabOrder = 16
    end
    object cxCheckBoxDelBuf: TcxCheckBox
      Left = 98
      Top = 232
      Width = 25
      Height = 21
      Properties.Alignment = taRightJustify
      Properties.DisplayUnchecked = 'False'
      Properties.MultiLine = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = '1'
      Properties.ValueGrayed = 'null'
      Properties.ValueUnchecked = '0'
      Properties.Caption = ''
      TabOrder = 17
    end
    object cxMemoDelBuf: TcxMemo
      Left = 255
      Top = 233
      Width = 415
      Height = 23
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Shadow = False
      TabOrder = 18
    end
    object cxButtonEditGroupAddRas: TcxButtonEdit
      Left = 20
      Top = 308
      Width = 221
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEditGroupAddRasPropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 19
    end
    object cxMemoGroupAddRas: TcxMemo
      Left = 256
      Top = 308
      Width = 414
      Height = 23
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Shadow = False
      TabOrder = 20
    end
    object cxMemoKODDogKomis: TcxMemo
      Left = 255
      Top = 258
      Width = 414
      Height = 23
      Lines.Strings = (
        '')
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Shadow = False
      TabOrder = 21
    end
    object cxButtonEditKODDogKomis: TcxButtonEdit
      Left = 20
      Top = 259
      Width = 221
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEditKODDogKomisPropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 22
    end
    object cxButtonEditPrih: TcxButtonEdit
      Left = 20
      Top = 283
      Width = 221
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEditPrihPropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 23
    end
    object cxMemoPrih: TcxMemo
      Left = 256
      Top = 283
      Width = 415
      Height = 23
      Lines.Strings = (
        '')
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Shadow = False
      TabOrder = 24
    end
    object cxCheckBoxShowKom: TcxCheckBox
      Left = 98
      Top = 334
      Width = 25
      Height = 21
      Properties.Alignment = taRightJustify
      Properties.DisplayUnchecked = 'False'
      Properties.MultiLine = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = '1'
      Properties.ValueGrayed = 'null'
      Properties.ValueUnchecked = '0'
      Properties.Caption = ''
      TabOrder = 25
    end
    object cxMemoShowKom: TcxMemo
      Left = 255
      Top = 332
      Width = 415
      Height = 23
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Shadow = False
      TabOrder = 26
    end
    object cxCheckBoxShowShablons: TcxCheckBox
      Left = 98
      Top = 360
      Width = 25
      Height = 21
      Properties.Alignment = taRightJustify
      Properties.DisplayUnchecked = 'False'
      Properties.MultiLine = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = '1'
      Properties.ValueGrayed = 'null'
      Properties.ValueUnchecked = '0'
      Properties.Caption = ''
      TabOrder = 27
    end
    object cxMemoShowShablons: TcxMemo
      Left = 255
      Top = 358
      Width = 415
      Height = 23
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Shadow = False
      TabOrder = 28
    end
    object CheckBox_MO_PRINT_ONLY_VIKON: TCheckBox
      Left = 110
      Top = 582
      Width = 17
      Height = 25
      TabOrder = 29
    end
    object Memo_MO_PRINT_ONLY_VIKON: TcxMemo
      Left = 256
      Top = 576
      Width = 413
      Height = 33
      Lines.Strings = (
        'Memo_MO_PRINT_ONLY_VIKON')
      ParentColor = True
      TabOrder = 30
    end
    object Memo_J4_IS_DEFAULT_COMMENT_VEDOMOST: TcxMemo
      Left = 256
      Top = 611
      Width = 413
      Height = 25
      Lines.Strings = (
        'Memo_J4_IS_DEFAULT_COMMENT_VEDOMOST')
      Style.Color = clInfoBk
      TabOrder = 31
    end
    object Memo_J4_DEFAULT_COMMENT_VEDOMOST: TcxMemo
      Left = 256
      Top = 637
      Width = 413
      Height = 33
      Lines.Strings = (
        'Memo_J4_DEFAULT_COMMENT_VEDOMOST')
      Style.Color = clInfoBk
      TabOrder = 32
    end
    object Memo_J4_DEFAULT_COMMENT_VEDOMOST_VAL: TcxMemo
      Left = 16
      Top = 637
      Width = 233
      Height = 33
      Lines.Strings = (
        'Memo_J4_DEFAULT_COMMENT_VEDOMOS'
        'T_VAL')
      TabOrder = 33
    end
    object CheckBox_J4_IS_DEFAULT_COMMENT_VEDOMOST: TcxCheckBox
      Left = 106
      Top = 608
      Width = 25
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = ''
      TabOrder = 34
      OnClick = CheckBox_J4_IS_DEFAULT_COMMENT_VEDOMOSTClick
    end
    object Memo_IS_SELECT_TYPE_VVOD_VEDOM: TcxMemo
      Left = 256
      Top = 672
      Width = 413
      Height = 20
      Lines.Strings = (
        'Memo_IS_SELECT_TYPE_VVOD_VEDOM')
      Style.Color = clInfoBk
      TabOrder = 35
    end
    object CheckBox_IS_SELECT_TYPE_VVOD_VEDOM: TcxCheckBox
      Left = 106
      Top = 672
      Width = 23
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 36
    end
    object Memo_J4_IS_PRINT_NAKAZ_IN_VEDOM_AV_O: TcxMemo
      Left = 256
      Top = 696
      Width = 413
      Height = 20
      Lines.Strings = (
        'Memo_IS_SELECT_TYPE_VVOD_VEDOM')
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 37
    end
    object CheckBox_J4_IS_PRINT_NAKAZ_IN_VEDOM_AV_O: TcxCheckBox
      Left = 106
      Top = 696
      Width = 23
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 38
    end
    object Memo_IS_SELECT_TYPE_DOC_AV_O: TcxMemo
      Left = 256
      Top = 720
      Width = 413
      Height = 20
      Lines.Strings = (
        'Memo_IS_SELECT_TYPE_VVOD_VEDOM')
      Style.Color = clInfoBk
      TabOrder = 39
    end
    object CheckBox_IS_SELECT_TYPE_DOC: TcxCheckBox
      Left = 106
      Top = 720
      Width = 23
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 40
    end
    object CheckBox_IS_VIEW_MO_ZVED_ZVIT: TcxCheckBox
      Left = 106
      Top = 744
      Width = 23
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = ''
      TabOrder = 41
    end
    object Memo_IS_VIEW_MO_ZVED_ZVIT: TcxMemo
      Left = 256
      Top = 744
      Width = 413
      Height = 20
      Lines.Strings = (
        'Memo_IS_VIEW_MO_ZVED_ZVIT')
      Style.Color = clInfoBk
      TabOrder = 42
    end
  end
  object cxCheckBoxRasshifr: TcxCheckBox
    Left = 102
    Top = -179
    Width = 25
    Height = 21
    Properties.Alignment = taRightJustify
    Properties.DisplayUnchecked = 'False'
    Properties.MultiLine = True
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = '1'
    Properties.ValueGrayed = 'null'
    Properties.ValueUnchecked = '0'
    Properties.Caption = ''
    TabOrder = 0
  end
  object cxMemoRasshifr: TcxMemo
    Left = 264
    Top = -184
    Width = 415
    Height = 23
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 1
  end
  object cxButton1: TcxButton
    Left = 450
    Top = 589
    Width = 115
    Height = 21
    Caption = #1047#1072#1087#1080#1089#1072#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = cxButton1Click
    LookAndFeel.NativeStyle = False
  end
  object cxButton2: TcxButton
    Left = 570
    Top = 589
    Width = 115
    Height = 21
    Caption = #1047#1072#1082#1088#1080#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = cxButton2Click
    LookAndFeel.NativeStyle = False
  end
  object cxCheckBoxUseAccess: TcxCheckBox
    Left = 110
    Top = 185
    Width = 25
    Height = 21
    Properties.Alignment = taRightJustify
    Properties.DisplayUnchecked = 'False'
    Properties.MultiLine = True
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = '1'
    Properties.ValueGrayed = 'null'
    Properties.ValueUnchecked = '0'
    Properties.Caption = ''
    TabOrder = 5
  end
  object cxMemoUseAccess: TcxMemo
    Left = 267
    Top = 188
    Width = 415
    Height = 22
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 6
  end
  object cxMemoReestrTitle: TcxMemo
    Left = 267
    Top = 211
    Width = 415
    Height = 31
    ParentFont = False
    Properties.ReadOnly = False
    Style.BorderColor = clWindowFrame
    Style.Color = clMoneyGreen
    Style.Shadow = False
    TabOrder = 7
  end
  object cxMemoHead: TcxMemo
    Left = 11
    Top = 211
    Width = 246
    Height = 23
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 8
  end
  object CheckBoxNewNumAlg: TcxCheckBox
    Left = 109
    Top = 244
    Width = 22
    Height = 21
    Properties.Alignment = taRightJustify
    Properties.DisplayUnchecked = 'False'
    Properties.MultiLine = True
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = '1'
    Properties.ValueGrayed = 'null'
    Properties.ValueUnchecked = '0'
    Properties.OnChange = CheckBoxNewNumAlgPropertiesChange
    Properties.Caption = ''
    TabOrder = 9
  end
  object MemoNewNumAlg: TcxMemo
    Left = 268
    Top = 247
    Width = 413
    Height = 23
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 10
  end
  object DateEditNewNumAlg: TcxDateEdit
    Left = 22
    Top = 272
    Width = 178
    Height = 21
    Enabled = False
    Style.Color = clMoneyGreen
    TabOrder = 11
  end
  object MemoDatNewNumAlg: TcxMemo
    Left = 268
    Top = 272
    Width = 413
    Height = 23
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 12
  end
  object ButtonEditFioCheck: TcxButtonEdit
    Left = 22
    Top = 297
    Width = 221
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonEditFioCheckPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 13
  end
  object MemoFioCheck: TcxMemo
    Left = 268
    Top = 297
    Width = 415
    Height = 23
    Lines.Strings = (
      '')
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 14
  end
  object ButtonEditGlBuhg: TcxButtonEdit
    Left = 22
    Top = 322
    Width = 221
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonEditGlBuhgPropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 15
  end
  object MemoGlBuh: TcxMemo
    Left = 268
    Top = 322
    Width = 414
    Height = 23
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 16
  end
  object CheckBoxMoPrintDocOst: TcxCheckBox
    Left = 117
    Top = 345
    Width = 22
    Height = 21
    Properties.Alignment = taRightJustify
    Properties.DisplayUnchecked = 'False'
    Properties.MultiLine = True
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = '1'
    Properties.ValueGrayed = 'null'
    Properties.ValueUnchecked = '0'
    Properties.OnChange = CheckBoxNewNumAlgPropertiesChange
    Properties.Caption = ''
    TabOrder = 17
  end
  object MemoMOPrintDocOst: TcxMemo
    Left = 268
    Top = 348
    Width = 413
    Height = 33
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Shadow = False
    TabOrder = 18
  end
  object pFIBDatabase1: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 416
    Top = 16
  end
  object pFIBTransactionBase: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 448
    Top = 16
  end
  object pFIBTransactionRead: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 418
    Top = 58
  end
  object pFIBTransactionWrite: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 450
    Top = 58
  end
  object pFIBQueryInsert: TpFIBQuery
    Left = 453
    Top = 130
  end
  object pFIBDataSet: TpFIBDataSet
    Left = 418
    Top = 130
    poSQLINT64ToBCD = True
  end
  object pFIBDataSetForProcs: TpFIBDataSet
    Left = 498
    Top = 130
    poSQLINT64ToBCD = True
  end
end
