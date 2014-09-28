object FormPrK_Show_Reports: TFormPrK_Show_Reports
  Left = 271
  Top = 220
  BorderStyle = bsDialog
  Caption = 'FormPrK_Show_Reports'
  ClientHeight = 276
  ClientWidth = 561
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabelTypeDepart: TcxLabel
    Left = 7
    Top = 10
    Width = 249
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
  end
  object cxLookupComboBoxTypeDepart: TcxLookupComboBox
    Left = 23
    Top = 31
    Width = 241
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.GridMode = True
    Properties.KeyFieldNames = 'ID_FAK_CENTER'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSourceTypeDepart
    Properties.ReadOnly = False
    Style.StyleController = cxEditStyleControllerPrK
    TabOrder = 1
  end
  object cxLabelKatStud: TcxLabel
    Left = 7
    Top = 101
    Width = 249
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object cxLookupComboBoxKatStud: TcxLookupComboBox
    Left = 22
    Top = 120
    Width = 241
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.GridMode = True
    Properties.KeyFieldNames = 'ID_CN_SP_KAT_STUD'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSourceKatStud
    Style.StyleController = cxEditStyleControllerPrK
    TabOrder = 3
  end
  object cxLabelFormStudy: TcxLabel
    Left = 7
    Top = 148
    Width = 249
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
  end
  object cxLookupComboBoxFormStudy: TcxLookupComboBox
    Left = 22
    Top = 170
    Width = 241
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.GridMode = True
    Properties.KeyFieldNames = 'ID_CN_SP_FORM_STUD'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSourceFormStudy
    Style.StyleController = cxEditStyleControllerPrK
    TabOrder = 5
  end
  object cxLabelDergZakaz: TcxLabel
    Left = 303
    Top = 10
    Width = 249
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
  end
  object cxLookupComboBoxDergZakaz: TcxLookupComboBox
    Left = 312
    Top = 31
    Width = 240
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.GridMode = True
    Properties.KeyFieldNames = 'ID_SP_DERG_ZAKAZ'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.CaseInsensitive = True
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSourceDergZakaz
    Properties.ReadOnly = False
    Style.StyleController = cxEditStyleControllerPrK
    TabOrder = 7
  end
  object cxLabelPotok: TcxLabel
    Left = 303
    Top = 101
    Width = 242
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 8
  end
  object cxLookupComboBoxPotok: TcxLookupComboBox
    Left = 312
    Top = 120
    Width = 241
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.GridMode = True
    Properties.KeyFieldNames = 'id_sp_potok'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSourcePotok
    Style.StyleController = cxEditStyleControllerPrK
    TabOrder = 9
  end
  object cxLabelTYP_KT_STD: TcxLabel
    Left = 7
    Top = 55
    Width = 249
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 10
  end
  object cxLookupComboBoxTYP_KT_STD: TcxLookupComboBox
    Left = 22
    Top = 73
    Width = 241
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.GridMode = True
    Properties.KeyFieldNames = 'id_sp_type_kat_stud'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSourceTYP_KT_STD
    Style.StyleController = cxEditStyleControllerPrK
    TabOrder = 11
  end
  object cxLabelFRM_OB_KAT: TcxLabel
    Left = 303
    Top = 55
    Width = 249
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 12
  end
  object cxLookupComboBoxFRM_OB_KAT: TcxLookupComboBox
    Left = 312
    Top = 73
    Width = 241
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.GridMode = True
    Properties.KeyFieldNames = 'id_sp_form_obuch_kategory'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSourceFRM_OB_KAT
    Properties.ReadOnly = False
    Style.StyleController = cxEditStyleControllerPrK
    TabOrder = 13
  end
  object cxGroupBoxGodNAb: TcxGroupBox
    Left = 16
    Top = 200
    Width = 249
    Height = 73
    Alignment = alTopLeft
    TabOrder = 14
    Visible = False
    object cxRadioButtonThisGodNab: TcxRadioButton
      Left = 16
      Top = 16
      Width = 169
      Height = 17
      Caption = 'cxRadioButtonThisGodNab'
      TabOrder = 0
      OnClick = cxRadioButtonThisGodNabClick
    end
    object cxRadioButtonNotThisGodNab: TcxRadioButton
      Left = 16
      Top = 40
      Width = 177
      Height = 17
      Caption = 'cxRadioButtonNotThisGodNab'
      TabOrder = 1
      OnClick = cxRadioButtonNotThisGodNabClick
    end
  end
  object cxButtonOK: TcxButton
    Left = 351
    Top = 238
    Width = 97
    Height = 27
    Cursor = crHandPoint
    Action = ActionOK
    DragCursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000000000084830000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00000000000084830000FFFE000084830000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000000000FFFE0000FFFE0000FFFE0000FFFE00008483000000
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF000000000000FFFE0000FFFE00848484008484840000FFFE0000FFFE000084
      830000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF008484840000FFFE0084848400FF00FF00FF00FF008484840000FFFE0000FF
      FE000084830000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0084848400FF00FF00FF00FF00FF00FF00FF00FF008484840000FF
      FE0000FFFE000084830000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
      840000FFFE0000FFFE000084830000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF008484840000FFFE0000FFFE0000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF008484840000FFFE0000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
  end
  object cxButtonCansel: TcxButton
    Left = 456
    Top = 238
    Width = 97
    Height = 27
    Cursor = crHandPoint
    Action = ActionCansel
    DragCursor = crHandPoint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00000084000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0000008400000084000000840084848400FF00FF00FF00FF00FF00FF00FF00
      FF00000084000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000008400000084000000840084848400FF00FF00FF00FF000000
      84000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000008400000084000000840084848400000084000000
      840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000084000000840000008400000084000000
      8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00000084000000FF00000084008484
      8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000084000000840000008400000084000000
      840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00000084000000840000008400FF00FF00000084000000
      84000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00000084000000840000008400FF00FF00FF00FF00FF00FF000000
      8400000084000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00000084000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00000084000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
  end
  object cxEditStyleControllerPrK: TcxEditStyleController
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Left = 397
    Top = 157
  end
  object DataBasePrK: TpFIBDatabase
    DefaultTransaction = TransactionReadPrK
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 307
    Top = 158
  end
  object TransactionReadPrK: TpFIBTransaction
    DefaultDatabase = DataBasePrK
    TimeoutAction = TARollback
    Left = 336
    Top = 158
  end
  object TransactionWritePrK: TpFIBTransaction
    DefaultDatabase = DataBasePrK
    TimeoutAction = TARollback
    Left = 365
    Top = 158
  end
  object DataSetPrKStat_Reports: TpFIBDataSet
    Database = DataBasePrK
    Transaction = TransactionReadPrK
    Left = 430
    Top = 156
    poSQLINT64ToBCD = True
  end
  object DataSetTypeDepart: TpFIBDataSet
    Left = 124
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DataSourceTypeDepart: TDataSource
    DataSet = DataSetTypeDepart
    Left = 155
    Top = 16
  end
  object DataSetKatStud: TpFIBDataSet
    Left = 125
    Top = 110
    poSQLINT64ToBCD = True
  end
  object DataSourceKatStud: TDataSource
    DataSet = DataSetKatStud
    Left = 157
    Top = 109
  end
  object DataSetFormStudy: TpFIBDataSet
    Left = 124
    Top = 157
    poSQLINT64ToBCD = True
  end
  object DataSourceFormStudy: TDataSource
    DataSet = DataSetFormStudy
    Left = 156
    Top = 157
  end
  object DataSetDergZakaz: TpFIBDataSet
    Left = 428
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DataSourceDergZakaz: TDataSource
    DataSet = DataSetDergZakaz
    Left = 460
    Top = 16
  end
  object DataSourcePotok: TDataSource
    DataSet = DataSetPotok
    Left = 460
    Top = 113
  end
  object DataSetPotok: TpFIBDataSet
    Left = 428
    Top = 114
    poSQLINT64ToBCD = True
  end
  object DataSetTYP_KT_STD: TpFIBDataSet
    Left = 124
    Top = 69
    poSQLINT64ToBCD = True
  end
  object DataSourceTYP_KT_STD: TDataSource
    DataSet = DataSetTYP_KT_STD
    Left = 156
    Top = 69
  end
  object DataSetFRM_OB_KAT: TpFIBDataSet
    Left = 428
    Top = 56
    poSQLINT64ToBCD = True
  end
  object DataSourceFRM_OB_KAT: TDataSource
    DataSet = DataSetFRM_OB_KAT
    Left = 460
    Top = 56
  end
  object ActionListKlassSpravEdit: TActionList
    Left = 288
    Top = 208
    object ActionOK: TAction
      Caption = 'ActionOK'
      ImageIndex = 0
      ShortCut = 121
      OnExecute = ActionOKExecute
    end
    object ActionCansel: TAction
      Caption = 'ActionCansel'
      ImageIndex = 1
      ShortCut = 27
      OnExecute = ActionCanselExecute
    end
  end
end
