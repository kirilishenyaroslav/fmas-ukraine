object frmBankHis: TfrmBankHis
  Left = 192
  Top = 103
  Width = 752
  Height = 322
  Caption = #1030#1089#1090#1086#1088#1110#1103' '#1079#1084#1110#1085#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 254
    Width = 744
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 0
      Top = 8
      Width = 97
      Height = 25
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 0
      OnClick = cxButton1Click
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 744
    Height = 254
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = Fsp_bank.GridTableViewStyleSheetDevExpress
      object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1079#1084#1110#1085#1080
        HeaderAlignmentHorz = taCenter
        Width = 80
        DataBinding.FieldName = 'DATE_CHANGE'
      end
      object cxGrid1DBTableView1ID_BANK: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        DataBinding.FieldName = 'ID_BANK'
      end
      object cxGrid1DBTableView1MFO: TcxGridDBColumn
        Caption = #1052#1060#1054
        HeaderAlignmentHorz = taCenter
        Width = 61
        DataBinding.FieldName = 'MFO'
      end
      object cxGrid1DBTableView1NAME_MFO: TcxGridDBColumn
        Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1073#1072#1085#1082#1091
        HeaderAlignmentHorz = taCenter
        Width = 161
        DataBinding.FieldName = 'NAME_MFO'
      end
      object cxGrid1DBTableView1CITY: TcxGridDBColumn
        Caption = #1052#1110#1089#1090#1086
        HeaderAlignmentHorz = taCenter
        SortOrder = soDescending
        Width = 63
        DataBinding.FieldName = 'CITY'
      end
      object cxGrid1DBTableView1USE_BEG: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        DataBinding.FieldName = 'USE_BEG'
      end
      object cxGrid1DBTableView1USE_END: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        DataBinding.FieldName = 'USE_END'
      end
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 89
        DataBinding.FieldName = 'NAME_DEPARTMENT'
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
        HeaderAlignmentHorz = taCenter
        Width = 124
        DataBinding.FieldName = 'NAME_USER'
      end
      object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
        Caption = #1050#1086#1084#1087#39#1102#1090#1077#1088
        HeaderAlignmentHorz = taCenter
        Width = 80
        DataBinding.FieldName = 'COMP_NAME'
      end
      object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
        Caption = 'IP'
        HeaderAlignmentHorz = taCenter
        Width = 84
        DataBinding.FieldName = 'COMP_IP'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object DataSet: TpFIBDataSet
    Database = Fsp_bank.WorkDatabase
    Transaction = Fsp_bank.ReadTransaction
    SelectSQL.Strings = (
      
        'select b.*, u.name as name_user from pub_sp_bank_his b, users u ' +
        'where b.id_bank = :ID_BANK and b.id_user = u.id_user')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 16
    Top = 32
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = DataSet
    Left = 48
    Top = 32
  end
end
