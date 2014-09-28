object FrameVstup: TFrameVstup
  Left = 0
  Top = 0
  Width = 588
  Height = 304
  TabOrder = 0
  object cxGroupBoxVstup: TcxGroupBox
    Left = 7
    Top = 3
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
    Left = 303
    Top = 13
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
    Left = 303
    Top = 54
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
    Left = 303
    Top = 97
    Width = 249
    Height = 17
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
    Left = 312
    Top = 33
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
    Left = 312
    Top = 72
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
    Left = 312
    Top = 116
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
    Left = 23
    Top = 32
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
    Left = 22
    Top = 73
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
    Left = 21
    Top = 116
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
    Left = 22
    Top = 158
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
    Left = 22
    Top = 202
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
    Left = 308
    Top = 183
    Width = 241
    Height = 17
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
    Left = 303
    Top = 139
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
  end
  object cxLookupComboBoxVid_Dii: TcxLookupComboBox
    Left = 312
    Top = 158
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
  end
  object cxLookupComboBoxNpk: TcxLookupComboBox
    Left = 311
    Top = 202
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
    Left = 303
    Top = 229
    Width = 193
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
    Left = 314
    Top = 247
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
    Left = 15
    Top = 245
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
    Left = 92
    Top = 264
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
    Left = 22
    Top = 262
    Width = 72
    Height = 24
    AutoSize = False
    ParentColor = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    TabOrder = 20
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
    DataSource = DataSourceTypeDepart
    Left = 125
    Top = 64
    poSQLINT64ToBCD = True
  end
  object DataSourceKatStud: TDataSource
    DataSet = DataSetKatStud
    Left = 157
    Top = 63
  end
  object DataSetFacul: TpFIBDataSet
    DataSource = DataSourceKatStud
    Left = 124
    Top = 103
    poSQLINT64ToBCD = True
  end
  object DataSourceFacul: TDataSource
    DataSet = DataSetFacul
    Left = 156
    Top = 103
  end
  object DataSetSpec: TpFIBDataSet
    DataSource = DataSourceFacul
    Left = 124
    Top = 145
    poSQLINT64ToBCD = True
  end
  object DataSourceSpec: TDataSource
    DataSet = DataSetSpec
    Left = 155
    Top = 145
  end
  object DataSetFormStudy: TpFIBDataSet
    DataSource = DataSourceSpec
    Left = 124
    Top = 189
    poSQLINT64ToBCD = True
  end
  object DataSourceFormStudy: TDataSource
    DataSet = DataSetFormStudy
    Left = 156
    Top = 189
  end
  object DataSetDergZakaz: TpFIBDataSet
    DataSource = DataSourceFormStudy
    Left = 428
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DataSourceDergZakaz: TDataSource
    DataSet = DataSetDergZakaz
    Left = 460
    Top = 16
  end
  object DataSetKurs: TpFIBDataSet
    DataSource = DataSourceFormStudy
    Left = 428
    Top = 56
    poSQLINT64ToBCD = True
  end
  object DataSourceKurs: TDataSource
    DataSet = DataSetKurs
    Left = 460
    Top = 56
  end
  object DataSetSrokOb: TpFIBDataSet
    DataSource = DataSourceFormStudy
    Left = 428
    Top = 96
    poSQLINT64ToBCD = True
  end
  object DataSourceSrokOb: TDataSource
    DataSet = DataSetSrokOb
    Left = 460
    Top = 96
  end
  object DataSetVid_Dii: TpFIBDataSet
    DataSource = DataSourceFormStudy
    Left = 428
    Top = 140
    poSQLINT64ToBCD = True
  end
  object DataSourceVid_Dii: TDataSource
    DataSet = DataSetVid_Dii
    Left = 460
    Top = 140
  end
  object DataSetNpk: TpFIBDataSet
    DataSource = DataSourceFormStudy
    Left = 428
    Top = 186
    poSQLINT64ToBCD = True
  end
  object DataSourceNpk: TDataSource
    DataSet = DataSetNpk
    Left = 460
    Top = 185
  end
  object DataSetNomerDela: TpFIBDataSet
    Left = 132
    Top = 262
    poSQLINT64ToBCD = True
  end
end
