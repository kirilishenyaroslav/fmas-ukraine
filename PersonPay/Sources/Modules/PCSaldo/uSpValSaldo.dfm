object SpValSaldoForm: TSpValSaldoForm
  Left = 481
  Top = 281
  Width = 337
  Height = 290
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1074#1072#1083#1102#1090#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 329
    Height = 258
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      DataController.DataSource = ds1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.Background = AddDocForm.cxStyle13
      Styles.Content = AddDocForm.cxStyle13
      Styles.Header = AddDocForm.cxStyle2
      object cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 217
        DataBinding.FieldName = 'VALUTE_TITLE'
      end
      object cxgrdbclmnGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1050#1086#1076
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 51
        DataBinding.FieldName = 'CODE_VALUTE'
      end
      object cxgrdbclmnGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Caption = #1057#1080#1084#1074#1086#1083
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 57
        DataBinding.FieldName = 'SPECIAL_SIGN'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object ds1: TDataSource
    DataSet = AddDocForm.ds_val
    Left = 169
    Top = 160
  end
end
