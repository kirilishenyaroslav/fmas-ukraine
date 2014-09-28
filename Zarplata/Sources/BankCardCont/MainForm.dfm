object BankCardsForm: TBankCardsForm
  Left = 479
  Top = 370
  BorderStyle = bsDialog
  Caption = #1050#1072#1088#1090#1082#1080
  ClientHeight = 529
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object LabelFile: TcxLabel
    Left = 16
    Top = 8
    Width = 465
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.LabelEffect = cxleCool
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Caption = #1060#1072#1081#1083':'
  end
  object Grid: TcxGrid
    Left = 0
    Top = 97
    Width = 785
    Height = 432
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = cxcbsNone
    TabOrder = 1
    object GridDBTableView1: TcxGridDBTableView
      DataController.DataSource = DSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'ACCT_CARD'
          Column = GridClAcctCard
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.CellHints = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      object GridClAcctCard: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 80
        DataBinding.FieldName = 'ACCT_CARD'
      end
      object GridClFamiliya: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 88
        DataBinding.FieldName = 'FAMILIYA'
      end
      object GridClImya: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 86
        DataBinding.FieldName = 'IMYA'
      end
      object gridClIsWork: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 87
        DataBinding.FieldName = 'IS_WORK'
      end
      object GridClWorkEnd: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 88
        DataBinding.FieldName = 'DE_WORK'
      end
      object GridClIsStud: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 87
        DataBinding.FieldName = 'IS_STUD'
      end
      object GridClStudEnd: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 87
        DataBinding.FieldName = 'DE_STUD'
      end
      object GridClIsGrant: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 87
        DataBinding.FieldName = 'IS_GRANT'
      end
      object GridClGrantEnd: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 87
        DataBinding.FieldName = 'DE_GRANT'
      end
      object GridClPrim: TcxGridDBColumn
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        DataBinding.FieldName = 'PRIM'
      end
    end
    object GridLevel1: TcxGridLevel
      GridView = GridDBTableView1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    OnResize = Panel2Resize
    object FileNameEdit: TcxButtonEdit
      Left = 16
      Top = 4
      Width = 753
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = FileNameEditPropertiesButtonClick
      TabOrder = 0
    end
    object DoBtn: TcxButton
      Left = 16
      Top = 36
      Width = 75
      Height = 25
      Caption = #1054#1073#1088#1086#1073#1080#1090#1080
      TabOrder = 1
      OnClick = DoBtnClick
      LookAndFeel.Kind = lfFlat
    end
    object ProgressBar: TcxProgressBar
      Left = 16
      Top = 71
      Width = 753
      Height = 21
      TabOrder = 2
    end
    object SaveBtn: TcxButton
      Left = 94
      Top = 36
      Width = 83
      Height = 25
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      TabOrder = 3
      OnClick = SaveBtnClick
      LookAndFeel.Kind = lfFlat
    end
    object ExitBtn: TcxButton
      Left = 181
      Top = 36
      Width = 83
      Height = 25
      Caption = #1042#1080#1081#1090#1080
      TabOrder = 4
      OnClick = ExitBtnClick
      LookAndFeel.Kind = lfFlat
    end
    object CheckBoxUkrExim: TcxCheckBox
      Left = 270
      Top = 37
      Width = 499
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1057#1090#1072#1085#1076#1072#1088#1090' '#1091#1082#1088#1077#1082#1089#1110#1084
      State = cbsChecked
      TabOrder = 5
    end
  end
  object DbfExport: THalcyonDataSet
    AutoFlush = False
    DatabaseName = 'C:\Development\Bank'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'z1290809.dbf'
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 40
    Top = 112
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'dbf'
    Left = 40
    Top = 64
  end
  object CreateDBUniver: TCreateHalcyonDataSet
    AutoOverwrite = True
    CreateFields.Strings = (
      'ACCT_CARD;C;16;0'
      'FAMILIYA;C;30;0'
      'IMYA;C;30;0'
      'DE_GRANT;D;8;0'
      'DE_WORK;D;8;0'
      'DE_STUD;D;8;0'
      'PRIM;C;100;0'
      'IS_STUD;C;1;0'
      'IS_WORK;C;1;0'
      'IS_GRANT;C;1;0')
    DBFTable = DbfExport
    DBFType = DBaseIV
    Left = 8
    Top = 112
  end
  object OpenDialog: TOpenDialog
    Filter = 'DBF (*.dbf)|*.dbf|All files (*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 40
    Top = 32
  end
  object DBFData: THalcyonDataSet
    AutoFlush = False
    DatabaseName = 'C:\Development\Bank'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'z1290809.dbf'
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 8
    Top = 32
  end
  object DSource: TDataSource
    DataSet = DbfExport
    Left = 72
    Top = 112
  end
  object DBFFilter: THalcyonDataSet
    AutoFlush = False
    DatabaseName = 'C:\Development\Bank'
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'z1290809.dbf'
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 40
    Top = 144
  end
end
