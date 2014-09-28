object FrameVstup: TFrameVstup
  Left = 0
  Top = 0
  Width = 546
  Height = 272
  TabOrder = 0
  object cxGroupBoxVstup: TcxGroupBox
    Left = -1
    Top = -3
    Width = 273
    Height = 238
    Alignment = alTopLeft
    Color = clBtnFace
    ParentColor = False
    ParentCtl3D = False
    TabOrder = 12
    TabStop = False
    Ctl3D = True
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
    object cxLabelFacul: TcxLabel
      Left = 6
      Top = 93
      Width = 250
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object cxLabelSpec: TcxLabel
      Left = 7
      Top = 136
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
    object cxLabelFormStudy: TcxLabel
      Left = 7
      Top = 180
      Width = 249
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object cxLabelKatStud: TcxLabel
      Left = 7
      Top = 51
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
  end
  object cxLabelDergZakaz: TcxLabel
    Left = 295
    Top = -1
    Width = 249
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 13
  end
  object cxLabelKurs: TcxLabel
    Left = 295
    Top = 40
    Width = 249
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 14
  end
  object cxLabelSrokOb: TcxLabel
    Left = 297
    Top = 76
    Width = 249
    Height = 20
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 15
  end
  object cxLookupComboBoxDergZakaz: TcxLookupComboBox
    Left = 304
    Top = 19
    Width = 240
    Height = 21
    AutoSize = False
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
    TabOrder = 5
  end
  object cxLookupComboBoxKurs: TcxLookupComboBox
    Left = 304
    Top = 58
    Width = 241
    Height = 21
    Properties.GridMode = True
    Properties.KeyFieldNames = 'ID_SP_KURS'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSourceKurs
    Properties.ReadOnly = False
    TabOrder = 6
  end
  object cxLookupComboBoxSrokOb: TcxLookupComboBox
    Left = 304
    Top = 95
    Width = 241
    Height = 21
    AutoSize = False
    Properties.GridMode = True
    Properties.KeyFieldNames = 'ID_SP_SROK_OB'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSourceSrokOb
    TabOrder = 7
  end
  object cxLookupComboBoxTypeDepart: TcxLookupComboBox
    Left = 15
    Top = 26
    Width = 241
    Height = 21
    Properties.GridMode = True
    Properties.KeyFieldNames = 'ID_FAK_CENTER'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSourceTypeDepart
    Properties.OnChange = cxLookupComboBoxTypeDepartPropertiesChange
    TabOrder = 0
  end
  object cxLookupComboBoxKatStud: TcxLookupComboBox
    Left = 14
    Top = 67
    Width = 241
    Height = 21
    Properties.GridMode = True
    Properties.KeyFieldNames = 'ID_CN_SP_KAT_STUD'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSourceKatStud
    Properties.OnChange = cxLookupComboBoxKatStudPropertiesChange
    TabOrder = 1
  end
  object cxLookupComboBoxFacul: TcxLookupComboBox
    Left = 13
    Top = 110
    Width = 241
    Height = 21
    Properties.GridMode = True
    Properties.KeyFieldNames = 'ID_CN_SP_FAK'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSourceFacul
    Properties.OnChange = cxLookupComboBoxFaculPropertiesChange
    TabOrder = 2
  end
  object cxLookupComboBoxSpec: TcxLookupComboBox
    Left = 14
    Top = 152
    Width = 241
    Height = 21
    Properties.GridMode = True
    Properties.KeyFieldNames = 'ID_CN_JN_FACUL_SPEC'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSourceSpec
    Properties.OnChange = cxLookupComboBoxSpecPropertiesChange
    TabOrder = 3
  end
  object cxLookupComboBoxFormStudy: TcxLookupComboBox
    Left = 14
    Top = 196
    Width = 241
    Height = 21
    Properties.GridMode = True
    Properties.KeyFieldNames = 'ID_CN_SP_FORM_STUD'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSourceFormStudy
    Properties.OnChange = cxLookupComboBoxFormStudyPropertiesChange
    TabOrder = 4
  end
  object cxLabelNpk: TcxLabel
    Left = 297
    Top = 116
    Width = 241
    Height = 20
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 16
  end
  object cxLabelVid_Dii: TcxLabel
    Left = 279
    Top = 221
    Width = 193
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 17
    Visible = False
  end
  object cxLookupComboBoxVid_Dii: TcxLookupComboBox
    Left = 288
    Top = 240
    Width = 241
    Height = 21
    AutoSize = False
    Properties.GridMode = True
    Properties.KeyFieldNames = 'ID_SP_VID_DII'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSourceVid_Dii
    TabOrder = 8
    Visible = False
  end
  object cxLookupComboBoxNpk: TcxLookupComboBox
    Left = 304
    Top = 133
    Width = 241
    Height = 21
    AutoSize = False
    Properties.GridMode = True
    Properties.KeyFieldNames = 'ID_SP_NPK'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSourceNpk
    TabOrder = 9
  end
  object cxLabelPotok: TcxLabel
    Left = 297
    Top = 154
    Width = 196
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 18
  end
  object cxButtonEditPotok: TcxButtonEdit
    Left = 305
    Top = 171
    Width = 241
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxButtonEditPotokPropertiesButtonClick
    TabOrder = 10
    Text = 'cxButtonEditPotok'
    OnKeyPress = cxButtonEditPotokKeyPress
  end
  object cxLabelNomerDela: TcxLabel
    Left = 295
    Top = 232
    Width = 119
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 19
  end
  object cxTextEditNomerDela: TcxTextEdit
    Left = 372
    Top = 250
    Width = 86
    Height = 21
    ParentFont = False
    Properties.MaxLength = 7
    Style.Color = 16776176
    TabOrder = 11
    Text = 'cxTextEditNomerDela'
    OnKeyPress = cxTextEditNomerDelaKeyPress
  end
  object cxLabelNomerDela_Pristavka: TcxLabel
    Left = 302
    Top = 248
    Width = 72
    Height = 24
    AutoSize = False
    ParentColor = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    TabOrder = 20
  end
  object cxButtonEditTypePerekl: TcxButtonEdit
    Left = 305
    Top = 211
    Width = 241
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxButtonEditTypePereklPropertiesButtonClick
    TabOrder = 21
    Text = 'cxButtonEditTypePerekl'
    OnKeyPress = cxButtonEditTypePereklKeyPress
  end
  object cxLabeTypePerekl: TcxLabel
    Left = 297
    Top = 194
    Width = 196
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 22
    Caption = 'cxLabeTypePerekl'
  end
  object cxDateEditDatePerekl: TcxDateEdit
    Left = 133
    Top = 250
    Width = 121
    Height = 21
    TabOrder = 23
  end
  object cxLabelDatePerekl: TcxLabel
    Left = 6
    Top = 248
    Width = 123
    Height = 24
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 24
  end
  object DataSetTypeDepart: TpFIBDataSet
    Left = 116
    Top = 10
    poSQLINT64ToBCD = True
  end
  object DataSourceTypeDepart: TDataSource
    DataSet = DataSetTypeDepart
    Left = 147
    Top = 10
  end
  object DataSetKatStud: TpFIBDataSet
    DataSource = DataSourceTypeDepart
    Left = 117
    Top = 58
    poSQLINT64ToBCD = True
  end
  object DataSourceKatStud: TDataSource
    DataSet = DataSetKatStud
    Left = 149
    Top = 57
  end
  object DataSetFacul: TpFIBDataSet
    DataSource = DataSourceKatStud
    Left = 116
    Top = 97
    poSQLINT64ToBCD = True
  end
  object DataSourceFacul: TDataSource
    DataSet = DataSetFacul
    Left = 148
    Top = 97
  end
  object DataSetSpec: TpFIBDataSet
    DataSource = DataSourceFacul
    Left = 116
    Top = 139
    poSQLINT64ToBCD = True
  end
  object DataSourceSpec: TDataSource
    DataSet = DataSetSpec
    Left = 147
    Top = 139
  end
  object DataSetFormStudy: TpFIBDataSet
    DataSource = DataSourceSpec
    Left = 116
    Top = 183
    poSQLINT64ToBCD = True
  end
  object DataSourceFormStudy: TDataSource
    DataSet = DataSetFormStudy
    Left = 148
    Top = 183
  end
  object DataSetDergZakaz: TpFIBDataSet
    DataSource = DataSourceFormStudy
    Left = 420
    Top = 2
    poSQLINT64ToBCD = True
  end
  object DataSourceDergZakaz: TDataSource
    DataSet = DataSetDergZakaz
    Left = 452
    Top = 2
  end
  object DataSetKurs: TpFIBDataSet
    DataSource = DataSourceFormStudy
    Left = 420
    Top = 42
    poSQLINT64ToBCD = True
  end
  object DataSourceKurs: TDataSource
    DataSet = DataSetKurs
    Left = 452
    Top = 42
  end
  object DataSetSrokOb: TpFIBDataSet
    DataSource = DataSourceFormStudy
    Left = 422
    Top = 75
    poSQLINT64ToBCD = True
  end
  object DataSourceSrokOb: TDataSource
    DataSet = DataSetSrokOb
    Left = 454
    Top = 75
  end
  object DataSetVid_Dii: TpFIBDataSet
    DataSource = DataSourceFormStudy
    Left = 404
    Top = 222
    poSQLINT64ToBCD = True
  end
  object DataSourceVid_Dii: TDataSource
    DataSet = DataSetVid_Dii
    Left = 436
    Top = 222
  end
  object DataSetNpk: TpFIBDataSet
    DataSource = DataSourceFormStudy
    Left = 422
    Top = 117
    poSQLINT64ToBCD = True
  end
  object DataSourceNpk: TDataSource
    DataSet = DataSetNpk
    Left = 454
    Top = 116
  end
  object DataSetNomerDela: TpFIBDataSet
    Left = 412
    Top = 240
    poSQLINT64ToBCD = True
  end
end
