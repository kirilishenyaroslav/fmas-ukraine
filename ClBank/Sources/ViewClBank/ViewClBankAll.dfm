object frmViewClBank: TfrmViewClBank
  Left = 176
  Top = 162
  Width = 696
  Height = 480
  Caption = 'frmViewClBank'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 688
    Height = 33
    ButtonHeight = 21
    ButtonWidth = 56
    Caption = 'ToolBar1'
    Flat = True
    ShowCaptions = True
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 0
    end
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 33
    Width = 688
    Height = 401
    Align = alClient
    TabOrder = 1
    object cxGridDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      Styles.StyleSheet = GridTableViewStyleSheetDevExpress
      object NATIVE_RS: TcxGridDBColumn
        Caption = #1053#1072#1096' '#1056'\'#1057
        DataBinding.FieldName = 'NATIVE_RS'
        Visible = False
        GroupIndex = 0
      end
      object DATE_VIP: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1074#1099#1087#1080#1089#1082#1080
        DataBinding.FieldName = 'DATE_VIP'
        Width = 83
      end
      object NUM_DOC: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'NUM_DOC'
        Width = 88
      end
      object DATE_DOC: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'DATE_DOC'
        Width = 127
      end
      object CUSTOMER_NAME: TcxGridDBColumn
        Caption = #1055#1083#1090#1077#1083#1100#1097#1080#1082'\'#1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
        DataBinding.FieldName = 'CUSTOMER_NAME'
        Width = 126
      end
      object SUM_DOC_PR: TcxGridDBColumn
        Caption = #1055#1088#1080#1093#1086#1076
        DataBinding.FieldName = 'SUM_DOC'
        Width = 149
      end
      object SUM_DOC_RAS: TcxGridDBColumn
        Caption = #1056#1072#1089#1093#1086#1076
        DataBinding.FieldName = 'SUM_DOC'
        Width = 103
      end
      object TYPE_DOC: TcxGridDBColumn
        DataBinding.FieldName = 'TYPE_DOC'
        Visible = False
        Width = 80
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 434
    Width = 688
    Height = 19
    Panels = <>
  end
  object StyleRepository: TcxStyleRepository
    Left = 208
    Top = 137
    object cxStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16777088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16777088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle3
      Styles.Content = cxStyle4
      Styles.ContentEven = cxStyle5
      Styles.ContentOdd = cxStyle6
      Styles.FilterBox = cxStyle7
      Styles.Inactive = cxStyle12
      Styles.IncSearch = cxStyle13
      Styles.Selection = cxStyle16
      Styles.Footer = cxStyle8
      Styles.Group = cxStyle9
      Styles.GroupByBox = cxStyle10
      Styles.Header = cxStyle11
      Styles.Indicator = cxStyle14
      Styles.Preview = cxStyle15
      BuiltIn = True
    end
    object GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle17
      Styles.Content = cxStyle20
      Styles.ContentEven = cxStyle21
      Styles.ContentOdd = cxStyle22
      Styles.FilterBox = cxStyle23
      Styles.Inactive = cxStyle28
      Styles.IncSearch = cxStyle29
      Styles.Selection = cxStyle32
      Styles.Footer = cxStyle24
      Styles.Group = cxStyle25
      Styles.GroupByBox = cxStyle26
      Styles.Header = cxStyle27
      Styles.Indicator = cxStyle30
      Styles.Preview = cxStyle31
      Styles.BandBackground = cxStyle18
      Styles.BandHeader = cxStyle19
      BuiltIn = True
    end
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 176
    Top = 136
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 144
    Top = 136
  end
  object pFIBDataSet: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    SelectSQL.Strings = (
      'SELECT clbank_buff.*,CUSTOMER.name_customer as customer_name,'
      
        #39#1052#1060#1054' '#39'||NATIVE_BANK.name_mfo||'#39#1056'/'#1057#39'||NATIVE_ACC.rate_account||'#39' ' +
        #39'||NATIVE.name_customer as NATIVE_RS,'
      
        #39#1052#1060#1054' '#39'||CUSTOMER_BANK.name_mfo||'#39#1056'/'#1057#39'||CUSTOMER_ACC.rate_account' +
        ' as CUSTOMER_RS'
      
        'FROM clbank_buff,pub_sp_customer NATIVE,pub_sp_customer CUSTOMER' +
        ','
      
        'pub_sp_cust_rate_acc NATIVE_ACC,pub_sp_cust_rate_acc CUSTOMER_AC' +
        'C,'
      'pub_sp_bank NATIVE_BANK,pub_sp_bank CUSTOMER_BANK'
      'WHERE NATIVE.id_customer=NATIVE_ACC.id_customer'
      'and NATIVE_ACC.id_bank=NATIVE_BANK.id_bank'
      'and CUSTOMER.id_customer=CUSTOMER_ACC.id_customer'
      'and CUSTOMER_ACC.id_bank=CUSTOMER_BANK.id_bank'
      'and clbank_buff.id_account_native=NATIVE_ACC.id_rate_account'
      'and clbank_buff.id_account_customer=CUSTOMER_ACC.id_rate_account')
    Left = 144
    Top = 176
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = pFIBDataSet
    Left = 176
    Top = 176
  end
end
