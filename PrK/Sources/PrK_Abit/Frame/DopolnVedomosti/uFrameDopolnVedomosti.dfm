object FrameDopolnVedomosti: TFrameDopolnVedomosti
  Left = 0
  Top = 0
  Width = 522
  Height = 302
  TabOrder = 0
  object cxLabelCel_Zamovnik: TcxLabel
    Left = 16
    Top = 7
    Width = 209
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
  object cxButtonEditCel_Zamovnik: TcxButtonEdit
    Left = 26
    Top = 27
    Width = 337
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxButtonEditCel_ZamovnikPropertiesButtonClick
    TabOrder = 1
    Text = 'cxButtonEditCel_Zamovnik'
    OnKeyPress = cxButtonEditCel_ZamovnikKeyPress
  end
  object cxLabelUkr_Lang: TcxLabel
    Left = 283
    Top = 58
    Width = 193
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
  object cxButtonEditUkr_Lang: TcxButtonEdit
    Left = 293
    Top = 78
    Width = 201
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditUkr_LangPropertiesButtonClick
    TabOrder = 5
    Text = 'cxButtonEditUkr_Lang'
    OnKeyPress = cxButtonEditCel_ZamovnikKeyPress
  end
  object cxLabelGurtog: TcxLabel
    Left = 16
    Top = 58
    Width = 193
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
  object cxButtonEditGurtog: TcxButtonEdit
    Left = 26
    Top = 78
    Width = 201
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditGurtogPropertiesButtonClick
    TabOrder = 4
    Text = 'cxButtonEditGurtog'
    OnKeyPress = cxButtonEditCel_ZamovnikKeyPress
  end
  object cxLabelCn_National: TcxLabel
    Left = 16
    Top = 102
    Width = 193
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
  object cxButtonEditCn_National: TcxButtonEdit
    Left = 25
    Top = 123
    Width = 201
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditCn_NationalPropertiesButtonClick
    TabOrder = 8
    Text = 'cxButtonEditCn_National'
    OnKeyPress = cxButtonEditCel_ZamovnikKeyPress
  end
  object cxCheckBoxIS_SB_OTKAZ: TcxCheckBox
    Left = 16
    Top = 151
    Width = 31
    Height = 21
    Cursor = crHandPoint
    ParentColor = False
    Properties.Alignment = taCenter
    Properties.DisplayUnchecked = 'False'
    Style.Color = 16776176
    TabOrder = 10
  end
  object cxLabelIS_SB_OTKAZ: TcxLabel
    Left = 53
    Top = 153
    Width = 210
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 11
  end
  object cxDateEditDateBeg: TcxDateEdit
    Left = 295
    Top = 174
    Width = 137
    Height = 21
    Style.Color = 16776176
    TabOrder = 13
  end
  object cxLabelDateBegObuch: TcxLabel
    Left = 285
    Top = 153
    Width = 158
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
  object cxDBTextEditKat_Pri_D: TcxDBTextEdit
    Left = 294
    Top = 203
    Width = 201
    Height = 21
    AutoSize = False
    Enabled = False
    TabOrder = 14
  end
  object cxLabelVID_DOG: TcxLabel
    Left = 283
    Top = 102
    Width = 193
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
  end
  object cxButtonEditVID_DOG: TcxButtonEdit
    Left = 293
    Top = 123
    Width = 201
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = False
    Properties.OnButtonClick = cxButtonEditVID_DOGPropertiesButtonClick
    TabOrder = 9
    Text = 'cxButtonEditVID_DOG'
    OnKeyPress = cxButtonEditCel_ZamovnikKeyPress
  end
  object RxMemoryDataCanUpdateDopolnVedomosti: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ID_CN_SP_FAK'
        DataType = ftVariant
      end
      item
        Name = 'ID_CN_JN_FACUL_SPEC'
        DataType = ftVariant
      end
      item
        Name = 'ID_CN_SP_FORM_STUD'
        DataType = ftVariant
      end
      item
        Name = 'ID_CN_SP_KAT_STUD'
        DataType = ftVariant
      end
      item
        Name = 'ID_FAK_CENTER'
        DataType = ftVariant
      end>
    Left = 208
    Top = 19
  end
end
