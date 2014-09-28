inherited FormEditDopDoc: TFormEditDopDoc
  Left = 336
  Top = 208
  Caption = 'FormEditDopDoc'
  ClientHeight = 391
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ImageSpravEdit: TImage
    Height = 391
  end
  inherited cxButtonOK: TcxButton
    Left = 123
    Top = 344
    TabOrder = 16
  end
  inherited cxButtonCansel: TcxButton
    Top = 344
    TabOrder = 17
  end
  inherited cxLabelFormCaption: TcxLabel
    Caption = ' '#1044#1086#1076#1072#1090#1080
  end
  inherited cxLabelTypeDoc: TcxLabel
    Top = 28
  end
  inherited cxButtonEditTypeDoc: TcxButtonEdit
    Top = 51
  end
  inherited cxLabelTypeUchz: TcxLabel
    Left = 32
    Top = 402
    Enabled = False
    TabOrder = 22
  end
  inherited cxButtonEditTypeUchz: TcxButtonEdit
    Left = 42
    Top = 397
    Enabled = False
    TabOrder = 18
  end
  inherited cxLabelAdressUchz: TcxLabel
    Left = 40
    Top = 401
    Enabled = False
    TabOrder = 21
  end
  inherited cxButtonEditAdressUchz: TcxButtonEdit
    Top = 403
    Enabled = False
    TabOrder = 26
  end
  inherited cxCheckBoxIS_MAIN_BOOK: TcxCheckBox
    Left = 74
    Top = 402
    Enabled = False
    TabOrder = 24
  end
  inherited cxLabelIS_MAIN_BOOK: TcxLabel
    Left = 102
    Top = 406
    Enabled = False
    TabOrder = 28
  end
  inherited cxLabelIS_COPY: TcxLabel
    Top = 263
    TabOrder = 14
  end
  inherited cxLookupComboBoxCopy: TcxLookupComboBox
    Top = 285
    Properties.IncrementalFiltering = False
    TabOrder = 15
  end
  inherited cxLabelUCHZ: TcxLabel
    Left = 32
    Top = 407
    Enabled = False
    TabOrder = 29
  end
  inherited cxButtonEditUCHZ: TcxButtonEdit
    Left = 34
    Top = 402
    Enabled = False
    TabOrder = 23
  end
  inherited cxCheckBoxIS_ACTIVE: TcxCheckBox
    Left = 74
    Top = 398
    Enabled = False
    TabOrder = 19
  end
  inherited cxLabelIS_ACTIVE: TcxLabel
    Left = 110
    Top = 399
    Enabled = False
    TabOrder = 20
  end
  object cxLabelName: TcxLabel [25]
    Left = 16
    Top = 158
    Width = 274
    Height = 19
    AutoSize = False
    ParentFont = False
    Properties.LabelStyle = cxlsRaised
    Properties.ShadowedColor = clBtnShadow
    Properties.Transparent = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    TabOrder = 10
  end
  object cxTextEditName: TcxTextEdit [26]
    Left = 26
    Top = 183
    Width = 290
    Height = 24
    Cursor = crIBeam
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Vert = taVCenter
    Properties.MaxLength = 100
    Style.BorderStyle = ebs3D
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.Shadow = True
    TabOrder = 11
    Text = 'cxTextEditName'
    DragCursor = crIBeam
  end
  object cxLabelOcenka: TcxLabel [27]
    Left = 16
    Top = 212
    Width = 274
    Height = 19
    AutoSize = False
    ParentFont = False
    Properties.LabelStyle = cxlsRaised
    Properties.ShadowedColor = clBtnShadow
    Properties.Transparent = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.Shadow = False
    TabOrder = 12
  end
  inherited cxLabelOTR_SPEC: TcxLabel
    Left = 24
    Top = 403
    Enabled = False
    TabOrder = 25
  end
  inherited cxTextEditOTR_SPEC: TcxTextEdit
    Left = 34
    Top = 403
    Enabled = False
    TabOrder = 27
  end
  object cxLookupComboBoxOcenka: TcxLookupComboBox [30]
    Left = 25
    Top = 234
    Width = 290
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.GridMode = True
    Properties.IncrementalFiltering = False
    Properties.KeyFieldNames = 'ID_SP_OCENKA'
    Properties.ListColumns = <
      item
        SortOrder = soAscending
        FieldName = 'OCENKA_NUM'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSourceOcenka
    Style.Color = 16776176
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 13
  end
  inherited ActionListKlassSpravEdit: TActionList
    Top = 322
  end
  inherited DataSetCopy: TpFIBDataSet
    Top = 274
  end
  inherited DataSourceCopy: TDataSource
    Top = 274
  end
  object DataSetOcenka: TpFIBDataSet
    Left = 160
    Top = 232
    poSQLINT64ToBCD = True
  end
  object DataSourceOcenka: TDataSource
    DataSet = DataSetOcenka
    Left = 200
    Top = 232
  end
end
