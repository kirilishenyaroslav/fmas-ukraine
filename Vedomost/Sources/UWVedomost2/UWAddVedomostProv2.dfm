object fmUWAddVedomostProv2: TfmUWAddVedomostProv2
  Left = 373
  Top = 238
  BorderStyle = bsDialog
  ClientHeight = 286
  ClientWidth = 696
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabelSch: TcxLabel
    Left = 8
    Top = 40
    Width = 193
    Height = 17
    TabStop = False
    AutoSize = False
    TabOrder = 10
    Caption = 'cxLabelSchKorespond'
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 74
    Width = 201
    Height = 17
    TabStop = False
    AutoSize = False
    TabOrder = 11
    Caption = 'cxLabelSmrazdSt'
  end
  object cxLabel1: TcxTextEdit
    Left = 343
    Top = 72
    Width = 339
    Height = 21
    TabStop = False
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 12
  end
  object cxLabel10: TcxLabel
    Left = 8
    Top = 102
    Width = 193
    Height = 17
    TabStop = False
    AutoSize = False
    TabOrder = 13
  end
  object Label3: TcxTextEdit
    Left = 343
    Top = 101
    Width = 339
    Height = 21
    TabStop = False
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 14
  end
  object cxLabel11: TcxLabel
    Left = 8
    Top = 133
    Width = 193
    Height = 17
    TabStop = False
    AutoSize = False
    TabOrder = 15
  end
  object Label4: TcxTextEdit
    Left = 343
    Top = 131
    Width = 339
    Height = 21
    TabStop = False
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 16
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 163
    Width = 193
    Height = 17
    TabStop = False
    AutoSize = False
    TabOrder = 17
    Caption = 'cxLabelKekv'
  end
  object cxLabel8: TcxTextEdit
    Left = 343
    Top = 161
    Width = 339
    Height = 21
    TabStop = False
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 18
  end
  object cxLabel6: TcxLabel
    Left = 8
    Top = 191
    Width = 185
    Height = 17
    TabStop = False
    AutoSize = False
    TabOrder = 19
    Caption = 'cxLabelSumma'
  end
  object cxTextEditSumma: TcxTextEdit
    Left = 208
    Top = 188
    Width = 105
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Properties.MaxLength = 19
    TabOrder = 6
    Text = '0,00'
    OnExit = cxTextEditSummaExit
    OnKeyPress = cxTextEditSummaKeyPress
  end
  object cxBEditSch: TcxButtonEdit
    Left = 208
    Top = 40
    Width = 474
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxBEditSchPropertiesButtonClick
    TabOrder = 1
  end
  object cxBEditSmeta: TcxButtonEdit
    Left = 208
    Top = 72
    Width = 121
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.MaxLength = 7
    Properties.ReadOnly = False
    Properties.OnButtonClick = cxBEditSmetaPropertiesButtonClick
    TabOrder = 2
    OnExit = cxBEditSmetaExit
    OnKeyDown = cxBEditSmetaKeyDown
    OnKeyPress = cxBEditSmetaKeyPress
  end
  object cxBEditKekv: TcxButtonEdit
    Left = 208
    Top = 161
    Width = 121
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.MaxLength = 7
    Properties.ReadOnly = False
    Properties.OnButtonClick = cxBEditKekvPropertiesButtonClick
    TabOrder = 5
    OnExit = cxBEditKekvExit
    OnKeyDown = cxBEditKekvKeyDown
    OnKeyPress = cxBEditKekvKeyPress
  end
  object cxBEditPeople: TcxButtonEdit
    Left = 208
    Top = 11
    Width = 474
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxBEditPeoplePropertiesButtonClick
    TabOrder = 0
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 12
    Width = 193
    Height = 17
    TabStop = False
    AutoSize = False
    TabOrder = 20
    Caption = #1042#1080#1073#1077#1088#1110#1090#1100' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 227
    Width = 97
    Height = 17
    TabStop = False
    AutoSize = False
    TabOrder = 21
    Visible = False
    Caption = 'cxLabelKekv'
  end
  object cxBEditDog: TcxButtonEdit
    Left = 104
    Top = 225
    Width = 578
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxBEditDogPropertiesButtonClick
    TabOrder = 9
    Visible = False
  end
  object cxButton1: TcxButton
    Left = 488
    Top = 232
    Width = 155
    Height = 25
    Cancel = True
    Caption = 'cxButton1'
    TabOrder = 8
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 328
    Top = 232
    Width = 147
    Height = 25
    Action = ATake
    TabOrder = 7
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 266
    Width = 696
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Fixed = False
      end>
    PaintStyle = stpsOffice11
    LookAndFeel.NativeStyle = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object cxBEditRazd: TcxTextEdit
    Left = 208
    Top = 101
    Width = 121
    Height = 21
    Properties.MaxLength = 7
    TabOrder = 3
    OnExit = cxBEditRazdExit
    OnKeyDown = cxBEditRazdKeyDown
    OnKeyPress = cxBEditRazdKeyPress
  end
  object cxBEditState: TcxTextEdit
    Left = 208
    Top = 131
    Width = 121
    Height = 21
    Properties.MaxLength = 7
    TabOrder = 4
    OnExit = cxBEditStateExit
    OnKeyDown = cxBEditStateKeyDown
    OnKeyPress = cxBEditStateKeyPress
  end
  object cxLabel7: TcxLabel
    Left = 344
    Top = 189
    Width = 57
    Height = 17
    TabStop = False
    AutoSize = False
    TabOrder = 23
    Caption = #1085#1072#1082#1072#1079' '#8470
  end
  object cxTextOrder: TcxTextEdit
    Left = 400
    Top = 187
    Width = 121
    Height = 21
    Properties.MaxLength = 10
    TabOrder = 24
  end
  object cxLabel9: TcxLabel
    Left = 520
    Top = 189
    Width = 25
    Height = 17
    TabStop = False
    AutoSize = False
    TabOrder = 25
    Caption = #1074#1110#1076
  end
  object cxDateOrder: TcxDateEdit
    Left = 544
    Top = 188
    Width = 121
    Height = 21
    TabOrder = 26
  end
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 264
  end
  object DataSetDef: TpFIBDataSet
    Left = 176
    Top = 256
    poSQLINT64ToBCD = True
  end
  object Tr: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 88
    Top = 264
  end
  object ActionList1: TActionList
    Left = 264
    Top = 248
    object ATake: TAction
      Caption = 'ATake'
      ShortCut = 121
      OnExecute = ATakeExecute
    end
    object SelectLang: TAction
      Caption = 'SelectLang'
      ShortCut = 24652
      OnExecute = SelectLangExecute
    end
  end
  object TrW: TpFIBTransaction
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'wait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 136
    Top = 264
  end
  object PopupMenu1: TPopupMenu
    Left = 288
    Top = 56
  end
  object St: TpFIBStoredProc
    Left = 240
    Top = 256
  end
  object DS: TpFIBDataSet
    Left = 208
    Top = 256
    poSQLINT64ToBCD = True
  end
end
