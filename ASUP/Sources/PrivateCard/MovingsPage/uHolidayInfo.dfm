object HolidayForm: THolidayForm
  Left = 292
  Top = 195
  Width = 696
  Height = 480
  Caption = #1044#1086#1087#1083#1072#1090#1080'/'#1053#1072#1076#1073#1072#1074#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 386
    Width = 688
    Height = 60
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 42
      Height = 13
      Caption = #1053#1072#1082#1072#1079':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 32
      Width = 35
      Height = 13
      Caption = #1044#1072#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxDBLabel1: TcxDBLabel
      Left = 72
      Top = 6
      Width = 66
      Height = 17
      DataBinding.DataField = 'NUM_ORDER'
      DataBinding.DataSource = DataSource1
      TabOrder = 0
    end
    object cxDBLabel2: TcxDBLabel
      Left = 72
      Top = 30
      Width = 66
      Height = 17
      DataBinding.DataField = 'DATE_ORDER'
      DataBinding.DataSource = DataSource1
      TabOrder = 1
    end
  end
  object cxDBTL_Bonus: TcxDBTreeList
    Left = 0
    Top = 0
    Width = 688
    Height = 386
    Styles.StyleSheet = cxTreeListStyleSheet1
    Align = alClient
    Bands = <
      item
        Caption.Text = 'Band1'
        Width = 400
      end>
    BufferedPaint = False
    DataController.DataSource = DataSource1
    DataController.ParentField = 'ID_PARENT'
    DataController.KeyField = 'ID'
    OptionsSelection.CellSelect = False
    OptionsView.CellAutoHeight = True
    OptionsView.ColumnAutoWidth = True
    RootValue = -1
    TabOrder = 1
    OnCustomDrawCell = cxDBTL_BonusCustomDrawCell
    OnKeyDown = cxGrid1DBTableView1KeyDown
    object cxDBTLC_Name: TcxDBTreeListColumn
      Caption.Text = #1053#1072#1079#1074#1072
      DataBinding.FieldName = 'ALL_NAME'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
      Width = 287
    end
    object cxDBTLC_Beg: TcxDBTreeListColumn
      Caption.Text = #1047
      DataBinding.FieldName = 'DATE_BEG'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 119
    end
    object cxDBTLC_End: TcxDBTreeListColumn
      Caption.Text = #1055#1086
      DataBinding.FieldName = 'DATE_END'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 118
    end
    object cxDBTLC_Bonus: TcxDBTreeListColumn
      Caption.Text = #1056#1086#1079#1084#1110#1088
      DataBinding.FieldName = 'THE_BONUS'
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 75
    end
    object cxDBTLC_Summ: TcxDBTreeListColumn
      Caption.Text = #1057#1091#1084#1084#1072
      DataBinding.FieldName = 'SUMMA'
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 87
    end
  end
  object DataSource1: TDataSource
    DataSet = dmMovings.BonusSelect
    Left = 456
    Top = 104
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 512
    Top = 176
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 14745599
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxTreeListStyleSheet1: TcxTreeListStyleSheet
      Caption = 'qizzStyle'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.Inactive = cxStyle6
      Styles.Selection = cxStyle10
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Footer = cxStyle5
      Styles.IncSearch = cxStyle7
      Styles.Indicator = cxStyle8
      Styles.Preview = cxStyle9
      BuiltIn = True
    end
  end
  object ActionList1: TActionList
    Left = 256
    Top = 402
    object Edit_Action: TAction
      Caption = 'Edit_Action'
      ShortCut = 32
      OnExecute = Edit_ActionExecute
    end
    object CloseAct: TAction
      Caption = 'CloseAct'
      ShortCut = 27
      OnExecute = CloseActExecute
    end
  end
end
