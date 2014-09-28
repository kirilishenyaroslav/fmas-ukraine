object HistKursForm: THistKursForm
  Left = 340
  Top = 280
  Width = 317
  Height = 348
  Caption = #1030#1089#1090#1086#1088#1110#1103' '#1082#1091#1088#1089#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 309
    Height = 41
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 19
      Top = 13
      Width = 21
      Height = 13
      Caption = 'lbl1'
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 41
    Width = 309
    Height = 275
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = ds1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.Background = ValyutaForm.cxStyle13
      Styles.Content = ValyutaForm.cxStyle13
      Styles.Header = ValyutaForm.cxStyle2
      object cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1050#1091#1088#1089
        Options.Editing = False
        Options.Filtering = False
        DataBinding.FieldName = 'KURS'
      end
      object cxgrdbclmnGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1074#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1103' '#1082#1091#1088#1089#1091
        Options.Editing = False
        Options.Filtering = False
        Width = 200
        DataBinding.FieldName = 'DATE_KURS'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object ds1: TDataSource
    DataSet = ValyutaForm.ds_hist_kurs
    Left = 19
    Top = 74
  end
end
