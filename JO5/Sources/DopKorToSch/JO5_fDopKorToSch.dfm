object fDopKorToSch: TfDopKorToSch
  Left = 179
  Top = 150
  Width = 790
  Height = 507
  HorzScrollBar.Visible = False
  Caption = 'fDopKorToSch'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object ActionPnl: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 44
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object ExitBtn: TcxButton
      Left = 660
      Top = 7
      Width = 115
      Height = 32
      Action = ExitAction
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Colors.Normal = 13160660
      Colors.Hot = 16247513
      Colors.Pressed = 16619863
    end
    object KorTypeRG: TRadioGroup
      Left = 0
      Top = 2
      Width = 650
      Height = 37
      Caption = ' '#1054#1073#1077#1088#1110#1090#1100' '#1090#1080#1087' '#1082#1086#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1110#1111' '
      Columns = 2
      Ctl3D = False
      ItemIndex = 1
      Items.Strings = (
        #1044#1077#1073#1077#1090#1086#1074#1072
        #1050#1088#1077#1076#1080#1090#1086#1074#1072)
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = KorTypeRGClick
    end
  end
  object DetailGrid: TcxGrid
    Left = 0
    Top = 44
    Width = 782
    Height = 436
    Align = alClient
    PopupMenu = DetailPM
    TabOrder = 1
    object DetailGridTV: TcxGridDBBandedTableView
      DataController.DataSource = DSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,##0.00'
          Kind = skSum
          Column = cmnSUMMA
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnVertSizing = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.CellEndEllipsis = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.Footer = True
      OptionsView.HeaderEndEllipsis = True
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 10
      Bands = <
        item
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1072#1085#1072#1083#1110#1079#1091' '#1082#1086#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1110#1111' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1091
          Options.HoldOwnColumnsOnly = True
          Width = 770
        end>
      object cmnGR_SMET_NUM: TcxGridDBBandedColumn
        Caption = #8470' '#1043#1088'.'#1073#1102#1076#1078#1077#1090#1110#1074
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 50
        Options.Filtering = False
        Options.VertSizing = False
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_SM_GR_KOD'
      end
      object cmnGR_SMET_NAME: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072' '#1075#1088'.'#1073#1102#1076#1078#1077#1090#1110#1074
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 130
        Options.Filtering = False
        Options.VertSizing = False
        Width = 350
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_SM_GR_TITLE'
      end
      object cmnSMET_NUM: TcxGridDBBandedColumn
        Caption = #8470' '#1041#1102#1076#1078#1077#1090#1091
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 50
        Options.Filtering = False
        Options.VertSizing = False
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_SM_KOD'
      end
      object cmnSMET_NAME: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072' '#1073#1102#1076#1078#1077#1090#1091
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Filtering = False
        Options.VertSizing = False
        Width = 120
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_SM_TITLE'
      end
      object cmnRAZD_NUM: TcxGridDBBandedColumn
        Caption = #8470' '#1056#1086#1079#1076#1110#1083#1091
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 50
        Options.Filtering = False
        Options.VertSizing = False
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_RZ_NUM'
      end
      object cmnRAZD_NAME: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072' '#1088#1086#1079#1076#1110#1083#1091
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 130
        Options.Filtering = False
        Options.VertSizing = False
        Width = 350
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_RZ_TITLE'
      end
      object cmnSTAT_NUM: TcxGridDBBandedColumn
        Caption = #8470' '#1057#1090#1072#1090#1090#1110
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 50
        Options.Filtering = False
        Options.VertSizing = False
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_ST_NUM'
      end
      object cmnSTAT_NAME: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072' '#1089#1090#1072#1090#1090#1110
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 130
        Options.Filtering = False
        Options.VertSizing = False
        Width = 200
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_ST_TITLE'
      end
      object cmnKEKV_NUM: TcxGridDBBandedColumn
        Caption = #8470' '#1050#1045#1050#1042
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 50
        Options.Filtering = False
        Options.VertSizing = False
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_KEKV_KOD'
      end
      object cmnKEKV_NAME: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072' '#1050#1045#1050#1042
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 130
        Options.Filtering = False
        Options.VertSizing = False
        Width = 350
        Position.BandIndex = 0
        Position.ColIndex = 9
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_KEKV_TITLE'
      end
      object cmnSUMMA: TcxGridDBBandedColumn
        Caption = #1057#1091#1084#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Filtering = False
        Options.VertSizing = False
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 10
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_SUMMA'
      end
    end
    object DetailGridLvl: TcxGridLevel
      GridView = DetailGridTV
    end
  end
  object DB: TpFIBDatabase
    DBName = 'E:\Alex\GOVERMENT\DB\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 296
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    SelectSQL.Strings = (
      'SELECT'
      '    OUT_SM_GR_TITLE,'
      '    OUT_SM_GR_KOD,'
      '    OUT_SM_TITLE,'
      '    OUT_SM_KOD,'
      '    OUT_RZ_TITLE,'
      '    OUT_RZ_NUM,'
      '    OUT_ST_TITLE,'
      '    OUT_ST_NUM,'
      '    OUT_KEKV_TITLE,'
      '    OUT_KEKV_KOD,'
      '    OUT_DB_SALDO_INPUT,'
      '    OUT_KR_SALDO_INPUT,'
      '    OUT_DB_OBOROT,'
      '    OUT_KR_OBOROT,'
      '    OUT_DB_SALDO_OUTPUT,'
      '    OUT_KR_SALDO_OUTPUT,'
      '    OUT_SALDO'
      'FROM'
      '    JO5_GET_OUT_SALDO_DETAIL'
      '    ('
      '    1101,'#39'01.05.2006'#39
      '    ) ')
    Left = 80
    Top = 336
    poSQLINT64ToBCD = True
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 80
    Top = 296
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 120
    Top = 336
  end
  object DetailPM: TPopupMenu
    Left = 384
    Top = 240
    object S_SM_GR_NUM: TMenuItem
      Action = A_SM_GR_NUM
      AutoCheck = True
    end
    object S_SM_GR_TITLE: TMenuItem
      Action = A_SM_GR_TITLE
      AutoCheck = True
    end
    object S_SM_NUM: TMenuItem
      Action = A_SM_NUM
      AutoCheck = True
    end
    object S_SM_TITLE: TMenuItem
      Action = A_SM_TITLE
      AutoCheck = True
    end
    object S_RZ_NUM: TMenuItem
      Action = A_RZ_NUM
      AutoCheck = True
    end
    object S_RZ_TITLE: TMenuItem
      Action = A_RZ_TITLE
      AutoCheck = True
    end
    object S_ST_NUM: TMenuItem
      Action = A_ST_NUM
      AutoCheck = True
    end
    object S_ST_TITLE: TMenuItem
      Action = A_ST_TITLE
      AutoCheck = True
    end
    object S_KEKV_NUM: TMenuItem
      Action = A_KEKV_NUM
      AutoCheck = True
    end
    object S_KEKV_TITLE: TMenuItem
      Action = A_KEKV_TITLE
      AutoCheck = True
    end
  end
  object ActionList1: TActionList
    Left = 304
    Top = 240
    object A_SM_GR_NUM: TAction
      AutoCheck = True
      Caption = 'A_SM_GR_NUM'
      Checked = True
      OnExecute = A_SM_GR_NUMExecute
    end
    object A_SM_GR_TITLE: TAction
      AutoCheck = True
      Caption = 'A_SM_GR_TITLE'
      OnExecute = A_SM_GR_TITLEExecute
    end
    object A_SM_NUM: TAction
      AutoCheck = True
      Caption = 'A_SM_NUM'
      Checked = True
      OnExecute = A_SM_NUMExecute
    end
    object A_SM_TITLE: TAction
      AutoCheck = True
      Caption = 'A_SM_TITLE'
      OnExecute = A_SM_TITLEExecute
    end
    object A_RZ_NUM: TAction
      AutoCheck = True
      Caption = 'A_RZ_NUM'
      Checked = True
      OnExecute = A_RZ_NUMExecute
    end
    object A_RZ_TITLE: TAction
      AutoCheck = True
      Caption = 'A_RZ_TITLE'
      OnExecute = A_RZ_TITLEExecute
    end
    object A_ST_NUM: TAction
      AutoCheck = True
      Caption = 'A_ST_NUM'
      Checked = True
      OnExecute = A_ST_NUMExecute
    end
    object A_ST_TITLE: TAction
      AutoCheck = True
      Caption = 'A_ST_TITLE'
      OnExecute = A_ST_TITLEExecute
    end
    object A_KEKV_NUM: TAction
      AutoCheck = True
      Caption = 'A_KEKV_NUM'
      Checked = True
      OnExecute = A_KEKV_NUMExecute
    end
    object A_KEKV_TITLE: TAction
      AutoCheck = True
      Caption = 'A_KEKV_TITLE'
      OnExecute = A_KEKV_TITLEExecute
    end
    object ExitAction: TAction
      Caption = 'ExitAction'
      ShortCut = 27
      OnExecute = ExitActionExecute
    end
  end
end
