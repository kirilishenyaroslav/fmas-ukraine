object frmCustHist: TfrmCustHist
  Left = 192
  Top = 103
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1030#1089#1090#1086#1088#1110#1103
  ClientHeight = 245
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid2: TcxGrid
    Left = 0
    Top = 0
    Width = 605
    Height = 209
    Align = alTop
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object cxGrid2DBTableView1: TcxGridDBTableView
      DataController.DataModeController.GridMode = True
      DataController.DataSource = HistoryDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      OptionsSelection.MultiSelect = True
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = Fsp_customer.GridTableViewStyleSheetDevExpress
      object cxGrid2DBTableView1DATE_HIS: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1079#1084#1110#1085#1080
        HeaderAlignmentHorz = taCenter
        Width = 77
        DataBinding.FieldName = 'DATE_HIS'
      end
      object cxGrid2DBTableView1FULL_NAME: TcxGridDBColumn
        Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
        HeaderAlignmentHorz = taCenter
        Width = 125
        DataBinding.FieldName = 'FULL_NAME'
      end
      object cxGrid2DBTableView1NAME_COMP: TcxGridDBColumn
        Caption = #1050#1086#1084#1087#39#1102#1090#1077#1088
        HeaderAlignmentHorz = taCenter
        Width = 81
        DataBinding.FieldName = 'NAME_COMP'
      end
      object cxGrid2DBTableView1COMP_IP: TcxGridDBColumn
        Caption = 'IP'
        HeaderAlignmentHorz = taCenter
        Width = 91
        DataBinding.FieldName = 'COMP_IP'
      end
      object cxGrid2DBTableView1NAME_CUSTOMER: TcxGridDBColumn
        Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
        HeaderAlignmentHorz = taCenter
        Width = 155
        DataBinding.FieldName = 'NAME_CUSTOMER'
      end
      object cxGrid2DBTableView1KOD_EDRPOU: TcxGridDBColumn
        Caption = #1045#1044#1056#1055#1054#1059
        HeaderAlignmentHorz = taCenter
        Width = 74
        DataBinding.FieldName = 'KOD_EDRPOU'
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object cxButton1: TcxButton
    Left = 488
    Top = 216
    Width = 115
    Height = 25
    Cancel = True
    Caption = #1047#1072#1082#1088#1080#1090#1080
    Default = True
    TabOrder = 1
    OnClick = cxButton1Click
  end
  object HistoryDataSet: TpFIBDataSet
    Database = Fsp_customer.WorkDatabase
    Transaction = Fsp_customer.ReadTransaction
    SelectSQL.Strings = (
      
        'select a.date_his, u.Full_name, a.name_comp, a.comp_ip, a.name_c' +
        'ustomer, a.kod_edrpou'
      
        'from pub_sp_customer_hist a left join users u on a.id_user = u.i' +
        'd_user'
      'where a.id_customer = :id_customer'
      'order by a.date_his')
    Left = 8
    Top = 24
    poSQLINT64ToBCD = True
  end
  object HistoryDataSource: TDataSource
    DataSet = HistoryDataSet
    Left = 40
    Top = 24
  end
end
