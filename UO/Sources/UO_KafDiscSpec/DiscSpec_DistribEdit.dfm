object fDistribEdit: TfDistribEdit
  Left = 213
  Top = 103
  Width = 393
  Height = 410
  BorderIcons = [biSystemMenu]
  Caption = 'fDistribEdit'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 385
    Height = 345
    Align = alTop
    TabOrder = 0
    object PanelDistrib: TPanel
      Left = 1
      Top = 112
      Width = 383
      Height = 232
      Align = alClient
      TabOrder = 0
      object GridDistrib: TcxGrid
        Left = 16
        Top = 16
        Width = 177
        Height = 200
        TabOrder = 0
        object GridDistribDBTableView1: TcxGridDBTableView
          DataController.DataSource = DSourceMain
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsBehavior.CellHints = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cmnID_SP_TYPE_KAF_DISTRIB: TcxGridDBColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            DataBinding.FieldName = 'ID_SP_TYPE_KAF_DISTRIB'
          end
          object cmnDESCRIPTION: TcxGridDBColumn
            Caption = #1042#1083#1072#1089#1090#1080#1074#1110#1089#1090#1100
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            DataBinding.FieldName = 'DESCRIPTION'
          end
        end
        object GridDistribLevel1: TcxGridLevel
          GridView = GridDistribDBTableView1
        end
      end
      object GridVal: TcxGrid
        Left = 208
        Top = 16
        Width = 161
        Height = 200
        TabOrder = 1
        object GridValDBTableView1: TcxGridDBTableView
          DataController.DataSource = DSourceValues
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsBehavior.CellHints = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cmnID: TcxGridDBColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderGlyphAlignmentHorz = taCenter
            DataBinding.FieldName = 'ID'
          end
          object cmnVAL: TcxGridDBColumn
            Caption = #1047#1085#1072#1095#1077#1085#1085#1103
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderGlyphAlignmentHorz = taCenter
            DataBinding.FieldName = 'VAL'
          end
        end
        object GridValLevel1: TcxGridLevel
          GridView = GridValDBTableView1
        end
      end
    end
    object PanelKaf: TPanel
      Left = 1
      Top = 43
      Width = 383
      Height = 69
      Align = alTop
      TabOrder = 1
      object mePercent: TcxMaskEdit
        Left = 151
        Top = 36
        Width = 93
        Height = 24
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '(100)|(\d?\d ([,]\d\d?)?)'
        Properties.MaxLength = 0
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -13
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
        Text = '100'
      end
      object lPercent: TcxLabel
        Left = 57
        Top = 38
        Width = 91
        Height = 20
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 2
        Caption = #1055#1088#1086#1094#1077#1085#1090' '#1095#1072#1089#1091
      end
      object cxLabel1: TcxLabel
        Left = 56
        Top = 11
        Width = 91
        Height = 20
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 3
        Caption = #1050#1072#1092#1077#1076#1088#1072
      end
      object BEKaf: TcxButtonEdit
        Left = 152
        Top = 12
        Width = 185
        Height = 21
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = BEKafPropertiesButtonClick
        TabOrder = 0
      end
    end
    object RGSelect: TcxRadioGroup
      Left = 1
      Top = 1
      Width = 383
      Height = 42
      Align = alTop
      Properties.Columns = 2
      Properties.DefaultValue = False
      Properties.Items = <
        item
          Caption = #1082#1072#1092#1077#1076#1088#1091
          Value = True
        end
        item
          Caption = #1074#1083#1072#1089#1090#1080#1074#1110#1089#1090#1100
          Value = False
        end>
      Properties.OnChange = RGSelectPropertiesChange
      TabOrder = 2
      Caption = #1044#1086#1076#1072#1090#1080
    end
  end
  object CancelButton: TcxButton
    Left = 272
    Top = 352
    Width = 97
    Height = 25
    Action = CancelAction
    TabOrder = 1
  end
  object OkButton: TcxButton
    Left = 160
    Top = 352
    Width = 97
    Height = 25
    Action = OkAction
    TabOrder = 2
  end
  object DSetMain: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID_SP_TYPE_KAF_DISTRIB,'
      '    DESCRIPTION,'
      '    TABLE_NAME,'
      '    KEY_FIELD_NAME,'
      '    FIELD_NAME'
      'FROM'
      '    UO_SP_TYPE_KAF_DISTRIB_SEL ')
    Left = 104
    Top = 112
    poSQLINT64ToBCD = True
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 104
    Top = 80
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 80
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 168
    Top = 80
  end
  object DB: TpFIBDatabase
    DBName = 'D:\Yatsishin\FILES\DB\UO_FULL_DB_POLTAVA.FDB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 104
    Top = 48
  end
  object ActionList1: TActionList
    Left = 40
    Top = 128
    object OkAction: TAction
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      ShortCut = 121
      OnExecute = OkActionExecute
    end
    object CancelAction: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
  end
  object DSetValues: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID,'
      '    VAL'
      'FROM'
      '    UO_SP_TYPE_KAF_DISTRIB_SEL_VAL'
      '    ('
      '    ?TABLE_NAME,'
      '    ?KEY_FIELD_NAME,'
      '    ?FIELD_NAME'
      '    ) ')
    DataSource = DSourceMain
    Left = 104
    Top = 144
    poSQLINT64ToBCD = True
  end
  object DSourceMain: TDataSource
    DataSet = DSetMain
    Left = 136
    Top = 112
  end
  object DSourceValues: TDataSource
    DataSet = DSetValues
    Left = 136
    Top = 144
  end
end
