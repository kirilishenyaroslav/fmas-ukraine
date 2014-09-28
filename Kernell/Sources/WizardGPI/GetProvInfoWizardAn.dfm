object frmWizardAn: TfrmWizardAn
  Left = 327
  Top = 176
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1072#1085#1072#1083#1080#1090#1080#1082#1086#1081' '#1087#1086' '#1089#1095#1077#1090#1091
  ClientHeight = 375
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 334
    Width = 683
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 520
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object CancelButton: TcxButton
      Left = 600
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = CancelButtonClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 683
    Height = 334
    Align = alClient
    BorderStyle = bsSingle
    TabOrder = 1
    object HeaderPanel: TPanel
      Left = 1
      Top = 1
      Width = 677
      Height = 48
      Align = alTop
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1072#1085#1072#1083#1080#1090#1080#1082#1091' '#1087#1086' '#1089#1095#1077#1090#1091' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cxGrid2: TcxGrid
      Left = 1
      Top = 49
      Width = 677
      Height = 280
      Align = alClient
      TabOrder = 1
      object cxGrid2DBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid2DBTableView1DblClick
        DataController.DataSource = AnValuesDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsData.Editing = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.Background = cxStyle4
        Styles.Content = cxStyle4
        object cxGrid2DBTableView1DBColumn1: TcxGridDBColumn
          DataBinding.FieldName = 'ID_AN_TYPE_VALUE1_CHAR'
        end
        object cxGrid2DBTableView1DBColumn2: TcxGridDBColumn
          DataBinding.FieldName = 'ID_AN_TYPE_VALUE2_CHAR'
        end
        object cxGrid2DBTableView1DBColumn3: TcxGridDBColumn
          DataBinding.FieldName = 'ID_AN_TYPE_VALUE3_CHAR'
        end
        object cxGrid2DBTableView1DBColumn4: TcxGridDBColumn
          DataBinding.FieldName = 'ID_AN_TYPE_VALUE4_CHAR'
        end
        object cxGrid2DBTableView1DBColumn5: TcxGridDBColumn
          DataBinding.FieldName = 'ID_AN_TYPE_VALUE5_CHAR'
        end
        object cxGrid2DBTableView1DBColumn6: TcxGridDBColumn
          DataBinding.FieldName = 'ID_AN_TYPE_VALUE6_CHAR'
        end
        object cxGrid2DBTableView1DBColumn7: TcxGridDBColumn
          DataBinding.FieldName = 'ID_AN_TYPE_VALUE7_CHAR'
        end
        object cxGrid2DBTableView1DBColumn8: TcxGridDBColumn
          DataBinding.FieldName = 'ID_AN_TYPE_VALUE8_CHAR'
        end
        object cxGrid2DBTableView1DBColumn9: TcxGridDBColumn
          DataBinding.FieldName = 'ID_AN_TYPE_VALUE9_CHAR'
        end
        object cxGrid2DBTableView1DBColumn10: TcxGridDBColumn
          DataBinding.FieldName = 'ID_AN_TYPE_VALUE10_CHAR'
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = cxGrid2DBTableView1
      end
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 16
    Top = 8
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clGradientInactiveCaption
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxErrorStyle: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clRed
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
  end
  object ColAnInfoDataSet: TpFIBDataSet
    Left = 8
    Top = 128
    poSQLINT64ToBCD = True
  end
  object AnValuesDataSet: TpFIBDataSet
    Left = 40
    Top = 128
    poSQLINT64ToBCD = True
  end
  object AnValuesDataSource: TDataSource
    DataSet = AnValuesDataSet
    Left = 72
    Top = 128
  end
  object ActionList1: TActionList
    Left = 8
    Top = 160
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 27
      OnExecute = Action2Execute
    end
  end
end
