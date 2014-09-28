object frmHistAcc: TfrmHistAcc
  Left = 259
  Top = 130
  BorderStyle = bsDialog
  Caption = #1030#1089#1090#1086#1088#1110#1103' '#1079#1084#1110#1085#1080' '#1088#1072#1093#1091#1085#1082#1072
  ClientHeight = 353
  ClientWidth = 528
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
  object cxGrid2: TcxGrid
    Left = 0
    Top = 0
    Width = 528
    Height = 232
    Align = alClient
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
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 92
        DataBinding.FieldName = 'DATE_HIS'
      end
      object cxGrid2DBTableView1MFO: TcxGridDBColumn
        Caption = #1052#1060#1054
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 70
        DataBinding.FieldName = 'MFO'
      end
      object cxGrid2DBTableView1RATE_ACCOUNT: TcxGridDBColumn
        Caption = #1056#1072#1093#1091#1085#1086#1082
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 139
        DataBinding.FieldName = 'RATE_ACCOUNT'
      end
      object cxGrid2DBTableView1DATE_BEG: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 113
        DataBinding.FieldName = 'DATE_BEG'
      end
      object cxGrid2DBTableView1DATE_END: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 112
        DataBinding.FieldName = 'DATE_END'
      end
      object cxGrid2DBTableView1NAME_MFO: TcxGridDBColumn
        Caption = #1041#1072#1085#1082
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 151
        DataBinding.FieldName = 'NAME_MFO'
      end
      object cxGrid2DBTableView1NAME_TYPE_ACCOUNT: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1088#1072#1093#1091#1085#1082#1091
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 57
        DataBinding.FieldName = 'NAME_TYPE_ACCOUNT'
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 232
    Width = 528
    Height = 121
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel1: TBevel
      Left = 0
      Top = 80
      Width = 529
      Height = 9
      Shape = bsBottomLine
    end
    object cxButton1: TcxButton
      Left = 416
      Top = 93
      Width = 107
      Height = 25
      Cancel = True
      Caption = #1047#1072#1082#1088#1080#1090#1080
      Default = True
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 0
      Top = 16
      Width = 385
      Height = 21
      DataBinding.DataField = 'NAME_MFO'
      DataBinding.DataSource = HistoryDataSource
      Style.Color = clMoneyGreen
      TabOrder = 1
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 392
      Top = 16
      Width = 129
      Height = 21
      DataBinding.DataField = 'NAME_TYPE_ACCOUNT'
      DataBinding.DataSource = HistoryDataSource
      Style.Color = clMoneyGreen
      TabOrder = 2
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = -1
      Top = 56
      Width = 122
      Height = 21
      DataBinding.DataField = 'FULL_NAME'
      DataBinding.DataSource = HistoryDataSource
      Style.Color = clMoneyGreen
      TabOrder = 3
    end
    object cxLabel1: TcxLabel
      Left = 0
      Top = 0
      Width = 33
      Height = 17
      TabOrder = 4
      Caption = #1041#1072#1085#1082
    end
    object cxLabel2: TcxLabel
      Left = 392
      Top = 0
      Width = 70
      Height = 17
      TabOrder = 5
      Caption = #1058#1080#1087' '#1088#1072#1093#1091#1085#1082#1072
    end
    object cxLabel3: TcxLabel
      Left = 0
      Top = 40
      Width = 66
      Height = 17
      TabOrder = 6
      Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
    end
    object cxLabel4: TcxLabel
      Left = 128
      Top = 40
      Width = 66
      Height = 17
      TabOrder = 7
      Caption = #1050#1086#1084#1087#39#1102#1090#1077#1088
    end
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 127
      Top = 56
      Width = 122
      Height = 21
      DataBinding.DataField = 'NAME_COMP'
      DataBinding.DataSource = HistoryDataSource
      Style.Color = clMoneyGreen
      TabOrder = 8
    end
    object cxLabel5: TcxLabel
      Left = 256
      Top = 40
      Width = 62
      Height = 17
      TabOrder = 9
      Caption = 'IP'
    end
    object cxDBTextEdit5: TcxDBTextEdit
      Left = 255
      Top = 56
      Width = 122
      Height = 21
      DataBinding.DataField = 'COMP_IP'
      DataBinding.DataSource = HistoryDataSource
      Style.Color = clMoneyGreen
      TabOrder = 10
    end
  end
  object HistoryDataSet: TpFIBDataSet
    Database = Fsp_customer.WorkDatabase
    Transaction = Fsp_customer.ReadTransaction
    SelectSQL.Strings = (
      
        'select a.date_his, a.rate_account, a.date_beg, a.date_end, b.mfo' +
        ', b.name_mfo, t.name_type_account, u.Full_name, a.name_comp, a.c' +
        'omp_ip'
      
        'from pub_sp_cust_rate_acc_his a left join users u on a.id_user =' +
        ' u.id_user'
      '     left join pub_sp_bank b on a.id_bank = b.id_bank'
      
        '     left join pub_ini_type_account t on a.id_type_account = t.i' +
        'd_type_account'
      'where id_rate_account = :id_rate_account'
      'order by date_his')
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
