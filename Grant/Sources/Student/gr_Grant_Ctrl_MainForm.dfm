object FGrantCtrl: TFGrantCtrl
  Left = 655
  Top = 38
  BorderStyle = bsDialog
  Caption = 'FGrantCtrl'
  ClientHeight = 250
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object YesBtn: TcxButton
    Left = 368
    Top = 220
    Width = 81
    Height = 25
    Action = ActionYes
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 456
    Top = 220
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object BoxMan: TcxGroupBox
    Left = 0
    Top = -3
    Width = 553
    Height = 44
    Alignment = alTopLeft
    Caption = 'BoxMan'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TabStop = False
    object LabelMan: TcxLabel
      Left = 0
      Top = 15
      Width = 137
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = 'LabelMan'
    end
    object EditMan: TcxButtonEdit
      Left = 136
      Top = 13
      Width = 409
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
          Visible = False
        end>
      Properties.MaskKind = emkRegExpr
      Properties.ReadOnly = True
      Style.Color = clWindow
      TabOrder = 0
    end
  end
  object BoxDatesSum: TcxGroupBox
    Left = 0
    Top = 40
    Width = 553
    Height = 105
    Alignment = alTopLeft
    Caption = 'BoxMain'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TabStop = False
    object LabelSumma: TcxLabel
      Left = 8
      Top = 40
      Width = 81
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = 'LabelSumma'
    end
    object MaskEditSumma: TcxMaskEdit
      Left = 88
      Top = 38
      Width = 177
      Height = 24
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 2
    end
    object LabelBal: TcxLabel
      Left = 288
      Top = 40
      Width = 168
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Caption = 'LabelBal'
    end
    object MaskEditBal: TcxMaskEdit
      Left = 456
      Top = 38
      Width = 93
      Height = 24
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 4
    end
    object BoxDates: TPanel
      Left = 5
      Top = 15
      Width = 542
      Height = 22
      BevelOuter = bvNone
      TabOrder = 0
      object EditDateBeg: TcxDateEdit
        Left = 260
        Top = -1
        Width = 97
        Height = 24
        ImeMode = imHanguel
        Properties.DateButtons = [btnToday]
        Properties.InputKind = ikMask
        Properties.MaxDate = 55153.000000000000000000
        Properties.MinDate = 36526.000000000000000000
        TabOrder = 0
        EditValue = 38353d
      end
      object DateBegLabel: TcxLabel
        Left = 157
        Top = 0
        Width = 105
        Height = 20
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
      end
      object EditDateEnd: TcxDateEdit
        Left = 354
        Top = -1
        Width = 97
        Height = 24
        Properties.DateButtons = [btnToday]
        Properties.InputKind = ikMask
        Properties.MaxDate = 55153.000000000000000000
        Properties.MinDate = 36526.000000000000000000
        TabOrder = 2
        EditValue = 38353d
      end
      object DateEndLabel: TcxLabel
        Left = 453
        Top = 1
        Width = 89
        Height = 20
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 3
      end
    end
    object PrikazMaskEdit: TcxMaskEdit
      Left = 89
      Top = 72
      Width = 460
      Height = 24
      TabOrder = 5
    end
    object PrikazLabel: TcxLabel
      Left = 8
      Top = 72
      Width = 81
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
      Caption = #1053#1072#1082#1072#1079
    end
  end
  object BoxVidOpl: TcxGroupBox
    Left = -1
    Top = 146
    Width = 554
    Height = 70
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    TabStop = False
    object EditVidopl: TcxButtonEdit
      Left = 109
      Top = 10
      Width = 60
      Height = 24
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d?\d?\d?\d?\d?\d?\d?\d?'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = EditVidOplPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      OnExit = EditVidoplExit
    end
    object LabelVidoplData: TcxLabel
      Left = 168
      Top = 10
      Width = 377
      Height = 24
      AutoSize = False
      ParentColor = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Style.BorderColor = clGrayText
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 1
      Caption = ''
    end
    object LabelVidopl: TcxLabel
      Left = 6
      Top = 12
      Width = 105
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object LabelSmetadata: TcxLabel
      Left = 168
      Top = 35
      Width = 377
      Height = 24
      AutoSize = False
      ParentColor = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Style.BorderColor = clGrayText
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 3
      Caption = ''
    end
    object EditSmeta: TcxButtonEdit
      Left = 109
      Top = 35
      Width = 60
      Height = 24
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d?\d?\d?\d?\d?\d?\d?\d?'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = EditSmetaPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      OnExit = EditSmetaExit
    end
    object LabelSmeta: TcxLabel
      Left = 6
      Top = 38
      Width = 105
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
  end
  object ComboBoxCategory: TcxLookupComboBox
    Left = 109
    Top = 159
    Width = 436
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'ID_CAT_STUD'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_FULL'
      end>
    Properties.ListOptions.ShowHeader = False
    TabOrder = 5
    Visible = False
  end
  object Actions: TActionList
    Left = 40
    Top = 221
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
      OnExecute = ActionYesExecute
    end
  end
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 88
    Top = 221
  end
  object StProcTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 221
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StProcTransaction
    Left = 184
    Top = 221
  end
  object DSetCatStud: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Top = 221
    poSQLINT64ToBCD = True
  end
  object DSourceCatStud: TDataSource
    DataSet = DSetCatStud
    Left = 240
    Top = 221
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 288
    Top = 221
  end
end
