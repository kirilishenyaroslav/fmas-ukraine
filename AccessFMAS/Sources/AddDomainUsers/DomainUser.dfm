object frmDomainUsers: TfrmDomainUsers
  Left = 249
  Top = 158
  Width = 624
  Height = 480
  Caption = #1059#1095#1077#1090#1085#1099#1077' '#1079#1072#1087#1080#1089#1080' '#1076#1086#1084#1077#1085#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 616
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 400
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 0
      OnClick = cxGrid1DBTableView1DblClick
    end
    object Button2: TButton
      Left = 488
      Top = 8
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 616
    Height = 412
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      DataController.DataSource = UserDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle1
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        DataBinding.FieldName = 'login'
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1055#1086#1083#1085#1086#1077' '#1080#1084#1103
        DataBinding.FieldName = 'full_name'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object DomainUsersMemoryData: TRxMemoryData
    FieldDefs = <>
    Left = 568
    Top = 40
    object DomainUsersMemoryDataid_user: TIntegerField
      FieldName = 'id_user'
    end
    object DomainUsersMemoryDatalogin: TStringField
      FieldName = 'login'
      Size = 200
    end
    object DomainUsersMemoryDatafull_name: TStringField
      FieldName = 'full_name'
      Size = 200
    end
  end
  object UserDataSource: TDataSource
    DataSet = DomainUsersMemoryData
    Left = 536
    Top = 40
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 504
    Top = 112
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
  end
end
