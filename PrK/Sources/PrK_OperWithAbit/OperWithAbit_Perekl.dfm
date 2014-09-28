object FPrKPereklad: TFPrKPereklad
  Left = 201
  Top = -23
  BorderStyle = bsDialog
  Caption = 'FPrKPereklad'
  ClientHeight = 624
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OldGB: TGroupBox
    Left = 8
    Top = 32
    Width = 561
    Height = 258
    Caption = 'OldGB'
    Enabled = False
    TabOrder = 0
    object GroupBoxVstup: TcxGroupBox
      Left = 7
      Top = 12
      Width = 273
      Height = 238
      Alignment = alTopLeft
      Color = clBtnFace
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 0
      TabStop = False
      Ctl3D = True
    end
    object LabelFacul: TcxLabel
      Left = 14
      Top = 102
      Width = 250
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object LabelFormStudy: TcxLabel
      Left = 15
      Top = 189
      Width = 249
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object LabelKatStud: TcxLabel
      Left = 15
      Top = 60
      Width = 249
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object LabelSpec: TcxLabel
      Left = 15
      Top = 145
      Width = 249
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object LabelTypeDepart: TcxLabel
      Left = 15
      Top = 19
      Width = 249
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
    object LabelDergZakaz: TcxLabel
      Left = 303
      Top = 22
      Width = 249
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
    end
    object LabelKurs: TcxLabel
      Left = 303
      Top = 63
      Width = 249
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
    end
    object LabelNomerDela: TcxLabel
      Left = 303
      Top = 142
      Width = 119
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 8
    end
    object LabelNomerDela_Pristavka: TcxLabel
      Left = 310
      Top = 159
      Width = 72
      Height = 24
      AutoSize = False
      ParentColor = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      TabOrder = 9
    end
    object LabelPotok: TcxLabel
      Left = 303
      Top = 102
      Width = 193
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 10
    end
    object TextEditNomerDela: TcxTextEdit
      Left = 380
      Top = 161
      Width = 86
      Height = 21
      ParentFont = False
      Properties.MaxLength = 7
      Style.Color = 16776176
      Style.StyleController = cxEditStyleControllerAbit
      TabOrder = 11
      Text = 'TextEditNomerDela'
    end
    object TypeDepartTE: TcxTextEdit
      Left = 23
      Top = 41
      Width = 241
      Height = 21
      ParentFont = False
      Style.StyleController = cxEditStyleControllerAbit
      TabOrder = 12
      Text = 'TypeDepartTE'
    end
    object SpecTE: TcxTextEdit
      Left = 22
      Top = 167
      Width = 241
      Height = 21
      ParentFont = False
      Style.StyleController = cxEditStyleControllerAbit
      TabOrder = 13
      Text = 'SpecTE'
    end
    object KatStud: TcxTextEdit
      Left = 22
      Top = 82
      Width = 241
      Height = 21
      ParentFont = False
      Style.StyleController = cxEditStyleControllerAbit
      TabOrder = 14
      Text = 'KatStud'
    end
    object FaculTE: TcxTextEdit
      Left = 21
      Top = 125
      Width = 241
      Height = 21
      ParentFont = False
      Style.StyleController = cxEditStyleControllerAbit
      TabOrder = 15
      Text = 'FaculTE'
    end
    object DergZakazTE: TcxTextEdit
      Left = 312
      Top = 42
      Width = 241
      Height = 21
      ParentFont = False
      Style.StyleController = cxEditStyleControllerAbit
      TabOrder = 16
      Text = 'DergZakazTE'
    end
    object FormStudyTE: TcxTextEdit
      Left = 22
      Top = 211
      Width = 241
      Height = 21
      ParentFont = False
      Style.StyleController = cxEditStyleControllerAbit
      TabOrder = 17
      Text = 'FormStudyTE'
    end
    object KursTE: TcxTextEdit
      Left = 312
      Top = 81
      Width = 241
      Height = 21
      ParentFont = False
      Style.StyleController = cxEditStyleControllerAbit
      TabOrder = 18
      Text = 'KursTE'
    end
    object PotokTE: TcxTextEdit
      Left = 314
      Top = 120
      Width = 241
      Height = 21
      ParentFont = False
      Style.StyleController = cxEditStyleControllerAbit
      TabOrder = 19
      Text = 'PotokTE'
    end
  end
  object PereklBtn: TcxButton
    Left = 312
    Top = 596
    Width = 81
    Height = 25
    Action = PereklAction
    TabOrder = 1
  end
  object DelBtn: TcxButton
    Left = 400
    Top = 596
    Width = 81
    Height = 25
    Action = DelAction
    TabOrder = 2
  end
  object CancelBtn: TcxButton
    Left = 488
    Top = 596
    Width = 81
    Height = 25
    Action = CancelAction
    TabOrder = 3
  end
  object FIOLabel: TcxLabel
    Left = 8
    Top = 0
    Width = 561
    Height = 33
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -24
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 4
  end
  object NewGB: TGroupBox
    Left = 8
    Top = 296
    Width = 561
    Height = 297
    Caption = 'NewGB'
    TabOrder = 5
    inline FrameVstup2: TFrameVstup
      Left = 8
      Top = 16
      Width = 546
      Height = 278
      TabOrder = 0
      inherited cxLookupComboBoxDergZakaz: TcxLookupComboBox
        ParentFont = False
        Style.StyleController = cxEditStyleControllerAbit
      end
      inherited cxLookupComboBoxKurs: TcxLookupComboBox
        ParentFont = False
        Style.StyleController = cxEditStyleControllerAbit
      end
      inherited cxLookupComboBoxSrokOb: TcxLookupComboBox
        ParentFont = False
        Style.StyleController = cxEditStyleControllerAbit
      end
      inherited cxLookupComboBoxTypeDepart: TcxLookupComboBox
        ParentFont = False
        Style.StyleController = cxEditStyleControllerAbit
      end
      inherited cxLookupComboBoxKatStud: TcxLookupComboBox
        ParentFont = False
        Style.StyleController = cxEditStyleControllerAbit
      end
      inherited cxLookupComboBoxFacul: TcxLookupComboBox
        ParentFont = False
        Style.StyleController = cxEditStyleControllerAbit
      end
      inherited cxLookupComboBoxSpec: TcxLookupComboBox
        ParentFont = False
        Style.StyleController = cxEditStyleControllerAbit
      end
      inherited cxLookupComboBoxFormStudy: TcxLookupComboBox
        ParentFont = False
        Style.StyleController = cxEditStyleControllerAbit
      end
      inherited cxLookupComboBoxVid_Dii: TcxLookupComboBox
        ParentFont = False
        Style.StyleController = cxEditStyleControllerAbit
      end
      inherited cxLookupComboBoxNpk: TcxLookupComboBox
        ParentFont = False
        Style.StyleController = cxEditStyleControllerAbit
      end
      inherited cxButtonEditPotok: TcxButtonEdit
        Style.StyleController = cxEditStyleControllerAbit
      end
      inherited cxTextEditNomerDela: TcxTextEdit
        Style.StyleController = cxEditStyleControllerAbit
      end
      inherited cxButtonEditTypePerekl: TcxButtonEdit
        Style.StyleController = cxEditStyleControllerAbit
      end
      inherited cxLabeTypePerekl: TcxLabel
        Caption = 'cxLabeTypePerekl'
      end
    end
  end
  object DataBasePrK_Abit: TpFIBDatabase
    DBName = 'D:\Yatsishin\FILES\DB\FULL_DB_POLTAVA.IB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=win1251')
    DefaultTransaction = TransactionReadPrK_ABIT
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 576
  end
  object TransactionReadPrK_ABIT: TpFIBTransaction
    DefaultDatabase = DataBasePrK_Abit
    TimeoutAction = TARollback
    Left = 48
    Top = 576
  end
  object TransactionWritePrK_ABIT: TpFIBTransaction
    DefaultDatabase = DataBasePrK_Abit
    TimeoutAction = TARollback
    Left = 80
    Top = 576
  end
  object StoredProcPrK_ABIT: TpFIBStoredProc
    Database = DataBasePrK_Abit
    Transaction = TransactionWritePrK_ABIT
    Left = 174
    Top = 579
  end
  object cxEditStyleControllerAbit: TcxEditStyleController
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Left = 210
    Top = 577
  end
  object StyleRepositoryAbit: TcxStyleRepository
    Left = 239
    Top = 577
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyleHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyleInactive: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyleBackGround_Content: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyleSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyleSkyBlue: TcxStyle
      AssignedValues = [svColor]
      Color = 16776176
    end
  end
  object DSetPerekl: TpFIBDataSet
    Database = DataBasePrK_Abit
    Transaction = TransactionReadPrK_ABIT
    SelectSQL.Strings = (
      'SELECT'
      '    ID_MAN,'
      '    FIO,'
      '    ID_FAK_CENTER,'
      '    ID_SP_DEPARTMENT_FAK,'
      '    NAME_FAK_CENTER,'
      '    KOD_FAK,'
      '    NAME_FAK,'
      '    SHORT_NAME_FAK,'
      '    NPP_FAK,'
      '    ID_CN_JN_FACUL_SPEC,'
      '    ID_SP_SPEC,'
      '    CODE_SPEC,'
      '    NAME_SPEC,'
      '    SHORT_NAME_SPEC,'
      '    SMALL_NAME_SPEC,'
      '    ID_CN_SP_FORM_STUD,'
      '    NAME_FORM_STUD,'
      '    SHORT_NAME_FORM_STUD,'
      '    NPP_FORM_STUD,'
      '    ID_SP_DERG_ZAKAZ,'
      '    KOD_DERG_ZAKAZ,'
      '    NAME_DERG_ZAKAZ,'
      '    SHORT_NAME_DERG_ZAKAZ,'
      '    NPP_DERG_ZAKAZ,'
      '    ID_SP_KURS,'
      '    KOD_KURS,'
      '    NAME_KURS,'
      '    SHORT_NAME_KURS,'
      '    NPP_KURS,'
      '    ID_CN_SP_KAT_STUD,'
      '    NAME_KAT_STUD,'
      '    SHORT_NAME_KAT_STUD,'
      '    NPP_KAT_STUD,'
      '    NOMER_DELA,'
      '    DATE_APPEND_REC,'
      '    ID_SP_POTOK,'
      '    KOD_POTOK,'
      '    NAME_POTOK,'
      '    SHORT_NAME_POTOK,'
      '    NPP_POTOK,'
      '    IS_INSERT,'
      '    IS_DELETE'
      'FROM'
      '    PRK_DT_ABIT_PEREKL_SELECT'
      '    ('
      '    ?ID_DT_ABIT,'
      '    ?ID_SP_GOD_NABORA'
      '    ) ')
    Left = 192
    Top = 176
    poSQLINT64ToBCD = True
  end
  object DSourcePerekl: TDataSource
    DataSet = DSetPerekl
    Left = 224
    Top = 176
  end
  object ActionList1: TActionList
    Left = 424
    Top = 256
    object PereklAction: TAction
      Caption = 'PereklAction'
      ShortCut = 121
      OnExecute = PereklActionExecute
    end
    object DelAction: TAction
      Caption = 'DelAction'
      ShortCut = 46
      OnExecute = DelActionExecute
    end
    object CancelAction: TAction
      Caption = 'CancelAction'
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
  end
end
