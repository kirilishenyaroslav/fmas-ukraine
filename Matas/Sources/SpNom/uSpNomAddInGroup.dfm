object AddInGroupForm: TAddInGroupForm
  Left = 710
  Top = 327
  Width = 425
  Height = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxNomTree: TcxDBTreeList
    Left = 0
    Top = 0
    Width = 417
    Height = 221
    Styles.Background = cxStyle13
    Styles.Content = cxStyle13
    Styles.Inactive = cxStyle10
    Styles.Selection = cxStyle14
    Styles.ColumnHeader = cxStyle7
    Align = alClient
    Bands = <
      item
        Caption.Text = 'Band1'
        Width = 271
      end>
    BufferedPaint = False
    DataController.DataSource = AddInGroupDataSource
    DataController.ParentField = 'LINKTO'
    DataController.KeyField = 'ID_NOMN'
    DragMode = dmAutomatic
    OptionsBehavior.IncSearchItem = cxDBTreeList1NAME
    OptionsBehavior.MultiSort = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsSelection.CellSelect = False
    OptionsView.BandLineCount = 2
    OptionsView.ColumnAutoWidth = True
    OptionsView.GridLines = tlglBoth
    OptionsView.UseNodeColorForIndent = False
    RootValue = 0
    TabOrder = 0
    object cxDBTreeList1KOD: TcxDBTreeListColumn
      DataBinding.FieldName = 'KOD'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 59
    end
    object cxDBTreeList1NOMN: TcxDBTreeListColumn
      DataBinding.FieldName = 'NOMN'
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 51
    end
    object cxDBTreeList1NAME: TcxDBTreeListColumn
      Caption.Text = #1053#1072#1079#1074#1072
      DataBinding.FieldName = 'NAME'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
      Width = 415
    end
    object cxDBTreeList1SCH: TcxDBTreeListColumn
      Caption.Text = #1056#1072#1093#1091#1085#1086#1082
      DataBinding.FieldName = 'SCH_NUMBER'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 117
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 221
    Width = 417
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 160
      Top = 4
      Width = 105
      Height = 30
      Action = acOk
      Caption = #1054#1073#1088#1072#1090#1080
      ModalResult = 1
      TabOrder = 0
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0066001EB2311FB133006600FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565659A9A9A9A9A9A65
        6565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00660031C24F22B7381AB02D21B437006600FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565ABABAB9E9E9E9797979C
        9C9C656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        00660047D36D3BCB5E25A83B0066001BA92E1DB132006600FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF656565BFBFBFB5B5B598989865656594
        9494999999656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600
        4FD67953DE7F31B54D006600FF00FF006600179D271EAE31006600FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF656565C4C4C4CACACAA5A5A5656565FF00FF65
        65658C8C8C989898656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        00660041C563006600FF00FFFF00FFFF00FFFF00FF00660019AA2B006600FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF656565B5B5B5656565FF00FFFF00FFFF
        00FFFF00FF656565939393656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600149D210066
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF6565658A8A8A656565FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066
        00006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 8
    Top = 432
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      Color = clBtnFace
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
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
  object ActionList1: TActionList
    Left = 352
    Top = 224
    object acOk: TAction
      Caption = #1054#1073#1088#1072#1090#1080
      OnExecute = acOkExecute
    end
  end
  object AddInGroupDataSet: TpFIBDataSet
    Database = SpNomForm.SpNomDatabase
    Transaction = SpNomForm.ReadTransaction
    UpdateTransaction = SpNomForm.WriteTransaction
    SelectSQL.Strings = (
      'SELECT DISTINCT N.*, '
      '   S.SCH_NUMBER||'#39' '#39'||S.SCH_TITLE as NAME_SCH,'
      '   S.SCH_NUMBER'
      ' FROM MAT_SP_NOM_BASE N '
      ' LEFT OUTER JOIN PUB_SP_MAIN_SCH S '
      
        ' ON N.ID_SCH=S.ID_SCH AND CURRENT_DATE BETWEEN S.DATE_BEG AND S.' +
        'DATE_END'
      ' WHERE TIP=0  '
      ''
      ''
      '')
    Left = 16
    Top = 32
    poSQLINT64ToBCD = True
    object AddInGroupDataSetLINKTO: TFIBBCDField
      FieldName = 'LINKTO'
      Size = 0
      RoundByScale = True
    end
    object AddInGroupDataSetNOMN: TFIBStringField
      FieldName = 'NOMN'
      EmptyStrToNull = True
    end
    object AddInGroupDataSetNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object AddInGroupDataSetID_UNIT: TFIBBCDField
      FieldName = 'ID_UNIT'
      Size = 0
      RoundByScale = True
    end
    object AddInGroupDataSetPRICE: TFIBBCDField
      FieldName = 'PRICE'
      Size = 4
      RoundByScale = True
    end
    object AddInGroupDataSetTIP: TFIBBooleanField
      FieldName = 'TIP'
    end
    object AddInGroupDataSetID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object AddInGroupDataSetNAME_SCH: TFIBStringField
      FieldName = 'NAME_SCH'
      Size = 91
      EmptyStrToNull = True
    end
    object AddInGroupDataSetID_NOMN: TFIBBCDField
      FieldName = 'ID_NOMN'
      Size = 0
      RoundByScale = True
    end
    object AddInGroupDataSetSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object AddInGroupDataSetNTYPE: TFIBSmallIntField
      FieldName = 'NTYPE'
    end
    object AddInGroupDataSetKOD: TFIBStringField
      FieldName = 'KOD'
      Size = 5
      EmptyStrToNull = True
    end
  end
  object AddInGroupDataSource: TDataSource
    DataSet = AddInGroupDataSet
    Left = 48
    Top = 34
  end
  object ProverkaDataSet: TpFIBDataSet
    Database = SpNomForm.SpNomDatabase
    Transaction = SpNomForm.ReadTransaction
    UpdateTransaction = SpNomForm.WriteTransaction
    Left = 16
    Top = 64
    poSQLINT64ToBCD = True
  end
end
