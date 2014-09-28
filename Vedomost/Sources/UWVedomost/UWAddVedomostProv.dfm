object fmUWAddVedomostProv: TfmUWAddVedomostProv
  Left = 190
  Top = 165
  Width = 667
  Height = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    659
    313)
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
  object cxLabel7: TcxTextEdit
    Left = 343
    Top = 40
    Width = 308
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 11
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 74
    Width = 201
    Height = 17
    TabStop = False
    AutoSize = False
    TabOrder = 12
    Caption = 'cxLabelSmrazdSt'
  end
  object cxLabel1: TcxTextEdit
    Left = 343
    Top = 72
    Width = 308
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 13
  end
  object cxLabel10: TcxLabel
    Left = 8
    Top = 102
    Width = 193
    Height = 17
    TabStop = False
    AutoSize = False
    TabOrder = 14
  end
  object Label3: TcxTextEdit
    Left = 343
    Top = 101
    Width = 308
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 15
  end
  object cxLabel11: TcxLabel
    Left = 8
    Top = 133
    Width = 193
    Height = 17
    TabStop = False
    AutoSize = False
    TabOrder = 16
  end
  object Label4: TcxTextEdit
    Left = 343
    Top = 131
    Width = 308
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 17
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 163
    Width = 193
    Height = 17
    TabStop = False
    AutoSize = False
    TabOrder = 18
    Caption = 'cxLabelKekv'
  end
  object cxLabel8: TcxTextEdit
    Left = 343
    Top = 161
    Width = 308
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 19
  end
  object cxLabel6: TcxLabel
    Left = 8
    Top = 191
    Width = 185
    Height = 17
    TabStop = False
    AutoSize = False
    TabOrder = 20
    Caption = 'cxLabelSumma'
  end
  object cxTextEditSumma: TcxTextEdit
    Left = 208
    Top = 188
    Width = 105
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    TabOrder = 6
    Text = '0,00'
    OnKeyPress = cxTextEditSummaKeyPress
  end
  object cxBEditSch: TcxButtonEdit
    Left = 208
    Top = 40
    Width = 121
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
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxBEditSmetaPropertiesButtonClick
    TabOrder = 2
  end
  object cxBEditRazd: TcxButtonEdit
    Left = 208
    Top = 101
    Width = 121
    Height = 21
    Enabled = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    TabOrder = 3
  end
  object cxBEditState: TcxButtonEdit
    Left = 208
    Top = 131
    Width = 121
    Height = 21
    Enabled = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    TabOrder = 4
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
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxBEditKekvPropertiesButtonClick
    TabOrder = 5
  end
  object cxBEditPeople: TcxButtonEdit
    Left = 208
    Top = 11
    Width = 443
    Height = 21
    Anchors = [akLeft, akTop, akRight]
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
    TabOrder = 21
    Caption = 'vgh'
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 227
    Width = 97
    Height = 17
    TabStop = False
    AutoSize = False
    TabOrder = 22
    Caption = 'cxLabelKekv'
  end
  object cxBEditDog: TcxButtonEdit
    Left = 104
    Top = 225
    Width = 548
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxBEditDogPropertiesButtonClick
    TabOrder = 7
  end
  object cxButton1: TcxButton
    Left = 488
    Top = 256
    Width = 155
    Height = 25
    Cancel = True
    Caption = 'cxButton1'
    TabOrder = 9
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 328
    Top = 256
    Width = 147
    Height = 25
    Action = ATake
    TabOrder = 8
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 293
    Width = 659
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
end
